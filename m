Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32749C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 15:04:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F27196112F
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 15:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F27196112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ih690oAY/t7QZVwjqFW7lS4n+wUQr0RTD8tSp/aFI9s=; b=GTdWJQ9VpvgMIN
	Zc6ZyxtsDD7HuFPl7a3gV5YHrnXzugZsq0/WiiFgd0aytfj++/CuvxgyfwQnr9AsoWDk/t5Vw+jy6
	08EVWBk61Rs2bOwFuOPXXN4oHKaQGTR9ftjvnXPtz6Gp/bS15hrQaWCK0t9ZX9bVuYR82MZ+wZeb0
	C94kDOp4ACA35lde11MA9xzPSnsFEaAoVgBvMff5+ejUDDSdGOvgpo35+vHlwZp2Q2ENHJFaryYjj
	/3Xp0REPT2xslFOVmH3MLYCdWaMzP21ptwwkV8USYL+2RUGvpxBhFuEjmfgtSWXQuYH36CkS6x/tr
	9p4a5Sig5SszFtdkeTSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdw5x-00BLJO-VI; Fri, 22 Oct 2021 15:04:33 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdw5k-00BLC8-4F
 for linux-mediatek@lists.infradead.org; Fri, 22 Oct 2021 15:04:21 +0000
Received: from guri.fritz.box (unknown
 [IPv6:2a02:810a:880:f54:50fa:5c7d:20f4:e8d3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7F37C1F4120F;
 Fri, 22 Oct 2021 16:04:17 +0100 (BST)
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: linux-media@vger.kernel.org
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, kernel@collabora.com,
 acourbot@chromium.org, andrew-ct.chen@mediatek.com, courbot@chromium.org,
 dafna3@gmail.com, eizan@chromium.org, houlong.wei@mediatek.com,
 hsinyi@chromium.org, hverkuil@xs4all.nl, irui.wang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 maoguang.meng@mediatek.com, matthias.bgg@gmail.com, mchehab@kernel.org,
 minghsiu.tsai@mediatek.com, tfiga@chromium.org, tiffany.lin@mediatek.com
Subject: [PATCH 0/3] media: mtk-vcodec: few fixes
Date: Fri, 22 Oct 2021 17:04:07 +0200
Message-Id: <20211022150410.29335-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_080420_344130_C304FB9B 
X-CRM114-Status: UNSURE (   7.32  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

3 fixes to mtk-vcodec

1. we found out that the vp8 encoder
should support the vp8 profile ctrl for the gstreamer to work
2. some bug fix related the streaming start/stop
3. some cleanup

Dafna Hirschfeld (3):
  media: mtk-vcodec: enc: add vp8 profile ctrl
  media: mtk-vcodec: enc: use "stream_started" flag for
    "stop/start_streaming"
  meida: mtk-vcodec: remove unused func parameter

 .../media/platform/mtk-vcodec/mtk_vcodec_drv.h |  4 ++++
 .../media/platform/mtk-vcodec/mtk_vcodec_enc.c | 18 ++++++++++++++++++
 .../platform/mtk-vcodec/venc/venc_h264_if.c    |  9 +++------
 .../platform/mtk-vcodec/venc/venc_vp8_if.c     |  3 +--
 .../media/platform/mtk-vcodec/venc_vpu_if.c    |  1 -
 .../media/platform/mtk-vcodec/venc_vpu_if.h    |  1 -
 6 files changed, 26 insertions(+), 10 deletions(-)

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
