Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547F0C47074
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jan 2024 20:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8VEB6HQwXm6DpR13vmV738GQxZIvcC/gBFklT6JV8w=; b=OrbrujSkz4ThhZp6678rQAhLUE
	v5c/4OgDeF+mSF1ZnMKGxF/bZkUUjCep1d2i7/A9gr7uiXljeWX96+9Jgfp/yI5wrxPe1R/hgp/s5
	d5CiTDKh8iFJc8DZIecXaEZ+0GNJsquj0Sf80GnTnxM3ZUBuYRlTr4rRUqun1RXV01aSPRGwTRTGf
	4dxlLat/HyUkODnyvmJoK62ZsvBwt8hp6HmdDMtTKXFSoeIDN1i2DV8WvGR8/oO/76sJZSLNT6iRY
	lWW9qjYedZcUHWRGhRFaumbgYNzxNPzPO5433xASQf/iGCF+1TXAS37XWCfNjYgsu9x7gg6whPDPk
	DpNoaf+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLUjz-00FCmn-0b;
	Thu, 04 Jan 2024 20:54:59 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLUju-00FCmI-1O;
	Thu, 04 Jan 2024 20:54:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1704401681; x=1705006481; i=frank-w@public-files.de;
	bh=SKkSJVBzIOnKnn+RMuSC3/60nyMBWnquf6LcANeBPSQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=CS2ViA3AGo92P0jwir5NIAVAgbg6yV/+1DM8ORA/rlVp8n/46+3FpFHhG3b3oDXu
	 cuSQfVCACQpt2XO/1SIKwDEWf8+7CXPyh2g51AhADAaEvRJspB7C9dMZugSvCx/wf
	 dqOleA4miuHaV7LzdRjZ9MKoVxTNTZGgApFdXmf50Y6MR9SnlCd7CODPj+0V8YkO1
	 jDaGg8yPxeZaVhMLxmhx3QwSsT5lbLMbZITqKwUvMOBjnEBCk9zGSxCE7OSbS1p61
	 dRMtq3jhAdQtWjyMhFbUgyqCmTzbWZfjCjH4g+eBuemcngs/5pLg69kRRCA8ejRWi
	 xcCEOwOsEdcaW/DCCQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [157.180.226.237] ([157.180.226.237]) by web-mail.gmx.net
 (3c-app-gmx-bs29.server.lan [172.19.170.81]) (via HTTP); Thu, 4 Jan 2024
 21:54:40 +0100
MIME-Version: 1.0
Message-ID: <trinity-940b6e7e-1246-45f8-af65-f5048bc2265b-1704401680934@3c-app-gmx-bs29>
From: Frank Wunderlich <frank-w@public-files.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Daniel Golle <daniel@makrotopia.org>, Frank Wunderlich
 <linux@fw-web.de>, linux-mediatek@lists.infradead.org, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Sam Shih <sam.shih@mediatek.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Aw: Re: [PATCH 1/2] dt-bindings: reset: mediatek: add MT7988 LVTS
 reset ID
Content-Type: text/plain; charset=UTF-8
Date: Thu, 4 Jan 2024 21:54:40 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <3e3455a1-c540-4323-9d9d-95289a395c3f@linaro.org>
References: <20240104173930.13907-1-linux@fw-web.de>
 <20240104173930.13907-2-linux@fw-web.de>
 <ZZb0-pFWxuQlEm7q@pidgin.makrotopia.org>
 <3e3455a1-c540-4323-9d9d-95289a395c3f@linaro.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:ZLdxy+zk76HP1t6Fqt05SLqZ3emcYLI8IAqKeFvSrgvBnnBbjqewMQxqbTy69hsc+QjMq
 lffypJx3P8BsU3PPzXiNZ5iojUA+7zknLAIk7XF3U36Z+N7bEAwaU2K1eV7NAKq7kmSd4mpUPK+T
 vDzWopQ/zM2pdfMPWYpXpoCVWNC9FZ11a6/jlaAyfC76iBU43/oW6nF4ftAFkpAuDk1VQifJsRRt
 /DPKTi1eHs5BVsIJjmVGcHVGXxFgQAf+CLejc8zBq1p4omlNorq+qAWl9EbZnCR7WpMLsaSSMCrg
 eA=
