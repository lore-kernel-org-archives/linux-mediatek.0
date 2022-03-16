Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAD6C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 06:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1Huc0xC9GZxhY2T7aDEmUssNFUitcvio4AlVv4jwvd4=; b=oNs0Xq39Qu/wIX
	m5w2ZvjS3hiQ/nOeEHE/f4z5IHZlN5uasJeKIKSQZl6cMTXDqA7hEVHpPVg3T8jpkchqh7BVoTEGw
	e4J7XdMWcWUg2GMeCi9nhG8E5FsrUagCscGGqai7C1+j6ojXWQalbFWxSse6e6LOcQ47Pm2usvDQK
	ABw0chSl/goxOTYgklg8I19e/XsVyW1Hn35wkUKC+D7e+ymiggxS0SNewKsVJuGrjq9CvLfEd8ltd
	Fa3H0sz0DWu51r3Wq8n4Iq5Ij1ESGzoPBZ7taA5+U0R7wMDo0sSd/TmFvgRGSWuO5evycLViUPOK2
	FoGqE8YI37lJkgV26gzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUMim-00BZcv-RD; Wed, 16 Mar 2022 06:01:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUMik-00BZbW-1f
 for linux-mediatek@lists.infradead.org; Wed, 16 Mar 2022 06:01:19 +0000
X-UUID: 35c7ea6e72e244618f53366490a68d93-20220315
X-UUID: 35c7ea6e72e244618f53366490a68d93-20220315
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <cheng-jui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1328035554; Tue, 15 Mar 2022 23:01:15 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Mar 2022 23:01:13 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Mar 2022 14:01:12 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Mar 2022 14:01:11 +0800
Message-ID: <6eb2052f463d323b0a82e795d765afb9d5925f6e.camel@mediatek.com>
Subject: apply commit 61cc4534b655 ("locking/lockdep: Avoid potential access
 of invalid memory in lock_class") to linux-5.4-stable
From: Cheng Jui Wang <cheng-jui.wang@mediatek.com>
To: <stable@vger.kernel.org>
CC: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Waiman Long
 <longman@redhat.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, "Bart
 Van Assche" <bvanassche@acm.org>, <linux-mediatek@lists.infradead.org>,
 Eason-YH Lin <eason-yh.lin@mediatek.com>
Date: Wed, 16 Mar 2022 14:01:12 +0800
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_230118_127612_801ED572 
X-CRM114-Status: UNSURE (   5.78  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Reviewers,

This patch fixes a use-after-free error when /proc/lockdep is read by
user after a lockdep splat.

I checked and I think this patch can be applied to stable-5.4 and
later. 

commit: 61cc4534b6550997c97a03759ab46b29d44c0017
Subject: locking/lockdep: Avoid potential access of invalid memory in
lock_class

Thanks.
Cheng-Jui Wang



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
