Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1744C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 10:14:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76225610CB
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 10:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76225610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:Subject:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CM23f1h0okqX27Gymhypw4CPCn8Y/SZFN98eOFGDNao=; b=nTdrVxFehjfW5+9Iaqmghb/FJP
	J39HbGZkdGIV9B0fTqn7RWShMxVmiH39FKi6d2F9/5tyNLjTpno0k1ZHwfZK4zySo1arErWKOBWbn
	Q1kFFkz3AVSxxsmDuIYbSdnvofwRVkFBJStbj9VxzT+Mf7zMNP7swFnzaGcjP9HkEztolWnduGgis
	ssVYYqJBYilC2RboEhEZGj9RtkSrOmBBwDon47W0w3RMWOxgTSHQcSAIFxZ2VtqsRxcP/ZV5um7mm
	WXK8vt1M7JVbZvPzVpEyC/E7NTGPxeYHg50i1LarebZYpNaetdR91ra1LxisAU290j56936oQ9aCH
	u5rRkZag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2swt-006tU6-9G; Mon, 12 Jul 2021 10:14:03 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2svO-006sn1-Ml; Mon, 12 Jul 2021 10:12:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 7F7771F4210C
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v5 3/8] media: mtk-mdp: don't pm_run_time_get/put for
 master comp in clock_on
To: Eizan Miyamoto <eizan@chromium.org>, linux-kernel@vger.kernel.org
Cc: wenst@chromium.org, chunkuang.hu@kernel.org, yong.wu@mediatek.com,
 houlong.wei@mediatek.com, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20210709022324.1607884-1-eizan@chromium.org>
 <20210709122040.v5.3.Ifd87681955689a08cce4c65e72ee5e8c6d09af95@changeid>
Message-ID: <9ee56e91-88c1-c24d-c797-34d7defaef2e@collabora.com>
Date: Mon, 12 Jul 2021 12:12:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709122040.v5.3.Ifd87681955689a08cce4c65e72ee5e8c6d09af95@changeid>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_031231_071028_27A9A393 
X-CRM114-Status: GOOD (  39.52  )
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

Hi Eizan,

Thank you for your patch.

