Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B976C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 13:09:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 679A660FE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 13:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 679A660FE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bbRTcPkWXtgGXXgC70mb0XG5bPuDj4fHlt9GlB0L68E=; b=FL6m+X6InvsUi/
	OECxqrOo5m5ZXfvdKUjgGiPW0OEzPH+F8Lr4GAGp2nZipFmWcZAIugdr4/GPOsfcEcWHHNqD2ebLe
	UxgUW+Jq3Jx4YsPu24fLgqiy8e1bWoVBQ/xxO42GGb+BlWYu1kJzAUXfPC/UIecQSPkkAh0XQyf7o
	mnLcWcUUiMOyASRC5M4/KxEmp3KMfB9DmEWnUnUDqMe3uyVRRfcPBvPrwQwUzJMXzDzgjWPXGBoSq
	bZlOLFYpZR9mSzQ9XdHsP6Er5Ji/yFK0Yj2Pzz1M7zNu3Q3+OLRGfTN/4WN1MXIoF1NTPd03knym7
	RayrnvbRhgQdkGhsZPPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvg9f-007GVh-DO; Tue, 22 Jun 2021 13:09:27 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvg9O-007GRY-0b; Tue, 22 Jun 2021 13:09:14 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15MD7YWJ016699; Tue, 22 Jun 2021 13:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=nNGhc4wVJo2amK5VSNy7N7O6Kcp1UZjvj4FvRgNDlDU=;
 b=gVzJ8fnTUgU5WtWYj6Ff099RIDwila0KKyhfLqNc0q2DxEM5eXGFyfV01TY58zsX8C7N
 PLAV44lfsC2D7j5ODt1/pFd7vFDvl02RG7JAoi47mpP1jCmNbxgYTCVo+wVSkXev2+mX
 5AU2MZgPQNthPjnlISpg7QC/SKmohKsbZY2mGJ14mVw3EoiuCnK9KIUoP2MiLR66Mhxk
 s4IniOrM4ZiK3F9QB/XAManTAV6vs3m9U/EalzyCCjH4RtzZ2ZmH2W6rXPIDpyqHcUUo
 OgE2nyDXZY/jIvMA9aTLtW82nOtccJsOP3dtnA9gi8rt1EogPTNqehKZeqFRdlUY3mdy YQ== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39ap66k9va-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 13:09:02 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15MD67RX147909;
 Tue, 22 Jun 2021 13:09:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 3998d7e3ax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 13:09:01 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15MD71pv151810;
 Tue, 22 Jun 2021 13:09:00 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 3998d7e3a8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 13:09:00 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15MD8xKO009280;
 Tue, 22 Jun 2021 13:08:59 GMT
Received: from mwanda (/102.222.70.252)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 22 Jun 2021 06:08:59 -0700
Date: Tue, 22 Jun 2021 16:08:52 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] mailbox: mtk-cmdq: Fix uninitialized variable in
 cmdq_mbox_flush()
Message-ID: <YNHg5NuJILrrBIZ/@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: 8p3wwlkN12fs7dM7rr5b_8Wf51qeErBx
X-Proofpoint-GUID: 8p3wwlkN12fs7dM7rr5b_8Wf51qeErBx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_060910_224088_A8D04E69 
X-CRM114-Status: GOOD (  14.32  )
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

The "cb" pointer needs to be initialized before can assign
"data.data = cb->data;".

Fixes: 4a3cb0303984 ("mailbox: mtk-cmdq: Use mailbox rx_callback")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 301e65b9527a..67a42b514429 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -455,10 +455,10 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 
 	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
 				 list_entry) {
+		cb = &task->pkt->async_cb;
 		data.sta = -ECONNABORTED;
 		data.data = cb->data;
 		data.pkt = task->pkt;
-		cb = &task->pkt->async_cb;
 		if (cb->cb)
 			cb->cb(data);
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
