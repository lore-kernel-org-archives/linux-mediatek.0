Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03A9C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 16:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WbpiCBsjBpB/UO5Ed80AR9nhisTWXQ5ihYNcvjgSWx0=; b=HnfBBbzIv0qGfb
	R8WmyPlMP+ZpAzTUX+55/Qh8tZgKxVOoKG30MZESBs5ZyQHtGjQiONK2Ue7zRCGYZ3rptki12x3AJ
	nMqXkCAf51pS2oYHN0ciglkURbSmIvG7DNU6c6lyKEBF4Stkbp+3uRHIPQsLWXULzH3j+it8doojw
	u0aVybwk5iQkxm4IiPKE82g3deyH+UHEVteQgGOsFyCYEKcX18XxpOXD6dzLKd7fasA9QceARFPyH
	8XIUm7MpieZTVac4kH06auFeRNfxufd9kxWH/u8EYtQRne1pjPEeewG4ydIceGrO+akI5sTVk6fLD
	iPNPsIPW85GViwi8Hp1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfOXz-00ApTZ-8e; Fri, 15 Apr 2022 16:11:47 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfO0O-00AbSB-Ik
 for linux-mediatek@lists.infradead.org; Fri, 15 Apr 2022 15:37:06 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 m33-20020a05600c3b2100b0038ec0218103so5223410wms.3
 for <linux-mediatek@lists.infradead.org>; Fri, 15 Apr 2022 08:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9jbG8zhZKbTiE7ZNDTYGG07uuZNvNsy0rqtU9fqaUgM=;
 b=r2+ahgDRgkvtXt6wiCkeTrKl7ytYvippEBpvGHj4DgfAHDnQMrEame754zG4uQVNsE
 rfI2ZE9y8R67O6QaTY0uE58yVfMG/3dl83oT5Q/98Q42/Seugf2HPqrvSDIeqnJXhRmR
 JekwubM7J5hX4B2qYKeVeSGEwlzYf58zMQtn9nBEDe1rdXtIQKQiX9qdA3zxGff3a6jg
 naVi5VnD0LlyhURGOhSfS0fXxKQ1hU5VerYHSSzSWNpDLOXAmt4HR7y2t4FiXZQQUzU+
 vNQPi6f4IFu0vX4u290SrXld80lfMhq/aJwIIZoaDIRg7W2gxjzk2zceNBtvKHx42W3M
 +eTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9jbG8zhZKbTiE7ZNDTYGG07uuZNvNsy0rqtU9fqaUgM=;
 b=sHj2rfwCg5u9obBQQrHWBfrhKQ9DYqVytt+hOij69NoPlHXDGQEUyMLqtqgrpHMzuy
 BflncrvJZP780tokoQHHKgazROc+LfApnzyfkdicEimE/4pcOHPpczwnMBQUGvIApM2q
 sO8JChyelx8aas0DDazvpZxnee2Buwgh5PhlJx3GJCG3rIB7yPD6H3VcCQDMMtf+WfuK
 +hkuu1te+yaXiqSAfKzTuqIqY5/Fh/g0t2sozKco1mvkLaklfzdKDRnAVDNH57jvF5sW
 gJxMTG41jYLjkKiRMriZo/YRdCnfeqwfNFRvaPrpXwApiVTM2JKR4xgPzoTtNFrifehe
 K3xA==
X-Gm-Message-State: AOAM531PTwaMRiFO50I9IcXgv2yB3VWR86PurVQXRNHefXNFG/97tVbr
 OHfKB0/sk0tfo5QWzSAU+FWL7w==
X-Google-Smtp-Source: ABdhPJyZ8vjESL1eqz3zOr0c6KrLsevpBtztK3bxcy3XYw0G+YAKg44wfGRodkrXogvKzjUSa6pUBQ==
X-Received: by 2002:a7b:c057:0:b0:37b:ebad:c9c8 with SMTP id
 u23-20020a7bc057000000b0037bebadc9c8mr3745781wmc.61.1650037022651; 
 Fri, 15 Apr 2022 08:37:02 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a7bc018000000b0038a18068cf5sm8459292wmb.15.2022.04.15.08.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 08:37:02 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] Input: mtk-pmic-keys: add field to store if PMIC has key
 release IRQs
Date: Fri, 15 Apr 2022 17:36:27 +0200
Message-Id: <20220415153629.1817202-6-fparent@baylibre.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220415153629.1817202-1-fparent@baylibre.com>
References: <20220415153629.1817202-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_083704_658226_411F0F3E 
X-CRM114-Status: GOOD (  14.33  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MT6358 PMIC is not the only PMIC to have release IRQs. In order to
support more PMIC that supports release IRQs, such as MT6357, MT6359,
and possibly others, let's add some field in the platform data to
indicate whether a PMIC support release keys.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index a0da644fe93d..609b87afd020 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -53,6 +53,7 @@ struct mtk_pmic_keys_regs {
 struct mtk_pmic_keys_pdata {
 	const struct mtk_pmic_keys_regs keys_regs[MTK_PMIC_MAX_KEY_COUNT];
 	u32 pmic_rst_reg;
+	bool has_key_release_irqs;
 };
 
 static const struct mtk_pmic_keys_pdata mt6397_pdata = {
@@ -83,6 +84,7 @@ static const struct mtk_pmic_keys_pdata mt6358_pdata = {
 		MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
 				   0x8, MT6358_PSC_TOP_INT_CON0, 0xa),
 	.pmic_rst_reg = MT6358_TOP_RST_MISC,
+	.has_key_release_irqs = true,
 };
 
 struct mtk_pmic_keys_info {
@@ -319,7 +321,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 			return keys->keys[index].irq;
 		}
 
-		if (of_device_is_compatible(node, "mediatek,mt6358-keys")) {
+		if (mtk_pmic_keys_pdata->has_key_release_irqs) {
 			keys->keys[index].irq_r = platform_get_irq_byname(pdev,
 									  irqnames_r[index]);
 
-- 
2.35.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
