Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 548A3C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 13:07:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1597561BD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 13:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1597561BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M/Ty8V/ii5A/EB+9i5MvO1+CnzkHp5izsND6Dg1znGQ=; b=xJ1QxSUtNS/F4U
	3M2jdFA9U2ACY74ocrHj2Ef/LLfneph4qvgZ8BqgLnSe9Z/7eUwBxbYpfJXLpaY2M8xJ15i1yuKo9
	ipTQkEip4dpeNuYlOkaYwiyshQ43jaQ0f4G0m/bxcV3MUymMHMrrZmd+G+lStSTAphn8VWmqvYb2f
	kopX4jCtltYUrM8EI+rkqUVuUqJTbCEAFIiX+OppYAzYKj3fmjSACxk1vZJTYwtjNf7mO3ga+Vwd5
	v4CaqTEgeH6+X2fhti+BYX+VW07agxda75aJYgAsFhRAt2Bg9YjYFyU0QD+fKDg3Wg5gUVEt/18Kd
	+wAwF1Ef+mkzEcr2Gajg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnKeM-004mgs-Es; Wed, 17 Nov 2021 13:06:54 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnKeJ-004meL-GJ
 for linux-mediatek@lists.infradead.org; Wed, 17 Nov 2021 13:06:53 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dafna) with ESMTPSA id DD51F1F43923
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637154406; bh=XT88vmZVnGAA3DUx4qTSK6yoA3E1ZD2YHWTaXApYMl0=;
 h=From:To:Cc:Subject:Date:From;
 b=itSkYpE4aJYHYyqBzPBCktorR6BgopahzZNmzMTfDoTcrp0V2aJrODJn4Fui+uQSM
 EUqeMuSdGejWwMz+yrVT8m9XjbA2j4XAO+BjAoGQcZSbF2gMyiCKqnriI4SO9uv6j6
 inknXWx7PNs0bXlDI6/Zjl+foKmXsl447qdEM3P8bt0JwjVV5XqQ0NFXqo4QK/1Qiu
 jfnq+rXfn7j8DSdii4X7SVX+8JKU8V0cRMcOco1CnCsHQk302x4RuFaL5gLQdWuvyb
 Gp4NK6oH/q/55SokanaML5jIiwqhrGut9TWWEiB131ypFjGMqwu3CA4j4w4gpkWakz
 GClSSMTDtewBw==
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: linux-media@vger.kernel.org
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, kernel@collabora.com,
 acourbot@chromium.org, andrew-ct.chen@mediatek.com, courbot@chromium.org,
 dafna3@gmail.com, eizan@chromium.org, houlong.wei@mediatek.com,
 hsinyi@chromium.org, hverkuil@xs4all.nl, irui.wang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 maoguang.meng@mediatek.com, matthias.bgg@gmail.com, mchehab@kernel.org,
 minghsiu.tsai@mediatek.com, tfiga@chromium.org, tiffany.lin@mediatek.com
Subject: [PATCH v2 0/7] media: mtk-vcodec: few fixes
Date: Wed, 17 Nov 2021 15:06:28 +0200
Message-Id: <20211117130635.11633-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_050651_702066_4B1145CB 
X-CRM114-Status: UNSURE (   9.47  )
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

This is v2 of patches that fixes issues in the mtk-vcodec encoder
v1 is [1]

patch 1 add support to vp8 profile contorl. Without this control the encoder can't be used with gstreamer.
patches 2-3 are bug fixes
patch 4: fixes the debugging
patch 5-7 are cleanups

changes from v1:
1. some cleanup patches (4-6) are new
2. improve commit log of patches.


[1] https://lore.kernel.org/linux-media/34a3f0e40c5248472d072d2a06cc4370e08ea9ff.camel@ndufresne.ca/T/

Dafna Hirschfeld (7):
  media: mtk-vcodec: enc: add vp8 profile ctrl
  media: mtk-vcodec: call v4l2_m2m_ctx_release first when file is
    released
  media: mtk-vcodec: enc: use "stream_started" flag for
    "stop/start_streaming"
  media: mtk-vcodec: fix debugging defines
  media: mtk-vcodec: replace func vidioc_try_fmt with two funcs for
    out/cap
  media: mtk-vcodec: don't check return val of mtk_venc_get_q_data
  meida: mtk-vcodec: remove unused func parameter

 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |   3 -
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   4 +
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 206 +++++++++---------
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |   5 +-
 .../platform/mtk-vcodec/mtk_vcodec_util.c     |  10 -
 .../platform/mtk-vcodec/mtk_vcodec_util.h     |  45 +---
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        |   4 +-
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |   9 +-
 .../platform/mtk-vcodec/venc/venc_vp8_if.c    |   3 +-
 .../media/platform/mtk-vcodec/venc_vpu_if.c   |   1 -
 .../media/platform/mtk-vcodec/venc_vpu_if.h   |   1 -
 11 files changed, 118 insertions(+), 173 deletions(-)

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