On 9/7/21 4:23, Eizan Miyamoto wrote:
> The original intent of commit 86698b9505bbc ("media: mtk-mdp: convert
> mtk_mdp_dev.comp array to list") was to create a list to track all the
> MDP components that needed to have their clocks enabled/disabled when
> calling mtk_mdp_comp_clock_on/off. However, there was a bug inside
> mtk_mdp_register_component where the args to a call to list_add were
> swapped. The result is that only one component was added to
> mtk_mdp_dev.comp_list because comp_list was instead being
> repeatedly added to the single element lists headed by each
> mtk_mdp_comp.
> 
> The order of the args to list_add in mtk_mdp_register_component was
> fixed in https://patchwork.kernel.org/patch/11742895/ (Fix Null pointer
> dereference when calling list_add).
> 
> Then, as a result of https://patchwork.kernel.org/patch/11530769/
> (mtk-mdp: use pm_runtime in MDP component driver) if all the components
> are added to the component list, the mdp "master" / rdma0 component
> ends up having pm_runtime_get_sync() called on it twice recursively:
> 
>     rpm_resume+0x694/0x8f8
>     __pm_runtime_resume+0x7c/0xa0 ***NOTE***
>     mtk_mdp_comp_clock_on+0x48/0x104 [mtk_mdp]
>     mtk_mdp_pm_resume+0x2c/0x44 [mtk_mdp]
>     pm_generic_runtime_resume+0x34/0x48
>     __genpd_runtime_resume+0x6c/0x80
>     genpd_runtime_resume+0x104/0x1ac
>     __rpm_callback+0x120/0x238
>     rpm_callback+0x34/0x8c
>     rpm_resume+0x7a0/0x8f8
>     __pm_runtime_resume+0x7c/0xa0 ***NOTE***
>     mtk_mdp_m2m_start_streaming+0x2c/0x3c [mtk_mdp]
> 
> (The calls to pm_runtime_get_sync are inlined and correspond to the
> calls to __pm_runtime_resume). It is not correct to have
> pm_runtime_get_sync called recursively and the second call will block
> indefinitely.
> 
> As a result of all that, this change factors mtk_mdp_comp_clock_on/off
> into mtk_mdp_comp_power_on/off and moves the calls to
> pm_runtime_get/put into the power_on/off functions.
> 
> This change then special-cases the master/rdma0 MDP component and does
> these things:
> - the master/rdma0 component is not added to mtk_mdp_dev.comp_list
> - the master/rdma0 component has its clocks (*but not power*) toggled
>   by mtk_mpd_comp_clock_on/off inside mtk_mdp_clock_on/off.
> - the other components have their clocks *and* power toggled with
>   mtk_mdp_comp_power_on/off.
> 
> This change introduces the assumption that mtk_mdp_pm_resume will
> always be called though a callback from pm_runtime_get_sync made on the
> master / rdma0 component.
> 
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 28 ++++++++++++++-----
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  3 ++
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 23 ++++++++++-----
>  3 files changed, 40 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> index 8b6158379f41..ce54863c24ce 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -53,9 +53,9 @@ static const struct of_device_id mtk_mdp_comp_driver_dt_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, mtk_mdp_comp_driver_dt_match);
>  
> -void mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
> +void mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp)
>  {
> -	int i, err;
> +	int err;
>  
>  	if (comp->larb_dev) {
>  		err = mtk_smi_larb_get(comp->larb_dev);
> @@ -66,9 +66,25 @@ void mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
>  
>  	err = pm_runtime_get_sync(comp->dev);
>  	if (err < 0)
> -		dev_err(comp->dev,
> -			"failed to runtime get, err %d.\n",
> -			err);
> +		dev_err(comp->dev, "failed to runtime get, err %d.\n", err);

You can do that change in the previous patch which is the one that introduces
this dev_err call.

> +
> +	mtk_mdp_comp_clock_on(comp);
> +}
> +
> +void mtk_mdp_comp_power_off(struct mtk_mdp_comp *comp)
> +{
> +	int err;
> +
> +	mtk_mdp_comp_clock_off(comp);
> +
> +	err = pm_runtime_put_sync(comp->dev);
> +	if (err < 0)
> +		dev_err(comp->dev, "failed to runtime put, err %d.\n", err);
> +}
> +
> +void mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
> +{
> +	int i, err;
>  
>  	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
>  		if (IS_ERR(comp->clk[i]))
> @@ -91,8 +107,6 @@ void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
>  
>  	if (comp->larb_dev)
>  		mtk_smi_larb_put(comp->larb_dev);
> -
> -	pm_runtime_put_sync(comp->dev);

Ok, now that you are changing these functions I think it will be good to rework
these clock_on and off properly. First returning an error when is needed and
handling it properly on the error path instead of ignoring.

>  }
>  
>  static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> index 5e2ee94a1b37..15ef9539a5a7 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> @@ -23,6 +23,9 @@ struct mtk_mdp_comp {
>  
>  int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev);
>  
> +void mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp);
> +void mtk_mdp_comp_power_off(struct mtk_mdp_comp *comp);
> +
>  void mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp);
>  void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp);
>  
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index 78c40a61df1d..3558a6587f51 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -54,8 +54,15 @@ static void mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
>  {
>  	struct mtk_mdp_comp *comp_node;
>  
> +	/*
> +	 * The master / rdma0 component will have pm_runtime_get_sync called
> +	 * on it through mtk_mdp_m2m_start_streaming, making it unnecessary to
> +	 * have mtk_mdp_comp_power_on called on it.
> +	 */
> +	mtk_mdp_comp_clock_on(&mdp->comp_self);
> +
>  	list_for_each_entry(comp_node, &mdp->comp_list, node)
> -		mtk_mdp_comp_clock_on(comp_node);
> +		mtk_mdp_comp_power_on(comp_node);
>  }
>  
>  static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
> @@ -63,7 +70,14 @@ static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
>  	struct mtk_mdp_comp *comp_node;
>  
>  	list_for_each_entry(comp_node, &mdp->comp_list, node)
> -		mtk_mdp_comp_clock_off(comp_node);
> +		mtk_mdp_comp_power_off(comp_node);
> +
> +	/*
> +	 * The master / rdma0 component will have pm_runtime_put called
> +	 * on it through mtk_mdp_m2m_stop_streaming, making it unnecessary to
> +	 * have mtk_mdp_comp_power_off called on it.
> +	 */
> +	mtk_mdp_comp_clock_off(&mdp->comp_self);
>  }
>  
>  static void mtk_mdp_wdt_worker(struct work_struct *work)
> @@ -102,8 +116,6 @@ static int mtk_mdp_master_bind(struct device *dev)
>  	int status;
>  	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
>  
> -	mtk_mdp_register_component(mdp, &mdp->comp_self);
> -
>  	status = component_bind_all(dev, mdp);
>  	if (status) {
>  		dev_err(dev, "Failed to bind all components: %d\n", status);
> @@ -125,8 +137,6 @@ static int mtk_mdp_master_bind(struct device *dev)
>  	component_unbind_all(dev, mdp);
>  
>  err_component_bind_all:
> -	mtk_mdp_unregister_component(mdp, &mdp->comp_self);
> -
>  	return status;
>  }
>  
> @@ -137,7 +147,6 @@ static void mtk_mdp_master_unbind(struct device *dev)
>  	pm_runtime_disable(dev);
>  	mtk_mdp_unregister_m2m_device(mdp);
>  	component_unbind_all(dev, mdp);
> -	mtk_mdp_unregister_component(mdp, &mdp->comp_self);
>  }
>  
>  static const struct component_master_ops mtk_mdp_com_ops = {
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
