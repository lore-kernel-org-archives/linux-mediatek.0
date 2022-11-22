Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73682C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 11:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HLfCmvTA7XX9kHpprIfVaZHlyBrC288B65o6uhfAvVg=; b=Pxq1jgkbHj+pc7I5+JAr0gCPP6
	f0XWqprDyytiRwy5beNYcFINgM8umI99ASvtL9MrBTPT/Cmc+Ay2ul4K9XE0he1noSZQTQLE9YAqX
	soNM0/mAodDjgkihoklbP2wOPj5bNpV7BFyVoKS9kb2UwFuLayFK4aK0zobOtPDOKsTGcE6gjWmVL
	kxA3kaO8mD10wcQ1z+rxu8jpdlc2VBx5BLSwr465J2ONhCdXK6taApWunxzeudZwIMPd9SYHeCGhd
	gLaIo+TkMOkPS2+Q1iWtwwLu5lq82sZ5GkJ6HUICfcxi+aA5ZcCtY6wHQj+WgCqZo/xAimx2Mcqgr
	bqSs5B1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxRw0-008hBi-Bg; Tue, 22 Nov 2022 11:59:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxRvw-008h6z-TV
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 11:59:26 +0000
X-UUID: e742d0dd6065416dacae9b694afd356a-20221122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=HLfCmvTA7XX9kHpprIfVaZHlyBrC288B65o6uhfAvVg=;
	b=QcQ9rKFcHLZE9DKEVcitV7RjbzhcUIxC/KEg89SEYZiS9Ij1sRjSml3EPPmziJAriUOSW/DQLDC7aPvshmk8HmQNN63MeL7yBpOx2shuw8UaBFWD7yigda+vas4E20n5JOL8YB/iJKPsndzWk3/VlmjpbfhWzlV4tjdMK3xSvN8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:c16c5f8f-975f-483d-ad0d-fa45a85d2037,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:5704802f-2938-482e-aafd-98d66723b8a9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e742d0dd6065416dacae9b694afd356a-20221122
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yanchao.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1898199931; Tue, 22 Nov 2022 04:59:18 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 22 Nov 2022 19:27:16 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 22 Nov 2022 19:27:14 +0800
From: Yanchao Yang <yanchao.yang@mediatek.com>
To: Loic Poulain <loic.poulain@linaro.org>, Sergey Ryazanov
	<ryazanov.s.a@gmail.com>, Johannes Berg <johannes@sipsolutions.net>, "David S
 . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev ML
	<netdev@vger.kernel.org>, kernel ML <linux-kernel@vger.kernel.org>
CC: MTK ML <linux-mediatek@lists.infradead.org>, Liang Lu
	<liang.lu@mediatek.com>, Haijun Liu <haijun.liu@mediatek.com>, Hua Yang
	<hua.yang@mediatek.com>, Ting Wang <ting.wang@mediatek.com>, Felix Chen
	<felix.chen@mediatek.com>, Mingliang Xu <mingliang.xu@mediatek.com>, Min Dong
	<min.dong@mediatek.com>, Aiden Wang <aiden.wang@mediatek.com>, Guohao Zhang
	<guohao.zhang@mediatek.com>, Chris Feng <chris.feng@mediatek.com>, Yanchao
 Yang <yanchao.yang@mediatek.com>, Lambert Wang <lambert.wang@mediatek.com>,
	Mingchuang Qiao <mingchuang.qiao@mediatek.com>, Xiayu Zhang
	<xiayu.zhang@mediatek.com>, Haozhe Chang <haozhe.chang@mediatek.com>,
	MediaTek Corporation <linuxwwan@mediatek.com>
Subject: [PATCH net-next v1 13/13] net: wwan: tmi: Add maintainers and documentation
Date: Tue, 22 Nov 2022 19:27:10 +0800
Message-ID: <20221122112710.161020-1-yanchao.yang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_035924_984229_4E935A48 
X-CRM114-Status: GOOD (  14.67  )
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

From: MediaTek Corporation <linuxwwan@mediatek.com>

Adds maintainers and documentation for MediaTek TMI 5G WWAN modem
device driver.

