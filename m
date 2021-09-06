Return-Path: <SRS0=cnxW=N4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5954CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 20:30:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE61B61077
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 20:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE61B61077
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pTJ5jMCx/qTXvxqVsmkPTMugnVb5qr+AQuo9UsB5AZM=; b=DE8lnmg083UWMx
	3dyfffCDluuEVjyxjI88dwmOEPSVysDVRc6h37Qnpa25zITc3Xzl9wURfBa/1HRbUcnpWAS8BG3Tf
	tLG/h16f0L6BsGHMNIpuLQG4BFg/ixLzp435YcxyD2mu343gdUbeBqpPYWxMDzTuH7t69ZAPRoph0
	V5c+loPEsZAibo1LUdFMyFF5UJOhmLBCyR/4uXBtgXShQevks5MIapTv2V6JgQFF20QRmpLbdEO4k
	ZreH3grlkbyMpCkM7Z+66Ln/509mbbMXYrjzr6TulPJiNZ38f0HmkO/5Sf4dgaHUuL1vLlSd8+T8t
	g3IGmpltAUXDqgrNkYzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNLGO-001tTU-P9; Mon, 06 Sep 2021 20:30:44 +0000
Received: from mx1.smtp.larsendata.com ([91.221.196.215])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNLGB-001tRf-C0
 for linux-mediatek@lists.infradead.org; Mon, 06 Sep 2021 20:30:33 +0000
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 3fc01c45-0f51-11ec-a02a-0050568c148b;
 Mon, 06 Sep 2021 20:30:17 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 05B32194CF3;
 Mon,  6 Sep 2021 22:30:19 +0200 (CEST)
Date: Mon, 6 Sep 2021 22:30:26 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 4/6] video/hdmi: Add audio_infoframe packing for DP
Message-ID: <YTZ6YvifP0EqGBzR@ravnborg.org>
References: <20210906193529.718845-1-msp@baylibre.com>
 <20210906193529.718845-5-msp@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210906193529.718845-5-msp@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_133031_765333_C50A5927 
X-CRM114-Status: GOOD (  28.60  )
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

Hi Markus,

