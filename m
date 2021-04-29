Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E3BC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 04:31:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88D2E61073
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 04:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88D2E61073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FiOUDYcMxMkt6CX8Q/opm5xcJ7TE7HqO4oHitrnBMl4=; b=OSSU5EcbSqNxbrOOPs4az87dQ
	usc/faSB5eG30c6/rt0ulZbpXnQ2j934jSr7wAG7v0rMLdy6KEEp5Cl4ADtChup/1BWpIz/jW0r4Y
	jXxdo73O+rx4BzEr4zDQQA5U3fnH9bzPHSPoka4Vavv9IUcRUlml1CuisQWI8kw0LCe3c5Td0UeIN
	qRkCV4Dzn14iPUcqJrY8Sb4frrD2y7wwVrAjGAkEfGwmVAaFbaZLhv7C35DGxyKoIQq38h0cMCPes
	vHh5Lt/U73+vvmkhYYJUBk+1JFainzGBvegcWm/60eMhix38jjsxqEU2qZvMByWCjUKessb2wCn5c
	9y7cL4+vA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbyKR-004sgz-IE; Thu, 29 Apr 2021 04:31:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbyIB-004sTu-Mx
 for linux-mediatek@desiato.infradead.org; Thu, 29 Apr 2021 04:28:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=gt4pb5bT5mW/MToENIuo4Jt8VqUlSnyGRgKvmw6yKp0=; b=wJR1Rim5Z1tM/XUDaJwQom4JC7
 FU/EWYVJY39T6rNC7HOtel0jbwMgcLN2xD+K183S8ijUDhpG4rV30y7twDUCZgaZ+C0rD0U4AgIPa
 Az/PT45uTEF88K+hKOihpeRSGCCE+L2kuZak8Na3Y/rIhmjv42pfNXZbwV3j90d9RhYfKqK+iqAZy
 GBibjn5IGbKXtgA/kliPkM1dkCjt5MnUozrfsfn4dnMEMxjrgpmxc4WX2F5NmCaY5rbDBWF66YYfX
 J9G3YrUR8f4fmVqotibUCoPGOJpxtYxgyyiPP1gg+fAwx1Z2+ltl48WPy6z3C/KAIikAM+oDnGpLg
 fWU1CBbw==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbyI9-000MdL-9g
 for linux-mediatek@lists.infradead.org; Thu, 29 Apr 2021 04:28:46 +0000
Received: by mail-pl1-x62a.google.com with SMTP id t21so2972238plo.2
 for <linux-mediatek@lists.infradead.org>; Wed, 28 Apr 2021 21:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gt4pb5bT5mW/MToENIuo4Jt8VqUlSnyGRgKvmw6yKp0=;
 b=m2YPwqx7aeh6V4lUo0oHObJCqs1T+6ImiIjbJPb/XrFOXsS88GT0/U1TDgdJ1tlgtf
 vjjBBMfm1Eh2YmwOe5/fcnlTizd+eytKYuLtVI0Gxm72V5zal5FgLmjsqqeYmBs89pTu
 fubvjuXh/iVeU7gxgntYYq/wNSGAnKMhvhb1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gt4pb5bT5mW/MToENIuo4Jt8VqUlSnyGRgKvmw6yKp0=;
 b=VVu3eXyOD5L94Gjpqp2iAappQUaWcgYkcxourK1CZVHq/2NI7tu5ceIN9wUTEyJ1QA
 o5OInMSkWn1NKm9wm6x3DgXgFTIjvvR2P1m+rtZ5CNO2+xJmhUKvn0Q3h9o+CoogA2uX
 A5Gucq3dz9/RtltqUPIWxpuawaNcL4LuArHkdfE+9ff20VulCPz/WdS80Uich3/e0D4g
 KcJyrLhBWuDZ2zrKnY3BtMTQSInD/iECq7hhND04m9yEQBxGkFt1fBdQsE3U2GYFjDhV
 J6FMbkoXmB7YB3qcGKW9j0wDAUtVSA3iQEi0lLlohBA9q9wc5um4iCo+6PlCCXQY0rso
 K1og==
X-Gm-Message-State: AOAM530cdCQSQKuevp9NAiWrBcNen9Tna6cOraA9tIxZv+dkogkLzUTW
 K58Az8OGxbbv2YkGdypXYr2GfA==
X-Google-Smtp-Source: ABdhPJx0CF0XSmcRjIoO/yWcAnjTe7hR6m9+xUw2Ts97CHJGvHusZESHQqWarI1X5miU9uUBrAavWQ==
X-Received: by 2002:a17:90a:dd45:: with SMTP id
 u5mr7845750pjv.15.1619670524616; 
 Wed, 28 Apr 2021 21:28:44 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:f701:2ca2:56ba:8e83])
 by smtp.gmail.com with ESMTPSA id w124sm1069390pfb.73.2021.04.28.21.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 21:28:44 -0700 (PDT)
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
Subject: [PATCH v6 3/3] arm64: dts: mt8183: Add panel rotation
Date: Thu, 29 Apr 2021 12:28:34 +0800
Message-Id: <20210429042834.1127456-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210429042834.1127456-1-hsinyi@chromium.org>
References: <20210429042834.1127456-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_212845_344648_8174E3DC 
X-CRM114-Status: GOOD (  10.39  )
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
