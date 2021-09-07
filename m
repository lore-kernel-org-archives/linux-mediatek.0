Return-Path: <SRS0=gwp9=N5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D274AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 09:01:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C226610FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 09:01:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C226610FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O8Dlv9934+BytuXj5/JXWpTwdP6Fz1TsyFoUBZL+9Y0=; b=W2dvkRif1Xh5hI
	92t3p8ScTGxkxMNqesaFipAZYmxPu2UXk/0cWuq8tA8FcTi6CpKhSWWO0l7qjzuP/UGC9Nf0F2FB8
	rKuKWrz4PPv4aim4JtAfg13NACu48SD0CgLq21EX32LUs45IOvjYXhdMkb9Qkku08uta1quWp9UoS
	gZUXKY/w17VkDZewEFxUQf9d2NEcLx/8kPywKq1mV3tuuo/DevxiV+vCoCq2/pjHLJ1E3AuqH18Gz
	lKDDZi1P6Mys01FvGPhTgM+0bqeCSAQTJ4l0BiCM/GD/OVXy7ADdCU60j4Fq8m4wAeoNeH14Pj4EL
	ZbLbmz574GZHP4kom7AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNWyw-003288-1r; Tue, 07 Sep 2021 09:01:30 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNWwg-00311M-EN
 for linux-mediatek@lists.infradead.org; Tue, 07 Sep 2021 08:59:13 +0000
Received: by mail-wr1-x42c.google.com with SMTP id t18so2546245wrb.0
 for <linux-mediatek@lists.infradead.org>; Tue, 07 Sep 2021 01:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YLD42w7bSc5CqE7OSE2flIo4sFSt4/kkmRcZl24JohQ=;
 b=MnU3S3vHEHvcdJRp8S9yPHVxsdJ/CgrGUgnCCtD87Wi7n/Mo5r3sqZ6nyLa6xThMWt
 +NhxvKHAvtFqAIMC8/VKsqK+vZ4QmyIZoA3pfKy4WESLr0zM3V8rKtqxgvMbCDDG7SLH
 TEWpojL1aaA9HgrpfH5/oSqo+ELMXMrNf01gBC9Eb+ovwiLeGMhYl+wvE+uVHc5mEthd
 R82omlFKujYeiyYQrz5dHvdSnI/2C+5MEFQUTOFSyB/biQqe2KMRjT1SZC+V6zeninRB
 2o/xLQTjpI1xtlXvy8gT0T4OFS7askcaS/IISRlndqlaGV8wskl/mi1w5qEpcWfoUTwa
 mn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YLD42w7bSc5CqE7OSE2flIo4sFSt4/kkmRcZl24JohQ=;
 b=qgadM459vcnhGWaA3cHjySgeaJTmGwS/tTNinm45EaPu9uwNg9vm1RcoQGsAKeBauu
 6ZNM3nD3WsGUelFYYsxIA99Arh/tF6cDcC6Gc+4GQW8rmcs97WxZn0yn4deevWAjLQAe
 fQbDfuutsLposz0OisKdlvuSbojySJ3gi8BX0jPQi4GYPT/lVawQ3EpMPJ3FdFKXRQkq
 qyfF5LUNqd1BH7YXShHKnjrx25aa22UJ1xbSHiB9tbadeurRnYxq6St+iEJ4u0HTH7rx
 x6TcGYDZeG0zJnV41MgCl2zfKlJbS4aTGmeH2SUPyVJvIIS8Sl4UEDFbGpuXoudnH8Dr
 y32Q==
X-Gm-Message-State: AOAM5315ZjR5Y00yJQyVUlU2jui4eEtevjdZsYx5B0GKvzmRD97KkDcx
 DqC2fhJwRAHUCwMpKcFq9iO6Cw==
X-Google-Smtp-Source: ABdhPJz9h7dVuC+1ZsWrhTh/RBFL3Ddlu1dPaIn211/rd/FhHaN3lezcEz5I4fzycnHO7DSQBIsmTw==
X-Received: by 2002:adf:cf05:: with SMTP id o5mr17256566wrj.270.1631005148747; 
 Tue, 07 Sep 2021 01:59:08 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id l7sm1806773wmj.9.2021.09.07.01.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 01:59:08 -0700 (PDT)
