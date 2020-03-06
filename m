Return-Path: <SRS0=MFJx=4X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A020C3F2C6
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 04:15:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 436DF20870
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 04:15:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uyRG/7n4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k1zGsGNc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 436DF20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yu59nE/F1KnK12hZKXy1KeEI0hsu4mUEp1PtJl8QYGU=; b=uyRG/7n4OtYzTm
	pNr8VAQyANBJhAVW8nhl5xvQCoM/L9ot/ECksMoVEZDYwBTTSyAx31qZKJNyEzUcKhxswS7QPsz6a
	+GDd8013L1FNxVKbL4U9qSYrvu37p0s/ftgQx0VnmvYmkBL9AJhlfjgh/8Lp+siUem1n2BkuUhs8f
	3FoEpDQTOQDGIwSYby4yISdvlcBlsxTbq/5bX8ql41N+I5w6FvEErdPhw87vEWSRqyuwC6dNu6ZTD
	7R36ivgfkijbTyIMNMRT2MPKmwyGYucPIDnVG3L9ZCxrKvGyd5V9viQ37reZGGW3mxcCyTh7PfQXr
	8oqtKj6/RDFY7zyt3V5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jA4Nv-0005mn-UI; Fri, 06 Mar 2020 04:14:51 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jA4NB-00051o-RF
 for linux-mediatek@lists.infradead.org; Fri, 06 Mar 2020 04:14:07 +0000
Received: by mail-pf1-x441.google.com with SMTP id y21so458469pfp.1
 for <linux-mediatek@lists.infradead.org>; Thu, 05 Mar 2020 20:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mZHNTw4SE3kOWwVknWFPKUrQ1ZVeKTfbVBIEBgdbJEY=;
 b=k1zGsGNc2op5navHqJUmfJnlqXF2SIMxGwKXMlUCnXt9rkmSdDX6Pvp4QwBWTph7zW
 UmZDgjq/YJN+aB8K4Nr8Yjp6Ctzbra3GsGawt8s/1cy9kNUlxDtcdmKYSdzYOc2ozAwR
 z7EIT/2t6q/nL/wYBvnleCud6PBMt4qDR3dk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mZHNTw4SE3kOWwVknWFPKUrQ1ZVeKTfbVBIEBgdbJEY=;
 b=oba8ZmiejVK2Mqu1g1guy0r/Dy/MQJ8KqDW/nCms9raEuBW7+5IEXqCvaVtB6jwpOE
 D+XJVuWQrFfPCozj1zYIe4AzmSqZn1wsK9riF0IiBJo0d66ZFk3OhvtvGZP0bntEYrGW
 w1TwmlbpCK4uoG60KshUlY7xkaqfQI8uzLOeQmNEbvHiEPh5Cthz2U7zaJsL7tREedAI
 vuCoKIX3yvCya6Z6czDwzede52/1POvQpLSbbh4T7BN3A5h+2EGtpRYY3FZQ+P71gj6I
 g3EoDCWAtUxNbX8Qg3JvrgON78/hTLY+5s9OAmvGdIcjJlJFnWOIcLwGsf73+DmX8WOE
 2Q4w==
X-Gm-Message-State: ANhLgQ10XFcDOaiDRrOhcJgZv0pTEwFnUcBBVorXZAq/qmOYo5X0kIX4
 GkGo0CYIBJRDiUxw/RNT6LDtvg==
X-Google-Smtp-Source: ADFU+vs/j6aQZZ/8TpvTzBDFwv9bk8b1y/hiw7ywm2BIyvth3q+IirQdvmZj5kxzLWmMLEiAVTW8yw==
X-Received: by 2002:a63:3142:: with SMTP id x63mr1455866pgx.138.1583468045232; 
 Thu, 05 Mar 2020 20:14:05 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id q97sm6295025pja.9.2020.03.05.20.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 20:14:04 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 3/4] RFC: drm/panfrost: Add mt8183-mali compatible string
Date: Fri,  6 Mar 2020 12:13:44 +0800
Message-Id: <20200306041345.259332-4-drinkcat@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200306041345.259332-1-drinkcat@chromium.org>
References: <20200306041345.259332-1-drinkcat@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_201405_981656_D1678A3C 
X-CRM114-Status: GOOD (  10.30  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Nick Fan <nick.fan@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

For testing only, the driver doesn't really work yet, AFAICT.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

---

v5:
 - Change power domain name from 2d to core2.
v4:
 - Add power domain names.
v3:
 - Match mt8183-mali instead of bifrost, as we require special
   handling for the 2 regulators and 3 power domains.

 drivers/gpu/drm/panfrost/panfrost_drv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index a6e162236d67fdf..ff76b29b373e105 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -667,6 +667,15 @@ static const struct panfrost_compatible default_data = {
 	.pm_domain_names = NULL,
 };
 
+const char * const mediatek_mt8183_supplies[] = { "mali", "sram" };
+const char * const mediatek_mt8183_pm_domains[] = { "core0", "core1", "core2" };
+static const struct panfrost_compatible mediatek_mt8183_data = {
+	.num_supplies = ARRAY_SIZE(mediatek_mt8183_supplies),
+	.supply_names = mediatek_mt8183_supplies,
+	.num_pm_domains = 3,
+	.pm_domain_names = mediatek_mt8183_pm_domains,
+};
+
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "arm,mali-t604", .data = &default_data, },
 	{ .compatible = "arm,mali-t624", .data = &default_data, },
@@ -677,6 +686,8 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "arm,mali-t830", .data = &default_data, },
 	{ .compatible = "arm,mali-t860", .data = &default_data, },
 	{ .compatible = "arm,mali-t880", .data = &default_data, },
+	{ .compatible = "mediatek,mt8183-mali",
+		.data = &mediatek_mt8183_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.25.1.481.gfbce0eb801-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
