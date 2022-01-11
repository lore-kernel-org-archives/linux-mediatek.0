Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40A9C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 17:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+U5LASb75iB5speyZxiQf7WzL9LVidQRJ58jnRqwWfU=; b=adu7uT0ojzV9eecSq8FqEZuJBr
	tgyZ/LhqAnXy7HhRU5PjOlh7OCGeMnp2cT9wlLbndpEuOz0Sn6xE6yScNncXZHKRzTeCk7m2MLDOA
	RIitMVwnaadnFJwL4/SKJBe9kchh2rUQkMxyLMUshRJqSekOvL94slOC+050/2f3wjI90VIuingTS
	L/1WHHSubcypP+EFpmFwaoRJ5vrvX/lYg3aXm+4ak3OqT4OyqDo4/PoWcdOcvXsescliIw1E3RWq1
	Ej6KluM4/Zs0pcL9GDQN9dci6mvHbyUIAu+VJqnHjn94jD2QaKbRndtDY4RzDDJ3a5wQklSWhMcCy
	OdHD9c4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Ks4-00H2i7-4E; Tue, 11 Jan 2022 17:23:44 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Ks1-00H2gX-1C; Tue, 11 Jan 2022 17:23:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641921820; x=1673457820;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=gEUR+PS3VK1rPxJq6WRhpVCCJmBWIol2sYXcM1N0t6I=;
 b=anNagfXTEhdQvdxJASaJ0VM7we0CwbaH3KfAN13r/p6D9Ttyfb6VSZGl
 UXHS3Wcs/brj5ffTavfnV3NZBIrmm3/I0G7FNM+Ptpj/2l+UHiaeoKZXp
 joWqHn+hEKGcE40vt/eRDdapAqo4tdLLGrxcGLjkLyFPh4vL0N9MOPQLH
 nzXj3CixD1+QcW38ct0FGv2JTD5tY306vYkmZS3sPDgGB19mJUQMTZVbn
 +WvO3IU/giCrM8hdoGcakqx4Th/vPWTAMAwIn4YCugfX+ArKRfW1nsrSP
 5DmTnrqlL53p03ONaQehxlFyQOkMHb/14Vc/gM4gPM/Xx+qkc+1mCHOdG w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="267880298"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="267880298"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 09:23:33 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="592749789"
Received: from cdoher2x-mobl1.amr.corp.intel.com (HELO [10.212.119.165])
 ([10.212.119.165])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 09:23:32 -0800
Subject: Re: [PATCH] firmware: mediatek: add adsp ipc protocol interface
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, tzungbi@google.com,
 cujomalainey@google.com, Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sound-open-firmware@alsa-project.org
References: <20220111071011.5964-1-allen-kh.cheng@mediatek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <91eef4c9-adda-1921-16b5-af181b30d36e@linux.intel.com>
Date: Tue, 11 Jan 2022 11:02:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220111071011.5964-1-allen-kh.cheng@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_092341_150097_4BFEBB5D 
X-CRM114-Status: GOOD (  20.87  )
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


> +int mtk_adsp_ipc_send(struct mtk_adsp_ipc *ipc, unsigned int idx, uint32_t msg)
> +{
> +	struct mtk_adsp_chan *dsp_chan;
> +	int ret;
> +
> +	if (idx >= MTK_ADSP_MBOX_NUM)
> +		return -EINVAL;
> +
> +	dsp_chan = &ipc->chans[idx];
> +	ret = mbox_send_message(dsp_chan->ch, &msg);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;

this can be simplified a bit without the 'ret' variable

return mbox_send_message(dsp_chan->ch, &msg);

> +}
> +EXPORT_SYMBOL(mtk_adsp_ipc_send);


> +static int mtk_adsp_ipc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_adsp_ipc *dsp_ipc;
> +	struct mtk_adsp_chan *dsp_chan;
> +	struct mbox_client *cl;
> +	char *chan_name;
> +	int ret;
> +	int i, j;
> +
> +	device_set_of_node_from_dev(&pdev->dev, pdev->dev.parent);
> +
> +	dsp_ipc = devm_kzalloc(dev, sizeof(*dsp_ipc), GFP_KERNEL);
> +	if (!dsp_ipc)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < MTK_ADSP_MBOX_NUM; i++) {
> +		chan_name = kasprintf(GFP_KERNEL, "mbox%d", i);
> +		if (!chan_name) {
> +			ret = -ENOMEM;
> +			goto out;
> +		}

in this case with the existing code you will free something that was not
allocated. It's not super elegant, consider using different labels as
suggested below.

> +
> +		dsp_chan = &dsp_ipc->chans[i];
> +		cl = &dsp_chan->cl;
> +		cl->dev = dev->parent;
> +		cl->tx_block = false;
> +		cl->knows_txdone = false;
> +		cl->tx_prepare = NULL;
> +		cl->rx_callback = mtk_adsp_ipc_recv;
> +
> +		dsp_chan->ipc = dsp_ipc;
> +		dsp_chan->idx = i;
> +		dsp_chan->ch = mbox_request_channel_byname(cl, chan_name);
> +		if (IS_ERR(dsp_chan->ch)) {
> +			ret = PTR_ERR(dsp_chan->ch);
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(dev, "Failed to request mbox chan %d ret %d\n",
> +					i, ret);
> +			goto out;

goto out_free;

> +		}
> +
> +		dev_dbg(dev, "request mbox chan %s\n", chan_name);
> +		kfree(chan_name);
> +	}
> +
> +	dsp_ipc->dev = dev;
> +	dev_set_drvdata(dev, dsp_ipc);
> +	dev_dbg(dev, "MTK ADSP IPC initialized\n");
> +
> +	return 0;
> +
> +out:

out_free:
> +	kfree(chan_name);

out:

> +	for (j = 0; j < i; j++) {
> +		dsp_chan = &dsp_ipc->chans[j];
> +		mbox_free_channel(dsp_chan->ch);
> +	}
> +
> +	return ret;
> +}
> +
> +static int mtk_adsp_ipc_remove(struct platform_device *pdev)
> +{
> +	struct mtk_adsp_ipc *dsp_ipc = dev_get_drvdata(&pdev->dev);
> +	struct mtk_adsp_chan *dsp_chan;
> +	int i;
> +
> +	for (i = 0; i < MTK_ADSP_MBOX_NUM; i++) {
> +		dsp_chan = &dsp_ipc->chans[i];
> +		mbox_free_channel(dsp_chan->ch);
> +	}
> +
> +	return 0;
> +}
> +
> +static struct platform_driver mtk_adsp_ipc_driver = {
> +	.driver = {
> +		.name = "mtk-adsp-ipc",
> +	},
> +	.probe = mtk_adsp_ipc_probe,
> +	.remove = mtk_adsp_ipc_remove,
> +};
> +builtin_platform_driver(mtk_adsp_ipc_driver);
> +
> +MODULE_AUTHOR("Allen-KH Cheng <allen-kh.cheng@mediatek.com>");
> +MODULE_DESCRIPTION("MTK ADSP IPC Driver");
> +MODULE_LICENSE("GPL v2");

the v2 here isn't useful, the license information can be found in the
SPDX line.

MODULE_LICENSE("GPL");



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
