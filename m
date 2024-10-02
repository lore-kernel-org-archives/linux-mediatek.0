Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFB4CF31B7
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 11:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lLxnIBg1s/2Zk6Wq5rMoMKrQWoBI+Wl7X5KlhfrQsNI=; b=sCdtyBQwWdpxgw
	egtih4SM0iJvJaE6/iY5H0BOMg8gYKGSPhEoZjSFIWAFOi21u2ciGm8PCQtzfmIg2Ma4Ae6iFE18o
	ynW/HzaKkR+zhKXJCj2ZyJk+0I8CQzJWfDk/3RPZKuI7WwBx6joCYeBD843Ki6cwuB+3YNAOAETiY
	6Tuy7U3T1I2vQosBDVYUvC85VQCxT+932k1hyE+74FYLxcwBtCUEJYt+Lu2CEvZs4NG0zvwywIpzM
	hF1tFipp832Dv1sJcyiIehjpsqnqzujjz44t9eM0HHKsE+j8pANIhFWI6ceSEih32WdM34e2VOrzj
	EbCuGxpOC9RGxJXyFmvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svxta-00000005j7V-0Dv7;
	Wed, 02 Oct 2024 11:51:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svxos-00000005hvK-1bl4
	for linux-mediatek@bombadil.infradead.org;
	Wed, 02 Oct 2024 11:47:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=lLxnIBg1s/2Zk6Wq5rMoMKrQWoBI+Wl7X5KlhfrQsNI=; b=W/IM2BIpnUXeWjeh2Ur25nBJP3
	o8wyKjPWJik4VYozBWaz/zlUA0tUeR18M0XIv+Tfe4wDz7rDWv+6PWX+088WjjGNbO6OfXqjlXBhF
	w7IiMw/q/dBvRgjuh1s8pfS07OBPev9zCcXhDK1lNsispsYkQWDm8Ixv6GSnQmrnGgLy1DrvK0Oii
	ImYQkNG/UqAjgDV4UoX080P/3J+Ql674AO5v71ClsLUgC0grWa+3SN9PZlBrEUMBE1xLVTzbJJJcb
	JZFImAO3MeMF3ELZrp0cWc4760kxPVqJenE6KO4fimI5cJUs4Hz1SbwlgaV5GOBsQlMBHXA4+PBWB
	wMbKzH1g==;
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svxop-00000003TiN-1gd7
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Oct 2024 11:47:01 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-718d704704aso5549664b3a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Oct 2024 04:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727869617; x=1728474417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLxnIBg1s/2Zk6Wq5rMoMKrQWoBI+Wl7X5KlhfrQsNI=;
        b=G5TekeACvjlhyxTHtW+LKJBrEoKpvX/hJ+N8Bl5P7yuV4zg5BffSGSP0z67RqNQ7tV
         +7eAX/ad4VXFGYC2KCe5VePjZf9K4uOlM9IhmVT6H0Aw7eoooW0g/h1eIFEFrUtn86Q3
         T3vyez67o0aXyNUgw2JutMaLZb/PR9oN/2ZBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727869617; x=1728474417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lLxnIBg1s/2Zk6Wq5rMoMKrQWoBI+Wl7X5KlhfrQsNI=;
        b=HGDRh96WTFdwt3pHHMjdZarZ5QFJXCVEq008yYpkohhMS8NU58ZP7RNKwpUOA4Jjak
         NIPQtyk2rIujpVvLmYOH7U3LOO/aaYMvuEcOJg/5tr7FKHe69EjI7Y06yVzOD1H5scEe
         ZPxnmGOWyd1o/RcKUwugVw81oIaTqVSjg/1CtHIRfJf4VKZ+D3YakZn5wgpK+KHsMJJG
         jTz02Ia4sAnRUFWeZHE5r00xTP2sqjnaFL8AkacNZy6m+ow1MEKl5ERJHbpx+ZDnFD9K
         C/Vnvs8JsbrNG7NQBFTN5RD+1U9tsxknCnVGdkW9K3GgV4HmiyATNpQULxaEMPh5BCol
         o0rQ==
X-Forwarded-Encrypted: i=1; AJvYcCVev9imQroeMdYLCVIvfEr0ypcwPuDRoraklXVuRyQAQlRIFzdevfFSHmIKvFN3kw7qus1SWE4+XgDufDUrXA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRfhpB0su1NvUUVqNFU6HHOjsnaNUvP37E6aTClnWgJy+Rxsn4
	at5tkAZoyewVHoOjdNZn84vJ7OWdsZSpbpLYCavkUoHw0VpdyjNpzbFKGExp/Q==
X-Google-Smtp-Source: AGHT+IF6JPGrnrw2s+oul2cFZeq8gjPoe0hpHOYv+WskSpMyeJxxVC8NL1KQVuNJIk0Wtb2UocnhVQ==
X-Received: by 2002:a05:6a00:1254:b0:714:2533:1b82 with SMTP id d2e1a72fcca58-71dc5d6f693mr4955317b3a.23.1727869616721;
        Wed, 02 Oct 2024 04:46:56 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:3bd0:d371:4a25:3576])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2652baefsm9639627b3a.180.2024.10.02.04.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 04:46:56 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 3/9] arm64: dts: mediatek: mt8188: Add MIPI DSI nodes
Date: Wed,  2 Oct 2024 19:41:43 +0800
Message-ID: <20241002114614.847553-4-fshao@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20241002114614.847553-1-fshao@chromium.org>
References: <20241002114614.847553-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_124659_560106_FE6D85E8 
X-CRM114-Status: GOOD (  10.42  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add MIPI DSI and the associated PHY node to support DSI panels.
Individual board device tree should enable the nodes as needed.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 9431f3c5c228..ff639418bebe 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1837,6 +1837,16 @@ pcieport: pcie-phy@0 {
 			};
 		};
 
+		mipi_tx_phy: dsi-phy@11c80000 {
+			compatible = "mediatek,mt8188-mipi-tx", "mediatek,mt8183-mipi-tx";
+			reg = <0 0x11c80000 0 0x1000>;
+			clocks = <&clk26m>;
+			clock-output-names = "mipi_tx0_pll";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		i2c1: i2c@11e00000 {
 			compatible = "mediatek,mt8188-i2c";
 			reg = <0 0x11e00000 0 0x1000>,
@@ -2222,10 +2232,26 @@ larb19: smi@1a010000 {
 			mediatek,smi = <&vdo_smi_common>;
 		};
 
+		disp_dsi: dsi@1c008000 {
+			compatible = "mediatek,mt8188-dsi";
+			reg = <0 0x1c008000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_DSI0>,
+				 <&vdosys0 CLK_VDO0_DSI0_DSI>,
+				 <&mipi_tx_phy>;
+			clock-names = "engine", "digital", "hs";
+			interrupts = <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&mipi_tx_phy>;
+			phy-names = "dphy";
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			resets = <&vdosys0 MT8188_VDO0_RST_DSI0>;
+			status = "disabled";
+		};
+
 		vdosys0: syscon@1c01d000 {
 			compatible = "mediatek,mt8188-vdosys0", "syscon";
 			reg = <0 0x1c01d000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 			mboxes = <&gce0 0 CMDQ_THR_PRIO_4>;
 			mediatek,gce-client-reg = <&gce0 SUBSYS_1c01XXXX 0xd000 0x1000>;
 		};
-- 
2.46.1.824.gd892dcdcdd-goog


