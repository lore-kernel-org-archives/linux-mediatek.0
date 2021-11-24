Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76027C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Nov 2021 10:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jJqm/xfrEFuw76ubqH1KH8jj5wmaZWRsg2wXagQ0VAA=; b=GQS6+2PW/Vuqt0
	nldj91WWvClVCUhnZhNEDhVTc2bV6OzGa9Xc52UvQOpb8dxIxoTtO2ICqlRck0UFLbSvzLV5uFqQt
	PhLdBCmGp66337Ra/POlAN1UpyCMr3jeToqj9rlJWNae75/eaM9s+aMci9TE7X0a5JYEY3PCDveLa
	ogs5rjoHvb9WnH9/ppDmmElTeSPALWltniRH2ges4+JHuNMmXmGiL8DpU64V48wjsbeJiLbhkc4ZM
	+5tuMELwak+B2UMA1wQVAJFxourchRoN+9VR/dUljAGD4b1ujQa5ymnZRS9KNkY532xkblb90bxud
	jnWXeFphaK3UshuACY/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mppSt-004Tpe-OT; Wed, 24 Nov 2021 10:25:23 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mppSr-004Tov-4O
 for linux-mediatek@lists.infradead.org; Wed, 24 Nov 2021 10:25:22 +0000
Received: by mail-pg1-x530.google.com with SMTP id l190so1713102pge.7
 for <linux-mediatek@lists.infradead.org>; Wed, 24 Nov 2021 02:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RWDbxw0O+Eb2MTODPtyb5giEnnTJJaqwqAJtlwbLKPM=;
 b=TUOz5MfgG5JMzyZ6iwNq72F59avCAePjCoi5R5mYzgjxOabfcPIkv/bF2Tc1L1gGE/
 dXLcUIr5YGb2GMc38BMHvZFi8xLHBdoicirIxGj8Q8Fi3qy8Ty+rivQNOn6eNWpXjUeg
 Ka4IJxZZZyXSDcU342PW0GfzGYlVWPhL4ViLLwvmfTs4rPnjeKv+IqD9ac0NpcZGOnzp
 ldUTjhKiI7o+vzFrUwyanPTB1KN+3PggPEJWt895E6pucNJ5Hn5rNAvruC2i82QWgyO+
 v8fC1QGAyrRZX90+bJFZvUM3DgXMVM4cK9QmtNEc3ZY8zwK9ykP+OvQY7Uy7H2tu06jh
 Jefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RWDbxw0O+Eb2MTODPtyb5giEnnTJJaqwqAJtlwbLKPM=;
 b=qbI5abgKNj24LCY7nJuUsd4FaUFigdofSXjZyA277kgBhENJqvPS6OQ0AzIC8Gi/Pt
 SIPnrL73VDbsBESSsCwBvDIouQseC3IkbWs6+FU72ffk/1eSKwLuO6JBkxFFX0iOK4Wk
 7bmog/pYvFnaJ5/xji6/x5e4sCWG8ZJyrhWCXw8JLSBBoD/7Tnr7h9RKFw3c5e9yD5Q/
 a+BBMWRo3bj69C2tLySdkEUqx9BKa8ug2wBhW3CF/0jjr1ZDDwQIJDW08uvWRXy6HmV1
 m12uH8F2IdIyG6OgpRmCC1/VNUT05Rd+kB+tEro2BX6dNhV5EQUnJYcoj73qT0umhLS7
 8wBA==
X-Gm-Message-State: AOAM53269FsKo+Qg2LsXZjJXFMtVUaXY+2EVyrVhnn/YzNMdOxgz33e3
 TcBcXEu82b5U9sINAI68GUwZbg==
X-Google-Smtp-Source: ABdhPJy4yGk5G/wT8MjPGEmXFxJwr4sD+MfMiZ+bTpsvRjJhdnwJCzHW6W0Mc4xMDUEALiJGPp8oIg==
X-Received: by 2002:a63:90c1:: with SMTP id a184mr7144545pge.222.1637749518381; 
 Wed, 24 Nov 2021 02:25:18 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:104b:13b9:d53:e2aa])
 by smtp.gmail.com with ESMTPSA id f4sm15333725pfg.34.2021.11.24.02.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 02:25:18 -0800 (PST)
Date: Wed, 24 Nov 2021 18:25:13 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, cujomalainey@google.com,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Baluta <daniel.baluta@nxp.com>,
 linux-arm-kernel@lists.infradead.org, sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v3 2/3] mailbox: mediatek: add support for adsp mailbox
 controller
Message-ID: <YZ4TCYmvegnC/kR0@google.com>
References: <20211124084514.28002-1-allen-kh.cheng@mediatek.com>
 <20211124084514.28002-3-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211124084514.28002-3-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_022521_228887_37297E46 
X-CRM114-Status: GOOD (  24.00  )
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

