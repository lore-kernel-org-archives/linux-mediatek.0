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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD33C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 10:16:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D36A261006
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 10:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D36A261006
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:Subject:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=i/086ChNKNIMp5b7zNhMflkISkcsP796cSCf75BLJMk=; b=MFYm3J4gISx+ga1lJT9DvnXOX9
	AxKomM76m1L6UhUB2oL6V4T/OxdJLgA0M+RQIClNzxEBTx/5PcpXEqeZ7I5nXMUdEsckTa0bx7hdn
	eiUa/Cf2hUKkFMRUdcVwUE879ppb4RA50/UBjnF5cgYW3lVwI6AVpGCGLsyKDGIjoCAg2IoLvwKA8
	dRxl2OLJtUk+NoD4hRJ8R3r7X1UAA2N5iMeAhUdRoEJX7JtHl5QeO0cIpklELUUsHYGryao/TwrSI
	QIkZnG6FtnCq4Ew6l5pwuAiwIO5juwjNsaQXr92Kf42FT2w5Y0FFlPlrgbxp0hQKu5aVYlJnjdIFv
	ctA0IcWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2szI-006upN-Ec; Mon, 12 Jul 2021 10:16:32 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2svw-006t1t-8v; Mon, 12 Jul 2021 10:13:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 71C1D1F4210C
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v5 7/8] media: mtk-mdp: use mdp-rdma0 alias to point to
 MDP master
To: Eizan Miyamoto <eizan@chromium.org>, linux-kernel@vger.kernel.org
Cc: wenst@chromium.org, chunkuang.hu@kernel.org, yong.wu@mediatek.com,
 houlong.wei@mediatek.com, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20210709022324.1607884-1-eizan@chromium.org>
 <20210709122040.v5.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
Message-ID: <36c6a9bc-8bf9-97e3-2791-3665cb237daa@collabora.com>
Date: Mon, 12 Jul 2021 12:12:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709122040.v5.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_031304_622424_72774EB7 
X-CRM114-Status: GOOD (  37.53  )
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
> ... Instead of depending on the presence of a mediatek,vpu property in
> the device node.
> 
> That property was originally added to link to the vpu node so that the
> mtk_mdp_core driver could pass the right device to
> vpu_wdt_reg_handler(). However in a previous patch in this series,
> the driver has been modified to search the device tree for that node
> instead.
> 
> That property was also used to indicate the primary MDP device, so that
> it can be passed to the V4L2 subsystem as well as register it to be
> used when setting up queues in the open() callback for the filesystem
> device node that is created. In this case, assuming that the primary
> MDP device is the one with a specific alias seems useable because the
> alternative is to add a property to the device tree which doesn't
> actually represent any facet of hardware (i.e., this being the primary
> MDP device is a software decision). In other words, this solution is
> equally as arbitrary, but at least it doesn't add a property to a
> device node where said property is unrelated to the hardware present.
> 
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 47 ++++++++++++++-----
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  6 +++
>  2 files changed, 42 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> index 87e3f72ff02b..de2d425efdd1 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -151,22 +151,48 @@ void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
>  		mtk_smi_larb_put(comp->larb_dev);
>  }
>  
> +/*
> + * The MDP master device node is identified by the device tree alias
> + * "mdp-rdma0".
> + */
> +static int is_mdp_master(struct device *dev)

bool ? (and return true/false)

> +{
> +	struct device_node *aliases, *mdp_rdma0_node;
> +	const char *mdp_rdma0_path;
> +
> +	if (!dev->of_node)
> +		return 0;
> +
> +	aliases = of_find_node_by_path("/aliases");
> +	if (!aliases) {
> +		dev_err(dev, "no aliases found for mdp-rdma0");
> +		return 0;
> +	}
> +
> +	mdp_rdma0_path = of_get_property(aliases, "mdp-rdma0", NULL);
> +	if (!mdp_rdma0_path) {
> +		dev_err(dev, "get mdp-rdma0 property of /aliases failed");
> +		return 0;
> +	}
> +
> +	mdp_rdma0_node = of_find_node_by_path(mdp_rdma0_path);
> +	if (!mdp_rdma0_node) {
> +		dev_err(dev, "path resolution failed for %s", mdp_rdma0_path);
> +		return 0;
> +	}
> +
> +	return dev->of_node == mdp_rdma0_node;
> +}
> +
>  static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
>  			void *data)
>  {
>  	struct mtk_mdp_comp *comp = dev_get_drvdata(dev);
>  	struct mtk_mdp_dev *mdp = data;
> -	struct device_node *vpu_node;
>  
>  	mtk_mdp_register_component(mdp, comp);
>  
> -	/*
> -	 * If this component has a "mediatek-vpu" property, it is responsible for
> -	 * notifying the mdp master driver about it so it can be further initialized
> -	 * later.
> -	 */
> -	vpu_node = of_parse_phandle(dev->of_node, "mediatek,vpu", 0);
> -	if (vpu_node) {
> +	if (is_mdp_master(dev)) {
>  		int ret;
>  
>  		ret = v4l2_device_register(dev, &mdp->v4l2_dev);
> @@ -182,9 +208,8 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
>  		}
>  
>  		/*
> -		 * presence of the "mediatek,vpu" property in a device node
> -		 * indicates that it is the primary MDP rdma device and MDP DMA
> -		 * ops should be handled by its DMA callbacks.
> +		 * MDP DMA ops will be handled by the DMA callbacks associated with this
> +		 * device;
>  		 */
>  		mdp->rdma_dev = dev;
>  	}
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index b45d588d2659..e1fb39231248 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -158,6 +158,12 @@ static int mtk_mdp_master_bind(struct device *dev)
>  		goto err_component_bind_all;
>  	}
>  
> +	if (mdp->rdma_dev == NULL) {
> +		dev_err(dev, "Primary MDP device not found");
> +		status = -ENODEV;
> +		goto err_component_bind_all;
> +	}
> +
>  	vpu_node = of_find_node_by_name(NULL, "vpu");
>  	if (!vpu_node) {
>  		dev_err(dev, "unable to find vpu node");
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
