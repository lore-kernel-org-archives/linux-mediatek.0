Return-Path: <SRS0=jwT2=OY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FBFCC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Oct 2021 02:16:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C807A61278
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Oct 2021 02:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C807A61278
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K79ftQp7Jjb6MOvhzk3yMdObnjeVwTOJHlNQBzo1ghk=; b=3gmgD0QE0mB8V5
	QUxtJlvWHAM/Y5WhjoVo+o0aYV51ljNcw9ZRbSpnn+Dpx4Tz7mFVNxeLeMSzD2A3MKnXVZP57SG+R
	RDDF6gizWDKBorgDElRgF1ZVkszwkqXVnBiLZOjLLkNIetzNLoOSsQaNkjvqKVzib/sDTxgLc7Hua
	HoJeYdSJ4fu6b4C/7hdDGz5z/LlHZyy1OC0uRu09sr1BeLfhl30YWZlCD8dBhusHJ+aUKkum0XlmW
	sVumVZ/SR4LMWGyNubdy6kBAILviq2KEMtLVlRbnvNv/4knuElde9R6zXS9HqUvp2CqG+Y0iJeUe7
	X+GrDKO2c3z/V5GlE5Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXDWc-004sSf-2v; Mon, 04 Oct 2021 02:16:18 +0000
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mXDWO-004sRa-Fn; Mon, 04 Oct 2021 02:16:06 +0000
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 1942FkVV2010014,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36503.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 1942FkVV2010014
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 4 Oct 2021 10:15:46 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36503.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Mon, 4 Oct 2021 10:15:45 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 4 Oct 2021 10:15:44 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::cdd5:82a3:e854:7098]) by
 RTEXMBS04.realtek.com.tw ([fe80::cdd5:82a3:e854:7098%5]) with mapi id
 15.01.2106.013; Mon, 4 Oct 2021 10:15:44 +0800
From: Hayes Wang <hayeswang@realtek.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: Oliver Neukum <oneukum@suse.com>, Jason-ch Chen
 <jason-ch.chen@mediatek.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "Project_Global_Chrome_Upstream_Group@mediatek.com"
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "hsinyi@google.com"
 <hsinyi@google.com>, nic_swsd <nic_swsd@realtek.com>
Subject: RE: [PATCH] r8152: stop submitting rx for -EPROTO
Thread-Topic: [PATCH] r8152: stop submitting rx for -EPROTO
Thread-Index: AQHXtPF6mRt31KuIqUSf0ySwz113xKu6nqYQ//+g0oCAAYwXgIAAYT6AgAFAzFCAAA04sIAARXcAgARaYuA=
Date: Mon, 4 Oct 2021 02:15:44 +0000
Message-ID: <21b97638ece04b4fbd81d29143b72137@realtek.com>
References: <20210929051812.3107-1-jason-ch.chen@mediatek.com>
 <cbd1591fc03f480c9f08cc55585e2e35@realtek.com>
 <4c2ad5e4a9747c59a55d92a8fa0c95df5821188f.camel@mediatek.com>
 <274ec862-86cf-9d83-7ea7-5786e30ca4a7@suse.com>
 <20210930151819.GC464826@rowland.harvard.edu>
 <3694347f29ed431e9f8f2c065b8df0a7@realtek.com>
 <5f56b21575dd4f64a3b46aac21151667@realtek.com>
 <20211001152226.GA505557@rowland.harvard.edu>
In-Reply-To: <20211001152226.GA505557@rowland.harvard.edu>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.177.203]
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?us-ascii?Q?Clean,_bases:_2021/10/3_=3F=3F_11:24:00?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36503.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 10/04/2021 01:57:09
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 166473 [Oct 04 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: hayeswang@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 463 463 5854868460de3f0d8e8c0a4df98aeb05fb764a09
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: realtek.com:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; 127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/04/2021 01:59:00
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211003_191604_711271_A2EBD6DB 
X-CRM114-Status: GOOD (  13.15  )
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

Alan Stern <stern@rowland.harvard.edu>
> Sent: Friday, October 1, 2021 11:22 PM
[...]
> That's right.  If the device and cable are working properly, this
> should never happen.  Or only extremely rarely (for example, caused
> by external electromagnetic interference).
> 
> > It seems to be reasonable why resubmission sometimes works.
> 
> Did you ever track down the reason why you got the -EPROTO error
> while debugging that other issue?  Can you reproduce it?

I didn't follow it, because it was not relative to the driver. Besides, we
didn't focus on -EPROTO at that time, because it was not the major issue.
And the -EPROTO occurred rarely indeed during a lot of transmission.
The hw engineer confirmed that the device completed the transfer
normally, but the driver still got an error from the host. I don't sure if
there was a USB HUB between the device and the USB host controller.
That are all what I know.

Best Regards,
Hayes


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
