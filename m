Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7778BC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Apr 2022 08:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=38KCCr0VsT0jlqERf0k241hQMimBE8CrPGdEQtRc2dQ=; b=b1pUdASLvRsoVj
	73Uu4HWL2JrA+NRm1s8SpsmtXTId95k3L731912Fp1WW1SEM1/fPPYIteSG9tNvNURee5CJycvRlI
	9YqYyJSNXBlCsThwscPmmkP8FX1netJTjddXvZY3L1ulfDLsyd0GoHq0tovJtMU6l7wR3a6EmmeTo
	JrGN4x0GH3656v+B1Ktxs4DIdeGAW9lRxjqCaTI3dtRamIcBw+aIJ4eHt20W+9LA/EU6l/aOpnPRz
	JqQnLDFRjbx1Q+vX7ET92LAhqeStA29yTLSl86tvQfANt5GH8bTABBWD84o0gTu0h5ISbR83D2aB5
	5wcwS4fS59UYF0akPsNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naCdo-004w24-VR; Fri, 01 Apr 2022 08:28:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naCdd-004vxe-Fj; Fri, 01 Apr 2022 08:28:11 +0000
X-UUID: f2819149c0f34f349f13a71ec9f2ae71-20220401
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=rn9wOFd4KctijPqqfVLAV7GyyUL+n6RTP/1IvBQ4Xps=; 
 b=oNaE1KSjoiz5FDfPCStZWqCi2A7b3ZoNZ9LH+nGvCP5itACqAepSV/PidPk2vHMKCMTSbxeFOXHmZFbUkgr0+Tl4eRqqzaGXnLvVJa/8LzUJs6tNrmAKdeJ8tNFIF4RB/PoYr1cwoz1jQeKzXqgZ2IVePkAWYdatKCKZy1dfVl8=;
X-UUID: f2819149c0f34f349f13a71ec9f2ae71-20220401
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1251221650; Fri, 01 Apr 2022 01:28:02 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 1 Apr 2022 01:28:01 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 1 Apr 2022 16:27:58 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 1 Apr 2022 16:27:57 +0800
Message-ID: <61b8e1e7e53a0d560b0e0a4107c63922190e7cec.camel@mediatek.com>
Subject: Re: [PATCH] media: mediatek: vcodec: fix v4l2 compliance decoder
 cmd test fail
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Courbot <acourbot@chromium.org>, Nicolas Dufresne
 <nicolas@ndufresne.ca>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Benjamin
 Gaignard" <benjamin.gaignard@collabora.com>, Tiffany Lin
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
Date: Fri, 1 Apr 2022 16:27:57 +0800
In-Reply-To: <38c9685e-380e-87ce-4a3a-5d274c0892fa@collabora.com>
References: <20220401030406.6437-1-yunfei.dong@mediatek.com>
 <38c9685e-380e-87ce-4a3a-5d274c0892fa@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_012809_579778_0FAF92D5 
X-CRM114-Status: GOOD (  19.82  )
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

Hi AngeloGioacchino,

Thanks for your suggestion.

On Fri, 2022-04-01 at 09:50 +0200, AngeloGioacchino Del Regno wrote:
> Il 01/04/22 05:04, Yunfei Dong ha scritto:
> > Will return -EINVAL using standard framework api when test
> > stateless
> > decoder with cmd VIDIOC_(TRY)DECODER_CMD.
> > 
> > Using another return value to adjust v4l2 compliance test for user
> > driver(GStreamer/Chrome) won't use decode cmd.
> > 
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> 
> Hello Yunfei,
> 
> this patch is a fix.. hence, this needs an appropriate Fixes: tag.
> Please add one.
> 
Add "Fixes: " in patch v2.
> Thanks,
> Angelo
> 
Thanks,
Yunfei Dong
> > ---
> >   drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
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
> >   	/* Use M2M stateless helper if relevant */
> >   	if (ctx->dev->vdec_pdata->uses_stateless_api)
> > -		return v4l2_m2m_ioctl_stateless_try_decoder_cmd(file,
> > priv,
> > -								cmd);
> > +		return -ENOTTY;
> >   	else
> >   		return v4l2_m2m_ioctl_try_decoder_cmd(file, priv, cmd);
> >   }
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
