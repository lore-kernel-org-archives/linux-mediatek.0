Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8DCC4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 14:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFmw2QUwgoo6nZ5hxL4W4XLY0gvCpX+AxZ6V2ssaQtQ=; b=0rjZFlzHICI7TUjcKZo614mGSb
	9ORfA/JMjUNMv5UnTYhUjNNO6vym17mn+uTloqT1DhWsnn8e9AZ/brJUc7vp99vq8WQDA5fQVpeqp
	XuJ3pGwf7mCkbIsVXizD2h0P7G9hb1v4/x96I76TpjRlZKKpeZ6oGKmOflivnp+EBZeKyoKTbRdRx
	nTkcAa/TxnKuFCV6kJFTGIBXB5IK/sxPAJvJoafZosgFENHvSr36KU2GYFzjlEGQAbLlTshpiaMjv
	TyZe4mljLNyQCtemCOv5RBKZHMkraw8bK4/xjIdoUaFlpyfFeCje2hZGodGfJGrM2ziFiTtmyVUiq
	9Qge/d1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSas-00000002ZG8-1RuE;
	Thu, 18 Apr 2024 14:18:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSa3-00000002YmX-1O2n
	for linux-mediatek@bombadil.infradead.org;
	Thu, 18 Apr 2024 14:17:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=hFmw2QUwgoo6nZ5hxL4W4XLY0gvCpX+AxZ6V2ssaQtQ=; b=hpv0QyeHZqODHZzisd8+/nl7e9
	KiQXCTj4HJ1t0cL9LT+MOtT7zG68B+G2NKmLd6vDacSGL/d8YqFBEy7zlWNCcGTzOztD6n6s6cB1F
	5CsbgX2592b8EHZnVM5Q3scR6AixLQ/rfSscxU/B6aaun8gmobjF7sT2YdTRlIBj/tSdkSFj2A5mn
	cDP+lob5nlCsB9Hkwhjcibaz8s74Cn48ctUUKPx4PuufP+odvYl4AIsD6MPaNTJKGLzE22/eSjifh
	S0brCgpCksX09W/AJh4ssYC5jkZ/4TCq5wIKF8wXAgIAfPr9LISHsrBaWjl/iYuEtqiTP70l5aWZW
	YjvRycmQ==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSZw-00000005Uue-3B99
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Apr 2024 14:17:38 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-418effbc5d4so3220075e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Apr 2024 07:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449851; x=1714054651; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hFmw2QUwgoo6nZ5hxL4W4XLY0gvCpX+AxZ6V2ssaQtQ=;
        b=lERMhsPkGzEAmDymkxW3lIyo5QPYrXyYoB6hNtxs1wsIOFiI8UToS0qrQW08TZ2ztu
         dDJgSQxvNcdZqeVABUd9hZkXDJaMzhz2W+ZCDwDzuRYWChKjYesB05lKWi7bm0xrdNd3
         vR/NdomPTNanzVdQWAEMdeDkeqn38DV95FIOx6aTVwSHFP4icFrGAi5hqn50eyv5avGA
         4+ZXY9vSLigNC052agoiocwvYUmfaHLWVs6U3ZZzTbSMwnsLa6T+ZUm6Zn/1LL+RtOxe
         CN8itw/TTK5n9LMynHBCTmUuX+AtIxOwFQYtvRz15c7zpok3/dvyOEBQN/Nb+zuP+cWm
         rHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713449851; x=1714054651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFmw2QUwgoo6nZ5hxL4W4XLY0gvCpX+AxZ6V2ssaQtQ=;
        b=ZTt0tP/pKz0Q06DeMJX5bCleMDlKUEqsuYgK8wuPZvDlqACeJINoSeMYW25WNMAx4l
         53vl06Xtl4KmnzylBdlFazr0eGLCJE+sItpxAzdu6DJGrFT+CNXs/1qvthg7Hb8vlu1i
         WSBEcdbwlERvoWFTYYgfrpDJKb3zKCMz/UBwo95g1xtoubDNUYZAb2CgxvqOdJHFVW7j
         6oAVys7OcR4GJEW6+IcelYtlswi0HFm6+VZZ8INtTem3/oeBLUGw4mCqV/W3C1nlxM6V
         vKmyS6UkSeeVtYQ2yRVXBM2qysX0yGGS7mnJ/QoWJd8quY2CMYRY4/utKc+A43PvWXy+
         Ju+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxIMHkJHZET1xL0vN4BAHAcDTB54GJApEcW+iPS/nwsgl8D86k4wW0ZMhW5tvd/WfKKsvXBKcMDKDvIRsnyvfm5BBPorKL6EwsccbJze3iW8W8
