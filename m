Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C4AECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 18:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23EqGi3gFXXOB6EHxNrULl8XJT9OcS+TsgqB/BHqbHw=; b=J3SFWKayyFfTHVk64XbNpfMlEZ
	1A8rW7HpCA8SNEf4aqlQYyquMv40zOO1mizMybE+dXkDdRAuccdrPnJoC0kNifnQHa3N5vXJvHVKS
	6/RrNzte1LuJB5G+agN+/4wfcxJZZGMoHJWzw4d/3+ArvSnwmpLnUI41U/WkyqhjsH9Bh6JkEJ6q4
	s0pPC2weiOwrGa38UKwldVCXTwEx9iaseTfSpwAJGOSJ5BR1H5pu/c1R7xtgVIOuC75FHLfh7UdX5
	fELOqp0C9oUbV+i1Bqug9dpxAJMcY6TUzBJhKztUrEK4T0R4SUcuNeZEjcrlQyr8F8OMsCdz3tFIl
	vpa1QJ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaL7C-00DWPK-QL; Mon, 19 Sep 2022 18:03:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaL7B-00DW7g-Kq
	for linux-mediatek@bombadil.infradead.org; Mon, 19 Sep 2022 18:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=23EqGi3gFXXOB6EHxNrULl8XJT9OcS+TsgqB/BHqbHw=; b=PZnLvM0yU1Vqm7rMkzfq/oibw6
	JAZ09bkg4uCxhhe8mqR+IfsOYkjS68fZXi59awfQwzbx6OgHZ/8KKJ2mas6lE+K5pit62rEeus0dg
	rnqjngbfBfUkth/Pu1bG7HzvQfdjdRN908mUCoHaJVu1j30MzX+ONNgmt6n+8kuNquehorVcLJlhV
	EiUz56J+Kk/QEAXqxNoJAWrjSn0yHdXXuBC1w+nRL7xTgI/Q+rUlw6Is6ST9WNXBqwn/PSnQcmwHG
	SoecxRenY4mtYfhSb4sDcr5jUJvmv+evf0v/V34szrsXoRXslQZiuTIsmyyH0CX3S0fLarA6U840M
	v09MY3lg==;
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaK7z-00E8GY-Hk
	for linux-mediatek@lists.infradead.org; Mon, 19 Sep 2022 17:00:17 +0000
Received: by mail-ej1-x62a.google.com with SMTP id lc7so261972ejb.0
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Sep 2022 10:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=23EqGi3gFXXOB6EHxNrULl8XJT9OcS+TsgqB/BHqbHw=;
        b=cn9iS0q0xgkjHJD+ds6dZQH5Wy9i/TPkeNeu1+g/E8IpAhA+7/wzTwuy7sZV3qHvfQ
         GC/lUWWZJ92voqvSw2+0phX12M4JLdIbDHkhE+jM7LKwpctaymK9eaAv17XKtP6uRqnn
         4kqirP8cJnH0CPHjDEkXydaKMjHfFtUdgLMpTup6zuKcOicQQ6jeMHFPeHK/Gl4qLwah
         yrKgsk45GGW17HRqO1FIk3NnwzwIkgCbTq8T7p/Hje+0dxGUVe6op7iQ0gRQsLeYldiI
         1q+9QKpoYBPCHArfwScqBaDWwBgERHtGHIRSLAdz/VQBZyeHVoC4Yqz5qDa4kvYw6HMe
         LwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=23EqGi3gFXXOB6EHxNrULl8XJT9OcS+TsgqB/BHqbHw=;
        b=ij6Zhk5aJe6s8v7bBnljc6F8z8RQ1pQU4tCPoBErWraHlrJINnmC+7OPZ1YLC3BcYb
         goIeDewov1cnh8qYwxQj9i7lzxwv5LIjJD2at5gzwmHFcJ4GSRF5Y0RfyyWbgHP7K+SP
         lW16OR80A10qMu88YT/IrKnznAYlNQvQdNqJsOoHrECUMJWM7ekQX9JsrNq6bNPtm/IA
         TUUBTplnZ2HtnQHujYwNLNili6qGHwE5dPKRwPtkwn3Iv/qJX9edR13eUBAZGzrMlE4p
         ZiLSdyOCHdCnYd+ZolYBcDmzk9Sez36XreyeFZyIcnWCWmnubgBxnEVAbyK5iTNUAHn2
         4M2g==
X-Gm-Message-State: ACrzQf2YP8iquUs6P6wzc67G7UzXEh985YDv6VEwdRhmDKDhdHU1HUT3
	FTEv2wbVmqPqw+yD9teaAvLumg==
X-Google-Smtp-Source: AMsMyM4ibbztqMuL5CwwVz+5760qZJ0rcMYySRyQ9feIjgEn12tXb0Qh8bg5Wo1IiM/vXpoPAiZsRg==
X-Received: by 2002:a17:907:728d:b0:77e:1942:f772 with SMTP id dt13-20020a170907728d00b0077e1942f772mr13919231ejc.222.1663606815174;
        Mon, 19 Sep 2022 10:00:15 -0700 (PDT)
Received: from [127.0.0.1] (2a02-8440-6340-f287-3074-96af-9642-0003.rev.sfr.net. [2a02:8440:6340:f287:3074:96af:9642:3])
        by smtp.gmail.com with ESMTPSA id cf16-20020a0564020b9000b0044fc3c0930csm20424246edb.16.2022.09.19.10.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 10:00:14 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 19 Sep 2022 18:56:11 +0200
Subject: [PATCH v1 13/17] phy: phy-mtk-hdmi: Add generic phy configure callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v1-13-4844816c9808@baylibre.com>
References: <20220919-v1-0-4844816c9808@baylibre.com>
In-Reply-To: <20220919-v1-0-4844816c9808@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Pablo Sun <pablo.sun@mediatek.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, Guillaume Ranquet <granquet@baylibre.com>,
 devicetree@vger.kernel.org
X-Mailer: b4 0.10.0-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_180015_880383_740024C3 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
index d4bd419abc3c..af46472237e0 100644
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
 
@@ -76,6 +78,16 @@ static int mtk_hdmi_phy_power_off(struct phy *phy)
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
index dcf9bb13699b..05de93f63a61 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.h
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.h
@@ -25,6 +25,7 @@ struct mtk_hdmi_phy_conf {
 	const struct clk_ops *hdmi_phy_clk_ops;
 	void (*hdmi_phy_enable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
 	void (*hdmi_phy_disable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
+	int (*hdmi_phy_configure)(struct phy *phy, union phy_configure_opts *opts);
 };
 
 struct mtk_hdmi_phy {

-- 
b4 0.10.0-dev

