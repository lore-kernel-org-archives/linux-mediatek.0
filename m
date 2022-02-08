Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190C9C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 08:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KIFdOQIlirkAr25LcG203jsy89yCPFod7Ze0Yc1QhIM=; b=XBpUGh88jKwG6B
	+BiLThBBcMH28Y1R6NeLzgf1W7mEzxUbnasDow5dPNu9+HA3IZ/LCnSrVDy8tF6S7aZBq0XA8zEcl
	WJ+vt9xN8ZSj+CONAQnN0AxFK2EGnQEjowTyMr5KkSaD2kp0p6TKvQ0bUCfzSdwLEvq2fh07LViQN
	3R+ng62aRr+N7L02Ts33mv6x+W+lG66gtBNsyD/XYZU3xjqX4RpFOywFeZEmYpax8OjnWki7BJgRT
	VEdInr83Upmkmdkx8fLqqhJq1bkDQA1N4sDZZXlDQQ/oVku+C0tmN7BX1MSRAzqpGkdJxpwzD1h1t
	z/7DJEooed/sJ6FYG6Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHM6Q-00D2p0-QQ; Tue, 08 Feb 2022 08:43:58 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHM5H-00D2AO-9C
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 08:42:48 +0000
Received: by mail-pf1-x429.google.com with SMTP id e28so17694233pfj.5
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 00:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RKltf19DtHiRc15a3iaZ/NnDb+6ppKujiVxWZQto3YU=;
 b=O2UDOpBeBJRbX3+DaQG7mIxxaEO05L1HTD48WquGaDuYWsSttm9JTTNF7a+lc8KdMj
 tJRuDchff9o48V7UXFNQVgoxZ/rNJPLVl8KQxtPWFS7zVK0sOis64KFrKb3J8stVpjkN
 Pk7y7Sj69FXDSqgG4hJ/qiPJrJRpnz6L6YEME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RKltf19DtHiRc15a3iaZ/NnDb+6ppKujiVxWZQto3YU=;
 b=HmoYUGcv/EhdsO/WJijCHy8se4mR4JIR0jPUJ1uqxtG1oQqvLGbp2UK7RdesQJdTaP
 7xWkfMi9hqhd6or7A6MVd8QNDk/AC1J3QMcmbVb/TlAlLX1GW2ZSWqJ9+u5vxXT3nijf
 N28ZwFX5r3Y+VXyJIpPqwKC9iOibN8I5Zh0PpkhC/e+GL7KGu2a7/dDrzAT9kFeqYtRJ
 rh6K7LQQLnoAx1F7ywQxJX9xd888FiNpE1Gy7EINPc5a/CEUtzxSy2yO0o1INUB1rjbY
 ZFXpK8pdg/mtz+gIbhNaOuNnJtqmnc3zFyqKdeabIUFNUdRcXpwtsW5fuL9ipINUstGn
 CT9Q==
X-Gm-Message-State: AOAM533ZJUJR6iYzjRPQKRT7fNlbNEU2OIZ0S47+H3JbXfqy4d1ey47r
 47mFxnGdvlTLXqlSUq3UaEGZ9g==
X-Google-Smtp-Source: ABdhPJxJuhyNGgn/8M1tkfbfnImy5ANlW87FCMT9C5ygmikEd8cwYFifi2WHJ+zYaY+iMKeTEIBo9Q==
X-Received: by 2002:a63:2ad6:: with SMTP id q205mr2651010pgq.46.1644309766435; 
 Tue, 08 Feb 2022 00:42:46 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:7d9a:166e:9d34:ff4f])
 by smtp.gmail.com with ESMTPSA id m14sm15362390pfc.170.2022.02.08.00.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 00:42:46 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Simon Ser <contact@emersion.fr>, Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v8 3/3] arm64: dts: mt8183: Add panel rotation
Date: Tue,  8 Feb 2022 16:42:34 +0800
Message-Id: <20220208084234.1684930-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208084234.1684930-1-hsinyi@chromium.org>
References: <20220208084234.1684930-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_004247_352201_93E09365 
X-CRM114-Status: UNSURE (   9.95  )
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
index b42d81d26d7211..d29d4378170971 100644
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
2.35.0.263.gb82422642f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
