Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B016C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 09:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aE71cSRSl5riZObxTF4+FBJQ/pEaLt4yAl/6eiKrEmM=; b=JVthgRw/25JxxH
	6Elha77kAV+G21OdTrg1tpt6W/REMrRTx7+cOk9gfC9IwhT9QpEkgbLsQOB7uRIEbgXarE6prcIck
	7emM19/WKp7cCx40OAhnfBIFLkks1TukyFGehBmoWYfA1X3+Q6Z+wHJEfkz0pBymOL/A2/p23Iyy6
	tlmTsQa75TiUZHhdlfFigPqNxvq+28YDoS1GMEKnbaJKi+d52dtm5lX/uEFyIQnL6hnwp6dCipR0K
	iUJJOpytNp4KLoKgLae0Ra5gxZRhDx1oBE+2AAy0V/GkzfMLxLq0VjN9jadsjKGF8UDNKLjoF/e1n
	SbzIS1UwwjNpJnIHOn1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWEH1-0078sn-VC; Mon, 21 Mar 2022 09:24:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWEGy-0078rv-Dy; Mon, 21 Mar 2022 09:24:23 +0000
X-UUID: 8fdb91ac0ad6469eb4e6b882072115e2-20220321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=aykldqlikpAjwvcCZgmBTeJC8XGHkPEQ2kAuatWftFo=; 
 b=Zsm1PWdc1M89La1sBfBqQeAf7Ek/J5U9IInH7NaDRyiylBuUoBxHjGx/vg/k8BsHg8Iixt7DVOdZLW4MdGBXqrgPNLlMQLmIf1ELMpVyxNratSshvrBhi/PZqy4pgROi6sRy4k5EJnmuxn8wGdVzN/3z4d6/Sa+IZc1SRhgX0x0=;
X-UUID: 8fdb91ac0ad6469eb4e6b882072115e2-20220321
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 558601227; Mon, 21 Mar 2022 02:24:12 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Mar 2022 02:14:10 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Mar 2022 17:14:09 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Mar 2022 17:14:08 +0800
Message-ID: <17e6e8895ebc1113911481c7e097b394005db123.camel@mediatek.com>
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
Date: Mon, 21 Mar 2022 17:14:08 +0800
In-Reply-To: <Yjf4KjXpVJaNnvb8@google.com>
References: <20220319114111.11496-1-jiaxin.yu@mediatek.com>
 <20220319114111.11496-4-jiaxin.yu@mediatek.com>
 <Yjf4KjXpVJaNnvb8@google.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_022421_909032_82387A7E 
X-CRM114-Status: GOOD (  11.85  )
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

On Mon, 2022-03-21 at 11:59 +0800, Tzung-Bi Shih wrote:
> On Sat, Mar 19, 2022 at 07:41:10PM +0800, Jiaxin Yu wrote:
> > @@ -1145,6 +1140,13 @@ static int mt8192_mt6359_dev_probe(struct
> > platform_device *pdev)
> >  		goto err_speaker_codec;
> >  	}
> >  
> > +	headset_codec = of_get_child_by_name(pdev->dev.of_node,
> > "mediatek,headset-codec");
> > +	if (!headset_codec) {
> > +		ret = -EINVAL;
> > +		dev_err_probe(&pdev->dev, ret, "Property
> > 'headset_codec' missing or invalid\n");
> > +		goto err_headset_codec;
> > +	}
> 
> (to be neat) Does it have any reason to prevent from using
> of_parse_phandle()
> but of_get_child_by_name()?

Hi Tzung-Bi,

"mediatek,headset-codec" is a child node of pdev->dev.of_node, so I use
of_get_child_by_name() to get and   pass it to
snd_soc_of_get_dai_link_codecs().

Jiaxin.Yu
Thanks
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
