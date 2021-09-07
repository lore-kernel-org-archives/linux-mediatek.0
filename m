Return-Path: <SRS0=gwp9=N5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F3BC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 07:38:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8A50610CB
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 07:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C8A50610CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xEY8CAW2R82gIP+JsVjHbqWCgTQ1RNNqXdXMohTc8iQ=; b=JfAzn3CMqnNRHc
	7Qu/Ej7IB1ZZ8Q090/hX0z/Uil5JCy/vtGPOMXhCI+aFBuD0R6IGLepvt2UEUvZD8XQheukSqCRlk
	NrQT/Tbu6yAftxAbicItDoQVx6VLDP98glqDLU8lMcWZ969HtAKLMTf/x+63q/eW8wOoXCtMqrYF0
	N2AiDzMMF0hO5TI2dQrZukQ7NO7egNVq/VF5L7LJZTWg7kkwLd3uo43z4a6jaCEl0VHEFywlJUQDk
	KUQn1Q3StVOxKhzkWbkmh4XiM+uweJ+Wre4OyM/5sRwYi/BAxQl4Z8/BKayiYfToy131yNXP7Z+5L
	k9XUrd8LMdSA0ec67u7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNVga-002kGp-M0; Tue, 07 Sep 2021 07:38:28 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNVgM-002kF3-TP
 for linux-mediatek@lists.infradead.org; Tue, 07 Sep 2021 07:38:16 +0000
Received: by mail-wr1-x42b.google.com with SMTP id x6so12937154wrv.13
 for <linux-mediatek@lists.infradead.org>; Tue, 07 Sep 2021 00:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8qwm7/emMNXXyeEed6Pu1tnRIxl5fkWRKm12F1bQs5U=;
 b=Adt3LoKid9pjlsUHd/GVQuY/zAKXcWxkvOxFbdHy77ep6BFkJpi2gDHSocyKXvAM9W
 eP9yfPNlANX0VoRDo7VIIrv8+62rpLB8QVm8M5B8DPXsPSNvyoc82AD7m1V58cEI1VZz
 7yR1dqBjWIRBMgrxb5I+UAzKAw2Tin7oKt1p5Fx1bFUvuSkgLu5y8G8sl5VAE60c8xQj
 yqvpKbwIhWAzD9QXsz/dQQjZmWMh0DPelun2GY0Cmpuzh59fRUsjDJRxRmUzLkmZ/pKl
 hOjFYSz+1W+HYS7L+hob7+q7x8lQ7ljvA9XcyHws3g6pu52Asj3m0OWoM3E16/6zgPxE
 yc0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8qwm7/emMNXXyeEed6Pu1tnRIxl5fkWRKm12F1bQs5U=;
 b=lNDNHcIehL7JZOf8+ZyxiZYk6588SMqpAe75EhXipOIujpLC6QnVw9nl/9mxzRyAAN
 mnT/CSzbAgjFXa2chKClNZ/FOGkgZzDezSb0AaXLyfsIz8tHU1WBVbhZuF9TZJt5POfY
 lS8yr9RddWZTLuc/YT/SKRv4s5t9XqU3lBrLoMGNPIgOgbkb10L+BBapgLrtLfwoOlgN
 WJr2VLKHSFqiuTcmQwsP9lYYCcq63lLzRVM9/uSJttSmGxdpO//C4zabYK7c5Da8Xvxo
 dwNYBszMvVsK8AESgGpxOihXzF8n0wTIvVbqrkp5KB/j/U5+5Hwk/w8NqDZO0ZF12tPA
 X3gg==
X-Gm-Message-State: AOAM533bTRFFRmmJC/9c30c5QGr5TP5TNojhszasulaPLUusSNkxWp8+
 PlBYauSBiPEIuswfS58PEBJr/ltEr4GeUw==
X-Google-Smtp-Source: ABdhPJwd8EVlWl6li4Wv/BlVhLOxLsdoqYOn1akqaEkKERYLSnux6cF/iFciUNMtifluNA4vDx39Fg==
X-Received: by 2002:a05:6000:18a:: with SMTP id
 p10mr16599470wrx.40.1631000292301; 
 Tue, 07 Sep 2021 00:38:12 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id j17sm10040775wrh.67.2021.09.07.00.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 00:38:11 -0700 (PDT)
Date: Tue, 7 Sep 2021 09:38:11 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 3/6] drm/edid: Add cea_sad helpers for freq/length
Message-ID: <20210907073811.becmcre7n5c4w72f@blmsp>
References: <20210906193529.718845-1-msp@baylibre.com>
 <20210906193529.718845-4-msp@baylibre.com>
 <YTZ3tJh2ZSLNQEMc@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YTZ3tJh2ZSLNQEMc@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_003814_980691_0A427B4C 
X-CRM114-Status: GOOD (  28.77  )
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

