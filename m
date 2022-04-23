Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43140C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Apr 2022 07:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NQoZxA7tf+GLlo4lkNIentr8cuZ/yPmYn54ZxxUPV80=; b=IjzcC55gcdr76S
	PrHn5y97c1VfjlAASsY+Gm9mwdbl4cH2b7r2UB/ypo92sf9pTfiOalNm1XleI/n8uUFEaPgWAU73P
	wep/ZgkZyxvO/5kxDXOfs/IGsx/Kr7Bjv66X6YOmWPEBRe7M4x1UeUnwOBj64/2KH6KdFAuap6lsl
	zLHBPkiJD8DPW51XF49pL70GR3qgRkmxYALH7AU7aXBzjh+cwS+jdK7GWHMnuqbDIGUu92SXHfwnK
	JRr6zZTV1dwRMQr+G3enaDxEWDppZrkGfTMxmTlBUDcZ8ietSwN5frzSrAwtTkM+ufj/H28aBbDv8
	ixxv6gi9GBUknLron/sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niARL-003leA-Fv; Sat, 23 Apr 2022 07:44:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niAR9-003lc0-SO; Sat, 23 Apr 2022 07:44:13 +0000
X-UUID: 3b9eb918db9d4d739468f61a4b0ec1c3-20220423
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=tlCxVG/AHT8acc8MAxOAEAPGTUEUAwVGA4gYNgAtx9Y=; 
 b=mHK/BgKhbnACZpUUV9gLAQ5ov5o+58Hwv1u34gKWuvK0LN8/aYuuHxf8PfQZdbY5oKYqmzVpj6uuYeev2TZptcR/0DUwHiZOvi3+VuPKTu9yzpT04wcUTqU33PSgdOb/DpfgF/25QHQXlq3cyNjWq3ta5GMS7Z9PV2ISxmKlXxc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:453497f1-ff1d-4ba6-9f4f-9456288141fc, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:4aadaef0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 3b9eb918db9d4d739468f61a4b0ec1c3-20220423
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 699298029; Sat, 23 Apr 2022 00:44:07 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Apr 2022 00:34:05 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sat, 23 Apr 2022 15:34:04 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 23 Apr 2022 15:34:02 +0800
Message-ID: <ad60061db14c9f08e6b1aed3389d3744d8a12be0.camel@mediatek.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Fix v4l2 compliance decoder
 cmd test fail
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
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Sat, 23 Apr 2022 15:34:02 +0800
In-Reply-To: <678a06f5-0519-dab3-35ac-5915b47d422e@xs4all.nl>
References: <20220406012048.5970-1-yunfei.dong@mediatek.com>
 <678a06f5-0519-dab3-35ac-5915b47d422e@xs4all.nl>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_004411_967637_E0781F26 
X-CRM114-Status: GOOD (  25.89  )
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

Hi Hans,

Thanks for your suggestion, I will resend patch v4 according to your
suggestion.

Best Regards,
Yunfei Dong
On Thu, 2022-04-21 at 12:47 +0200, Hans Verkuil wrote:
> On 06/04/2022 03:20, Yunfei Dong wrote:
> > Will return -EINVAL using standard framework api when test
> > stateless
> > decoder with cmd VIDIOC_(TRY)DECODER_CMD.
> > 
> > Using another return value to adjust v4l2 compliance test for user
> > driver(GStreamer/Chrome) won't use decoder cmd.
> > 
> > Fixes: 8cdc3794b2e3 ("media: mtk-vcodec: vdec: support stateless
> > API")
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> > changes compared with v2:
> > - add reviewed-by tag
> > changes compared with v1:
> > - add Fixes: tag
> > ---
> >  drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git
> > a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> > b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> > index 3859e4c651c6..69b0e797d342 100644
> > --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> > +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> > @@ -51,8 +51,7 @@ static int vidioc_try_decoder_cmd(struct file
> > *file, void *priv,
> >  
> >  	/* Use M2M stateless helper if relevant */
> >  	if (ctx->dev->vdec_pdata->uses_stateless_api)
> > -		return v4l2_m2m_ioctl_stateless_try_decoder_cmd(file,
> > priv,
> > -								cmd);
> > +		return -ENOTTY;
> >  	else
> >  		return v4l2_m2m_ioctl_try_decoder_cmd(file, priv, cmd);
> >  }
> 
> So in other words, if the stateless api is used, then
> (TRY_)DECODER_CMD
> is not implemented. And that's because this driver doesn't set the
> V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF capability as that's not
> needed.
> And so there is no need for (TRY_)DECODER_CMD to be implemented.
> 
> If that's the case, then it is much better to just disable these two
> ioctls with v4l2_disable_ioctl() if the stateless API is used.
> 
> And just drop the uses_stateless_api checks in both
> vidioc_try_decoder_cmd
> and vidioc_decoder_cmd. This patch only changed
> vidioc_try_decoder_cmd,
> but of course vidioc_decoder_cmd needs to be modified as well.
> 
> Regards,
> 
> 	Hans
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
