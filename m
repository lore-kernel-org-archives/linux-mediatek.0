Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C150CD0D7A7
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 14:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lU+ODpKYzQeoYo8h67RvQnw+QkGXG4J85yFxYTyLDVo=; b=S8wBhK7iQoG9wNZH+bmZeMrrVM
	R0gp638GHujpQQe/FlpnQl4pWMnZiQkYoIuO7DyyXZXT7f6pYCq0EjLwcmjL2DCkiy8i6d+daRCuy
	Z1ZfyfMc2Ku5ZqqWmwYv5+57EiyoZsRt3r0YfnSHeD4bpJFF38DRKocUykPMfOc6+ulYFn4hRdnAP
	NP29PqxLkDRGJ+lW+M3JYJDYBnuXXZpsgkfXnW0x/6od/7f/74rQjmMO0RrsmXOY31+eLpqhK7weT
	DzGXerJScl/D56X47X6WE2KMnwqcS0BNrOlPm6w+S7SU1YSnSN4xZa/E7YFuDlCxVMCZbWPPzE2ae
	Es+t0+Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szGrb-0000000Geim-1oqg;
	Fri, 11 Oct 2024 14:43:31 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szGnQ-0000000GdIs-051b;
	Fri, 11 Oct 2024 14:39:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1728657543; x=1729262343; i=frank-w@public-files.de;
	bh=lU+ODpKYzQeoYo8h67RvQnw+QkGXG4J85yFxYTyLDVo=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JqDUCICbnOrxABz9wM10IGJbjWgm04rKJRLxK9SJOon2oxxcfb1wms95jDGgGiWR
	 2eiUGRRgroWDKdyWqQ0gsg03IFa/DjhDJGnqFeqVSh6Bb8j0R4+UljvVtZytgdTi+
	 gNcyp59glSfajfd14YMC3/HQ7Ok0i9+kf373Qz0xWh7Ybs5600QhyQy/3/rRqZIpx
	 EGsJHPJfCH+NWTyogYtJlaKGNvjeVlF9XXmEVXzq9VwJ2Nhf/1RVwyxBaMHPq47yI
	 ZJ01CC1DWoY7VHwtos2MRNBPa2T+08DEF9w/fmJNiR9PF22diX0C3LaoKXi594mLO
	 ZMkvLl70FqLLEnlcJw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.153.152] ([217.61.153.152]) by web-mail.gmx.net
 (3c-app-gmx-bs32.server.lan [172.19.170.84]) (via HTTP); Fri, 11 Oct 2024
 16:39:02 +0200
MIME-Version: 1.0
Message-ID: <trinity-a263618e-97dc-4b69-bc58-577ddc6b6b6c-1728657542941@3c-app-gmx-bs32>
From: Frank Wunderlich <frank-w@public-files.de>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Frank Wunderlich <linux@fw-web.de>,
 linux-arm-kernel@lists.infradead.org, Linus Walleij
 <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, eladwf@gmail.com,
 Conor Dooley <conor+dt@kernel.org>, john@phrozen.org,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, ansuelsmth@gmail.com,
 linux-gpio@vger.kernel.org, daniel@makrotopia.org, Sean Wang
 <sean.wang@kernel.org>
Subject: Aw: Re: [PATCH v4 3/4] dt-bindings: pinctrl: add binding for MT7988
 SoC
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Oct 2024 16:39:02 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <172850877244.733887.12458885415029802904.robh@kernel.org>
References: <20241009165222.5670-1-linux@fw-web.de>
 <20241009165222.5670-4-linux@fw-web.de>
 <172850877244.733887.12458885415029802904.robh@kernel.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:MUSmFu6PjzeQgExIQunxlF/xCs0a186IaUgqTQ3hv/mYU79yMFfqqDtyGqe27BxlQ00DX
 oD9jm3pgD/qDHE1HORDb5EM7VJLpcqHM8hOeC+Bj7cVn+b2U/oyzg0CUGg3OHRIeOyfTjzM6177J
 +4gPTzQuMu4u3MYh/yjOE+uOIzfRYyTta7+1rkjFQcwdVQekfk17jt7dwhd2GOJn48pYgO6ZhY4p
 8RBI12uAAz4ybuHqQuO6sMenmkRsMKZjafBzWmSgiUm7bLvdQOr7XmJh07UmbOCHtWwetYydNmIc
 pI=