On Mon, Sep 06, 2021 at 10:19:00PM +0200, Sam Ravnborg wrote:
> Hi Markus,
> 
> On Mon, Sep 06, 2021 at 09:35:26PM +0200, Markus Schneider-Pargmann wrote:
> > This patch adds two helper functions that extract the frequency and word
> > length from a struct cea_sad.
> > 
> > For these helper functions new defines are added that help translate the
> > 'freq' and 'byte2' fields into real numbers.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> >  drivers/gpu/drm/drm_edid.c | 57 ++++++++++++++++++++++++++++++++++++++
> >  include/drm/drm_edid.h     | 18 ++++++++++--
> >  2 files changed, 73 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index 81d5f2524246..2389d34ce10e 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -4666,6 +4666,63 @@ int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb)
> >  }
> >  EXPORT_SYMBOL(drm_edid_to_speaker_allocation);
> >  
> > +/**
> > + * drm_cea_sad_get_sample_rate - Extract the sample rate from cea_sad
> > + * @sad: Pointer to the cea_sad struct
> > + *
> > + * Extracts the cea_sad frequency field and returns the sample rate in Hz.
> > + *
> > + * Return: Sample rate in Hz or a negative errno if parsing failed.
> > + */
> > +int drm_cea_sad_get_sample_rate(struct cea_sad *sad)
> 
> It would be nice to use const struct cea_sad *sad here.

Thanks, fixing it for the next version.

> 
> > +{
> > +	switch (sad->freq) {
> > +	case CEA_SAD_FREQ_32KHZ:
> > +		return 32000;
> > +	case CEA_SAD_FREQ_44KHZ:
> > +		return 44100;
> > +	case CEA_SAD_FREQ_48KHZ:
> > +		return 48000;
> > +	case CEA_SAD_FREQ_88KHZ:
> > +		return 88200;
> > +	case CEA_SAD_FREQ_96KHZ:
> > +		return 96000;
> > +	case CEA_SAD_FREQ_176KHZ:
> > +		return 176400;
> > +	case CEA_SAD_FREQ_192KHZ:
> > +		return 192000;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +EXPORT_SYMBOL(drm_cea_sad_get_sample_rate);
> > +
> > +/**
> > + * drm_cea_sad_get_uncompressed_word_length - Extract word length
> > + * @sad: Pointer to the cea_sad struct
> > + *
> > + * Extracts the cea_sad byte2 field and returns the word length for an
> > + * uncompressed stream.
> > + *
> > + * Note: This function may only be called for uncompressed audio.
> Can you check or this and WARN (or drm_WARN) if this is not the case?

Good idea, I added a check, a DRM_WARN and return -EINVAL now.

Thanks,
Markus

> 
> > + *
> > + * Return: Word length in bits or a negative errno if parsing failed.
> > + */
> > +int drm_cea_sad_get_uncompressed_word_length(struct cea_sad *sad)
> Again, consider to use const.
> 
> 	Sam
> 
> > +{
> > +	switch (sad->byte2) {
> > +	case CEA_SAD_UNCOMPRESSED_WORD_16BIT:
> > +		return 16;
> > +	case CEA_SAD_UNCOMPRESSED_WORD_20BIT:
> > +		return 20;
> > +	case CEA_SAD_UNCOMPRESSED_WORD_24BIT:
> > +		return 24;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +EXPORT_SYMBOL(drm_cea_sad_get_uncompressed_word_length);
> > +
> >  /**
> >   * drm_av_sync_delay - compute the HDMI/DP sink audio-video sync delay
> >   * @connector: connector associated with the HDMI/DP sink
> > diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> > index 759328a5eeb2..bed091a749ef 100644
> > --- a/include/drm/drm_edid.h
> > +++ b/include/drm/drm_edid.h
> > @@ -361,12 +361,24 @@ struct edid {
> >  
> >  /* Short Audio Descriptor */
> >  struct cea_sad {
> > -	u8 format;
> > +	u8 format; /* See HDMI_AUDIO_CODING_TYPE_* */
> >  	u8 channels; /* max number of channels - 1 */
> > -	u8 freq;
> > +	u8 freq; /* See CEA_SAD_FREQ_* */
> >  	u8 byte2; /* meaning depends on format */
> >  };
> >  
> > +#define CEA_SAD_FREQ_32KHZ  BIT(0)
> > +#define CEA_SAD_FREQ_44KHZ  BIT(1)
> > +#define CEA_SAD_FREQ_48KHZ  BIT(2)
> > +#define CEA_SAD_FREQ_88KHZ  BIT(3)
> > +#define CEA_SAD_FREQ_96KHZ  BIT(4)
> > +#define CEA_SAD_FREQ_176KHZ BIT(5)
> > +#define CEA_SAD_FREQ_192KHZ BIT(6)
> > +
> > +#define CEA_SAD_UNCOMPRESSED_WORD_16BIT BIT(0)
> > +#define CEA_SAD_UNCOMPRESSED_WORD_20BIT BIT(1)
> > +#define CEA_SAD_UNCOMPRESSED_WORD_24BIT BIT(2)
> > +
> >  struct drm_encoder;
> >  struct drm_connector;
> >  struct drm_connector_state;
> > @@ -374,6 +386,8 @@ struct drm_display_mode;
> >  
> >  int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads);
> >  int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb);
> > +int drm_cea_sad_get_sample_rate(struct cea_sad *sad);
> > +int drm_cea_sad_get_uncompressed_word_length(struct cea_sad *sad);
> >  int drm_av_sync_delay(struct drm_connector *connector,
> >  		      const struct drm_display_mode *mode);
> >  
> > -- 
> > 2.33.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
