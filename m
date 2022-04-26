Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D95C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 13:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fXRzlBl1fQ8VLHzbGW2boWYhuUtEMtYqmC3ZSdGuYV8=; b=HOWriwD5mvrek8
	/rT40FsDIYRB0Sc08F0r17WdRDwtYAodzFxW4+rfIwIhHHOOl+6OMJFhcQ5BQHQ3fysDeXE3wRMN4
	u0g9yEkPPPNF/vaFQv4+s/hSXvzAFH2cpzpnTlENQsSrG9rrepB9o/wSEsMA1mqs5iiTnX3c3j2R5
	n47zi5GSE+vX/XoZUOJxoLy78cRCaJZFRqRAe4sIvo3SDIr3FN9zNvu/OMEkeTBhen3kuM08EKobf
	f0j9po7Xzmn0/QdWQxjc+hXY0BP/CXRLl+ZNoeypltCLdMJknxevfV/EqjXaTRVsxUxD9T183VvJV
	HtQV7tq8WhQ8H98h5LhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njLhI-00Eo2R-Uk; Tue, 26 Apr 2022 13:57:45 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njLdH-00Elzb-UU
 for linux-mediatek@lists.infradead.org; Tue, 26 Apr 2022 13:53:43 +0000
Received: by mail-wr1-x42e.google.com with SMTP id q23so12703405wra.1
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Apr 2022 06:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bkk5Ygl1l/wbX+/eUZKIESTobqRlYl1nxsuZRgR+lKI=;
 b=d+7QdwI1hHNkuPP7Dgm83h5wwGS9Fqce3A7cHmZDBKGR5IsirTPoV48d/Dz3oq6Kah
 meYaPaOygODTJd3om2AA5jjPXpTGAdLm53n4+Dew/1KDsZnmpfltMuLDskTldHu5ow0L
 IY0oS2xhnpYfwNYH2VDuTtd5EmO9eyizrq+XAf6MSgJpyM32l9jLVJnElcfb1Amo+Wdk
 y8ksbIdvaPK/LaR7i1eJRCwLEnCsLA9LU1fnyGBhqNz8Hj2F3E02X7So1ooGAOEFMMIl
 p9P94JLa1vCdfxr0UbMrwculH7y/sxge0zyqD7zKl1BYcfN1a+Vtb/1KaR5r2xYuUmuG
 +KJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bkk5Ygl1l/wbX+/eUZKIESTobqRlYl1nxsuZRgR+lKI=;
 b=JORx3x7lQFG6BDhXSaVRWxzb6iWv5nKXsesYzrZeNQ8w7ybNL2XNaM6ypVOogOwAQn
 3RGwNAKxmsfA/Hi/fdM/DoFbFSv120MV+YB1TKEFLnKNoaLPZWret3C2jn0CD73cF/1x
 5U/djqCJ20/2mjYD5MeNH9qBPjpJAGzd16zL6497CsSxKN6y/bgxkJDaHVpXBXMVV5cK
 JDEt6wnvn7G0FBCLEVSgcnEPXtrpbViCfKSrHBH1InuKnTmqXMGcimpf/mxHBMVmSN4t
 +z4OE5wUcTCG0zFZYKM25vJlCyBavlWoMJwvq3iSI+Fx3ot9v7pwWQwyEJk99Erxklaz
 PmNw==
X-Gm-Message-State: AOAM533bLL2INlk0h2rWOqryMmQf1jjHviah5p7IkYEc5oX36+34D4tY
 fU9TU8ksNqzWY6v0z82SM7G6xw==
X-Google-Smtp-Source: ABdhPJzQZ5VHGIGmfTiMBz/77oQOhAmCfc3t3E6VJQKoppd2IOaC5/QgKinJIlSUrlYxDxT8MuPdzw==
X-Received: by 2002:a5d:6208:0:b0:203:dde4:c76e with SMTP id
 y8-20020a5d6208000000b00203dde4c76emr18278379wru.273.1650981214291; 
 Tue, 26 Apr 2022 06:53:34 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 m35-20020a05600c3b2300b00393ebe201a6sm5504775wms.44.2022.04.26.06.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 06:53:33 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] Input: mtk-pmic-keys: add field to store if PMIC has
 key release IRQs
Date: Tue, 26 Apr 2022 15:53:10 +0200
Message-Id: <20220426135313.245466-6-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220426135313.245466-1-fparent@baylibre.com>
References: <20220426135313.245466-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_065336_020536_761BAA29 
X-CRM114-Status: GOOD (  14.83  )
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
Tested-by: Mattijs Korpershoek <mkorpershoek@baylibre.com> # on mt8183-pumpkin
---
v2: no changes

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
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
