Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF8EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 14:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xhiOsVdAN8Z/zE9RadQe3T3Sm0q03+elU3S1lYvP2/s=; b=qJMAyuBPyTrNcv
	SFHq7j8H12IS0N/7dA+d3IGVwj8z3YjOMLywJR07rwYfym4pYiYT1t+4iNiQqEU8ggw46oVYplSEo
	T5diSYIEc9PmUt4F72jsO15fOrB3x06id58AAIVZkd02g1SiunNXVucEouEyTLw2lYrzgtBIFY7tG
	oHQT6UbSZfvuGrvdN2rglso/iwFjrbWag9Igjh+mA24+RIm11cgyFeNy3isZiLcSUudeaqT/WGhoe
	MS+iNQbNz/QxFmR+E025vf4CYUz2motEtfuyuf51pxqX61o8r42Uu7yPseQSk81febsr8mbNf8AVW
	P3AsZcaRBKzpkVQRNCPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWJL9-0084wz-FG; Mon, 21 Mar 2022 14:48:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWJL5-0084w5-RG; Mon, 21 Mar 2022 14:48:58 +0000
X-UUID: 9309348abbbf420694731b3b1e9163d0-20220321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=gykCg0clZoz78nUMV2so48mdtJcOUt7USfRg0Ey8tC0=; 
 b=uE4wPtH+AMH564Vy3vQz4T/659DcuCDUuxdYqhMg46n/uyk4/zEO5ILTMlU9RayRks5dTQR5ogT+IrrmUnolyapKu1QKaSlHxyQqpa7ExqLTX1YSgnqb5Moq7tfC/FRv70Udl6aKv815ZRkXpI2sDg6Axt4shfWp6NWz05wsFDU=;
X-UUID: 9309348abbbf420694731b3b1e9163d0-20220321
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 823571866; Mon, 21 Mar 2022 07:48:52 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Mar 2022 07:38:50 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 21 Mar 2022 22:38:49 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Mar 2022 22:38:48 +0800
Message-ID: <f9cd3c31cc41f0f3c72930664445646d8175c760.camel@mediatek.com>
Subject: Re: [v5 3/4] ASoC: mediatek: mt8192: refactor for I2S8/I2S9 DAI
 links of headset
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
CC: <broonie@kernel.org>, <robh+dt@kernel.org>, <devicetree@vger.kernel.org>, 
 <linmq006@gmail.com>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <trevor.wu@mediatek.com>,
 <matthias.bgg@gmail.com>, <aaronyu@google.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <angelogioacchino.delregno@collabora.com>
Date: Mon, 21 Mar 2022 22:38:48 +0800
In-Reply-To: <YjhDqKhtYastPhf0@google.com>
References: <20220319114111.11496-1-jiaxin.yu@mediatek.com>
 <20220319114111.11496-4-jiaxin.yu@mediatek.com>
 <Yjf4KjXpVJaNnvb8@google.com>
 <17e6e8895ebc1113911481c7e097b394005db123.camel@mediatek.com>
 <YjhDqKhtYastPhf0@google.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_074855_914882_24797F2F 
X-CRM114-Status: GOOD (  17.65  )
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

On Mon, 2022-03-21 at 17:21 +0800, Tzung-Bi Shih wrote:
> On Mon, Mar 21, 2022 at 05:14:08PM +0800, Jiaxin Yu wrote:
> > On Mon, 2022-03-21 at 11:59 +0800, Tzung-Bi Shih wrote:
> > > On Sat, Mar 19, 2022 at 07:41:10PM +0800, Jiaxin Yu wrote:
> > > > @@ -1145,6 +1140,13 @@ static int
> > > > mt8192_mt6359_dev_probe(struct
> > > > platform_device *pdev)
> > > >  		goto err_speaker_codec;
> > > >  	}
> > > >  
> > > > +	headset_codec = of_get_child_by_name(pdev->dev.of_node,
> > > > "mediatek,headset-codec");
> > > > +	if (!headset_codec) {
> > > > +		ret = -EINVAL;
> > > > +		dev_err_probe(&pdev->dev, ret, "Property
> > > > 'headset_codec' missing or invalid\n");
> > > > +		goto err_headset_codec;
> > > > +	}
> > > 
> > > (to be neat) Does it have any reason to prevent from using
> > > of_parse_phandle()
> > > but of_get_child_by_name()?
> > 
> > "mediatek,headset-codec" is a child node of pdev->dev.of_node, so I
> > use
> > of_get_child_by_name() to get and   pass it to
> > snd_soc_of_get_dai_link_codecs().
> 
> "mediatek,platform" and "mediatek,hdmi-codec" are also children of
> pdev->dev.of_node.  I guess my question is: why doesn't it also use
> of_parse_phandle() for "mediatek,headset-codec"?  Did I
> misunderstand?
Hi Tzung-Bi,

The following is from bindings, "mediatek,speaker-codec" and
"mediatek,headset-codec" are sub nodes of sound but "mediatek,platform"
and "mediatek,hdmi-codec" are the name of properties. So we can't get
the sub node pointer through of_parse_phandle().

      sound: mt8192-sound {
          compatible = "mediatek,mt8192_mt6359_rt1015_rt5682";
          mediatek,platform = <&afe>;
          mediatek,hdmi-codec = <&anx_bridge_dp>;
          pinctrl-names = "aud_clk_mosi_off",
                          "aud_clk_mosi_on";
          pinctrl-0 = <&aud_clk_mosi_off>;
          pinctrl-1 = <&aud_clk_mosi_on>;
 
          mediatek,headset-codec {
              sound-dai = <&rt5682>;
          };
 
          mediatek,speaker-codec {
              sound-dai = <&rt1015_l>,
                          <&rt1015_r>;
          };
      };

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
