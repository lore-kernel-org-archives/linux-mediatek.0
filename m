Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EAEC74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 09:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OoTSIHWCMaC55e5uUwc/Xt3kUwKDqCkH1f0U1BWd1Rg=; b=0muNj1b3BbBdUHXSe+qoHAQeYX
	9m5GlBwnZ+gZSJkMkskImy8mPJROImGFvov3YMyuceV2B7iYK90xwZo/rRHuT+PiB3pt+om9woHbw
	+oFFG7ZGmuGjxUulQRtkuXR5nS2dOu7bgCiAyr/4gItZSb9O8OAcZ7qY5yr73Dja5j1o08hVdFB4L
	EDSpqih0xTL2/xOW6sqJ+Kl+LTvCmgLXucc7EC120UCuUQdpbUOjHunMc4w/l2bxJ/ef4zrOWwsa4
	kZp2/1qAtpUkzpghVoCKy+ayA8o/kQ5o7fGiJKDs+3Nh1upc2ELzlyQpZRePPR05kHs0kX7AoPLm9
	I6ZmEdLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phSNZ-00HLhF-0A;
	Wed, 29 Mar 2023 09:46:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phSN8-00HLW1-1I
	for linux-mediatek@bombadil.infradead.org;
	Wed, 29 Mar 2023 09:45:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=OoTSIHWCMaC55e5uUwc/Xt3kUwKDqCkH1f0U1BWd1Rg=; b=f3zyMlQqBD7Di4oDtyY8U+4n4W
	Fs+D2vYoPnQ7gl1VxBIr/9n2Jwu6GzISGu293bATQNtQiCQjm2V5AqwNqKEinleVHp0bMWlYNTAUc
	Yisz7/Y0LBkbjcairSN6q4JCchPoqAOq6AVxxEgFJPZuK1B+OeEGynZ8pQqfztFW62LM7/u69mS7o
	qJdu3vjWCEkg0N99OdNXJXSEK2elQ6FL07qNWjH5eio4tZKUpgerTTADPS7ntsrLFXX4Qj9wnYUyQ
	mJIGqG8V71o2ydiZaqKcEdx0rs4AhmsTP3+nWECTi8Uug68r4gXQb4zymYNXIwZS/tKGz9Y6pJnGV
	B+KGMsRg==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phRaL-006oEt-1b
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Mar 2023 08:55:16 +0000
Received: by mail-wm1-x32d.google.com with SMTP id p34so8418561wms.3
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Mar 2023 01:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680080107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OoTSIHWCMaC55e5uUwc/Xt3kUwKDqCkH1f0U1BWd1Rg=;
        b=cM1dYwxKoMoBPx4ir88db9bhtpRtAuAwvkrO1K2goIG09KJORNvZDhjjo26vPGEK7A
         tx07C4sDpHEpspDdm7DePNtX/yvzaW1AcAaj956grg7Ss5Zu0ptJ6nbdFgdnuUW/NiC8
         ssG1kbKpcppz/3L7cvkY6v6FiFZyX5uJ7uzo3qpVg/Ce6ATKmhyoxU/6tLQcXR1XzPvf
         ooAssGlJ25T9eLa7rfUXjwABJr5sQJV6Zg4van4Rb0ik7H4igGY1qhzq2X6YNSSpZYpf
         mnG0TS84+sNw/umm3h8lrmLWQHcd7l+ptNuzOZSWjHE5ECIrBZND8AGyVMxp/aJQ0OFd
         /3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680080107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OoTSIHWCMaC55e5uUwc/Xt3kUwKDqCkH1f0U1BWd1Rg=;
        b=Nk4M1BOnD8HZdPCctbojK4xQTz37Kq6avSRPVRbtl7BxjRIJ3aAdWuvCKThoE3PMuU
         CJGABIa4M2Ict0+l3FIyitufI+JlWSNJcWbUj6Ti7sADyRoE/dY2O4YjQgKQAt6tL9da
         /n+2/vGPzgsdVskcleTvZ0maHOEF8vip1TCrIrfYVl07Q2x0TiBBWE0zZ9TxGW8jqT82
         qiTIwpG3P16z8QX0EYj/br76Q4tE4u3OzQfJX+Bdun+2fdboi5ODKFkmEYex9Y27oWuC
         0u85D+GabAc5whkvj3PWCkD2gt+Fi230o8/6Lrv9iJeIPbYGWccxVts1pZmz5bf6v2ml
         ebpQ==
