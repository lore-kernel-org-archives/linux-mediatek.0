Return-Path: <SRS0=cnxW=N4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BEA4C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 20:19:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2C6E61076
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 20:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D2C6E61076
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dMHB1X1W7K2HoklUevOPVNiFTZEHyM20a+fNWhzVs9U=; b=qgpej6LPcajbai
	faFfPdCk+atJbPISeJyywjVgy5iB2ZLKPxyjBTbP/Il3c+GxY1O1aMaKtl+QUOs9QGIG0A8PPtjGL
	7tsWHJrHnZUcEOFvrNoCQDqV0HIA9PVqBuAGLX58AyfSrxkgJLhcTZ+ati22H9jA5rY/nEzRC6HaY
	T75dNxu5a8PSEHEpHtE/dbbjxYXwl0K9C6RwoFELmOd1fDhAEisjy9+2XQSz4bjUrJNRmIMLIFq7z
	dY0CidYgo6ZHNIIRcMFlSbmQaEp8hh53KeDL2YPxGwvSqM5zTW+OQnyBDju4Ye6/+uVSGkKY6hfJH
	VpyMG3Ov6JJFt7eH2cSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNL5L-001seb-Op; Mon, 06 Sep 2021 20:19:19 +0000
Received: from mx2.smtp.larsendata.com ([91.221.196.228])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNL56-001sWL-8t
 for linux-mediatek@lists.infradead.org; Mon, 06 Sep 2021 20:19:07 +0000
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id a5e2fe20-0f4f-11ec-9416-0050568cd888;
 Mon, 06 Sep 2021 20:18:50 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 312A1194CF3;
 Mon,  6 Sep 2021 22:18:53 +0200 (CEST)
Date: Mon, 6 Sep 2021 22:19:00 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 3/6] drm/edid: Add cea_sad helpers for freq/length
Message-ID: <YTZ3tJh2ZSLNQEMc@ravnborg.org>
References: <20210906193529.718845-1-msp@baylibre.com>
 <20210906193529.718845-4-msp@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210906193529.718845-4-msp@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_131904_650975_1DDCB6F4 
X-CRM114-Status: GOOD (  25.81  )
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

On Mon, Sep 06, 2021 at 09:35:26PM +0200, Markus Schneider-Pargmann wrote:
> This patch adds two helper functions that extract the frequency and word
> length from a struct cea_sad.
> 
> For these helper functions new defines are added that help translate the
> 'freq' and 'byte2' fields into real numbers.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 57 ++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_edid.h     | 18 ++++++++++--
>  2 files changed, 73 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 81d5f2524246..2389d34ce10e 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4666,6 +4666,63 @@ int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb)
>  }
>  EXPORT_SYMBOL(drm_edid_to_speaker_allocation);
>  
> +/**
> + * drm_cea_sad_get_sample_rate - Extract the sample rate from cea_sad
> + * @sad: Pointer to the cea_sad struct
> + *
> + * Extracts the cea_sad frequency field and returns the sample rate in Hz.
> + *
> + * Return: Sample rate in Hz or a negative errno if parsing failed.
> + */
> +int drm_cea_sad_get_sample_rate(struct cea_sad *sad)

It would be nice to use const struct cea_sad *sad here.

> +{
> +	switch (sad->freq) {
> +	case CEA_SAD_FREQ_32KHZ:
> +		return 32000;
> +	case CEA_SAD_FREQ_44KHZ:
> +		return 44100;
> +	case CEA_SAD_FREQ_48KHZ:
> +		return 48000;
> +	case CEA_SAD_FREQ_88KHZ:
> +		return 88200;
> +	case CEA_SAD_FREQ_96KHZ:
> +		return 96000;
> +	case CEA_SAD_FREQ_176KHZ:
> +		return 176400;
> +	case CEA_SAD_FREQ_192KHZ:
> +		return 192000;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +EXPORT_SYMBOL(drm_cea_sad_get_sample_rate);
> +
> +/**
> + * drm_cea_sad_get_uncompressed_word_length - Extract word length
> + * @sad: Pointer to the cea_sad struct
> + *
> + * Extracts the cea_sad byte2 field and returns the word length for an
> + * uncompressed stream.
> + *
> + * Note: This function may only be called for uncompressed audio.
Can you check or this and WARN (or drm_WARN) if this is not the case?

> + *
> + * Return: Word length in bits or a negative errno if parsing failed.
> + */
> +int drm_cea_sad_get_uncompressed_word_length(struct cea_sad *sad)
Again, consider to use const.

	Sam

> +{
> +	switch (sad->byte2) {
> +	case CEA_SAD_UNCOMPRESSED_WORD_16BIT:
> +		return 16;
> +	case CEA_SAD_UNCOMPRESSED_WORD_20BIT:
> +		return 20;
> +	case CEA_SAD_UNCOMPRESSED_WORD_24BIT:
> +		return 24;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +EXPORT_SYMBOL(drm_cea_sad_get_uncompressed_word_length);
> +
>  /**
>   * drm_av_sync_delay - compute the HDMI/DP sink audio-video sync delay
>   * @connector: connector associated with the HDMI/DP sink
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 759328a5eeb2..bed091a749ef 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -361,12 +361,24 @@ struct edid {
>  
>  /* Short Audio Descriptor */
>  struct cea_sad {
> -	u8 format;
> +	u8 format; /* See HDMI_AUDIO_CODING_TYPE_* */
>  	u8 channels; /* max number of channels - 1 */
> -	u8 freq;
> +	u8 freq; /* See CEA_SAD_FREQ_* */
>  	u8 byte2; /* meaning depends on format */
>  };
>  
> +#define CEA_SAD_FREQ_32KHZ  BIT(0)
> +#define CEA_SAD_FREQ_44KHZ  BIT(1)
> +#define CEA_SAD_FREQ_48KHZ  BIT(2)
> +#define CEA_SAD_FREQ_88KHZ  BIT(3)
> +#define CEA_SAD_FREQ_96KHZ  BIT(4)
> +#define CEA_SAD_FREQ_176KHZ BIT(5)
> +#define CEA_SAD_FREQ_192KHZ BIT(6)
> +
> +#define CEA_SAD_UNCOMPRESSED_WORD_16BIT BIT(0)
> +#define CEA_SAD_UNCOMPRESSED_WORD_20BIT BIT(1)
> +#define CEA_SAD_UNCOMPRESSED_WORD_24BIT BIT(2)
> +
>  struct drm_encoder;
>  struct drm_connector;
>  struct drm_connector_state;
> @@ -374,6 +386,8 @@ struct drm_display_mode;
>  
>  int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads);
>  int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb);
> +int drm_cea_sad_get_sample_rate(struct cea_sad *sad);
> +int drm_cea_sad_get_uncompressed_word_length(struct cea_sad *sad);
>  int drm_av_sync_delay(struct drm_connector *connector,
>  		      const struct drm_display_mode *mode);
>  
> -- 
> 2.33.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
