Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7051C52D7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Aug 2024 09:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iox3pW+t1+/mCNWqBkSwh8gOTlOVaTTolmdqxDRdGuE=; b=z7u3Zx1WszZIkFKDI/mbXJDjy8
	Avy2NyPLXgvJcsMbcksunqI8kFEqJIttZJ6+dX2T44F7VmCecSs3YefVCPqakeId35TLYmWrb2wW6
	vb2UHQ1Rd7mV2RfCOsOc9xU15xEVC1iPwp+FFzoNY9Z09k4M3yw6KI22vIgUcXkISXqGkEOo19n97
	7kGb4+PeC88fZToR9HndMwDLjXp49PI272RXqfgjrlhGsiMuV8GIrTN/56EJWCYnUxSEaRvC7K0Wf
	XEiu7D76XeYnn0z7cPGoSwBxQDVQwuAivNBfZGSL+PNJsbZPfPFQ/gi/jglPnlV2yiQtkAoZMaG2S
	0A7+JkIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgheZ-00000008FJe-1vzl;
	Wed, 21 Aug 2024 09:29:19 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sghci-00000008EjE-0rj2
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Aug 2024 09:27:25 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7cb3db0932cso2936223a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Aug 2024 02:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724232443; x=1724837243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iox3pW+t1+/mCNWqBkSwh8gOTlOVaTTolmdqxDRdGuE=;
        b=ARaXqmJEgpVpDhgrg2dyoI3YN0hsJCg6E7c6t6IlNWr38VlZ8xM+PYSxh3SKH29Mwu
         pAQbZ0PC4JDkebPps+xzBAO+5Pd5jNhC2EZQ01kJAqf5s1l+eOt8Tur3wv8fXZ4jbADm
         ZNF+tt3+uKRjybxEZ8sdI4Lb0i5F8whsJNKLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724232443; x=1724837243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iox3pW+t1+/mCNWqBkSwh8gOTlOVaTTolmdqxDRdGuE=;
        b=mHkYrTjNqASFUKEcTnJcfkSVZPYiA+BMQYHktGRkol6QvnkXatSi3OPkHCxnIRwNqq
         CVGVG/aIf0eQe44DbHXooTXFRgYv0P9099Oip1k7jlrjynYLf4A/pr5e4VYALqE4kBRx
         zu5vzdyd0Sw9iPscFcqJLCFQCfPji2+VGb5v2l4Sq3wmJWbu51U74xz5rbAuNeaxPWEz
         84EqQdyt137/wNG10Uc2iLvBJTLpCbbd1QvS1FOeHw/imu/RHQ4q39A79NKxxqA5XPXq
         6pfmhndYzxGOpQ9n3KFntu6W/qNCFnzZlX+EgiDcHfEjC9MIdr+K9rJscQLaDoX9HlBP
         M2zg==
X-Forwarded-Encrypted: i=1; AJvYcCUD4C4Wg6Ch9sDVtHa6/cDrfVqOCnOYn3dTHjce3UBokybDuRu3k3qkrvaAm153yMiXSmCfJHikrFrNReDuBg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLeCxlLTzOZu4vq4KKpMFFIMXivnQBElj6twOTTZ34JyzD+foJ
	FhXnkpfnNY2OUTFs7zdDLMH0j4BzFcDea63hZJTdcQnYz/YjW5NnJs21DJpCfg==
X-Google-Smtp-Source: AGHT+IFSbd2+CTAvT36vYi23wFOBnvLtUPzf574J+2rtgzO0If0Rhiv3cpNXndh5NgP+JigUun2lAA==
X-Received: by 2002:a05:6a20:9e4c:b0:1c0:eabc:86a8 with SMTP id adf61e73a8af0-1cada0115e2mr2213758637.5.1724232443153;
        Wed, 21 Aug 2024 02:27:23 -0700 (PDT)
Received: from localhost (185.174.143.34.bc.googleusercontent.com. [34.143.174.185])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-201f038e33asm89674035ad.219.2024.08.21.02.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 02:27:22 -0700 (PDT)
From: Rohit Agarwal <rohiagar@chromium.org>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Rohit Agarwal <rohiagar@chromium.org>
Subject: [PATCH v2 2/3] arm64: dts: mediatek: mt8186: Add power domain for DPI
Date: Wed, 21 Aug 2024 09:26:58 +0000
Message-ID: <20240821092659.1226250-3-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240821092659.1226250-1-rohiagar@chromium.org>
References: <20240821092659.1226250-1-rohiagar@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_022724_273915_15408213 
X-CRM114-Status: UNSURE (   8.75  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add power domain phandle to the DPI controller in mediatek
mt8186 SoC.

Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 4763ed5dc86c..e27c69ec8bdd 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1824,6 +1824,7 @@ dpi: dpi@1400a000 {
 			assigned-clocks = <&topckgen CLK_TOP_DPI>;
 			assigned-clock-parents = <&topckgen CLK_TOP_TVDPLL_D2>;
 			interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_LOW 0>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
 			status = "disabled";
 
 			port {
-- 
2.46.0.295.g3b9ea8a38a-goog


