Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08728C43217
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 16:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZMIvZlN2RweJkUN5B//uFf7tgMLArGLgtt1G8UfvMA=; b=sZn2IqEE+7GSnJ7/Jyky0OfkYm
	lboiT4kd0/GfRKyub9mweKfXCs0IbrosMH1aDHyD6HSbe9DoqLXTAHU0hP//8kgmpcdBzkJysixKH
	YeCv7BLLcTCuL4F9R5oK5YtAMyDK5uhl6e1DTVwGqZrjTPN5InnAdfTQOmpAFPby+Ma7VustS8NCU
	hFyKW/nF+Ezkl1OLZrXMKkM1CtIHHCJ4DQNuqfB+X2QK6fvfBt9WisjyrORoE2hmldrsWkxQLOOkd
	fc+/3kI2Pn/0E50v4NewKn+Bbkx+DT3zRtIVs/RxH3XY7Qwti/syJmPlW+CmCudkCvHH9/aluPTdU
	ojP4Oucg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojN9k-00FGQu-OM; Fri, 14 Oct 2022 16:03:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojN9j-00FGKd-50
	for linux-mediatek@bombadil.infradead.org; Fri, 14 Oct 2022 16:03:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7ZMIvZlN2RweJkUN5B//uFf7tgMLArGLgtt1G8UfvMA=; b=qXOSDxslWxuxo/i3arrKpO6oBd
	IP0effF3hDJqTUdOWqZlnxqkthHTzoVL9Un5FIJA7L6UEjw0ylY/3Yz7mqpH+O+91flvTAQYXoQSP
	7udUIaLPVvSTwZVX5gTFR3s96np1dg6qFKQIlDCbkCVQfqzEccoQM+V+YQLuZSZoIZw/nnWGxBha2
	CML+S0Ty1qjcwau9QucgVjx6tGw9e/hwKC5pKpUAYIzLAjYie6AC5HbNI8dXckz6mxwCPgP9tZL2X
	E0nsp/c/SGzgdZ6uzemS3ZtswMwxfCp0UlS84TM38S4PDmeB02mG+hQFw6aiIoeD/r9strdtiTV9o
	wJxtzRTg==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojMU2-003RJ5-Nd
	for linux-mediatek@lists.infradead.org; Fri, 14 Oct 2022 15:20:26 +0000
Received: by mail-wr1-x431.google.com with SMTP id n12so8058128wrp.10
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Oct 2022 08:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ZMIvZlN2RweJkUN5B//uFf7tgMLArGLgtt1G8UfvMA=;
        b=vyYoDAHlbaol64KHta05nB/feVbxAif5WWgpsifdznUOiy0di03Ab/Co8SnivrMsJs
         TwcHLdlOhXHiuwhAm5ola2rnegGShmaT4jbbjQ93+WA3p1XCn5a9Ruyj+sz68Tfe+iRH
         MooqlXsU+aozyTmQ3Z4B6Ufgu/0EhNKBypN88exKPsOTRLTzqMjEiZ+I64/zDYzS2ZFv
         glMduOTKNrBE1uMiSknPb47QKvQ1Fslp3lVWBD5eaY7Xh9sEgdiMpgnqf+1LMMxWDfXx
         DjkIHq6i/wFHokwDziPOcQ1XKYJtfqe1Q56wbHlY9yLMkutYHgzh5J0cgVlrC5zcqe/j
         DqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ZMIvZlN2RweJkUN5B//uFf7tgMLArGLgtt1G8UfvMA=;
        b=QsIDUpWoK5KOz7K0Hk/L31wK/xruhRs/u8Kz3SxfS8fOVInioHqztrxnPNQTjqTVx3
         nz8qfzml4z85zQzi/oH7UAHinDWeRVraBgSxkWXoyKUTpNprLXhG3l4zc2vQxjCUlK0V
         6AcqS74lJJ/VN1t7y7k6wiQLGM5NTa2wTKJlplVtWzeS3UmloyfXdl2QZqAr92JyM8dN
         8XzeCYaFSZF8ITaQ5yOwtd6OiNQ+0jRvf2Mx03NITaUS5XznWQ5mhmE48gnkfWBOHdTi
         Hv4ry8ucMitv2+dXDJZTDHwPayow2eVgJpGoNp0qaOs9spNIST0+/QEJ1Ki4815gqWo9
         28Zw==
