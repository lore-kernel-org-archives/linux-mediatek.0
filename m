Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC35AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 20:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l9QI2U+SrG3ZPqqD9A2eNNYt88qbCIBlsjXJOctDAD4=; b=Zw7DZp7fEXLv3Q
	wxPha8KdDFs9250l7M617LWtMzOsnT3zTnA6xvREhRdyMh+T3MsI+ykn7h7kdSIluK4pVOT4KGjF0
	dbFVNy8tS1GfA56aguhi9OAuaeDICapERFlThmmBhDvFKiYJk6Aehd9CY87OPoshDrym2rTvfeJa6
	d7Z1Z21gYC5qtchZQ2v7BASdYzfM7OxhOH2jVttk6OXsAZSAJFjbMGKfJFvHhhN/u7LyyOLV86LNt
	zphFykpUFsxgUxDeLhFMYbhHs776MRpvreXgoikemAi/vo1b1ycaUbrqXgRKWrz4xIUbhkpXQoUw+
	mL+PKA4FUQycfXgV51Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZIBt-00DQEw-CI; Tue, 29 Mar 2022 20:11:45 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZIBh-00DQCB-LX; Tue, 29 Mar 2022 20:11:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id EBFE51F4411F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648584690;
 bh=3+u06kszAFsjGLV5kQ+MCKFOJ2X8S3uDlpfpQmxL90I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hzs3k3hRcp2Xgj8dg4wykt9DEvnOqLtFTAwiQn52KasZKnxABiJ8ZqHm80rFmN2zw
 gk/Nu1NPhJe9wi4hwY4tXBGODvv1+vGcsKnse9BI/+tWrI04U0Q4nKNd0AOt3nCkxt
 Nkj9UbN/BeHI/6eyXcsbIRyGq4iqzqGB6tLrUf8s65ZlshT0HbVlPYM25qmziUFctI
 /jp9wRmW6oE0CtHkd4msDr56ZbZiKVIfSS4mpxLEcr/Yim05SBXzWoKJze20Mh1F0W
 JLCE576lwdtq043wca8cr4hPBYVd0agH2iIflvtZU/6Wx35HJCs3CfvMmNFrCSqtr3
 wA7zhvO7xl94g==
Date: Tue, 29 Mar 2022 16:11:25 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
Subject: Re: [PATCH v4 03/22] arm64: dts: mt8192: Add gce node
Message-ID: <20220329201125.7l47kl7rmf4hjyvc@notapiano>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-4-allen-kh.cheng@mediatek.com>
 <a4935385-e7a5-8650-914b-73c699d2f8ca@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a4935385-e7a5-8650-914b-73c699d2f8ca@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_131133_877876_80FCD76A 
X-CRM114-Status: GOOD (  14.67  )
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

On Wed, Mar 23, 2022 at 06:24:03PM +0100, Matthias Brugger wrote:
> =

> =

> On 18/03/2022 15:45, Allen-KH Cheng wrote:
> > Add gce node for mt8192 SoC.
> > =

> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> > =

> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot=
/dts/mediatek/mt8192.dtsi
> > index 0f9f211ca986..9e1b563bebab 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -6,6 +6,7 @@
> >   /dts-v1/;
> >   #include <dt-bindings/clock/mt8192-clk.h>
> > +#include <dt-bindings/gce/mt8192-gce.h>
> >   #include <dt-bindings/interrupt-controller/arm-gic.h>
> >   #include <dt-bindings/interrupt-controller/irq.h>
> >   #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
> > @@ -552,6 +553,15 @@
> >   			#size-cells =3D <0>;
> >   		};
> > +		gce: mailbox@10228000 {
> > +			compatible =3D "mediatek,mt8192-gce";
> > +			reg =3D <0 0x10228000 0 0x4000>;
> > +			interrupts =3D <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH 0>;
> > +			#mbox-cells =3D <3>;
> =

> #mbox-cells should be 2, right?

It should indeed. The mboxes property in patch 21 should also have the third
argument ("1") dropped.

Thanks,
N=EDcolas

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
