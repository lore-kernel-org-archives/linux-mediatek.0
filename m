Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F570C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 03:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F+2XiVV/hxebtLq5aHTxlzUZ5HkY+iv5QheRMxy1dWI=; b=TTLtXT2iOX63Vpn9/v6IEBpTpf
	nr/CaRpakbMMVnS8wxcKGHDaCGsuZElV+LmnBJUNr8B3K7Vwzbe73V/QkTtPtcd34IwgZWS7+tV6n
	oBVS9Iw2BWFbqyCUGklPlWh9rEy2UWgiYwMl+Dc9/ABKL9UqNKdcHedzKNQnZp+yL/GovIcvG60qk
	i6E3EpVOfTQetFfJMH4MNyA6kLOQLil5RrBhWof2juHTnsD0PL76KnsqumtZ93sFgnJ28NLOOELoK
	wN1J+HzOZbNXIyJDeuMi0fiPMvzJoazE4KuSS0tBE9CIUThgWHVjIWNlFysathfdIiTzvpyL0R55+
	tgIIwyfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p61eV-00CeNX-6m; Fri, 16 Dec 2022 03:44:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p61eT-00CeLr-6m; Fri, 16 Dec 2022 03:44:50 +0000
X-UUID: b37b3105ec5c4ef6a3b78d12977db031-20221215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=F+2XiVV/hxebtLq5aHTxlzUZ5HkY+iv5QheRMxy1dWI=;
	b=aqce60Wp1yYtaA3hJsAn/RbepSC0FC0Pf2dopxilP2Dl5dIZ8MtLvlM/RXEohI0EzEVcsEOmu4NcnaS1yOQoLuX+LOzOyeC+4ZfwL1/de3MZkiDce5wImyn1Z9EXhEoQj12IpKnpEsyegh2Q7TrYTk2iYzzO9NTTew7OIF8LYFY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:0fffd25e-02e3-436e-bf16-511e749c8050,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:03cc6635-a6a3-44f7-8aad-08fee1939a08,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b37b3105ec5c4ef6a3b78d12977db031-20221215
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <alice.chao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1213283926; Thu, 15 Dec 2022 20:44:43 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 16 Dec 2022 11:14:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 16 Dec 2022 11:14:05 +0800
From: Alice Chao <alice.chao@mediatek.com>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <stanley.chu@mediatek.com>, <peter.wang@mediatek.com>,
	<chun-hung.wu@mediatek.com>, <alice.chao@mediatek.com>,
	<powen.kao@mediatek.com>, <naomi.chu@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<qilin.tan@mediatek.com>, <lin.gui@mediatek.com>, <yanxu.wei@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<wsd_upstream@mediatek.com>
Subject: [PATCH 1/1] scsi: Add length check to prevent invalid memory access
Date: Fri, 16 Dec 2022 11:13:22 +0800
Message-ID: <20221216031320.2634-1-alice.chao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_194449_272032_7868B0A8 
X-CRM114-Status: GOOD (  11.89  )
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

Device reset thread uses kobject_uevent_env() to get kobj.parent(kobj.p)
, and it races with device init thread which calls device_add() to add
kobj.parent before kobject_uevent_env().

Device init call:           Device reset call:
scsi_probe_and_add_lun()    scsi_evt_thread()
  scsi_add_lun()             scsi_evt_emit()
   scsi_sysfs_add_sdev()      kobject_uevent_env() //get kobj.parent
    scsi_target_add()           kobject_get_path()
                                 len = get_kobj_path_length ()
                                 //len=1 because parent hasn't created yet
    device_add() // add kobj.parent
      kobject_uevent_env()
       kobject_get_path()         path = kzalloc()
        fill_kobj_path()           fill_kobj_path()
                            // --length; length -= cur is a negative value
                         memcpy(path + length, kobject_name(parent), cur);
                         // slab OOB!

Above backtrace describes the problem, device reset thread will get wrong
kobj.parent when device init thread didn't add kobj/parent yet. When this
racing happened, it triggers the a KASAN dump on the final iteration:

BUG: KASAN: slab-out-of-bounds in kobject_get_path+0xf8/0x1b8
Write of size 11 at addr ffffff80d6bb94f5 by task kworker/3:1/58
<snip>

Call trace:
 __kasan_report+0x124/0x1c8
 kasan_report+0x54/0x84
 kasan_check_range+0x200/0x208
 memcpy+0xb8/0xf0
 kobject_get_path+0xf8/0x1b8
 kobject_uevent_env+0x228/0xa88
 scsi_evt_thread+0x2d0/0x5b0
 process_one_work+0x570/0xf94
 worker_thread+0x7cc/0xf80
 kthread+0x2c4/0x388

These two jobs are scheduled asynchronously, we can't guaranteed that
kobj.parent will be created in device init thread before device reset
thread calls kobject_get_path().

To prevent length -= cur from being a negative value, we add length
check in fill_kobj_path() to prevent invalid memory access.

Signed-off-by: Alice Chao <alice.chao@mediatek.com>
---
 lib/kobject.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/kobject.c b/lib/kobject.c
index af1f5f2954d4..3cccb8e88d4e 100644
--- a/lib/kobject.c
+++ b/lib/kobject.c
@@ -121,6 +121,10 @@ static void fill_kobj_path(struct kobject *kobj, char *path, int length)
 		int cur = strlen(kobject_name(parent));
 		/* back up enough to print this name with '/' */
 		length -= cur;
+
+		if (length <= 0)
+			break;
+
 		memcpy(path + length, kobject_name(parent), cur);
 		*(path + --length) = '/';
 	}
-- 
2.18.0


