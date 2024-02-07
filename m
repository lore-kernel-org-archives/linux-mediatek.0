Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4149C4828D
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Feb 2024 09:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TsNj2DX8RJsqHOPPwaVUY94IMVrEnah0wSC3qGvPZMs=; b=aI1JjzZiWXEZz1KaySH6DYRWNE
	uDbHQ7rnB8hQDbzM7LZicc4L0Pa2qYBJlQRjTbYLu/jRnTEJjQH9S+Xh0hjTaVJopSf0AWHJoWL8F
	Abs0RcoQ8ibVpdn1r5gr4EkBtNXV2QNxeYpLFixjmYaadhR3wDQMoSvi7EJyhTswRC1+C59h3KKpf
	rA1nhalFUpKoWFocClkWgq3/FtVgEJHS/Ddj2evtblnedVHt3mDREYfhUEBeVuwEvpACPO+/HpM+a
	3WqBchN7Gn7EaZKzWGNHBUDwSX7k0FBX3c9Jt68VUF4qO02/Up2baAF2Cx/TREWkOz04x2PXFLrHF
	0qOXxd4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXdue-0000000A80p-19hf;
	Wed, 07 Feb 2024 09:08:12 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXdub-0000000A802-3OKd
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Feb 2024 09:08:11 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-55ee686b5d5so434236a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Feb 2024 01:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707296888; x=1707901688; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TsNj2DX8RJsqHOPPwaVUY94IMVrEnah0wSC3qGvPZMs=;
        b=Zu26lZWiYILNerwNggx7TgRMLcTHqwWFTCeGLXNM0HGv6O0rVbyq5fBlx6rd4jPHJT
         mHTywWUbUMp7ScnDD0NPh3HhLIWoxPP+BAj/DG2kcG37u7FANfXbjFDS4HGgKNRxW8fj
         /28nUq1eorhnzTqwuHZ3+YoS/MsW/ziDzxhsZErM7m+nEpKXWlfBdmww6NaEwBmYRVUk
         XUe9GXEdFnwXVJVeKvzPZE0jr+RnPuOYUP3+ihAdslVq3H5mIgwXM9o35BcEg5+sxICb
         IOz4HPcsJQgRgktAy3nuNEEXv/jiJyizWv65eq7AP2VL3je4lQEDaaRO7qJ9hN2n8snW
         x3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707296888; x=1707901688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TsNj2DX8RJsqHOPPwaVUY94IMVrEnah0wSC3qGvPZMs=;
        b=NanfV3+aR6bYFIkZhPSgeDZ3wKikBz8GRX5O5UUZ7pbJutVNhPJyvb3u+NN76rj74j
         XJWOjkYRcVWRK+y8QAY5SW68GnFaKUHndnx8sUWG6Z2xX5op+8+B7Zn98CHqwGOc/zCZ
         77qW7JHBqU7eZm1vmD11L/zaOeCB38uVlIIed2/volEez9GnKrfD8OLM6PvIaJahQmvS
         eL2RdaWQRdOkzk3Z3T0uwHwC7wYROeYOI3kz9q+DriIQsNENF4XCVbdqon/QVG69LHL+
         XS5libZZnOjaZZBDy4seXA6rkdgDZl4qWktQfScoZIU4tX2JB2g/U7VDbrKA0Ilf9Ib5
         0T0A==
X-Gm-Message-State: AOJu0Yz1ZvT8eigNmakCuTpcnn73jEgn5YfTdCf2xQefRBKmOH6bvNZY
	3vREcU1q0bvPOGVtQmoXH+QctNlwkjOt7HBrqA15KlZqU//tsdDAjoEqdnMtGXE=
X-Google-Smtp-Source: AGHT+IGGcb322HA0o5RHNBrkSMZHPf8n0gbux/28bD/rBXtfoFtT5yhn0dzUVOa8i9Lwlhq6DNXeqQ==
X-Received: by 2002:aa7:de04:0:b0:560:1652:e7cb with SMTP id h4-20020aa7de04000000b005601652e7cbmr3693310edv.16.1707296887842;
        Wed, 07 Feb 2024 01:08:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+rUyq+VfYElNWnIEpSD69Mb31OSI6iMCKmXTJb2gIF+MK3w0nklCk7YxlQ+5SIw0shtAqcVLEaz/kdD6yXacs0svf29R+lPj51I/s7oUy5k9KXkmvEJa+O2vyTor9OF3RAmfabD52nteSiJDIccTcCpF4M5DXn3Umz8/2QwXkurxzG9hpkpdyi9NRbS6uVU6AeZLoyg8HDrejOTjxVqtfAAHlKHqhOQSx4DM8gfmAHSdKyPH0mMNMzs02NKqM71p/d3WIIcVrWIzN6nWpy7x5wmrxhHTNYswC5C15P/PtXH8zWNchzR10lWKgqHFeSGEhJME0W3wzBhAgAf9TXOt0VvttXVnkFSawr64adMdlTIeJpWLwo8w5pujtBg5TtwKKyObqtuo=
