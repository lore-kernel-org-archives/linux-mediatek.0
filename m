Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D20BC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 May 2022 08:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CzGV/uVGjSdP8Z49iWqSwgv3hdHAyCvYBucSJLLfnLE=; b=CpiEmJUzr6neg8
	RqulSasRzkV4rfAqo510qbUH/WRfLJttRkEdeI+hSEmgobE+81iFY8tMBS6245cy8Irgqk33XlrB0
	KzY9Kxs4gba4TNB2GkbtMAIMEfsqgu9PZ1ZftwMWcZo423HF4a8tMZgUBLCF6hjC3uepMEZSd/4Md
	z9++8O3XMeW7v5tGgYk+6QYUVLxibMdxPr/gy6jLH741cZYiLgNlm+RwEgUXikXh8mBZeddkEW8/V
	l3YnPO7tkHMGbLpSAaL2MAU5eSPXTvYXj+K7O0tTxxABCTbQqW1QnWrYf+Nxw/A02Bf+fhDB185N4
	dg+lmT/QErEBmckwCtYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntmNV-00APhc-Uy; Wed, 25 May 2022 08:28:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntmMq-00APPG-DI; Wed, 25 May 2022 08:27:45 +0000
X-UUID: a536663b60e547cb8d0b3f5035f0f231-20220525
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:6398e856-82f3-4a21-bf28-615303b6877a, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:f2236847-4fb1-496b-8f1d-39e733fed1ea,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: a536663b60e547cb8d0b3f5035f0f231-20220525
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1891273175; Wed, 25 May 2022 01:27:36 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 May 2022 01:27:34 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 May 2022 16:27:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 25 May 2022 16:27:33 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <stable@vger.kernel.org>
CC: <mchehab@kernel.org>, <matthias.bgg@gmail.com>,
 <hverkuil-cisco@xs4all.nl>, <mark-pk.tsai@mediatek.com>,
 <sakari.ailus@linux.intel.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <yj.chiang@mediatek.com>
Subject: [PATCH 5.4 0/2] media: vim2m: Fix potential NULL pointer dereference
Date: Wed, 25 May 2022 16:27:29 +0800
Message-ID: <20220525082731.28235-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_012744_476670_9EEE7736 
X-CRM114-Status: UNSURE (   6.89  )
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

Backport upstream solution [1][2] to fix below kernel panic:

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000208
...
pc : _raw_spin_lock_irqsave+0x50/0x90
lr : v4l2_m2m_cancel_job+0x38/0x1c4 [v4l2_mem2mem]
sp : ffffffc012d2bcb0
x29: ffffffc012d2bcb0 x28: ffffff8098d6bb00
x27: 0000000000000000 x26: ffffffc01009b5c8
x25: 00000000000e001f x24: ffffff808ff3eb50
x23: ffffffc01009f5a0 x22: 0000000000000000
x21: ffffff808ffef000 x20: 0000000000000208
x19: 0000000000000000 x18: ffffffc012b51048
x17: ffffffc011e0ef7c x16: 00000000000000c0
x15: ffffffc010fc78f4 x14: ffffffc0119dd790
x13: 0000000000001b26 x12: 0000000053555555
x11: 0000000000000002 x10: 0000000000000001
x9 : 0000000000000000 x8 : 0000000000000208
x7 : 2020202020202020 x6 : ffffffc011e313a6
x5 : 0000000000000000 x4 : 0000000000000008
x3 : 000000000000002e x2 : 0000000000000001
x1 : 0000000000000000 x0 : 0000000000000208
Call trace:
 _raw_spin_lock_irqsave+0x50/0x90
 v4l2_m2m_cancel_job+0x38/0x1c4 [v4l2_mem2mem]
 v4l2_m2m_ctx_release+0x38/0x60 [v4l2_mem2mem]
 vim2m_release+0x5c/0xe0 [vim2m]
 v4l2_release+0x90/0x18c
 __fput+0xdc/0x2cc
 ____fput+0x10/0x1c
 task_work_run+0xc4/0x130
 do_notify_resume+0xdc/0x158
 work_pending+0x8/0x10

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cf7f34777a5b4100a3a44ff95f3d949c62892bdd
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1a28dce222a6ece725689ad58c0cf4a1b48894f4

Mark-PK Tsai (2):
  media: vim2m: Register video device after setting up internals
  media: vim2m: initialize the media device earlier

 drivers/media/platform/vim2m.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
