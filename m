Return-Path: <SRS0=4tSC=Y7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A519C5DF60
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Nov 2019 03:58:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5954820869
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Nov 2019 03:58:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iiG94VSt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nkEHapD/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5954820869
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=149x1cp935+2klQZzsZS6JAG13icJnUEgcC6AcCO3YA=; b=iiG94VStfwVm4gUeR47W15Sm1
	IVY3dyzwG3N8ndOmglkXIrID5P9DYcAC8Eot+qJUaPiTwdfOWIS+VvbkGBAqHkZ6mf4G8i4ALDCU/
	w2DkEUCtqoPu+OTbJNhFPas3f2WPUQ5NGf1WDwPg+vdS2PLZHMUNHtWYOMG82OVKLzTVL9IbRkvgW
	cCL2g596VFZ8iHXc+U94hIEEg1VQfc+9rooVlt5guIURG29vMBvjUb2FKDKfRPr755F2UKxsyRhIg
	vXzB1e7vvQVpeDGyGeuh/b8gh3P7/V75b8L2GWlgs7bCHrtdD83+yC3gAe/67GRmXHYdbkX4kymXh
	R6WcJ958w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSYwM-0008Qu-Oe; Thu, 07 Nov 2019 03:58:34 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSYwE-0008JA-Pg
 for linux-mediatek@lists.infradead.org; Thu, 07 Nov 2019 03:58:28 +0000
Received: by mail-pl1-x641.google.com with SMTP id d29so495689plj.8
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Nov 2019 19:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9GmxJGdDL35hIWtTVdTygW9Ztn4rOAQPxM5+Tu63S6Q=;
 b=nkEHapD/g+Sgly2+Nt3aVAcHLo7ZieZHz02HhFipDyBmEJ17TuJOPvaBpKVLt8hmZ4
 WaXcKQDM0QAn0L/5ATm0doZ65pxruMJuaROP4D3TWTEiRejEYUrKKN+YNHnMdVqyYLn9
 V9g3Vt+QEB/bERM7/kf5BRWm8WlWO+UwULvxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9GmxJGdDL35hIWtTVdTygW9Ztn4rOAQPxM5+Tu63S6Q=;
 b=WrvPkCDhrwJkismddnzElVQUCKFgWn9saEzhmYeszsPH6ftdc+WeU9IOOnoDd4u8wZ
 MkFDanOkJkHd31f0d/YiscFuBlrsLQCIXvXKGywky//Li1kf2+DHwupGK10IrI5Nu/iz
 /rne95PLxn5S4mNkm0dRpcExdS0+gc+3zoJaTl4fuqMwAt8osiTyPyoT01f7cTwwyXa/
 SK1CmFBfIorsKww2ULhQsgUilJcnUABSCgP5HjBE7xqiP/MPJ7hLLjYjiIiQudGN7zWQ
 f91yj9xxLM97LBsfYkydxmmrX/XxtUzGpY++dVZ4j86y7bTenniROpGeZGgxUa1O091x
 eczg==
X-Gm-Message-State: APjAAAUXTZ+N7IClW6AJgOKHgsoaAtinlzBMFEoNYY0aWUy5jd0kD5eY
 +oYeq9K7ynot8ctDrbGX3BSoBw==
X-Google-Smtp-Source: APXvYqy/J5ZM4ai8ToCaJwrShEkVZmE2/puOUgublwvWGb1Tk2GhISYMwfGTAFZM0gyzkCjxsMgzwQ==
X-Received: by 2002:a17:902:6acb:: with SMTP id
 i11mr1428339plt.214.1573099102708; 
 Wed, 06 Nov 2019 19:58:22 -0800 (PST)
Received: from pihsun-z840.tpe.corp.google.com
 ([2401:fa00:1:10:7889:7a43:f899:134c])
 by smtp.gmail.com with ESMTPSA id r8sm592525pgr.59.2019.11.06.19.58.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2019 19:58:22 -0800 (PST)
Subject: Re: [RFC, v3, 4/4] media: platform: mtk-mdp3: Add Mediatek MDP3 driver
To: Bibby Hsieh <bibby.hsieh@mediatek.com>, hans.verkuil@cisco.com,
 laurent.pinchart+renesas@ideasonboard.com, tfiga@chromium.org,
 matthias.bgg@gmail.com, mchehab@kernel.org
