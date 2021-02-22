Return-Path: <SRS0=FZAz=HY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0195EC433E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Feb 2021 13:11:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2F3264E27
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Feb 2021 13:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2F3264E27
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xC5KqqUW0uzkI/p01x+hKiiM7K5PwmVRHXtLAp2fQ1c=; b=C9eAmK3rCPBkYg0V/LsmJMlNh
	HW8KRIMelBLQG/z7nItuLewx6NmMZ6I4o5hNO9OzMbkvyRwEwWkvq/2XxOZ1tv1Jy6ThBtpxMZV0X
	unHb/u4no8QAkjEtZAPIdagh7P9V77r5m7SlxASog4iZkPlkdogP32gaIgaa1bDZ/MdmE6eKLsJd9
	vci3l30+1t1OirDZyFKVunD3RBNezmmTQMshQVpsNbpopSXPax0gqDGcA3dqa//l05CgMEpHYV3Zd
	rWABqJbx1Rq4qy9lhg6JZRhyRspcX88ewJdUcxEOf0vX3S5hLR2K4OREvOYR2zAB/uSsZkkIwQZdT
	RGPeAlAFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEAzW-0000CL-CP; Mon, 22 Feb 2021 13:11:10 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEAzU-0000Bm-Oe
 for linux-mediatek@lists.infradead.org; Mon, 22 Feb 2021 13:11:09 +0000
Received: by mail-lj1-x233.google.com with SMTP id y7so55625617lji.7
 for <linux-mediatek@lists.infradead.org>; Mon, 22 Feb 2021 05:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NlW7XnTvf80UJ2UJ2BIr+dCpf/fNb2YhvZlxuKGK+8w=;
 b=iXJHz8iNMrs+0cRv74pIBMAisNBBDsB/6Sih+cPhatxrsQG8p2Y35qB/kZrmUNVj/b
 R3LDmXnBr4iWvHf7dvG6C30ShvtlOGvIZLdLdSVTCJ1KdsbXhAyU06fI1ccJnwV5wO4H
 xidhvUyRAPY8lDEH6+GQ2WFuFuxJAjORo0r/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NlW7XnTvf80UJ2UJ2BIr+dCpf/fNb2YhvZlxuKGK+8w=;
 b=JSHlq0+4gRmzopGNUfZB2h9pMsBst1oXeMhOGvlgTGPdBm+Q4sFTEmWa1W5qUsYlSY
 8E+Lq+tR7uVapOmmZ+o0LP0Gf9PxbAL88/bAwwkCxJxK8u2HiU7SwKHYFs8vh47gmDU3
 QyUXbkJ3TD14CBlOsabEeufcRbWkEq8WxMaX9xUS/GuMktuiPxEK8CMFktXg6iN/OiT/
 a6womc3jxKW9dIZenDa4lSdXkbLyhAqHRB+wOBv+cq/ieo8Xwpi2QPft6Y7XsB+BUTe9
 i3qN8jHzsZY7RD2Dzxq2Sdgofz0KSxHuuXQkqpx0Yk6cTT/D5oQCXvSIcKJcQaR/jR/9
 UN5A==
X-Gm-Message-State: AOAM531SLc2/kvOIH3UKR7eFOJW/w6hoCoXYZI94UKzaK76Bb6wHxTk+
 FI5wN9TCMgqv4yJ3tsyVukFK+dQ38lzjBw==
X-Google-Smtp-Source: ABdhPJyLg+Cpj8blQBbL6NBzuxVPx1R+UE5CmPnL0BwcXQefU8//6MTr1T2gMa8EHMeY7xJnNQin9g==
X-Received: by 2002:a2e:6c0b:: with SMTP id h11mr13758593ljc.151.1613999466616; 
 Mon, 22 Feb 2021 05:11:06 -0800 (PST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com.
 [209.85.208.178])
 by smtp.gmail.com with ESMTPSA id i6sm1930882lfe.289.2021.02.22.05.11.06
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 05:11:06 -0800 (PST)
Received: by mail-lj1-f178.google.com with SMTP id q14so57726618ljp.4
 for <linux-mediatek@lists.infradead.org>; Mon, 22 Feb 2021 05:11:06 -0800 (PST)
X-Received: by 2002:a05:6402:445:: with SMTP id
 p5mr23004309edw.20.1613999018242; 
 Mon, 22 Feb 2021 05:03:38 -0800 (PST)
MIME-Version: 1.0
References: <20210121061804.26423-1-irui.wang@mediatek.com>
 <20210121061804.26423-3-irui.wang@mediatek.com>
 <CAPBb6MXqFU+-f4C=BaW9d_KyEUwZVTiBj-dqqxnGP-Zd7YkMVw@mail.gmail.com>
 <1613804103.896.27.camel@mhfsdcap03>
In-Reply-To: <1613804103.896.27.camel@mhfsdcap03>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Mon, 22 Feb 2021 22:03:02 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVKAhdcc-r8cJyx5wz2qTHU5BB5FE939b5fepaze8N+ew@mail.gmail.com>
Message-ID: <CAPBb6MVKAhdcc-r8cJyx5wz2qTHU5BB5FE939b5fepaze8N+ew@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: mtk-vcodec: Separating mtk encoder driver
To: Irui Wang <irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_081108_829310_641D55E3 
X-CRM114-Status: GOOD (  24.40  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Maoguang Meng <maoguang.meng@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, srv_heupstream@mediatek.com,
 Tomasz Figa <tfiga@google.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, LKML <linux-kernel@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Feb 20, 2021 at 3:56 PM Irui Wang <irui.wang@mediatek.com> wrote:
>
> On Wed, 2021-02-03 at 19:44 +0900, Alexandre Courbot wrote:
> > Hi Irui,
> >
> > Thanks for pushing this forward. I had two small conflicts when
> > applying this patch to the media tree, so you may want to rebase
> > before sending the next version. Please see the comments inline.
> >
> > On Thu, Jan 21, 2021 at 3:18 PM Irui Wang <irui.wang@mediatek.com> wrote:
> > >
> > > MTK H264 Encoder(VENC_SYS) and VP8 Encoder(VENC_LT_SYS) are two
> > > independent hardware instance. They have their owner interrupt,
> > > register mapping, and special clocks.
> > >
> > > This patch seperates them into two drivers:
> >
> > seperates -> separates
> >
> > Also the patch does not result in two drivers, but two devices.
> >
> > > User Call "VIDIOC_QUERYCAP":
> > > H264 Encoder return driver name "mtk-vcodec-enc";
> > > VP8 Encoder return driver name "mtk-venc-vp8.
> >
> > I wonder if we need to use two different names? The driver is the
> > same, so it makes sense to me that both devices return
> > "mtk-vcodec-enc". Userspace can then list the formats on the CAPTURE
> > queue in order to query the supported codecs.
> >
> I'm afraid we can't, there is a symlink when chrome use the
> encoder(50-media.rules):
> ATTR{name} == "mtk-vcodec-enc", SYMLINK+="video-enc"
> ATTR{name} == "mtk-venc-vp8", SYMLINK+="video-enc0"
> if we use the same name,how userspace access the encoder? maybe there
> will be some modifications are needed in VEA(for example)?

Chrome OS can use a different udev rule to differentiate the two
nodes. Actually I already have a CL to support this:

https://chromium-review.googlesource.com/c/chromiumos/overlays/board-overlays/+/2673592

So both nodes being named the same won't be a problem for Chrome OS,
and makes more sense for an upstream merge anyway.

Cheers,
Alex.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
