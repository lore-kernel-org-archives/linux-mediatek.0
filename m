Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FD5606A321
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 23:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o93PvIW4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xWXjR4wK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Fu1JR9BwCRRgF7zql9PraHs0kE4B88Qxih1JN4hThMw=; b=o93PvIW4BQboZlcrD0jbwtKxMm
	wD5HFUJGlCudCuOBieRFuPFhPXXd1i12aY2BLEr+4ofUL28Xt4p8drGmfUs+slBeIIH63EkhMNdSh
	r4lSQ1PenhmXHcS83zwYWHp5plOZpDFj88M5jensAMDgNosDxip+AwtyYXxOuXH2X6e07gBxDdHab
	/oNv5GjlZE83+m6LA86Afg9vT8s22tSLADAFjV2ktcvyIS/Ed2F8L3vVcp9Bor1nJCJtGNrn71fEw
	m7SmKKtFqEDoDY1QLxE9IMHNsRe+aCPcu6I7sc43+kKun+zbWIoCcwEXNle+91tzaruJmOh12lz7+
	5uvrKBXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzh6-000000083av-28UI;
	Tue, 24 Nov 2026 23:13:00 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzh3-000000083a9-2e3u
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Nov 2026 23:12:59 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso49089235e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Nov 2026 15:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795561976; x=1796166776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fu1JR9BwCRRgF7zql9PraHs0kE4B88Qxih1JN4hThMw=;
        b=xWXjR4wKELDZMnqSJFTNC1IinH1LfzI8C35YuBWSt0vMnMdW4RF1JGxnTC+wxMDRlE
         3r17Kfy9/+nmkpjmHHjQaMOFt4WZU8GmvUAa2HlkiZ8aQorQfZD4cAdjuGQvJlMOZFAW
         B3yEENlkNychFi21AYq6m6NvmNUWiCxkXwyr7rqJJB5pXEPswav0ZHe2ZbeOfUeTf3CK
         SCL+otBOqkPpsPJzMIfT/oyyKLvepKpPluojVIkWcDsS4xSOEwkjmnOYFJqrngEtyncc
         I7sqp5QgMaAqjo3AzfeKDoW+RQ0D04zliROnFvcSu6a35962dZL/RWEWQWMmW64Yt0Z+
         XkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795561976; x=1796166776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fu1JR9BwCRRgF7zql9PraHs0kE4B88Qxih1JN4hThMw=;
        b=CuYMyFuIQG2JEziVKIQClomH42Zt14GlpPda/mo6uqJ8tFQUZn+G9dEFSK0XzgLvVn
         Y4TfToAnCyI6x7PDSl0tOKQXZbOe7KI5cUD7JFSNnee5H34V3KAN4pT0w/LHIjvIPvcE
         z3+dR2CD/+EvISD0X1BIBO2EmvZBvTzeHwsoesnVc5ySDV882scqhr1J5TlXne1ewPhG
         HSG0WpKEI9wGNhMq+ixRLtxYV97D9S0Pgix9nw3fpnHSZYphs2Im0BDztHZwL9j5Xy0m
         WpJ/ttCM+O+73JcTfvc7qY21oMiqp7igsRm1EeZlgPaHK1M7Jr2Z4VAhbF6njf+9Y76h
         7SLA==
X-Forwarded-Encrypted: i=1; AL+hErEuLlBTmeBX5ZhpUy0sgpw8GLfysZS6j4cQg5k2GikIArNeI+Tzm/WHAaD6t0VnymkXTJJQupuOUH8i9ddUGw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9HaJu4lfl7bBfKVCW8HW8ESa2S/BWZHDNwUUYWGIRmGYqfFxDP
	B/Mmstk8uxP64yl5YCxAhSIJRMhqKs6fg6ErhqkyaSS7B4KxtgijlI3X
X-Gm-Gg: AZFdTZcVRwKOWr0tOsoOg2+FdhDwaqa/G+TqY4yJjvhEaCa/vg6zb5wJA9noZ+Vln6W
	yzjipIVIFepgn4rzvz41M8I5x7df+jUfG6eQpMgU897E4+89MxShRJ2tZE4U7+mTALYTnNoQE6E
	hgy4DrafnnlritCDFeZzv9gAGFar8u38YLh39lvikj2dmoNwYaR1jlHkf9oOp+My2iFOchlHmOp
	ThNavnUTWimjfI9GarOVTmvmpHcPb3uJwr2ytzA3SZ+sMgrREV9ef/cTbDn1JH62hoykzeweTF9
	AyrlYhg9M0hBoZFs7npkSVcsAonjjcpgFNL2uDTr0q/oqkCvf9lyTke4X/b3tE5T1C/YcU6vTZR
	tg+gFXdctg5wVsJyHzJAelpnbFHNQ4VV85tey31PPqRbjJFmPjFl3kONabEu39qOTGlCGnMdDN9
	Nd3sfdXLOsBmadYBP6l8BkL7F5j3zNOUpQfRqtQRWxDcTpd72OIl01FELXGNnBNxN6EbYpQbbBs
	qAdNiYRZwzhVXWgPc5u1f82j9QQoL6zQYVfF87ut5625hCo8PG3yZ7kLhYgkdSGhMBDr/aoMm0i
	1GWFdeeqYRbDli2axMygfZnjqgBzaTYf2ltzU5ufsJb4A4C1KjlkClGDzReSn1mT9eVePojid6D
	c12Dl1ahZyoOnGRiVWyWVpCNU
X-Received: by 2002:a05:600c:3491:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4bb8880014dmr336408085e9.10.1795561975632;
        Tue, 24 Nov 2026 15:12:55 -0800 (PST)
Received: from Ansuel-XPS24.localdomain ([87.13.246.159])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm527766585e9.3.2026.11.24.15.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:12:55 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Cc: kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: airoha: fix objtool warning with memif probe loop
Date: Wed, 25 Nov 2026 00:12:43 +0100
Message-ID: <20261124231245.271869-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_151257_711588_A4BEC7EC 
X-CRM114-Status: GOOD (  15.73  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Objtool produce a warning when clang is used as compiler. This was caused
by the memif probe loop when assigning the irq to the memif.

The warning is:
>> sound/soc/mediatek/an7581/snd-soc-an7581-afe.o: warning: objtool: an7581_afe_pcm_dev_probe(): unexpected end of section .text.an7581_afe_pcm_dev_probe

Fix this by giving a fixed upper bound for the loop for the memif as it
seems there are some problem with detecting the runtime value is hardcoded.

Fixes: 4974ffa0d6c2 ("ASoC: airoha: Add AFE driver for Airoha AN7581")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202611201414.1NBNxorL-lkp@intel.com/
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 sound/soc/mediatek/an7581/an7581-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/an7581/an7581-afe-pcm.c b/sound/soc/mediatek/an7581/an7581-afe-pcm.c
index d47edb630452..b17d58f25d9e 100644
--- a/sound/soc/mediatek/an7581/an7581-afe-pcm.c
+++ b/sound/soc/mediatek/an7581/an7581-afe-pcm.c
@@ -447,7 +447,7 @@ static int an7581_afe_pcm_dev_probe(struct platform_device *pdev)
 		return irq_id;
 
 	/* init memif */
-	for (i = 0; i < afe->memif_size; i++) {
+	for (i = 0; i < AN7581_MEMIF_NUM; i++) {
 		int sel_irq = an7581_memif_irq_descs[i].irq;
 
 		afe->memif[i].data = &memif_data[i];
-- 
2.55.0


