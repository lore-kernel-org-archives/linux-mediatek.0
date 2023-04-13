Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200F4C77B61
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 12:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfiB0dyNF5IN+dDnQ49hhgOP3vgf9O+J5xAGBbme+xg=; b=3abFma33KDsLGZ+AR203H2WzFz
	/XJiYwUglHEhQfmQvk437UrZU3BOjI9ggnFabfYyBgPtrOHuEGLLNZBZB/yn0y8H9FB/EkPEBGrcB
	iNgs/7voI3rhIjOibcVmcbbbGjdS6pw+ylLvsrmOI5GEWue1vWQa+7gnhaD9lK3oy9wmfoUgwFQNz
	LSWMuq2g0/w1BM8f/Rvv3A+a105M3Ekm+ZYVOHFp4JR8Ztd6k/TpRNjLH0U/QG1K9B3IjUKfbJcPg
	9wPjs4tvi2yMp/JBVJDrWdLh49mN/N8WwHZOL1VJ4QZMBPCMHLh6p3Ri1xrB4bb4syEZkdm+YHeK2
	SyApzMDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmwQY-006Af0-0T;
	Thu, 13 Apr 2023 12:51:50 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmwQS-006Ab7-0C
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Apr 2023 12:51:47 +0000
Received: by mail-wm1-x32c.google.com with SMTP id he13so13408656wmb.2
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Apr 2023 05:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681390300; x=1683982300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pfiB0dyNF5IN+dDnQ49hhgOP3vgf9O+J5xAGBbme+xg=;
        b=jt9lPv4lNrVGnYs0/3pm0ZbWLL22vClDmV9Mi1AjKNPGPhp2Z1qGKvnTZxfZ2IH6Va
         kdWB9Vni+Q2YbR5aVEZCe1q10+kzpEoLsR96keXGahTbBCxs1Gw4Rf4FvtwtSZ7HVKN3
         C81hq4PEchuYqdXF9E0329vVtPniqlkTwnJJ+uxVfTuZcKBHUJIiO6LOLKb21khCxIfq
         KaSXyJEqR4mqIBxAuPCklrrhmsA+bnWVtMAjwFperuNLjMPZ2+tDlEdIBc5Io+l0ofVe
         E9obFN/51kCQ1pDsVpsDL0sTjweGDhw6VzcDBOGCHtbPxDwugox0FApsENkM9nt4vwjQ
         tf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681390300; x=1683982300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pfiB0dyNF5IN+dDnQ49hhgOP3vgf9O+J5xAGBbme+xg=;
        b=GvSn01r0afIBYWDLR5xGhnJBXDTb/fsIw+dqnpY1wP/tP21p8fGnYnd+cmV+Zyqa/u
         9XAMfwcLVfRn9CVHb4xq9Ys6JUp5uO++JfTHIQxB44Ubfa4UpRc03x4eLYAuXbZXBMim
         5NjcoD0Wr/68XEeT05G1M4tzwqYjSe/qUDmltW2M2nK713EzEoQb57dtkK6UYlxLFFkB
         TPpjJ8mWilIw0g2k28bdYBBDVbddAdxrnyaZ3FTDOrRaEpnQMeo6FKQE/RZzqE9nT90e
         eyhSJz2SUjRr/0dnw04UreQ+FZAPRJ/HYtfhzlANHTtdvHOB/ondPnEbn2cD1vGKKnR1
         9wGA==
X-Gm-Message-State: AAQBX9eL0h0ZZYav4BksFbD08E0ueWxVN4bwHgSHQv7xLxj28SKIpDQD
	E7QzzGzsx2MAAhHbJzo7htLPMQ==
X-Google-Smtp-Source: AKy350ZhM3KTvTuJ+Clczlm2zRYmzA4Al3yjFIK+ApB//dgCEkIZNS4r1rOYNFbWtYCj5wo3UmI1kQ==
X-Received: by 2002:a7b:ca57:0:b0:3ed:4685:4618 with SMTP id m23-20020a7bca57000000b003ed46854618mr1728570wml.34.1681390300370;
        Thu, 13 Apr 2023 05:51:40 -0700 (PDT)
Received: from [127.0.0.1] ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id k17-20020a5d66d1000000b002f67e4d1c63sm156356wrw.12.2023.04.13.05.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 05:51:40 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Thu, 13 Apr 2023 14:46:25 +0200
Subject: [PATCH 1/2] phy: mediatek: hdmi: mt8195: fix uninitialized
 variable usage in pll_calc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230413-fixes-for-mt8195-hdmi-phy-v1-1-b8482458df0d@baylibre.com>
References: <20230413-fixes-for-mt8195-hdmi-phy-v1-0-b8482458df0d@baylibre.com>
In-Reply-To: <20230413-fixes-for-mt8195-hdmi-phy-v1-0-b8482458df0d@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guillaume Ranquet <granquet@baylibre.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_055144_396540_DF54157C 
X-CRM114-Status: GOOD (  11.08  )
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

The ret variable in mtk_hdmi_pll_calc() was used unitialized as reported
by the kernel test robot.

Fix the issue by removing the variable altogether and testing out the
return value of mtk_hdmi_pll_set_hw()

Fixes: 45810d486bb44 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index abfc077fb0a8..e10da6c4147e 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -213,7 +213,7 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
 	u64 tmds_clk, pixel_clk, da_hdmitx21_ref_ck, ns_hdmipll_ck, pcw;
 	u8 txpredivs[4] = { 2, 4, 6, 12 };
 	u32 fbkdiv_low;
-	int i, ret;
+	int i;
 
 	pixel_clk = rate;
 	tmds_clk = pixel_clk;
@@ -292,10 +292,9 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
 	if (!(digital_div <= 32 && digital_div >= 1))
 		return -EINVAL;
 
-	mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
+	if (mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
 			    PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
-			    txposdiv, digital_div);
-	if (ret)
+			    txposdiv, digital_div))
 		return -EINVAL;
 
 	return 0;

-- 
2.39.2


