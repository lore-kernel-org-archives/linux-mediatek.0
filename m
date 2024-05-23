Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE6FC25B75
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 10:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BL1+X00ACKL/bv+6PDk9L99Rw1muN1ABKKcgYAgwe5Y=; b=GzysrjspUToUh6lB0A8WBvg/l8
	AyngTMpunL1JNakzyNlrEdJC90hJlPnajoDf6vICIAcG4RtMUWffdspaqjrYpG7izaZ01ykKAOGnS
	HIzErnd3axB2/8/q4+hE5iGvnPmpTny0Npz/FsyrOeb621lOuKFZbsocFHzBkicOeINrjVnL/B+XO
	8r+2x4Mojdqak2eNT/V5N4Nb6o6ABz8bhkxP0zLVFZzjAJ7IymFbm66QL3RasEs6X6ar2mMTZVqEk
	dAJ2pXMdxOFzbab82VSu2JOOv/+Luc6mjQkucfmzFWZo9/ogsXqSFlu+3thGxqeHJ9lheaqv1mj2s
	J6/0i1PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA5st-00000005usv-42dn;
	Thu, 23 May 2024 10:41:20 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA5sq-00000005uqu-2wkT
	for linux-mediatek@lists.infradead.org;
	Thu, 23 May 2024 10:41:18 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2e95125e257so7240041fa.0
        for <linux-mediatek@lists.infradead.org>; Thu, 23 May 2024 03:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716460873; x=1717065673; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BL1+X00ACKL/bv+6PDk9L99Rw1muN1ABKKcgYAgwe5Y=;
        b=KKGhBretwalGVXvu0PMY/mbHrTBwI5Qg5Ggf9U+wg3RouCc1ZWG9ONyJ0rI8+76SAM
         EdW5gaOUjIXcH6nP+26awu1dtwxy5CP1pN9ZykHvBX2FqqPk8D2X4L+j7W6yeWhFzlsh
         Gka/B5WxsYEwT6h5DYFJHhfJmRx2tVRlFpEAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716460873; x=1717065673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BL1+X00ACKL/bv+6PDk9L99Rw1muN1ABKKcgYAgwe5Y=;
        b=K379ZgnHhvjY6U14hUhVBG6WbDMgoZ94sX6uCbhZaxuI807IYqf1fN7WgUIUeaSrX7
         +6R9MEgtEGeqlixc8/6dpSdcvQoOqCvIRwGBQ4r1ZdFGghKWrIs962KgRNCTXMAp5st4
         sdYMZ24sorpqrHVCc+dgkrwjGroFAOoGn2YY6pGA6jgzBEDT1iW9nm23A4oC88SNDaaC
         WyF6QlGVXkZkem4BJfM/dJIRrqtRsvgmOZKaqGAEUWaQnXGZR8Mrw5BWsTlSh4T5enHM
         mTCt7WEYuDo1fJtDHnk6U+wMqvIkVJk5y/enIrXn3WuBHG2dcRvqnO3e5YsuTEmrgaAm
         C6sw==
X-Forwarded-Encrypted: i=1; AJvYcCU4kVecfqq+mYNKkAcVz+hVyckz91Ou/kAVdoeAbxyAsfEpPkZHlJPJTCa/iQ9hu15OKckkzo6prFa4SmCgm+Gv3OhEnaLRNXG5uUt0/YwrsF1+
X-Gm-Message-State: AOJu0YwC1canKduf/UYiF12dcvgbeoACj3jJQR3wyE5kHQhWNtYIg1vw
	st+tOdsr/gNCZBdZqBo0qRGqHQ8AsLkpfFbeN0kIJL1eh2xYm2gTJqUSD1vhQ0kIby7f3jVJYrC
	GLjXwGYJoVhBXFiKI8+VJnaBxm1OD99EiMLHU
X-Google-Smtp-Source: AGHT+IFqTEnp78PCvWoQDhZCseLpuI/oZewTrl4O4PyV0liWJOGAHT0/ixjwOP3rlpfNlPgDIVcGQNWnWwCWzn66LzI=
X-Received: by 2002:ac2:4e45:0:b0:51b:efc:df39 with SMTP id
 2adb3069b0e04-527ef4f5d09mr587927e87.10.1716460873562; Thu, 23 May 2024
 03:41:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240521075717.50330-4-angelogioacchino.delregno@collabora.com> <eca4d113-ba59-45aa-9224-22235fb09ddc@bosc.ac.cn>
In-Reply-To: <eca4d113-ba59-45aa-9224-22235fb09ddc@bosc.ac.cn>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 23 May 2024 18:41:02 +0800
Message-ID: <CAGXv+5Gzau7qFrsOrKsm7yXNX7AKadgNM5S3SaTNNu57=5-8EQ@mail.gmail.com>
Subject: Re: [v5,3/3] drm/mediatek: Implement OF graphs support for display paths
To: Sui Jingfeng <suijingfeng@bosc.ac.cn>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, chunkuang.hu@kernel.org, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com, 
	ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, Alexandre Mergnat <amergnat@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_034116_759968_B7B10133 
X-CRM114-Status: GOOD (  14.50  )
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

On Wed, May 22, 2024 at 8:32=E2=80=AFPM Sui Jingfeng <suijingfeng@bosc.ac.c=
n> wrote:
>
> Hi,
>
>
> On 5/21/24 15:57, AngeloGioacchino Del Regno wrote:
> > +static int mtk_drm_of_ddp_path_build(struct device *dev, struct device=
_node *node,
> > +                                  struct mtk_mmsys_driver_data *data)
> > +{
> > +     struct device_node *ep_node;
> > +     struct of_endpoint of_ep;
> > +     bool output_present[MAX_CRTC] =3D { false };
> > +     int ret;
> > +
> > +     for_each_endpoint_of_node(node, ep_node) {
> > +             ret =3D of_graph_parse_endpoint(ep_node, &of_ep);
> > +             of_node_put(ep_node);
>
> There is going to *double* decline the reference counter, as the
> __of_get_next_child() will decrease the reference counter for us
> on the next iteration.
>
>
> > +             if (ret) {
> > +                     dev_err_probe(dev, ret, "Cannot parse endpoint\n"=
);
> > +                     break;
> > +             }
>
> Move the 'of_node_put(ep_node)' into brace '{}' here, if we really cares
> about the reference count.
>
> > +
> > +             if (of_ep.id >=3D MAX_CRTC) {
>
> ditto ?

Maybe we should just add a scoped version of for_each_endpoint_of_node().

See https://lore.kernel.org/all/20240223124432.26443-1-Jonathan.Cameron@hua=
wei.com/

ChenYu

> > +                     ret =3D dev_err_probe(dev, -EINVAL,
> > +                                         "Invalid endpoint%u number\n"=
, of_ep.port);
> > +                     break;
> > +             }
> > +
> > +             output_present[of_ep.id] =3D true;
> > +     }
> > +
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (output_present[CRTC_MAIN]) {
> > +             ret =3D mtk_drm_of_ddp_path_build_one(dev, CRTC_MAIN,
> > +                                                 &data->main_path, &da=
ta->main_len);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     if (output_present[CRTC_EXT]) {
> > +             ret =3D mtk_drm_of_ddp_path_build_one(dev, CRTC_EXT,
> > +                                                 &data->ext_path, &dat=
a->ext_len);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     if (output_present[CRTC_THIRD]) {
> > +             ret =3D mtk_drm_of_ddp_path_build_one(dev, CRTC_THIRD,
> > +                                                 &data->third_path, &d=
ata->third_len);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
>
> --
> Best regards
> Sui Jingfeng
>

