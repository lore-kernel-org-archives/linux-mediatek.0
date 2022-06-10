Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A44EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 01:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z7wpOMJ7SZ6mOUAzamhuaWT1hkJwmC0eWJlGqI4m378=; b=o0jq0kcdAYpTQN
	NGQToq4Hh9V425TtQvq7gLbTeN5sYxz8aOt6BPRecBh/cazzn8ZREXHDVGyrYR+WhJsNQZCr25U3C
	0XrLLQ0Vk8lq9mv1bbKyb1/pxTta1WC6XR1vOIaofe4+feh+tKl4P0IY3emgTNejPp77OYBl+qFV/
	v8sWhXOcrkZEOBJ73HZBNeSgx16OjYavrcKF+7YCMqSmfN/+DlwvGbI8AT27SV/14j+lTgOah1rbl
	OW50n1W13isCMwM4DnCYiSLKqQwYSGnqO2v4M3eWdeyfz++rvV/OC544NW0VuFPwjmt8XpK29+vl3
	4Y++qlHpvcd6A6CG6akA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzTiX-0055TG-HZ; Fri, 10 Jun 2022 01:45:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzTiL-0055RH-NY; Fri, 10 Jun 2022 01:45:31 +0000
X-UUID: 868cf33505334f3e91c9dbfd120f407c-20220609
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=nTuV85J7z0k/63p7JoxUrypTQGB1TFUdbipUJnerlqo=;
	b=FfELyLcQv27ptdfXtiNkYg/5C8qNd/w3cBjb+kGoDphQXaAEzlFCuhVdxJPseOtgV9MbbggzhwBmu4FDoV65zrFn7nbQbmxkHJOBJm3pr4eJtd9/0H1FxfQYANqvHC2VGh0LWJMXBo38GZJh09UUIFysnJWccaiuwnDyCSvAjU0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:bfc9eca0-7e51-4522-9797-2cf1d7822d8b,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:2a19b09,CLOUDID:f333dc7e-c8dc-403a-96e8-6237210dceee,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 868cf33505334f3e91c9dbfd120f407c-20220609
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 2049941437; Thu, 09 Jun 2022 18:44:02 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jun 2022 18:43:55 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 10 Jun 2022 09:43:53 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Jun 2022 09:43:51 +0800
Message-ID: <b1b4ff47306af5fc0aecf8d2041ffca4c30717b2.camel@mediatek.com>
Subject: Re: [PATCH 1/4] media: mediatek: vcodec: Fix decoder v4l2 bus_info
 not correctly
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Alexandre Courbot
	<acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin
	<tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
	<xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "Fritz
 Koenig" <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
	<dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>, "Steve
 Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 10 Jun 2022 09:43:51 +0800
In-Reply-To: <3cd958be-41a8-707d-983a-c9950e913ae5@xs4all.nl>
References: <20220526095737.21118-1-yunfei.dong@mediatek.com>
	 <3cd958be-41a8-707d-983a-c9950e913ae5@xs4all.nl>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_184529_978365_495646AD 
X-CRM114-Status: GOOD (  22.49  )
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

Dear Hans,

Thanks for your suggestion.

I will fix bus_info in patch v2:
decoder: "platform:mt%d" to "platform:mt%d-dec"
encoder: "platform:mt%d" to "platform:mt%d-enc"

Best Regards,
Yunfei Dong

On Thu, 2022-06-09 at 12:08 +0200, Hans Verkuil wrote:
> Hi Yunfei Dong,
> 
> On 5/26/22 11:57, Yunfei Dong wrote:
> > Fix v4l2 capability bus_info value with correct chip name according
> > to compatible.
> > 
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> >  .../platform/mediatek/vcodec/mtk_vcodec_dec.c | 23
> > ++++++++++++++++++-
> >  1 file changed, 22 insertions(+), 1 deletion(-)
> > 
> > diff --git
> > a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> > b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> > index 52e5d36aa912..ccfa426a34ab 100644
> > --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> > +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> > @@ -185,11 +185,32 @@ static int vidioc_vdec_dqbuf(struct file
> > *file, void *priv,
> >  	return v4l2_m2m_dqbuf(file, ctx->m2m_ctx, buf);
> >  }
> >  
> > +static int mtk_vcodec_dec_get_chip_name(void *priv)
> > +{
> > +	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
> > +	struct device *dev = &ctx->dev->plat_dev->dev;
> > +
> > +	if (of_device_is_compatible(dev->of_node, "mediatek,mt8173-
> > vcodec-dec"))
> > +		return 8173;
> > +	else if (of_device_is_compatible(dev->of_node,
> > "mediatek,mt8183-vcodec-dec"))
> > +		return 8183;
> > +	else if (of_device_is_compatible(dev->of_node,
> > "mediatek,mt8192-vcodec-dec"))
> > +		return 8192;
> > +	else if (of_device_is_compatible(dev->of_node,
> > "mediatek,mt8195-vcodec-dec"))
> > +		return 8195;
> > +	else if (of_device_is_compatible(dev->of_node,
> > "mediatek,mt8186-vcodec-dec"))
> > +		return 8186;
> > +	else
> > +		return 8173;
> > +}
> 
> Nice, but...
> 
> > +
> >  static int vidioc_vdec_querycap(struct file *file, void *priv,
> >  				struct v4l2_capability *cap)
> >  {
> > +	int platform_name = mtk_vcodec_dec_get_chip_name(priv);
> > +
> >  	strscpy(cap->driver, MTK_VCODEC_DEC_NAME, sizeof(cap->driver));
> > -	strscpy(cap->bus_info, MTK_PLATFORM_STR, sizeof(cap-
> > >bus_info));
> > +	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:mt%d",
> > platform_name);
> 
> ...this will result in identical bus_info values for the decoder and
> encoder
> video devices. The bus_info field is supposed to be unique, and
> that's now
> no longer the case.
> 
> I suggest changing this to:
> 
> 	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:mt%d-
> dec", platform_name);
> 
> (and '-enc' for the encoder patch).
> 
> Regards,
> 
> 	Hans
> 
> >  	strscpy(cap->card, MTK_PLATFORM_STR, sizeof(cap->card));
> >  
> >  	return 0;
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
