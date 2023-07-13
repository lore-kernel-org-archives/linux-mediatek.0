Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916E0EB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 05:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E2jkB6QuAT5TlLxmNf2eeEz1sQnQ+ByDeLjjrUTWBMw=; b=Tj9dN/tzdS2AWaqxWBku22eHI/
	XrtuSB4VbvqhJQgEddcEHL2TV6jgn9/GhaY8e+3GmAZ3wpTsAkbzMxb6ANS7Ox848hSCPcgC+l9ga
	eB6GWecJ7D4G6SRkBmN7fm+cIXGwkMhHYBAvHvSNLwjdgbWqSrhYh6QLHvCiynLdR7NahpYkTI3Qr
	gjNjTveULuTvY6MKqanQmL8wukIIJx1AKlM7JJQoOR2u2wdpg2qa4tZmExQxCw7udo41STAOXRC8w
	X3sCcPqIjlPvTJ7qKGTf7/ys5FifrJus/VIrRffcfzbLfRBsiC5xk74W0xLFjVw4aovFqTZL0roCE
	CUw9mqJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJpLr-0023Gh-0P;
	Thu, 13 Jul 2023 05:58:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJpLn-0023Fb-0k;
	Thu, 13 Jul 2023 05:58:52 +0000
X-UUID: 53f02476214211ee912e1518a6540028-20230712
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=E2jkB6QuAT5TlLxmNf2eeEz1sQnQ+ByDeLjjrUTWBMw=;
	b=hv3ckB1Xns6N3GoUxMirUA0WCgMMx0un/B6rCi1RWMknilAc2TcARp/6okIsBFvfWq/8rkilxLFow7UL/yb/cINPjf1UlinkZo1QMoKrI+SHQYcomfPajL1eS4S7nW9AwyNYDDWtNymS8LYq+HVIjMKogHlQSZtXUFRA4ClXXEU=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:02308809-29d7-47a3-b7ab-0afbb323ce6d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:95
X-CID-INFO: VERSION:1.1.28,REQID:02308809-29d7-47a3-b7ab-0afbb323ce6d,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:95
X-CID-META: VersionHash:176cd25,CLOUDID:0cf5f1da-b4fa-43c8-9c3e-0d3fabd03ec0,B
	ulkID:230713135847XYKTJNQV,BulkQuantity:0,Recheck:0,SF:38|29|28|16|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,
	TF_CID_SPAM_USA
X-UUID: 53f02476214211ee912e1518a6540028-20230712
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <mark-pk.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 205841360; Wed, 12 Jul 2023 22:58:45 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 13 Jul 2023 13:58:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 13 Jul 2023 13:58:43 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	<dm-devel@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <yj.chiang@mediatek.com>, Peter Korsgaard <peter@korsgaard.com>, Mike
 Snitzer <snitzer@kernel.org>, <stable@vger.kernel.org>, Mark-PK Tsai
	<mark-pk.tsai@mediatek.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH 5.15] dm init: add dm-mod.waitfor to wait for asynchronously probed block devices
Date: Thu, 13 Jul 2023 13:58:37 +0800
Message-ID: <20230713055841.24815-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_225851_280858_985231D3 
X-CRM114-Status: GOOD (  17.60  )
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

From: Peter Korsgaard <peter@korsgaard.com>

