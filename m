Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4878EC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Nov 2021 10:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sY+9E70jDgK5Eeedh6PoJjZVIc/1WLFEinSIy3ZaR8E=; b=AUmzwCNdybx0wD
	lP14Y/olIbsL6ItbFsPtKVnK7mhtI251yqxX8ARBXE6TY60XQz8j3PRm44VlYN5vPCPMfM5pqbIou
	8kwplTv42Bi1CeoCaeKRhxaD6oAfB727Koi1ZthC5tJcwtCz/JVWBSZI3ndFS7IG8yN5KeM3gDiyv
	0VB2xlTCqmCF8XQjkV2RgtesW64ElINplIXesXR7XfTRJ6xxCnYmg5A0UHPZS77eEZasUFjmarW6R
	SZrSq6M/3xLiWZq6g5bu6VyopBf83OOmhz4Mn4PsR3UpUIFDbv2awZGslL8l4oH8epZWE1TJpB+Z0
	HWIAKVI72oC+MdeJhpNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mppTJ-004TuK-Fe; Wed, 24 Nov 2021 10:25:49 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mppT5-004TrR-Vi
 for linux-mediatek@lists.infradead.org; Wed, 24 Nov 2021 10:25:37 +0000
Received: by mail-pl1-x62c.google.com with SMTP id b11so1442133pld.12
 for <linux-mediatek@lists.infradead.org>; Wed, 24 Nov 2021 02:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tHyc4vww6f6Wxw3/eQBdIL1Je73VlgA7JKdBmqCGaqQ=;
 b=VowkGQmdCxCl/a39pPTkWIbniAxWrdCHUsnAMenLISOVDapuFtot+ZCoAIEwY+DpO+
 NK/tnsSLBHrGigPWuscFnVh6tQZkOSgNYqvpsT2EZJt1Hx+iyTkg1YSBJeYFbRkfl36C
 uj+uL9HLk//ZN790gI6f6zcYkjVdMvHVXFu0s4He+PE6Ogh7ZfFHYQSm9034+1hd6Sr6
 PSH+E3CeS3mz4J6EuPObfwTOUcvU2hlHBO8XsElgtmA9kmOwDcO65PS+yaho+l2S4mD5
 qECsdYfGUEdUV3ZAZtssW5/2fp0oS2ynsO+UWRvZENTt8l7F/AB3S/y7naJqLsmq15ep
 QQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tHyc4vww6f6Wxw3/eQBdIL1Je73VlgA7JKdBmqCGaqQ=;
 b=Rfk+jEjne2QRX2J1Scvg+GxfSLSaJQcEWoLIEdmP4BBAoSWTSjzvy0+GbT4ptBM8vh
 /4m6dmPVd+4qkm1tsNQUmjmrH5F2cMDbHPySducK5zxJvI8MoW/27wQXyYxKJkEdeHdS
 Oc73p30OxVxiZ4VB5ZBO9DBVBv4YGxjLqrUoZn9ihLaiD65lP9+Kiz+6aURB1N5awKaC
 1PFHWu806W+CpToWbnbRgNLYIk8DwxjWmvXn04X0LSnDyogeCZVHl2o9pJwGTIbszMZ0
 gdhtcT3x4+ZGx2kLBxhFdUbSEHdgVaP/QxQDYBC7ZvXKd+Zp0nd09AUwtTN5SHFS5oRk
 OTZw==
X-Gm-Message-State: AOAM5337dHdNbqM5TUGEMBmLF/nIiHGh43s4HdnGoRuqHDmUJkmRsSVb
 +eOQf/Oe0ZZ9HWrxEFGlQtDs8A==
