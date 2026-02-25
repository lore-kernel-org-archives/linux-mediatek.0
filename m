Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8E0EFD20A
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Feb 2026 08:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x2LJlLYDb1+QOSf2a+RA+BcJzRTj83OmLJeFRnjwCps=; b=WkCYGWn5RbZnGW9HspAH7V3F2N
	d7hLpKGIyvlCuldNm/FFc7hOeV7Vk8fp1UgSVs9MwAzbslIhBnj3jp7t/6zbbKNeCY/Z4G953vjK9
	S/bR2RsyQDe0MjMvHeb95uxVZh4f/AxoOpBI3rjA49lehqqMq2J+p7eSy5H7NyvGnbQXtR2gE83qC
	uykFkUcqVblosr9pe+OPjkYrgnPgStyrG9PhzDC+Sdh3JKJ9xdUjxp1aw+XAn58oX5Jxnk4nY7yMh
	G43uI+JOUadEhNK9GXZmRAQdm96pBXWPkSxgFOLJoiGNnMgIZAidOwiey8eq4EcDzaM6iQU/LjiOt
	d79Bcodw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA4X-00000003Vo1-1Mkj;
	Wed, 25 Feb 2026 08:16:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA4U-00000003VjJ-1Gf6
	for linux-mediatek@bombadil.infradead.org;
	Wed, 25 Feb 2026 08:16:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=x2LJlLYDb1+QOSf2a+RA+BcJzRTj83OmLJeFRnjwCps=; b=RH6ttf6YaqoYA0FXK/DHTZTzQr
	dY+mUVPYTlTkHkT6yqWrv6POS9zpnr9K/go8yxL2rUlOPSeVGZHmErf63e7hOR3C8Z/pvW5DU6U5N
	JNjON2sDOmfYTx+2aCeHUGnOVIEao+8NMFD2HYCZMTArm4DjFbwJFDC/jE8W9++aq9CN+QWnAGrtv
	CKhBP6wA0TdvvEp3Bc1mZ5j8S/JtK4AXlenTPrwYdSWJ/Av5ebY8JYmAK3lzeSUhaf1cWX7K7xIWP
	dzkfloFgmjBigzjgSrWzCV9J6OFGS6vHsx9z0lvFYlGw9Fx+sevNcxwUcs9zqI8o3dUuGYBamm/MQ
	oT9YgR/w==;
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA44-00000008YBr-0vS2
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Feb 2026 08:16:34 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-65bf302471dso6715748a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Feb 2026 00:16:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772007369; cv=none;
        d=google.com; s=arc-20240605;
        b=GUj086l16MLX9CuboCgLK2c9C+Gg6eoFrN1J11hjX8iV68vQIMis3FAg9+z3qABrNn
         Ns0iH24vLrkupMSfHrNg3ubcCQ5BAV+ceeu2mAD1GLwbWNOjunV0YIZ5LJco4LAX0q06
         V6SBILmys8BxAedsXj0dtnLzcTudK1DDa8WzHp6kX1+hO9lWoErwJc18ArohoW0mjHuj
         6zq6v/paGjST1D8AnK58sAvbeT4zLB9dC8oUwTHK0fr0gXhXEEYLLi8zcC/ikMdlMjEk
         76cuiUpzF69XzXXMlVgxN0ZIG+T38QUy4jzu37G9oyG+oH77ZMFaXDcc8u8enJSc+N+X
         kzqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x2LJlLYDb1+QOSf2a+RA+BcJzRTj83OmLJeFRnjwCps=;
        fh=PFYZdr9F51UXCXlq8qI1aiQb17HknF+JVl1TRd/FijI=;
        b=Gjw9Y9uS3dPpwSDemX8Ay3+bgLI9vcbOIzsk/arKelfLGgWk/u3EDXspOF+i8S2OrM
         SWThg8NTwfHihN0jN4u6VFQFG4ANPfCgtRPq2INbMUw2TozlizVxTNeHsibWrJq/bDKe
         w/lTTkbfIYOXhet1xR50Se4e+Z+P2vzk8DMTRrJHpvTkRR5h0vBpS+MMjCQSk1NqBeJE
         qhVYFBMTXdmymANhW7VPMm221UELBjA6YFMLDLLzRwpZPS441g51qibFWqsLLNYKAVPb
         9p5cpLpv1IyQuZoRy+GIhheki7ntgEKqC8RiB2+u6tHx6/icV1QjP6xMpm5BXDB7Atnt
         ObIQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772007369; x=1772612169; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x2LJlLYDb1+QOSf2a+RA+BcJzRTj83OmLJeFRnjwCps=;
        b=lw8+bbiRh+baV5e5K+CRhyGp6G3FriYe2jEJVVQ9zkLHpQt88idf+ZTtH0CsbmGfGq
         uW+h/ozKE0htXULCeOSRZi+CJvfEpfVcwk1/UJLjQEX6DYjFBXArA3HMsA0U+Ynjz/DD
         kbRksaxBfFLyStzX0SM3tIrGxxWdubOjc3qmaYl+lBsipHxl2KX5dW1mJcI0GD8rNi1+
         Sw1ijGeojd4fRcTZyL896PD3cOn35w0Zh2X8DvjjBXF3UpkSji/CymmYcwtgh6jaaNYb
         08eL//15qGvAZbUyK0XCeXyHqGU1UMr4tdkM47b7c0qm7tTZPIJq4fauUNTllLBb9ClY
         +9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772007369; x=1772612169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2LJlLYDb1+QOSf2a+RA+BcJzRTj83OmLJeFRnjwCps=;
        b=v2r2XaTT+Y7ASmBNNue/TOWjWqYpEM8uZE5ZCCIUQC/TbepeCoz2WAmcA6jqzpoZrN
         AhupF8owsfnWmarjDi+bvtC0BGBYKZ+T0d9IxtPuL3awFNaIU+HrjKBXykOmu3mb7DWL
         6CyS5fy5rt9/qLjWTFi3C9zUg7py//eh0CjkoH+f6DbXb3fZof8OefGcH9T+yhk4ps+5
         s4UM2yYD66r2x3x+94HqGt371WxJDI8KK442fE93xIJCP7WrVOBZGiJ+xnIzTeoQ53MJ
         NEgcbaWE4fTuDnsSHpfV2LCXGSZXLX1VjczIjK5WFVr48zFq07y47bwO/tABhkhOqhoD
         7lwQ==
