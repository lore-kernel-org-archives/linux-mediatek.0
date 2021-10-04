Return-Path: <SRS0=jwT2=OY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F8D9C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Oct 2021 11:39:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 019E16120D
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Oct 2021 11:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 019E16120D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w5GZRQMjahwkkJPuVykMr5mWCecBh8pRQPQ3F5csUU4=; b=xEGpRUibqzX3Iy
	ULjcsPlB9PYiKegK8i+tfm5T/JU/KfUqQR5IjX912idKeRQeSkIYjv9AvrjjnJB3Mkh2d1s8BipS0
	PEjpiIO4j+XWpPCu1HZgpfRhhfiCUwNyK2fNjjdSkQT5Nq8eC3UyBg5fqh8X1pccjml45fQfbhDuN
	Gw9urqelgWeYWHJ/6QrGxmIQQ3Dlx4JYbLcBuHLYZkuxYFL2vLwS+9jwDJTbLP+q81Aya1MIryE5Y
	krLKT4/QiIjh346SAM4P6wzBl3+wrbl8BE8GIUFZEXglaAHzqFA7f9lOOcMdRczZFV5Hgz71kii9W
	qOXaH/RTxnqHWfGe8F2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXMJ8-006Ekr-Py; Mon, 04 Oct 2021 11:38:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXMJ4-006Eix-Sc; Mon, 04 Oct 2021 11:38:56 +0000
X-UUID: 4a308a58412743fca2d6c2d3614c77a0-20211004
X-UUID: 4a308a58412743fca2d6c2d3614c77a0-20211004
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chien-yu.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1506625728; Mon, 04 Oct 2021 04:38:52 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 Oct 2021 04:38:35 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 4 Oct 2021 19:38:22 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 4 Oct 2021 19:38:22 +0800
Message-ID: <a6336289dcf0009f2fc900c74f480b3c5fc0e8be.camel@mediatek.com>
Subject: Re: [PATCH] ASoc: fix ASoC driver to support ops to register
 get_time_info
From: Chien-Yu Lin <Chien-Yu.Lin@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <yichin.huang@mediatek.com>, <hungjung.hsu@mediatek.com>,
 <allen-hw.hsu@mediatek.com>
Date: Mon, 4 Oct 2021 19:38:22 +0800
In-Reply-To: <20210820130210.3321-1-chien-yu.lin@mediatek.com>
References: <20210820130210.3321-1-chien-yu.lin@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_043854_997623_262BFFB9 
X-CRM114-Status: GOOD (  22.19  )
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

Dear Sir,

Sorry for bothering you.

Does it have any status updated, please?

Thank you.

Best Regards,
Chien-Yu.Lin

On Fri, 2021-08-20 at 21:02 +0800, Chien-Yu Lin wrote:
> From: "chien-yu.lin" <chien-yu.lin@mediatek.com>
> 
> Because ASoC soc_new_pcm() function didn't register
> .get_time_info() ops and cause snd_pcm_update_hw_ptr0() can not find
> substream->ops->get_time_info, it will not be called due to ASoC
> driver which register in HW device driver.
> 
> Add .get_time_info() ops in ASoC soc_new_pcm() and
> register by snd_pcm_set_ops() function.
> If HW device driver want to implment timestamp by itself,
> ASoC should register .get_time_info function.
> 
> Signed-off-by: chien-yu.lin <chien-yu.lin@mediatek.com>
> ---
>  include/sound/soc-component.h |  4 ++++
>  sound/soc/soc-component.c     | 21 +++++++++++++++++++++
>  sound/soc/soc-pcm.c           |  2 ++
>  3 files changed, 27 insertions(+)
> 
> diff --git a/include/sound/soc-component.h b/include/sound/soc-
> component.h
> index 8c4d6830597f..52b5228b7a8d 100644
> --- a/include/sound/soc-component.h
> +++ b/include/sound/soc-component.h
> @@ -484,6 +484,10 @@ int snd_soc_pcm_component_sync_stop(struct
> snd_pcm_substream *substream);
>  int snd_soc_pcm_component_copy_user(struct snd_pcm_substream
> *substream,
>  				    int channel, unsigned long pos,
>  				    void __user *buf, unsigned long
> bytes);
> +int snd_soc_pcm_component_get_time_info(struct snd_pcm_substream
> *substream,
> +					struct timespec64 *system_ts,
> struct timespec64 *audio_ts,
> +					struct
> snd_pcm_audio_tstamp_config *audio_tstamp_config,
> +					struct
> snd_pcm_audio_tstamp_report *audio_tstamp_report);
>  struct page *snd_soc_pcm_component_page(struct snd_pcm_substream
> *substream,
>  					unsigned long offset);
>  int snd_soc_pcm_component_mmap(struct snd_pcm_substream *substream,
> diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
> index 3a5e84e16a87..56caec7ec00b 100644
> --- a/sound/soc/soc-component.c
> +++ b/sound/soc/soc-component.c
> @@ -1000,6 +1000,27 @@ int snd_soc_pcm_component_copy_user(struct
> snd_pcm_substream *substream,
>  	return -EINVAL;
>  }
>  
> +int snd_soc_pcm_component_get_time_info(struct snd_pcm_substream
> *substream,
> +					struct timespec64 *system_ts,
> struct timespec64 *audio_ts,
> +					struct
> snd_pcm_audio_tstamp_config *audio_tstamp_config,
> +					struct
> snd_pcm_audio_tstamp_report *audio_tstamp_report)
> +{
> +	struct snd_soc_pcm_runtime *rtd =
> asoc_substream_to_rtd(substream);
> +	struct snd_soc_component *component;
> +	int i;
> +
> +	/* FIXME. it returns 1st get_time_info now */
> +	for_each_rtd_components(rtd, i, component) {
> +		if (component->driver->get_time_info)
> +			return soc_component_ret(component,
> +				component->driver-
> >get_time_info(component,
> +				substream, system_ts, audio_ts,
> +				audio_tstamp_config,
> audio_tstamp_report));
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  struct page *snd_soc_pcm_component_page(struct snd_pcm_substream
> *substream,
>  					unsigned long offset)
>  {
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index d1c570ca21ea..cff7025027a6 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2786,6 +2786,8 @@ int soc_new_pcm(struct snd_soc_pcm_runtime
> *rtd, int num)
>  			rtd->ops.mmap		=
> snd_soc_pcm_component_mmap;
>  		if (drv->ack)
>  			rtd->ops.ack            =
> snd_soc_pcm_component_ack;
> +		if (drv->get_time_info)
> +			rtd->ops.get_time_info	=
> snd_soc_pcm_component_get_time_info;
>  	}
>  
>  	if (playback)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
