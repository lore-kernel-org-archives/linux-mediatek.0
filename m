Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7CEC433FE
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Nov 2022 15:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XP/6vX6vs9D3xltQRgo9tTU6nvZGM+5reBnZ4jrtrcc=; b=CHTXaIfnj6XST9xRKFCdhVmImF
	HveraJu+c2KjZ3S0bVJGZwcaW6XVTADPmWBkxgJ2sL9FNKZGlUuPIcm1fb0v2l3WabftkBOW9aKIE
	0Xkvv0mcvFKSJVAKInKiKbVSaKW4k0irFDtmXETw0MmdmjZKL6RgBSt9nTT0j9p7OqX0A41Z0EuwJ
	Emw7tHy4/x9/4iI+CRM4u6QqA7RpueYD6gadNl4ASN9TnUF67VJVc+TGBUtuCrrN6PzKxjn53N3xa
	UGsnsIB/NRp5DE+gPIBrl+0DFNAV6Lf8JJ+W+iolnrV29mn85f0xWRhF07KpF9mFSQSn5Z/X7/JDL
	Vafm12MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orKj0-006mgy-Tl; Sat, 05 Nov 2022 15:04:46 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orKix-006mgA-Lw; Sat, 05 Nov 2022 15:04:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1667660667;
	bh=9HRqnYYikNNPoD5ufxUfY6iw/kgmW0wRUIiv/To2cDw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pEdIySWYG/wUQainNcS2k3z5zM++LsIUvl5hkt4NpHiScpg9yGT0Tqgp100kaNMqs
	 68Y9WQ6/6dx4iBAY0eIsV//aYuAFR+WLDdozM7UVZtVCYUPGd42sNQjCnenzWUuzGs
	 I4bzU2AHjp1ltYD9AtQzD1n5B+PuHVSWUZxJPEgjlvtcRfMD2oPm1tlu5U15ftwVMB
	 ZNecmkSGPbzrgWrVSSt+QxV2G3fZgzrOwrx85ASGxWCABdRcUJ+UxksOryimFgkcuv
	 122uHSMYPI8UrVs8Y2w2r5aNlnj62tQ+BkbmIbpPh1D3Sp57OD9qn4U4McE2dKgmYh
	 d0gI5IccBFnzQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.159.50] ([217.61.159.50]) by web-mail.gmx.net
 (3c-app-gmx-bap26.server.lan [172.19.172.96]) (via HTTP); Sat, 5 Nov 2022
 16:04:27 +0100
MIME-Version: 1.0
Message-ID: <trinity-93c64b9b-8363-406b-aa0b-07e6802ec84b-1667660667233@3c-app-gmx-bap26>
From: Frank Wunderlich <frank-w@public-files.de>
To: Rob Herring <robh@kernel.org>
Cc: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Linus
 Walleij <linus.walleij@linaro.org>, Sam Shih <sam.shih@mediatek.com>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-mediatek@lists.infradead.org,
 Sean Wang <sean.wang@kernel.org>
Subject: Aw: Re: [PATCH v3] dt-bindings: pinctrl: update uart/mmc bindings
 for MT7986 SoC
Content-Type: text/plain; charset=UTF-8
Date: Sat, 5 Nov 2022 16:04:27 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <166765939212.4158869.5881767839110614067.robh@kernel.org>
References: <20221105092500.12145-1-linux@fw-web.de>
 <166765939212.4158869.5881767839110614067.robh@kernel.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:9i6nkkBvk3T5O3ufr7r4jiF+bmV1GKMrD01K5YQwqSEMvYaep/nf7+b+ZBktNGIFNaSWT
 k4rUG7O3gBAshWE1PcW0hdTJ7LRDYBKZDZaz5wOt4UjmCkNbnvtz8EkzGXxzCCAOBkzesai2NKAu
 kNwp5DEvI5JvXLsFZH2gMf6n6ZOA1vjRqAxv87RvdxDDBQQGj/man4mEqksVg3YiJle8dlen6A95
 NxBNsn4c3stFzaaZboDEJgNXZVZD3zkqyG0g/XIkzyrNvGJQB2/8rMtCrxZlcy1BfsvAszn6fYdS
 aI=
UI-OutboundReport: notjunk:1;M01:P0:3XgvP+Ek2cQ=;urkMPgTvJPxr4uarHrkP6J2gErj
 YjTDX6vZGD3PnvOBHnh1i7g21qceKgOr87hkr4xw8nv66qdF7x3O81XCNP/ov1KyBHDNHYVgs
 rCGX/iSGWEfZy/+1tIXLtIfOrlodzD6odIqaXO2n0uLaqrJ0VTn5IEsvVkFmt14D43JQVzDmz
 7KEmiB8gIW4P+Icj2GXZJCRHVp6p1DwjHZfnAS9mk2qjEYmI7YsWxnyDiPgt0/gjFYJlVayeZ
 QZOey+xl4kb98Wm+YHZ03wnBxWMxrbLK7XG8r7iNWUmhQL2y5buj0Hezp7BthKUaXK2AX53z2
 XiEQgE7Emp1fPhpRmMs1gnVSr7DKy+Wq/EaMu6A59ylSi0S9Aitj0jaFjT+hvnk/j04+c6XRY
 0+Enkk79ppwW3DsP/Wk/1fbAzRep2XB7B24wb54LwzwvPvMzH/dydigXEi1gLE8UVD7V3Z336
 k6ANT+s0hMBfmd5xa2CTPOYRl1cxYGT9Q5f9d8fg8iXzi56HdEJ4vQw86ImL9wPx6WrvweEL3
 i+Lg0gGR5VSxVNpmwc1TsSXfNV/SgoQgLeN++vM3VzppJWM9MR0pM8fBGXTpm+jIyEVY1/TjP
 TZKqQ1EqOTthP3me5UXPUB0aTJy7aA5mJnvFTZ9hQWcsRQ5ptc6JOT/RKueh5tm8bRFe8q9ZZ
 juCDjMRm3yl2VIdAdGDz04aPYqWjdyKsoH0JpZkFe6Qns0+iHlJfjNzE3mWnXuNq/7VkZ9MfL
 y785P36gtS+UFgj/BZVnoJl6PeqIPN289mmwFdC17LaLipTD4XjrgUHawvYXktxWZuTeSSGPi
 R9TWw0xuc8+oiYWsq9CueiT5vX4mlbDRYiSpmiIIM1fE4=
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221105_080444_017764_03745C91 
X-CRM114-Status: UNSURE (   7.25  )
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

Hi
> Gesendet: Samstag, 05. November 2022 um 15:52 Uhr
> Von: "Rob Herring" <robh@kernel.org>


> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_check=
'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/=
pinctrl/mediatek,mt7986-pinctrl.example.dtb: pinctrl@1001f000: pcie-pins:m=
ux:groups: ['pcie_clk', 'pcie_wake', 'pcie_pereset'] is too long
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/device=
tree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/=
pinctrl/mediatek,mt7986-pinctrl.example.dtb: pinctrl@1001f000: pwm-pins:mu=
x:groups: ['pwm0', 'pwm1_0'] is too long
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/device=
tree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/=
pinctrl/mediatek,mt7986-pinctrl.example.dtb: pinctrl@1001f000: spi0-pins:m=
ux:groups: ['spi0', 'spi0_wp_hold'] is too long
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/device=
tree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml

these are handled by this Patch, sorry to not mention the depency

https://patchwork.kernel.org/project/linux-mediatek/patch/20221024074349.7=
777-1-linux@fw-web.de/

regards Frank

