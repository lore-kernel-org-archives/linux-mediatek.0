Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85958CD8CA8
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2026 11:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LpMpBpNcZIgzsuu0bBQY/Gbp97K5pRk23WWL6Y8u5xg=; b=E3pmRyZ+OfvS2LNLD8jX1q9RbU
	CobRM2J+X3P54rWq67M4bvy9VFBE1dnx9tOgQWyu1EvVDPBPqkP5rAoXoo0ba/vc1fZI+0DjYZmpd
	TsmLSiLpNM1BObsAJ2m5naeJYqBuC392zicPQQpjmhWtADDyqBSD77W0HcuYQOUf3RpyrzmLJOi6c
	qMqkQrTF/crOve9HYziYuLT7KayUTxKXlDGFZJw27/ffxQ3yt5/t1A2Ia3iTehUFNANkoBS+zs6YH
	jiFN2uBD9ps4OEppOSXklBOKbQsmJFUXLEb5qAqw7QkOFbYCM3/QGmley+fE9N4bvDqdYmjKz0WAH
	q/KbTv4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWurg-00000005SVY-1UEj;
	Tue, 09 Jun 2026 11:43:28 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWure-00000005SUv-26KK
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Jun 2026 11:43:27 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-45fd464d51fso2940283f8f.3
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Jun 2026 04:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781005404; x=1781610204; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LpMpBpNcZIgzsuu0bBQY/Gbp97K5pRk23WWL6Y8u5xg=;
        b=OERm0Um8G0Z3TrLwPNnkUjKrwtUG1sRyJPCB8TzVGy8l+YEYWuDXTLoYMdPsC3ILb3
         DW5+mutZsgTzm1tlC3ycryyXtNqniwxn/XfachC+P6OjmomWGlEMmfnjl7XsPSKJ1zHZ
         GxeSydqTvhtXQlKXnqX3lDQLtf0oZ2tiykk7s8+3FBf1mgh4u7Prtn6xPl8YqjhIp3F7
         Tss/v2y3Ob8wAVCytxJGBeuSkt9RaLWUg5IczaxfrLUkMdXUW88QNqtFf2TQKjI7uyyp
         C4B2Ysxc/656Tc2bD1/sa883P/ocfzzCVKBt1tWV5mPOrREZEf4NGgTxWI5iQ2Wb6GQq
         Ju2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005404; x=1781610204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LpMpBpNcZIgzsuu0bBQY/Gbp97K5pRk23WWL6Y8u5xg=;
        b=sd7ZCqvwPBbXjnOlKWmotx5UjGS7/MECrgcUghU1+FuHYrGHdAv6iEiNc7XKSZ4RxG
         DrHDyj9nUjp55cSzUX5LbcoWE2jUyzjkg7F+1C/NxbX1vNgXpcEURC+B+FkBNby7ue2s
         GFv7nYBPgOhgk7cRq+21omg3YfsbJKxqrXvs+ceKuS0Si2cPDkCP5yHbK7oPJ3cw6R0r
         0A+0m/+TABOO1cJN57qkR9HH5I2pVs2yJYji2pcdzWxXhtK7WcWPPaOPuisGGLNp7WZb
         LHfjf9hxlPaln0QXQ6W4z6JuxmT+ZXPokm3rkFhYqZCA7Ce/jw6oP1mXfZa9OQ1f/M/c
         Hnzg==
X-Forwarded-Encrypted: i=1; AFNElJ+OAFZkGw0+Uy1vSwvr1WOZd6RH8Qmj9f26B/GBNryaH/Wgz2DNnDQiKmqv6wRfPnLjquxsyJrCscNTVmMJmg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxwlrVdt7AMqSzAQB8W8USz5y3xq28x7Eor0u3SFLk1WGi/OKih
	38pYT01Y/dsoeSVSXMX1Cmxzcs2hzuJ/f2UtgPaYUSxkakZu5aFFdR8JGBnWe3KrE1M=
X-Gm-Gg: Acq92OHfnVN60CVG2cIfWUjtZdC5H/15lXy8BjOT3+L9PXAnPx9iPAidv5UWAX+ujE9
	eeU3jE68eJyu6VKTYgNUOROT8GTBziEUt4vRPqNSzHE7iqFxxNCoZdodQBPVsyi9e+kbgdGuXev
	4Wly9X58FNzU9bakqwzi+iGCHLO3Jg+86hIArKnzkYINklFF9deH8Y1wo58AEiLczu2ZvyxKucc
	5vqLM8KuFqKe+dayVLS2itq91uL2PfWwYOZCyN3UY4BL97eBHdGe92L2H8ASzmpa5eEStHRoYED
	6K4bUgXX0zQ7xEibgy4iuCv8E8HjEQFEA/tuNSCrLhOFkM0DyD3Ukm8QlKqE4xV992h2XXEVRIo
	jdI/fI7Y/TrRSaBsn1ZMzZlnMW4oTveptNYyhVtGebVJJ7RveV1TOOZ/MWbIh138QXdehsMVKNC
	+qXX18Z6K+9szhCbkU3xUIrFFpPyxbj30PHkFvRTeb2LXP2A==
X-Received: by 2002:a05:6000:2994:10b0:460:3233:f991 with SMTP id ffacd0b85a97d-4603233f9e2mr21994861f8f.40.1781005404400;
        Tue, 09 Jun 2026 04:43:24 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcbe3sm57355924f8f.8.2026.06.09.04.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:43:23 -0700 (PDT)
Date: Tue, 9 Jun 2026 13:43:17 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] remoteproc: abort subdev stop sequence on first
 failure
Message-ID: <aif8VS0pLYurFEho@linaro.org>
References: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
 <20260609102254.2671238-3-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609102254.2671238-3-mukesh.ojha@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_044326_594952_6A890B5D 
X-CRM114-Status: GOOD (  14.12  )
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

On Tue, Jun 09, 2026 at 03:52:52PM +0530, Mukesh Ojha wrote:
> If a subdevice fails to stop, it indicates broken communication with the
> DSP. Continuing to stop further subdevices against an unresponsive
> remote processor could close rpmsg devices that could remove the memory
> mapping from HLOS and in case if remote processor touches those memory
> can result in SMMU fault.
> 
> Change rproc_stop_subdevices() to return int and abort on the first
> failing subdev. Propagate the error through rproc_stop() and
> __rproc_detach() so callers are aware the teardown did not complete
> cleanly.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

But what would callers do about this? If you abort the teardown sequence
half-way through you now have an inconsistent half-stopped state that
neither a new call to stop() nor a new call to start() could recover
from. That doesn't sound much better than the SMMU fault. Or am I
missing something here?

I would expect that we should either be able to tolerate the SMMU faults
with the resets involved in the remoteproc stop/start sequence, or that
DMA gets cancelled by the remoteproc stop sequence, before the buffers
are unmapped. Perhaps the order of our stop sequence is just wrong? Can
we unmap the buffers in the subdev unprepare() callback?

Thanks,
Stephan

