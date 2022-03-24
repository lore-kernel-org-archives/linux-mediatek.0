Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A7FC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 13:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yke2hMLWehsLz1Z33h8ItKozWXjwKWub8P5ws1A7aOY=; b=WnXGGKHMycqGVl
	pLFPb7fRyFuuKd90ZkiqFdwp2unfLVKhaufznlQtZRHJrbV/Zqqgd+YQX6H41nMIHKgSwzcqyHPIj
	ieF+RTGhh8fG7fb4bzDM+QWat/ik46pjmtsH5Xauf3hHPMqVNA8rPUkUuXhRde/TNU1f0kTZZiIiz
	VQoKKsxVZAqEl5THDuZsyyV3voUT9BPSgv/Ex45KRpE9tKUIg1iqHEkVjFEbUMoo1aJi7OTSbGAgb
	dXDNuKenT+Om6qLY+rcxe1gk1DVR/Lo0ff/NRbSpWYqd8djxZNMenlNVLnfrHAEzBtKo2+ptfArR3
	pt+HcqAzCCgy9UaL1TPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXNye-00Gm2Z-Ie; Thu, 24 Mar 2022 13:58:12 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXNyR-00GlzV-Oe; Thu, 24 Mar 2022 13:58:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id BD17E1F45386
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648130276;
 bh=pN1jpxdf4LxqwDnLQ6UhkLVGWH/ctyBoW4i84SPXeMA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LG/O86QDXq0SgsEO7Pa0W0HufhfQSIhOe0IVzNpYwjc1m5/B2GAxWiXJSqWRfTqzZ
 FyLHZy7Eqxma6zRMLOx36OGjqClNiIRA21Fo95pC+biCGT8WwT97yGxjbSM+uT1Y/z
 2AMT/H89sNaJEMSB/dl+kiRWJjrnXvx5rEukPBHwPiA1Ax5czAiSjQRMJikaKbDOtP
 xiV835X0ZE+KDqnzg45WYO8L4jBiKDO4HSsve7j4+lSRVczDZXlyaNpKQUHuwDaeKP
 Eff4EkTIO1FyU/zFkNl5SEsl2MC220wsOq6pPpB88Yy/uSEAbEKMRgjOYPLC++pVPo
 nRUaMQMSNYHmg==
Date: Thu, 24 Mar 2022 09:57:50 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 08/22] arm64: dts: mt8192: Add infracfg_rst node
Message-ID: <20220324135750.652j2qwjz5lkwejs@notapiano>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-9-allen-kh.cheng@mediatek.com>
 <20220322215754.j2hzutm775hvr25n@notapiano>
 <17bc30c64db3f3280993669a39edf3a11f76fb68.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <17bc30c64db3f3280993669a39edf3a11f76fb68.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_065800_089951_6BA8F9A4 
X-CRM114-Status: GOOD (  30.42  )
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

On Wed, Mar 23, 2022 at 02:27:00PM +0800, allen-kh.cheng wrote:
> Hi N=EDcolas,
> =

> On Tue, 2022-03-22 at 17:57 -0400, N=EDcolas F. R. A. Prado wrote:
> > Hi Allen,
> > =

> > please see my comment below.
> > =

> > On Fri, Mar 18, 2022 at 10:45:20PM +0800, Allen-KH Cheng wrote:
> > > Add infracfg_rst node for mt8192 SoC.
> > >  - Add simple-mfd to allow probing the ti,syscon-reset node.
> > > =

> > > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > > Reviewed-by: AngeloGioacchino Del Regno <
> > > angelogioacchino.delregno@collabora.com>
> > > ---
> > >  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 18 ++++++++++++++++--
> > >  1 file changed, 16 insertions(+), 2 deletions(-)
> > > =

> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > index 40cf6dacca3e..82de1af3f6aa 100644
> > > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > @@ -12,6 +12,7 @@
> > >  #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
> > >  #include <dt-bindings/phy/phy.h>
> > >  #include <dt-bindings/power/mt8192-power.h>
> > > +#include <dt-bindings/reset/ti-syscon.h>
> > >  =

