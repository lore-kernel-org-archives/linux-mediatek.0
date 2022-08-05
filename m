Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7596CC25B0C
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Aug 2022 07:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FA1LjvHRwy6ak5UAFIRVvHYktUUwaTM/bfqv65egCcc=; b=z/hLc9QZYZqV8WoFEEeDR4qQqF
	pfWx9g59XIA2pYaIj3rMS+RMR4RAeaypuIP3XWApfS6EegldwIxfXrq6HGnzke9Ys4EF8Xg6zVc43
	6XK/traurexeLf1EmZwMKxcgKr4ZhJEftAm1QdVSI5arEmRNOCe8d+M/SQ+J9V1ZSNzV5WRgPAZjW
	/HlzpwtbnsBoXLpciwcdW0ylpt/KkxqlN607KY57tAP5qmgyjjWBw1JiEkIOcFOv+7h7808+wCXIf
	oCnsH5wa+ikRNtHTzzghPLnzF4MMa4P7WgI/YAwpvg6OJU8dsZTy9bsW15ENt2WaQuNYiM8FfF1zR
	C9BMPrkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJsAO-00D0ti-6k; Fri, 05 Aug 2022 07:54:44 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJsAL-00D0r7-62; Fri, 05 Aug 2022 07:54:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659686081; x=1691222081;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=D8hWW0KfUk2whtu9PV8gqGxUs6bf9AOiJj3yV0bOczI=;
  b=JOGLNKF8qOI3fmwyMUils9xwCm+24kyAO2PpKCPEd7w/lb8QnndHtHiS
   VbwgSWAIpEFfSv6rQ/HFx2kGUAxhwj8Yn+uj+YZOyWFrFXz2pWRTumUnr
   itmhMnNuE0+qjkp2hHkffSu3w0qn1YVgC2i/rqDaq8aIkuhEDLPFaxCGU
   eWpewcGX2ASN1cQDSfAelD5ofSxwQzURqdAHILQzRmMRbenSg1inbN3xh
   GRwssLrpL0K6XU7C9yeZ5tNGdEof1zooRbmzRDjDrgm03m1J3P1Xwi8TK
   lWLZE4TLZQnnnuZrh/fUSue7CXgcz6kV4rBf6kwQiYJy8iO3vGcDou3mK
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10429"; a="290157673"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="290157673"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2022 00:54:37 -0700
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="662893834"
Received: from jevargas-mobl3.amr.corp.intel.com (HELO localhost) ([10.252.32.116])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2022 00:54:30 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org,
 tzimmermann@suse.de, matthias.bgg@gmail.com, deller@gmx.de,
 airlied@linux.ie
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v15 03/11] drm/edid: Add cea_sad helpers for freq/length
In-Reply-To: <ad9207524145fdc8338894be70228820f40a49d8.camel@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220727045035.32225-1-rex-bc.chen@mediatek.com>
 <20220727045035.32225-4-rex-bc.chen@mediatek.com>
 <87zggmenv8.fsf@intel.com>
 <ad9207524145fdc8338894be70228820f40a49d8.camel@mediatek.com>
Date: Fri, 05 Aug 2022 10:54:26 +0300
Message-ID: <87mtcjnn0t.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_005441_325285_C5E1A42A 
X-CRM114-Status: GOOD (  27.76  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 05 Aug 2022, Rex-BC Chen <rex-bc.chen@mediatek.com> wrote:
> On Tue, 2022-08-02 at 17:11 +0300, Jani Nikula wrote:
>> On Wed, 27 Jul 2022, Bo-Chen Chen <rex-bc.chen@mediatek.com> wrote:
>> > From: Guillaume Ranquet <granquet@baylibre.com>
>> > 
>> > This patch adds two helper functions that extract the frequency and
>> > word
>> > length from a struct cea_sad.
>> > 
>> > For these helper functions new defines are added that help
>> > translate the
>> > 'freq' and 'byte2' fields into real numbers.
>> 
>> I think we should stop adding a plethora of functions that deal with
>> sads like this.
>> 
>> There should probably be *one* struct that contains all the details
>> you
>> and everyone need extracted. There should be *one* function that
>> fills
>> in all the details. The struct should be placed in
>> connector->display_info, and the function should be called *once*
>> from
>> update_display_info().
>> 
>> Ideally, the function shouldn't even be exposed from drm_edid.c, but
>> if
>> you still need to deal with situations where you don't call connector
>> update, maybe it needs to be exposed.
>> 
>> BR,
>> Jani.
>> 
>> 
>
> Hello Jani,
>
> Thanks for your review.
> After checking our patches, we found we will not use these two function
> because we remove them in patch [11/11] drm/mediatek: Use cached audio
> config when changing resolution.
>
> I will drop [02/11] and [03/11].
>
> Thanks!

Thank you too! :)

BR,
Jani.