Just calling wait_for_device_probe() is not enough to ensure that
asynchronously probed block devices are available (E.G. mmc, usb), so
add a "dm-mod.waitfor=<device1>[,..,<deviceN>]" parameter to get
dm-init to explicitly wait for specific block devices before
initializing the tables with logic similar to the rootwait logic that
was introduced with commit  cc1ed7542c8c ("init: wait for
asynchronously scanned block devices").

E.G. with dm-verity on mmc using:
dm-mod.waitfor="PARTLABEL=hash-a,PARTLABEL=root-a"

[    0.671671] device-mapper: init: waiting for all devices to be available before creating mapped devices
[    0.671679] device-mapper: init: waiting for device PARTLABEL=hash-a ...
[    0.710695] mmc0: new HS200 MMC card at address 0001
[    0.711158] mmcblk0: mmc0:0001 004GA0 3.69 GiB
[    0.715954] mmcblk0boot0: mmc0:0001 004GA0 partition 1 2.00 MiB
[    0.722085] mmcblk0boot1: mmc0:0001 004GA0 partition 2 2.00 MiB
[    0.728093] mmcblk0rpmb: mmc0:0001 004GA0 partition 3 512 KiB, chardev (249:0)
[    0.738274]  mmcblk0: p1 p2 p3 p4 p5 p6 p7
[    0.751282] device-mapper: init: waiting for device PARTLABEL=root-a ...
[    0.751306] device-mapper: init: all devices available
[    0.751683] device-mapper: verity: sha256 using implementation "sha256-generic"
[    0.759344] device-mapper: ioctl: dm-0 (vroot) is ready
[    0.766540] VFS: Mounted root (squashfs filesystem) readonly on device 254:0.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Mike Snitzer <snitzer@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 .../admin-guide/device-mapper/dm-init.rst     |  8 +++++++
 drivers/md/dm-init.c                          | 22 ++++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/device-mapper/dm-init.rst b/Documentation/admin-guide/device-mapper/dm-init.rst
index e5242ff17e9b..981d6a907699 100644
--- a/Documentation/admin-guide/device-mapper/dm-init.rst
+++ b/Documentation/admin-guide/device-mapper/dm-init.rst
@@ -123,3 +123,11 @@ Other examples (per target):
     0 1638400 verity 1 8:1 8:2 4096 4096 204800 1 sha256
     fb1a5a0f00deb908d8b53cb270858975e76cf64105d412ce764225d53b8f3cfd
     51934789604d1b92399c52e7cb149d1b3a1b74bbbcb103b2a0aaacbed5c08584
+
+For setups using device-mapper on top of asynchronously probed block
+devices (MMC, USB, ..), it may be necessary to tell dm-init to
+explicitly wait for them to become available before setting up the
+device-mapper tables. This can be done with the "dm-mod.waitfor="
+module parameter, which takes a list of devices to wait for::
+
+  dm-mod.waitfor=<device1>[,..,<deviceN>]
diff --git a/drivers/md/dm-init.c b/drivers/md/dm-init.c
index b0c45c6ebe0b..dc4381d68313 100644
--- a/drivers/md/dm-init.c
+++ b/drivers/md/dm-init.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/ctype.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/device-mapper.h>
 #include <linux/init.h>
@@ -18,12 +19,17 @@
 #define DM_MAX_DEVICES 256
 #define DM_MAX_TARGETS 256
 #define DM_MAX_STR_SIZE 4096
+#define DM_MAX_WAITFOR 256
 
 static char *create;
 
+static char *waitfor[DM_MAX_WAITFOR];
+
 /*
  * Format: dm-mod.create=<name>,<uuid>,<minor>,<flags>,<table>[,<table>+][;<name>,<uuid>,<minor>,<flags>,<table>[,<table>+]+]
  * Table format: <start_sector> <num_sectors> <target_type> <target_args>
+ * Block devices to wait for to become available before setting up tables:
+ * dm-mod.waitfor=<device1>[,..,<deviceN>]
  *
  * See Documentation/admin-guide/device-mapper/dm-init.rst for dm-mod.create="..." format
  * details.
@@ -266,7 +272,7 @@ static int __init dm_init_init(void)
 	struct dm_device *dev;
 	LIST_HEAD(devices);
 	char *str;
-	int r;
+	int i, r;
 
 	if (!create)
 		return 0;
@@ -286,6 +292,17 @@ static int __init dm_init_init(void)
 	DMINFO("waiting for all devices to be available before creating mapped devices");
 	wait_for_device_probe();
 
+	for (i = 0; i < ARRAY_SIZE(waitfor); i++) {
+		if (waitfor[i]) {
+			DMINFO("waiting for device %s ...", waitfor[i]);
+			while (!dm_get_dev_t(waitfor[i]))
+				msleep(5);
+		}
+	}
+
+	if (waitfor[0])
+		DMINFO("all devices available");
+
 	list_for_each_entry(dev, &devices, list) {
 		if (dm_early_create(&dev->dmi, dev->table,
 				    dev->target_args_array))
@@ -301,3 +318,6 @@ late_initcall(dm_init_init);
 
 module_param(create, charp, 0);
 MODULE_PARM_DESC(create, "Create a mapped device in early boot");
+
+module_param_array(waitfor, charp, NULL, 0);
+MODULE_PARM_DESC(waitfor, "Devices to wait for before setting up tables");
-- 
2.18.0


