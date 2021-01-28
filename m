Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41055C433E6
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 06:16:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA71C64DC4
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 06:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA71C64DC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PS7ACcePpVvmbMW3ko/3OIjuB8U/RdIfqZWUp3K+71g=; b=oXem6ZPgsd83q6Zjg3ht73Z1E
	/2EivelD0kLy+8DePOhnOYpbc8Gjkoy8JXZMkmovOTvDkdWqNzVoDTzikfDvXykHEi+wxt9OlU6We
	E2ZqbLVmbsBAEkIKO0v6LOTHUbUlI0+01r1nhx+VQmcr7baLe6CGt1jQE0ua7ehBWvT45HWdkAKKx
	d6PiGVw8XQnIp6Jl8Cdj8wdOEHKQKwKT6FJAHv+CEg5ytxwX2Ycabnybu0TfX9+ZSJ6O4O8jFGwio
	kDBzuka+Goyts5erkNZJfGLW9Dmf9jLudYdhA5ucYrOzyqEs8Fgfy1nRa1vhyyHrEyAqsV6Co4hit
	54joPk1Hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l50bK-0002Dg-Dj; Thu, 28 Jan 2021 06:16:18 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l50bH-0002Cp-2c
 for linux-mediatek@lists.infradead.org; Thu, 28 Jan 2021 06:16:16 +0000
Received: by mail-il1-x135.google.com with SMTP id l4so4231580ilo.11
 for <linux-mediatek@lists.infradead.org>; Wed, 27 Jan 2021 22:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/KzLZrIlj2KEusKb+DCyZQltguwX4cquIABSWZ+YWu8=;
 b=HqmGgkXeKHV92s/9MhA3TQIkVUpzUw0v86uHHPVMKwq0rTqQWTi/SuEW9e5RKbe+RZ
 wyr+Y5vvEj436caCaAH80No/ZuRzT1uCqHhnL2It/OvCuK2BrPQ+fgZRdObo7Z4n7wXZ
 9p/I9NGSQLTfabyk/sU+R+5u6KivXtcIsIREg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/KzLZrIlj2KEusKb+DCyZQltguwX4cquIABSWZ+YWu8=;
 b=f+/qLEPd6XbFz7eliMI7nR65ne3zYlETwuQ/SRqM0IT+V6sQVGAUx93/RI9GoIfsMb
 ob8SRnQONn7KxIIZy3wyHqx8Kd0tUh3SKg68xWeCgxYgej7H7htBrWY9qX0xaFfiOafU
 lH0XqtKAPqSo8RPYzODuKFMtMB8ITWcj3XViwvH8Do95WjYRvm/0QdcP/uJya+WeDWzl
 sx8PrW9QHT0mIfePjie4TfiPde+Sbivs+nfUBV0eW12GmUUkgz8ptS1ObmkvWN3r7VRn
 qMNFM3eqdG32QhkFyzJNZOvuHsiSjLxpASVtw++C8iKCGUelngdONaXMEKlUHvEVefAP
 SIKg==
X-Gm-Message-State: AOAM533+BIbCfCREMeqmKvi8tGmwWNaD893xb08bHLwLajwbBmB2mSar
 Wl6lq02VpLBEjWLpjojKtPGHENobU+ywv/XuQXFAwA==
X-Google-Smtp-Source: ABdhPJzBqhKTHMlI5tApnzJW0pJjO1n8CMr+sbfm3OGH0z5XL/nYsEZM5Ecpax4npwyGOI9nkuewCcEWRxOv827+6J4=
X-Received: by 2002:a92:15c6:: with SMTP id 67mr11242319ilv.283.1611814573141; 
 Wed, 27 Jan 2021 22:16:13 -0800 (PST)
MIME-Version: 1.0
References: <20210127045422.2418917-1-hsinyi@chromium.org>
 <20210127045422.2418917-9-hsinyi@chromium.org>
 <1611814421.28312.9.camel@mtksdaap41>