X-Gm-Message-State: ACrzQf3Vpel76M9pllqdzJcJOfQEvUurtjJhkg1VSyZjY6fIv8kR1ind
	mmVqSC7vm08UhkEcBn1asVqDHg==
X-Google-Smtp-Source: AMsMyM6fsEM7Zok+4dA1E8vJbMNpo8X1aKWBTLgOrRBTYmZAFS6rLY4/4rxttdckY90lLewdsLeanQ==
X-Received: by 2002:adf:b646:0:b0:221:76eb:b3ba with SMTP id i6-20020adfb646000000b0022176ebb3bamr3687815wre.237.1665760818451;
        Fri, 14 Oct 2022 08:20:18 -0700 (PDT)
Received: from [127.0.0.1] (2a02-8440-6241-7429-3074-96af-9642-0004.rev.sfr.net. [2a02:8440:6241:7429:3074:96af:9642:4])
        by smtp.gmail.com with ESMTPSA id z11-20020a05600c0a0b00b003c6bd91caa5sm2818223wmp.17.2022.10.14.08.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 08:20:18 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Fri, 14 Oct 2022 17:16:02 +0200
Subject: [PATCH v2 09/12] phy: phy-mtk-hdmi: Add generic phy configure callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v2-9-8419dcf4f09d@baylibre.com>
References: <20220919-v2-0-8419dcf4f09d@baylibre.com>
In-Reply-To: <20220919-v2-0-8419dcf4f09d@baylibre.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, David Airlie <airlied@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jitao shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Guillaume Ranquet <granquet@baylibre.com>, stuart.lee@mediatek.com, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, mac.shen@mediatek.com, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org
X-Mailer: b4 0.11.0-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_162023_013632_6E453F84 
X-CRM114-Status: GOOD (  10.82  )
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

Some phys, such as mt8195, needs to have a configure callback defined.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi.c | 12 ++++++++++++
 drivers/phy/mediatek/phy-mtk-hdmi.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
index b16d437d6721..32f713301768 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
@@ -8,10 +8,12 @@
 
 static int mtk_hdmi_phy_power_on(struct phy *phy);
 static int mtk_hdmi_phy_power_off(struct phy *phy);
+static int mtk_hdmi_phy_configure(struct phy *phy, union phy_configure_opts *opts);
 
 static const struct phy_ops mtk_hdmi_phy_dev_ops = {
 	.power_on = mtk_hdmi_phy_power_on,
 	.power_off = mtk_hdmi_phy_power_off,
+	.configure = mtk_hdmi_phy_configure,
 	.owner = THIS_MODULE,
 };
 
@@ -43,6 +45,16 @@ static int mtk_hdmi_phy_power_off(struct phy *phy)
 	return 0;
 }
 
+static int mtk_hdmi_phy_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+	struct mtk_hdmi_phy *hdmi_phy = phy_get_drvdata(phy);
+
+	if (hdmi_phy->conf->hdmi_phy_configure)
+		return hdmi_phy->conf->hdmi_phy_configure(phy, opts);
+
+	return 0;
+}
+
 static const struct phy_ops *
 mtk_hdmi_phy_dev_get_ops(const struct mtk_hdmi_phy *hdmi_phy)
 {
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.h b/drivers/phy/mediatek/phy-mtk-hdmi.h
index c7fa65cff989..f5aac9d352d8 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.h
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.h
@@ -24,6 +24,7 @@ struct mtk_hdmi_phy_conf {
 	const struct clk_ops *hdmi_phy_clk_ops;
 	void (*hdmi_phy_enable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
 	void (*hdmi_phy_disable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
+	int (*hdmi_phy_configure)(struct phy *phy, union phy_configure_opts *opts);
 };
 
 struct mtk_hdmi_phy {

-- 
b4 0.11.0-dev

