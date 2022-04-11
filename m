Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D92C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 08:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uiBKHqmIQGf3jKE5X12Di+RIZKbd1HHzQ9eTLOup1T4=; b=c4Xa5YECG9+iJs
	yS4x+kqlgza0kGo3Y6wCVMOTRVfoFP5NCXOAQXCS4BYUiwG1lVcUScsuH3XLtCrgzoW+/8XezTmKD
	cxvSuk5RzzWpxblGMQ2hMjZHuYkEfjxQzYa9zYFmMgks3i92UNXqNZwwdG2BQIwJCqp3zjTg+o87i
	vdr0laoGitVDANnDfGjaEyK/upmUGBV95aCcUGpiSMVCNBFuD/4ojEVBFjCfb+ffnI2NBj1VVpmli
	ciIjXYVosDHnYvD+A08WbmBUnwFtW6D2xa5Bg2uPyqOltUC4G7H6TgQCI8RceVK8qQaMp4mvogCkM
	RqS+qZ8le52lozVf2LQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndp9Q-007Slh-8y; Mon, 11 Apr 2022 08:11:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndp96-007Se7-Ex; Mon, 11 Apr 2022 08:11:37 +0000
X-UUID: 7297a1bd8e2947aaa46829392e256ce4-20220411
X-UUID: 7297a1bd8e2947aaa46829392e256ce4-20220411
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ping-lei.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 200753200; Mon, 11 Apr 2022 01:11:31 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Apr 2022 01:01:30 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Apr 2022 16:01:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 11 Apr 2022 16:01:28 +0800
From: James_Lin <Ping-lei.Lin@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "Hans Verkuil" <hverkuil-cisco@xs4all.nl>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Arnd Bergmann <arnd@arndb.de>, "Ricardo
 Ribalda" <ribalda@chromium.org>, Ming Qian <ming.qian@nxp.com>, "Andrzej
 Pietrasiewicz" <andrzej.p@collabora.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, <linux-media@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <ping-lei.lin@mediatek.com>, <lecopzer.chen@mediatek.com>,
 <max.yan@mediatek.com>, <sherlock.chang@mediatek.com>, <tm.wu@mediatek.com>,
 James_Lin <Ping-lei.Lin@mediatek.com>
Subject: [PATCH v2 0/2] media: Add H265 pixel format
Date: Mon, 11 Apr 2022 16:01:18 +0800
Message-ID: <20220411080120.26008-1-Ping-lei.Lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_011136_528633_979BF3BF 
X-CRM114-Status: GOOD (  10.99  )
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

Hi All,

This patch series aims to add H265 pixel format (aka hevc).
High Efficiency Video Coding (HEVC), also known as H.265 and MPEG-H Part 2.
They describe the same video encoding method.
So for handling their behavior is the same.
However, when external camera device describes this encoding method, 
some use hevc, some use h265.
There is no uniform specification to describe this encoding method.
So if an external camera device use h265 to describe this encoding method,
driver will not recognize it.
Therefore, this patch series aims to add H265 pixel format 
to avoid this situation

James_Lin (2):
  media: usb: uvc: Add H265 pixel format
  media: v4l: Add H265 pixel format 

 .../userspace-api/media/v4l/pixfmt-compressed.rst      | 10 ++++++++++
 drivers/media/usb/uvc/uvc_driver.c                     |  5 +++++
 drivers/media/usb/uvc/uvcvideo.h                       |  3 +++
 drivers/media/v4l2-core/v4l2-ioctl.c                   |  1 +
 include/uapi/linux/videodev2.h                         |  1 +
 5 files changed, 20 insertions(+)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
