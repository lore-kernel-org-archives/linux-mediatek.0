Return-Path: <SRS0=+Wu7=6T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F453C47247
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 21:47:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CCF620746
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 21:47:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AJpbJvNQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ChcfEYXU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CCF620746
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wSbHQs+5EXMLMfxtOK+xh++Shf7yk7zfv5pOrk7d2fI=; b=AJpbJvNQdia01A
	/AODVXZ9XCJ0AkBCg0zZo0cKD2zLy73QmpLWCZ8HVWIE4kixYkWCU8E8BxGy1mptooGNIyOvUKwZv
	Q7pRoXYGbb7lqURbCpK/ibzgT4wfLdSdCbcP2/3GQqQ8zhBWE/rqeFEAOmOFUUuWZldv7x1qWz+aK
	Ko8ZCuwiekoYY6fYurejOW6kOIaSWaHa6799mC+PZ+lfgsbPJy5U1kO85trBu2lT/H09Y20EdZ8rW
	dD889TmOY7WF+IKlFwXF/msokXM7QbjurD63FIu2Du/v6KQM7NChunCV/gNsW4D39pwftS1oLCzGw
	/WCDMuSxo8SSZ1xPRPtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jW5Oy-0001rc-Sg; Tue, 05 May 2020 21:46:56 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jW5OC-00013a-1k; Tue, 05 May 2020 21:46:11 +0000
Received: by mail-qk1-x742.google.com with SMTP id t3so463548qkg.1;
 Tue, 05 May 2020 14:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yY5CDBYB4eHRZ9ErTc6b0SkaS/OJJ2b1ZKbdsNo0pT4=;
 b=ChcfEYXUe9roSVSWajlOhpmztl7YKm60X1+gY7oEZg0f7sORT7pae3eHx9w8dkA1/8
 E+qENU19aKpaOaDhNYIDGXXj5MVA7itKVVAQqsuqbp2Zn+5+yaXwq0mthtTx/BwV8pjX
 urCv232AUz09ISOJzNnxd1BBSvnH+9LEcuktuDuB8MSFK/QpFYRjDgvk8ILh/KWTGHti
 kOYI0vgI+mEZddO90ansfJ8PPAqfpnLKdwNwOyXNEbm5my4/ObKUAJA4C8HAxypaPnC0
 4LdhclAJ2+9c0ir0d4YTHGqvkgH8dDv4dATu12+L+mPnlbCQZJ2FzarVND2acznW6k2t
 pNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yY5CDBYB4eHRZ9ErTc6b0SkaS/OJJ2b1ZKbdsNo0pT4=;
 b=jkMZJ3aVE0j9suhB0cylSJXwdAjcYOZNdpI9pESSh1Z7WsTxIgpEgExhm0vgAd6rrO
 guyO6te9o5c3+eKLTxNu7IOBUCsxmzbvixM/FnPKKuWml67Rtp3J4iv3hMFXXuBv9TX1
 p871phqTEK9dpTg9N6bg2gqB+rUhRTAn6/Zc8y83+HZmEnjRRFC+p+8LkbNokCZl0Fey
 +aWK7nZg6DmGMa+rdM1cVHGdHakQE4EfHxrEM/QLZ5P+DK5EOFnEDQyaJ/Le7+A5zKAv
 BpIEpe5kBbX82FVPT3NY3ZL3flCKDWMnbdb17pvWzQvRvJeb0CgOtI36QoEsLg/tTX3D
 dBxQ==
X-Gm-Message-State: AGi0PuZrpdUg4acdSuH/+BQq6xongchicDlTigUHAJ/0Ld0huKkOWMjv
 xXn4RAkoWlbYg6Vzp7LxqdxgSBNNr/QlzPWh4R8=
X-Google-Smtp-Source: APiQypLp62p8qck0yZBTWbwsB0xYvmFH9XnCtp6KS+iL/UnhU941uE0+Ky6q/g+57tAZFefpKbpzcn5QzR0MiZegMu4=
X-Received: by 2002:a37:6c81:: with SMTP id h123mr5559600qkc.290.1588715166575; 
 Tue, 05 May 2020 14:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200505040048.132493-1-eizan@google.com>
 <20200505125042.v1.4.I7bbf54189e21badc5cc251dae85f2993b7c4ab69@changeid>
In-Reply-To: <20200505125042.v1.4.I7bbf54189e21badc5cc251dae85f2993b7c4ab69@changeid>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Tue, 5 May 2020 23:45:55 +0200
Message-ID: <CAFqH_51+M4npv+aKag-CKimf+B8CUnjVxj59Xb6C03fRKmO+Zg@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] [media] mtk-mdp: convert mtk_mdp_dev.comp array to
 list