References: <20190911094013.5892-1-bibby.hsieh@mediatek.com>
From: Pi-Hsun Shih <pihsun@chromium.org>
Message-ID: <d5e5a1e2-3422-8ef6-f58a-981fc5bc2449@chromium.org>
Date: Thu, 7 Nov 2019 11:58:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190911094013.5892-1-bibby.hsieh@mediatek.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_195826_856561_03D56BF9 
X-CRM114-Status: GOOD (  14.53  )
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
Cc: devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, Rynn.Wu@mediatek.com,
 srv_heupstream@mediatek.com, Daoyuan.Huang@mediatek.com,
 holmes.chiou@mediatek.com, Jerry-ch.Chen@mediatek.com, jungo.lin@mediatek.com,
 sj.huang@mediatek.com, yuzhao@chromium.org, linux-mediatek@lists.infradead.org,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, zwisler@chromium.org,
 christie.yu@mediatek.com, frederic.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On 9/11/19 5:40 PM, Bibby Hsieh wrote:
> From: daoyuan huang <daoyuan.huang@mediatek.com>
> 
> This patch adds driver for Media Data Path 3 (MDP3).
> Each modules' related operation control is sited in mtk-mdp3-comp.c
> Each modules' register table is defined in file with "mdp_reg_"
> and "mmsys_" prefix
> GCE related API, operation control  sited in mtk-mdp3-cmdq.c
> V4L2 m2m device functions are implemented in mtk-mdp3-m2m.c
> Probe, power, suspend/resume, system level functions are defined in
> mtk-mdp3-core.c
> 
> Signed-off-by: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
> ---
> ...
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
> new file mode 100644
> ... > +static int mdp_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mdp_dev *mdp;
> +	phandle rproc_phandle;
> +	int ret;
> +
> +	mdp = devm_kzalloc(dev, sizeof(*mdp), GFP_KERNEL);
> +	if (!mdp)
> +		return -ENOMEM;
> +
> +	mdp->pdev = pdev;
> +	ret = mdp_component_init(mdp);
> +	if (ret) {
> +		dev_err(dev, "Failed to initialize mdp components\n");
> +		goto err_return;
> +	}
> +
> +	mdp->job_wq = alloc_workqueue(MDP_MODULE_NAME, WQ_FREEZABLE, 0);
> +	if (!mdp->job_wq) {
> +		dev_err(dev, "Unable to create job workqueue\n");
> +		ret = -ENOMEM;
> +		goto err_destroy_job_wq;
> +	}
> +
> +	mdp->clock_wq = alloc_workqueue(MDP_MODULE_NAME "-clock", WQ_FREEZABLE,
> +					0);
> +	if (!mdp->clock_wq) {
> +		dev_err(dev, "Unable to create clock workqueue\n");
> +		ret = -ENOMEM;
> +		goto err_destroy_clock_wq;
> +	}
> +
> +	mdp->vpu_dev = scp_get_pdev(pdev);
> +
> +	ret = of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
> +				   &rproc_phandle);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Could not get scp device\n");
> +		goto err_destroy_clock_wq;
> +	}
> +
> +	mdp->rproc_handle = rproc_get_by_phandle(rproc_phandle);
> +
> +	dev_info(&pdev->dev, "MDP rproc_handle: %llx",
> +		 (unsigned long long)mdp->rproc_handle);
> +
> +	if (!mdp->rproc_handle) {
> +		dev_err(&pdev->dev, "Could not get MDP's rproc_handle\n");

"ret" is not set in this error path, ret = -ENODEV?

> +		goto err_destroy_clock_wq;
> +	}
> +
> +	mutex_init(&mdp->vpu_lock);
> +	mutex_init(&mdp->m2m_lock);
> +
> +	mdp->cmdq_clt = cmdq_mbox_create(dev, 0, 1200);
> +	if (IS_ERR(mdp->cmdq_clt))

Same here, ret = PTR_ERR(mdp->cmdq_clt)?

> +		goto err_destroy_clock_wq;
> +
> +	init_waitqueue_head(&mdp->callback_wq);
> +	ida_init(&mdp->mdp_ida);
> +	platform_set_drvdata(pdev, mdp);
> +
> +	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> +	pm_runtime_enable(dev);
> +
> +	ret = v4l2_device_register(dev, &mdp->v4l2_dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to register v4l2 device\n");
> +		ret = -EINVAL;
> +		goto err_mbox_destroy;
> +	}
> +
> +	ret = mdp_m2m_device_register(mdp);
> +	if (ret) {
> +		v4l2_err(&mdp->v4l2_dev, "Failed to register m2m device\n");
> +		goto err_unregister_device;
> +	}
> +
> +	dev_dbg(dev, "mdp-%d registered successfully\n", pdev->id);
> +	return 0;
> +
> +err_unregister_device:
> +	v4l2_device_unregister(&mdp->v4l2_dev);
> +err_mbox_destroy:
> +	cmdq_mbox_destroy(mdp->cmdq_clt);
> +err_destroy_clock_wq:
> +	destroy_workqueue(mdp->clock_wq);
> +err_destroy_job_wq:
> +	destroy_workqueue(mdp->job_wq);
> +err_return:
> +	dev_dbg(dev, "Errno %d\n", ret);
> +	return ret;
> +}
> ...
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
