Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CE9C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Nov 2021 01:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qO4m/VAbnXzWSikdHydpZPns80B5/3m6WDoh+yhHyDU=; b=zPAdw4+ipCIRUb
	QjjkmIMXWqHy8JSEmLdPDrNqkwSBuiBMlxc8j4x0jX1bAErVQ2Cgx89UpdRufuQpK/+Rm4xk+Wg4L
	tJBNuwHZYgayNy8MDNpDFHjfbNVLjHaotmXhDiSM1Kd9EZozsjJHmGJqOPyMOpSsAbD/SEItlVYh6
	mWd/Kgcze1W3tpbd+mel/Xpj5ayydeBuI2HwxtUXD1y1Ysw+TvxLinSc/AtI/rxX7XYAWrASJ+gDO
	qu8bvftas5hbxEgToD6N4+dR/DHFPydhn4ZhP3vlUnY03oNVybD1SalEcuSYLoE3dRhRoSRec/KW0
	FlvcqjYMEumtjq93SapQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mq3rV-006FDT-CY; Thu, 25 Nov 2021 01:47:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mq3rG-006FBz-Tt; Thu, 25 Nov 2021 01:47:33 +0000
X-UUID: b760bc9b47034429be70fb695f40404d-20211124
X-UUID: b760bc9b47034429be70fb695f40404d-20211124
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 737045535; Wed, 24 Nov 2021 18:47:26 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Nov 2021 17:47:24 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Nov 2021 09:47:22 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 25 Nov 2021 09:47:22 +0800
Message-ID: <43976e8aab2e3055195d8e9c2f466a804e4d2ba7.camel@mediatek.com>
Subject: Re: [PATCH v3 3/3] firmware: mediatek: add adsp ipc protocol interface
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Linux-ALSA
 <alsa-devel@alsa-project.org>, <cujomalainey@google.com>, "Pierre-Louis
 Bossart" <pierre-louis.bossart@linux.intel.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Daniel Baluta
 <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <sound-open-firmware@alsa-project.org>
Date: Thu, 25 Nov 2021 09:47:22 +0800
In-Reply-To: <YZ4TGvtwO5ySCEkT@google.com>
References: <20211124084514.28002-1-allen-kh.cheng@mediatek.com>
 <20211124084514.28002-4-allen-kh.cheng@mediatek.com>
 <YZ4TGvtwO5ySCEkT@google.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_174731_028388_CA8606A3 
X-CRM114-Status: GOOD (  25.59  )
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

Hi Tzung-Bi,

Thanks for your suggestions.

On Wed, 2021-11-24 at 18:25 +0800, Tzung-Bi Shih wrote:
> On Wed, Nov 24, 2021 at 04:45:14PM +0800, allen-kh.cheng wrote:
> >  drivers/firmware/Kconfig                      |   1 +
> >  drivers/firmware/Makefile                     |   1 +
> >  drivers/firmware/mediatek/Kconfig             |  10 ++
> >  drivers/firmware/mediatek/Makefile            |   2 +
> >  drivers/firmware/mediatek/mtk-adsp-ipc.c      | 130
> > ++++++++++++++++++
> >  .../linux/firmware/mediatek/mtk-adsp-ipc.h    |  72 ++++++++++
> >  6 files changed, 216 insertions(+)
> >  create mode 100644 drivers/firmware/mediatek/Kconfig
> >  create mode 100644 drivers/firmware/mediatek/Makefile
> >  create mode 100644 drivers/firmware/mediatek/mtk-adsp-ipc.c
> >  create mode 100644 include/linux/firmware/mediatek/mtk-adsp-ipc.h
> 
> The patch should move before the 2nd patch in the series as the 2nd
> patch uses mtk-adsp-ipc.h.
> 
> > diff --git a/drivers/firmware/mediatek/mtk-adsp-ipc.c
> > b/drivers/firmware/mediatek/mtk-adsp-ipc.c
> 
> [...]
> > +int adsp_ipc_send(struct mtk_adsp_ipc *ipc, unsigned int idx,
> > uint32_t op)
> > +{
> > +	struct mtk_adsp_chan *dsp_chan = &ipc->chans[idx];
> > +	struct adsp_mbox_ch_info *ch_info = dsp_chan->ch->con_priv;
> > +	int ret;
> > +
> > +	if (idx >= MTK_ADSP_MBOX_NUM)
> > +		return -EINVAL;
> 
> If idx >= MTK_ADSP_MBOX_NUM, the invalid memory access has occurred
> at beginning of the function.
> 
> > +static int mtk_adsp_ipc_probe(struct platform_device *pdev)
> > +{
> 
> [...]
> > +	device_set_of_node_from_dev(&pdev->dev, pdev->dev.parent);
> 
> Why does it need to call device_set_of_node_from_dev()?

The original design regards mt8195 sof of_node as a parent deivce of
mtk-adsp-ipc.

device_set_of_node_from_dev will set of_node_reuse flag to prevent
driver from attempting to claim any mbox ipc resources already claimed
by the sof dsp device.

> 
> > +	for (i = 0; i < MTK_ADSP_MBOX_NUM; i++) {
> > +		chan_name = kasprintf(GFP_KERNEL, "mbox%d", i);
> > +		if (!chan_name)
> > +			return -ENOMEM;
> > +
> > +		dsp_chan = &dsp_ipc->chans[i];
> > +		cl = &dsp_chan->cl;
> > +		cl->dev = dev->parent;
> > +		cl->tx_block = false;
> > +		cl->knows_txdone = false;
> > +		cl->tx_prepare = NULL;
> > +		cl->rx_callback = adsp_ipc_recv;
> > +
> > +		dsp_chan->ipc = dsp_ipc;
> > +		dsp_chan->idx = i;
> > +		dsp_chan->ch = mbox_request_channel_byname(cl,
> > chan_name);
> > +		if (IS_ERR(dsp_chan->ch)) {
> > +			ret = PTR_ERR(dsp_chan->ch);
> > +			if (ret != -EPROBE_DEFER)
> > +				dev_err(dev, "Failed to request mbox
> > chan %d ret %d\n",
> > +					i, ret);
> 
> If ret == -EPROBE_DEFER, wouldn't it need to return
> -EPROBE_DEFER?  It doesn't retry later if -EPROBE_DEFER.

If ret != -EPROBE_DEFER, it will show a error message then goto out.

If ret == -EPROBE_DEFER, probe funcation also will goto out. 


Both of them will return ret. will not go to next round.

Thanks,
Allen



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
