Return-Path: <SRS0=7Zfj=FT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90EB2C4361B
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Dec 2020 13:38:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51DEC224D2
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Dec 2020 13:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51DEC224D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UcREccgq1+fO5edohk5IPmfvbdTUyf46/T1EKR5qukY=; b=d/LS1pl/p1uxHzUuZq/0TwFBz
	PJYoJkrhQKSf+SJZAhYsIkFzAlTlry/JTebsozkXexjWMGDyW7viYgk5RPj0VRiq792c1MxpYpBF3
	/HrpCL7G4iVjkPXnXxnkb/HhRr5GgzZGSHP63NXiSbcXNbLH75OkiRNG75tCOtEFJXC5jFCWIWL9P
	XNmdTMnBu3eMGclE/mLn6mxoRe6t/rBRtcm6X3b33L2hExNhBw/KhwIV4e6eI2Mr5b8+od4BsRD8c
	oU3ORuSC18XfWSqVnwR37pWy7X6QsI+XnPr31scXcH15uGvflx++mTZ5oeym3qceLETQGhCTLBP90
	m7n9JMW8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpAWr-0002rX-Ri; Tue, 15 Dec 2020 13:38:13 +0000
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpAWm-0002pG-Bs
 for linux-mediatek@lists.infradead.org; Tue, 15 Dec 2020 13:38:10 +0000
Received: by mail-vs1-xe41.google.com with SMTP id e15so9462736vsa.0
 for <linux-mediatek@lists.infradead.org>; Tue, 15 Dec 2020 05:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9FgvEA6LpRqaZRiWRCs1HzkpZ2wxH4J/Kj/S8yl9EX8=;
 b=aMDDKyWXNebTeXg5FMLCK9txB+AXo41QnAw7eILkX0NTeyAdt7jEx4r62/kGLfIHLY
 NTdTfInWItH7WmdFOmFWrs0hZxC8xA4+JavAwYl1jp8pksKKMo4VeyPHa4XewnixNL71
 5zM6Wgsl4rhnbDaXq2EpMe4o9FfwGh7clMUv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9FgvEA6LpRqaZRiWRCs1HzkpZ2wxH4J/Kj/S8yl9EX8=;
 b=Y0HV4PyjSz83ZqOdrv7Z8svDw3WdoPHzBEWJhEj7iTWg8RrqQ08/11x3tOgaR9h+Ae
 OOMt9l8VYe/s9t48YHbDT+9Tgx3SFJtzM2BAi+EUzVO22tEnEJaoI3Xj1DubOptmEeOx
 hSXJiLrRdjQRsoQUKtaG/eykS13jCn/oaAE3rLqVi2LC+izt8/VLzkurAYUboMBiiV5B
 Jnd46RinuYCWFP31pTpePNZe455VTdNmRP13BHKPc6PuxnNnIC9hRzlkPCZKFhwKkM26
 FgTEK/EstF/6k65QPWt94ZIybfQnGg0CJHgtS+V44HwX9bRXoZjvTDU1hR85pukjpS03
 zDlg==
X-Gm-Message-State: AOAM531uuEBbP/sG5wobq8ZwN11Udj5fjfudw5sdpXYZW7u1MDutTIEm
 B2HeLh3TBHgnbje694xs/POpgN5nnrJlghxk3k8Paw==
X-Google-Smtp-Source: ABdhPJw2pSaiM6ovuzcTeKxy3DP6Ku+SVy15pyfTwAwM3z1ikPI1R8D7O7JPHcMCx/NBwXhCbuTiLeGCivpmnPRuZRE=
X-Received: by 2002:a67:5c03:: with SMTP id q3mr26997421vsb.47.1608039486303; 
 Tue, 15 Dec 2020 05:38:06 -0800 (PST)
