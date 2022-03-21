Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4569DC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 01:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hht64iJzdXM8tWBjOG9zft2ya2z1a/3tMkT0yf1p1JI=; b=rDcZI1utiQuSVk
	brisZn2Q4r1eusncRknfXjmns/5YltoYszPf5MjujAVmOMDo/tiO3B9JEh394BVWkVtY9NQiQfWhG
	KsZnfkW0Z0lvmez0nS1jt07ciQQkfEukIoSqUXcGzxhVzz0L32S6wy1ezQWKl8aoe/KC3z1rboxxE
	mVxeR2HHIkX/yS+guccjJwx4Zbj1r9nWurr5SP1ZbNFjAas87b/YIvNV3t5tVQpMj9rZmzalki3AN
	ikeJWHFzxn5TtCAYZUvHYR5fZ/iTpLj49De7ykPMhtoUpqEZ5cM6+TQTJhgnyRX7+eRby+/a4Ukze
	D37dRMoF32VpAOJY3yog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nW74u-006GgR-2Z; Mon, 21 Mar 2022 01:43:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nW74i-006GdW-Jw; Mon, 21 Mar 2022 01:43:14 +0000
X-UUID: 1e01e77a135b463bbb3292a74eeb375c-20220320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=AGjsTimvgv55yOQ3UQM51nYhFLHcNK7qq1mLArFn9nA=; 
 b=TfTJl73fG6I8r2RFshHaVg2iMKz+nrV306CxlbUGDkHgUjfpZjDzHFJr3UYv3tSvXGPUEYqoNKJOfUKFVS3zKxbxBlhouLL8bWmWpxsyJlgL3Aj+V5NeCTE1/A+bZpa8IQHZR6z9iVZb09rMePw8FDAue+y2Dq7oDRy0xNNTI4k=;
X-UUID: 1e01e77a135b463bbb3292a74eeb375c-20220320
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2046123857; Sun, 20 Mar 2022 18:43:05 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Mar 2022 18:39:06 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 21 Mar 2022 09:38:52 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Mar 2022 09:38:51 +0800
Message-ID: <9fe3230c05f12623e951f5c1f9c741222f326c64.camel@mediatek.com>
Subject: Re: [PATCH v3, 00/10] Enable two H264 encoder core on MT8195
From: Irui Wang <irui.wang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Hans Verkuil" <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, "Rob Herring" <robh+dt@kernel.org>, Alexandre Courbot
 <acourbot@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>, Yong Wu
 <yong.wu@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, "Andrew-CT
 Chen" <andrew-ct.chen@mediatek.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Maoguang Meng
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>, 
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 21 Mar 2022 09:38:49 +0800
In-Reply-To: <aae7c675-6be4-03f1-a8fb-121faae320c2@collabora.com>
References: <20220317082230.23622-1-irui.wang@mediatek.com>
 <aae7c675-6be4-03f1-a8fb-121faae320c2@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220320_184312_693696_B79728F5 
X-CRM114-Status: GOOD (  23.95  )
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

Dear Angelo,

Thanks for your comments.
On Fri, 2022-03-18 at 15:04 +0100, AngeloGioacchino Del Regno wrote:
> Il 17/03/22 09:22, Irui Wang ha scritto:
> > MT8195 has two H264 encoder cores, they have their own power-
> > domains,
> > clocks, interrupts, register base. The two H264 encoder cores can
> > work
> > together to achieve higher performance, it's a core mode called
> > frame-racing, one core has 4K@30fps performance, two cores can
> > achieve
> > 4K@60fps.
> > The two encoder core encoding process looks like this:
> > 
> >      VENC Core0: frm#0....frm#2....frm#4....
> >      VENC Core1: ..frm#1....frm#3....frm#5....
> > 
> > This series of patches are used to enable the two H264 encoder
> > cores,
> > encoding process will be changed:
> > As-Is: Synchronous
> > V4L2_VIDIOC_QBUF#0 --> device_run(triger encoder) --> wait encoder
> > IRQ -->
> > encoding done with result --> job_finish
> > V4l2_VIDIOC_QBUF#1 --> device_run(triger encoder) --> wait encoder
> > IRQ -->
> > encoding done with result --> job_finish
> > ...
> > 
> > To-Be: Asynchronous
> > V4L2_VIDIOC_QBUF#0 --> device_run(triger encoder) --> job_finish
> > ..V4l2_VIDIOC_QBUF#1 --> device_run(triger encoder) --> job_finish
> > (venc core0 may encode done here, done the encoding result to
> > client)
> > V4L2_VIDIOC_QBUF#2 --> device_run(triger encoder) --> job_finish.
> > 
> > There is no "wait encoder IRQ" synchronous call during frame-racing 
> > mode
> > encoding process, it can full use the two encoder cores to achieve
> > higher
> > performance.
> > 
> 
> Hello Irui,
> like v1 and v2, also this version of the series will crash the kernel
> when
> trying to encode.

As mentioned before, dual core encoding need more encoding working
buffers in patch-8:
media: mtk-vcodec: Add more extra processing for venc_multi_core mode
a new structure, struct venc_multi_core_vsi defined for it,

encoding processing like this: 
kernel --> ipi message --> scp firmware(userspace), vsi is a share
memory to transfer data between kernel and user, so, the definition of
vsi must be the same in kernel and userspace. otherwise, errors will be
occurred, for example, kernel crash.

When we enable dual core encoding in this patch, the
venc_multi_core_vsi used in kernel, but scp(userspace) still use the
older one vsi(struct venc_h264_vsi), the crash happened.

Maybe we would find out how to resolve the limitations, many thanks for
your review.
> 
> Before pushing the next series, you shall ensure that it is not
> crashing
> the entire kernel, hence, please test your code with gstreamer.
> 
> 
> Please use the following pipeline to test:
> 
> gst-launch-1.0 videotestsrc num-buffers=100 ! v4l2h264enc ! queue !
> h264parse ! 
> qtmux ! filesink location=test.mov
> 
> 
> Regards,
> Angelo

Thanks
Best Regards
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
