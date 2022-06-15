Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A172AC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 03:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/zXVDNQxxwRrS5NvTPWnTGpTIZx97i/HcKfHswYKckY=; b=CaW9ZXfNAb2x8w
	6NutjYKJmgtRFinS6XeIswY+2/pXH70StT5q1uQACJqo7YfuLiN4tDmsF/4URTGd5+hvUQLhQU2BH
	nJf2BLtrzp/YTZyQSnr98Kd3Xr65B4iPM0isOC6Tw0n4eAU7MjJeBPwgtaU/q8O2COCZq1U4ZA1Dk
	4rTtlDaj3k5rTt0eIt4f/ISRpwbBObyqCotOkeogatpX6o+Q4ZTM2RryqXF0sLLj6ONkDnef3MmC8
	Rf3u6+yDTBOyOMC/1vXRdKy3NNJjcADOqVuj4UIubX51G6d8g9t5EW828Loyrag9XyWiNzpywxGGV
	qPEmv8kSSJzxdgBtomUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1JhE-00CLvX-6O; Wed, 15 Jun 2022 03:27:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Jh3-00CLsi-2c; Wed, 15 Jun 2022 03:27:46 +0000
X-UUID: 354370209c324dabbe5bd8fd710d577a-20220614
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:64292810-3288-405c-93dd-ed665a308b8a,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:028d8448-4c92-421c-ad91-b806c0f58b2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 354370209c324dabbe5bd8fd710d577a-20220614
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1817292255; Tue, 14 Jun 2022 20:27:35 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jun 2022 20:22:57 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 15 Jun 2022 11:22:55 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 15 Jun 2022 11:22:55 +0800
Message-ID: <26dd3afdb6be659fe97d5e05588c6d1d6630d934.camel@mediatek.com>
Subject: Re: [PATCH v2 2/3] firmware: mediatek: Use meaningful names for mbox
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, YC Hung
	<yc.hung@mediatek.com>, Curtis Malainey <cujomalainey@chromium.org>, Allen-KH
 Cheng <allen-kh.cheng@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 15 Jun 2022 11:22:55 +0800
In-Reply-To: <d3f718fa-c773-4bc7-506b-d109bf72aa3b@collabora.com>
References: <20220609083101.24195-1-tinghan.shen@mediatek.com>
	 <20220609083101.24195-3-tinghan.shen@mediatek.com>
	 <d3f718fa-c773-4bc7-506b-d109bf72aa3b@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_202745_170948_865DC7AB 
X-CRM114-Status: GOOD (  25.34  )
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

Hi Angelo,

On Mon, 2022-06-13 at 14:37 +0200, AngeloGioacchino Del Regno wrote:
> Il 09/06/22 10:31, Tinghan Shen ha scritto:
> > Rename mbox according to action instead of 'mbox0' and 'mbox1'
> > 
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > ---
> >   drivers/firmware/mtk-adsp-ipc.c | 6 +++++-
> >   1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/firmware/mtk-adsp-ipc.c b/drivers/firmware/mtk-adsp-ipc.c
> > index cb255a99170c..3de94765d659 100644
> > --- a/drivers/firmware/mtk-adsp-ipc.c
> > +++ b/drivers/firmware/mtk-adsp-ipc.c
> > @@ -83,7 +83,11 @@ static int mtk_adsp_ipc_probe(struct platform_device *pdev)
> >   		return -ENOMEM;
> >   
> >   	for (i = 0; i < MTK_ADSP_MBOX_NUM; i++) {
> > -		chan_name = kasprintf(GFP_KERNEL, "mbox%d", i);
> > +		if (i < MTK_ADSP_MBOX_NUM / 2)
> > +			chan_name = kasprintf(GFP_KERNEL, "rep");
> > +		else
> > +			chan_name = kasprintf(GFP_KERNEL, "req");
> > +
> >   		if (!chan_name) {
> >   			ret = -ENOMEM;
> >   			goto out;
> 
> At this point, just call them "reply" and "request", as that simply provides a
> perfectly clear explanation.
> 
> Besides, I'm sorry but I really don't like this code, it's really too much
> fragile and will have to be changed entirely if a third mbox is introduced.
> 
> I can suggest a cooler way:
> 
> static const char * const adsp_mbox_ch_names[MTK_ADSP_MBOX_NUM] = { "rep", "req" };
> 
> for (i = 0; i < ARRAY_SIZE(adsp_mbox_ch_names); i++) {
> 	/* we can delete chan_name and also avoid a kfree if we do... */
> 
> 	.... code ....
> 
> 	adsp_chan->ch = mbox_request_channel_byname(cl, adsp_mbox_ch_names[i]);
> 
> 	... etc etc ...
> }
> 
> Cheers,
> Angelo

Ok, I'll update in the next version.
Thank you!


Best regards,
TingHan


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
