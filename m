Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45A5D5B840
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Oct 2024 02:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9zxNMXwPCBjYW69Zb32ChS7Lih5KnlHYyLjDjWcKxkQ=; b=uiviUsQWoqQMAd5NibUb58lPhP
	/xy5ZXEw69WwHBQJnl9xvv7ZpTHx/dqjMuegLU4y9yBX7pb+fsMEDamS3GQjZHxzwZIQT7iLvNVkr
	5hjQxe3oYwJH8yRmzjAJSROwPN7gv11iLotW2SIM1LJnlQ5IslKHR3hyOWsatxF3RIQ4IbENLXfjC
	fYx1qFLpxN2A6MGgl8j7i7kSOhbS6w3j4Wvjhn/jZbPHK98s2uO3YJURPelkxi610wpicsB1bzycq
	8pJMcTiS+6iwl0YUPvjX2P/wC/P3LYo52Iir9QVQwp2+oXuS2w3d5WQYji0t3ywGJywzhYjTIKeZv
	ftrzX3AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5bgw-0000000CwDW-1P01;
	Tue, 29 Oct 2024 02:10:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5bgt-0000000CwCU-3dSM;
	Tue, 29 Oct 2024 02:10:41 +0000
X-UUID: f9439e9e959a11ef9048ed6ed365623b-20241028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=9zxNMXwPCBjYW69Zb32ChS7Lih5KnlHYyLjDjWcKxkQ=;
	b=QEaj7KydGUhLAKlkeeb1fbsfSA3lBfm6BfmCH/sp8PpzkR+FR3vR8Et9DqlIBq18YzI7vdiybWL1fMi6FtfaSHhxsR7kJu1fMZ44XC/YZXhPHhrmeXgGd/nYhYTucPlaqAWaL7g04ahVMne3Tj6iumjCX4L+GOhXqTJY9TOIgew=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:55f55fb6-9703-40cd-a3b6-d36e9342fc1a,IP:0,U
	RL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:b0fcdc3,CLOUDID:29d95548-ca13-40ea-8070-fa012edab362,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f9439e9e959a11ef9048ed6ed365623b-20241028
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <defa.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 433074756; Mon, 28 Oct 2024 19:10:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 28 Oct 2024 19:10:28 -0700
Received: from mbjsdccf07.gcn.mediatek.inc (10.15.20.246) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 29 Oct 2024 10:10:27 +0800
From: mtk25126 <defa.li@mediatek.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<wsd_upstream@mediatek.com>, <mingchang.jia@mediatek.com>,
	<yuhan.wei@mediatek.com>, <hao.lin@mediatek.com>, mtk25126
	<defa.li@mediatek.com>
Subject: [PATCH] i3c: Remove redundant lock in i3c_device_uevent
Date: Tue, 29 Oct 2024 10:09:40 +0800
Message-ID: <20241029020950.31053-1-defa.li@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_191039_978655_12EA3514 
X-CRM114-Status: GOOD (  10.25  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

We encountered the following lockdep warning.
The i3c_master_register function recursively acquires &i3cbus->lock twice,
which may cause a deadlock. 

Remove the logic of obtaining i3cbus->lock when using the i3c_device_uevent
function to obtain the i3c_device_info structure.

============================================
WARNING: possible recursive locking detected
6.11.0-mainline
--------------------------------------------
init/1 is trying to acquire lock:
f1ffff80a6a40dc0 (&i3cbus->lock){++++}-{3:3}, at: i3c_bus_normaluse_lock

but task is already holding lock:
f1ffff80a6a40dc0 (&i3cbus->lock){++++}-{3:3}, at: i3c_master_register

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&i3cbus->lock);
  lock(&i3cbus->lock);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

2 locks held by init/1:
 #0: fcffff809b6798f8 (&dev->mutex){....}-{3:3}, at: __driver_attach
 #1: f1ffff80a6a40dc0 (&i3cbus->lock){++++}-{3:3}, at: i3c_master_register

stack backtrace:
CPU: 6 UID: 0 PID: 1 Comm: init
Call trace:
 dump_backtrace+0xfc/0x17c
 show_stack+0x18/0x28
 dump_stack_lvl+0x40/0xc0
 dump_stack+0x18/0x24
 print_deadlock_bug+0x388/0x390
 __lock_acquire+0x18bc/0x32ec
 lock_acquire+0x134/0x2b0
 down_read+0x50/0x19c
 i3c_bus_normaluse_lock+0x14/0x24
 i3c_device_get_info+0x24/0x58
 i3c_device_uevent+0x34/0xa4
 dev_uevent+0x310/0x384
 kobject_uevent_env+0x244/0x414
 kobject_uevent+0x14/0x20
 device_add+0x278/0x460
 device_register+0x20/0x34
 i3c_master_register_new_i3c_devs+0x78/0x154
 i3c_master_register+0x6a0/0x6d4
 mtk_i3c_master_probe+0x3b8/0x4d8
 platform_probe+0xa0/0xe0
 really_probe+0x114/0x454
 __driver_probe_device+0xa0/0x15c
 driver_probe_device+0x3c/0x1ac
 __driver_attach+0xc4/0x1f0
 bus_for_each_dev+0x104/0x160
 driver_attach+0x24/0x34
 bus_add_driver+0x14c/0x294
 driver_register+0x68/0x104
 __platform_driver_register+0x20/0x30
 init_module+0x20/0xfe4
 do_one_initcall+0x184/0x464
 do_init_module+0x58/0x1ec
 load_module+0xefc/0x10c8
 __arm64_sys_finit_module+0x238/0x33c
 invoke_syscall+0x58/0x10c
 el0_svc_common+0xa8/0xdc
 do_el0_svc+0x1c/0x28
 el0_svc+0x50/0xac
 el0t_64_sync_handler+0x70/0xbc
 el0t_64_sync+0x1a8/0x1ac

Signed-off-by: mtk25126 <defa.li@mediatek.com>
---
 drivers/i3c/master.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 6f3eb710a75d..bb8a8bf0c4c7 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -282,7 +282,8 @@ static int i3c_device_uevent(const struct device *dev, struct kobj_uevent_env *e
 	struct i3c_device_info devinfo;
 	u16 manuf, part, ext;
 
-	i3c_device_get_info(i3cdev, &devinfo);
+	if (i3cdev->desc)
+		devinfo = i3cdev->desc->info;
 	manuf = I3C_PID_MANUF_ID(devinfo.pid);
 	part = I3C_PID_PART_ID(devinfo.pid);
 	ext = I3C_PID_EXTRA_INFO(devinfo.pid);
-- 
2.46.0


