Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AF1C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Apr 2022 07:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=crHWwjxPYbCeIIhbTvlzq1GvrCeoll2VyYdpEl7sg7o=; b=vsrpc4ABxZnw53
	vqXyhdtqzmYTYBA3Uno2Z6ehbH8cnvwx/dLqY5zhfW5GJqnEVPYRDCCuJL/dM6bXj54PIJJCBTmIC
	1KgVlbde/0CqgRzMHh6muZ08toiMdWsp4cBfkL9GsIZ9FekhHobDBLgodq7uP7rNRjcD1unUk/idq
	+h0G36aPmrD2qHflohjwTCQ2XzCUZpREiLaMrXMFxGvRpgij9OmGZwUEJEt/3vRC2FYGAmx0wavJt
	E5Nx3claDom1DiPKUPNLDHtX9yfAB7YFkEmC5Q896Du8n4zypbPaVwcS7G3Y+PcBabis7nmAf45RH
	x4G2We3T/aUnMVYv3puA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naC3Y-004pbK-V9; Fri, 01 Apr 2022 07:50:52 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naC3M-004pWz-O2; Fri, 01 Apr 2022 07:50:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6975B1F40FA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648799436;
 bh=GEf0nEJQNZXszGDptrQO3o7b80i82CTwEgPl8PZMhOA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jOwCiMnFbtrL2h5VrTaakpahFkQ9lyJBlI+5o/TInsHv9DsHVBS42/SycdxYzP8Z7
 2rnV/9eeI3dLUgM+WIuGpo/jElJoqHM+bCHH9xZyitktLLhraAak+Hx5UbfxdzZ+2u
 09VpPaI4M69e3oYBIfHgPPIIEbMOQt5+IyJJaGNcDFn3wLfAf3dMH0aFnpYBYFVxOb
 TNVaUw1dyMzcLzJx8mVvm7Kc9S9OuKR7+GFBz+/B+3SrWooUnyCE3mbRjqMjctG/aW
 fpqN9VDrR2AgU41yVkrpGsNR8Gt/DJKI2obowakUufYAB+yHvoP4mbVVmP0kA3PP7A
 CpfJT++gxUrlg==
Message-ID: <38c9685e-380e-87ce-4a3a-5d274c0892fa@collabora.com>
Date: Fri, 1 Apr 2022 09:50:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] media: mediatek: vcodec: fix v4l2 compliance decoder cmd
 test fail
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: George Sun <george.sun@mediatek.com>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220401030406.6437-1-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220401030406.6437-1-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_005040_936100_22CBD65F 
X-CRM114-Status: GOOD (  15.74  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 01/04/22 05:04, Yunfei Dong ha scritto:
> Will return -EINVAL using standard framework api when test stateless
> decoder with cmd VIDIOC_(TRY)DECODER_CMD.
> 
> Using another return value to adjust v4l2 compliance test for user
> driver(GStreamer/Chrome) won't use decode cmd.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Hello Yunfei,

this patch is a fix.. hence, this needs an appropriate Fixes: tag.
Please add one.

Thanks,
Angelo

> ---
>   drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> index 3859e4c651c6..69b0e797d342 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> @@ -51,8 +51,7 @@ static int vidioc_try_decoder_cmd(struct file *file, void *priv,
>   
>   	/* Use M2M stateless helper if relevant */
>   	if (ctx->dev->vdec_pdata->uses_stateless_api)
> -		return v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv,
> -								cmd);
> +		return -ENOTTY;
>   	else
>   		return v4l2_m2m_ioctl_try_decoder_cmd(file, priv, cmd);
>   }

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
