Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EE6C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 05:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+oFRnUlIWAVoS2ogvawh6UrIJvrJD5mfVByWfU6FCcs=; b=Apbc0ykkDO2Bc9jPRjad8aUwpn
	q4ePzBPv4uNDhM6H6JilBOGeFu2SIjjVHoc9cBnyeITH5B5HCucbkIm2D9uWJ5vWbUg2LOnvyD5rm
	5eXgVuvV2HMRLGxGl7M0A8I1R5N/7ilAwPsr7cJ4/dukJQsRXpZzAV3RTceX7KspzGjv3W7jWXs8r
	zc/xxmxqUvl+6gJUj2pE4wl/p5hilGPoOpmLyPItbLXnrQQOZrxOZFh8TpyOAMwjv0JA+7fhg4u+F
	GCzd7mseR3PY9ZMH8DZdqmvjDD5ZQVE2viJywnEA5fhiw6VlbOiuVob0B5RQopzEHLXpswGMAFl6Y
	PB7hSsdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwb3h-0000000AtkN-1vwV;
	Tue, 16 Apr 2024 05:08:41 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwb3b-0000000Atft-2nw5
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 05:08:37 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6ed112c64beso3180884b3a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Apr 2024 22:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713244114; x=1713848914; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+oFRnUlIWAVoS2ogvawh6UrIJvrJD5mfVByWfU6FCcs=;
        b=hih+pxOkFgda4/Jje/5VoO7lYDKbSrGhSwIWMXoKDovNvrKU27vkvXObnCPXB9/krU
         BJC8SfT06fuciCYDTywKCWKNusQd/t3fF/ONr+grjt7WSP/MmnLu/BjHCo30FH8D36fG
         NDe6no675UOhJCU2lZ/bN8yA1Pt1A/qJddrgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713244114; x=1713848914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+oFRnUlIWAVoS2ogvawh6UrIJvrJD5mfVByWfU6FCcs=;
        b=joDSn/iDI52qrKLMUk2ygW9Bko5bL18LnzeFcowaaiqttsJc8y7/3yv+Vegf2xyy1f
         56oodTPO0rvaCY3+Vmkz35gJ1cdU0MBx8LlUIQHWbCgQn6wgZheFDGMWOvP0jGpVZP79
         F5Ahezgpjx9z7CEQUZ2Cf08AZGpk6l6uPfqN463rvB2Fru7FYeDlDqBMw6SjNSjLqt5I
         LgDMSPi3NPgJkTOZu/SWGSJhj3UzGFuVTOVZj/0PPjvwQEiPKj2nOVJz66pb9OlVwSdK
         flJF4xO46KxirhctgDw3mLrK4+SsdjNTyw0+VioM0HQr8Pd+Q9/BsR2g2JFNxPKWHDVU
         dE5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/g34AQ1LaJGPWvznawJlNYwCCkw2DcnsTy+CbC1cELJ3chP8LvJrcz450pYFeCXfSKf0kweinGoDaTDGtb47Nx6gz9sf/oL+igYAoNk+Tu5yB
X-Gm-Message-State: AOJu0Yxd/M7oh6G+HesrCy8lAsC6l2dNcl1Io1fIpIr8KWd5ciqDeWyM
	NzKkrq70Xkr08ajeyeoC4HW0LVfiWSsQH8bhmHJArUz1Xn65ZhJUZ4NWy2hQGg==
X-Google-Smtp-Source: AGHT+IHdeyQZ3pISdOfe7kK+Dd6aJIUpN4QAP3YPL9N18bYFaJvtwg0bTY9a/3ZlCCWhymzrgDPW+Q==
X-Received: by 2002:a05:6a21:2d85:b0:1a9:c13e:f211 with SMTP id ty5-20020a056a212d8500b001a9c13ef211mr8124701pzb.47.1713244114400;
        Mon, 15 Apr 2024 22:08:34 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:1137:d3d7:a09d:5379])
        by smtp.gmail.com with ESMTPSA id ju17-20020a170903429100b001e49428f313sm8835349plb.261.2024.04.15.22.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 22:08:33 -0700 (PDT)
Date: Tue, 16 Apr 2024 14:08:23 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Martin Tuma <martin.tuma@digiteqautomotive.com>,
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
Subject: Re: [PATCH 03/35] media: uvcvideo: Refactor iterators
Message-ID: <20240416050823.GC14947@google.com>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-3-477afb23728b@chromium.org>
 <20240416043916.GA14947@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416043916.GA14947@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_220835_738272_DFF4C85C 
X-CRM114-Status: UNSURE (   9.01  )
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

On (24/04/16 13:39), Sergey Senozhatsky wrote:
> On (24/04/15 19:34), Ricardo Ribalda wrote:
> [..]
> > @@ -2165,7 +2167,7 @@ static int uvc_ctrl_init_xu_ctrl(struct uvc_device *dev,
> >  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
> >  	struct uvc_xu_control_query *xqry)
> >  {
> > -	struct uvc_entity *entity;
> > +	struct uvc_entity *entity, *iter;
> >  	struct uvc_control *ctrl;
> >  	unsigned int i;
> >  	bool found;
> 
> Is `found` still used?

It is. Never mind.

FWIW
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