Signed-off-by: Felix Chen <felix.chen@mediatek.com>
Signed-off-by: MediaTek Corporation <linuxwwan@mediatek.com>
---
 .../networking/device_drivers/wwan/index.rst  |  1 +
 .../networking/device_drivers/wwan/tmi.rst    | 48 +++++++++++++++++++
 MAINTAINERS                                   | 11 +++++
 3 files changed, 60 insertions(+)
 create mode 100644 Documentation/networking/device_drivers/wwan/tmi.rst

diff --git a/Documentation/networking/device_drivers/wwan/index.rst b/Documentation/networking/device_drivers/wwan/index.rst
index 370d8264d5dc..8298629b4d55 100644
--- a/Documentation/networking/device_drivers/wwan/index.rst
+++ b/Documentation/networking/device_drivers/wwan/index.rst
@@ -10,6 +10,7 @@ Contents:
 
    iosm
    t7xx
+   tmi
 
 .. only::  subproject and html
 
diff --git a/Documentation/networking/device_drivers/wwan/tmi.rst b/Documentation/networking/device_drivers/wwan/tmi.rst
new file mode 100644
index 000000000000..3655779bf692
--- /dev/null
+++ b/Documentation/networking/device_drivers/wwan/tmi.rst
@@ -0,0 +1,48 @@
+.. SPDX-License-Identifier: BSD-3-Clause-Clear
+
+.. Copyright (c) 2022, MediaTek Inc.
+
+.. _tmi_driver_doc:
+
+====================================================
+TMI driver for MTK PCIe based T-series 5G Modem
+====================================================
+The TMI(T-series Modem Interface) driver is a WWAN PCIe host driver developed
+for data exchange over PCIe interface between Host platform and MediaTek's
+T-series 5G modem. The driver exposes control plane and data plane interfaces
+to applications. The control plane provides device node interfaces for control
+data transactions. The data plane provides network link interfaces for IP data
+transactions.
+
+Control channel userspace ABI
+=============================
+/dev/wwan0at0 character device
+------------------------------
+The driver exposes an AT port by implementing AT WWAN Port.
+The userspace end of the control channel pipe is a /dev/wwan0at0 character
+device. Application shall use this interface to issue AT commands.
+
+/dev/wwan0mbim0 character device
+--------------------------------
+The driver exposes an MBIM interface to the MBIM function by implementing
+MBIM WWAN Port. The userspace end of the control channel pipe is a
+/dev/wwan0mbim0 character device. Applications shall use this interface
+for MBIM protocol communication.
+
+Data channel userspace ABI
+==========================
+wwan0-X network device
+----------------------
+The TMI driver exposes IP link interfaces "wwan0-X" of type "wwan" for IP
+traffic. Iproute network utility is used for creating "wwan0-X" network
+interfaces and for associating it with the MBIM IP session.
+
+The userspace management application is responsible for creating a new IP link
+prior to establishing an MBIM IP session where the SessionId is greater than 0.
+
+For example, creating a new IP link for an MBIM IP session with SessionId 1:
+
+  ip link add dev wwan0-1 parentdev wwan0 type wwan linkid 1
+
+The driver will automatically map the "wwan0-1" network device to MBIM IP
+session 1.
diff --git a/MAINTAINERS b/MAINTAINERS
index a96c60c787af..eac544b274ac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13058,6 +13058,17 @@ L:	netdev@vger.kernel.org
 S:	Supported
 F:	drivers/net/wwan/t7xx/
 
+MEDIATEK TMI 5G WWAN MODEM DRIVER
+M:	Yanchao Yang <yanchao.yang@mediatek.com>
+M:	Min Dong <min.dong@mediatek.com>
+M:	MediaTek Corporation <linuxwwan@mediatek.com>
+R:	Liang Lu <liang.lu@mediatek.com>
+R:	Haijun Liu <haijun.liu@mediatek.com>
+R:	Lambert Wang <lambert.wang@mediatek.com>
+L:	netdev@vger.kernel.org
+S:	Supported
+F:	drivers/net/wwan/tmi/
+
 MEDIATEK USB3 DRD IP DRIVER
 M:	Chunfeng Yun <chunfeng.yun@mediatek.com>
 L:	linux-usb@vger.kernel.org
-- 
2.32.0


