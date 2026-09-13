Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C60C88E56
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Sep 2026 12:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=baoczqhIZrjz0uVdn8S3iNYTU/V5HV21e/dMeLayogE=; b=nJPeUhdHRp5Tp6kwzgpVxPU04q
	vHSjjMrvuGZ/dGbOpUcgqz+gL98kYohyLKDBbsBNy+Eo6bAWPSXYIhBnuDlE5RVw5Z1TvrcAW8xf4
	cm8gqRVcGnSmPy6B/9w9CSxYacyVN6jnc/4ReKdTdaFPszoEfjO5/z+KW3esINw0/UBduG2SsCl7c
	Pye8/cqDsg1XYtaasoaNkBCAYte3WsVn5grtOb7RLKoKY6GmMT30hlV4FQLb8ZLLzMUa6PE7M/JH/
	HSHysfjWP3XUl3zSQYWsdKm82yRGe6CwSEoPCojV0kirptnoEMNXGCZWsNmo6JzNexD+Aom/FxtPH
	G954YD+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5jOb-00000001eMl-2pE9;
	Sun, 13 Sep 2026 12:33:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5jOZ-00000001eLr-01RE
	for linux-mediatek@lists.infradead.org;
	Sun, 13 Sep 2026 12:33:21 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DAUViv822263
	for <linux-mediatek@lists.infradead.org>; Sun, 13 Sep 2026 12:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=baoczqhIZrjz0uVdn8S3iNYTU/V5HV21e/d
	MeLayogE=; b=SVVBade8rxLppbo1Ks98mM+xoXfjAtHv5CpFFlArSqW0NjbX71P
	6aTGXyaZsEMaoQShDPYZ+xI62W7g16A84R/6Q+o5RkWQWPBZoQKyX1vrtokjU0jF
	J/Gnls/UmWrlY2CmivUqBwBWT3dcz3PXRedESOqdhkclKz4IyMwHZsOOs7zM5e86
	r8J/tA6ISg3X2PH4Pt/9QMZGU65GqPr6EII3JQYyY+XhHfyX6a/T8TFEv80sjiOu
	cDv9SzK+QMBKBOQ2lV16eJyqbFNPBUJvXwDFtu20ejiE3y1D6dHIiZ712rjE1u7k
	lhHPMXwf46jPZiK8YGK/0ZYkbzPaU7IDolg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cb5xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sun, 13 Sep 2026 12:33:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9104eedb5b0so48605716d6.0
        for <linux-mediatek@lists.infradead.org>; Sun, 13 Sep 2026 05:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789302796; x=1789907596; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=baoczqhIZrjz0uVdn8S3iNYTU/V5HV21e/dMeLayogE=;
        b=FsPv117nz2XygQCwyguyzaSzW0VU1vFL0w/lbjdSxvEBPZxc3MLxB/26LfQo9g7U1a
         0qQl4JqpBsL8GkEafLKwP3dVcldzHlqNSeKXMt7by0BQi+D4Pn2/hBCFq3o9+GwbPOfU
         MFytlNtcw7+Ez9qwQGm7celkN3BClGG4S1nmKhpteNwBmXd0PyxYi686y7en1lg/Hagg
         Oe2s3YdAW+nFRfh0SJQ65CbsdJxQW6CHPI2qAQ0P4LRLNQx/fqF4iegDQHd18VbdhiHx
         pocwnSMN/S9nfUmP4hhIBufrlXujFKrVnIBV4VnoE6zp54nTRhXBvzDQ9j/0aq/JdMfJ
         bxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789302796; x=1789907596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=baoczqhIZrjz0uVdn8S3iNYTU/V5HV21e/dMeLayogE=;
        b=fvnzsO3LeWy+jP6IOctUHuDXdDMzhd4Fsi0X0gLrIVubOig4/gKNI4iIjiyZSHvH5i
         ecYdWoVQdOnz/6RN6DM2wjNj2ylaU/1Ze+NJWXPF29KzmFBSkjSCjb8fkJCiYwctpAQj
         f09e/pO1K8RjqeFq7a+S3B8i+FyCMXZl/iWLiTfLgz4r3bF38Yb842jMpKmQRG6+/X2n
         ckC2ZfVr46QbSJmnMbAq4KQhVC1hsSV0zP8cdIr26QRgtowAt5EynA5iy4Kgc8zlfnr6
         DLyo8uKemAQqZWfcvmWumLJ1gZmtOeKszcE1YDTnRnKv5XEZRb0Ers7UnSbWb8RDtduP
         EbYg==
