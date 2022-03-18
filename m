Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D33C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 08:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lmZaBB1QArgNt1utMahx0Ty0Q7Ldk77/GzbdwdIn33c=; b=jLuh4ambsDgO8n
	vLMsDyBCUm3rM2QioIOclPtH1cWQBb3gj3vnCqCFCUhb6g3Mv4FCmajBGhyh+Zsxo/0805Y8GU7yk
	RdI0tt7fO7yz4L3pg/rKi4LXp2Mk7AzoJ/ikEPI3Oq+yLOxD9C9B5+u+FcJj4MGAuFhIcpHcZ4cP1
	9OuswgwfloNtLw6Kvr3+7af7oZOvq7KXHDXz1fbEPoI6VmuzILieXephrAcN/fkFOZPe6f1ni5PSC
	QCGwELu85TYlTyVZ0y/LegjFHPhtYG4DRHcxJRweSCexT/ZK/SbARPT9aCJXyD6yFmhskImtbdmLh
	UltlFYWQmqn/4O5aBJxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV80D-000nCr-6q; Fri, 18 Mar 2022 08:30:29 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV7zD-000mcF-K5
 for linux-mediatek@lists.infradead.org; Fri, 18 Mar 2022 08:29:30 +0000
Received: by mail-pf1-x42a.google.com with SMTP id h2so8882258pfh.6
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Mar 2022 01:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qYSHS1HMX6eMTWBoPQekbY/LnrHx+hVCf+4KGrQDYmc=;
 b=IFSSe8csUXjGGDosRHCGn3fO+VYoniE9x8J42lOZEudFDsNsV98ZesN6bj9YZHlSGx
 rzUUSNDgAqKWsCISlWsWoXZJ4+na9/zRejmLQtAxJeL750XBykhjuPYp5PtgjzXaioRP
 W6K8uKY7G1XRI6cPC4FJKf4UJipGp1a8UxVkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qYSHS1HMX6eMTWBoPQekbY/LnrHx+hVCf+4KGrQDYmc=;
 b=WuLHsteIV/tsmvKcK2qQtNMXPR3wBkcMNvOqSdZLgx+Z0KRPYIbITu0TSkRuI/ibVz
 gDMCT/PioJvQwiwZXPXRQ81jXVqvo6+QKAJaWcsB8opQcog0MWUxub+VpQiiKQYpopI8
 cln697u+KsdhTB4dL+DpAO8XkgMMtPVWyhn60ylOqRVy5cCBeGpWGYGIxfSZ6/1rn6nc
 EehxTaUjPkadf2cI49z1g7ozEvD6Q4LMxpuf5fOXGUnKyYsHVkn0dxN5/fkgMISjoXad
 +RK76fC2c6FeKThzR6fxfBRIgBfMSBRKH0tzcACVhYQOv3DH/hhlvvDoHiGvX3fRdTYn
 gXNw==
X-Gm-Message-State: AOAM530ObnEUknR6AW4cxFBB3m7WSdMzfMOJHiniO8QzQHe1eztp449Q
 tAyxpmK4+AigJk9ibZ9fW9N5mg==
X-Google-Smtp-Source: ABdhPJzDLKDOl+pmopyHHP4KLg/0fWOsTqeY58M7BYm1nfrAKzxakmXqooCP00hA6BSnGX9OcZh/qg==
X-Received: by 2002:aa7:8385:0:b0:4f6:ef47:e943 with SMTP id
 u5-20020aa78385000000b004f6ef47e943mr9052216pfm.38.1647592165505; 
 Fri, 18 Mar 2022 01:29:25 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:435a:ce78:7223:1e88])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a056a00084200b004f761a7287dsm9404044pfk.131.2022.03.18.01.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 01:29:25 -0700 (PDT)
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
 Jani Nikula <jani.nikula@linux.intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v9 4/4] arm64: dts: mt8183: Add panel rotation
Date: Fri, 18 Mar 2022 15:48:25 +0800
Message-Id: <20220318074825.3359978-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
In-Reply-To: <20220318074825.3359978-1-hsinyi@chromium.org>
References: <20220318074825.3359978-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_012927_674489_74CC13B1 
X-CRM114-Status: UNSURE (   9.24  )
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
index 0f9480f91261..c7c6be106e2e 100644
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
2.35.1.894.gb6a874cedc-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
