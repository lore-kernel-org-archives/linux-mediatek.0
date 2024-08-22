Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342DEC531DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 06:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iox3pW+t1+/mCNWqBkSwh8gOTlOVaTTolmdqxDRdGuE=; b=aJAiZ2Kff+jmmKK1kOlg5/PCW5
	KCc9vf/shum609jwU8n0CjunZUW1qykCCSFRLzXxbPHyAr85CSvl8NWYLkO8iVrGoZEt6EeAAKTEC
	XjldGI4d2UW/6LMr8KUD5wXB3hb+kOA7Dv7wQKLX9/oM8PQcxu31Eeb7vGcCb/VEStiFKRYzwv0G6
	ZZPhV/onbXLX+rLDkWvdHLg9pzfGkC1pjczxp/sAgm0nwnlutf7c0Etrc+fLXM8SVhvQ3ffwWwebg
	bdg1CtEAU/XXZAOSK5LqO8Kgf2DPALqXlWuiS4vVCq3Z0iyu8YLFWlSxGcOmt/E8O5Y7uYXN0UaO0
	08kAuejw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh1cW-0000000BgZh-3TMp;
	Thu, 22 Aug 2024 06:48:32 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh1bC-0000000Bg61-1zAl
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Aug 2024 06:47:12 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2d3bae081efso364853a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Aug 2024 23:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724309229; x=1724914029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iox3pW+t1+/mCNWqBkSwh8gOTlOVaTTolmdqxDRdGuE=;
        b=QdUFPCWd5blxcqCbP5h8ZBWSbPpIp0T8ZDrfiUetuuHmaPlRnA1e4MNtHizZeePeP2
         YcklegqhuxXN+uvMdRTqAiiPi0CZ2fdIohzn4xfGV9+EsLIHZyLA2Wfp3mpMBT51K5Zl
         nQcgsRPxWyQxRu9lqV0Ao+kA9xKbNoVzeZ3LM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724309229; x=1724914029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iox3pW+t1+/mCNWqBkSwh8gOTlOVaTTolmdqxDRdGuE=;
        b=uIiBFfqFspNvT2Kd6Dx56sumxAhdCHc4KGelB97QENAk0d++kdgfflRYNhaPehMR1Q
         syNbuJGzOxRqFMOaQmSEhYEo7rKazZ3uvW1UraYf0gXfAyxOobYfRvK81L5HuQnULTg8
         Latd55E4xe1+XAg123V4yk4ST4RaBsGO+m8FRzlRT2GqSHUEazttytKPOTAXECavzwfQ
         Qe3rK4Npuv8eR1yIXERNiVhU/esdhtPK+50SkV1aUz2C9E7PqpKokHbVu98ie2z3pF76
         9mbT/6GFEl7x41/z0EFRM7CLYxeYXXaEzn8tLIzboQVcpHxGKJXbR7gFq2XDqAObOJgI
         vFGA==
X-Forwarded-Encrypted: i=1; AJvYcCV3mUTGl3/79OlrlJpPxUqDR8pAScwqQjrD6fEckiWgvI1yMcwZnPTD7cRB5ZmsDPQnV80nKRR4MOLS54DEkg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMdNn0/a1pO+U5liiyGR0u5nkR71D1iAD5zfntSjJi2b2X5rKL
	wX/rsiJoOEL6ry4dG4PpY0SGasRaN4u3/xRJM/EdV8KfSiQ9k6kG6ZwO7FfVMQ==
X-Google-Smtp-Source: AGHT+IGDm0aYL8ExBHHTkePgeJ1dnpbTcM/gseUSEQPj47QfaHrXBDFNOT0Ci3LVj6t5wZrZxdp1CA==
X-Received: by 2002:a17:90b:4f89:b0:2d3:dca0:89b7 with SMTP id 98e67ed59e1d1-2d5e99fb6d1mr6084906a91.3.1724309229382;
        Wed, 21 Aug 2024 23:47:09 -0700 (PDT)
Received: from localhost (185.174.143.34.bc.googleusercontent.com. [34.143.174.185])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2d5eb90c542sm3166866a91.18.2024.08.21.23.47.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 23:47:09 -0700 (PDT)
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
Subject: [PATCH v3 2/3] arm64: dts: mediatek: mt8186: Add power domain for DPI
Date: Thu, 22 Aug 2024 06:46:49 +0000
Message-ID: <20240822064650.1473930-3-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240822064650.1473930-1-rohiagar@chromium.org>
References: <20240822064650.1473930-1-rohiagar@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_234710_534790_3D024C1C 
X-CRM114-Status: UNSURE (   8.91  )
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


