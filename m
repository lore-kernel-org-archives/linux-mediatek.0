Return-Path: <SRS0=xu2G=EK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FBB5C4741F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2020 12:38:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01DE62240C
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2020 12:38:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XktwEq5A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01DE62240C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i3sYzEmYKgDJiJdcbzcPt1ScLeOIKftkOiU0msfgqVc=; b=XktwEq5Atg9P7XO6mdr4PJIZCY
	oanVzrtuowKo7UU40Do8gEGCLflbHvaWPzFA8KigY8Uectfa/NXZkitT1RLujYsBmLqJXzTe6mXB1
	rQ4CATn/SL2609rHLun5JKPcKtEWv+h4CDNm70EjabMkRRQt6rJREOdYH4mRVDdbrVJ7egtxJ541P
	ATnEZITIizuGSTt2fxWQO5q39iJlLH4DzDYrinUsuSl+FRLBFookZAbQGscGv02nxOQvxQ8/2Psm7
	H6h0vOHDMoxG8BvHC7aGKCgT1GDt+EEKl+5b7o+KWdd85N9kG5mLy3drDpXivb5B8Ql0QxwwWgZkP
	9W2qt8PQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaI3n-0001fj-Pm; Wed, 04 Nov 2020 12:38:43 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaI3R-0001Su-7q; Wed, 04 Nov 2020 12:38:23 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CR5m14wjJzhgks;
 Wed,  4 Nov 2020 20:38:09 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Wed, 4 Nov 2020
 20:38:01 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <rick.chang@mediatek.com>, <bin.liu@mediatek.com>, <mchehab@kernel.org>,
 <matthias.bgg@gmail.com>, <tiffany.lin@mediatek.com>,
 <andrew-ct.chen@mediatek.com>, <xia.jiang@mediatek.com>,
 <hverkuil-cisco@xs4all.nl>, <tfiga@chromium.org>,
 <minghsiu.tsai@mediatek.com>, <jcliang@chromium.org>
Subject: [patch V3 0/6] patches to add missing put_device() call
Date: Wed, 4 Nov 2020 20:41:34 +0800
Message-ID: <20201104124140.3443309-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_073821_589913_E765FBE3 
X-CRM114-Status: UNSURE (   5.85  )
X-CRM114-Notice: Please train this message.
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
Cc: yi.zhang@huawei.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, yukuai3@huawei.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

chagnes in V3:
 - merge patch 2 and patch 3 into one patch, add a help
 mtk_jpeg_clk_release().

changes in V2:
 - add several patches suggested by Hans

Yu Kuai (6):
  media: platform: add missing put_device() call in mtk_jpeg_clk_init()
  media: platform: add missing put_device() call in mtk_jpeg_probe() and
    mtk_jpeg_remove()
  media: mtk-vcodec: add missing put_device() call in
    mtk_vcodec_init_dec_pm()
  media: mtk-vcodec: add missing put_device() call in
    mtk_vcodec_release_dec_pm()
  media: mtk-vcodec: add missing put_device() call in
    mtk_vcodec_init_enc_pm()
  media: mtk-vcodec: add missing put_device() call in
    mtk_vcodec_release_enc_pm()

 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   |  9 ++++++
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 19 +++++++++----
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 28 ++++++++++++++-----
 3 files changed, 43 insertions(+), 13 deletions(-)

-- 
2.25.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