UI-OutboundReport: notjunk:1;M01:P0:AEqOF9MZpBU=;RVC2fecryF6FkTHTvCByH0PRP/Q
 R+CRjZb1Sya/1u4i8o84+oOSjXSU2dCKKXgIztiORmqbTn4FWDyp8zmnMNDubidtBItXOUOZH
 uULcMTLZPadvsdW3AZSNyzzB6+4S2spEIspIAH9HEjVo3ny3+KYgnZX8aGcVRYDryVovAJI3g
 xySppHbpJtOBjKc5cwKUO3S7WXTWgsuuGBx8OIoJVxt5rgosEhvO0fGabkk0KDJvQu4HZOEeo
 0vcFuF8+M9JuvuyB4aFqww0zoUdO8frNd2BZBfSV5RXI/DIhF7mu3YbGvCMbKLj1l+e/z/Vkp
 hzbXawd5ewCccVwNj7XX9jfFiS41zSa1uyXgH5bQjx9llajl/BPJWZTrwLKfAxQkH5Iq6SEPW
 a1m1Wy3ey6fsHKSXAuE+N2FGoLlrChH2gxG1I7DopSGGTyu50iZJxxXuNxADSEtQcL09g9Nxu
 hcURvHwYia0+VEL4La8wu5esGo97aPWyNv/YJbATQSq/UfG/W0AMsqAySyFLPIggUDwAQ2Odh
 4fsL3kFRiv2D0ofMVd3oPjVGsmSRQx22A1S/7IQU/vnQkvcQgEWuOR2bTYKKfhesV8XiZn3Jm
 oW7pby7E+lzgp5k/oBCykl03yKFfUGbn4mxhTr3z9toIimm7nmlI6KPlN7pS5Iyu3rZYb9zXU
 h5L+tshtJJd/q428GnRLa2u7+JqWu5REtgToV84jJA==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_073912_370805_EDD5596E 
X-CRM114-Status: GOOD (  17.21  )
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


> Gesendet: Mittwoch, 09. Oktober 2024 um 23:19 Uhr
> Von: "Rob Herring (Arm)" <robh@kernel.org>
> Betreff: Re: [PATCH v4 3/4] dt-bindings: pinctrl: add binding for MT7988=
 SoC
>
>
> On Wed, 09 Oct 2024 18:52:13 +0200, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > This adds bindings for MT7988 pinctrl driver.
> >
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> > changes in v4:
> > - dt-binding: pinctrl: fix dt_binding_check fixed-string error
> >
> > '^mux$' should not be valid under {'pattern': '^\\^[a-zA-Z0-9,\\-._#@]=
+\\$$'}
> > 	hint: Fixed strings belong in 'properties', not 'patternProperties'
> >
> > changes in v3:
> > - limit conf subnode name with optional suffix like mmc on mt7986
> > - match mux subnode without wildcards
> >
> > changes in v2:
> > - drop gpio-cells description
> > - move ref in mux subnode up
> > - order uart-functions alphanumeric and fix typo
> > ---
> >  .../pinctrl/mediatek,mt7988-pinctrl.yaml      | 571 +++++++++++++++++=
+
> >  1 file changed, 571 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek=
,mt7988-pinctrl.yaml
> >
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>
Hi Rob,

thank you for RB,

i would change the drive-strength in the example also to 8 based on angelo=
s [1] review in next version

+        mdio0_pins: mdio0-pins {
+          mux {
+            function =3D "eth";
+            groups =3D "mdc_mdio0";
+          };
+
+          conf {
+            pins =3D "SMI_0_MDC", "SMI_0_MDIO";
+            drive-strength =3D <MTK_DRIVE_8mA>;
+          };
+        };

to

+        mdio0_pins: mdio0-pins {
+          mux {
+            function =3D "eth";
+            groups =3D "mdc_mdio0";
+          };
+
+          conf {
+            pins =3D "SMI_0_MDC", "SMI_0_MDIO";
+            drive-strength =3D <8>;
+          };
+        };

can i leave your RB (so you do not need to look at it again) or drop it be=
cause i change the patch?

regards Frank

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/202410091652=
22.5670-5-linux@fw-web.de/#26062582

