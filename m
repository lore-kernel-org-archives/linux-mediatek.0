Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0475DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 02:42:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E5A961881
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 02:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E5A961881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ooYNzXflhzrxDwNt9pL1bSur+PLrtJC+pbrhs+fgqfU=; b=ed4/tjNvWb5jS9
	SJMI9uDRF3w0fHY6zz83Y6Z49H7n7mVgejzVTbW+Yi5lzrlCF1tI27sTzh1KgN1Ug+NBd8AV2wdBN
	aGVfAo0EioXXX84oS1K6e90yplLRRrLwh9TQNSqQEe5JhoOgsKQLa9xVn5yzZE+H6dYQ69NPVXAkT
	/5TX4qNNQtZrnrsp4tsgpPXxXqcIdrAx854IzBxD9yq/M5owl03JR/i8NOVWYmmEfexuFivrh+J5o
	1otXzWvWno8T46j1QqP3hjjAvcEbSoh6mqkvsSiqxErkxYKi3UtWn5XmUBxRCIZwP6zhnbHdkVVFm
	+5NCw6W7MxdOINQuzDwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVm14-00CnOK-7z; Thu, 30 Sep 2021 02:41:46 +0000
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mVm0r-00CnMO-2U; Thu, 30 Sep 2021 02:41:34 +0000
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 18U2fJ811012331,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36503.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 18U2fJ811012331
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 30 Sep 2021 10:41:19 +0800
Received: from RTEXMBS02.realtek.com.tw (172.21.6.95) by
 RTEXH36503.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Thu, 30 Sep 2021 10:41:19 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 30 Sep 2021 10:41:18 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::cdd5:82a3:e854:7098]) by
 RTEXMBS04.realtek.com.tw ([fe80::cdd5:82a3:e854:7098%5]) with mapi id
 15.01.2106.013; Thu, 30 Sep 2021 10:41:18 +0800
From: Hayes Wang <hayeswang@realtek.com>
To: Jason-ch Chen <jason-ch.chen@mediatek.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "Project_Global_Chrome_Upstream_Group@mediatek.com"
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "hsinyi@google.com"
 <hsinyi@google.com>, nic_swsd <nic_swsd@realtek.com>
Subject: RE: [PATCH] r8152: stop submitting rx for -EPROTO
Thread-Topic: [PATCH] r8152: stop submitting rx for -EPROTO
Thread-Index: AQHXtPF6mRt31KuIqUSf0ySwz113xKu6nqYQ//+g0oCAAZuNgA==
Date: Thu, 30 Sep 2021 02:41:18 +0000
Message-ID: <7dc4198f05784b6686973500150faca7@realtek.com>
References: <20210929051812.3107-1-jason-ch.chen@mediatek.com>
 <cbd1591fc03f480c9f08cc55585e2e35@realtek.com>
 <4c2ad5e4a9747c59a55d92a8fa0c95df5821188f.camel@mediatek.com>
In-Reply-To: <4c2ad5e4a9747c59a55d92a8fa0c95df5821188f.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.177.203]
x-kse-serverinfo: RTEXMBS02.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?utf-8?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzkvMjkg5LiL5Y2IIDExOjI3OjAw?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36503.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_194133_273787_AAB754FC 
X-CRM114-Status: GOOD (  14.08  )
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

Jason-ch Chen <jason-ch.chen@mediatek.com>
> Sent: Wednesday, September 29, 2021 5:53 PM
[...]
> Hi Hayes,
> 
> Sometimes Rx submits rapidly and the USB kernel driver of opensource
> cannot receive any disconnect event due to CPU heavy loading, which
> finally causes a system crash.
> Do you have any suggestions to modify the r8152 driver to prevent this
> situation happened?

Do you mind to try the following patch?
It avoids to re-submit RX immediately.

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 60ba9b734055..bfe00af8283f 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -767,6 +767,7 @@ enum rtl8152_flags {
 	PHY_RESET,
 	SCHEDULE_TASKLET,
 	GREEN_ETHERNET,
+	SCHEDULE_NAPI,
 };
 
 #define DEVICE_ID_THINKPAD_THUNDERBOLT3_DOCK_GEN2	0x3082
@@ -1770,6 +1771,14 @@ static void read_bulk_callback(struct urb *urb)
 		rtl_set_unplug(tp);
 		netif_device_detach(tp->netdev);
 		return;
+	case -EPROTO:
+		urb->actual_length = 0;
+		spin_lock_irqsave(&tp->rx_lock, flags);
+		list_add_tail(&agg->list, &tp->rx_done);
+		spin_unlock_irqrestore(&tp->rx_lock, flags);
+		set_bit(SCHEDULE_NAPI, &tp->flags);
+		schedule_delayed_work(&tp->schedule, 1);
+		return;
 	case -ENOENT:
 		return;	/* the urb is in unlink state */
 	case -ETIME:
@@ -2425,6 +2434,7 @@ static int rx_bottom(struct r8152 *tp, int budget)
 	if (list_empty(&tp->rx_done))
 		goto out1;
 
+	clear_bit(SCHEDULE_NAPI, &tp->flags);
 	INIT_LIST_HEAD(&rx_queue);
 	spin_lock_irqsave(&tp->rx_lock, flags);
 	list_splice_init(&tp->rx_done, &rx_queue);
@@ -2441,7 +2451,7 @@ static int rx_bottom(struct r8152 *tp, int budget)
 
 		agg = list_entry(cursor, struct rx_agg, list);
 		urb = agg->urb;
-		if (urb->actual_length < ETH_ZLEN)
+		if (urb->status != 0 || urb->actual_length < ETH_ZLEN)
 			goto submit;
 
 		agg_free = rtl_get_free_rx(tp, GFP_ATOMIC);
@@ -6643,6 +6653,10 @@ static void rtl_work_func_t(struct work_struct *work)
 	    netif_carrier_ok(tp->netdev))
 		tasklet_schedule(&tp->tx_tl);
 
+	if (test_and_clear_bit(SCHEDULE_NAPI, &tp->flags) &&
+	    !list_empty(&tp->rx_done))
+		napi_schedule(&tp->napi);
+
 	mutex_unlock(&tp->control);
 
 out1:


Best Regards,
Hayes

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