MIME-Version: 1.0
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-8-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1607746317-4696-8-git-send-email-yongqiang.niu@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 15 Dec 2020 21:37:55 +0800
Message-ID: <CANMq1KCbmW4kbY5rbuogr9JJD5c5=-qatFs-EaWbuAxSzWmnLQ@mail.gmail.com>
Subject: Re: [PATCH v2, 07/17] drm/mediatek: add disp config and mm 26mhz
 clock into mutex device
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_083808_567642_4CCFC3BA 
X-CRM114-Status: GOOD (  24.82  )
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
 Devicetree List <devicetree@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Dec 12, 2020 at 12:12 PM Yongqiang Niu
<yongqiang.niu@mediatek.com> wrote:
>
> there are 2 more clock need enable for display.
> parser these clock when mutex device probe,
> enable and disable when mutex on/off
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 49 ++++++++++++++++++++++++++++------
>  1 file changed, 41 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> index 60788c1..de618a1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> @@ -118,7 +118,7 @@ struct mtk_ddp_data {
>
>  struct mtk_ddp {
>         struct device                   *dev;
> -       struct clk                      *clk;
> +       struct clk                      *clk[3];
>         void __iomem                    *regs;
>         struct mtk_disp_mutex           mutex[10];
>         const struct mtk_ddp_data       *data;
> @@ -257,14 +257,39 @@ int mtk_disp_mutex_prepare(struct mtk_disp_mutex *mutex)
>  {
>         struct mtk_ddp *ddp = container_of(mutex, struct mtk_ddp,
>                                            mutex[mutex->id]);
> -       return clk_prepare_enable(ddp->clk);
> +       int ret;
> +       int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(ddp->clk); i++) {
> +               if (IS_ERR(ddp->clk[i]))
> +                       continue;
> +               ret = clk_prepare_enable(ddp->clk[i]);
> +               if (ret) {
> +                       pr_err("failed to enable clock, err %d. i:%d\n",
> +                               ret, i);
> +                       goto err;
> +               }
> +       }
> +
> +       return 0;
> +
> +err:
> +       while (--i >= 0)
> +               clk_disable_unprepare(ddp->clk[i]);
> +       return ret;
>  }
>
>  void mtk_disp_mutex_unprepare(struct mtk_disp_mutex *mutex)
>  {
>         struct mtk_ddp *ddp = container_of(mutex, struct mtk_ddp,
>                                            mutex[mutex->id]);
> -       clk_disable_unprepare(ddp->clk);
> +       int i;
> +
> +        for (i = 0; i < ARRAY_SIZE(ddp->clk); i++) {
> +               if (IS_ERR(ddp->clk[i]))
> +                       continue;
> +               clk_disable_unprepare(ddp->clk[i]);
> +       }
>  }
>
>  void mtk_disp_mutex_add_comp(struct mtk_disp_mutex *mutex,
> @@ -415,11 +440,19 @@ static int mtk_ddp_probe(struct platform_device *pdev)
>         ddp->data = of_device_get_match_data(dev);
>
>         if (!ddp->data->no_clk) {
> -               ddp->clk = devm_clk_get(dev, NULL);
> -               if (IS_ERR(ddp->clk)) {
> -                       if (PTR_ERR(ddp->clk) != -EPROBE_DEFER)
> -                               dev_err(dev, "Failed to get clock\n");
> -                       return PTR_ERR(ddp->clk);
> +               int ret;
> +
> +               for (i = 0; i < ARRAY_SIZE(ddp->clk); i++) {
> +                       ddp->clk[i] = of_clk_get(dev->of_node, i);
> +
> +                       if (IS_ERR(ddp->clk[i])) {
> +                               ret = PTR_ERR(ddp->clk[i]);
> +                               if (ret != EPROBE_DEFER)
> +                                       dev_err(dev, "Failed to get clock %d\n",
> +                                               ret);
> +
> +                               return ret;
> +                       }

Use of_clk_bulk_get_all instead?

ddp->num_clks = of_clk_bulk_get_all(dev->of_node, &ddp->clks);
...

Then the calls above can be clk_bulk_enable/clk_bulk_disable using
num_clks and clks.


>                 }
>         }
>
> --
> 1.8.1.1.dirty
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
