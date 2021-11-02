Return-Path: <SRS0=eBCQ=PV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE56C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 10:49:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E1EE60E74
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 10:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E1EE60E74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SemP9BApqW8nzULKW/J6rFVA4APzZBJjHn2i1SjrNJk=; b=dwY72nalIonqAt
	ddUc/Wgt/JCrsXscOkqyGOPlsMwo7HDT6php0CMSv6juu3df5sdSoqUkg/jYsCk/DqQM7WfT53mIg
	ASXRjPepW+HjCc83SFpPS9Sex4tiamfvEkcIkuNoNpfuCIBgRHZi1lOUg4/hQMmRC/evFMar78/bs
	CWpz6QPQfYnRVW94m/tnpXcWWq1x5PRwbQ6DJi+TXm1EYUJUkWHWFmpovdULTLnxV1/9M336ooS02
	nxtc86k6IZ6lHWze+Q31AphXYC781vmv+Hl799St2f48fgaD507y1q6irv613PD6Vca320BqL8pmG
	iWJAjawqsbE0HvfLNwbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhrLl-001Nmp-NZ; Tue, 02 Nov 2021 10:49:05 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhrLc-001NkN-Tt
 for linux-mediatek@lists.infradead.org; Tue, 02 Nov 2021 10:48:58 +0000
Received: by mail-pg1-x52b.google.com with SMTP id m21so19744161pgu.13
 for <linux-mediatek@lists.infradead.org>; Tue, 02 Nov 2021 03:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hJF/dHyk/3IQlaukmeK0wLdUdqN/AGJrVLVkId2ki2M=;
 b=xHwLcaZIYZgTQBtnYpAy69BmDS6ZJvi7f1usoT6wyQxHgK0mVnzvc5qCgCu7DAbzaC
 xE0kTXGb37fSqYGVxBcDw21xo/uVjZGDMqbbn31XJfY7jytObUST+tboLp30x4xIa1Xh
 15lKWjmSHswtL5SfilbBPVoxUKUhw4TRr3gRKwpeK1dPbX6Z531pzSRqG8xPfxgg1wEE
 Vf9lHPNEzERIhxj3nxhWPUOMWShJGybMzpciCQT0xSu8L/oeX1s5ZJmLAoWyWAB9L4IH
 MaA5NnVfx4PGjzFwQLq6iRN2l7Bqe23cdNIuI4Jh8q+vvKvsIw0TZnrecvu3Q5g/qZSI
 9UCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hJF/dHyk/3IQlaukmeK0wLdUdqN/AGJrVLVkId2ki2M=;
 b=OOXR9H0+B+TYMvyb4UsXqPfBkxb7PVl3nvz6x3OSHxNReuyu31mJaqi0XSrQsBNVqd
 c18/RwleOHEqeKOS3fD9J/UMODWsFuQSImxaWgEZEPn+2sr5nt/or1Jf8Gl3WLh+GmLQ
 vXOOHNMTUpLE7+JdzNpjVmJdrmEy4LOZgpDCRvARjO/WRTLxBxDS2XeLxjWqUoyoAcAE
 lPe466QONdd+EDUbHdx/WJKuYQvJ3b9nWIVoQdFnOWDi70TWAxE6qg2URABIXq7QbpEK
 tff2ZUGhCLYEPDdYPSYMsel1lqYwinowhexX0QM97WzOcqhqFYKHNE2wiRiy7wJmLeQC
 UDWQ==
X-Gm-Message-State: AOAM532X2R8rauMEjV1Za123lvcWmHOCD4InO9uDkP47YuKSsTfdph9G
 tYsA7AWwpbv8DsCv81HdCvtYlor5b8xDs5DLi22HyA==
X-Google-Smtp-Source: ABdhPJxf7ODLAmRwZb/6gWx5MMwlIfSbftXWQI/+7QaNqZg+PvaL+AL65TDTHnzYCihEIh32pgIL0MF/oUcUsHDaS10=
X-Received: by 2002:a63:6c43:: with SMTP id h64mr21356842pgc.306.1635850131950; 
 Tue, 02 Nov 2021 03:48:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210915223117.7857-1-jitao.shi@mediatek.com>
 <20210915223117.7857-4-jitao.shi@mediatek.com>
 <a16150b6b10dca4bf961b8e02b5e4d940b98468c.camel@mediatek.com>
 <20211102015631.GA2248315@anxtwsw-Precision-3640-Tower>
In-Reply-To: <20211102015631.GA2248315@anxtwsw-Precision-3640-Tower>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 2 Nov 2021 11:48:40 +0100
Message-ID: <CAG3jFyvBRSDHkiVx--H84eoeDvDXYQN4YRvsLhfX7_M+15KVmA@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] drm/bridge: anx7625: config hs packets end aligned
 to avoid screen shift
To: Xin Ji <xji@analogixsemi.com>
Cc: Jitao Shi <jitao.shi@mediatek.com>, Andrzej Hajda <a.hajda@samsung.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, ck.hu@mediatek.com, stonea168@163.com, 
 huijuan.xie@mediatek.com, rex-bc.chen@mediatek.com, shuijing.li@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_034856_972944_0FAB59B9 
X-CRM114-Status: GOOD (  18.61  )
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

On Tue, 2 Nov 2021 at 02:56, Xin Ji <xji@analogixsemi.com> wrote:
>
> On Mon, Nov 01, 2021 at 11:16:15AM +0800, Jitao Shi wrote:
> > Hi Xin,
> >
> > Please help to review the changes in anx7625.c
> >
> > On Thu, 2021-09-16 at 06:31 +0800, Jitao Shi wrote:
> > > This device requires the packets on lanes aligned at the end to fix
> > > screen shift or scroll.
> > >
> > > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > > ---
> > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > index 14d73fb1dd15..d76fb63fa9f7 100644
> > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > @@ -1327,6 +1327,7 @@ static int anx7625_attach_dsi(struct
> > > anx7625_data *ctx)
> > >             MIPI_DSI_MODE_VIDEO_SYNC_PULSE  |
> > >             MIPI_DSI_MODE_NO_EOT_PACKET     |
> > >             MIPI_DSI_MODE_VIDEO_HSE;
> > > +   dsi->hs_packet_end_aligned = true;
>
> Looks good, it's OK for me.
> Reviewed-by: Xin Ji <xji@analogixsemi.com>

Acked-by: Robert Foss <robert.foss@linaro.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
