Return-Path: <SRS0=Tto8=C2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C486C433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 16:55:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0BF12078D
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 16:55:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jmQkVJOD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZezngZwD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0BF12078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Jx9bhwbZPv72uUIezd+RvwPGsD7fgU0g3qINsdXFA4=; b=jmQkVJOD0pxkgUTBbVde1ao+57
	8HG94cTHnQ8TJEH/O35RX1CFDPWRVSFH5WEc42aG72Ii7q23mDtDMUxPUs52wtHQofixtvM6fCKIV
	xhiavsWq45ssr91SHAw34en7yJqhaNBTbtidlDxHtwVxhKx/hGdxnym3DcmaFOHZQuBUCSXFAyGYZ
	yBWYVrDFvXdVIiyX8k/4Irz2pkcW+lZttAIcz1pczdrhuEkJ1FE+asVBRH7PClcfvKu36PxaUkAlk
	/2qfHkfYlMsYA1atFaeBVjrr+b2jTC5h9EDSka6fdX6Ng0e375njA8L7kuWfg2qlmXOxoS8BnqqJR
	fA3DBiww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIxC3-0008Jg-4v; Thu, 17 Sep 2020 16:55:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIxBy-0008HY-It; Thu, 17 Sep 2020 16:55:31 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 647A521D24;
 Thu, 17 Sep 2020 16:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600361729;
 bh=pV5NUEmeW9mZ1TS+/Jc3oFxArHOIVWs9UQjncMMV5dA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZezngZwDO3KQgBWc5kH7o+363k3VkzXLGbSLbSc0tebpQso6t6pYwNkEyZCDiQPmV
 SDInDhjroyojBh7Mphf9Czz2rjH6R5ZkFLMbtuCEXnnrfdP8uQrsgKQcvItrVphoK1
 F0JF12gmB5ueiJxBeEsZOAKj0ouhtPyo/iU8CgBA=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Hoan Tran <hoan@os.amperecomputing.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Lee Jones <lee.jones@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Anson Huang <Anson.Huang@nxp.com>, Sungbo Eo <mans0n@gorani.run>,
 Stefan Agner <stefan@agner.ch>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, Yash Shah <yash.shah@sifive.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 - <patches@opensource.cirrus.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Amelie Delaunay <amelie.delaunay@st.com>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Andy Teng <andy.teng@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Sricharan R <sricharan@codeaurora.org>,
 Chris Brandt <chris.brandt@renesas.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-unisoc@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-media@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 06/13] dt-bindings: gpio: gpio-vf610: fix iMX 7ULP
 compatible matching
Date: Thu, 17 Sep 2020 18:52:54 +0200
Message-Id: <20200917165301.23100-7-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200917165301.23100-1-krzk@kernel.org>
References: <20200917165301.23100-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_125530_985347_57163333 
X-CRM114-Status: GOOD (  13.59  )
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The i.MX 7ULP DTSes use two compatibles so update the binding to fix
dtbs_check warnings like:

  arch/arm/boot/dts/imx7ulp-com.dt.yaml: gpio@40ae0000:
    compatible: ['fsl,imx7ulp-gpio', 'fsl,vf610-gpio'] is too long

  arch/arm/boot/dts/imx7ulp-com.dt.yaml: gpio@40ae0000:
    compatible: Additional items are not allowed ('fsl,vf610-gpio' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 Documentation/devicetree/bindings/gpio/gpio-vf610.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
index 82f3e4b407d1..7a5745255969 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
@@ -22,9 +22,11 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - fsl,vf610-gpio
-      - fsl,imx7ulp-gpio
+    oneOf:
+      - const: fsl,vf610-gpio
+      - items:
+          - const: fsl,imx7ulp-gpio
+          - const: fsl,vf610-gpio
 
   reg:
     description: The first reg tuple represents the PORT module, the second tuple
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
