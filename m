Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F06CDB465
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 21:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ht8N98xxNnhr4mxygYrnIRrNI1WvXoWdTJ8XF/XP/F8=; b=mWiZCVExQ9s7WsiZDSlonb9feR
	mEdzZnq4r7GWfwtWjDiT4AM6hkl2/+MiqOHxxu86oOYa1fRLsayEXEWfcr91CUeqF5QhAeo+IwVCv
	vMDpX/9m+wDlKSj0mTf/dlTolVe5xGI03eiz4mwnqfL49cMEuckBh29MqeAZuYEolJXGh/k/zGEff
	1e3KQeW+7UEVGa1g683gE/IZ9Zme8lchSFIfVF93/BEesiW+eGTMyt/xSiyXeREWtBnCJN9kypdp1
	mJL/aMeXg5smTVh0R5p+tBdNmIIfXDsUSwPc87b1leBLyQt7DRPrhIUpipL30tiZC0DgbTl5arnRC
	7sY8uPAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsVOd-00Abhd-0l;
	Mon, 16 Oct 2023 21:45:07 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsVOR-00AbVb-2b;
	Mon, 16 Oct 2023 21:44:57 +0000
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3b2b1af964dso2631538b6e.1;
        Mon, 16 Oct 2023 14:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697492692; x=1698097492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ht8N98xxNnhr4mxygYrnIRrNI1WvXoWdTJ8XF/XP/F8=;
        b=AMnIlPSFHHsxD67d1BhL5p8a2epbzQfMHLVf+hUieu4e5uYEkRhGb9C3OBLp81oCYg
         EJL1utVDdLhWTYNN1QRRdu3Ql+xyW8niPqCU2xpfRU4aB8SA5JP2rJQffEmekls3iPEJ
         QVd81NmO+IyhY8Hbp9+dc+QqeDZKvjtw5xiIXZ7iONQM8A782IgAlk+I00w1KTAC7GFk
         aQ+gLkzWt4AIOzZTJnaIhf/AsiBxPrG3QEICpNzjydZqc8xOTywYv0JIzmpI6/oJcUuH
         Pwn34rAIM3oemKEPb8kFSWTnAGpHUeMnWxmb6gXgImntv8Csyjvf0jwmrxmPg8e5TELd
         9Alw==
X-Gm-Message-State: AOJu0YyHoouVW93KcC95EgQEaLcd8nYNtzZnQuNpCB91CuFQ2Q/B1gjf
	ApsvlyIv/kVP6ecPXW5PVyJgiwzu6w==
X-Google-Smtp-Source: AGHT+IGRRlSS/F1kWukUHeHHHZmSLPVKA0n8LTYOyHwpWpjScHo01PEc7nh9ywAQ/bdErdN4oiSVXg==
X-Received: by 2002:a05:6808:3a82:b0:3ae:1446:d48b with SMTP id fb2-20020a0568083a8200b003ae1446d48bmr592595oib.3.1697492691930;
        Mon, 16 Oct 2023 14:44:51 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v11-20020a54448b000000b003af732a2054sm28836oiv.57.2023.10.16.14.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 14:44:51 -0700 (PDT)
Received: (nullmailer pid 3823220 invoked by uid 1000);
	Mon, 16 Oct 2023 21:44:35 -0000
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Oct 2023 16:44:25 -0500
Subject: [PATCH net-next 6/8] dt-bindings: net: mscc,vsc7514-switch:
 Clean-up example indentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231016-dt-net-cleanups-v1-6-a525a090b444@kernel.org>
References: <20231016-dt-net-cleanups-v1-0-a525a090b444@kernel.org>
In-Reply-To: <20231016-dt-net-cleanups-v1-0-a525a090b444@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>, 
	Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, 
	Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>, 
	Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, 
	John Crispin <john@phrozen.org>, Gerhard Engleder <gerhard@engleder-embedded.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
	Sergei Shtylyov <sergei.shtylyov@gmail.com>, Justin Chen <justin.chen@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Sekhar Nori <nsekhar@ti.com>, 
	Claudiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_144455_866281_7E5880DD 
X-CRM114-Status: GOOD (  11.28  )
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

The indentation for the example is completely messed up for
'ethernet-ports'. Fix it.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/net/mscc,vsc7514-switch.yaml          | 32 +++++++++++-----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml b/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
index 8ee2c7d7ff42..07de52a3a295 100644
--- a/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
+++ b/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
@@ -185,7 +185,7 @@ examples:
     };
   # VSC7512 (DSA)
   - |
-    ethernet-switch@1{
+    ethernet-switch@1 {
       compatible = "mscc,vsc7512-switch";
       reg = <0x71010000 0x10000>,
             <0x71030000 0x10000>,
@@ -212,22 +212,22 @@ examples:
             "port7", "port8", "port9", "port10", "qsys",
             "ana", "s0", "s1", "s2";
 
-            ethernet-ports {
-            #address-cells = <1>;
-            #size-cells = <0>;
-
-           port@0 {
-            reg = <0>;
-            ethernet = <&mac_sw>;
-            phy-handle = <&phy0>;
-            phy-mode = "internal";
-          };
-          port@1 {
-            reg = <1>;
-            phy-handle = <&phy1>;
-            phy-mode = "internal";
-          };
+      ethernet-ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+          ethernet = <&mac_sw>;
+          phy-handle = <&phy0>;
+          phy-mode = "internal";
+        };
+        port@1 {
+          reg = <1>;
+          phy-handle = <&phy1>;
+          phy-mode = "internal";
         };
       };
+    };
 
 ...

-- 
2.42.0