X-Forwarded-Encrypted: i=1; AKwUvBy3Qab0kvc0gnqrm8l8kO2X4M4umUggyCr2PKFlP2pb+x/Qt/yMjtovHdKC7HIpn+OSoXjco4sOmk3jD9Cfuw==@lists.infradead.org
X-Gm-Message-State: AFuF++mMiEzsAdoy5CT9LJOJNDVKj92GHEJuzZO+DRGlMWx3TiP4nweB
	V0CNpJh+7F5sowxVrxYRv+ipeoo77eYu5qvgyZOjIjRvKoa+fXikMnBhu9r5bf0KvqcD1ohWQcF
	AXvTKyd85gkggiACgjTIDQPF0N0Fd3oj5KvkFm8AQcW03xCjUpHpOdPgiuTTqEfOXKv/2AA+099
	A=
X-Gm-Gg: AYBFou2PX5FCzpC+dJpX7y/z3Pyjzm2inSfRZtNCQGwtM9i1AALIXn1kvLNk/S5BKzg
	6rVXo/wNAfon8pS0W1eGqofbaY1PD952/sq+ncjxKNaotg2edN8pWwIiLp5Y9jSenV1/rwLA5+2
	kqIH9aYebBlMXnveoRwa2QPy69LOyTZIMqwT/Nvf9X4cxhdYPoXpFQ4rqf6SWIlgnDuroEmYhH+
	mdJ6xb7Y1LFKet9BwWFF3ykNvq+NS2nMLFitaUnBGNEgXZc/7DZG5Ut1p6GHO2o0Jc0efAaBMFz
	gtfYJ2F0JwXu5mxfZVdLRfia3ORysNspONmSARND3P/MFeuOPWju0cve7sBtppEcP9YhsNi1/64
	8vkmh2W29Rym5zNw=
X-Received: by 2002:a05:620a:2544:b0:914:afc1:c66d with SMTP id af79cd13be357-939ea104decmr1658054885a.11.1789302796289;
        Sun, 13 Sep 2026 05:33:16 -0700 (PDT)
X-Received: by 2002:a05:620a:2544:b0:914:afc1:c66d with SMTP id af79cd13be357-939ea104decmr1658051785a.11.1789302795835;
        Sun, 13 Sep 2026 05:33:15 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be3e0asm352484885e9.1.2026.09.13.05.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:33:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Mattijs Korpershoek <mkorpershoek@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Artur Rojek <contact@artur-rojek.eu>, Frank Li <Frank.Li@nxp.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: input: Use consistent indentation in the example
Date: Sun, 13 Sep 2026 14:33:11 +0200
Message-ID: <20260913123310.100170-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6934; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=I+E/O9s5n2yESeW++6dwadVuhwOsVzwTznjrZtzXSJE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqppgGbOSr/eJIqpD2Ve0Fac3V3uxuaoogWqn4Z
 8kMdHKbihCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqaYBgAKCRDBN2bmhouD
 1xg4D/9TyB0+poLY2P/4Dih94oXcs98iTr9WlRkUNjInZ+dbLhkQJtAZScBdNvwkEAqJPDoL2Rl
 TxYyWXUs02i+ebKWjyrblVAt2u4HqREQGKeMrLr5nMLRludOHJ/RoxwdTh8kQU8kAdqGvTwqg4b
 6aTSTx8ys9BGsvHW5dPJoBWpZDqTtf0Bu09QR1Z0J33BfSO0UheWlRA8Hcjpim54uHh+TwNEJsO
 6uTpCkOEo4Qh0od7P9KM/9zrYB57fwJw+j0tUvzDNtXBq217S8pimR57aRnT3R1/IKjNJMwsTE7
 xPWyWPnV18jaRmO4WeHvJVeKHwyezVh9HUIwMr9FJiLtsp/PWYXXVO+lL7GSeXF0yCOnJ2r6hyS
 yfS/VmyrG+apmE/A5bq9Ll9CqWhyZaBF5hNWd2tWOk+rXUN0ztCzPaYqiPuzybW+J6ug9j0QaHt
 UFde5c/dCp0hHtHOtxQ71+yWGybMnmrO/Oh8G1v9/2s9RtYyCeic0C9xKmsZ7kjthwQ4om3axoX
 69cTZaetMiejQbj0ogzWJoccBx0WC+CLKJeqdIqHQ3VPoF3qx+h7QNGN1uOcPQRToR3qZ3CN1SS
 BXn+ImwgsGjwNvKigUM7bMYwhSEp4stZ3Xxzs1g9EuPdYedCVQZbMUZBIOepPukB0dHr4yiX7lq 0Guw4fs1o2qYM1Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TJ3r9usbbrPvBF7iOkgNOIFv6HJ3f7Jh
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa6980e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=nrvTzeEnne52kZqV4q0A:9 a=xWRXsgGyZKNAB1QD:21 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX2M4oio4zCpB/
 NJneWmnrxjrhcuIUJmEK3obRR0V5cVpCqwWhuhvUm3qDrZWQNtwL7BlXHGLjCVoUyAJf71EvAoU
 O2RHEdxbibhfu4JaE3f6fyQkJeoZWFk=
