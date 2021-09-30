Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92223C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 16:14:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24F696141B
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 16:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 24F696141B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yGbxcQsEIQ6pAmmirItlEnTu0eOaXaw9QcBXNFhRHbk=; b=af3kBNoh82Xnec
	vcAdOTNUqDbeH1zvTyIZtme9cMmOP6KxtFhl4FjzM06rfk29pmMUUO7vX0kRjXImDX1TWih/7n/7S
	cR5ZFvgcptSPKWUdHW+KBv7UgRgehop9ddooHj+szaHCpy+s3zElAlhdff1/5JkgK/TZXvKZLHPfq
	kPxqfqynHhrwXyFDW+6Z2ixn3Zsv+NQM39c+dF06CzPTss4xAknQIZFXqTQlfqNIJuhCvVCxOW4Ch
	k4VzMd7+7Gs+pJBJ5JnTqRSScsppWUZbGXRbt1fkzv43bqmd04SrQuR1Za1tabwJY2HI5EgUaFSmD
	TezdMFw+pQwIekKt0Z4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVyhF-00FAb7-Tp; Thu, 30 Sep 2021 16:14:09 +0000
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mVygh-00FAM9-C4; Thu, 30 Sep 2021 16:13:37 +0000
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 18UGDFBc8009853,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36503.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 18UGDFBc8009853
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 1 Oct 2021 00:13:15 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36503.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Fri, 1 Oct 2021 00:13:15 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Thu, 30 Sep 2021 09:13:15 -0700
Received: from RTEXMBS04.realtek.com.tw ([fe80::cdd5:82a3:e854:7098]) by
 RTEXMBS04.realtek.com.tw ([fe80::cdd5:82a3:e854:7098%5]) with mapi id
 15.01.2106.013; Fri, 1 Oct 2021 00:13:14 +0800
From: Hayes Wang <hayeswang@realtek.com>
To: Oliver Neukum <oneukum@suse.com>, Jason-ch Chen
 <jason-ch.chen@mediatek.com>, "matthias.bgg@gmail.com"
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
Thread-Index: AQHXtPF6mRt31KuIqUSf0ySwz113xKu6nqYQ//+g0oCAAYwXgIAAt/FQ
Date: Thu, 30 Sep 2021 16:13:14 +0000
Message-ID: <9a23368b27bd42299e74235f1f8be3fa@realtek.com>
References: <20210929051812.3107-1-jason-ch.chen@mediatek.com>
 <cbd1591fc03f480c9f08cc55585e2e35@realtek.com>
 <4c2ad5e4a9747c59a55d92a8fa0c95df5821188f.camel@mediatek.com>
 <274ec862-86cf-9d83-7ea7-5786e30ca4a7@suse.com>
In-Reply-To: <274ec862-86cf-9d83-7ea7-5786e30ca4a7@suse.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.192.91.194]
x-kse-serverinfo: RTEXDAG01.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzkvMzAgpFWkyCAwMjozODowMA==?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36503.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_091335_589794_8A8D42E2 
X-CRM114-Status: GOOD (  14.05  )
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

Oliver Neukum <oneukum@suse.com>
> Sent: Thursday, September 30, 2021 5:30 PM
[...]
> Hi,
> 
> Hayes proposed a solution. Basically you solve this the way HID or WDM do it
> delaying resubmission. This makes me wonder whether this problem is specific
> to any driver. If it is not, as I would argue, do we have a deficiency
> in our API?

I think the major question is that the driver doesn't know whether
it is necessary to stop submitting bulk transfer or not. There are
two situations with the same error code. One needs to resubmit
the bulk transfer. The other needs to stop the transfer. The original
idea is that the disconnect event would stop submitting transfer for
the second situation. However, for this case, the disconnect event
comes very late, so the submission couldn't be stopped in time.
The best solution is the driver could get another error code which
indicates the device is disappear for the second situation.  Then,
I don't need to do delayed resubmission.

Best Regards,
Hayes
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