On Mon, Sep 06, 2021 at 09:35:27PM +0200, Markus Schneider-Pargmann wrote:
> Similar to HDMI, DP uses audio infoframes as well which are structured
> very similar to the HDMI ones.
> 
> This patch adds a helper function to pack the HDMI audio infoframe for
> DP, called hdmi_audio_infoframe_pack_for_dp().
> hdmi_audio_infoframe_pack_only() is split into two parts. One of them
> packs the payload only and can be used for HDMI and DP.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  drivers/video/hdmi.c | 87 +++++++++++++++++++++++++++++++++++---------
>  include/linux/hdmi.h |  4 ++
>  2 files changed, 73 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
> index 947be761dfa4..59c4341549e4 100644
> --- a/drivers/video/hdmi.c
> +++ b/drivers/video/hdmi.c
> @@ -387,6 +387,28 @@ int hdmi_audio_infoframe_check(struct hdmi_audio_infoframe *frame)
>  }
>  EXPORT_SYMBOL(hdmi_audio_infoframe_check);
>  
> +static void
> +hdmi_audio_infoframe_pack_payload(const struct hdmi_audio_infoframe *frame,
> +				  u8 *buffer)
> +{
> +	u8 channels;
> +
> +	if (frame->channels >= 2)
> +		channels = frame->channels - 1;
> +	else
> +		channels = 0;
> +
> +	buffer[0] = ((frame->coding_type & 0xf) << 4) | (channels & 0x7);
> +	buffer[1] = ((frame->sample_frequency & 0x7) << 2) |
> +		 (frame->sample_size & 0x3);
> +	buffer[2] = frame->coding_type_ext & 0x1f;
> +	buffer[3] = frame->channel_allocation;
> +	buffer[4] = (frame->level_shift_value & 0xf) << 3;
> +
> +	if (frame->downmix_inhibit)
> +		buffer[4] |= BIT(7);
> +}
> +
>  /**
>   * hdmi_audio_infoframe_pack_only() - write HDMI audio infoframe to binary buffer
>   * @frame: HDMI audio infoframe
> @@ -404,7 +426,6 @@ EXPORT_SYMBOL(hdmi_audio_infoframe_check);
>  ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
>  				       void *buffer, size_t size)
>  {
> -	unsigned char channels;
>  	u8 *ptr = buffer;
>  	size_t length;
>  	int ret;
> @@ -420,28 +441,13 @@ ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
>  
>  	memset(buffer, 0, size);
>  
> -	if (frame->channels >= 2)
> -		channels = frame->channels - 1;
> -	else
> -		channels = 0;
> -
>  	ptr[0] = frame->type;
>  	ptr[1] = frame->version;
>  	ptr[2] = frame->length;
>  	ptr[3] = 0; /* checksum */
>  
> -	/* start infoframe payload */
> -	ptr += HDMI_INFOFRAME_HEADER_SIZE;
> -
> -	ptr[0] = ((frame->coding_type & 0xf) << 4) | (channels & 0x7);
> -	ptr[1] = ((frame->sample_frequency & 0x7) << 2) |
> -		 (frame->sample_size & 0x3);
> -	ptr[2] = frame->coding_type_ext & 0x1f;
> -	ptr[3] = frame->channel_allocation;
> -	ptr[4] = (frame->level_shift_value & 0xf) << 3;
> -
> -	if (frame->downmix_inhibit)
> -		ptr[4] |= BIT(7);
> +	hdmi_audio_infoframe_pack_payload(frame,
> +					  ptr + HDMI_INFOFRAME_HEADER_SIZE);
>  
>  	hdmi_infoframe_set_checksum(buffer, length);
>  
> @@ -479,6 +485,51 @@ ssize_t hdmi_audio_infoframe_pack(struct hdmi_audio_infoframe *frame,
>  }
>  EXPORT_SYMBOL(hdmi_audio_infoframe_pack);
>  
> +/**
> + * hdmi_audio_infoframe_pack_for_dp - Pack a HDMI Audio infoframe for
> + *                                    displayport
> + *
> + * @frame HDMI Audio infoframe
> + * @header Header buffer to be used
> + * @header_size Size of header buffer
> + * @data Data buffer to be used
> + * @data_size Size of data buffer
> + * @dp_version Display Port version to be encoded in the header
> + *
> + * Packs a HDMI Audio Infoframe to be sent over Display Port. This function
> + * fills both header and data buffer with the required data.
> + *
> + * Return: Number of total written bytes or a negative errno on failure.
> + */
> +ssize_t hdmi_audio_infoframe_pack_for_dp(struct hdmi_audio_infoframe *frame,
> +					 void *header, size_t header_size,
> +					 void *data, size_t data_size,
> +					 u8 dp_version)
> +{
> +	int ret;
> +	u8 *hdr_ptr = header;
> +
> +	ret = hdmi_audio_infoframe_check(frame);
> +	if (ret)
> +		return ret;
> +
> +	if (header_size < 4 || data_size < frame->length)
> +		return -ENOSPC;
> +
> +	memset(header, 0, header_size);
> +	memset(data, 0, data_size);
> +
> +	// Secondary-data packet header
> +	hdr_ptr[1] = frame->type;
> +	hdr_ptr[2] = 0x1B;  // As documented by DP spec for Secondary-data Packets
Any constant we could use or define and use here?
Hard coding 0x1b is the less desireable option.

	Sam

> +	hdr_ptr[3] = (dp_version & 0x3f) << 2;
> +
> +	hdmi_audio_infoframe_pack_payload(frame, data);
> +
> +	return frame->length + 4;
> +}
> +EXPORT_SYMBOL(hdmi_audio_infoframe_pack_for_dp);
> +
>  /**
>   * hdmi_vendor_infoframe_init() - initialize an HDMI vendor infoframe
>   * @frame: HDMI vendor infoframe
> diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
> index c8ec982ff498..f576a0b08c85 100644
> --- a/include/linux/hdmi.h
> +++ b/include/linux/hdmi.h
> @@ -334,6 +334,10 @@ struct hdmi_audio_infoframe {
>  int hdmi_audio_infoframe_init(struct hdmi_audio_infoframe *frame);
>  ssize_t hdmi_audio_infoframe_pack(struct hdmi_audio_infoframe *frame,
>  				  void *buffer, size_t size);
> +ssize_t hdmi_audio_infoframe_pack_for_dp(struct hdmi_audio_infoframe *frame,
> +					 void *header, size_t header_size,
> +					 void *data, size_t data_size,
> +					 u8 dp_version);
>  ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
>  				       void *buffer, size_t size);
>  int hdmi_audio_infoframe_check(struct hdmi_audio_infoframe *frame);
> -- 
> 2.33.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