UI-OutboundReport: notjunk:1;M01:P0:tB+ieJbTebQ=;0WICBO5JQdiX9M3vSS+T9ckm3a9
 bGtqXX18GHN6TYSLML7cneFFD2QCV0i55WJmMuU6C3NnsZzm7XZGNPSL2fVmEnaarxkfVGXtH
 u0nyxo+FCXPVprhuYZwKluLsQBI3+AXoNTKEC1lxjGM4TAqbZdgH/dudmrYqXpk41uBE9I7az
 28FsvUElYvWBgGO3d4PSJIV07+q+uNKtXYoVq0WXrDRc7Lv/Q9dVYqrqkS0aOU+htULnJ7gnC
 W4vYjamfWlb1Y5LFMNu5YnNeMTNB6frj+XOUNOB7mjf2rz1sMJWg/sKW6xDIkO0kFrtCm5k1a
 F11TBoh2WrGmunSRhCxHPFEQGJrFQ8B412mqr5ubbuLZ2GCk9dtUuen9PapKyofzttvcPrQpw
 j43qPTxTVd8R1zxscAxHJpb/ivgBL8Mqj69QbRe4ldLrHCwG9yQKJrAIu9jVR4UMg2vqkcj5L
 MW7ijNCAOaO7maqwa9Ab3t80RzVf5gR0ljoMBy6yT0dKFAJdpaVsTXC2FrNMZB69CkB2oZvBo
 gg15EsOhF7obUIWzF9KufGYYGe450auwNceaiXv6HkQkER69bQ0Tu+sa5Aqwi7iUWKM5Xmdcb
 oIQIk0KRkBriUvzo9BohB5dUnA4bO/Hz6B8OkZGDra9DdSQJEuz22LiDCotNZpdcmvmVl0zXS
 UX33TFUhPKS+oQYZPEzeiXoZ075J/2FfTS/iCboU/HXZCuIlgNIY6oYNRD1MYIzyz8+axCWPZ
 N1f6B/PcyoF1JfUlNwKCQc78IOgdR2C7ZopRmhPBJTDir9ozPjav8PFHiwGrD6Hbw9JOFQR00
 VTrNtPB/zjBe/yMvvEQ7lLkyiSPb2CATLh6gaNXrFcPOk=
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_125454_857948_C72D8C13 
X-CRM114-Status: GOOD (  24.30  )
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

> Gesendet: Donnerstag, 04. Januar 2024 um 20:19 Uhr
> Von: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
> Betreff: Re: [PATCH 1/2] dt-bindings: reset: mediatek: add MT7988 LVTS r=
eset ID
>
> On 04/01/2024 19:12, Daniel Golle wrote:
> > Hi Frank,
> >
> > On Thu, Jan 04, 2024 at 06:39:29PM +0100, Frank Wunderlich wrote:
> >> From: Frank Wunderlich <frank-w@public-files.de>
> >>
> >> ---
> >>  include/dt-bindings/reset/mediatek,mt7988-resets.h | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/include/dt-bindings/reset/mediatek,mt7988-resets.h b/inc=
lude/dt-bindings/reset/mediatek,mt7988-resets.h
> >> index 493301971367..3f1e4ec07ad5 100644
> >> --- a/include/dt-bindings/reset/mediatek,mt7988-resets.h
> >> +++ b/include/dt-bindings/reset/mediatek,mt7988-resets.h
> >> @@ -10,4 +10,8 @@
> >>  /* ETHWARP resets */
> >>  #define MT7988_ETHWARP_RST_SWITCH		0
> >>
> >> +/* INFRA resets */
> >> +#define MT7988_INFRA_RST0_THERM_CTRL_SWRST	9
> >
> > I suppose this argument applies here as well:
> >
> > "IDs should start from 0 or 1 and increment by 1. If these are not IDs=
,
> > then you do not need them in the bindings."
> >
> > https://lore.kernel.org/all/59629ec1-cc0c-4c5a-87cc-ea30d64ec191@linar=
o.org/
> >
> > As a consequence, as what you are describing there are hardware bits
>
> If this is existing driver which already uses such pattern, then it is
> fine. I usually comment this on new drivers which can be changed.

this is a new driver so i guess i should change this like daniel suggests.
As i want to use this constant in dts and driver i would like keep it as b=
inding in the reset header,
but because i use it only as index in the infra_idx_map array its value do=
es not need to have the value
needed in hardware. i kept it same to not have different values and for or=
dering purposes (when the other
possible resets are added).

so the way starting at 0 will be the preferred one for me, is this ok?

regards Frank