X-Google-Smtp-Source: ABdhPJwLWZxBb9qwghOW25FeDDOjCEelQjT4dSKut4RYsVrgGIzla0FvveTn3livbxhFig7UgwmMkg==
X-Received: by 2002:a17:903:2449:b0:142:b3c:f9c6 with SMTP id
 l9-20020a170903244900b001420b3cf9c6mr16910209pls.77.1637749534624; 
 Wed, 24 Nov 2021 02:25:34 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:104b:13b9:d53:e2aa])
 by smtp.gmail.com with ESMTPSA id q9sm11522330pfj.114.2021.11.24.02.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 02:25:34 -0800 (PST)
Date: Wed, 24 Nov 2021 18:25:30 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, cujomalainey@google.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v3 3/3] firmware: mediatek: add adsp ipc protocol interface
Message-ID: <YZ4TGvtwO5ySCEkT@google.com>
References: <20211124084514.28002-1-allen-kh.cheng@mediatek.com>
 <20211124084514.28002-4-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211124084514.28002-4-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_022536_035925_30566CC5 
X-CRM114-Status: GOOD (  19.54  )
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

On Wed, Nov 24, 2021 at 04:45:14PM +0800, allen-kh.cheng wrote:
>  drivers/firmware/Kconfig                      |   1 +
>  drivers/firmware/Makefile                     |   1 +
>  drivers/firmware/mediatek/Kconfig             |  10 ++
>  drivers/firmware/mediatek/Makefile            |   2 +
>  drivers/firmware/mediatek/mtk-adsp-ipc.c      | 130 ++++++++++++++++++
>  .../linux/firmware/mediatek/mtk-adsp-ipc.h    |  72 ++++++++++
>  6 files changed, 216 insertions(+)
>  create mode 100644 drivers/firmware/mediatek/Kconfig
>  create mode 100644 drivers/firmware/mediatek/Makefile
>  create mode 100644 drivers/firmware/mediatek/mtk-adsp-ipc.c
>  create mode 100644 include/linux/firmware/mediatek/mtk-adsp-ipc.h

The patch should move before the 2nd patch in the series as the 2nd patch uses mtk-adsp-ipc.h.

> diff --git a/drivers/firmware/mediatek/mtk-adsp-ipc.c b/drivers/firmware/mediatek/mtk-adsp-ipc.c
[...]
> +int adsp_ipc_send(struct mtk_adsp_ipc *ipc, unsigned int idx, uint32_t op)
> +{
> +	struct mtk_adsp_chan *dsp_chan = &ipc->chans[idx];
> +	struct adsp_mbox_ch_info *ch_info = dsp_chan->ch->con_priv;
> +	int ret;
> +
> +	if (idx >= MTK_ADSP_MBOX_NUM)
> +		return -EINVAL;

If idx >= MTK_ADSP_MBOX_NUM, the invalid memory access has occurred at beginning of the function.

> +static int mtk_adsp_ipc_probe(struct platform_device *pdev)
> +{
[...]
> +	device_set_of_node_from_dev(&pdev->dev, pdev->dev.parent);

Why does it need to call device_set_of_node_from_dev()?

> +	for (i = 0; i < MTK_ADSP_MBOX_NUM; i++) {
> +		chan_name = kasprintf(GFP_KERNEL, "mbox%d", i);
> +		if (!chan_name)
> +			return -ENOMEM;
> +
> +		dsp_chan = &dsp_ipc->chans[i];
> +		cl = &dsp_chan->cl;
> +		cl->dev = dev->parent;
> +		cl->tx_block = false;
> +		cl->knows_txdone = false;
> +		cl->tx_prepare = NULL;
> +		cl->rx_callback = adsp_ipc_recv;
> +
> +		dsp_chan->ipc = dsp_ipc;
> +		dsp_chan->idx = i;
> +		dsp_chan->ch = mbox_request_channel_byname(cl, chan_name);
> +		if (IS_ERR(dsp_chan->ch)) {
> +			ret = PTR_ERR(dsp_chan->ch);
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(dev, "Failed to request mbox chan %d ret %d\n",
> +					i, ret);

If ret == -EPROBE_DEFER, wouldn't it need to return -EPROBE_DEFER?  It doesn't retry later if -EPROBE_DEFER.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
