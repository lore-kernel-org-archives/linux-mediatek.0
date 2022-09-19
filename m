Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D84C54EE9
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 18:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pe51xvlTzoxvP1PkLEmQi5YJGHaBQkqHjYX/h+KRrX4=; b=m6n+EOKekG+s6hTPq74JYvOAaZ
	HDNT/OxxKbZFnosQVmw6JFmv82pPWi1Rv9l+s0zL5xOqh4PvPrwam89LXXoKzIA5Ixytx/ss/wGR3
	1YaFBHM+MD+LumQL2zZSrXOGf72oi2sLiYY1xXS8ZWEB0tiTqKviTw0RZhbYhFTokNXh+UZKOGkoQ
	prEqOLiqVDs1gTpf/S86R8copNtY9mEyixDPJqeKQXH0gVjURSIvuY41Y+3m0c+QUO0yeYvpgwyws
	0z6Zbjwx95qtIrP8iUw0bvQ8GScL7K15BYY0YeSM/9pDfad2hCduEzsTTEYoAAQhShA5NjvP8OxGq
	zacDRotQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaL4V-00DU6y-73; Mon, 19 Sep 2022 18:00:43 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaK7Z-00D4JM-KV
	for linux-mediatek@lists.infradead.org; Mon, 19 Sep 2022 16:59:53 +0000
Received: by mail-ed1-x533.google.com with SMTP id e18so154299edj.3
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Sep 2022 09:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=pe51xvlTzoxvP1PkLEmQi5YJGHaBQkqHjYX/h+KRrX4=;
        b=B+X1p1fH4JpGs34rfSwYzzSHzwu5qnL83GcremhYxa34LPTfzyuT54Qx4NkUrP80pu
         pQuuF2QUVoy7vzZV3h6TrERow//gfDL5XfrnuPPuhc+B4RHI2qc+3ex/jWKQ63RA0DfF
         hBB0zWcx0Lk6XvWHsF7Jch4RHJgIiSY2LK6gxuWKN/rgLWdkiQ6mLPjpWh4cz4AHHPtT
         pC4zGQhthMR+WPSyxbXBMc3qQw3YfboFI7Q7Yy9Bgo6ddHWkCSfutvSn4/NE2FUgXx1e
         NM29wYa2a+PX3vs2XgVJk1y+K5rnO2tGCxRjBGuogh3F3cFoZXeNpiG1Tcq1hcgaNJxd
         w1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=pe51xvlTzoxvP1PkLEmQi5YJGHaBQkqHjYX/h+KRrX4=;
        b=ppFsiJcyNQaUX4RHXwracrl5rFvw/j668mosgV/ZbzduXGFxaxCZsC3OG4ZVVr928/
         /y1Jk9pJr7U9DsRtyo3SiWMKlvr7FZYoc2GLDHY8xwFJbGryew73YGuN5fzq5NzFxnDZ
         18AefgHq8QA5l2jY7chbzw/H2Viv6+1KVMf6ON4ApdTYXGoRwKbfIwmsXbu0LYEi8ltD
         SSL4HES99mTlmp45w4Q6n1kQTQblfWhrJ40pBIWSegrTr/A6ssA11yVeAUFpBvYoRbxu
         8pZ53h8CTYtWqgz+yJcAPoxOm+Ys5ib0f2mMj7GN3ks0XAxHj53YoUWrkyBC39GVIgjN
         CE7Q==
X-Gm-Message-State: ACrzQf3SgbEV99Zg7QRImgdYeq5E4PugyRQ2uEgNEen6L2c67KHmPyPz
	5qWFfhs5L7HYemvW5Eu22dwFwQ==
X-Google-Smtp-Source: AMsMyM4Kcqj7iaeTFSgnPboPDJcmYDvSGBzBAfopbwGlsGHAlwhMCX86GfBtADSsZGEx5aSm5j7eEQ==
X-Received: by 2002:a05:6402:2b8b:b0:43a:5475:f1ae with SMTP id fj11-20020a0564022b8b00b0043a5475f1aemr16246555edb.363.1663606787204;
        Mon, 19 Sep 2022 09:59:47 -0700 (PDT)
Received: from [127.0.0.1] (2a02-8440-6340-f287-3074-96af-9642-0003.rev.sfr.net. [2a02:8440:6340:f287:3074:96af:9642:3])
        by smtp.gmail.com with ESMTPSA id cf16-20020a0564020b9000b0044fc3c0930csm20424246edb.16.2022.09.19.09.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 09:59:46 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 19 Sep 2022 18:56:00 +0200
Subject: [PATCH v1 02/17] clk: mediatek: add VDOSYS1 clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v1-2-4844816c9808@baylibre.com>
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
X-CRM114-CacheID: sfid-20220919_095949_717849_9A8D59DF 
X-CRM114-Status: UNSURE (   8.93  )
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

From: Pablo Sun <pablo.sun@mediatek.com>

Add the clock gate definition for the DPI1 hardware
in VDOSYS1.

The parent clock "hdmi_txpll" is already defined in
`mt8195.dtsi`.

Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

diff --git a/drivers/clk/mediatek/clk-mt8195-vdo1.c b/drivers/clk/mediatek/clk-mt8195-vdo1.c
index d54d7726d186..835335b9d87b 100644
--- a/drivers/clk/mediatek/clk-mt8195-vdo1.c
+++ b/drivers/clk/mediatek/clk-mt8195-vdo1.c
@@ -34,6 +34,12 @@ static const struct mtk_gate_regs vdo1_3_cg_regs = {
 	.sta_ofs = 0x140,
 };
 
+static const struct mtk_gate_regs vdo1_4_cg_regs = {
+	.set_ofs = 0x400,
+	.clr_ofs = 0x400,
+	.sta_ofs = 0x400,
+};
+
 #define GATE_VDO1_0(_id, _name, _parent, _shift)			\
 	GATE_MTK(_id, _name, _parent, &vdo1_0_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
@@ -50,6 +56,9 @@ static const struct mtk_gate_regs vdo1_3_cg_regs = {
 #define GATE_VDO1_3(_id, _name, _parent, _shift)			\
 	GATE_MTK(_id, _name, _parent, &vdo1_3_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
+#define GATE_VDO1_4(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdo1_4_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
+
 static const struct mtk_gate vdo1_clks[] = {
 	/* VDO1_0 */
 	GATE_VDO1_0(CLK_VDO1_SMI_LARB2, "vdo1_smi_larb2", "top_vpp", 0),
@@ -107,6 +116,8 @@ static const struct mtk_gate vdo1_clks[] = {
 	GATE_VDO1_2(CLK_VDO1_DISP_MONITOR_DPINTF, "vdo1_disp_monitor_dpintf", "top_vpp", 17),
 	/* VDO1_3 */
 	GATE_VDO1_3(CLK_VDO1_26M_SLOW, "vdo1_26m_slow", "clk26m", 8),
+	/* VDO1_4 */
+	GATE_VDO1_4(CLK_VDO1_DPI1_HDMI, "vdo1_dpi1_hdmi", "hdmi_txpll", 0),
 };
 
 static int clk_mt8195_vdo1_probe(struct platform_device *pdev)

-- 
b4 0.10.0-dev

