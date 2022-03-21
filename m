Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA10C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 15:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RAfc6ItU53/j7Dw5xGbW1bQiqhEHcCFdkkyMGrwsT00=; b=hSqDfykundSGsA
	IdyMwczKuwgh+/kPXoxxNtEqPLl0LGSZcVDtAMm+W61H35m4Vtnq0gXA1TOxyvQcC5/VOXtdNGpqZ
	X/R+84Nz9499oqPZRvMlQ1SkDq0VMq86htttluTaLWK4Jz5Mg1oMWpNRR3MVj0h44LORDj2zOUZdO
	Sxa1IhD6r45MyC5QQMr3CFOgdUW7spSXnp75ozTJuTP3dgd2nrfzm3/v+zfyQb/cSF5QAaWdlim9u
	mAQjE8inavvM5RmYzUit7lUp17vfGmhCjBhD/mNqbMhVIvPVrvvEW2YXOliMOtTQUK34QuTSfGrvj
	8LwgWzzOKrGdJXBfCY4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWJsq-008Beg-Lt; Mon, 21 Mar 2022 15:23:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWJsa-008BYV-B4; Mon, 21 Mar 2022 15:23:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CFE7860FA7;
 Mon, 21 Mar 2022 15:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2884C340E8;
 Mon, 21 Mar 2022 15:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647876211;
 bh=4ZpyIyXYDcZ36RfZOIv4oxh4lJ+vIIHH8n+8gbprSCg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FLUh+ySfIHCMJccWzOujn77JxsZSejOrwn2p+855hwyPXkF77aZrr9VGfNd3TNBae
 Jv/ZNWbw9RsZ+dfUJ84+PcHkfujZL0NeibCYTsty4A6WSXYyMYGmUmcj2w2lcgxd4P
 cf8c1Gms39QL09R0tr7PAs6V8cKQg33YUUbBvLVsjcnKMHMgi57S0ZTfSyDw1nfGl/
 HoyUkLDdnEeKZ8mYgoL+WPh+F2bKLY/gcv6y9AFrzpORCRUSuBTM7+tSlEiZbuUDU6
 80L7Ocezq1BqkwgAuVGW8CVX5utlXtGw9ev6MzSOKgVw2psVepJdNKjc6a5a4AXINL
 /VeaMprAovbNg==
Date: Mon, 21 Mar 2022 23:23:26 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: broonie@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
 linmq006@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [v5 3/4] ASoC: mediatek: mt8192: refactor for I2S8/I2S9 DAI
 links of headset
Message-ID: <YjiYbqtrxlgrUplq@google.com>
References: <20220319114111.11496-1-jiaxin.yu@mediatek.com>
 <20220319114111.11496-4-jiaxin.yu@mediatek.com>
 <Yjf4KjXpVJaNnvb8@google.com>
 <17e6e8895ebc1113911481c7e097b394005db123.camel@mediatek.com>
 <YjhDqKhtYastPhf0@google.com>
 <f9cd3c31cc41f0f3c72930664445646d8175c760.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f9cd3c31cc41f0f3c72930664445646d8175c760.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_082332_501718_38B9C206 
X-CRM114-Status: GOOD (  21.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Mar 21, 2022 at 10:38:48PM +0800, Jiaxin Yu wrote:
> On Mon, 2022-03-21 at 17:21 +0800, Tzung-Bi Shih wrote:
> > On Mon, Mar 21, 2022 at 05:14:08PM +0800, Jiaxin Yu wrote:
> > > On Mon, 2022-03-21 at 11:59 +0800, Tzung-Bi Shih wrote:
> > > > On Sat, Mar 19, 2022 at 07:41:10PM +0800, Jiaxin Yu wrote:
> > > > > @@ -1145,6 +1140,13 @@ static int
> > > > > mt8192_mt6359_dev_probe(struct
> > > > > platform_device *pdev)
> > > > >  		goto err_speaker_codec;
> > > > >  	}
> > > > >  
> > > > > +	headset_codec = of_get_child_by_name(pdev->dev.of_node,
> > > > > "mediatek,headset-codec");
> > > > > +	if (!headset_codec) {
> > > > > +		ret = -EINVAL;
> > > > > +		dev_err_probe(&pdev->dev, ret, "Property
> > > > > 'headset_codec' missing or invalid\n");
> > > > > +		goto err_headset_codec;
> > > > > +	}
> > > > 
> > > > (to be neat) Does it have any reason to prevent from using
> > > > of_parse_phandle()
> > > > but of_get_child_by_name()?
> > > 
> > > "mediatek,headset-codec" is a child node of pdev->dev.of_node, so I
> > > use
> > > of_get_child_by_name() to get and   pass it to
> > > snd_soc_of_get_dai_link_codecs().
> > 
> > "mediatek,platform" and "mediatek,hdmi-codec" are also children of
> > pdev->dev.of_node.  I guess my question is: why doesn't it also use
> > of_parse_phandle() for "mediatek,headset-codec"?  Did I
> > misunderstand?
> 
> The following is from bindings, "mediatek,speaker-codec" and
> "mediatek,headset-codec" are sub nodes of sound but "mediatek,platform"
> and "mediatek,hdmi-codec" are the name of properties. So we can't get
> the sub node pointer through of_parse_phandle().
> 
>       sound: mt8192-sound {
>           compatible = "mediatek,mt8192_mt6359_rt1015_rt5682";
>           mediatek,platform = <&afe>;
>           mediatek,hdmi-codec = <&anx_bridge_dp>;
>           pinctrl-names = "aud_clk_mosi_off",
>                           "aud_clk_mosi_on";
>           pinctrl-0 = <&aud_clk_mosi_off>;
>           pinctrl-1 = <&aud_clk_mosi_on>;
>  
>           mediatek,headset-codec {
>               sound-dai = <&rt5682>;
>           };
>  
>           mediatek,speaker-codec {
>               sound-dai = <&rt1015_l>,
>                           <&rt1015_r>;
>           };
>       };

Got it, thanks for the explanation.  Will provide my R-b tag in another
thread.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
