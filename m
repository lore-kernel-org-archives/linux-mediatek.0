Return-Path: <SRS0=4Hoy=HZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D1A9C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Feb 2021 06:36:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C0FE64E58
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Feb 2021 06:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C0FE64E58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+zx8m4KCWMaxIiLrF1HmE5SsfN0QhvHnhYXLwWFrimw=; b=aB/fyVCvZ09kVnJOTPD+4uKIWD
	mTDZ6L11Ldqqf4lPROdwID8tHP+PcZhMVLzjm33tRoL9vvvyvkMgRQaQGiNh1ygwDsuLmVmV3O2Id
	bnMcBXyo6LBstqLT+FYcGpse0ZxcnxlpscRmanZyBqjbb0Oc+fkQrzhnShUJIlBpz2XSj4XlNuBAL
	Sv8chrSPxCSN1PlC+PlvvBa9txq5/xhcLLVIggOkgGmW2PADdQ5johr5ZcZsaR8RFwjeLBMiFMUMq
	ZpYmXBlOM1t3XZfHG0VALz8YucY0ZSXHU1j/IWQFImrHAuovsPz8E73s4AbLhpXygo+/E144V6Cb8
	iUYAVDAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lERIf-0001Bz-Am; Tue, 23 Feb 2021 06:36:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lERIc-0001As-Rv
 for linux-mediatek@lists.infradead.org; Tue, 23 Feb 2021 06:36:00 +0000
X-UUID: 423ffb68443044879d86ebaaefc0010d-20210222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=SmLGiYqlqXSgcTYu/p5M/ejGeyBhLQwODtpSL5r0YEE=; 
 b=mp8ejI9KSdwQB/sLELX+qugvH8KihoQeXpsNzA+8+ezJbJaQHVSFO+mDPtthLsVaVO9r+fPKSTswZJ51kynHfCg98bBUsoEgYyrnW3DRUfeCisa08zMu5KZpcmKvVerOWkvGAEJW3bbWUwKYJlBVDRns4tF2Q6gwXGiQvfGE+MY=;
X-UUID: 423ffb68443044879d86ebaaefc0010d-20210222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-yw.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1909062659; Mon, 22 Feb 2021 22:35:54 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Feb 2021 22:27:44 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Feb 2021 14:27:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 23 Feb 2021 14:27:42 +0800
From: <mark-yw.chen@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>, <Sean.Wang@mediatek.com>
Subject: [PATCH 1/1] Bluetooth: btusb: Fix incorrect type in assignment and
 uninitialized symbol
Date: Tue, 23 Feb 2021 14:27:40 +0800
Message-ID: <20210223062740.12067-1-mark-yw.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_013559_666188_B7DFC474 
X-CRM114-Status: GOOD (  11.18  )
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
Cc: linux-bluetooth@vger.kernel.org, "mark-yw.chen" <mark-yw.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 lkp@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "mark-yw.chen" <mark-yw.chen@mediatek.com>

Warnings: drivers/bluetooth/btusb.c:3775 btusb_mtk_setup() error:
uninitialized symbol 'fw_version'.
-> add initial value for fw_version.

Warnings: sparse: sparse: incorrect type in assignment (different base
types)
-> add le32_to_cpu to fix incorrect type in assignment.

Signed-off-by: mark-yw.chen <mark-yw.chen@mediatek.com>
---
 drivers/bluetooth/btusb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 52683fd22e05..8193b1d74504 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3495,7 +3495,7 @@ static int btusb_mtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwnam
 	fw_ptr = fw->data;
 	fw_bin_ptr = fw_ptr;
 	globaldesc = (struct btmtk_global_desc *)(fw_ptr + MTK_FW_ROM_PATCH_HEADER_SIZE);
-	section_num = globaldesc->section_num;
+	section_num = le32_to_cpu(globaldesc->section_num);
 
 	for (i = 0; i < section_num; i++) {
 		first_block = 1;
@@ -3503,8 +3503,8 @@ static int btusb_mtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwnam
 		sectionmap = (struct btmtk_section_map *)(fw_ptr + MTK_FW_ROM_PATCH_HEADER_SIZE +
 			      MTK_FW_ROM_PATCH_GD_SIZE + MTK_FW_ROM_PATCH_SEC_MAP_SIZE * i);
 
-		section_offset = sectionmap->secoffset;
-		dl_size = sectionmap->bin_info_spec.dlsize;
+		section_offset = le32_to_cpu(sectionmap->secoffset);
+		dl_size = le32_to_cpu(sectionmap->bin_info_spec.dlsize);
 
 		if (dl_size > 0) {
 			retry = 20;
@@ -3740,7 +3740,7 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 	int err, status;
 	u32 dev_id;
 	char fw_bin_name[64];
-	u32 fw_version;
+	u32 fw_version = 0;
 	u8 param;
 
 	calltime = ktime_get();
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
