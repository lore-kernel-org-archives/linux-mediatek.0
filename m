Return-Path: <SRS0=M313=EX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC559C388F9
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2020 02:39:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C42D2469C
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2020 02:39:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0n3gisTB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C42D2469C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DDU08O1sz1AUbTY4IAN6wN6o6sHDlzq939/W6XoWv/Q=; b=0n3gisTBgdTTaaL4wisKRXK27u
	4Epqjy0fIx2+dgqhkZsE1jIZ6qhV423CkXm90h3BLO/fvr+q/WV4QoqlACtHvtTIA8EL8xG2luBuA
	sseTqq1I8+FW8w9vRQheBV3jKkLXaZFmWAzGuTnCUonYnuvx1ZWTzcsN4qSvVLlx6gbHkLuH6wNX7
	E5y5eWyELV6nBm4BAP/tmPeYwuAOsLBOI2f9rFY07PIEfzVcsU9XcXMSebfKwzvTLePVuY7HOkKmG
	xpt9aV4vlJPzN/SSRCjAsHw1HYK2bGKt81tfolhNj4p5W9Y75Od5a14b9PbOc11ZHBlDA+U9Yve0h
	x+7z7Tsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kequ4-0001s8-Ey; Tue, 17 Nov 2020 02:39:32 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kequ0-0001rR-Ls; Tue, 17 Nov 2020 02:39:29 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CZqrg6Qn9z15M16;
 Tue, 17 Nov 2020 10:38:59 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Tue, 17 Nov 2020 10:39:06 +0800
From: Jing Xiangfeng <jingxiangfeng@huawei.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>,
 <matthias.bgg@gmail.com>, <Mark-YW.Chen@mediatek.com>,
 <sean.wang@mediatek.com>
Subject: [PATCH] Bluetooth: btmtksdio: Add the missed release_firmware() in
 mtk_setup_firmware()
Date: Tue, 17 Nov 2020 10:43:32 +0800
Message-ID: <20201117024332.165771-1-jingxiangfeng@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_213929_010651_2E849B47 
X-CRM114-Status: GOOD (  11.58  )
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
Cc: linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jingxiangfeng@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mtk_setup_firmware() misses to call release_firmware() in an error
path. Jump to free_fw to fix it.

Fixes: 737cd06072a7 ("Bluetooth: btmtksdio: fix up firmware download sequence")
Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
---
 drivers/bluetooth/btmtksdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index c7ab7a23bd67..c2677ffbd3c0 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -704,7 +704,7 @@ static int mtk_setup_firmware(struct hci_dev *hdev, const char *fwname)
 	err = mtk_hci_wmt_sync(hdev, &wmt_params);
 	if (err < 0) {
 		bt_dev_err(hdev, "Failed to power on data RAM (%d)", err);
-		return err;
+		goto free_fw;
 	}
 
 	fw_ptr = fw->data;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