>
> BRs,
> Bo-Chen
>
>> > 
>> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
>> > ---
>> >  drivers/gpu/drm/drm_edid.c | 63
>> > ++++++++++++++++++++++++++++++++++++++
>> >  include/drm/drm_edid.h     | 14 +++++++++
>> >  2 files changed, 77 insertions(+)
>> > 
>> > diff --git a/drivers/gpu/drm/drm_edid.c
>> > b/drivers/gpu/drm/drm_edid.c
>> > index bc43e1b32092..2a6f92da5ff3 100644
>> > --- a/drivers/gpu/drm/drm_edid.c
>> > +++ b/drivers/gpu/drm/drm_edid.c
>> > @@ -4916,6 +4916,69 @@ int drm_edid_to_speaker_allocation(const
>> > struct edid *edid, u8 **sadb)
>> >  }
>> >  EXPORT_SYMBOL(drm_edid_to_speaker_allocation);
>> >  
>> > +/**
>> > + * drm_cea_sad_get_sample_rate - Extract the sample rate from
>> > cea_sad
>> > + * @sad: Pointer to the cea_sad struct
>> > + *
>> > + * Extracts the cea_sad frequency field and returns the sample
>> > rate in Hz.
>> > + *
>> > + * Return: Sample rate in Hz or a negative errno if parsing
>> > failed.
>> > + */
>> > +int drm_cea_sad_get_sample_rate(const struct cea_sad *sad)
>> > +{
>> > +	switch (sad->freq) {
>> > +	case DRM_CEA_SAD_FREQ_32KHZ:
>> > +		return 32000;
>> > +	case DRM_CEA_SAD_FREQ_44KHZ:
>> > +		return 44100;
>> > +	case DRM_CEA_SAD_FREQ_48KHZ:
>> > +		return 48000;
>> > +	case DRM_CEA_SAD_FREQ_88KHZ:
>> > +		return 88200;
>> > +	case DRM_CEA_SAD_FREQ_96KHZ:
>> > +		return 96000;
>> > +	case DRM_CEA_SAD_FREQ_176KHZ:
>> > +		return 176400;
>> > +	case DRM_CEA_SAD_FREQ_192KHZ:
>> > +		return 192000;
>> > +	default:
>> > +		return -EINVAL;
>> > +	}
>> > +}
>> > +EXPORT_SYMBOL(drm_cea_sad_get_sample_rate);
>> > +
>> > +/**
>> > + * drm_cea_sad_get_uncompressed_word_length - Extract word length
>> > + * @sad: Pointer to the cea_sad struct
>> > + *
>> > + * Extracts the cea_sad byte2 field and returns the word length
>> > for an
>> > + * uncompressed stream.
>> > + *
>> > + * Note: This function may only be called for uncompressed audio.
>> > + *
>> > + * Return: Word length in bits or a negative errno if parsing
>> > failed.
>> > + */
>> > +int drm_cea_sad_get_uncompressed_word_length(const struct cea_sad
>> > *sad)
>> > +{
>> > +	if (sad->format != HDMI_AUDIO_CODING_TYPE_PCM) {
>> > +		DRM_WARN("Unable to get the uncompressed word length
>> > for format: %u\n",
>> > +			 sad->format);
>> > +		return -EINVAL;
>> > +	}
>> > +
>> > +	switch (sad->byte2) {
>> > +	case DRM_CEA_SAD_UNCOMPRESSED_WORD_16BIT:
>> > +		return 16;
>> > +	case DRM_CEA_SAD_UNCOMPRESSED_WORD_20BIT:
>> > +		return 20;
>> > +	case DRM_CEA_SAD_UNCOMPRESSED_WORD_24BIT:
>> > +		return 24;
>> > +	default:
>> > +		return -EINVAL;
>> > +	}
>> > +}
>> > +EXPORT_SYMBOL(drm_cea_sad_get_uncompressed_word_length);
>> > +
>> >  /**
>> >   * drm_av_sync_delay - compute the HDMI/DP sink audio-video sync
>> > delay
>> >   * @connector: connector associated with the HDMI/DP sink
>> > diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
>> > index c2c43a4af681..779b710aed40 100644
>> > --- a/include/drm/drm_edid.h
>> > +++ b/include/drm/drm_edid.h
>> > @@ -373,6 +373,18 @@ struct cea_sad {
>> >  	u8 byte2;
>> >  };
>> >  
>> > +#define DRM_CEA_SAD_FREQ_32KHZ  BIT(0)
>> > +#define DRM_CEA_SAD_FREQ_44KHZ  BIT(1)
>> > +#define DRM_CEA_SAD_FREQ_48KHZ  BIT(2)
>> > +#define DRM_CEA_SAD_FREQ_88KHZ  BIT(3)
>> > +#define DRM_CEA_SAD_FREQ_96KHZ  BIT(4)
>> > +#define DRM_CEA_SAD_FREQ_176KHZ BIT(5)
>> > +#define DRM_CEA_SAD_FREQ_192KHZ BIT(6)
>> > +
>> > +#define DRM_CEA_SAD_UNCOMPRESSED_WORD_16BIT BIT(0)
>> > +#define DRM_CEA_SAD_UNCOMPRESSED_WORD_20BIT BIT(1)
>> > +#define DRM_CEA_SAD_UNCOMPRESSED_WORD_24BIT BIT(2)
>> > +
>> >  struct drm_encoder;
>> >  struct drm_connector;
>> >  struct drm_connector_state;
>> > @@ -380,6 +392,8 @@ struct drm_display_mode;
>> >  
>> >  int drm_edid_to_sad(const struct edid *edid, struct cea_sad
>> > **sads);
>> >  int drm_edid_to_speaker_allocation(const struct edid *edid, u8
>> > **sadb);
>> > +int drm_cea_sad_get_sample_rate(const struct cea_sad *sad);
>> > +int drm_cea_sad_get_uncompressed_word_length(const struct cea_sad
>> > *sad);
>> >  int drm_av_sync_delay(struct drm_connector *connector,
>> >  		      const struct drm_display_mode *mode);
>> 
>> 
>

-- 
Jani Nikula, Intel Open Source Graphics Center