X-Proofpoint-ORIG-GUID: TJ3r9usbbrPvBF7iOkgNOIFv6HJ3f7Jh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX3dImFiTwBpur
 p9+rYQvrZ8S1XHwncemoP2yd5DZqHj0FR0UEl9aLLXme3ABQpJMm1x/Jk1xTOoJUMZ5nMUsMbGR
 KOkQIBzU0e8n3fRPIyR/Do2XAliBMOk8MhSQ7V4KX+6sEZXYGbNrlwTOowKbC3mmreQhvRXLa+R
 2y069rznHE1eAolhcpxhuZe8/Mmq+Dsx15dW7iCcuj1K5QbHXyyIYboP2H+yA7qcrQhG9uLOJhV
 XaKeW0sC51b21BqIOtmlmCYezVdRILL1TZaS6LY7PfhqrSBVz9NAARUeJZ0g83yskKwWEZc/Pka
 KIENMz+pgzKK2M+0zBg3CW1WGLol1JzMNsgesYZQaZFhoesvGZqxA+NswZ3B/y1zH+9W1Km1PUV
 B0btvBJoCQwo/GAmiZTPhvZjIJ1NXZ5lcGy5MHorK+1k/1tjialZlMOQxpUEF+VaVspIEoW2jh0
 vYoVyRGlzDWch3Asy1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_053319_180609_51953718 
X-CRM114-Status: GOOD (  13.06  )
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

Correct indentation in the examples to consistent 2- or 4-spaces
indentation to fix dt-check-style warnings ("example 0
[indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
re-indenting entire example just for that is too much churn.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/input/adc-joystick.yaml          | 20 +++++++++----------
 .../devicetree/bindings/input/cypress-sf.yaml | 14 ++++++-------
 .../input/mediatek,mt6779-keypad.yaml         | 10 +++++-----
 .../bindings/input/microchip,cap11xx.yaml     | 14 ++++++-------
 .../input/touchscreen/eeti,exc3000.yaml       | 16 +++++++--------
 .../input/touchscreen/ti,tsc2007.yaml         | 12 +++++------
 6 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/adc-joystick.yaml b/Documentation/devicetree/bindings/input/adc-joystick.yaml
index 6c244d66f8ce..ac0ca5aa8212 100644
--- a/Documentation/devicetree/bindings/input/adc-joystick.yaml
+++ b/Documentation/devicetree/bindings/input/adc-joystick.yaml
@@ -111,17 +111,17 @@ examples:
       #size-cells = <0>;
 
       axis@0 {
-              reg = <0>;
-              linux,code = <ABS_X>;
-              abs-range = <3300 0>;
-              abs-fuzz = <4>;
-              abs-flat = <200>;
+        reg = <0>;
+        linux,code = <ABS_X>;
+        abs-range = <3300 0>;
+        abs-fuzz = <4>;
+        abs-flat = <200>;
       };
       axis@1 {
-              reg = <1>;
-              linux,code = <ABS_Y>;
-              abs-range = <0 3300>;
-              abs-fuzz = <4>;
-              abs-flat = <200>;
+        reg = <1>;
+        linux,code = <ABS_Y>;
+        abs-range = <0 3300>;
+        abs-fuzz = <4>;
+        abs-flat = <200>;
       };
     };
diff --git a/Documentation/devicetree/bindings/input/cypress-sf.yaml b/Documentation/devicetree/bindings/input/cypress-sf.yaml
index c0b051466272..8492ffd84bfd 100644
--- a/Documentation/devicetree/bindings/input/cypress-sf.yaml
+++ b/Documentation/devicetree/bindings/input/cypress-sf.yaml
@@ -50,12 +50,12 @@ examples:
         #size-cells = <0>;
 
         touchkey@28 {
-                compatible = "cypress,sf3155";
-                reg = <0x28>;
-                interrupt-parent = <&msmgpio>;
-                interrupts = <77 IRQ_TYPE_EDGE_FALLING>;
-                avdd-supply = <&vreg_l6a_1p8>;
-                vdd-supply = <&vdd_3v2_tp>;
-                linux,keycodes = <KEY_BACK KEY_MENU>;
+            compatible = "cypress,sf3155";
+            reg = <0x28>;
+            interrupt-parent = <&msmgpio>;
+            interrupts = <77 IRQ_TYPE_EDGE_FALLING>;
+            avdd-supply = <&vreg_l6a_1p8>;
+            vdd-supply = <&vdd_3v2_tp>;
+            linux,keycodes = <KEY_BACK KEY_MENU>;
         };
     };
diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
index 20fa41f691ed..f10bd0f1d948 100644
--- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
@@ -79,10 +79,10 @@ examples:
         #size-cells = <2>;
 
         keyboard@10010000 {
-          compatible = "mediatek,mt6779-keypad";
-          reg = <0 0x10010000 0 0x1000>;
-          interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_FALLING>;
-          clocks = <&clk26m>;
-          clock-names = "kpd";
+            compatible = "mediatek,mt6779-keypad";
+            reg = <0 0x10010000 0 0x1000>;
+            interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_FALLING>;
+            clocks = <&clk26m>;
+            clock-names = "kpd";
         };
     };
diff --git a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
index 983f4701b51e..fa95270ac2c2 100644
--- a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
+++ b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
@@ -290,19 +290,19 @@ examples:
         #size-cells = <0>;
 
         led@0 {
-                label = "cap11xx:green:usr0";
-                reg = <0>;
+          label = "cap11xx:green:usr0";
+          reg = <0>;
         };
 
         led@1 {
-                label = "cap11xx:green:usr1";
-                reg = <1>;
+          label = "cap11xx:green:usr1";
+          reg = <1>;
         };
 
         led@2 {
-                label = "cap11xx:green:alive";
-                reg = <2>;
-                linux,default-trigger = "heartbeat";
+          label = "cap11xx:green:alive";
+          reg = <2>;
+          linux,default-trigger = "heartbeat";
         };
       };
     };
diff --git a/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
index 930c70104b3f..00bd4062ebd7 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
@@ -82,13 +82,13 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         touchscreen@2a {
-                compatible = "eeti,exc3000";
-                reg = <0x2a>;
-                interrupt-parent = <&gpio1>;
-                interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
-                touchscreen-size-x = <4096>;
-                touchscreen-size-y = <4096>;
-                touchscreen-inverted-x;
-                touchscreen-swapped-x-y;
+            compatible = "eeti,exc3000";
+            reg = <0x2a>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+            touchscreen-size-x = <4096>;
+            touchscreen-size-y = <4096>;
+            touchscreen-inverted-x;
+            touchscreen-swapped-x-y;
         };
     };
diff --git a/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2007.yaml b/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2007.yaml
index d9cb53e86512..5ef38d24d6a9 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2007.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2007.yaml
@@ -70,11 +70,11 @@ examples:
         #size-cells = <0>;
 
         touch@49 {
-           compatible = "ti,tsc2007";
-           reg = <0x49>;
-           interrupt-parent = <&gpio4>;
-           interrupts = <0x0 0x8>;
-           gpios = <&gpio4 0 0>;
-           ti,x-plate-ohms = <180>;
+            compatible = "ti,tsc2007";
+            reg = <0x49>;
+            interrupt-parent = <&gpio4>;
+            interrupts = <0x0 0x8>;
+            gpios = <&gpio4 0 0>;
+            ti,x-plate-ohms = <180>;
         };
     };
-- 
2.53.0


