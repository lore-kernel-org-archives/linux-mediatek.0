Return-Path: <SRS0=j19f=JZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D71C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 04:56:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 105B361408
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 04:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 105B361408
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FiOUDYcMxMkt6CX8Q/opm5xcJ7TE7HqO4oHitrnBMl4=; b=Mk6zcG7rQ2SfGO3mAjKATJFss
	MF6xIfY7AY3T7TTnOjrud5ptLrnmSewfyd1jOSIB0ozXsiPDC0hlKv31kk3koLhsvBr6306ym/GCO
	grQ7bANT6VD+8ApcXj7lO+UlIr/ZFz4EpTRVg+OsEXSFu5bcvPNUlsuBvAQS8eHPocT5M/9WpeHLM
	rQqSub0ubnBT7Jkl/Wf47qQTnqxSMHzf0iNtgFu+yYkhMKvqVXlYIUv1ACwbvRkjUZtpvoPFKKdPu
	36YxXi2jfXav4sQ8ctWImOfB5BhW/s0XR9BHuYPtmf1np7GnKCtADBXLb8DpGqeWy1+o7ZSGk9pkt
	RnIrB0XAg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbcFV-002nNp-K9; Wed, 28 Apr 2021 04:56:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbcEk-002nCq-7b
 for linux-mediatek@desiato.infradead.org; Wed, 28 Apr 2021 04:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=gt4pb5bT5mW/MToENIuo4Jt8VqUlSnyGRgKvmw6yKp0=; b=zVwM2bHsKX4FN6r5NOLg1+5ron
 xKpO/ILL3UJwAHIarjunfs5j9LQOXhocNnTSWQkGQXS178qoyPYjSIkcZ3Jyb6lUWGYEdH2TpQbMm
 LkZo9w07kycx3qTLDmq9NCNlghGkVr8upFT/d7405rA2sSoVIhtJePh+Zg2B6MmklZbMJ9uaPofD0
 uWEhSv2OoeQhRTOVArwq8eoXtFM8euVgasPe+N4cJJN1rt4otE+cLh9rxu5M8I9d3QTzP7Lf4/DvP
 gwQ4jyzw11FSvGmjVMc7DHzz+Hh6TYFklsNFEkoxs7V4ilwbj6JajcLY++3rz9Cru0E7lw0I4zWA9
 KxGdrUrQ==;
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbcEh-00HB9g-S3
 for linux-mediatek@lists.infradead.org; Wed, 28 Apr 2021 04:55:45 +0000
Received: by mail-pf1-x436.google.com with SMTP id v191so1122515pfc.8
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Apr 2021 21:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gt4pb5bT5mW/MToENIuo4Jt8VqUlSnyGRgKvmw6yKp0=;
 b=oXkcL1lHMS9/atp/1M+2S4oUJFLqrFv1wWQ5I09WWZB5DvznwYznRkUaU8SkfqTGEs
 UYeW43uZrTmQYfz++FpfwhzLxXJ4rtEN+on9zjE9ohFbgKvRHbzOENyfiyVyRz37eJiR
 BFTrFfuAi9YJzDjhgAmeckvfyV99TbMfYgsZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gt4pb5bT5mW/MToENIuo4Jt8VqUlSnyGRgKvmw6yKp0=;
 b=riGREea70mEPBFD+GCEHBPwCHdZUor+gzU97xAzYFceyYnT0b3x/JnyXnIhYmacaEW
 EV7eqCo9UkRN9enaMmHasbd0fApeCc3oZJBR4J0bUNM4A7FHAhRAiM8TXviHKlK6kuq+
 tLXs5tzWADn/EJtyUssa/ipKqNuMqX9LPjdRiQi8eJ020zr2GONXilQVn51hzGGl7SO0
 MeRc7liB2ckRkGQ36geZMEMY+ZvLnPvYENPt/WqVNi9LE0xGYgJl/1sKUY3gHWGmIvAN
 1Vb+Redz1y62xsa2oAyBpNPvT/EqeZRs2RrL5kXRQAAsqmG1vfTkj9xSq/CrNx2ndFiO
 Farg==
X-Gm-Message-State: AOAM533H/yxC4ZqVik6/DHzGVtMLqjkKoJkfAy/RTu6EJghxNJiwHS0Q
 k1eyAS/yJwOtycyO0NAZXjlFlA==
X-Google-Smtp-Source: ABdhPJy6K5CdM/3nHF3p+/2eE4TdGymi9eYrEEqROe+kZTRJZLv9zhp0SI6/MmsV0uYFWsxTx8DpSg==
X-Received: by 2002:a62:1b88:0:b029:1fb:d3d0:343a with SMTP id
 b130-20020a621b880000b02901fbd3d0343amr26649171pfb.76.1619585743151; 
 Tue, 27 Apr 2021 21:55:43 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:8076:36e5:2db0:967])
 by smtp.gmail.com with ESMTPSA id x13sm1193170pgf.13.2021.04.27.21.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 21:55:42 -0700 (PDT)
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
Subject: [PATCH v4 3/3] arm64: dts: mt8183: Add panel rotation
Date: Wed, 28 Apr 2021 12:55:33 +0800
Message-Id: <20210428045533.564724-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210428045533.564724-1-hsinyi@chromium.org>
References: <20210428045533.564724-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_215543_924314_0FC9B04C 
X-CRM114-Status: GOOD (  10.50  )
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