On Wed, Nov 24, 2021 at 04:45:13PM +0800, allen-kh.cheng wrote:
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index c9fc06c7e685..fc99d9fc80af 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -236,6 +236,13 @@ config MTK_CMDQ_MBOX
>  	  critical time limitation, such as updating display configuration
>  	  during the vblank.
>  
> +config MTK_ADSP_IPC_MBOX
> +	tristate "MediaTek ADSP Mailbox Controller"
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	help
> +	  Say yes here to add support for MediaTek ADSP IPC mailbox controller
> +	  driver. It is used to send short messages between processors with dsp.

Although the file didn't maintain alphabetical order, to be neat, moving MTK_ADSP_IPC_MBOX before MTK_CMDQ_MBOX makes more sense.

> diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> index c2089f04887e..479a9ae56d5e 100644
> --- a/drivers/mailbox/Makefile
> +++ b/drivers/mailbox/Makefile
> @@ -51,6 +51,8 @@ obj-$(CONFIG_STM32_IPCC) 	+= stm32-ipcc.o
>  
>  obj-$(CONFIG_MTK_CMDQ_MBOX)	+= mtk-cmdq-mailbox.o
>  
> +obj-$(CONFIG_MTK_ADSP_IPC_MBOX)	+= mtk-adsp-mailbox.o
> +

Ditto.  Move CONFIG_MTK_ADSP_IPC_MBOX before CONFIG_MTK_CMDQ_MBOX without blank line separation.

> diff --git a/drivers/mailbox/mtk-adsp-mailbox.c b/drivers/mailbox/mtk-adsp-mailbox.c
[...]
> +static irqreturn_t mtk_adsp_ipc_irq_handler(int irq, void *data)
> +{
> +	struct mbox_chan *ch = (struct mbox_chan *)data;

The cast should be able to remove.

> +static irqreturn_t mtk_adsp_ipc_handler(int irq, void *data)
> +{
> +	struct mbox_chan *ch = (struct mbox_chan *)data;

The cast should be able to remove.

> +static int mtk_adsp_mbox_startup(struct mbox_chan *chan)
> +{
> +	struct adsp_mbox_ch_info *ch_info = chan->con_priv;
> +	void __iomem *reg = ch_info->va_reg;
> +
> +	/* Clear DSP mbox command */
> +	writel(0xFFFFFFFF, reg + MTK_ADSP_MBOX_IN_CMD_CLR);
> +	writel(0xFFFFFFFF, reg + MTK_ADSP_MBOX_OUT_CMD_CLR);
> +
> +	return 0;
> +}
> +
> +static void mtk_adsp_mbox_shutdown(struct mbox_chan *chan)
> +{
> +	chan->con_priv = NULL;
> +}

Shall mtk_adsp_mbox_shutdown() also clear DSP mbox?  I.e.:
writel(0xFFFFFFFF, reg + MTK_ADSP_MBOX_IN_CMD_CLR);
writel(0xFFFFFFFF, reg + MTK_ADSP_MBOX_OUT_CMD_CLR);

> +static int mtk_adsp_mbox_send_data(struct mbox_chan *chan, void *data)
> +{
> +	struct adsp_mbox_ch_info *ch_info = chan->con_priv;
> +	void __iomem *reg = ch_info->va_reg;
> +
> +	spin_lock(&ch_info->lock);
> +	writel(ch_info->ipc_op_val, reg + MTK_ADSP_MBOX_IN_CMD);
> +	spin_unlock(&ch_info->lock);

Why does it need the lock?

Is the write to MTK_ADSP_MBOX_IN_CMD a synchronous operation?
- If yes, I failed to understand why does it need the lock.  Every calls to mtk_adsp_mbox_send_data() should wait for the data transfer completion.
- If no, I also failed to understand why.  mtk_adsp_mbox_send_data() has no way to be aware of the transfer completion.  Would expect a loop for checking the completion for the case.

> +static bool mtk_adsp_mbox_last_tx_done(struct mbox_chan *chan)
> +{
> +	struct adsp_mbox_ch_info *ch_info = chan->con_priv;
> +	void __iomem *reg = ch_info->va_reg;
> +	u32 op = readl(reg + MTK_ADSP_MBOX_IN_CMD);
> +
> +	return (op == 0) ? true : false;

To be concise, return readl(...) == 0;

> +static int mtk_adsp_mbox_probe(struct platform_device *pdev)
> +{
[...]
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(dev, "no adsp mbox register resource\n");
> +		return -ENXIO;
> +	}
> +
> +	size = resource_size(res);
> +	priv->va_mboxreg = devm_ioremap(dev, (phys_addr_t)res->start, size);
> +	if (IS_ERR(priv->va_mboxreg))
> +		return PTR_ERR(priv->va_mboxreg);

Use devm_platform_ioremap_resource(), it should be equivalent.

> +	/* set adsp mbox channel info */
> +	ch_info = devm_kzalloc(mbox->dev, sizeof(*ch_info), GFP_KERNEL);

To be neat, use dev instead of mbox->dev.

> +	ret = devm_mbox_controller_register(dev, &priv->mbox);
> +	if (ret < 0)
> +		dev_err(dev, "error: failed to register mailbox:%d\n", ret);
> +
> +	return ret;

To be concise, return devm_mbox_controller_register(...);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
