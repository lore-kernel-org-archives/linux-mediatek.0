Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80220C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 May 2022 09:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZoYzmhPivjPtms4xucypI0Y9xA5r32SNGIce+EzY5tA=; b=z7IMvFW5npOz89
	MZXk6dQ5QFZC55cuY9PlullFTyRqi0BGTwHD00h+KuM/8CzhB+iE8UeyeapXWK+PBArOVizuvFe6m
	iTUzP49fQ8ty1LcR8xUsoVcHJSuETVLGBQGVnWn8eIiKh1h+59sE2eEvEFuqHTUKHYqwGMTv2X8Vw
	2+v3lpS8RWYZyhN/R9JNCpV8aAtCTFB1feMPKNJzrap5JP41sALFrUBhX0Oucw3DwL07mNKKHjo85
	SiWnCZ2IgGEkrZPH5+gY437KBjzruxUHEzJWt1JWmzO2zovJs2MbE/hkRe5P1VjhgASpY1VTJGLDu
	MSBnStVVEu7EyDh3klGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntmzB-00AWrD-V7; Wed, 25 May 2022 09:07:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntmz0-00AWlR-JK; Wed, 25 May 2022 09:07:12 +0000
X-UUID: 194f08a8b2394ee3bf84f13da67278aa-20220525
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:ec6adb20-b8b8-4ccc-a3e2-c4112037d61a, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:1a126a47-4fb1-496b-8f1d-39e733fed1ea,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 194f08a8b2394ee3bf84f13da67278aa-20220525
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1902089527; Wed, 25 May 2022 02:07:07 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 May 2022 02:07:06 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 25 May 2022 17:07:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 25 May 2022 17:07:04 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <stable@vger.kernel.org>
CC: <mchehab@kernel.org>, <matthias.bgg@gmail.com>,
 <hverkuil-cisco@xs4all.nl>, <mark-pk.tsai@mediatek.com>,
 <sakari.ailus@linux.intel.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <yj.chiang@mediatek.com>
Subject: [PATCH 5.10 0/2] media: vim2m: Fix potential NULL pointer dereference
Date: Wed, 25 May 2022 17:07:00 +0800
Message-ID: <20220525090702.29035-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_020710_676655_D63292A9 
X-CRM114-Status: UNSURE (   7.56  )
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

Apply upstream solution [1][2] to fix below kernel panic:

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

Hans Verkuil (1):
  media: vim2m: initialize the media device earlier

Sakari Ailus (1):
  media: vim2m: Register video device after setting up internals

 drivers/media/test-drivers/vim2m.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
