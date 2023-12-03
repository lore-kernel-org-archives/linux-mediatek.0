Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF9CC4167B
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Dec 2023 17:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RCpcC5jwuJ3yk3mN0wyq8cYLJUEg433CyyhoyVbqIAs=; b=D2OU31x2zSgeI1TUznVqRep0pJ
	6ZkonLSfAhu31x2t7AUmZFosX+XsXI22rFHiqT7ujJyQizV5XxJSK+CyCdzxyQrQtASrU9xoFOz7o
	ptlMttuLkVGskhrozgZxcWRh1hyOTwugm/EFaRbNzseVN8M3GTYtgj8AQRaGUHJ8ZrRb9KbMNuM94
	+m2TvNMdhKLlGCzNfhGCHi3j4xHr5NsQIT5oy/YN7Rak8TpDYBq9nUHnPpUKLmvHFWFSHDjGGn0mM
	pCVB7MIsNQp8r/W/DniRNWu5d8dNXrKA+BoZPigAeDnwwV2ZZdliR7PzPOBnIx5GS2Qxc5qEgHGYC
	JgIol21A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9qYA-001yt7-1G;
	Sun, 03 Dec 2023 17:46:38 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9qY2-001yn3-2j
	for linux-mediatek@lists.infradead.org;
	Sun, 03 Dec 2023 17:46:34 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a00191363c1so523222666b.0
        for <linux-mediatek@lists.infradead.org>; Sun, 03 Dec 2023 09:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701625588; x=1702230388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RCpcC5jwuJ3yk3mN0wyq8cYLJUEg433CyyhoyVbqIAs=;
        b=JzJvYtclx+jKpcfeD3SCZFZcLo9DP0w/jIPKaw3GT7aunhDRWSGSrhlW4/W0lpvZwQ
         opc8y1zxu+siV/ejVe68apmGHtES/JJUsxgdLnwq6e5cY7d3cnMIqqCfs9ULDmKDFIv8
         yD5IP5vpujEg3jVGB/+kg4sHvZ/AfqlG9wFr1yMtInvoLdgdc7sxCApQLXl1fJdbCEZC
         bD7IXkoCg9C42g3lGmQ7IzYOJke4wcS06L81kz6u200iZ0EeveLGUk2UNzEoWeDUwOo4
         x7QDKnbgzbSxzUEJXe62RtpQ65hV3e/eUff+7aPJZcigu0Ys6qdan4krx1OLIlFc9q6t
         3EtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701625588; x=1702230388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RCpcC5jwuJ3yk3mN0wyq8cYLJUEg433CyyhoyVbqIAs=;
        b=hOC177yuPpv12LQD/5EmZy6Lxin4tjnoMf0YWDF+MW6GsaFNoEmlKTfeRuQutmuNoC
         qk4HsHG6FBtUTk524NbF9eCO3pUl68sU0BqXklVq3MIxAqF/YwxKwIlLALj5f4o5wTYf
         m5C9uCiQFGmtntrqxANgd7fPcF3tmFECDwidjSsEYkWNA4wq+Z9Jpdbp7OYL/CqLVLwU
         +elCTtWNwFXndT/U2DNSY/8wJIGzdsMnv7ngLgZurFGXMWZKa6pyUtNnd4cOfrEsnrDG
         Wn/pVv2VGbXhtTbWmqL7/0Fl4FJW8urrY21fNVo3MMIKan68P1vmOFEp0x/Uob9lYDue
         E3SA==
X-Gm-Message-State: AOJu0Yz7s92C6mwEkCo9Qt6XD85e8W3lniBSpTzallsq3xRiBTcUH4BT
	l/v9BKFRSObx2GJyW2qTAsMcYw==
X-Google-Smtp-Source: AGHT+IFJQoCLMn0/+EG0UAyhhYFeNH2UqEE7v3tOiGVYIzInkmctOY2h8GrRjKwEPU3d3Rn4PBKQNQ==
X-Received: by 2002:a17:906:28e:b0:a1a:60a1:7465 with SMTP id 14-20020a170906028e00b00a1a60a17465mr851180ejf.5.1701625588395;
        Sun, 03 Dec 2023 09:46:28 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id my18-20020a1709065a5200b009f28db2b702sm4324140ejc.209.2023.12.03.09.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 09:46:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andrew Davis <afd@ti.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Michal Simek <michal.simek@amd.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nishanth Menon <nm@ti.com>,
	Olof Johansson <olof@lixom.net>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v4] docs: dt-bindings: add DTS Coding Style document
