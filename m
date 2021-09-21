Return-Path: <SRS0=xNtl=OL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6234C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Sep 2021 09:50:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A66C5600D3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Sep 2021 09:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A66C5600D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QyGGrRQX+tGrI4qTMRNevxCKRdpZapMekIbb4V7lNJE=; b=mDv8WfNq8oaWwR
	nj9uqUt6Hb7yK8EdccaUX/jlGLMEBXrdcCYCMzsMuWuXdS5AoAL6dQ1zvrJoK4V7NKJf7RifxMOS7
	cNr7n7YLQ28Mn1uJ16EDvRlJmKlvND9tn/uIxLXOyKpsYqgqwxtc5qzy+BKLOZqrAuhXR0tSRCHNx
	1W74XoV/+Cgoq+lRjGpKgjyDtXtlDGgaw4y0fjH54gAJY0jtVzW3leCqN9eV28dm7RCTTElP4GZEd
	EcacJmtbN6mSCASM6ajSJDzWY+J8Liihc6xP2LqQCLxXcugnqV6HQsfvB34b7wU+73pYXfJWsSO37
	tnFFbqkS8MVACwTiFyZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mScPQ-0044E2-A0; Tue, 21 Sep 2021 09:49:52 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mScPD-0044Bu-BH; Tue, 21 Sep 2021 09:49:40 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="245735163"
X-IronPort-AV: E=Sophos;i="5.85,310,1624345200"; d="scan'208";a="245735163"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 02:49:38 -0700
X-IronPort-AV: E=Sophos;i="5.85,310,1624345200"; d="scan'208";a="549418557"
Received: from unknown (HELO localhost) ([10.251.218.108])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 02:49:34 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH v2 3/6] drm/edid: Add cea_sad helpers for freq/length
In-Reply-To: <20210920084424.231825-4-msp@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210920084424.231825-1-msp@baylibre.com>
 <20210920084424.231825-4-msp@baylibre.com>
Date: Tue, 21 Sep 2021 12:49:31 +0300
Message-ID: <87mto6tg0k.fsf@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_024939_438851_0E1AD89C 
X-CRM114-Status: GOOD (  23.31  )
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

On Mon, 20 Sep 2021, Markus Schneider-Pargmann <msp@baylibre.com> wrote:
> This patch adds two helper functions that extract the frequency and word
> length from a struct cea_sad.
>
> For these helper functions new defines are added that help translate the
> 'freq' and 'byte2' fields into real numbers.
>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>
> Notes:
>     Changes v1 -> v2:
>     - Use const struct pointers.
>     - Add a check whether the format is actually uncompressed or not.
>
>  drivers/gpu/drm/drm_edid.c | 74 ++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_edid.h     | 18 ++++++++--
>  2 files changed, 90 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 6325877c5fd6..28df422fbc03 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4666,6 +4666,80 @@ int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb)
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
> +int drm_cea_sad_get_sample_rate(const struct cea_sad *sad)
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
> +static bool drm_cea_sad_is_uncompressed(const struct cea_sad *sad)
> +{
> +	switch (sad->format) {
> +	case HDMI_AUDIO_CODING_TYPE_STREAM:
> +	case HDMI_AUDIO_CODING_TYPE_PCM:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +/**
> + * drm_cea_sad_get_uncompressed_word_length - Extract word length
> + * @sad: Pointer to the cea_sad struct
> + *
> + * Extracts the cea_sad byte2 field and returns the word length for an
> + * uncompressed stream.
> + *
> + * Note: This function may only be called for uncompressed audio.
> + *
> + * Return: Word length in bits or a negative errno if parsing failed.
> + */
> +int drm_cea_sad_get_uncompressed_word_length(const struct cea_sad *sad)
> +{
> +	if (!drm_cea_sad_is_uncompressed(sad)) {
> +		DRM_WARN("Unable to get the uncompressed word length for a compressed format: %u\n",
> +			 sad->format);
> +		return -EINVAL;
> +	}
> +
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
> index deccfd39e6db..7b7d71a7154d 100644
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

I suggest adding DRM_ prefixes here.

BR,
Jani.

> +
>  struct drm_encoder;
>  struct drm_connector;
>  struct drm_connector_state;
> @@ -374,6 +386,8 @@ struct drm_display_mode;
>  
>  int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads);
>  int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb);
> +int drm_cea_sad_get_sample_rate(const struct cea_sad *sad);
> +int drm_cea_sad_get_uncompressed_word_length(const struct cea_sad *sad);
>  int drm_av_sync_delay(struct drm_connector *connector,
>  		      const struct drm_display_mode *mode);

-- 
Jani Nikula, Intel Open Source Graphics Center

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
