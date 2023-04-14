Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D7AC77B6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 16:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flkZrEmQ4lhBir76YpEsiit3KQbCll7hap6g9ky4XjY=; b=uFmMEp3P3eESnaM7WG+kHGyGqw
	zFBwhIaqVkIf8keP+wCv0EWMLomC6e9vfzoq7WsPsdd6+YuqKTml5JgJLDXIASMUNZfb98bSaOk3b
	9sAzc5ptodYjbQNOkobJ5eT5wzPCke7G/yJn9KNQX4wOgOA6LM84kPHvy/zusQ1RiEoABRyjFhwMH
	AWDz4VZtckfAkAD2Tajpcu19id2L8Kifu0vc4XFM/DOVDMXyufrRz15trNJ7xNTOzwQ3rJJHHqiGM
	ndq8z0rb1FBXZX5weD+1qf9WJWT+DW4X8h6mVBljSlJCMPFn9jWdtF+nCljff8OdvFunGvEiYKXyv
	i9OrJOVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnM31-00A4XI-0I;
	Fri, 14 Apr 2023 16:13:15 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnM2r-00A4Pu-1g
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Apr 2023 16:13:07 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-94eff00bcdaso22147766b.1
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Apr 2023 09:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681488783; x=1684080783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=flkZrEmQ4lhBir76YpEsiit3KQbCll7hap6g9ky4XjY=;
        b=zaTmkBAJWvJky4Aq1jB49C5WY+IgRDVMOCslR69Vl6Fgr4/MRocM/kLTVgfUS8Vc9t
         Q5XzQKszCuzICokhmRt1Go9VJJvcH1uT6f+5rfYnMRm/VGeYBqxiP4x2NmQ1MevYDkjN
         Lxk0CUgrBgJbq5FMC8z4GlSzvTMMDwmIo9sndS4eHwEvB5es271P2gctIkx59RCxGrjD
         qQOHmZ/zRLOW555qQAT+JAPtnfGECgKfLCX77sAM0b2vkpi1jeX85CPnkPEabfcUueWU
         o/6fqwlu5lZhedeQOhwirSYVKUm8EFzTq31Ybde4rBY1SDN7cNyHo866FrH2kGX024ZB
         3Y+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681488783; x=1684080783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flkZrEmQ4lhBir76YpEsiit3KQbCll7hap6g9ky4XjY=;
        b=IBQrnq12Id/8uo1gbojmf59DVz2MBUVg3qjdMYxwhFrdJHqUvRyIkqpghGcsaD4LvH
         sOEUvQVbDat+2/1Zavy4QDQ+wsJ3RXngm2b8V52X3LPerwk/dBDByXFKLso7c2DWn0Xv
         c7eXvFBzCIMtfTY4yBTJDgJmZ4zlQ9tCJii857wiEdxgDWrQTxXHJeBbPrdktPqW36EG
         HwfY8vSCGv+N518n7aOs34CGWyof3waN4JdJahJPDyWpozcU+AKowjgYRHo6BLfWFQJg
         vPjdsScEDmbfaKnJIrU48V0wttibdMGKjglH+ceXXRevyuu/2OX7HW/TjvSdFYVTJ6Vh
         PmQQ==
X-Gm-Message-State: AAQBX9cgpa2Z5uGM3brC6fbqb1J1hRKvzonj4CbBV7p/kHuYA3pl7hqW
	g3Mevq2ojC4Nc0dEzCqfkfknYg==
X-Google-Smtp-Source: AKy350b2JE8Qx2Y+iWCoW/RhZBJ5V4rhMWPwFiGL7k5VHEtk/DsRY4ZLJHBMfiz8yCcBW8ZuvdtkfQ==
X-Received: by 2002:aa7:d85a:0:b0:506:8e06:8b4b with SMTP id f26-20020aa7d85a000000b005068e068b4bmr290176eds.8.1681488783366;
        Fri, 14 Apr 2023 09:13:03 -0700 (PDT)
Received: from [127.0.0.1] (2a02-8440-d20f-2c76-3074-96af-9642-0003.rev.sfr.net. [2a02:8440:d20f:2c76:3074:96af:9642:3])
        by smtp.gmail.com with ESMTPSA id h23-20020aa7c957000000b005066ca60b2csm2242687edt.63.2023.04.14.09.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 09:13:03 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Fri, 14 Apr 2023 18:07:47 +0200
Subject: [PATCH v2 2/2] phy: mediatek: hdmi: mt8195: fix wrong pll calculus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230413-fixes-for-mt8195-hdmi-phy-v2-2-bbad62e64321@baylibre.com>
References: <20230413-fixes-for-mt8195-hdmi-phy-v2-0-bbad62e64321@baylibre.com>
In-Reply-To: <20230413-fixes-for-mt8195-hdmi-phy-v2-0-bbad62e64321@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guillaume Ranquet <granquet@baylibre.com>
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_091305_594157_25325796 
X-CRM114-Status: GOOD (  11.20  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The clock rate calculus in mtk_hdmi_pll_calc() was wrong when it has
been replaced by 'div_u64'.

Fix the issue by multiplying the values in the denominator instead of
dividing them.

Fixes: 45810d486bb44 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index 054b73cb31ee..caa953780bee 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -271,7 +271,7 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
 	 * [32,24] 9bit integer, [23,0]:24bit fraction
 	 */
 	pcw = div_u64(((u64)ns_hdmipll_ck) << PCW_DECIMAL_WIDTH,
-		      da_hdmitx21_ref_ck / PLL_FBKDIV_HS3);
+		      da_hdmitx21_ref_ck * PLL_FBKDIV_HS3);
 
 	if (pcw > GENMASK_ULL(32, 0))
 		return -EINVAL;
@@ -288,7 +288,7 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
 	posdiv2 = 1;
 
 	/* Digital clk divider, max /32 */
-	digital_div = div_u64((u64)ns_hdmipll_ck, posdiv1 / posdiv2 / pixel_clk);
+	digital_div = div_u64(ns_hdmipll_ck, posdiv1 * posdiv2 * pixel_clk);
 	if (!(digital_div <= 32 && digital_div >= 1))
 		return -EINVAL;
 

-- 
2.40.0


