Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E5EC4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 08:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQiui35tGbgrLHrxJlWNcYO7KRQh2YZtezQ4w5QZix0=; b=Eh1TYsHMshFWfXqN+zQLoBGYS5
	+ZNbrpuw0T9Qq0fSROKI/yrreODAoyVWlMn9PF0mAV/bXCZamJFLLndb3lKsdpPwSLysDqGuTm+22
	xBPk55iQU5VYQtUfOSAaTjj2MYNkou29no7b8iS+n+gHxVuPXK8BfHp/xd7J5fyPzfVRZ6t/3JNRR
	36s37cOrfWBHFVS959JBZTGfm1PZIJd1t5NeicAK/lv+PpTYKrUZfSgxAxwFU5EShTMkRbA5cuNw2
	phGhcrRveG3Szp9+YD16lNbFsFnKlABfrMpEuEidN090EgdF9w8O678tA6qKVHPW8N6nQ39/raF+1
	SH2671Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx0mP-0000000FEyr-2fan;
	Wed, 17 Apr 2024 08:36:33 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx0mM-0000000FExx-2Dzj
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Apr 2024 08:36:32 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-56fd7df9ea9so6230420a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Apr 2024 01:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713342988; x=1713947788; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iQiui35tGbgrLHrxJlWNcYO7KRQh2YZtezQ4w5QZix0=;
        b=OEdXXB0A7ZFsy3ouVP8TaHNhpLl9LdFZu/8Jrf3tn2ReJdeK1cKHuAtPkRF9O5PtKA
         lAGgmUbEs/eYmhAqXvE0z+n+aZQwigL3ttw+y9r6oe5VBZ1gNf24y91cEV4h9YCvt7iy
         zFQEZfgu3+b8xItmck6Ho+E3qsGxgSKxq+dfxS5r2Ayy/JEroZNPBrjDTdZ/PoVDooa1
         NsHkMahHbXPXr3dwmD3tLyAaFublnudeyjv2cxWebn62Qyy5jChmM9zCtXpgM7hKzqQM
         ncepjZSfVRKul576jBx2E8FPJLlf0vEhYOtvIayeihoig7DeP/vZ6B9Ggan2hNK/yQLn
         sEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713342988; x=1713947788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQiui35tGbgrLHrxJlWNcYO7KRQh2YZtezQ4w5QZix0=;
        b=O9RLMyOUmEnMgVC85B70hRad/LrQCZfp4C3SpA/M+8kiG7X6SYT5Vjk7xiiCQ1mgZA
         LSBxHivnRRtcIu2z8iddj+3XmeKCRCRLXcqaxybSJwDy48JSxPki8/NRaTw95RTufYgr
         0sXhrQCPDXuDPV779B7XE0uOSYsdW2Mt7F7jaHz0FFKPfw0OIMIT3PoefSxmbgvcG/FM
         7Gh5CXKgk8YFULoK/eHbqWyIjxR46V4DzmcI8AsATE7IWvBE7RmTA2DPyh4SjYzwnFrN
         O//INhoN3AA2eB/M14xgR9UElfWZTKnEHFvQXlyo9KdqP5egot+x71jx9FDxzaoaSN69
         Dwow==
X-Forwarded-Encrypted: i=1; AJvYcCXvZiut4+asrwhWZDG36vCL0L2ZdzXgCF/zpcSDQ3dhpb75mlp1zJ7QfkuSPC823pZ30M1IZ3P287s+RVt2363BBI5rR5LK9ri1DPVhCnDA0aZW
X-Gm-Message-State: AOJu0YxvhVASfw8CXvlL2Up0X00rY+/u1q4V3Hyns3vRrVyiMu03TXHi
	6wXcyu7QtXkzRL7Ug3uBqWzUEV7RG+mnTrGudimhPX2GGqadY0jDCBGnl6RL8Yc=
X-Google-Smtp-Source: AGHT+IGcBOrF6dlMwP4LWwT62iTJu3n3+RD0VmgZxc7ueD6NugKm/u+kb1GXFPPYn+h8dHTWajk2Vg==
X-Received: by 2002:a17:907:846:b0:a52:6fcb:564a with SMTP id ww6-20020a170907084600b00a526fcb564amr5823920ejb.9.1713342987569;
        Wed, 17 Apr 2024 01:36:27 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id cw21-20020a170906479500b00a52182471a2sm7905680ejc.13.2024.04.17.01.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 01:36:27 -0700 (PDT)
Date: Wed, 17 Apr 2024 11:36:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Dmitry Osipenko <digetx@gmail.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 25/35] media: venus: Use the correct div_ function
Message-ID: <06113ffe-11bd-4c73-aff7-5e55aa8e3edc@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-25-477afb23728b@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-25-477afb23728b@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_013630_618872_EA09326B 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
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

On Mon, Apr 15, 2024 at 07:34:42PM +0000, Ricardo Ribalda wrote:
> us_per_frame does not fit in u32
> 

drivers/media/platform/qcom/venus/venc.c
   391  static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
   392  {
   393          struct venus_inst *inst = to_inst(file);
   394          struct v4l2_outputparm *out = &a->parm.output;
   395          struct v4l2_fract *timeperframe = &out->timeperframe;
   396          u64 us_per_frame, fps;
   397  
   398          if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
   399              a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
   400                  return -EINVAL;
   401  
   402          memset(out->reserved, 0, sizeof(out->reserved));
   403  
   404          if (!timeperframe->denominator)
   405                  timeperframe->denominator = inst->timeperframe.denominator;
   406          if (!timeperframe->numerator)
   407                  timeperframe->numerator = inst->timeperframe.numerator;
   408  
   409          out->capability = V4L2_CAP_TIMEPERFRAME;
   410  
   411          us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
It looks like in some drivers this multiply can go over U32_MAX.

   412          do_div(us_per_frame, timeperframe->denominator);
                       ^^^^^^^^^^^^
But after this divide, then we're under 1,000,000 again.  Otherwise the
FPS is zero.  So maybe the right thing to do is:

	inst->fps = USEC_PER_SEC / (u32)us_per_frame;

   413  
   414          if (!us_per_frame)
   415                  return -EINVAL;
   416  
   417          fps = (u64)USEC_PER_SEC;
   418          do_div(fps, us_per_frame);
   419  
   420          inst->timeperframe = *timeperframe;
   421          inst->fps = fps;
   422  
   423          return 0;
   424  }

regards,
dan carpenter


