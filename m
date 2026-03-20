Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC961109318E
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 08:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NST1RpwwZp2tcAMZXFkmE4+NkoKPGEFDpa66C3GY3os=; b=j/HMKpRRGMqfQPJFROdIm13PBB
	Y+IPfUh1FKVUsvbU2S/ZjZiQ9EOzQ/2xUpHVKQwJktn2s/PX/QhiHdqwagIkCNf8h9AxdQXoXwbki
	9O8h/EWuiiE4zkvl2pTdERUSKeGOdfxuA3fI9dLlBl7rvcrU9pnVdnTVMkLVYKqHT9CugFettusZn
	iRZqG9jowOCX71C5g++BlEipOfiYgcGqR0hq3mXbhBRcS1BTqWmntgTKpjQQ7CiISg1Dxb7NiPpyC
	9ek6HOTx09WRmgYMgXRE+rDxDRUpl+xxYgig4GxuwVB8867tF/P/r74Qzbj+309hzT9aM+Ck2EZeF
	5SWDpXLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VTR-0000000COTW-3JKc;
	Fri, 20 Mar 2026 08:44:53 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VT3-0000000CNz7-3B9R
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 08:44:32 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2b042533de1so10238785ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 01:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773996269; x=1774601069; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NST1RpwwZp2tcAMZXFkmE4+NkoKPGEFDpa66C3GY3os=;
        b=mTrbfSroaLfEDPZjuYm3oJBrUqX5lwRHOQ4hnaXs1Vxz4UfmKg/IwayAArPV2nOKCi
         mh8NrO4DZFLIG7o4T3bxCbY/eN66zW4KVsrucvYeFtZLjsP5VczBb/caRwK09YGadYfS
         RH9ThzGFIqFQkGGwqgw+pOBav7XXoUQuPCnkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996269; x=1774601069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NST1RpwwZp2tcAMZXFkmE4+NkoKPGEFDpa66C3GY3os=;
        b=mUDssNVzBeb1+O2G5ZaEx0Rj/7CPGLJ6VZ2awv0/wFj6hnSYvciXDrinxf3a8n3Ndj
         OG6uoMMkvFiBGxUPTl9pY0aUihjzPnU3RGkBttALYBCKnKxRATIdk7Y8/IiQSVLfK76T
         n0IPCTPOIVf++wSZtwvbSycEfcrHvBdUzk1lI0pjNgTiUvv3TKmIMILr1FlJi0yovMt2
         fjI6tkdYuwpQrVJDPSl+wdoh8G3LSFqpPIyJ73XoUIzO//6RulNPNISIXq7p4wQQYbLu
         pq7VzPi+ea0gqJm8PtQ2p9I5u6xbj+QWevUS6meHxbuZN6vJE/6cDYCChftMSbblaHG5
         4CJg==
X-Forwarded-Encrypted: i=1; AJvYcCXt0JfGlrA8myKBre1m12Bjd41x19VoqfloUL0uNyxNdZxOgTnIyogD3GIkEax+CyUqsKQXBBPN4kVkiFj/cQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0q15yPxuPIf/74xlJQimFfbVI110LWYSkVnI34m4WXYKkEGmy
	gC0Blv1phIrWmAtcgZCIHJryI8/al0L9QiVcDCXj2ssU4NcKJNaRUgazUXuWYLeOkQ==
X-Gm-Gg: ATEYQzzdKHRAEp8FW2Qz5Xztfb6F2s6nOkORwoYsFhpzr8e6mlIkdRZuSgeWswtBFNQ
	+mAzfvbTTJyiv7eRAF6StQleVXMpxV3ToMCXgLXAgA2DjSIze6nA+WO8WuT4HGTMxwSWDxYxTCF
	MelJFCeXBWrBss7fDFGfjn1oZMCQXYi2ntqzjMzRM+gH+DYx1ER0Lw+klu8f18ln+H5bIoTXR5d
	Ypzk6Uuyit1SlnxzWF2VBJ9SFhwplD5tAyXS4KZEsHgpKfsXzZsS7fnPvDKB1UPmq+LUujZYV08
	QVdcW46Hlu/ro1ykcHhlMk6NoEprHeiWBVDG4JbTWSVXO/NuiABihIy/nnZiBK4VRvErut8spiD
	HYDxK5YM1RDwciSYhrhy6e6t7y57PSvy9Iex6K6Up6rDCbRJa3AspNjaL5uB1dEiwNhjwbV5fCL
	gjuULQ6I4PBGbD4oFzD4uK4DSZLYZL7WmtSb23EVlrRcOJMI++Fsm4XyX7ysJ3XHTcCWsvbQuIg
	tj1yNL7
X-Received: by 2002:a17:903:183:b0:2b0:5654:ff00 with SMTP id d9443c01a7336-2b08270dd85mr19846135ad.9.1773996269206;
        Fri, 20 Mar 2026 01:44:29 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm14917905ad.75.2026.03.20.01.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:44:28 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/13] arm64: dts: mediatek: mt8188-geralt: Add little core CPU power supplies
Date: Fri, 20 Mar 2026 16:43:45 +0800
Message-ID: <20260320084351.2461060-14-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320084351.2461060-1-wenst@chromium.org>
References: <20260320084351.2461060-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014430_021062_AF6B7E50 
X-CRM114-Status: GOOD (  12.16  )
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

The device tree for the MT8188 Geralt is missing power supplies for all
the CPU cores. Power for the little cores is fed from the MT6359 PMIC.
Power for the big cores is fed from an MT6319 PMIC on SPMI. The latter
is currently not working in Linux.

Add the power supplies for the little cores.

Supplies for the big cores will be added once the issue with SPMI is
resolved.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index fc84dfedab03..7108bfa53ad0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -217,6 +217,30 @@ &cam_vcore {
 	domain-supply = <&mt6359_vproc1_buck_reg>;
 };
 
+&cpu0 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu1 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu2 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu3 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu4 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu5 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
 /*
  * Geralt is the reference design and doesn't have target TDP.
  * Ciri is (currently) the only device following Geralt, and its
-- 
2.53.0.959.g497ff81fa9-goog


