Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1033C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 20:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YA1g5Ax6xB6c7XBvfIaynAhbuEbXHLTis2605rZuqug=; b=cjVX+xESLbNr28
	X5SatgBEOeAPsEQRw8T2g474Y8j+fhVINmChWnS0kkl0fmzEJIwHG9TPKCcquBnKvDPuIdh9ubrod
	LX5rkKYuAg5sCEWCjQJmYyamiV51b2cUhkPN5TodXSPJAQp4KlSEx4fRSo6/ryetipMVd2H/Q+6BL
	bQLkIqX+ti90rVRUhD5ANGcnrXYg1mo2nGkOjuo5Cj2Fh+NIktEEFgywEVbU+9SDD/uJIMNfUnNVR
	dm67niFgJT7o2y43IPQQkP6rtpMvmuDr+DTJNWdcfXmo8nOVQwu2MmZv3hG/581F9LcxYiTEMb2S8
	8sGS7DkS8CFKDVU7zc1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNhMG-006vWC-Np; Fri, 25 Feb 2022 20:38:32 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNhM5-006vUX-7o; Fri, 25 Feb 2022 20:38:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 59CCA1F46676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645821491;
 bh=GRjW8l7YFs9I63NHiDMM0zXU7yqNHLmPi/NdZK9uZMQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sgv6tAZCt63KpQGsQ6MjbY8+Eg0hjF3u8RZxljuhM7GeGlwnHTy/xFzLa7uXpOEh1
 zaiqxJiOey9dOPHl56LaP/rLhtkXvZL8j8VaA1IklBT2PKiDhqUar57g2nHfZFZI0U
 lzS+1qHP0IDOm74OMrYBvE7A3ZIteKH5Lgl2xdYASzinXu2WRL5VsmeE+WlQMUOEcT
 dKAd1werFHy26nAbHbvlw7yjo1oFS1g92McSqdKABcAcI0PLuelxlCGHjZQyTi5sUK
 GU3mQo6pYuVVrRz5k9wfKEu06r1y28nAqcyW6aeJdQrxLClFnIaEZS87sUp0UKqJ2i
 vX5GeU9G/Mqtw==
Date: Fri, 25 Feb 2022 15:38:05 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Subject: Re: [PATCH v2 14/23] arm64: dts: mt8192: Add mipi_tx node
Message-ID: <20220225203805.xv3sxwi6ucfp6zdq@notapiano>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-15-allen-kh.cheng@mediatek.com>
 <20220222212658.xuau6t3xcvu7m4uz@notapiano>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220222212658.xuau6t3xcvu7m4uz@notapiano>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_123821_440237_CC26416E 
X-CRM114-Status: GOOD (  16.11  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Feb 22, 2022 at 04:27:03PM -0500, N=EDcolas F. R. A. Prado wrote:
> On Fri, Feb 18, 2022 at 05:16:24PM +0800, Allen-KH Cheng wrote:
> > Add mipi_tx node for mt8192 SoC.
> > =

> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > =

> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot=
/dts/mediatek/mt8192.dtsi
> > index cfc2db501108..f5e5af949f19 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -1114,6 +1114,16 @@
> >  			};
> >  		};
> >  =

> > +		mipi_tx0: mipi-dphy@11e50000 {
> =

> According to Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml,=
 this
> node's name should be dsi-phy, not mipi-dphy.
> =

> > +			compatible =3D "mediatek,mt8183-mipi-tx";
> > +			reg =3D <0 0x11e50000 0 0x1000>;
> > +			clocks =3D <&apmixedsys CLK_APMIXED_MIPID26M>;
> > +			clock-names =3D "ref_clk";

Also, this clock-names should be dropped [1].

[1] https://lore.kernel.org/all/CAAOTY_84OF71QK6M5JT1M5YAFKED_xWVpx8B8t859O=
sVxE0cfQ@mail.gmail.com/

> > +			#clock-cells =3D <0>;
> > +			#phy-cells =3D <0>;
> > +			clock-output-names =3D "mipi_tx0_pll";
> > +		};
> > +
> >  		i2c0: i2c@11f00000 {
> >  			compatible =3D "mediatek,mt8192-i2c";
> >  			reg =3D <0 0x11f00000 0 0x1000>,
> > -- =

> > 2.18.0
> > =

> > =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