X-Gm-Message-State: AOJu0YyYXkqFA6ponVRUY19QZffDIxnbz+KKLvPFvNe1ipjrC8V7rD+x
	m1vgDJwmjdqJiQfdX7eFMoj48klZ3awip1Z17kOhJVEWirnl8VzwsM7qh9219hQz/VgN714BbYw
	XrdJtR91XF4rOaspV8+MLImxX925KuDc=
X-Gm-Gg: ATEYQzwoIqeMyXLYTWN8R/O4fpt6SDhyc4S57kxCjq/rEgnAKgKGRsjS1YZp2lLdS58
	DbQPec2yVXO/dCvxNzTvqy0886FXzR+a6OdtbivExsU3NTGxuWh2yrxomdnsJuHwCaBON+8nYJ3
	JDe6lIQS24rpRlbZUJHRN/rbrnaE89kOixQE43uw6E73rW01/ICCEaDbJ6Uvso4LXHXba5wZo8b
	Xf1B/NWlXQeIitW50YiTnmdbgewUqusHsaBCLazh5p0/6WXAIlmw8xTg/p3uuMqnwYnRGi8A5Zc
	13l8hw==
X-Received: by 2002:a05:6402:23d0:b0:65f:8b6e:e1e0 with SMTP id
 4fb4d7f45d1cf-65f8b6ee3eamr689444a12.14.1772007368034; Wed, 25 Feb 2026
 00:16:08 -0800 (PST)
MIME-Version: 1.0
References: <cover.1771863641.git.l.scorcia@gmail.com> <2fbf179c03c61f527e2583f9df4f97f6aaf3297a.1771863641.git.l.scorcia@gmail.com>
 <bc064717108de5ea1a8c98937bb03fd00794682c.camel@mediatek.com>
In-Reply-To: <bc064717108de5ea1a8c98937bb03fd00794682c.camel@mediatek.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 25 Feb 2026 09:15:54 +0100
X-Gm-Features: AaiRm52dJLE1LivX43DCdk6HfEogq21vfzP2R-PH1LBTeVTcW8EPNiYL5Cy5zOU
Message-ID: <CAORyz2Ki5aPNbcY5-_mRwFgwT46VN_pRV2iP7z7x3snzrbKz=g@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] drm/mediatek: dsi: Add compatible for mt8167-dsi
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "robh@kernel.org" <robh@kernel.org>, 
	=?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>, 
	"tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch" <simona@ffwll.ch>, 
	"mripard@kernel.org" <mripard@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "vkoul@kernel.org" <vkoul@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"airlied@gmail.com" <airlied@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_081613_927760_BEE6A1F5 
X-CRM114-Status: GOOD (  19.29  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> > The mt8167 DSI controller is fully compatible with the one found in
> > mt2701. Device tree documentation is already present upstream.
>
> If mt8167 DSI is fully compatible with mt2701 DSI, I think the binding document and device tree should be modified.
> In device tree,
>
>     compatible = "mediatek,mt8167-dsi", "mediatek,mt2701-dsi";
>
> And this patch is not necessary.

Hi, if I understand your review correctly that's what v2 [1] of this
patch did, but the change was rejected during review.

As far as I can see there is no win-win solution here. This tricky
situation derives from the fact that in last year's submissions the
change was only partially merged - the bindings went upstream while
the driver did not, and now we have to work around this. In v3 I tried
to address the issue by actually implementing what the binding
document says.
I'll be happy to resubmit v4 but I need to know what's the consensus here.

Thanks!

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/ff920a7cc94f2b0c03d4bb55142030fded30d07c.1771258407.git.l.scorcia@gmail.com/

> >
> > Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index af4871de9e4c..ad10e86b161d 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -1301,6 +1301,7 @@ static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
> >
> >  static const struct of_device_id mtk_dsi_of_match[] = {
> >         { .compatible = "mediatek,mt2701-dsi", .data = &mt2701_dsi_driver_data },
> > +       { .compatible = "mediatek,mt8167-dsi", .data = &mt2701_dsi_driver_data },
> >         { .compatible = "mediatek,mt8173-dsi", .data = &mt8173_dsi_driver_data },
> >         { .compatible = "mediatek,mt8183-dsi", .data = &mt8183_dsi_driver_data },
> >         { .compatible = "mediatek,mt8186-dsi", .data = &mt8186_dsi_driver_data },
> > --
> > 2.43.0
> >
> >
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

