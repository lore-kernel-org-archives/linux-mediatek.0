Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB9EE7716D
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2024 13:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2Jxa49+lF4JxHiGnW6UzqLVnsE/QayBWcQoJh8S91E=; b=xoCcUQHC2Y0AIMblaqeO7csIKO
	KY+fvgQDRxYX16+zCdfvel6gOhqcXbqv72R9AoibRymjA4/U4lJdHVTlvPs0aOCdzww2GZm/yAJF/
	dmq0RRCnNUWRNBMGx9ymCnbmLwuOAUwBZM/tkdunFcl6/IwNoK9iXZ26brEZt5wW5CGPMbbowZEvP
	O/ZidcMNBlwfmlwbyYatb92aX+vpsjIO0A1dGys8+9hgXMAbABWJUPcpRSNS0UqU1MEopHnisLyIl
	iiSNbgOvg1QHmSPqTj3MsZ5wpaGLLiWZ+Gskl6jnpct8msCR6raTUrJ6MXpNrjH1NOrtP/D2kxSFY
	+N5GpjGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBSj-0000000G3C3-2jI2;
	Thu, 05 Dec 2024 13:00:09 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBPh-0000000G2Gc-1Vnc
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Dec 2024 12:57:02 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-53df1d1b726so897139e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Dec 2024 04:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733403419; x=1734008219; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s2Jxa49+lF4JxHiGnW6UzqLVnsE/QayBWcQoJh8S91E=;
        b=ChHuTmXGO/o9993It/OthHgisER7xILvuN70nSnD+wEAYX467lBXt++yraBeTYsA6s
         y4eS0BTpeaKaoYkSkE5GYbjcpzS6vPkhSf4NarZzwISlRQqn2JTY65eFj/P01lu9yjU3
         N/IexDYmryUnCfQsMVjgCO1fEFLRH/shaSXgfAtmQfFAPfkb5K3FleJ0HV/396wNPd79
         WpNIXpZrVG0m4GmRV9pR9K3ycv/ybViR14SsHZ85HQ6IZCpMCYmbkdGw66IncQlPLNi7
         NbML23SSElyoPovVWaN36BsJoZFa/YZ7LBZQJORGipuloKEzhdzpHNuSilXnPspDq4dI
         xPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733403419; x=1734008219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2Jxa49+lF4JxHiGnW6UzqLVnsE/QayBWcQoJh8S91E=;
        b=aCGroMK2WGTubnyDBEipq6svnTHvMIxhRLMfQzsQAmLF5ysoW8XYdTPRR5/tNxJhnk
         b4fYZJ07v+Abt3gJ22fbJdcbQQKSp3s2J6hMPJLsL/QpRr1ik7GUSbPIRG0oyjlx4DOq
         w6G7Qm4w0sRDKGJVR38fzFU6S7v0LkYKCr4zgGvWE7U7TzLqvMq48OpaPbSirSQO9c5Y
         Pri1u5Gt/BSw8Xz5MPjsxBCLM4ExFhWQu+0sQ8JGiEHDLeacsaGPPFPsZT9oDdc32e27
         WyCDPIi9q3SabEUZA7qrSm99EbwTSJXB82SP1tPjRAldIFkGK5Iu2fhu3NzHHHnr80n5
         4q7w==
X-Forwarded-Encrypted: i=1; AJvYcCXOzN4qOqte6N3fn8A+PnrlJw5N38gpWBJyCxdFMVf7XviOTblF138Egz9IyMu3kihg8GEsFNU2iuD1Hr6SPA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTET74YS/CztiUv+XWwLBb3vOaWXblwcdT78fuVLx3SI12dWj1
	Bny3oyoB0fiWZJZ2BZFatQ4spdpBLvqp8khyAp0LoDAVbkjd4N8ql9UYw2g/mYk=
X-Gm-Gg: ASbGncsaqVhB6zcjzpPagS0zEiqxqFrDxgcd+ybkLAtOrFjx8WXCR8MLGfQIcKIMh6i
	5/AGUnPg7tO5ZNyoXDkyHmNCJi0Vt96tqf/m+3NEqVrGHDdMXLT7SQpyN6BbhWXYpBHYl0uhdME
	e2D5dTnFTRREnBBJKIQMoPMXVFde318AeC54FkDTr9uPsvaSkEc1XQ+20H0ExPEU3P4Lm6YBLUH
	YM6Ht1teNI8LtJYBns1DZn8EQ82Mb9UTYnand4yQVL7fH/sJPjcWz8OUSWibAkz1Km9SbrVNuLG
	vDO1IwZQvU8rIy+2EM8eXywpIlf9jA==
