Return-Path: <SRS0=KJBd=AM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C94EC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 09:46:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEB312073E
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 09:46:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pd3tyTdw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pBU+7Id1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEB312073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BEX0t8xCCViCUfNuGNklvcRz3X9yEZqKhMZVUDhj/l8=; b=pd3tyTdw+1sgcNhcAJgbZU0aET
	NYKI2yu1PNfwgTtNVhIKBj0zH9nZUEticLcOe3lJUe0i/UcIfFP8Fxvp8+kOJ4NRzhnfiKyK8Jk7p
	wspwI6DuaeEwk8Gpr8pgTteHPTEs3e2XmTf+3AKvuRHRdOcMgbPY2ozJrmXWIQ7Prk9mFiTAgVisC
	9pko8f5ojlre6v4Fhp2gvHxtSb8fq04UumT+lPHtNZk10Vcef9NEAy7Drj9BCHSwvYFdSgWMxGes9
	J3e8Duwz2wQRLULwDfLxUSJ2MS0jMn9sj7q0mbA6EvSPqL/QSPsmZwJxhurConbWWxhGE4M7ugdHm
	k14VHmZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqZJm-0003GC-6F; Wed, 01 Jul 2020 09:46:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqZJc-0003Am-VT; Wed, 01 Jul 2020 09:46:06 +0000
X-UUID: e5097573513b494ba2fbd0d1b806d2fc-20200701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=JmH2i1K1LVRfQ5H7fZWEmVhisTSm9PDFTAU2k91Y8VA=; 
 b=pBU+7Id1echOHiDolArMMpizj6NcCPxHmoFQD7NiBDIZU9z67XfET3R9dBG8YMLVr2E9HR0k5fdlcI2VuJfXLTlZYo7h4Tj6eTXnsoIzq02s2Fj14zSHeGmxVWuaap+P+6RiaMciZLU7ivj3nJmKpykGTD9Q+FU0iYa5z05o9vQ=;
X-UUID: e5097573513b494ba2fbd0d1b806d2fc-20200701
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 397330333; Wed, 01 Jul 2020 01:46:01 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jul 2020 02:35:58 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jul 2020 17:35:50 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Jul 2020 17:35:50 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3,
 0/2] This patchset add read-only(Ro) request for capture queue
Date: Wed, 1 Jul 2020 17:35:20 +0800
Message-ID: <20200701093522.8521-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 098F809224606EF2751969BA6E6369678673A6DDE0F23228BF1043BDAABBF46B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_054605_178187_70815A1E 
X-CRM114-Status: GOOD (  13.19  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Alexandre Courbot <acourbot@chromium.org>,
 Yunfei Dong <yunfei.dong@mediatek.com>, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello,

User driver need to get HDR10+ information for each capture buffer;
For some encoder cases, user driver need to get encoded message for
each frame. So add support read-only(Ro) request for capture queue.

There is no upstream driver to use this feature at now, but we are
developing internal driver to use it. If it is ready, we will try to
upstream vdec/venc driver based on this feature.

==============
Introduction
==============

Ro request mean that user driver just can get ext ctrls, set ext ctrls
is not not allowed. Ro Request also can be used in output queue.

Add param ro_requests in struct v4l2_ctrl_handler mean that all CID ctrls
belong to this ctrl handler is read only. Add param ro_ctrl_handler in
struct v4l2_fh used for Ro request.

Add param supports_ro_requests in struct vb2_queue present that capture or
output queue use Ro request.

When set/get ext ctrls, will check whether current CID ctrls is ro ctrls
or not using function v4l2_check_ro_ext_ctrls().

================
Changes in v3
================
-change cover-letter message
-change commit message for patch 02/02
-add sanity check in vb2_core_queue_init()

Yunfei Dong (2):
  media: v4l UAPI: add V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS
  media: v4l: Add Ro request api for capture queue

 .../media/v4l/vidioc-reqbufs.rst              |   4 +
 .../media/common/videobuf2/videobuf2-core.c   |   3 +
 .../media/common/videobuf2/videobuf2-v4l2.c   |   7 ++
 drivers/media/mc/mc-request.c                 |  10 +-
 drivers/media/v4l2-core/v4l2-ctrls.c          | 107 +++++++++++++++---
 drivers/media/v4l2-core/v4l2-ioctl.c          |  22 ++++
 drivers/media/v4l2-core/v4l2-mem2mem.c        |  19 ++--
 include/media/v4l2-ctrls.h                    |  22 +++-
 include/media/v4l2-fh.h                       |   2 +
 include/media/videobuf2-core.h                |   2 +
 include/uapi/linux/videodev2.h                |   1 +
 11 files changed, 161 insertions(+), 38 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