Date: Sun,  3 Dec 2023 18:46:22 +0100
Message-Id: <20231203174622.18402-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231203_094630_914181_15192734 
X-CRM114-Status: GOOD (  25.82  )
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

Document preferred coding style for Devicetree sources (DTS and DTSI),
to bring consistency among all (sub)architectures and ease in reviews.

Cc: Andrew Davis <afd@ti.com>
cc: Andrew Lunn <andrew@lunn.ch>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Michal Simek <michal.simek@amd.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Nishanth Menon <nm@ti.com>
Cc: Olof Johansson <olof@lixom.net>
Cc: Rafał Miłecki <zajec5@gmail.com>
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
Acked-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Konrad Dybcio <konradybcio@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Merging idea: Rob/DT bindings

Changes in v4
=============
1. Drop label at the top (Jon)
2. Grammar fixes (Laurent, Dragan)
3. "Unless a bus defines differently, unit addresses shall ..." (Rob)
4. Use hex in example of dma-controller (Andrew)
5. Example: soc@ -> soc@0
6. Reverse points 2 and 3 in "Indentation" (Andrew)
7. Use full path to coding style doc (Conor)

Changes in v3
=============
1. should->shall (Angelo)
2. Comments // -> /* (Angelo, Michal)
3. Use imaginary example in "Order of Properties in Device Node"
   (Angelo)
4. Added paragraphs for three sections with justifications of chosen
   style.
5. Allow two style of ordering overrides in board DTS: alphabetically or
   by order of DTSI (Rob).
6. I did not incorporate feedback about, due to lack of consensus and my
   disagreement:
   a. SoM being DTS without DTSI in "Organizing DTSI and DTS"