X-Google-Smtp-Source: AGHT+IFxozV5yADLSZdT2aZmMAmC3YLc8oyR/mmxvGNOEAUjKfoe1x86CuOyh23J/0TyZbHiXn/ilw==
X-Received: by 2002:ac2:51d3:0:b0:53e:1c3d:d0c5 with SMTP id 2adb3069b0e04-53e1c3dd10cmr3218316e87.28.1733403419364;
        Thu, 05 Dec 2024 04:56:59 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229751fcsm237413e87.87.2024.12.05.04.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 04:56:58 -0800 (PST)
Date: Thu, 5 Dec 2024 14:56:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com, jie.qiu@mediatek.com, 
	junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 12/15] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
Message-ID: <uhcl2ypz3xmari73xl3l4klu2ucfkfkuj7bt3dz35hfmuzvvkj@5odvmmhivl54>
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
 <20241205114518.53527-13-angelogioacchino.delregno@collabora.com>
 <olxtqto5mbgofxg4iqjvsmpxxzz6zoj7pbwmoeklhfjiavqfvv@dyveek7hgtki>
 <f2862790-f613-4583-bec5-302e06c77d8d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2862790-f613-4583-bec5-302e06c77d8d@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_045701_391090_9F348EE0 
X-CRM114-Status: GOOD (  30.71  )
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

On Thu, Dec 05, 2024 at 01:36:18PM +0100, AngeloGioacchino Del Regno wrote:
> Il 05/12/24 13:29, Dmitry Baryshkov ha scritto:
> > On Thu, Dec 05, 2024 at 12:45:14PM +0100, AngeloGioacchino Del Regno wrote:
> > > In preparation for adding a new driver for the HDMI TX v2 IP,
> > > split out the functions that will be common between the already
> > > present mtk_hdmi (v1) driver and the new one.
> > > 
> > > Since the probe flow for both drivers is 90% similar, add a common
> > > probe function that will be called from each driver's .probe()
> > > callback, avoiding lots of code duplication.
> > > 
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > ---
> > >   drivers/gpu/drm/mediatek/Kconfig           |  11 +-
> > >   drivers/gpu/drm/mediatek/Makefile          |   1 +
> > >   drivers/gpu/drm/mediatek/mtk_hdmi.c        | 724 +++------------------
> > >   drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 425 ++++++++++++
> > >   drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 203 ++++++
> > >   5 files changed, 729 insertions(+), 635 deletions(-)
> > >   create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> > >   create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.h
> > > 
> > > @@ -1026,19 +812,12 @@ static int mtk_hdmi_setup_vendor_specific_infoframe(struct mtk_hdmi *hdmi,
> > >   	return 0;
> > >   }
> > > -static int mtk_hdmi_output_init(struct mtk_hdmi *hdmi)
> > > +static void mtk_hdmi_send_infoframe(struct mtk_hdmi *hdmi, u8 *buffer_spd, size_t bufsz_spd,
> > > +				    u8 *buffer_avi, size_t bufsz_avi,
> > > +				    struct drm_display_mode *mode)
> > >   {
> > > -	struct hdmi_audio_param *aud_param = &hdmi->aud_param;
> > > -
> > > -	hdmi->csp = HDMI_COLORSPACE_RGB;
> > > -	aud_param->aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
> > > -	aud_param->aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
> > > -	aud_param->aud_input_type = HDMI_AUD_INPUT_I2S;
> > > -	aud_param->aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
> > > -	aud_param->aud_mclk = HDMI_AUD_MCLK_128FS;
> > > -	aud_param->aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
> > > -
> > > -	return 0;
> > > +	mtk_hdmi_setup_avi_infoframe(hdmi, buffer_avi, bufsz_avi, mode);
> > > +	mtk_hdmi_setup_spd_infoframe(hdmi, buffer_spd, bufsz_spd, "mediatek", "On-chip HDMI");
> > 
> > Please use the HDMI Connector framework instead of handling everything
> > on your own.
> > 
> 
> Dmitry, my plan is to get the MediaTek HDMIv2 driver upstreamed *with* using
> the HDMI helpers - this commit is only splitting the old HDMI v1 driver in
> common parts and v1 handling.
> 
> This "handling everything on my own" is something that was already present
> into the old v1 driver, I am *not adding* this code, but *moving it around*.
> 
> I cannot migrate the v1 driver to the HDMI helpers right now because in this
> moment I have no way to test that and I don't want to break any functionality.
> 
> If you check patch 15, you'll see that I am indeed using all of the helper
> goodies - but for now only on the new driver, and not on the old one.
> 
> I do plan to migrate the v1 driver to the new helpers as well, but I would
> (please) really prefer to do that only after the v2 driver is upstreamed.
> 
> Is that okay for you?

Yes, I've sent this comment before seeing the last patches.

> 
> Cheers,
> Angelo
> 
> > >   }
> > >   static void mtk_hdmi_audio_enable(struct mtk_hdmi *hdmi)
> > 
> 
> 
> 

-- 
With best wishes
Dmitry

