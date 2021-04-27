Return-Path: <SRS0=NJpa=JY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71FA3C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 04:51:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD0EE613AA
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 04:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD0EE613AA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FiOUDYcMxMkt6CX8Q/opm5xcJ7TE7HqO4oHitrnBMl4=; b=CUgUth28ZHl34/L4Q8WonEMmC
	HK0yV2qFmsIuYUCzGFy8uxat6elHGqORYdYlgC9N9mtBxwYBQNnjCvXmZegda229i+cGiwG29N4ja
	jkj+oEYYOsO1OmK/u3jd/EwbVuu4poT6F6EXkrKsZaGLdEc49dUQc61YuSQKRgYSl5Ai0hRge4gjF
	WxEdM7xHj7rUUtheqge9kUDCuWy6OaTnfKvnb2LBGBjRgZAH3XAJizxHpMj5PotaZgPRRFnaCUlRg
	6X0uYmI/2LAp9tyoNMfMsSbgY3wLx1OtnPyAdBYBKE6yHiEFDgR6OkuSAF4b+7EbiHvD0bKBaaupY
	xGEIGP6Ag==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbFgR-000h95-4J; Tue, 27 Apr 2021 04:50:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbFfe-000gzQ-7t
 for linux-mediatek@desiato.infradead.org; Tue, 27 Apr 2021 04:50:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=gt4pb5bT5mW/MToENIuo4Jt8VqUlSnyGRgKvmw6yKp0=; b=ZHnMkUtTSOS55dsDXRwNsQpwbt
 h96yyJogAn6J9yTaUw/jU7Zbj+BC6g+EgoLf0NNUZ+l7uDE3Y0Ds7M5burfT3dWAp9K261TWE8z+z
 +GT8gCw/JIjGh0/WgGo3Nso5LszIvpIsYywB5wXyqdt3gOos/7A+txXq/ChkR89/JfYwPl3PO985V
 B9WeSYdnqjS0IXesRqdoaw9fBlA51TNLcxM+Wo/vQoI2JYTW0u/adfIabLvyAd1Ui7zYSq6P5HpwS
 DiO8friFrvXgum+etx/SU/L07ekCyMNbN8ot0ZaauzJXYJPU3lpur1Od7jxRtqyxe/DmB45ZBnlt9
 Ao4vkSvg==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbFfa-00GR6F-V8
 for linux-mediatek@lists.infradead.org; Tue, 27 Apr 2021 04:50:01 +0000
Received: by mail-pl1-x632.google.com with SMTP id s15so1765017plg.6
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Apr 2021 21:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gt4pb5bT5mW/MToENIuo4Jt8VqUlSnyGRgKvmw6yKp0=;
 b=c+K89QY/gVhAeVZ0+WRtE2V6947IE8xTms8pbQvd+uhFOHJ2x/QLZl0aO54BBy9N6x
 PKAshJvy/RwX8BXEYR/ej2DI9gs6jXQHgNoUnvesfJ/1BNnYbIKLNyWO1Sy/lViJxzBo
 TkXU0r6xkpSpA841HlW63vUTSlXIbr7Kf5iLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gt4pb5bT5mW/MToENIuo4Jt8VqUlSnyGRgKvmw6yKp0=;
 b=I5nXZEZSQzs/h721riW6cop9+6+qRseNVV8iJrf7rteXWLXquqoRd++YO8VmBbgAoO
 7ntMMa0gsEEvCV+BSRGz7oXoJzUsPwKudTsb0pMyR9+MgBGh6rbenOS7Y+YRQrAW/eqZ
 5dScZUqJoPrGnz+LgN3wjpjkdD0XFNO0AmVJoyyj1UBMtOhp6XeqQdsdKm/lDdq2zRAe
 MWlYanBDu7ZUT1Oaul9MhHQSqO/3gDgHk9V8ltufuMOlg22tDGX1tJwVIcsqXMgVhilB
 yecrXZ3yO6h43fwx59Mnj7N1IksGTi7V3pQ36y+A35bjKjQx4VGGGjJkdktb5h1dkFzS
 MzNA==
X-Gm-Message-State: AOAM531M5xYJkCUtq8IYN/IKuyzCglqmRczKmeWN5L8Vrhe+jbdL+vqp
 LrV+uJkTHTxNeOUkr0D9+XZUDw==
X-Google-Smtp-Source: ABdhPJy1BUt6+R21LCxa4D+U5Ie0p/vfRjiqUmnUX6m/JmeuU/QU2wgLbY7MTc98UD0cppxqB/jq0A==
X-Received: by 2002:a17:90a:b78f:: with SMTP id
 m15mr15823564pjr.131.1619498998028; 
 Mon, 26 Apr 2021 21:49:58 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:3984:c4f5:8612:6b3e])
 by smtp.gmail.com with ESMTPSA id c125sm1151517pfa.74.2021.04.26.21.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 21:49:57 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v3 3/3] arm64: dts: mt8183: Add panel rotation
Date: Tue, 27 Apr 2021 12:49:48 +0800
Message-Id: <20210427044948.12596-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210427044948.12596-1-hsinyi@chromium.org>
References: <20210427044948.12596-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_214959_007952_E35C8AF5 
X-CRM114-Status: GOOD (  10.57  )
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
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index ff56bcfa3370..793cc9501337 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -263,6 +263,7 @@ panel: panel@0 {
 		avee-supply = <&ppvarp_lcd>;
 		pp1800-supply = <&pp1800_lcd>;
 		backlight = <&backlight_lcd0>;
+		rotation = <270>;
 		port {
 			panel_in: endpoint {
 				remote-endpoint = <&dsi_out>;
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