Received: from linaro.org ([62.231.97.49])
        by smtp.gmail.com with ESMTPSA id f1-20020aa7d841000000b00560cd4f3098sm450117eds.95.2024.02.07.01.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 01:08:07 -0800 (PST)
Date: Wed, 7 Feb 2024 11:08:05 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC 1/2] spmi: Add support for multi-master
Message-ID: <ZcNIddeG6VHxBEOQ@linaro.org>
References: <20240207-spmi-multi-master-support-v1-0-ce57f301c7fd@linaro.org>
 <20240207-spmi-multi-master-support-v1-1-ce57f301c7fd@linaro.org>
 <CAA8EJpqsJmv36=o1aTjVH6eMHXMg8BHNpiDvs+Q8YB23ezVGtQ@mail.gmail.com>
 <ZcMvFtAwQQjAZhk6@linaro.org>
 <CAA8EJprqWLX7_yWZzKp3FAKFGkSkk041f9hj1uXuRBrbH5APyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJprqWLX7_yWZzKp3FAKFGkSkk041f9hj1uXuRBrbH5APyQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_010809_877542_4EB57E7A 
X-CRM114-Status: GOOD (  30.20  )
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

On 24-02-07 09:23:09, Dmitry Baryshkov wrote:
> On Wed, 7 Feb 2024 at 09:19, Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > On 24-02-07 01:55:39, Dmitry Baryshkov wrote:
> > > On Wed, 7 Feb 2024 at 01:34, Abel Vesa <abel.vesa@linaro.org> wrote:
> > > >
> > > > Some newer SPMI controllers support multiple bus masters.
> > > > Such a master can control multiple slave devices. The generic
> > > > framework needs to be able to pass on the master id to the
> > > > controller-specific driver. So do that. The framework will
> > > > check if the devicetree child nodes are actually bus masters
> > > > and will register the devices for each master. The legacy
> > > > approach will still be supported for backwards compatibility.
> > >
> > > Please remind me, are those two actual bus musters driving a single
> > > bus in parallel or two SPMI buses being handled by a single device? In
> > > the latter case this implementation is incorrect. There should be
> > > multiple spmi_controller instances, one for each bus. Allocate them in
> > > a loop and set ctrl->dev.of_node after allocating.
> >
> > It's two SPMI buses (two sets of wires) handled by the same controller,
> > HW-wise.
> >
> > If we register two spmi controllers with the kernel framework, it will
> > be HW inaccurate, because there is just one controller which has
> > multiple masters.
> 
> struct spmi_controller is a controller for a single bus. Inside your
> device you have two SPMI buses, each can be controlled by its own
> struct spmi_controller. Just like devices that control multiple I2C,
> SPI or USB busses register a separate instance of the bus controller.

Well, this is what this patchset is trying to do in the generic part.
The SPMI controller supports multiple buses (HW-wise) and therefore SW
implementation shouldn't be tied to single bus requirement.

> 
> >
> > I'm not saying it might not work. But, to me, it looks more like a hack.
> >
> > Basically, we would be mapping HW bus masters to kernel controllers.
> 
> Buses, not just masters.
> 
> >
> > >
> > > >
> > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > > ---
> > > >  drivers/spmi/spmi-mtk-pmif.c |  6 ++--
> > > >  drivers/spmi/spmi-pmic-arb.c | 10 +++---
> > > >  drivers/spmi/spmi.c          | 76 ++++++++++++++++++++++++++++++--------------
> > > >  include/linux/spmi.h         | 10 +++---
> > > >  4 files changed, 67 insertions(+), 35 deletions(-)
> > >
> > > --
> > > With best wishes
> > > Dmitry
> 
> 
> 
> -- 
> With best wishes
> Dmitry

