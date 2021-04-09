Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E03C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 04:54:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C29261179
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 04:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C29261179
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EQUcD/wRb7qUi8KggID3VEACK7WuNvDElDhCo5bZf1w=; b=Ep8xs1Dx2ukhIUOpjroBk635f
	FFvSNER0nY1nFd/nOoC7supn8kgXy0hB/lkM4GOEKvBKeyLF5LEbKNqjlo+goDepNyyxUoQKLvGWP
	RtQlyrbUn0Q/yGcHJemZanin/CjyLHZ4JHfOkbJ7JJ5T7jySshcNemNjD3jd2rd445MvyB8+QOGOt
	iHugvnNGU2/jSy64zTRQvqAc8V+pxW0EACh/v1MzfSeGGkhhT4FVXdnC6ewh8N824CcYDOUqqHFK/
	yUSWfh4N04xbr6/5P1FnIXo3dqEHvr/YxMuk2YXJg9OqYDEHhYTEK1waV1M78oiAiY5qFrbBST2aX
	RbS96Sfig==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUj9y-00A4eW-54; Fri, 09 Apr 2021 04:54:22 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUj90-00A4Yt-OA
 for linux-mediatek@lists.infradead.org; Fri, 09 Apr 2021 04:53:34 +0000
Received: by mail-pg1-x52d.google.com with SMTP id t140so2956335pgb.13
 for <linux-mediatek@lists.infradead.org>; Thu, 08 Apr 2021 21:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OS7lcaPxknITZLvovVkA4QPXgon3j/mJxiD24igJRqo=;
 b=h4zcLAdWfRJgihK2lfSX3Ypml2LDDqkOCQxP1jzvewO4jhVm55tUwaYfZcqvP2cxZG
 +p00cv2fniK5dn64pXL/DD4rWqhDqCXJA/Hy890kQH2cKfRb6uQHe8wlmXMWoHg65I/s
 0ddH48c2OC/fmk1+1JQ6/j6A3800tbq4+63TA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OS7lcaPxknITZLvovVkA4QPXgon3j/mJxiD24igJRqo=;
 b=NRa79haTVIDAAuaZesda4pPoxYIcpDbYD6oactbNSH5gr75OpapTFjp7FH99GT/Tog
 e/6ATY8cxXWmk9L6EmplbtWlUJS5qHxve613yyBnwnzAssYJ0f2mdS2Fnj7QEWjI0vMh
 QJC+tHlKOE8XwIi89mwTTe/IlMjn15zL6Fgz13kQHyfePmbpoqpXpgTdayiZNUYFDfVF
 hGMBzeTrKLdMWHqawpQzZrIhVsR+yz49ih1qAUxPy7TpgSJpN1PtX+ln/EUVaWfnUU/r
 wqVHrvcuY2jd+XI6DxrmYNb0kj+3cXRsZFjKlJQqQZDTrVDsM/xiI6FxU6B/U30VIWLI
 MZKg==
X-Gm-Message-State: AOAM532BNZOcbw7JLZTvjT4aUXWoOPoYCL2tTBv62ow0RI2xur0Ti77p
 jwy6HTo5FDMxB0TeOnUMsbpQDA==
X-Google-Smtp-Source: ABdhPJwvi9n1MpPr9EbApqw4tpal6rn4nFHgDRv5qpHpDXeyET2KUNc94sSla03g7YL6LJLDGwmMDw==
X-Received: by 2002:a05:6a00:1c77:b029:241:5c43:8cf5 with SMTP id
 s55-20020a056a001c77b02902415c438cf5mr10989642pfw.10.1617944000932; 
 Thu, 08 Apr 2021 21:53:20 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:f9f6:696:a955:72e9])
 by smtp.gmail.com with ESMTPSA id p2sm900696pgm.24.2021.04.08.21.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 21:53:20 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: mt8183: Add panel rotation
Date: Fri,  9 Apr 2021 12:53:14 +0800
Message-Id: <20210409045314.3420733-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210409045314.3420733-1-hsinyi@chromium.org>
References: <20210409045314.3420733-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_055330_848946_C395EED8 
X-CRM114-Status: GOOD (  10.12  )
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
2.31.1.295.g9ea45b61b8-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
