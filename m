Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC04C00140
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Aug 2022 06:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nir8zRQtJqQ4Wo+km5ez4xfHiBIhvwG0Vod/3Ig61E=; b=Qif8mRmapRvstCbANCvlF2n1X5
	meYnAngq66dl1xQdEKN3ffgCWKxj9No1+1o4BsHU0Z1+JO0I4XnXOtnxr7jp0o9NBK4vMTiFCDnlY
	dNeWFqPxoO5qDB7laJeHgVmbBgsY//rHF9ueeA3lmMktPHP69zoknUJts5jv0AJQO5BRp55KZBKmh
	P5O/y7KLc2Wtv1yTx71YOacNNcjWCv94qnHArYpL8TgwnemDGY9mWLdtK0frmN9I0S61BMHkJa8Zi
	4XoZXgeMC3qISPE/Iqi0GkTLb5GzIXyAYxVabueEnXE59b0bETUJL/Gjnv0OJiVZtIoVhnjKySTON
	bnvEazyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJrFV-00CbF1-O6; Fri, 05 Aug 2022 06:55:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJrFH-00Cb4k-Qk; Fri, 05 Aug 2022 06:55:45 +0000
X-UUID: 64b5cbfbeab14a24b195d943e38e2b6c-20220804
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:aa7dd3b7-3422-42f4-8813-160e1069e05a,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:fee8da9b-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 64b5cbfbeab14a24b195d943e38e2b6c-20220804
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1342078623; Thu, 04 Aug 2022 23:55:35 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 5 Aug 2022 14:54:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 5 Aug 2022 14:54:58 +0800
Message-ID: <ad9207524145fdc8338894be70228820f40a49d8.camel@mediatek.com>
Subject: Re: [PATCH v15 03/11] drm/edid: Add cea_sad helpers for freq/length
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <matthias.bgg@gmail.com>, <deller@gmx.de>,
	<airlied@linux.ie>
CC: <devicetree@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
	<granquet@baylibre.com>, <jitao.shi@mediatek.com>, <liangxu.xu@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<msp@baylibre.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <wenst@chromium.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<angelogioacchino.delregno@collabora.com>
Date: Fri, 5 Aug 2022 14:54:57 +0800
In-Reply-To: <87zggmenv8.fsf@intel.com>
References: <20220727045035.32225-1-rex-bc.chen@mediatek.com>
	 <20220727045035.32225-4-rex-bc.chen@mediatek.com>
	 <87zggmenv8.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_235543_913263_A315BC0C 
X-CRM114-Status: GOOD (  31.73  )
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

On Tue, 2022-08-02 at 17:11 +0300, Jani Nikula wrote:
> On Wed, 27 Jul 2022, Bo-Chen Chen <rex-bc.chen@mediatek.com> wrote:
> > From: Guillaume Ranquet <granquet@baylibre.com>
> > 
> > This patch adds two helper functions that extract the frequency and
> > word
> > length from a struct cea_sad.
> > 
> > For these helper functions new defines are added that help
> > translate the
> > 'freq' and 'byte2' fields into real numbers.
> 
> I think we should stop adding a plethora of functions that deal with
> sads like this.
> 
> There should probably be *one* struct that contains all the details
> you
> and everyone need extracted. There should be *one* function that
> fills
> in all the details. The struct should be placed in
> connector->display_info, and the function should be called *once*
> from
> update_display_info().
> 
> Ideally, the function shouldn't even be exposed from drm_edid.c, but
> if
> you still need to deal with situations where you don't call connector
> update, maybe it needs to be exposed.
> 
> BR,
> Jani.
> 
> 

Hello Jani,

Thanks for your review.
After checking our patches, we found we will not use these two function
because we remove them in patch [11/11] drm/mediatek: Use cached audio
config when changing resolution.

I will drop [02/11] and [03/11].

Thanks!

BRs,
Bo-Chen

> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >  drivers/gpu/drm/drm_edid.c | 63
> > ++++++++++++++++++++++++++++++++++++++
> >  include/drm/drm_edid.h     | 14 +++++++++
> >  2 files changed, 77 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_edid.c
> > b/drivers/gpu/drm/drm_edid.c
> > index bc43e1b32092..2a6f92da5ff3 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -4916,6 +4916,69 @@ int drm_edid_to_speaker_allocation(const
> > struct edid *edid, u8 **sadb)
> >  }
> >  EXPORT_SYMBOL(drm_edid_to_speaker_allocation);
> >  
> > +/**
> > + * drm_cea_sad_get_sample_rate - Extract the sample rate from
> > cea_sad
> > + * @sad: Pointer to the cea_sad struct
> > + *
> > + * Extracts the cea_sad frequency field and returns the sample
> > rate in Hz.
> > + *
> > + * Return: Sample rate in Hz or a negative errno if parsing
> > failed.
> > + */
> > +int drm_cea_sad_get_sample_rate(const struct cea_sad *sad)
> > +{
> > +	switch (sad->freq) {
> > +	case DRM_CEA_SAD_FREQ_32KHZ:
> > +		return 32000;
> > +	case DRM_CEA_SAD_FREQ_44KHZ:
> > +		return 44100;
> > +	case DRM_CEA_SAD_FREQ_48KHZ:
> > +		return 48000;
> > +	case DRM_CEA_SAD_FREQ_88KHZ:
> > +		return 88200;
> > +	case DRM_CEA_SAD_FREQ_96KHZ:
> > +		return 96000;
> > +	case DRM_CEA_SAD_FREQ_176KHZ:
> > +		return 176400;
> > +	case DRM_CEA_SAD_FREQ_192KHZ:
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
> > + * Extracts the cea_sad byte2 field and returns the word length
> > for an
> > + * uncompressed stream.
> > + *
> > + * Note: This function may only be called for uncompressed audio.
> > + *
> > + * Return: Word length in bits or a negative errno if parsing
> > failed.
> > + */
> > +int drm_cea_sad_get_uncompressed_word_length(const struct cea_sad
> > *sad)
> > +{
> > +	if (sad->format != HDMI_AUDIO_CODING_TYPE_PCM) {
> > +		DRM_WARN("Unable to get the uncompressed word length
> > for format: %u\n",
> > +			 sad->format);
> > +		return -EINVAL;
> > +	}
> > +
> > +	switch (sad->byte2) {
> > +	case DRM_CEA_SAD_UNCOMPRESSED_WORD_16BIT:
> > +		return 16;
> > +	case DRM_CEA_SAD_UNCOMPRESSED_WORD_20BIT:
> > +		return 20;
> > +	case DRM_CEA_SAD_UNCOMPRESSED_WORD_24BIT:
> > +		return 24;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +EXPORT_SYMBOL(drm_cea_sad_get_uncompressed_word_length);
> > +
> >  /**
> >   * drm_av_sync_delay - compute the HDMI/DP sink audio-video sync
> > delay
> >   * @connector: connector associated with the HDMI/DP sink
> > diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> > index c2c43a4af681..779b710aed40 100644
> > --- a/include/drm/drm_edid.h
> > +++ b/include/drm/drm_edid.h
> > @@ -373,6 +373,18 @@ struct cea_sad {
> >  	u8 byte2;
> >  };
> >  
> > +#define DRM_CEA_SAD_FREQ_32KHZ  BIT(0)
> > +#define DRM_CEA_SAD_FREQ_44KHZ  BIT(1)
> > +#define DRM_CEA_SAD_FREQ_48KHZ  BIT(2)
> > +#define DRM_CEA_SAD_FREQ_88KHZ  BIT(3)
> > +#define DRM_CEA_SAD_FREQ_96KHZ  BIT(4)
> > +#define DRM_CEA_SAD_FREQ_176KHZ BIT(5)
> > +#define DRM_CEA_SAD_FREQ_192KHZ BIT(6)
> > +
> > +#define DRM_CEA_SAD_UNCOMPRESSED_WORD_16BIT BIT(0)
> > +#define DRM_CEA_SAD_UNCOMPRESSED_WORD_20BIT BIT(1)
> > +#define DRM_CEA_SAD_UNCOMPRESSED_WORD_24BIT BIT(2)
> > +
> >  struct drm_encoder;
> >  struct drm_connector;
> >  struct drm_connector_state;
> > @@ -380,6 +392,8 @@ struct drm_display_mode;
> >  
> >  int drm_edid_to_sad(const struct edid *edid, struct cea_sad
> > **sads);
> >  int drm_edid_to_speaker_allocation(const struct edid *edid, u8
> > **sadb);
> > +int drm_cea_sad_get_sample_rate(const struct cea_sad *sad);
> > +int drm_cea_sad_get_uncompressed_word_length(const struct cea_sad
> > *sad);
> >  int drm_av_sync_delay(struct drm_connector *connector,
> >  		      const struct drm_display_mode *mode);
> 
> 