Date: Tue, 7 Sep 2021 10:59:07 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 4/6] video/hdmi: Add audio_infoframe packing for DP
Message-ID: <20210907085907.aefskkspajero4eg@blmsp>
References: <20210906193529.718845-1-msp@baylibre.com>
 <20210906193529.718845-5-msp@baylibre.com>
 <YTZ6YvifP0EqGBzR@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YTZ6YvifP0EqGBzR@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_015910_575823_4B9C01C9 
X-CRM114-Status: GOOD (  34.23  )
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

Hi Sam,

On Mon, Sep 06, 2021 at 10:30:26PM +0200, Sam Ravnborg wrote:
> Hi Markus,
> 
> On Mon, Sep 06, 2021 at 09:35:27PM +0200, Markus Schneider-Pargmann wrote:
> > Similar to HDMI, DP uses audio infoframes as well which are structured
> > very similar to the HDMI ones.
> > 
> > This patch adds a helper function to pack the HDMI audio infoframe for
> > DP, called hdmi_audio_infoframe_pack_for_dp().
> > hdmi_audio_infoframe_pack_only() is split into two parts. One of them
> > packs the payload only and can be used for HDMI and DP.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> >  drivers/video/hdmi.c | 87 +++++++++++++++++++++++++++++++++++---------
> >  include/linux/hdmi.h |  4 ++
> >  2 files changed, 73 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
> > index 947be761dfa4..59c4341549e4 100644
> > --- a/drivers/video/hdmi.c
> > +++ b/drivers/video/hdmi.c
> > @@ -387,6 +387,28 @@ int hdmi_audio_infoframe_check(struct hdmi_audio_infoframe *frame)
> >  }
> >  EXPORT_SYMBOL(hdmi_audio_infoframe_check);
> >  
> > +static void
> > +hdmi_audio_infoframe_pack_payload(const struct hdmi_audio_infoframe *frame,
> > +				  u8 *buffer)
> > +{
> > +	u8 channels;
> > +
> > +	if (frame->channels >= 2)
> > +		channels = frame->channels - 1;
> > +	else
> > +		channels = 0;
> > +
> > +	buffer[0] = ((frame->coding_type & 0xf) << 4) | (channels & 0x7);
> > +	buffer[1] = ((frame->sample_frequency & 0x7) << 2) |
> > +		 (frame->sample_size & 0x3);
> > +	buffer[2] = frame->coding_type_ext & 0x1f;
> > +	buffer[3] = frame->channel_allocation;
> > +	buffer[4] = (frame->level_shift_value & 0xf) << 3;
> > +
> > +	if (frame->downmix_inhibit)
> > +		buffer[4] |= BIT(7);
> > +}
> > +
> >  /**
> >   * hdmi_audio_infoframe_pack_only() - write HDMI audio infoframe to binary buffer
> >   * @frame: HDMI audio infoframe
> > @@ -404,7 +426,6 @@ EXPORT_SYMBOL(hdmi_audio_infoframe_check);
> >  ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
> >  				       void *buffer, size_t size)
> >  {
> > -	unsigned char channels;
> >  	u8 *ptr = buffer;
> >  	size_t length;
> >  	int ret;
> > @@ -420,28 +441,13 @@ ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
> >  
> >  	memset(buffer, 0, size);
> >  
> > -	if (frame->channels >= 2)
> > -		channels = frame->channels - 1;
> > -	else
> > -		channels = 0;
> > -
> >  	ptr[0] = frame->type;
> >  	ptr[1] = frame->version;
> >  	ptr[2] = frame->length;
> >  	ptr[3] = 0; /* checksum */
> >  
> > -	/* start infoframe payload */
> > -	ptr += HDMI_INFOFRAME_HEADER_SIZE;
> > -
> > -	ptr[0] = ((frame->coding_type & 0xf) << 4) | (channels & 0x7);
> > -	ptr[1] = ((frame->sample_frequency & 0x7) << 2) |
> > -		 (frame->sample_size & 0x3);
> > -	ptr[2] = frame->coding_type_ext & 0x1f;
> > -	ptr[3] = frame->channel_allocation;
> > -	ptr[4] = (frame->level_shift_value & 0xf) << 3;
> > -
> > -	if (frame->downmix_inhibit)
> > -		ptr[4] |= BIT(7);
> > +	hdmi_audio_infoframe_pack_payload(frame,
> > +					  ptr + HDMI_INFOFRAME_HEADER_SIZE);
> >  
> >  	hdmi_infoframe_set_checksum(buffer, length);
> >  
> > @@ -479,6 +485,51 @@ ssize_t hdmi_audio_infoframe_pack(struct hdmi_audio_infoframe *frame,
> >  }
> >  EXPORT_SYMBOL(hdmi_audio_infoframe_pack);
> >  
> > +/**
> > + * hdmi_audio_infoframe_pack_for_dp - Pack a HDMI Audio infoframe for
> > + *                                    displayport
> > + *
> > + * @frame HDMI Audio infoframe
> > + * @header Header buffer to be used
> > + * @header_size Size of header buffer
> > + * @data Data buffer to be used
> > + * @data_size Size of data buffer
> > + * @dp_version Display Port version to be encoded in the header
> > + *
> > + * Packs a HDMI Audio Infoframe to be sent over Display Port. This function
> > + * fills both header and data buffer with the required data.
> > + *
> > + * Return: Number of total written bytes or a negative errno on failure.
> > + */
> > +ssize_t hdmi_audio_infoframe_pack_for_dp(struct hdmi_audio_infoframe *frame,
> > +					 void *header, size_t header_size,
> > +					 void *data, size_t data_size,
> > +					 u8 dp_version)
> > +{
> > +	int ret;
> > +	u8 *hdr_ptr = header;
> > +
> > +	ret = hdmi_audio_infoframe_check(frame);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (header_size < 4 || data_size < frame->length)
> > +		return -ENOSPC;
> > +
> > +	memset(header, 0, header_size);
> > +	memset(data, 0, data_size);
> > +
> > +	// Secondary-data packet header
> > +	hdr_ptr[1] = frame->type;
> > +	hdr_ptr[2] = 0x1B;  // As documented by DP spec for Secondary-data Packets
> Any constant we could use or define and use here?
> Hard coding 0x1b is the less desireable option.

I couldn't find a constant for this, but I will add one.

Also thanks to looking for these defines, I found a struct dp_sdp that
could be used instead of the header and data pointers which I would
prefer, so I will fix that for the next version.

Thanks for your feedback.

Best,
Markus

> 
> 	Sam
> 
> > +	hdr_ptr[3] = (dp_version & 0x3f) << 2;
> > +
> > +	hdmi_audio_infoframe_pack_payload(frame, data);
> > +
> > +	return frame->length + 4;
> > +}
> > +EXPORT_SYMBOL(hdmi_audio_infoframe_pack_for_dp);
> > +
> >  /**
> >   * hdmi_vendor_infoframe_init() - initialize an HDMI vendor infoframe
> >   * @frame: HDMI vendor infoframe
> > diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
> > index c8ec982ff498..f576a0b08c85 100644
> > --- a/include/linux/hdmi.h
> > +++ b/include/linux/hdmi.h
> > @@ -334,6 +334,10 @@ struct hdmi_audio_infoframe {
> >  int hdmi_audio_infoframe_init(struct hdmi_audio_infoframe *frame);
> >  ssize_t hdmi_audio_infoframe_pack(struct hdmi_audio_infoframe *frame,
> >  				  void *buffer, size_t size);
> > +ssize_t hdmi_audio_infoframe_pack_for_dp(struct hdmi_audio_infoframe *frame,
> > +					 void *header, size_t header_size,
> > +					 void *data, size_t data_size,
> > +					 u8 dp_version);
> >  ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
> >  				       void *buffer, size_t size);
> >  int hdmi_audio_infoframe_check(struct hdmi_audio_infoframe *frame);
> > -- 
> > 2.33.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
