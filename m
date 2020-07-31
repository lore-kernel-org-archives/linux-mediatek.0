Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA65C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 08:20:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6AE320838
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 08:20:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ErqHN7LW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6AE320838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XIouMYCd44Axij/NuZh+5CBk9MW+xGrt2GuaxCgaRJs=; b=ErqHN7LWjQ+rgvedxs2K0c10c3
	QZW9U8GtA7yQO+m1h12Udi9F5b+dAEsLG/CAhtjNMIwzpukiQVqjVud6df7ARUiTYtgx5RwFTqZ/T
	dEvlks1TwbddynO8F957MqgDDHTgN3gfY+JzCBOCk4a21S5T7Xe9gmzCPwT3i14VJfkjBwv/AWrXn
	aEGhlHbWtEuDWeaoMRyxEmLil1rGPGZQyVknwfv9V+XmfXX1/LvDtkZ+Y75X20uzoDMJxDXl5IRl/
	wHaLhfKmerm1KC9e3XSQNL5fGen5YChXwEL043cZ4oBBCVQCPgbd0qSjJZ8+De5K/yts69xOqdUdh
	yX8VnY+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1QHS-0002RI-Fl; Fri, 31 Jul 2020 08:20:42 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1QHM-0002Jr-Dy; Fri, 31 Jul 2020 08:20:37 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 9DCCE504443213A5E4B4;
 Fri, 31 Jul 2020 16:20:17 +0800 (CST)
Received: from localhost (10.174.179.108) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Fri, 31 Jul 2020
 16:20:10 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <chunfeng.yun@mediatek.com>, <gregkh@linuxfoundation.org>
Subject: [PATCH -next] usb: mtu3: Remove unsused inline function is_first_entry
Date: Fri, 31 Jul 2020 16:20:08 +0800
Message-ID: <20200731082008.33016-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.179.108]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_042036_720164_97DDBF53 
X-CRM114-Status: UNSURE (   6.89  )
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
Cc: YueHaibing <yuehaibing@huawei.com>, linux-usb@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

It is never used, so can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/usb/mtu3/mtu3.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index 71f4f02c05c6..aef0a0bba25a 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -370,12 +370,6 @@ static inline struct mtu3 *gadget_to_mtu3(struct usb_gadget *g)
 	return container_of(g, struct mtu3, g);
 }
 
-static inline int is_first_entry(const struct list_head *list,
-	const struct list_head *head)
-{
-	return list_is_last(head, list);
-}
-
 static inline struct mtu3_request *to_mtu3_request(struct usb_request *req)
 {
 	return req ? container_of(req, struct mtu3_request, request) : NULL;
-- 
2.17.1



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