X-Gm-Message-State: AOJu0YyS9mJHOd7s7D0PAdEqP8ESAwHXtt49MBLmmBfzDw/EPaCZ9j/1
	kTucLjbHFofHoAHntn9UvWrxi60xgik75AXpbGvGwNSOU3Vq7xXI5wdFPCBMVyc=
X-Google-Smtp-Source: AGHT+IHtNCO0sT/PuF83nF5pCjl0HM21KlAZ3i4WM1ZCheFdqhUBy0/ydJhAL6oh54QPdztAbJgG4Q==
X-Received: by 2002:a05:600c:45d0:b0:416:902e:51ac with SMTP id s16-20020a05600c45d000b00416902e51acmr2889189wmo.39.1713449851402;
        Thu, 18 Apr 2024 07:17:31 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:17:30 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:17:01 +0200
Subject: [PATCH v3 13/17] drm/mediatek: dsi: Improves the DSI lane setup
 robustness
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-13-53388f3ed34b@baylibre.com>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
In-Reply-To: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=2MnuLxaHZbaJPVARTKFt1rzwpEZuIuXZwcM1ZfvOkrE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStjyt1Phgb317q5nDWLxlAExPeDpj0mMTjN61F/
 BDu61hiJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYwAKCRArRkmdfjHURaLPEA
 DD28UlYK6wanAEBb+/8HdIb9cDlvSkVu3mDiWADx1o/swuPpU9jbjySikAfXKlWCxzTgzT6lutDaj4
 vIwXpt9XbpZrbPOG+Tget6ptvQdD56G/OEcCbmm1YcvFVbkzXPdJ3vVQFPqVXskpbigxF5lnTntCAa
 FJQBnbFS30JMcTpBUpIq4SqW3JtxAioMKYcOfbpuv0JJjDgMImsgZ2NqsTPUUgXkgHU9pqUicDNziB
 tACcMWlHs8PPuZS6x2RqA7e0/EfBHs34gTsyTqkpHBRT73N831a+A5oE9kND+dcMxjwlmefeXMOww6
 4gQ1U2T7DSkeS9yTVYR8AsbEM2cBnbhFXUw2c8v3kCwjdrNxllliUSuR1dZnhNMUbd3rmtslBJPuIn
 PEUcsmJemYKuYCBtvx1P/a46vhGIOLSpJnjVsfnpC7jR7i/JQnirmYHsrdfDs2mG/tXihgWSq+4pMq
 7dyFGV0egvh21DBo2c4YFPzgoOhrGzEqsqStXbC4VLcRpewhHVww3ZPEqrx+WEby4Cyxl/W/VCSRnU
 rYMfrRhVr8zR2tUwjXad+n2EMdD7qeI/xHaJHhfjOEkhi2VDhj0pA9qUpXhWYd4XxabIlQYtF0gP2+
 44HrHaDC6UD1n4NL298nlac7LHpz0tj5kGjXtmURjGBcutBuiak9qpaBctZw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_151732_837602_8B546AFC 
X-CRM114-Status: GOOD (  12.11  )
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

Currently, mtk_dsi_lane_ready (which setup the DSI lane) is triggered
before mtk_dsi_poweron. lanes_ready flag toggle to true during
mtk_dsi_lane_ready function, and the DSI module is set up during
mtk_dsi_poweron.

Later, during panel driver init, mtk_dsi_lane_ready is triggered but does
nothing because lanes are considered ready. Unfortunately, when the panel
driver try to communicate, the DSI returns a timeout.

The solution found here is to put lanes_ready flag to false after the DSI
module setup into mtk_dsi_poweron to init the DSI lanes after the power /
setup of the DSI module.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 9501f4019199..b3f33d4d3d5c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -642,6 +642,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	mtk_dsi_config_vdo_timing(dsi);
 	mtk_dsi_set_interrupt_enable(dsi);
 
+	dsi->lanes_ready = false;
+
 	return 0;
 err_disable_engine_clk:
 	clk_disable_unprepare(dsi->engine_clk);

-- 
2.25.1


