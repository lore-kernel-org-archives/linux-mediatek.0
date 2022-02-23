Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE601C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 15:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0d4nUMObOPbOBm92WTzPMHiapugwnWBhkPVWoZLXFsg=; b=HdxU+LOgX30pbq
	oEc8IpkZHHCn672nBB44RWcHVbGqMwf0wXJcI/apzXlPlwgpsOB+SlS8711oD6VZYO/Ci4LeS8oFF
	YcIVXA1BgoselohQHyPbtX7eD0fqbbnHuZrDVRdadSUFC6+IFBw0t7z5Aj9OIN6n50OUcuWL/n8RV
	yje/pH0izdrLBaLhVwjai24E4aTdVxNtHkWK1O+4HqnfJzDHNWZVVvHlq4wI13G80oEAGPRmqkwK6
	Y/aBN/pa4zZ2ZT+cBHQAqIkMSXk1m1p8iPyv2dORpYW2in/X5k8IfLlH7CDOiCyL/oEZLJM8G2o4u
	8bl6QfL2j4XLiKtlVj7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMtRV-00Ez8t-J4; Wed, 23 Feb 2022 15:20:37 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMtRI-00Ez4n-El; Wed, 23 Feb 2022 15:20:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id C18CE1F44A52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645629621;
 bh=jdy98UlpZp4yYyNgJgTnj63KiB3Y1ffMm1m1vA+HNuk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WzKloTRB2XvEBA4y+u09U1ZlRrBoMkal3rajxL1xbBRiChBpJgO4UshC+8GcqtZ87
 IVYDTYaISfOwenkbWeJZwk/COcmPKYI4QgbPW6VLS4vd5FmKe83KkVIO4iPRRe/zjf
 NuXEssJQsc6EKnfWuXz3hvmS8jzXcEYGXydpDFVMc3sLEJ2yuaViUjVa15+NXCAwID
 /g4KOtca9e94SvcqOP8w/XHr6shwyQ9XtLWLrnl0mF2RzMZ6X+zjAEE9Hps2KO1XwK
 lR9+WFlqWdjaJC3zIyGlgKiavlNw9Xy7CKgTF4y9vaioDK1KCyZVHWikWBiKMBPJDc
 8YgFE5sDFSnnQ==
Date: Wed, 23 Feb 2022 10:20:15 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 22/23] arm64: dts: mt8192: Add gce info for display
 nodes
Message-ID: <20220223152015.vsuuycfvmgm5yi3x@notapiano>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-23-allen-kh.cheng@mediatek.com>
 <20220222232439.dhsvnut3phudlsls@notapiano>
 <d82cd71f06c803d15c1f2b86123c0ba63e7c5ed7.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d82cd71f06c803d15c1f2b86123c0ba63e7c5ed7.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_072024_653129_DAFC34BF 
X-CRM114-Status: GOOD (  21.41  )
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

On Wed, Feb 23, 2022 at 09:12:37PM +0800, allen-kh.cheng wrote:
> On Tue, 2022-02-22 at 18:24 -0500, N=EDcolas F. R. A. Prado wrote:
> > On Fri, Feb 18, 2022 at 05:16:32PM +0800, Allen-KH Cheng wrote:
> > > Add gce info for display nodes.
> > > =

> > > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > > ---
> > >  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > > =

> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > index 1f1555fd18f5..df884c48669e 100644
> > > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > @@ -1226,6 +1226,9 @@
> > >  		mmsys: syscon@14000000 {
> > >  			compatible =3D "mediatek,mt8192-mmsys", "syscon";
> > >  			reg =3D <0 0x14000000 0 0x1000>;
> > > +			mboxes =3D <&gce 0 CMDQ_THR_PRIO_HIGHEST 1>,
> > > +				 <&gce 1 CMDQ_THR_PRIO_HIGHEST 1>;
> > > +			mediatek,gce-client-reg =3D <&gce SUBSYS_1400XXXX
> > > 0 0x1000>;
> > =

> > As a side note, the current mmsys dt-binding,
> > Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml,
> > doesn't
> > define mboxes or mediatek,gce-client-reg, but looks like there's
> > already a patch
> > in the ML adding those:
> > =

> > =

> https://urldefense.com/v3/__https://lore.kernel.org/all/20220126071932.32=
615-2-jason-jh.lin@mediatek.com/__;!!CTRNKA9wMg0ARbw!zNfQkN-YYjiqPCd5m9DsLh=
rQDymgEZJoY4oSl24nC3R95P0gIXEmNjyJMhjQZXkWX7mZPa5QS7KIMlGXMbDjDA1_2A$
> > =

> =

> Hi N=EDcolas,
> =

> Thanks for your reminding, Should I need to remove this patch from
> series?
> =

> or I can add this ML to base and mention it in cover letter.

I think it should be OK to just mention it in the cover letter.

Thanks,
N=EDcolas

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