To: Eizan Miyamoto <eizan@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_144608_151545_7C29F8E7 
X-CRM114-Status: GOOD (  20.61  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 LKML <linux-kernel@vger.kernel.org>, Houlong Wei <houlong.wei@mediatek.com>,
 Eizan Miyamoto <eizan@google.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Eizan,

Thank you for your patch.

Missatge de Eizan Miyamoto <eizan@chromium.org> del dia dt., 5 de maig
2020 a les 6:02:
>
> The functions mtk_mdp_register/unregister_component have been created to
> add / remove items from the list of components.
>
> This will eventually enable us to specify a list of components in the
> device tree instead of hardcoding them into this driver.
>
> The list is modified by a single thread at driver probe time, and will
> not be traversed by another thread until the call to pm_runtime_enable
> at the end of probing.
>
> Signed-off-by: eizan@chromium.org
> Signed-off-by: Eizan Miyamoto <eizan@google.com>

Ditto. Other than that.

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>


> ---
>
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c |  1 +
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 +
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 46 +++++++++++++------
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.h | 10 +++-
>  4 files changed, 43 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> index facc6104b91f..d4afed1363d5 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -103,6 +103,7 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
>                 return -EINVAL;
>         }
>
> +       INIT_LIST_HEAD(&comp->node);
>         comp->dev_node = of_node_get(node);
>         comp->id = comp_id;
>         comp->type = mtk_mdp_matches[comp_id].type;
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> index 3b83bd6e0d8b..1f745891c6c3 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> @@ -36,6 +36,7 @@ enum mtk_mdp_comp_id {
>
>  /**
>   * struct mtk_mdp_comp - the MDP's function component data
> + * @node:      list node to track sibing MDP components
>   * @dev_node:  component device node
>   * @clk:       clocks required for component
>   * @larb_dev:  SMI device required for component
> @@ -43,6 +44,7 @@ enum mtk_mdp_comp_id {
>   * @id:                component ID
>   */
>  struct mtk_mdp_comp {
> +       struct list_head        node;
>         struct device_node      *dev_node;
>         struct clk              *clk[2];
>         struct device           *larb_dev;
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index f974242663dc..e6e702d9cb69 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -55,19 +55,19 @@ MODULE_DEVICE_TABLE(of, mtk_mdp_of_ids);
>  static void mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
>  {
>         struct device *dev = &mdp->pdev->dev;
> -       int i;
> +       struct mtk_mdp_comp *comp_node;
>
> -       for (i = 0; i < ARRAY_SIZE(mdp->comp); i++)
> -               mtk_mdp_comp_clock_on(dev, mdp->comp[i]);
> +       list_for_each_entry(comp_node, &mdp->comp_list, node)
> +               mtk_mdp_comp_clock_on(dev, comp_node);
>  }
>
>  static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
>  {
>         struct device *dev = &mdp->pdev->dev;
> -       int i;
> +       struct mtk_mdp_comp *comp_node;
>
> -       for (i = 0; i < ARRAY_SIZE(mdp->comp); i++)
> -               mtk_mdp_comp_clock_off(dev, mdp->comp[i]);
> +       list_for_each_entry(comp_node, &mdp->comp_list, node)
> +               mtk_mdp_comp_clock_off(dev, comp_node);
>  }
>
>  static void mtk_mdp_wdt_worker(struct work_struct *work)
> @@ -91,12 +91,25 @@ static void mtk_mdp_reset_handler(void *priv)
>         queue_work(mdp->wdt_wq, &mdp->wdt_work);
>  }
>
> +void mtk_mdp_register_component(struct mtk_mdp_dev *mdp,
> +                               struct mtk_mdp_comp *comp)
> +{
> +       list_add(&mdp->comp_list, &comp->node);
> +}
> +
> +void mtk_mdp_unregister_component(struct mtk_mdp_dev *mdp,
> +                                 struct mtk_mdp_comp *comp)
> +{
> +       list_del(&comp->node);
> +}
> +
>  static int mtk_mdp_probe(struct platform_device *pdev)
>  {
>         struct mtk_mdp_dev *mdp;
>         struct device *dev = &pdev->dev;
>         struct device_node *node, *parent;
> -       int i, ret = 0;
> +       struct mtk_mdp_comp *comp, *comp_temp;
> +       int ret = 0;
>
>         mdp = devm_kzalloc(dev, sizeof(*mdp), GFP_KERNEL);
>         if (!mdp)
> @@ -104,6 +117,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>
>         mdp->id = pdev->id;
>         mdp->pdev = pdev;
> +       INIT_LIST_HEAD(&mdp->comp_list);
>         INIT_LIST_HEAD(&mdp->ctx_list);
>
>         mutex_init(&mdp->lock);
> @@ -124,7 +138,6 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>                 const struct of_device_id *of_id;
>                 enum mtk_mdp_comp_type comp_type;
>                 int comp_id;
> -               struct mtk_mdp_comp *comp;
>
>                 of_id = of_match_node(mtk_mdp_comp_dt_ids, node);
>                 if (!of_id)
> @@ -150,13 +163,14 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>                         of_node_put(node);
>                         goto err_comp;
>                 }
> -               mdp->comp[comp_id] = comp;
>
>                 ret = mtk_mdp_comp_init(dev, node, comp, comp_id);
>                 if (ret) {
>                         of_node_put(node);
>                         goto err_comp;
>                 }
> +
> +               mtk_mdp_register_component(mdp, comp);
>         }
>
>         mdp->job_wq = create_singlethread_workqueue(MTK_MDP_MODULE_NAME);
> @@ -224,8 +238,10 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>  err_alloc_job_wq:
>
>  err_comp:
> -       for (i = 0; i < ARRAY_SIZE(mdp->comp); i++)
> -               mtk_mdp_comp_deinit(dev, mdp->comp[i]);
> +       list_for_each_entry_safe(comp, comp_temp, &mdp->comp_list, node) {
> +               mtk_mdp_unregister_component(mdp, comp);
> +               mtk_mdp_comp_deinit(dev, comp);
> +       }
>
>         dev_dbg(dev, "err %d\n", ret);
>         return ret;
> @@ -234,7 +250,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>  static int mtk_mdp_remove(struct platform_device *pdev)
>  {
>         struct mtk_mdp_dev *mdp = platform_get_drvdata(pdev);
> -       int i;
> +       struct mtk_mdp_comp *comp, *comp_temp;
>
>         pm_runtime_disable(&pdev->dev);
>         vb2_dma_contig_clear_max_seg_size(&pdev->dev);
> @@ -247,8 +263,10 @@ static int mtk_mdp_remove(struct platform_device *pdev)
>         flush_workqueue(mdp->job_wq);
>         destroy_workqueue(mdp->job_wq);
>
> -       for (i = 0; i < ARRAY_SIZE(mdp->comp); i++)
> -               mtk_mdp_comp_deinit(&pdev->dev, mdp->comp[i]);
> +       list_for_each_entry_safe(comp, comp_temp, &mdp->comp_list, node) {
> +               mtk_mdp_unregister_component(mdp, comp);
> +               mtk_mdp_comp_deinit(&pdev->dev, comp);
> +       }
>
>         dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
>         return 0;
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h b/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> index dd130cc218c9..a7da14b97077 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> @@ -136,7 +136,7 @@ struct mtk_mdp_variant {
>   * @pdev:      pointer to the image processor platform device
>   * @variant:   the IP variant information
>   * @id:                image processor device index (0..MTK_MDP_MAX_DEVS)
> - * @comp:      MDP function components
> + * @comp_list: list of MDP function components
>   * @m2m_dev:   v4l2 memory-to-memory device data
>   * @ctx_list:  list of struct mtk_mdp_ctx
>   * @vdev:      video device for image processor driver
> @@ -154,7 +154,7 @@ struct mtk_mdp_dev {
>         struct platform_device          *pdev;
>         struct mtk_mdp_variant          *variant;
>         u16                             id;
> -       struct mtk_mdp_comp             *comp[MTK_MDP_COMP_ID_MAX];
> +       struct list_head                comp_list;
>         struct v4l2_m2m_dev             *m2m_dev;
>         struct list_head                ctx_list;
>         struct video_device             *vdev;
> @@ -221,6 +221,12 @@ struct mtk_mdp_ctx {
>
>  extern int mtk_mdp_dbg_level;
>
> +void mtk_mdp_register_component(struct mtk_mdp_dev *mdp,
> +                               struct mtk_mdp_comp *comp);
> +
> +void mtk_mdp_unregister_component(struct mtk_mdp_dev *mdp,
> +                                 struct mtk_mdp_comp *comp);
> +
>  #if defined(DEBUG)
>
>  #define mtk_mdp_dbg(level, fmt, args...)                                \
> --
> 2.26.2.526.g744177e7f7-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
