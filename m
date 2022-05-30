Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974D7C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 08:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XAwb6YLaxWjpLazX6K/6XVDHePJrfQRFlFoVQFTmmD0=; b=Atvy4Dr8Qpm/sb
	CCv3pKb9nVIzfYtoGPZZIAtN+JZk6K6IkR/wPiMte5bJSyb/JPCwzw07o3HMNRFDLHG628dKHwtTS
	oEMTa4vXX1IOfaIApx8yH7mK2x9I+Jl6+vib6CBD+tib1jf7fq3Xh0EsVSTMLqpBQeCbxbqba/43O
	60csEOWmCvVSunU4Mm6NzF6p/pM9FkaVt9PuxWj9Ukr+2teAdhaSeJ6QjcbyahOFnt1PSkmF8spJ9
	WMFoFS4bSB3CzzI55Y6qh8jjQa4D1Yg0XnG6+o5oaHoaE7K4XLW1Qn1zSqgQDah/9thhy1QoAY8TE
	w4ILT1GOq+Ej+pkrkhBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvadv-005tOC-Ps; Mon, 30 May 2022 08:20:51 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvacl-005srB-Il
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 08:19:41 +0000
Received: by mail-pf1-x42c.google.com with SMTP id 202so10004806pfu.0
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 01:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0FDANzoD+ved+kLqkfGfvHR/pdrWdYCkcffUnS1gfwU=;
        b=EGj3J9IVTCdQAdPBammRVILB8q1w15Xcl7B4hV147t6lruwgmdowastMDeg50FrM4A
         Ds9V3H86IryQlC6KV4iX5TGgLG04/0gOrc6j1Y31gCWhI534zZoCg93dEK211ACoOi5q
         2fxY2lyR/VS+yq2eiIqTUPtlHMbj067JlnVoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0FDANzoD+ved+kLqkfGfvHR/pdrWdYCkcffUnS1gfwU=;
        b=uFMU+pkBHv5V6O20WttTMW5LJv6yjAerWm1TSO2LmzrZJIijBGCOg3csVll2imVUSx
         10N7Hr9CIup5Tye7JgUgbQ27k2+nE2KOoTszGPsV6mTTRFro7VnYRAZaGfO3vV+4GDB6
         6M2uatVsHG8fs2/o8BNZwBshLOVkd6ybv3asq3qvnFVmySA0WwwHNHii3wiODpz8hHpe
         7/x31nakMZ/ZKB9qFcefuLznjrxqSwDUM7ErufOapgkl0Y339CU8iI7Xmga0QMKAQ0Cu
         zAvkT/8WoJKdfi129qSpZ9Z7+X1N3VBr/GbNRUJahynydDnJ+nz8Nm1oZZSQyHoi3vxg
         jgMg==
X-Gm-Message-State: AOAM532XGu7hyg2TRTrSzij1GM9j49UihoXOSguaQtwmbkmRlX1BP8eL
	PdXoXcfV6S6se7rmOGnpBXAo6w==
X-Google-Smtp-Source: ABdhPJxC6hh+IA2nmnrMvgr7EIZHEawv5NbrZ/B9hfbxzJ5J4ENWWvjvBaWIFpEhTfiwlYPQDqCDTQ==
X-Received: by 2002:a65:4183:0:b0:3fc:1370:9c37 with SMTP id a3-20020a654183000000b003fc13709c37mr4005861pgq.4.1653898777736;
        Mon, 30 May 2022 01:19:37 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:ae1c:3d63:abec:1097])
        by smtp.gmail.com with ESMTPSA id m1-20020a170902f64100b001618b70dcc9sm8537900plg.101.2022.05.30.01.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 01:19:37 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Simon Ser <contact@emersion.fr>,
	Harry Wentland <harry.wentland@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Emil Velikov <emil.l.velikov@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v10 4/4] arm64: dts: mt8183: Add panel rotation
Date: Mon, 30 May 2022 16:19:10 +0800
Message-Id: <20220530081910.3947168-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220530081910.3947168-1-hsinyi@chromium.org>
References: <20220530081910.3947168-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_011939_659487_D2941878 
X-CRM114-Status: UNSURE (   9.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

krane, kakadu, and kodama boards have a default panel rotation.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 8d5bf73a9099..f0dd5a06629d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -276,6 +276,7 @@ panel: panel@0 {
 		avee-supply = <&ppvarp_lcd>;
 		pp1800-supply = <&pp1800_lcd>;
 		backlight = <&backlight_lcd0>;
+		rotation = <270>;
 		port {
 			panel_in: endpoint {
 				remote-endpoint = <&dsi_out>;
-- 
2.36.1.124.g0e6072fb45-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
