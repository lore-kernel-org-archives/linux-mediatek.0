Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEA5C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 11:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XAwb6YLaxWjpLazX6K/6XVDHePJrfQRFlFoVQFTmmD0=; b=teYiqzrZnOC5/H
	nXYfftmV1fE5OD6481dD2nxsCTuQ13qN2soWGmNdvOpVa9ujnABdf5TtTbMXGPH81gPmveCUcJp6l
	xltVAb1iO0Zx5DxU2xxwWSvd/0lr6cmizKVEj+l2wUkJ/MoHN2VXPKgUE+Cl9heXh+tlZAUExX9EC
	fqJ4+0cIC/65iQbHpO1kaJJChyLVulq3DlS/wLdd0wkC+nXzwQ1ISTuIkMVCYjjxP+o8snyZKF8p5
	BqFWSilFrVdbfgSEQuzP5vvqb30TyFqXGWjjjIRXR0EYt7w7veJJaoYWPxJoi8QjMbQgBOKcAZlhy
	vbkrSir1PeZoPmzwitmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvdc1-006Ljj-Nb; Mon, 30 May 2022 11:31:05 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvdbf-006LaH-WC
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 11:30:45 +0000
Received: by mail-pj1-x1032.google.com with SMTP id o6-20020a17090a0a0600b001e2c6566046so4251585pjo.0
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 04:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0FDANzoD+ved+kLqkfGfvHR/pdrWdYCkcffUnS1gfwU=;
        b=Fu3f0elDLJOB2qbC/WiNHHrnzhkyIj+M6hmuWqiHDK3vOkYLQvzCSrr7LVh4m3XTYw
         zHYE0cnTsfWTDpSMBzpspezMLKffVInpKtx6Q6xL1bYNG/62ysHWflZJ8iUZZwz2DmLa
         LESrtBQuLJ1bR/V4bpVZuA5UHrSfe0QY1yOHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0FDANzoD+ved+kLqkfGfvHR/pdrWdYCkcffUnS1gfwU=;
        b=Lj/tYohoxtmOSy9Msf9Re9dGuN26MbOThekdKTR3pVilzng5ya3zo1lZnp/mcU9ZnT
         RThiIPpqxEucfzkXQ+Wi2+EU6JLPKVv3xY79UOvLujnDXQbd80we1WTgvZ2e3SPhuQAH
         9kD+hU0S9u0jtOt1RYsbStQcFMu4w+9Ayy9LLcKyZkGgZOS+vG39DO0zihWt6eIdEMut
         8qPGblB/E0xBy0Ipy6S2FciNEBX+iU4kPYtQM2u2CbeES2L4+B6YzitPgFKLO2vn+UsC
         PIniHiSSTDbmrUGkieEfCz5rZtJcWs1pFUxZvI3ysrrqir/pShd3fauwYFczp5s5zJNp
         7/fQ==
X-Gm-Message-State: AOAM531RFVY64DVbINmwDqaiqWGOCNOJiuQnHPcJy1jfkCWqoNwZR6QV
	dxJfkC8YP0MTRB7w/kwYfhkOHg==
X-Google-Smtp-Source: ABdhPJxub7eHxeB4mlpr+M6AT+c0bGpa7kjAzy63YjDOWYW87ck7sC0r1LTX1UfyD0/ZFy7H+5i/oQ==
X-Received: by 2002:a17:903:1c1:b0:163:ef7b:e11a with SMTP id e1-20020a17090301c100b00163ef7be11amr2002458plh.76.1653910242646;
        Mon, 30 May 2022 04:30:42 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:ae1c:3d63:abec:1097])
        by smtp.gmail.com with ESMTPSA id o3-20020a654583000000b003fa5b550303sm8384222pgq.68.2022.05.30.04.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 04:30:42 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Rob Clark <robdclark@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: mt8183: Add panel rotation
Date: Mon, 30 May 2022 19:30:33 +0800
Message-Id: <20220530113033.124072-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220530113033.124072-1-hsinyi@chromium.org>
References: <20220530113033.124072-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_043044_096673_FE9F326C 
X-CRM114-Status: GOOD (  10.27  )
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