X-Gm-Message-State: AO0yUKWqrz5Z2fjw1U1SvFh+/HriMZqX19XaAPjFtlYJiSvdILg0vUDP
	o3nQxQFnsMCPnpam1bh4MpD/6w==
X-Google-Smtp-Source: AK7set86EYENK4NSOAScRj3krY9Lf0QXLGnpUu/f6vUEdOr1Dk5CcEjrVpKpFJzz0cui5O75amYE1w==
X-Received: by 2002:a1c:7319:0:b0:3ed:31fa:f563 with SMTP id d25-20020a1c7319000000b003ed31faf563mr13248678wmb.20.1680080106823;
        Wed, 29 Mar 2023 01:55:06 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f9-20020adff989000000b002cea392f000sm29571964wrr.69.2023.03.29.01.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 01:55:06 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 29 Mar 2023 10:54:33 +0200
Subject: [PATCH v3 12/17] arm64: dts: mediatek: add ethernet support for
 mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v3-12-0003e80e0095@baylibre.com>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1363; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=7cNEQ8Z3d2N18bBB0ySn0ca/dVK3FcA8H0h1LVefyV8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkI/zcQ2qKeCqrMP79V92+YPoOhtlDtftApPNzGkg1
 h7TrO5aJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCP83AAKCRArRkmdfjHURV3xEA
 CSZoyscKEYe7T0Ft3YDPl9VOZdvmX7yZyAEWVJhJzppyb+HSz55wTp/dK6K4/pDgWPFiDbwjBMP2q6
 d0kIXSdFnhCj39ysnro6ODeo1eOA5LOdGXmtusno+AxlJV1/UWe9QrRSa8BKEk6vfsIm+E8LbnXl5g
 4mVExdV/iF1G6trhPMEC7stxu51G+/R/NtEyQyqUHFYg1ZbAOnnXz0uLsaYO2+FBVWdp/HMAPj4cQo
 pLFJoN6WOII2P07Q2zxJpTjmUmfnzL/1kvDxLwrbGVORNEQpBEpd5x/HVffMko7QpqQEociMMxu14d
 X3nznrGUwMMvPIZItAOVJvqDPh9qBRoAMFE6FxcPa7VfJ5zVwdUy7FbkNccmtJbPuJxL6l0Ji4MDss
 AQMCHekt9oagccrLYS0pspSaaeasktOsm59qcD403dys/j9gMinoHanal4YCtZG6u5ZpMOHFZGYBJF
 zIsO88urfOIeBY2WGcLLLifHEZwcgUmQoBsggt2iHjhlQiiTMyZ1f+1ubHnMym4KGk+TaG5qPPbAy5
 o3yEYKY+4BZEIyofINuqS3JrFWzowGZBgRh5N8dgZILCzIC76qB7h/L+8VqNo03gXXAniUdoMxNL5l
 cGQJ0WY1xPx89aOQzi+PWAm9KpoZs7L/ffDiRx4HHIVB1/HztjCbKuo2ES0w==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_095514_055592_900E6D39 
X-CRM114-Status: GOOD (  10.28  )
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

This IP is a 10/100 MAC controller compliant with IEEE 802.3 standards.
It supports power management with Energy Efficient Ethernet and Wake-on-LAN
specification. Flow control is provided for half-duplex and full-duplex
mode. For packet transmission and reception, the controller supports
IPv4/UDP/TCP checksum offload and VLAN tag insertion.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index a67eeca28da5..394a5a61be59 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -438,6 +438,18 @@ mmc2: mmc@11250000 {
 			status = "disabled";
 		};
 
+		ethernet: ethernet@112a0000 {
+			compatible = "mediatek,mt8365-eth";
+			reg = <0 0x112a0000 0 0x1000>;
+			mediatek,pericfg = <&infracfg>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&topckgen CLK_TOP_ETH_SEL>,
+				 <&infracfg CLK_IFR_NIC_AXI>,
+				 <&infracfg CLK_IFR_NIC_SLV_AXI>;
+			clock-names = "core", "reg", "trans";
+			status = "disabled";
+		};
+
 		u3phy: t-phy@11cc0000 {
 			compatible = "mediatek,mt8365-tphy", "mediatek,generic-tphy-v2";
 			#address-cells = <1>;

-- 
2.25.1