Changes in v2
=============
1. Hopefully incorporate entire feedback from comments:
a. Fix \ { => / { (Rob)
b. Name: dts-coding-style (Rob)
c. Exceptions for ordering nodes by name for Renesas and pinctrl (Geert,
   Konrad)
d. Ordering properties by common/vendor (Rob)
e. Array entries in <> (Rob)

2. New chapter: Organizing DTSI and DTS

3. Several grammar fixes (missing articles)

Cc: linux-rockchip@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: workflows@vger.kernel.org
Cc: linux-doc@vger.kernel.org
---
 .../devicetree/bindings/dts-coding-style.rst  | 196 ++++++++++++++++++
 Documentation/devicetree/bindings/index.rst   |   1 +
 2 files changed, 197 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dts-coding-style.rst

diff --git a/Documentation/devicetree/bindings/dts-coding-style.rst b/Documentation/devicetree/bindings/dts-coding-style.rst
new file mode 100644
index 000000000000..ffd7617f95fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/dts-coding-style.rst
@@ -0,0 +1,196 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=====================================
+Devicetree Sources (DTS) Coding Style
+=====================================
+
+When writing Devicetree Sources (DTS) please observe below guidelines.  They
+should be considered complementary to any rules expressed already in
+the Devicetree Specification and the dtc compiler (including W=1 and W=2
+builds).
+
+Individual architectures and subarchitectures can define additional rules,
+making the coding style stricter.
+
+Naming and Valid Characters
+---------------------------
+
+The Devicetree Specification allows a broad range of characters in node
+and property names, but this coding style narrows the range down to achieve
+better code readability.
+
+1. Node and property names can use only the following characters:
+
+   * Lowercase characters: [a-z]
+   * Digits: [0-9]
+   * Dash: -
+
+2. Labels can use only the following characters:
+
+   * Lowercase characters: [a-z]
+   * Digits: [0-9]
+   * Underscore: _
+
+3. Unless a bus defines differently, unit addresses shall use lowercase
+   hexadecimal digits, without leading zeros (padding).
+
+4. Hex values in properties, e.g. "reg", shall use lowercase hex.  The address
+   part can be padded with leading zeros.
+
+Example::
+
+	gpi_dma2: dma-controller@a00000 {
+		compatible = "qcom,sm8550-gpi-dma", "qcom,sm6350-gpi-dma";
+		reg = <0x0 0x00a00000 0x0 0x60000>;
+	}
+
+Order of Nodes
+--------------
+
+1. Nodes on any bus, thus using unit addresses for children, shall be
+   ordered by unit address in ascending order.
+   Alternatively for some subarchitectures, nodes of the same type can be
+   grouped together, e.g. all I2C controllers one after another even if this
+   breaks unit address ordering.
+
+2. Nodes without unit addresses shall be ordered alpha-numerically by the node
+   name.  For a few node types, they can be ordered by the main property, e.g.
+   pin configuration states ordered by value of "pins" property.
+
+3. When extending nodes in the board DTS via &label, the entries shall be
+   ordered either alpha-numerically or by keeping the order from DTSI, where
+   the choice depends on the subarchitecture.
+
+The above-described ordering rules are easy to enforce during review, reduce
+chances of conflicts for simultaneous additions of new nodes to a file and help
+in navigating through the DTS source.
+
+Example::
+
+	/* SoC DTSI */
+
+	/ {
+		cpus {
+			/* ... */
+		};
+
+		psci {
+			/* ... */
+		};
+
+		soc@0 {
+			dma: dma-controller@10000 {
+				/* ... */
+			};
+
+			clk: clock-controller@80000 {
+				/* ... */
+			};
+		};
+	};
+
+	/* Board DTS - alphabetical order */
+
+	&clk {
+		/* ... */
+	};
+
+	&dma {
+		/* ... */
+	};
+
+	/* Board DTS - alternative order, keep as DTSI */
+
+	&dma {
+		/* ... */
+	};
+
+	&clk {
+		/* ... */
+	};
+
+Order of Properties in Device Node
+----------------------------------
+
+The following order of properties in device nodes is preferred:
+
+1. compatible
+2. reg
+3. ranges
+4. Standard/common properties (defined by common bindings, e.g. without
+   vendor-prefixes)
+5. Vendor-specific properties
+6. status (if applicable)
+7. Child nodes, where each node is preceded with a blank line
+
+The "status" property is by default "okay", thus it can be omitted.
+
+The above-described ordering follows this approach:
+
+1. Most important properties start the node: compatible then bus addressing to
+   match unit address.
+2. Each node will have common properties in similar place.
+3. Status is the last information to annotate that device node is or is not
+   finished (board resources are needed).
+
+Example::
+
+	/* SoC DTSI */
+
+	device_node: device-class@6789abc {
+		compatible = "vendor,device";
+		reg = <0x0 0x06789abc 0x0 0xa123>;
+		ranges = <0x0 0x0 0x06789abc 0x1000>;
+		#dma-cells = <1>;
+		clocks = <&clock_controller 0>, <&clock_controller 1>;
+		clock-names = "bus", "host";
+		vendor,custom-property = <2>;
+		status = "disabled";
+
+		child_node: child-class@100 {
+			reg = <0x100 0x200>;
+			/* ... */
+		};
+	};
+
+	/* Board DTS */
+
+	&device_node {
+		vdd-supply = <&board_vreg1>;
+		status = "okay";
+	}
+
+Indentation
+-----------
+
+1. Use indentation according to Documentation/process/coding-style.rst.
+2. Each entry in arrays with multiple cells, e.g. "reg" with two IO addresses,
+   shall be enclosed in <>.
+3. For arrays spanning across lines, it is preferred to align the continued
+   entries with opening < from the first line.
+
+Example::
+
+	thermal-sensor@c271000 {
+		compatible = "qcom,sm8550-tsens", "qcom,tsens-v2";
+		reg = <0x0 0x0c271000 0x0 0x1000>,
+		      <0x0 0x0c222000 0x0 0x1000>;
+	};
+
+Organizing DTSI and DTS
+-----------------------
+
+The DTSI and DTS files shall be organized in a way representing the common,
+reusable parts of hardware.  Typically, this means organizing DTSI and DTS files
+into several files:
+
+1. DTSI with contents of the entire SoC, without nodes for hardware not present
+   on the SoC.
+2. If applicable: DTSI with common or re-usable parts of the hardware, e.g.
+   entire System-on-Module.
+3. DTS representing the board.
+
+Hardware components that are present on the board shall be placed in the
+board DTS, not in the SoC or SoM DTSI.  A partial exception is a common
+external reference SoC input clock, which could be coded as a fixed-clock in
+the SoC DTSI with its frequency provided by each board DTS.
diff --git a/Documentation/devicetree/bindings/index.rst b/Documentation/devicetree/bindings/index.rst
index d9002a3a0abb..cc1fbdc05657 100644
--- a/Documentation/devicetree/bindings/index.rst
+++ b/Documentation/devicetree/bindings/index.rst
@@ -4,6 +4,7 @@
    :maxdepth: 1
 
    ABI
+   dts-coding-style
    writing-bindings
    writing-schema
    submitting-patches
-- 
2.34.1


