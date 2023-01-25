Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D78C54E94
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 16:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H7ZxoMSZiJFhUEB94nJDd2byqv5o1fmuxxmeuYbOe7c=; b=2ujuqlNCdeZCGG
	80SqKIvO1Y3KnHUMa/JcqdIAQw+mi51IblOIKxIuOljWxiSFgRTvfmFgg9TD7g9Aqua2zrtCBtRgo
	in01/iUhnFCTFSxZcLvA/oGtYapr4UagtH8GXrlhXBTWxXeQBgEGflxqU4Erd9MrQBIP/jgv6DnFI
	Kj20okOVeNntdHuxXONbMa/J47SE2uh3CN8JctBv49wS0rjGG9EeiJLPzJplmkCQgn3gB+AIBAYyI
	LG05e06Lly7DmQgMLJwP1i7fE20QMWqDCfBx9LYeVXd7HI3UNKbWinjRSTL7+uNvaT3+O8FyDawNH
	p5gnMA0s/Pg7aaqRYpiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKiur-0082IM-O9; Wed, 25 Jan 2023 16:46:29 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKiun-0082E3-Fn
	for linux-mediatek@lists.infradead.org; Wed, 25 Jan 2023 16:46:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1674665160;
	bh=paapgfjmgPaN5T7k6xQM//Hh7LSZk2RTA2PjeNkd7yk=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References;
	b=ANFwNt44vTqLx/qUQIhTg88uCtTiCcCUM5uxR4kxMFox0fYJwM1Dl35MJ3E11X+6U
	 F4XNCfVYj+OYiD64blbuTTGVCSdDQMmPSbXRPmTvbjZra5PAjxgJfnoVmFkvJjY8B5
	 ycG1jetA6G2K9muQB/sK/wdDrFmer5FNw1YAKLJ0bDKVkBmgDrKwDiwmP/CgupU63G
	 fHJAa94hqe4/BwWNrxkjH7c6KerjTMEn1fgSNlpRubQCiTKdnVGMgvbYj85rrMHm+s
	 aNlmBsPJhonUGcvNvIzhMNUJtpQVxEHgQ9AQymS8ebgVRhqdGojaNsh/lidqJ7VReD
	 RYUaVpfCJ4aXw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([80.245.74.59]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFsYx-1pSho03plf-00HPuk; Wed, 25
 Jan 2023 17:46:00 +0100
Date: Wed, 25 Jan 2023 17:45:59 +0100
From: Frank Wunderlich <frank-w@public-files.de>
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 erkin.bozoglu@xeront.com, Sean Wang <sean.wang@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>
Subject: Re: [PATCH 1/5] arm: dts: mt7623: add gmacs to mt7623.dtsi
User-Agent: K-9 Mail for Android
In-Reply-To: <20230120205318.519493-2-arinc.unal@arinc9.com>
References: <20230120205318.519493-1-arinc.unal@arinc9.com> <20230120205318.519493-2-arinc.unal@arinc9.com>
Message-ID: <BAF25F3F-7B1B-4E9D-A0D9-89DB663B0AB3@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bNw1YneOOksE+eJPmGUva0CNxBJxgB5ae3xO6hBePa2MSuh/nQd
 vXn/l1dF/q3AuhEMRCFIbdiqtXtJX+Odw+6YAc80VnfzkrFXlwzrs/8cpvln8JlrVHKt3zY
 rI1zx/kksKeOTqyT3GvoxZOwxi4Tb777f4z9Re7fM6NBLhOMOznv6IgCw77Aqii388yhmeY
 ozjMZ+RyfXYU/1fHhksQA==
UI-OutboundReport: notjunk:1;M01:P0:6Q2eUUuj21g=;XdBoI5gTcoxhHyv/16CUTI0rkiX
 Lku+RnjSg6IIMWmsm6IMFxfkoklB7XWpcx7fTsPBCrP263NlO0Tq/Yu4Qac0gQIOboEOVWTAH
 Zc/YuSEBUl47WrfzM6U1dHRfuPrDWeoxkeTjfTFGUUIDnx01lFHdpRLETZPWIvuDWC4Vz9P9H
 osOQ9P9dCnQubBay1EevAal5aLJKSKf71e2hatqFrvClCZgspIiujBow0Og5iNveaG+Iu8lYK
 z7CTtuiHLExs6RR/aaGlMujT56HqGR2KO5FD8WY1iUE8TncAOFFMWxcuiYNupF7sBFaTHOy1Y
 ergIMtRCQcOV/t9B3CE70Dmey4KLdoG21TyoCOVdHKwl8L+tQS5N2Y9vJ9JQuC0jtQk0NsQ2M
 p21szIFVD6EGIKSC4u/e7dsgB3s7gErnDTNrM67HKUKPLSY+Gy0APiB72KRVFbSTRWWBQKrFZ
 PNCNvQP5NNTL+hzudoSDtFs3vd65Am9RzCKc/iSvGK2teT22tHjxIIMXIN5jnuFLLpqET7bb/
 f+Sm42wzMgW8hUdFgfIJaCURVyNiBk+lXTHhiIC61hR/jGTIdaWbV7M2MaZE5C15XrPK+SG9/
 ORbLE7aO2pMbnLVv7klSFbmCFs2HuhiHwoa/qduAjTxGQl14ZiJkFB6epGaOgRqtNOEP511KO
 v5qaZjn41QW/nRqVayNdl39hqkwjMVcGWeT3xhLla2YzuEjC0d6W8tpq/p+jY8cpTSk3AYbT5
 NVSO3A93UjJBCHPxk2MaJfNX2TYiFTKcR6BqRglbEKekbLyTjYYMCirnAUogemHlaWNEKVpAg
 n6vUfjjJTbSS+fKVNUEPzjnOLb0GiMnSoDN3+AOrOcFa3kmSD10vI25s9gt/MGOCeLNBFsBLr
 VRoQ5/wXmzeznbm4Gl7JwRdBVbkThcC/IIq6+p1nhtSIPITKvI9B4x5cme8buR2qfMYHN+Ori
 t1a6JUKV+v1jOlHx4x9uNPh/Hfo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_084625_844874_97F21AC8 
X-CRM114-Status: UNSURE (   6.88  )
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
Reply-To: frank-w@public-files.de
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 20=2E Januar 2023 21:53:14 MEZ schrieb "Ar=C4=B1n=C3=A7 =C3=9CNAL" <arin=
c=2Eunal@arinc9=2Ecom>:

>index 25d31e40a553=2E=2E5eb698a90d34 100644
>--- a/arch/arm/boot/dts/mt7623=2Edtsi
>+++ b/arch/arm/boot/dts/mt7623=2Edtsi
>@@ -981,6 +981,20 @@ eth: ethernet@1b100000 {
> 		#address-cells =3D <1>;
> 		#size-cells =3D <0>;
> 		status =3D "disabled";
>+
>+		gmac0: mac@0 {
>+			compatible =3D "mediatek,eth-mac";
>+			reg =3D <0>;
>+			phy-mode =3D "trgmii";
>+			status =3D "disabled";
>+		};
>+
>+		gmac1: mac@1 {
>+			compatible =3D "mediatek,eth-mac";
>+			reg =3D <1>;
>+			phy-mode =3D "rgmii";
>+			status =3D "disabled";
>+		};
> 	};
>=20

>diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2=2Edts b/arch/arm/b=
oot/dts/mt7623n-bananapi-bpi-r2=2Edts
>index 5008115d2494=2E=2Ea5800a524302 100644
>--- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2=2Edts
>+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2=2Edts
>@@ -175,9 +175,7 @@ &eth {
> 	status =3D "okay";
>=20
> 	gmac0: mac@0 {

Should node not be accessed with label (&gmac0) instead of defining it aga=
in and shadow the one from dtsi?

>-		compatible =3D "mediatek,eth-mac";
>-		reg =3D <0>;
>-		phy-mode =3D "trgmii";
>+		status =3D "okay";
>=20
> 		fixed-link {
> 			speed =3D <1000>;

Same for other boards=2E

regards Frank

