Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55508C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 15:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XrvasPlawwdqQb+/egqqZOwNWCfHZWb4DgJ/dLT0v3g=; b=RYUcqOkfNURYzq
	Zv/achF04wF7Ix/ZygJ6aNRVYC9WdQE2Df24aDAcX4EthTuxYvDiLi2vhHCJ3AF8s/WjJW//RNxIs
	p3CvZw9Pn25EKHvLp/XZRWgP3LTyCnn0KKXD+g84F7R0SOEW1uLzweuRuFDpM+AOUBGR/O04H08e0
	852q4sa/BRaP0JlLQwWP/MHTs5P1f4axTzNjrPetSa1cEXn+bqyet13DNqXn3cnABKJmaGanVn7jo
	dVCWdh43aCFpq+lOvSAI/VHrLOEsj/0hsIl0pxEtrtDlJ0ngKYZjSW5Z6S2iftsg4JKlVQbgPfMNq
	LurM3Q0K3oHFJHN5jIFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMtJQ-00ExKi-1n; Wed, 23 Feb 2022 15:12:16 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMtJA-00ExGp-Tt; Wed, 23 Feb 2022 15:12:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id AF9001F44A38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645629119;
 bh=ELPweJBc6ajob3F7Lui867O0B7uOutbKAFuyBG7+YpI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dRntzR73s7+bZmeaMg/SQxnWDBkL1AIhU6PAT8n/MPSuMwzDE8nUHna9JAKcikkdw
 aSy2WBCmWQ+vXwLyYfzNZIhhxk5buaVev1Xgps9sROqdLeua7TI+F9VlJEN0fA2VnG
 KnV6g/R3LZMyXjBwQe2BlD3oCA07ZwdA91ajkVZiBwt08PGs6y3HcdkNKBAONKJ8vT
 nj80NEBPGkw6ahUoP+pA6/prEYTa2vhG0K7q06uMuq0Bv58Lb6lYuEcb23SykAz0yE
 FMfmERBoqjWOfTEi+oeiwoj0TVXa+4ZlqgqSVNKKVkYJu0gcn9U0lfq75fjPLj4YV5
 EmUUwg8++EPuQ==
Date: Wed, 23 Feb 2022 10:11:53 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Subject: Re: [PATCH v2 06/23] arm64: dts: mt8192: Add usb-phy node
Message-ID: <20220223151153.mjmo6vspg6cior2i@notapiano>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-7-allen-kh.cheng@mediatek.com>
 <20220222201034.pb36pfrgujushsge@notapiano>
 <ef364c56deef3cc20d7d7d9ca6c568c0612c7a2a.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef364c56deef3cc20d7d7d9ca6c568c0612c7a2a.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_071201_158473_564C8F51 
X-CRM114-Status: GOOD (  18.75  )
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

On Wed, Feb 23, 2022 at 09:24:12PM +0800, allen-kh.cheng wrote:
> On Tue, 2022-02-22 at 15:10 -0500, N=EDcolas F. R. A. Prado wrote:
> > On Fri, Feb 18, 2022 at 05:16:16PM +0800, Allen-KH Cheng wrote:
> > > Add xhci node for mt8192 SoC.
> > > =

> > > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > > ---
> > >  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 25
> > > ++++++++++++++++++++++++
> > >  1 file changed, 25 insertions(+)
> > > =

> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > index 61aadd7bd397..ce18d692175f 100644
> > > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > @@ -875,6 +875,31 @@
> > >  			#clock-cells =3D <1>;
> > >  		};
> > >  =

> > > +		u3phy0: usb-phy@11e40000 {
> > =

> > According to
> > Documentation/devicetree/bindings/phy/mediatek,tphy.yaml, this node
> > should be called t-phy. Only the child nodes should be usb-phy.
> > =

> Hi N=EDcolas,
> =

> I think it should be "u3phy0: t-phy@11e40000". am I right?

Yes, that's it.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
