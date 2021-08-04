Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A42C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 14:28:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9C3B60EBC
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 14:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9C3B60EBC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+ReTVw+IJEeCXGIo2tkoenP3eMwkeLBH0vAbOTpYgDc=; b=AyBYS3dZ0utvQD
	dY7o/GQClxMZr+LAxyfqvZLKvKJ57ScT6sLTI47l9CJysns6fSblY53xV6DVx3+v+Exn6ik5TaNB1
	3s5PDLEZmhDHTGzxbRkIyXXFx5B9/Jzd4tKf4veYo/819nGklGa2WCNqt1zLwMWUaqZaj3BfR1Rhm
	kTtmGxsxM0QgrhwmwRqltWDGqY4oHqpChaZV6p41wSpnxYuipW+pecHJJYT+SU+uEZKFdBw9cguRX
	5o5DuBI4LDLZD5plMf83sEyVOFXj2eUastdB6Iz7T1mnJRaF6YYdQpmLHXwUGV3faHBNyIVLLpezC
	CVD7XkvjX/vDCXaWg4uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBHs8-006Qf2-OF; Wed, 04 Aug 2021 14:27:52 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBHs5-006QcU-9y
 for linux-mediatek@lists.infradead.org; Wed, 04 Aug 2021 14:27:50 +0000
Received: from guri.fritz.box (unknown
 [IPv6:2a02:810a:880:f54:adf4:1f5e:19c9:b75f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7093A1F43A25;
 Wed,  4 Aug 2021 15:27:42 +0100 (BST)
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: dafna.hirschfeld@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
 dafna3@gmail.com, mchehab@kernel.org, tfiga@chromium.org,
 tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 matthias.bgg@gmail.com, hsinyi@chromium.org, maoguang.meng@mediatek.com,
 irui.wang@mediatek.com, acourbot@chromium.org, Yunfei.Dong@mediatek.com,
 yong.wu@mediatek.com, eizan@chromium.org
Subject: [PATCH 0/5] media: mtk-vcodec: venc: variouse bug fixes
Date: Wed,  4 Aug 2021 16:27:24 +0200
Message-Id: <20210804142729.7231-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_072749_512382_C7DDBC5C 
X-CRM114-Status: UNSURE (   7.40  )
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

Some bug fixes mainly in case of error handling

Dafna Hirschfeld (5):
  media: mtk-vcodec: enter ABORT state if encoding failed
  media: mtk-vcodec: call v4l2_m2m_ctx_release first when file is
    released
  media: mtk-vcodec: change the venc handler funcs to return int
  media: mtk-vcodec: Add two error cases upon vpu irq handling
  media: mtk-vcodec: venc: Fail if a msg sent to VPU was not signaled

 .../platform/mtk-vcodec/mtk_vcodec_enc.c      |  1 +
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  2 +-
 .../media/platform/mtk-vcodec/venc_vpu_if.c   | 27 +++++++++++++------
 3 files changed, 21 insertions(+), 9 deletions(-)

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
