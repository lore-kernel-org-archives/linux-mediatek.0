Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCFCECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 18:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VIAi0nNwF0EQ4Ycv099voA35UIwgAD/zCbxE9L3eFBQ=; b=U9TrJDkSuNnNJuTVAnoBKADQgm
	wAwzOvaT+/h9ouoNsrssC/A2QJjkY6tuGU9xdTuxdJvWvSm+bpVvapZSF6U8mvTpWJME/HwiQvrwo
	ianyx/THdfT2b7ECgS6SZgczQ5kUljgYPdXCL1JYEt7SZy6x8u8kB9K14FFuV2+8/FGvVbT1uRFw1
	hguKQyJut5G0OiNm8rLsQ/JZchaHhQ2tpFUsZXIHR89K8iru/0XkTK9Smk/1x48Z4QzfgIez3FFwR
	XspJhVAGtnh8QR/fGk8nteWr6NYJqcVLPO97uO4x5sY33ejADz+IksEMPBdFSv5F2W3ZC9mYn4M1G
	A9cC1Zjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaL4M-00DU11-O7; Mon, 19 Sep 2022 18:00:34 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaK7Z-00D4Im-CT
	for linux-mediatek@lists.infradead.org; Mon, 19 Sep 2022 16:59:53 +0000
Received: by mail-ed1-x52f.google.com with SMTP id m3so80179eda.12
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Sep 2022 09:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=VIAi0nNwF0EQ4Ycv099voA35UIwgAD/zCbxE9L3eFBQ=;
        b=R+qQPnPqizqQy0t3jkiLKwfr4K4/dgarwPfFttzlNb43E4o78izHqlKaHUTtF5L0aX
         U2rW7VDjsEC3GyuX7FFwe1iKr1B4FC7xjZcFh06+y0ryXl2F/GrkLLm1obnIhZPXlqL7
         hPJoE+3Rb00pJAWDNwRcizomgd5BsFP4RIF3WmuztmNQRO3lPH435EjKkezKb6JjjiFm
         +D7J3psGA0bhm1mdY2z/1oZ4WG2QYmi+YfIloXmbs1HtYN7LY1dMPOfFPG5+1SH3EjLd
         6WQPNGdX5ebzgk8mDgJXkf0TTio5UuUFR8R/cQCrHXJKjw3iFhqEji1Adg9w2agMIAih
         tkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=VIAi0nNwF0EQ4Ycv099voA35UIwgAD/zCbxE9L3eFBQ=;
        b=XlchrUbO5ZldkjM+7cG51w888eT2+whlpeP/uXT+GEmzTFVxNZ8pxAw7kjHt2bDq3J
         Qc0aQYYwxH3REKPICtUEWjCbnvDCx6H59eXxgQGJYYGtW52Bmyh4SGK9q1/8PFUMkdRA
         JmuEIDWu66nps/LT9Lsb+g9Vcd9MrLNawxdhvL25m0MS04BDNXM1M8lpmjcA+gfiguoj
         vMpP34z87aRkWCTyqURxzgTpYjHVOI+oIPrWhxAvyhDK+eAND0BaMsDSUFv64ZbMtfak
         mcl178+zM0Ry2QxbsEhNs8xeYrQBS5gv8/c4BDUaGoKiA0o46fkFqSdWdG/Qi0oaLzME
         k2xg==
X-Gm-Message-State: ACrzQf0U1oe8gekPrbg3CpkvYnpIvKR4oHzTnvWpiWeb2dZCcDV3gdhH
	eSpLo/nzQSaL+UfNto6y6cDLmA==
X-Google-Smtp-Source: AMsMyM4FWcGqIb04fz++aRLharY4kKuVTi0otIV+l0WpEp9ORTAl2Z/yp1vEqg/lPBMW1Gcd0sxy3w==
X-Received: by 2002:aa7:c585:0:b0:453:e1c6:7dc6 with SMTP id g5-20020aa7c585000000b00453e1c67dc6mr6810316edq.245.1663606785020;
        Mon, 19 Sep 2022 09:59:45 -0700 (PDT)
Received: from [127.0.0.1] (2a02-8440-6340-f287-3074-96af-9642-0003.rev.sfr.net. [2a02:8440:6340:f287:3074:96af:9642:3])
        by smtp.gmail.com with ESMTPSA id cf16-20020a0564020b9000b0044fc3c0930csm20424246edb.16.2022.09.19.09.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 09:59:44 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 19 Sep 2022 18:55:59 +0200
Subject: [PATCH v1 01/17] dt-bindings: clk: mediatek: Add MT8195 DPI clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v1-1-4844816c9808@baylibre.com>
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
X-CRM114-CacheID: sfid-20220919_095949_481831_72BB7E29 
X-CRM114-Status: UNSURE (   7.29  )
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

Expand dt-bindings slot for VDOSYS1 of MT8195.
This clock is required by the DPI1 hardware
and is a downstream of the HDMI pixel clock.

Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

diff --git a/include/dt-bindings/clock/mt8195-clk.h b/include/dt-bindings/clock/mt8195-clk.h
index 95cf812a0b37..d70d017ad69c 100644
--- a/include/dt-bindings/clock/mt8195-clk.h
+++ b/include/dt-bindings/clock/mt8195-clk.h
@@ -859,6 +859,8 @@
 #define CLK_VDO1_DPINTF				47
 #define CLK_VDO1_DISP_MONITOR_DPINTF		48
 #define CLK_VDO1_26M_SLOW			49
-#define CLK_VDO1_NR_CLK				50
+#define CLK_VDO1_DPI1_HDMI			50
+#define CLK_VDO1_NR_CLK				51
+
 
 #endif /* _DT_BINDINGS_CLK_MT8195_H */

-- 
b4 0.10.0-dev