> > >  / {
> > >  	compatible =3D "mediatek,mt8192";
> > > @@ -267,10 +268,23 @@
> > >  			#clock-cells =3D <1>;
> > >  		};
> > >  =

> > > -		infracfg: syscon@10001000 {
> > > -			compatible =3D "mediatek,mt8192-infracfg",
> > > "syscon";
> > > +		infracfg: infracfg@10001000 {
> > > +			compatible =3D "mediatek,mt8192-infracfg",
> > > "syscon", "simple-mfd";
> > >  			reg =3D <0 0x10001000 0 0x1000>;
> > >  			#clock-cells =3D <1>;
> > > +
> > > +			infracfg_rst: reset-controller {
> > > +				compatible =3D "ti,syscon-reset";
> > > +				#reset-cells =3D <1>;
> > > +
> > > +				ti,reset-bits =3D <
> > > +					0x120 0 0x124 0 0 0	(ASSERT_SET
> > > | DEASSERT_SET | STATUS_NONE) /* 0: lvts_ap */
> > > +					0x730 12 0x734 12 0 0	(AS
> > > SERT_SET | DEASSERT_SET | STATUS_NONE) /* 1: lvts_mcu */
> > > +					0x140 15 0x144 15 0 0	(AS
> > > SERT_SET | DEASSERT_SET | STATUS_NONE) /* 2: pcie phy */
> > > +					0x730 1 0x734 1 0 0	(ASSERT_SET
> > > | DEASSERT_SET | STATUS_NONE) /* 3: pcie top */
> > > +					0x150 5 0x154 5 0 0	(ASSERT_SET
> > > | DEASSERT_SET | STATUS_NONE) /* 4: svs */
> > > +				>;
> > =

> > If you see [1], Rob has previously said that there shouldn't be new
> > users of the
> > ti,reset-bits property. I suggest doing like proposed on [2]: moving
> > these bit
> > definitions to the reset-ti-syscon driver, and have them selected
> > through the
> > compatible. You'd need to add a mt8192 specific compatible here too
> > for that.
> > =

> > [1] =

> > https://urldefense.com/v3/__https://lore.kernel.org/all/CAL_JsqJq6gqoXt=
vG1U7UDsOQpz7oMLMunZHq2njN6nvPr8PZMA@mail.gmail.com/__;!!CTRNKA9wMg0ARbw!1w=
QAhHnu8bAxe2O51XZ61oWVQU7EFEZcgluzwgP4x4VHRxtb6kAySvsKCGzv8cs8IzVjanDNzBQvO=
a_Y4OABdRVOzg$
> >  =

> > [2] =

> > https://urldefense.com/v3/__https://lore.kernel.org/all/CAATdQgA5pKhjOf=
5gxo*h7cs7kCts3DeKGU5axeX2t*OaJFHyBg@mail.gmail.com/__;Kys!!CTRNKA9wMg0ARbw=
!1wQAhHnu8bAxe2O51XZ61oWVQU7EFEZcgluzwgP4x4VHRxtb6kAySvsKCGzv8cs8IzVjanDNzB=
QvOa_Y4OBLvOYlyQ$
> >  =

> > =

> > Thanks,
> > N=EDcolas
> > =

> =

> Thanks for your comment.
> =

> For nfracfg_rst node, I prefer remove it from this series and
> send another patch series(dts and driver).

Yes, that sounds the best approach to me as well.

> =

> Based on [2], is it ok that we can add mt8192 compatible in reset-ti
> syscon driver? (even if mt8192 is a mediatek platform)

Actually, I think there's an even better way of handling this. Instead of u=
sing
the TI syscon reset controller, you could give reset controller capabilitie=
s to
the infracfg node directly. This means adding reset controller support to t=
he
common mtk clock driver (clk-mtk.c) and registering the reset controller on
clk-mt8192.c for infracfg. By making this common code you'll also be able to
reuse it for mt8195 as well. And there would no longer be a infracfg_rst no=
de.

Thanks,
N=EDcolas

> =

> best regards,
> Allen
> =

> > > +			};
> > >  		};
> > >  =

> > >  		pericfg: syscon@10003000 {
> > > -- =

> > > 2.18.0
> > > =

> > > =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
