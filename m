Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F9AC27C77
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 04:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DkRmaXYdVwSedvVUVG2r+hTZqVuOSK1T8k/kpQ+eeNI=; b=j8u5zBw1OdByccRDQ7+uGbSfDZ
	C8EY+4Tddx01Ys3J6vU24k41bD5yRaCUSo6EDiGIe66asrJEtemUBg/SSutw7i71qHgJDL+5VG9AF
	oRKyUXqLRD45vDrjAgR2pWBaVoRcvaltlG8bycOYhXzmL1pf4sZyPm3Z/5a8Fn9G0eA4UnperF+zK
	m8DEmLKbD+ob/dpuDOwmBCmB9bXqlA68bP4Lc0+wVxqWEUeGA80i96lwQjd7CAOj0UBxCnj8gHWwZ
	GUg/lL5s3uB3qyIKL1Dw7DQg1uvkvVwyWBwcF4M0DzbHDbnQfD8ldBb+86rR/8Ux23uhHsLu3rZf6
	t912dAwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHFkC-0000000B2fB-0J2C;
	Wed, 12 Jun 2024 04:37:56 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHFk9-0000000B2eL-1rdo
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Jun 2024 04:37:54 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-254a2d8485eso1402126fac.0
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Jun 2024 21:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718167072; x=1718771872; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DkRmaXYdVwSedvVUVG2r+hTZqVuOSK1T8k/kpQ+eeNI=;
        b=cciScg45o/3ngKY0LruJe0oZEFR3GKJVtvK3+0lxHjBF3es86bOlkURM/+Fb25kMS3
         dj37+o4eoLMDF27iUITQACxrFTa7y8IP0ERTXoBvRDzzraa6T85zrz6s9343N/49AFIB
         zE9+TA1/ew6+3JVsnWsP0bYrLtG4Lpls2ShS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718167072; x=1718771872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkRmaXYdVwSedvVUVG2r+hTZqVuOSK1T8k/kpQ+eeNI=;
        b=FolJhy/9Bk7dKhTFS2kJDBz4Tkd5Itkfh4dkS3STQ3cGZ7mLMS/54RvgdcY1hwB/0C
         34obLrVyDPbGO818Keyst0qH0s7wAdYxbIo7iuyTBxob3m3p1dqGVA9RDjP/vW2Nldg3
         mlMbtk9fT0B2+3J3XWvKiP151s7m95HJpdb1t7FPMtpmBBtEh+fXgNrgz3MdS0Gj6jBd
         cup2iXQ4o4dp95q4ci8nQifgAakmVBmghnw+CgclLkLm+MPU2a8Cs6a5lxWQBEVZNpV1
         ckR+mK3AdBCW5BX6T3sc+t2xICAqhNE6O2SrJn9OOlEgtzzhwGf9DmsshNSfX1JgVtEw
         gM2g==
X-Forwarded-Encrypted: i=1; AJvYcCWmjl1ueLGW+BcLDqXOf9Ta7ka1vvXXTMpbSTs88dZx4vSkH0j7qRs2zl0l935/Q+b0opJuJv6NoaC/xAcdN8JA/SidhKkGQr4iIChETArExHcF
X-Gm-Message-State: AOJu0YzPjFKkyYFYf6xHiNDqt/KTDltsxWo7jvjPn56lUN48+acgZvV9
	BhcUE0PsKn089GOr0dpYi0hoIv020nR25mLnXSnTxRFHM5OomVCJnjtvHbGscQ==
X-Google-Smtp-Source: AGHT+IG7f6MklQ9uaEK4A66ROk94t0wNZGlsKVegXA6Omzsq6FR8KOS6Vlm+0Pwr/7yo2CTKXViBuw==
X-Received: by 2002:a05:6870:f112:b0:250:7a43:aefd with SMTP id 586e51a60fabf-25514b4e1a3mr793220fac.2.1718167072112;
        Tue, 11 Jun 2024 21:37:52 -0700 (PDT)
Received: from chromium.org (174.71.80.34.bc.googleusercontent.com. [34.80.71.174])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7042a10c359sm6519597b3a.183.2024.06.11.21.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 21:37:51 -0700 (PDT)
Date: Wed, 12 Jun 2024 13:37:46 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, 
	Jeffrey Kardatzke <jkardatzke@google.com>, 
	=?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Yong Wu <yong.wu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Steve Cho <stevecho@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T . J . Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6,04/24] v4l: add documentation for restricted memory
 flag
Message-ID: <bhgv5djcjc4yt75pyug2yirrymeucjyslthnvq6k2kpp7axfph@jzo5wpcbgwun>
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-5-yunfei.dong@mediatek.com>
 <20240522111622.GA31185@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522111622.GA31185@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_213753_533802_6139EDF9 
X-CRM114-Status: GOOD (  32.18  )
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

On Wed, May 22, 2024 at 02:16:22PM +0300, Laurent Pinchart wrote:
> Hi Jefrey,
> 
> Thank you for the patch.
> 
> On Thu, May 16, 2024 at 08:20:42PM +0800, Yunfei Dong wrote:
> > From: Jeffrey Kardatzke <jkardatzke@google.com>
> > 
> > Adds documentation for V4L2_MEMORY_FLAG_RESTRICTED.
> > 
> > Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> >  Documentation/userspace-api/media/v4l/buffer.rst | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
> > index 52bbee81c080..807e43bfed2b 100644
> > --- a/Documentation/userspace-api/media/v4l/buffer.rst
> > +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> > @@ -696,7 +696,7 @@ enum v4l2_memory
> >  
> >  .. _memory-flags:
> >  
> > -Memory Consistency Flags
> > +Memory Flags
> >  ------------------------
> >  
> >  .. raw:: latex
> > @@ -728,6 +728,14 @@ Memory Consistency Flags
> >  	only if the buffer is used for :ref:`memory mapping <mmap>` I/O and the
> >  	queue reports the :ref:`V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS
> >  	<V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS>` capability.
> > +    * .. _`V4L2-MEMORY-FLAG-RESTRICTED`:
> > +
> > +      - ``V4L2_MEMORY_FLAG_RESTRICTED``
> > +      - 0x00000002
> > +      - The queued buffers are expected to be in restricted memory. If not, an
> > +	error will be returned. This flag can only be used with ``V4L2_MEMORY_DMABUF``.
> > +	Typically restricted buffers are allocated using a restricted dma-heap. This flag
> > +	can only be specified if the ``V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM`` is set.
> 
> Why is this flag needed ? Given that the usage model requires the V4L2
> device to be a dma buf importer, why would userspace set the
> V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM flag and pass a non-restricted
> buffer to the device ?

Given that the flag is specified at REQBUF / CREATE_BUFS time, it's
actually useful to tell the driver the queue is operating in restricted
(aka secure) mode.

I suppose we could handle that at the time of a first QBUF, but that
would make the driver initialization and validation quite a bit of pain.
So I'd say that the design being proposed here makes things simpler and
more clear, even if it doesn't add any extra functionality.

> 
> The V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM flag also needs to be
> documented in the relevant section, I don't think that's done in this
> series.
> 

+1

Best regards,
Tomasz

> >  
> >  .. raw:: latex
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart

