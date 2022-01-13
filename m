Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAC8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 18:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yO04rDzMQRIuzUUecubsfbqq1YllOCBb1AqKJE5lNEc=; b=fbSD/L+4lmHcdetXrqiqQ5UnLp
	isQfbnq/A3XnBGG+Ip5yyaGo+LCN/63ocFNxqax5ruAVKAb9L6/3tXhdtoUHGMx5Rw0qsV/DAXGBH
	uiPRw9KNugGpS11EqcGqw2nDKPtgZk8dOmWgO6LHlUIjVE+7sQqdvw6zkCzfmh/hSTq3XBY1aRGb0
	OYeaYQq/X9CTR1RTqhjx48OeJqDu+TPbF57pGdl4j9UoIrl3qgrHspQAM8Bjhs0KIMFfQX/g4h5bM
	NxTiXyzYFrDXneF4mZirWPGd8nctPHRxAGxKwKpLB6UKlIMVAV0IGtCUjX6Cl5Qlk2nRZes3N0IW6
	6au0jI2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n858C-006tlt-9Y; Thu, 13 Jan 2022 18:47:28 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8589-006tjj-EA; Thu, 13 Jan 2022 18:47:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642099645; x=1673635645;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=szWIdMEQGwG7a5XPFaaKP+mai32KTKLbDqKzV+LlJXU=;
 b=YyVt7eR05OAgNoPVRMD7EKRluRAB2X6Gy4kgGGIqmNfogwH92F465B0A
 ustKnmSpyjl8JF2CbFmYEmAUC1lvM7c/OHbMBIhruEYqky2/r/EjKnCe4
 V/3FcGn2zd4+ORAYzHMhUqN7HYOQt9dGmtV5WDYCOhmidLelUVmSesY88
 hySg14xk9fVVAdBfjm3l6yb5GVE7u9DEtaD/CoPqsxRBRv7hFx5bUAQl5
 r6lkJh8eEj7vrG6wUW42PPhEDFswqJaAVbGDlo+mkzQohlVoRH0ftwrUY
 n0L+vPFzDlubdbo4o8k7ks2wA0YVK9Y4+qo0FhKWZG9tD6scD53LDkQMe A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="307432811"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="307432811"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 10:47:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="620702034"
Received: from ypchen-mobl.amr.corp.intel.com (HELO [10.212.66.70])
 ([10.212.66.70])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 10:47:20 -0800
Subject: Re: [PATCH v13 2/2] mailbox: mediatek: add support for adsp mailbox
 controller
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, tzungbi@google.com,
 cujomalainey@google.com, Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sound-open-firmware@alsa-project.org
References: <20220113082103.27911-1-allen-kh.cheng@mediatek.com>
 <20220113082103.27911-3-allen-kh.cheng@mediatek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c876eda8-1fde-6c40-117a-12dde042780d@linux.intel.com>
Date: Thu, 13 Jan 2022 12:47:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220113082103.27911-3-allen-kh.cheng@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_104725_572908_0BA609BF 
X-CRM114-Status: GOOD (  12.40  )
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



> +static int mtk_adsp_mbox_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_adsp_mbox_priv *priv;
> +	const struct mtk_adsp_mbox_cfg *cfg;
> +	struct mbox_controller *mbox;
> +	int ret, irq;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	mbox = &priv->mbox;
> +	mbox->dev = dev;
> +	mbox->ops = &mtk_adsp_mbox_chan_ops;
> +	mbox->txdone_irq = false;
> +	mbox->txdone_poll = true;
> +	mbox->of_xlate = mtk_adsp_mbox_xlate;
> +	mbox->num_chans = 1;
> +	mbox->chans = devm_kzalloc(dev, sizeof(*mbox->chans), GFP_KERNEL);
> +	if (!mbox->chans)
> +		return -ENOMEM;
> +
> +	priv->va_mboxreg = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->va_mboxreg))
> +		return PTR_ERR(priv->va_mboxreg);
> +
> +	priv->cfg = of_device_get_match_data(dev);

question: is any error handling needed here? some drivers do, others
don't, but that function can return NULL.

> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = devm_request_threaded_irq(dev, irq, mtk_adsp_mbox_irq,
> +					mtk_adsp_mbox_isr, IRQF_TRIGGER_NONE,
> +					dev_name(dev), mbox->chans);
> +	if (ret < 0)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	return devm_mbox_controller_register(dev, &priv->mbox);
> +}


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
