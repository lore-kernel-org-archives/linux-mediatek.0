Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A17C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 09:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G0MFjJUCa+Hq9Y6zAKYo+eqsWRkjctMuyqz0Fv9y9KU=; b=F/0UdWKUpxnjzQ
	u43dkTzjPvkr9UsFuE+XnZ/gZ+Eclaq5d1b31vS7Ojwf1kr/LPYlQTDBVQ8UOuoIYuWgR/lz51TeG
	rqjAFIECKP2rYwYHHUKW7nTmwUbeY/u5AJxneOq9M5mMTDlDmTEgfkNC7qq2QDeOeraFdxFXUWE8c
	X2/jvMfKu2aRhWn2JJTYs/CvxNrlsK+XmJZMyysJxqWd51eAtOPZ5LWT2K9UiyFXw6B9usqqTL5vZ
	nZxtc8e/o3VmmUm3rB2ML9lopFhc3E8ZzluKX7HurpqkML8ZOmzpgF8ggqKFr6xWTPWI0UcarUsZk
	27MDdoMNamjKfLIDyuHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWEEk-0078NO-Mm; Mon, 21 Mar 2022 09:22:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWEEY-0078KK-9L; Mon, 21 Mar 2022 09:21:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CB0A5611E1;
 Mon, 21 Mar 2022 09:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE151C340E8;
 Mon, 21 Mar 2022 09:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647854509;
 bh=js3Rr+dGBwxPT5O2sAogbnMjmIOd+kG1mAzBVLLRx5o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=njg8O/W4Vv3IECCZJM2JewVvH2vhm/jUaAYsDEQCWqJEgtkAsUVGs4K/8FcdpyR71
 YjV1ksexpq42ejRKGzipRXOojPfkM/Q7xSNrXdq6JsKQWhkzJ7rOAC15x1NcxNerTU
 un6vKgzW5+68tp0PAizpMFw8QEXn9ec5oKQs4+546vK0dWR7HZ2kyk4ldf40i/Qe8r
 k1QnGilipJlO+hW0rVt0F1Aur7Wk9ZqXUiX5E9LZuEJ7i5vVUU3CQxVF3QT1LutpPz
 sIoozG+4fpjWdnp8YvNE/yHISY8DpgnYVsWpiG9oBKBUE/2Mw+q2mm/sQo6p12Go8A
 epZkZzxjmBvdA==
Date: Mon, 21 Mar 2022 17:21:44 +0800
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
Message-ID: <YjhDqKhtYastPhf0@google.com>
References: <20220319114111.11496-1-jiaxin.yu@mediatek.com>
 <20220319114111.11496-4-jiaxin.yu@mediatek.com>
 <Yjf4KjXpVJaNnvb8@google.com>
 <17e6e8895ebc1113911481c7e097b394005db123.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <17e6e8895ebc1113911481c7e097b394005db123.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_022150_390736_5FBFDE6E 
X-CRM114-Status: GOOD (  16.25  )
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

On Mon, Mar 21, 2022 at 05:14:08PM +0800, Jiaxin Yu wrote:
> On Mon, 2022-03-21 at 11:59 +0800, Tzung-Bi Shih wrote:
> > On Sat, Mar 19, 2022 at 07:41:10PM +0800, Jiaxin Yu wrote:
> > > @@ -1145,6 +1140,13 @@ static int mt8192_mt6359_dev_probe(struct
> > > platform_device *pdev)
> > >  		goto err_speaker_codec;
> > >  	}
> > >  
> > > +	headset_codec = of_get_child_by_name(pdev->dev.of_node,
> > > "mediatek,headset-codec");
> > > +	if (!headset_codec) {
> > > +		ret = -EINVAL;
> > > +		dev_err_probe(&pdev->dev, ret, "Property
> > > 'headset_codec' missing or invalid\n");
> > > +		goto err_headset_codec;
> > > +	}
> > 
> > (to be neat) Does it have any reason to prevent from using
> > of_parse_phandle()
> > but of_get_child_by_name()?
> 
> "mediatek,headset-codec" is a child node of pdev->dev.of_node, so I use
> of_get_child_by_name() to get and   pass it to
> snd_soc_of_get_dai_link_codecs().

"mediatek,platform" and "mediatek,hdmi-codec" are also children of
pdev->dev.of_node.  I guess my question is: why doesn't it also use
of_parse_phandle() for "mediatek,headset-codec"?  Did I misunderstand?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
