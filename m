Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155FC606A323
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2026 11:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R0Iyg8ps;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iGa5JcoD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=kO9MK7u1msKG5wq468IIgbTQC4+Wnaov9SdCK8DNy5w=; b=R0Iyg8ps+VaPxnSlNp2C8EesT1
	6uUq1BcVIT0vkTTu3Z2ul5CMpoG12JJ8jeoduh2VXA+U6HPy8RzTIGn6TIVFnddnjQgja4GvrGM5Y
	IqMSXArDYsBk14nlcyk5vWQ7EQmMdOjYzbCGl371cic6A9E8f3ipwiG0ktCUsIou2kbQvGFNDrDSC
	cF4YuUSMG29cGxh8Vs4caKm8P8Nj9+wkyQBHJj4ryhjRWNez5s1s6dmz6nqOiORkmU9AKEpQTW5Nj
	XDvy2cO3zyJtH7tdKQXmlmAhfJlR92uSiZaAQ9RhL1GHacXFr4lMoO3cd9xNxug3SO0CjNu5rHfgf
	DbeYh6/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLIlt-00000002MZt-12zH;
	Mon, 26 Oct 2026 11:21:45 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLIlq-00000002MZ1-3Ewv
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Oct 2026 11:21:44 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so4961415e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2026 04:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013701; x=1793618501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kO9MK7u1msKG5wq468IIgbTQC4+Wnaov9SdCK8DNy5w=;
        b=iGa5JcoDOS4yaJhhXrrp5LjB//mF4ppkt71+AapHtiYF5Wt9SxVRBZnBSy3sGdT2HW
         wkQ5ILiZKaCMpDjxontdtNfa55ZbN9u559X4XFz8MAt/lauK2vKQe76HJIJNoQj8xykH
         Kl4FkUll+qELVknneBZmq+eWgExbovUtV2xvXwWZ2QzvUsYPrWintcdKRtV3nV1aFWGl
         K/0nUAW6cgjHf7iM612IKXW0MlXyuqgez2eVLDk3CZ4wXSfq/Y1WWTqJ1ERHhw69LIXP
         PpkjcqAkybALINnD7Ov8BH26FFHH6SZ7ZqC1PdRuL6oSkiYbsILsb8wF3OFEX1cpkHzR
         K8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013701; x=1793618501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kO9MK7u1msKG5wq468IIgbTQC4+Wnaov9SdCK8DNy5w=;
        b=PL87AahU86T8I6v6J7UAyokJ6coRDzEEOCWPfs6flwZWfyhOYScE27s87UbTMGF60r
         cU+1EoEv07iIHA9HJ0he/GOftuV7PbpnZwq8mEy7a7ksxxVpURRzfyqI0F71WODN7aws
         EGM5Y9cJCqPkcLeF5K6eVjJeovCdzTpy8sfJHczyCLvolU4KB8BvaeMaiLpfz6PuKszY
         Ey8Rs3gAFnWn6WwftpkaN9gcCnJjqYU4F3ATozThU7zijFP+aHy2YPFLmD6a5eoYzQ/A
         CXZ7LP/7hPscwosz60rcOgj5bPHxUohiGrry7HyrxP2jw3qP+w0tHrtFZFgs6pGz45/1
         kN2A==
X-Forwarded-Encrypted: i=1; AKwUvBxAxtW4Q76UgPTVV3cr22uobuSQZ5JB3aNQYOQPO/3VBzHKTovMqFTw5kVxK2TlaQdc57vu1wlI69Rh8ftOfQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYI6rABGl6KM9cvZdo7GDy1vUZL5L9MSIdTiZkf5gz2MF39T9ZM3
	gLPs2vircb/fimucnmv2E/mlMI+qRTlYVgDcjjBNb7FXuTExsjRrebXh
X-Gm-Gg: AYBFou20MC+7ijpatTsKcj8ejm89N2DdhsX+pN463FCuh/VQkI6BBODXAbGXjk6yfb9
	5nh1PIC4nKa0EB/TIlc0AKW6TMI13nUw1knDsq+sLnGuX3c1aw3IkUIlB2hphFEk0GJzIggbjgS
	n9rG2ntYmq9CvfdM/sW6u5Hi6VyKGRb1jVu3bHV0hA+LZ0He5W1kwrri3CfCPl8HEpiQyLcyMIA
	rq7Sm6EOHtNuizaZSZ7QZa4TKQXpHOPD5jXDGEXM7AbEWajzBGQi53NOT0duaZ2wCyT25eXrv0w
	La0r8B3anYs4v0bIilgtGceFSQ9OcseCIzfHT93mn7n/2uy7ED7bmdrhNEV5OJp88EQY+vcAASr
	T/ncofmX4qxhDmpInOXvkrsMqfAqwRM6WdkXu2pMjS8gG31/lyYMLsPajh3Whemtr0wMcz+xRLd
	f6zchWRBg4eFm3EgaTT8D31+0tM+C4VIbBChwOwh2spZCLAUlKJF7Qz3ia9PRD2fJ8HgaVBUAHw
	4PFOVj8U2gENBtK/4E85UP49ilwQ+I8anTo11BkLYX9nfNIKemqqzyXJF/b4zvTgO768i5oSoOe
	0/bD25QaPuSFm4vNFSoXb8wdJz6K03PAwZSmDElUeK3uaXgD9twhPdtCRxNTdX/fJWJv8I0=
X-Received: by 2002:a05:600c:870f:b0:4a1:f7f4:7ced with SMTP id 5b1f17b1804b1-4a35ac9d1cdmr111940265e9.17.1793013700496;
        Mon, 26 Oct 2026 04:21:40 -0700 (PDT)
Received: from fedora ([185.252.220.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb9cesm16557911f8f.27.2026.10.26.04.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:21:39 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH v2] spi: mtk-snfi: use min() in mtk_snand_read_page_cache()
Date: Mon, 26 Oct 2026 16:50:33 +0530
Message-ID: <20261026112033.36310-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_042142_814016_9A22F9AC 
X-CRM114-Status: GOOD (  10.24  )
X-Spam-Score: -1.9 (-)
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

Replace the ternary case with min() to pick the smaller of cap_len and
req_left.
No functional change intended. Compile tested only.
Found using Coccinelle.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
Changes in v2:
- Join the memcpy() arguments onto one line as min() is shorter.

 drivers/spi/spi-mtk-snfi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/spi/spi-mtk-snfi.c b/drivers/spi/spi-mtk-snfi.c
index 6e96e50fedad..7eb7b40db11d 100644
--- a/drivers/spi/spi-mtk-snfi.c
+++ b/drivers/spi/spi-mtk-snfi.c
@@ -1016,8 +1016,7 @@ static int mtk_snand_read_page_cache(struct mtk_snand *snf,
 
 			if (req_left)
 				memcpy(op->data.buf.in + snf->nfi_cfg.page_size,
-				       buf_fdm,
-				       cap_len < req_left ? cap_len : req_left);
+				       buf_fdm, min(cap_len, req_left));
 		} else if (rd_offset < snf->buf_len) {
 			u32 cap_len = snf->buf_len - rd_offset;
 
-- 
2.56.0


