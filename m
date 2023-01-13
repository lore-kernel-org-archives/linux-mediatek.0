Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF913C54EBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 15:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mQnwZd2y2E+PbZ/WCc24FX5SYUqFVRfKZfEjSHAZL+g=; b=X1ohauxWb8e5P4QaGjyzv1orXi
	eSAQSlpbjvVKOQymS4F8kgMcxf7YLYwGcPV4dJrr9436Rw04Ze+2+ToKNWrZE9EhXq4D5wQj8ooIf
	tYcD7eE/gyxhQ5620wFBHIPOkumbtRO9axGaUHZc9gVbVQsfEd4zjdMFepAMIgyj2kZn0GI/tgau1
	Q7OuNIAes1EpSyf5/sQ2hW7fme7jQYLakoDXG4c0Q2IaobIq2EhpnMtIJdF8b/8n6NmtWklsBILzU
	QxJuQOGfPbPPNoNlQCEGYmQuVwGwqc1vqjCC5J0H0XwjU1jqhOHa+jWnHU/QFORhjys+AFr8uNZzt
	8X6W2eig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGLaV-0035cJ-6D; Fri, 13 Jan 2023 15:03:23 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGLaJ-0035YE-GY; Fri, 13 Jan 2023 15:03:13 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6FB386602DD6;
	Fri, 13 Jan 2023 15:03:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673622186;
	bh=fogr+uZTaVcUpklPH0FPHlfhwcndHj9i6ZT507O7UGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VeGyHLZ/upyjgtilOjqJrXGwTdYKAMuw+7A7dyr+7WeRnHKKKpAPwDtpFEAC55HqS
	 naqUxpBvDoZ9P9ht3i6t3ZEXKk5b9WmLI9n/8tytAi6e8cFgsQfoet7FFZ4p0OqE0J
	 vUChAcB4qNG4RvZ8bnHQLBdHdeYjUyeB6fXdfFODBdughAm9Cd2057qXWs2e1iJGnF
	 xIUZvk6pgWLB+yzlU8kIwuw4w2/oFNWSaoIHjRVBInek65tEXmjA0M7ocnqlaqzQ/W
	 NiI+EqzJ9xwww7PUrDKKLn+MczaEkJQAHb3jFJTcOUCWabf63+uyqaGLibxHwZXdvj
	 G0D0odut2rJbQ==
Date: Fri, 13 Jan 2023 10:02:40 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Yunfei Dong =?utf-8?B?KOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
Cc: "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	George Sun =?utf-8?B?KOWtmeaelyk=?= <George.Sun@mediatek.com>,
	Tiffany Lin =?utf-8?B?KOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"stevecho@chromium.org" <stevecho@chromium.org>,
	"frkoenig@chromium.org" <frkoenig@chromium.org>,
	Xiaoyong Lu =?utf-8?B?KOWNouWwj+WLhyk=?= <Xiaoyong.Lu@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Irui Wang =?utf-8?B?KOeOi+eRnik=?= <Irui.Wang@mediatek.com>,
	"tfiga@google.com" <tfiga@google.com>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"hsinyi@chromium.org" <hsinyi@chromium.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Andrew-CT Chen =?utf-8?B?KOmZs+aZuui/qik=?= <Andrew-CT.Chen@mediatek.com>,
	"acourbot@chromium.org" <acourbot@chromium.org>
Subject: Re: [PATCH v7, 5/7] media: mediatek: vcodec: Different codec using
 different capture format
Message-ID: <20230113150240.6tqi3kc7cdu3xr65@notapiano>
References: <20220518123004.18286-1-yunfei.dong@mediatek.com>
 <20220518123004.18286-6-yunfei.dong@mediatek.com>
 <20230112205825.wb5qcqhh5kwvyi3y@notapiano>
 <2fe7132f2fcc3fb4724a34c3c4a918b821c845a3.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2fe7132f2fcc3fb4724a34c3c4a918b821c845a3.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_070311_784052_3595C697 
X-CRM114-Status: GOOD (  22.94  )
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

On Fri, Jan 13, 2023 at 03:25:46AM +0000, Yunfei Dong (董云飞) wrote:
> Hi Nicolas,
> 
> Thanks for your information.
> On Thu, 2023-01-12 at 15:58 -0500, Nícolas F. R. A. Prado wrote:
> > On Wed, May 18, 2022 at 08:30:02PM +0800, Yunfei Dong wrote:
> > > Vp8 need to use MM21, but vp9 and h264 need to use HyFbc mode
> > > for mt8195. Vp8/vp9/h264 use the same MM21 format for mt8192.
> > 
> > Hi Yunfei,
> > 
> > why do VP9 and H264 need to use HyFbc (is this the same as MT21C?)
> > mode on
> > MT8195? The SCP firmware on linux-firmware for MT8195 [1] only has
> > MM21
> > available and based on my testing it works just fine. And contrary to
> > what the
> > commit message states this logic is also being applied to MT8192,
> > preventing it
> > to use MM21 when there are more than one format available.
> > 
> The kernel driver not support dynamic switch mt21c and mm21. The driver
> flow as below:
> 1: If there are mt21c and mm21: h264/vp9/av1 will use mt21c(vp8 use
> mm21 always);
> 2: If there are only mt21c or mm21 will use this format only.
> 
> But the scp.img is changed to support mt21c and mm21, the kernel driver
> will use mt21c. Or force the kernel driver only support mm21(small
> effort).
> 
> But the best solution is changed the driver to dynamic switch mt21c and
> mm21, need to discuss the enum and set format flow(middle effort).

Agreed. The aim should be to get this dynamic format switching implemented in
the driver so that the firmware can expose both formats and userspace can
select any of them to use.

However, as you said that solution will take more effort, so in the meantime,
given that currently only mm21 is supported by gstreamer, I think forcing the
kernel driver to always select mm21 makes the most sense right now. That way it
doesn't matter whether the firmware has mm21 or mm21+mt21c, decoding will keep
working with gstreamer using mm21.

Thanks,
Nícolas