In-Reply-To: <1611814421.28312.9.camel@mtksdaap41>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 28 Jan 2021 14:15:47 +0800
Message-ID: <CAJMQK-gHjmm-BaG83EXMOkT6KeCyJJN4ZqRDdT75BcED53bREw@mail.gmail.com>
Subject: Re: [PATCH v10 8/9] drm/mediatek: add DDP support for MT8183
To: CK Hu <ck.hu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_011615_292310_481D4B7D 
X-CRM114-Status: GOOD (  21.93  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 28, 2021 at 2:13 PM CK Hu <ck.hu@mediatek.com> wrote:
>
> Hi, Hsin-Yi:
>
> Modify the title's prefix to 'soc: mediatek:'
>
> On Wed, 2021-01-27 at 12:54 +0800, Hsin-Yi Wang wrote:
> > From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> >
> > Add DDP support for MT8183 SoC.
> >
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/soc/mediatek/mtk-mutex.c | 50 ++++++++++++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> >
> > diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> > index f531b119da7a9..f64e9c33e85ad 100644
> > --- a/drivers/soc/mediatek/mtk-mutex.c
> > +++ b/drivers/soc/mediatek/mtk-mutex.c
> > @@ -14,6 +14,8 @@
> >
> >  #define MT2701_MUTEX0_MOD0                   0x2c
> >  #define MT2701_MUTEX0_SOF0                   0x30
> > +#define MT8183_DISP_MUTEX0_MOD0                      0x30
> > +#define MT8183_DISP_MUTEX0_SOF0                      0x2c
>
> Modify 'DISP_MUTEX' to 'MUTEX'
>
> >
> >  #define DISP_REG_MUTEX_EN(n)                 (0x20 + 0x20 * (n))
> >  #define DISP_REG_MUTEX(n)                    (0x24 + 0x20 * (n))
> > @@ -37,6 +39,18 @@
> >  #define MT8167_MUTEX_MOD_DISP_DITHER         15
> >  #define MT8167_MUTEX_MOD_DISP_UFOE           16
> >
> > +#define MT8183_MUTEX_MOD_DISP_RDMA0          0
> > +#define MT8183_MUTEX_MOD_DISP_RDMA1          1
> > +#define MT8183_MUTEX_MOD_DISP_OVL0           9
> > +#define MT8183_MUTEX_MOD_DISP_OVL0_2L                10
> > +#define MT8183_MUTEX_MOD_DISP_OVL1_2L                11
> > +#define MT8183_MUTEX_MOD_DISP_WDMA0          12
> > +#define MT8183_MUTEX_MOD_DISP_COLOR0         13
> > +#define MT8183_MUTEX_MOD_DISP_CCORR0         14
> > +#define MT8183_MUTEX_MOD_DISP_AAL0           15
> > +#define MT8183_MUTEX_MOD_DISP_GAMMA0         16
> > +#define MT8183_MUTEX_MOD_DISP_DITHER0                17
> > +
> >  #define MT8173_MUTEX_MOD_DISP_OVL0           11
> >  #define MT8173_MUTEX_MOD_DISP_OVL1           12
> >  #define MT8173_MUTEX_MOD_DISP_RDMA0          13
> > @@ -87,6 +101,12 @@
> >  #define MT2712_MUTEX_SOF_DSI3                        6
> >  #define MT8167_MUTEX_SOF_DPI0                        2
> >  #define MT8167_MUTEX_SOF_DPI1                        3
> > +#define MT8183_MUTEX_SOF_DSI0                        1
> > +#define MT8183_MUTEX_SOF_DPI0                        2
> > +
> > +/* Add EOF setting so overlay hardware can receive frame done irq */
> > +#define MT8183_MUTEX_EOF_DSI0                        (MT8183_MUTEX_SOF_DSI0 << 6)
> > +#define MT8183_MUTEX_EOF_DPI0                        (MT8183_MUTEX_SOF_DPI0 << 6)
> >

Hi CK, comment is added here. I can move to mt8183_mutex_sof if preferred.

> >  struct mtk_mutex {
> >       int id;
> > @@ -181,6 +201,20 @@ static const unsigned int mt8173_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> >       [DDP_COMPONENT_WDMA1] = MT8173_MUTEX_MOD_DISP_WDMA1,
> >  };
> >
> > +static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> > +     [DDP_COMPONENT_AAL0] = MT8183_MUTEX_MOD_DISP_AAL0,
> > +     [DDP_COMPONENT_CCORR] = MT8183_MUTEX_MOD_DISP_CCORR0,
> > +     [DDP_COMPONENT_COLOR0] = MT8183_MUTEX_MOD_DISP_COLOR0,
> > +     [DDP_COMPONENT_DITHER] = MT8183_MUTEX_MOD_DISP_DITHER0,
> > +     [DDP_COMPONENT_GAMMA] = MT8183_MUTEX_MOD_DISP_GAMMA0,
> > +     [DDP_COMPONENT_OVL0] = MT8183_MUTEX_MOD_DISP_OVL0,
> > +     [DDP_COMPONENT_OVL_2L0] = MT8183_MUTEX_MOD_DISP_OVL0_2L,
> > +     [DDP_COMPONENT_OVL_2L1] = MT8183_MUTEX_MOD_DISP_OVL1_2L,
> > +     [DDP_COMPONENT_RDMA0] = MT8183_MUTEX_MOD_DISP_RDMA0,
> > +     [DDP_COMPONENT_RDMA1] = MT8183_MUTEX_MOD_DISP_RDMA1,
> > +     [DDP_COMPONENT_WDMA0] = MT8183_MUTEX_MOD_DISP_WDMA0,
> > +};
> > +
> >  static const unsigned int mt2712_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
> >       [MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
> >       [MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
> > @@ -198,6 +232,12 @@ static const unsigned int mt8167_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
> >       [MUTEX_SOF_DPI1] = MT8167_MUTEX_SOF_DPI1,
> >  };
> >
> > +static const unsigned int mt8183_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
> > +     [MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
> > +     [MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0 | MT8183_MUTEX_EOF_DSI0,
> > +     [MUTEX_SOF_DPI0] = MT8183_MUTEX_SOF_DPI0 | MT8183_MUTEX_EOF_DPI0,
>
> According to discussion in [1], add comment for the odd EOF setting.
>
> [1]
> https://patchwork.kernel.org/project/linux-mediatek/patch/1595469798-3824-8-git-send-email-yongqiang.niu@mediatek.com/
>
> Regards,
> CK.
>
>
> > +};
> > +
> >  static const struct mtk_mutex_data mt2701_mutex_driver_data = {
> >       .mutex_mod = mt2701_mutex_mod,
> >       .mutex_sof = mt2712_mutex_sof,
> > @@ -227,6 +267,14 @@ static const struct mtk_mutex_data mt8173_mutex_driver_data = {
> >       .mutex_sof_reg = MT2701_MUTEX0_SOF0,
> >  };
> >
> > +static const struct mtk_mutex_data mt8183_mutex_driver_data = {
> > +     .mutex_mod = mt8183_mutex_mod,
> > +     .mutex_sof = mt8183_mutex_sof,
> > +     .mutex_mod_reg = MT8183_DISP_MUTEX0_MOD0,
> > +     .mutex_sof_reg = MT8183_DISP_MUTEX0_SOF0,
> > +     .no_clk = true,
> > +};
> > +
> >  struct mtk_mutex *mtk_mutex_get(struct device *dev)
> >  {
> >       struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
> > @@ -457,6 +505,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
> >         .data = &mt8167_mutex_driver_data},
> >       { .compatible = "mediatek,mt8173-disp-mutex",
> >         .data = &mt8173_mutex_driver_data},
> > +     { .compatible = "mediatek,mt8183-disp-mutex",
> > +       .data = &mt8183_mutex_driver_data},
> >       {},
> >  };
> >  MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
