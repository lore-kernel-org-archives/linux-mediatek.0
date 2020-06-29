Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1815C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 06:48:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7E2D23134
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 06:48:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O7u9xyCa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="szb5kTIC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7E2D23134
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rfujAKFWVTEU/QUIY7aKoT0UrMzwF/I8LGNI3X3uDuI=; b=O7u9xyCaFwIx/Zhwz2FVb+bwA
	6TCXHkFKLJaO557RvzAuUUIKmcLcK/uXbK6WKF1fHheurlSr/XUuN0Kc2s7DFH4NQ0E0NNBcTIOZv
	f2bXEYB06dHx3gegF5mn9TR0QsICSNFUPq/65MUgojXXuRhqviofQ/VDWJ0gXDJWp0NoZ9aPIjDhX
	ShMiEKuBegQp1E/z24FxVkeMAcNBr0qn44IOmKC3JJmp+ATJE5FaMPInWc5ow/0PiBGwdNPKmv9cS
	Iod+sm6uM2rU0YscNKwCqhwWjYwiSexmRRStj3XE+T3qxaszPMc82CE6OazytdXCVFfnd9VxAeVc2
	hhPgZMXkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpnaF-0004pM-4g; Mon, 29 Jun 2020 06:48:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpnaD-0004os-4O; Mon, 29 Jun 2020 06:48:02 +0000
X-UUID: 8a08152a7709482fb90de734e2ab80b9-20200628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=SQCD1qNbdDL3+DQY2vrgvIy2dn9+7uiTyxjqsYWlS7s=; 
 b=szb5kTICcRHdfAmaaXpEXASPpRp4eIBkyf6JKmxPIA9eIcCbu/XhzIRyv7gMsTlS95TLwKfFXbSLkAmPrR+TaYu69PUZoKr5DCHu5u10QUbh5w/q7+YLUjRigDI7/OtjKuVLitPa2Lu0YO6ql7BLV1vQD3bIwAT4ktzRTqeGiYE=;
X-UUID: 8a08152a7709482fb90de734e2ab80b9-20200628
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1345850596; Sun, 28 Jun 2020 22:47:52 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 28 Jun 2020 23:47:52 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Jun 2020 14:47:45 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Jun 2020 14:47:46 +0800
Message-ID: <1593413249.19566.23.camel@mhfsdcap03>
Subject: Re: [PATCH v2, 0/2] This patchset add Read-only(Ro) request for
 capture queue
From: yunfei.dong <yunfei.dong@mediatek.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon, 29 Jun 2020 14:47:29 +0800
In-Reply-To: <CAAEAJfBtuZUn-LxiwCZ75rwT_oEuM-_QEXCH4-vFhV6X+8=4SA@mail.gmail.com>
References: <20200622015227.24134-1-yunfei.dong@mediatek.com>
 <CAAEAJfBtuZUn-LxiwCZ75rwT_oEuM-_QEXCH4-vFhV6X+8=4SA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: CFD270EE59F4EA1CEFBCE63AB4EAFA22A6984E218200D19D82AB3753E74DF61E2000:8
X-MTK: N
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Ezequiel Garcia,

Thanks for your advice.

1: An upstream driver using the feature would be important, but it would
be nice to also have: an open-source userspace application,
>>> Ro request is one feature based on media request. In userspace,
application can use it the same as with request. Ro request and request
are separated in kernel space with different ctrl handler.

2:and a proper explanation in the stateless decoder interface
specification.
>>> Whether add the explanation in cover-letter is enough ? In fact,
these patches just add one new function v4l2_check_ro_ext_ctrls(), other
changes separate Ro request and request.


Thanks again.

Best Regards,
Yunfei Dong

On Tue, 2020-06-23 at 15:43 -0300, Ezequiel Garcia wrote:
> Hi Yunfei,
> 
> Thanks for the patch.
> 
> On Sun, 21 Jun 2020 at 22:55, Yunfei Dong <yunfei.dong@mediatek.com> wrote:
> >
> > User driver need to get HDR10+ information for each capture buffer;
> > For some encoder cases, user driver need to get encoded message for
> > each frame. So add support read-only(Ro) request for capture queue.
> >
> > Ro request mean that user driver just can get ext ctrls, set ext ctrls
> > is not not allowed. Ro Request also can be used in output queue.
> >
> > There is not upstream driver to use this feature at now, but we are
> > developing internal driver to use it. If it is ready, we will try to
> > upstream vdec/venc driver based on this feature.
> >
> 
> An upstream driver using the feature would be important, but it would
> be nice to also have: an open-source userspace application,
> and a proper explanation in the stateless decoder interface specification.
> 
> Thanks,
> Ezequiel
> 
> > Change compared to v1:
> > -change commit message of patch 01/02
> > -change commit message of patch 02/02
> >
> > Yunfei Dong (2):
> >   media: v4l UAPI: add V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS
> >   media: v4l: Add Ro request api for capture queue
> >
> >  .../media/v4l/vidioc-reqbufs.rst              |   4 +
> >  .../media/common/videobuf2/videobuf2-v4l2.c   |   7 ++
> >  drivers/media/mc/mc-request.c                 |  10 +-
> >  drivers/media/v4l2-core/v4l2-ctrls.c          | 107 +++++++++++++++---
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |  22 ++++
> >  drivers/media/v4l2-core/v4l2-mem2mem.c        |  19 ++--
> >  include/media/v4l2-ctrls.h                    |  22 +++-
> >  include/media/v4l2-fh.h                       |   2 +
> >  include/media/videobuf2-core.h                |   2 +
> >  include/uapi/linux/videodev2.h                |   1 +
> >  10 files changed, 158 insertions(+), 38 deletions(-)
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
