Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F29E1C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 11:24:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A0ED64DDA
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 11:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A0ED64DDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lxIWyTnFRRAGGMkRRA6jz1lQ8kGZ1gbcUEg5saBb6ZY=; b=xRaOkYxu8NZez+cnGWjtw8LBs
	Xf08elYsns6O/gUP+4DZtvNF9BEGAR7dGdVA5jQfo2yhiaqeamoqt5FU5PI/NW6eTfXBv2T/u0Unn
	F3x16ZWD5GRwlEo9x9VRtMbgqzgDBDv6qxiJcTd6IrTEJp93aZhqBoMsRaVkWYtdditHAPzOlGDVV
	HQevz8IFCbgvz5JjyMen6Ubfz7Qlyjl3d418J9rNI0LODFcD2RW/sl2CmoeQ5WxsDAt9YZWLESYk2
	7XPmlbWCnnubdqH/e01beyLEO8n4CvCEdPwCVdhjkJOoKv9jYI+QgYWmNVawepUTThZmrHcu93vFP
	azbxrt9bw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l55Ow-0000cT-Sw; Thu, 28 Jan 2021 11:23:50 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l55OZ-0000SX-38
 for linux-mediatek@lists.infradead.org; Thu, 28 Jan 2021 11:23:31 +0000
Received: by mail-pg1-x533.google.com with SMTP id t25so4102469pga.2
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Jan 2021 03:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xhgdJLSOFpJ1X5OA/ZUAhPXvec8bmbpja63O+GhXRwk=;
 b=aRkLJR88J0jdbr/jXC5uahfZscq5N0dhZa/Flm0QePbjhpW+UbVM1aZTGfMnJ9Cg1E
 rTr3ivslJUiwfS3agf1E7lgcQe0m2KRdju9hUJe7C7G9EBNvuonyPmqCz9PVCiIm9I26
 IHqVYXUV4EXOhDT8pPJe7oQubeAaN3tse/CQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xhgdJLSOFpJ1X5OA/ZUAhPXvec8bmbpja63O+GhXRwk=;
 b=PPOlQw0jw6HDi2OoZg4YFpwfYcapIinnRnx/vR6Z+pACJbjdJ0qDFLciwCaF4/qxTj
 Pcw1Xysw07nqNJDzVgXNihY287pb4ftysksWIHNnPUJa5Xx+k7x4XXWL7UFeSuR88KZV
 9GZX2C8lG2BpS+aGBOF781MxSRcRVkjYDa8n10SRl/Qm/il0yPCGVsjekgSCQ69NMHMh
 08WSxO7jWH7a9bnkGviC8MwBNky2YnxPleYHKc59MnZCcNxiyfU76but+iiIGGdD1kSP
 12cSdUCfKM7zU9LdxLgR/btitO2J9CYzVKjL2mDqJD4Q5+sd4X1J0u6oakICAQzVQmxl
 q3qQ==
X-Gm-Message-State: AOAM533lSLVV9G/s/nO21AAcpAMamOvgPGbqRQYEJTxl9xJC2T1OQmcR
 QQ2fGI7Wrdl9PtRbcIZz/K80lA==
X-Google-Smtp-Source: ABdhPJwiadoAWryEyjYOG/m6fl1/fQ2YCA5XNTxkLxD1rjf13x5lnoPMd+5/LKUkg1EA+/pnufsbuQ==
X-Received: by 2002:a62:c312:0:b029:1a9:19c7:a8e with SMTP id
 v18-20020a62c3120000b02901a919c70a8emr15539436pfg.74.1611833004948; 
 Thu, 28 Jan 2021 03:23:24 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e0a5:d2fc:aaad:1e4a])
 by smtp.gmail.com with ESMTPSA id j198sm3138315pfd.71.2021.01.28.03.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:23:24 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v12 2/8] arm64: dts: mt8183: refine gamma compatible name
Date: Thu, 28 Jan 2021 19:23:08 +0800
Message-Id: <20210128112314.1304160-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210128112314.1304160-1-hsinyi@chromium.org>
References: <20210128112314.1304160-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_062327_955713_00BC1C9B 
X-CRM114-Status: GOOD (  12.83  )
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
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

mt8183 gamma is different with mt8173
remove mt8173 compatible name for mt8183 gamma

Fixes: 91f9c963ce79 ("arm64: dts: mt8183: Add display nodes for MT8183")
Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 6c84ccb709af6..9c0073cfad452 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1055,8 +1055,7 @@ aal0: aal@14010000 {
 		};
 
 		gamma0: gamma@14011000 {
-			compatible = "mediatek,mt8183-disp-gamma",
-				     "mediatek,mt8173-disp-gamma";
+			compatible = "mediatek,mt8183-disp-gamma";
 			reg = <0 0x14011000 0 0x1000>;
 			interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
-- 
2.30.0.280.ga3ce27912f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
