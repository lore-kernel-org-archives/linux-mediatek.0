Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F148606A31A
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2026 14:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gplcJtoX;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GoSAMvt5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ssGW1Dqn9NQO094E/8Ttr3abz77jsGgzbaDPU8z6CLQ=; b=gplcJtoXMUf9kt
	VqRaUaM6O5UmRVljSDP65RfY3OH87apeGUmGJnVriNo9IlwImiAaM2LFdqbZTY9STNWyqwUl1sjvv
	zsKbQLbkm4N1BLbpiaV1MiqyM/dPC61RhTg/95uVW/DbIoMS/FhQqIH/h7iUQaC6nKcN9Q+MofRB+
	d7jmogM8hdUer5Upi2yLyqm378xpgkQOCcCcKqq9jstdAjVkTm3Ly/H5X/zfyUbKRWHSg9a8G0gdr
	qWFDm7hZtT+QNrsnUYJ5SpDrYEn961D8pQzaF5ZSq5igW5L17Fi126RuRrHSqnFpZlPvKTspNK+xl
	5iBaxw0FYiscngpGEj4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLiLa-000000053Nb-0idm;
	Tue, 27 Oct 2026 14:40:18 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLiLV-000000053K8-1YpK
	for linux-mediatek@lists.infradead.org;
	Tue, 27 Oct 2026 14:40:15 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48e47347279so1949635f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Oct 2026 07:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793112011; x=1793716811; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssGW1Dqn9NQO094E/8Ttr3abz77jsGgzbaDPU8z6CLQ=;
        b=GoSAMvt5JtwMFfr7qwt2J/hqI382mvD1oYDAgdHRVHhF7LrgCPFmtLGK7876hs98mk
         EZXI/IcKT1+sMa2URxyaLl+ZQpFlMJ1Zk9pg5+WEjMWwSbfMAgxKBNefo7QIp8U3KINw
         hCEKNvMTUX2gN9gJXFNTAhQkbDkxdmR+/d+roOAEeNv5rh4LlgZwBcWGxHCz2pqCO5FU
         HCH9C+gOT1ME58Qng6xkCJOodiTdkcJc2CvOQKeiYIXYsM28eOh5dxHbOo4tRODncII1
         PJnKSN6+5dka/ZDFCJQjBEGKeb+ZF2GviRCQ8ZiLEDtk1Tr6nWDQEbZaaPH1c8xvsG2w
         7Qyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112011; x=1793716811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ssGW1Dqn9NQO094E/8Ttr3abz77jsGgzbaDPU8z6CLQ=;
        b=p1PJ95HekmENi3Mib43rY8rSlQnWq1PhJIsh1b+HV5w85872GDsf6L5ginJCNwT0cX
         7Z+Zos6gi1giljpGdxkZaqO3ofqRDMlgpsvcaK5ATpWqM0ntaFcHWn2GWtlx/jXTCmNa
         5IujF0YDXWRD77ORJyZY+iAHeh9YdOfV7Ea+IiNy7EoQo7t4UL/vR46eCvzYF1oti04G
         VV9Chf/mPHAyLfRSFxc8ztib68GuDFbCQl4k7XRXUR1jy8gVJFRirQqq6UXwQGK231Kx
         petgtrFZVq5NefZWFNsVp8mLOXEdbFZgaNBVkEmgKjohpdQ5DHaLuD7gjnIQb/3ntrOx
         9KQA==
X-Forwarded-Encrypted: i=1; AKwUvBxMnNDEovXbwTnBz/pjgJcWOhehChk0BnLcYjH4MHVtnzhwZa9oe7kl9Hj7Bc+Z6VWNXbfdqX49PyGcxRI4ZQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLLakjkdon18XRtxSbmC5Uoz+oI4OWo1ypzDXSLYZlNSGXzMF0j
	03LZc08XalU5Tuphha1IfjwnJ69Duc+bNKgrKGuF7pcJDU+MBMQIM7p6
X-Gm-Gg: AYBFou1TVPbPIC+gzSTp83cGQHRbVxO6yfMsuNgKbTLMIFqeHsg+CY9IFmD/T1G7GNK
	CRp4Hg88NIuSe2RYQaGL7KFGLWUC3j+vp96SQ2ov8AfgYnRdB1+k5E7PF3UXE7I/zZSZTzRl+2g
	2JU6yOUQZuI3qsKbHvX0xhED3cZTO1EIpM2r0KZYdNURE+L51KElOrhfHaWPtsgSHnuOMZB9z8Q
	WzZNSB2tllcxMSInTYgiJzClwYC8zXoS7tdrcpLDkc3U0dS+zLR3R8ZLdmc/dQ+4Oi4PWmZSvPx
	iQO2fcqvfO+FQSG7qQnlvlnqzVRNcGIWp8/O7fUjWHIJFbGdJoW/PnzSobZHKhdv7G8yMbRlMoJ
	gcNbGm9orI2jwEElwjREMbrT4RxhJl8KFuEVHwcmgDIKM5VSsDEDwjAIWdjNvciGi+/vv+gQFCX
	a+sb9K8LkJ1jME8CZSnyjecYqH5SWrBdun8c48hb7hSVicY1l9dugMBASqg2+s/vkISyv7qWGOZ
	VeHED6CHSnSJedSP2p76129qh7IbMD7U/dCMc9LsgRqSc53RA9EcAEYtZ+MERcXy0YwK/F0aNTp
	cNB6YKnVCZ0bal6r/SDH0dnAjbp8J+H1h39t1tCce4115dTftS1NypSI6zDE
X-Received: by 2002:a05:6000:26d0:b0:487:91e:d8ed with SMTP id ffacd0b85a97d-48e3eb2ceedmr18881590f8f.2.1793112011312;
        Tue, 27 Oct 2026 07:40:11 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23354151f8f.25.2026.10.27.07.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:40:10 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 2/2] mmc: mtk-sd: Add Airoha AN7581 MMC compatible
Date: Tue, 27 Oct 2026 15:40:01 +0100
Message-ID: <20261027144002.10606-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261027144002.10606-1-ansuelsmth@gmail.com>
References: <20261027144002.10606-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_074013_419279_1B5EDC9F 
X-CRM114-Status: GOOD (  10.38  )
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

Add dedicated compatible for Airoha AN7581 SoC that implement a dedicated
MMC controller based on MT7988 with the difference of having a single clock
controlling it.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/mmc/host/mtk-sd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 5b160fdad3f0..736cff2783e2 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -713,6 +713,7 @@ static const struct mtk_mmc_compatible mt8196_compat = {
 };
 
 static const struct of_device_id msdc_of_ids[] = {
+	{ .compatible = "airoha,an7581-mmc", .data = &mt7986_compat},
 	{ .compatible = "mediatek,mt2701-mmc", .data = &mt2701_compat},
 	{ .compatible = "mediatek,mt2712-mmc", .data = &mt2712_compat},
 	{ .compatible = "mediatek,mt6779-mmc", .data = &mt6779_compat},
-- 
2.55.0


