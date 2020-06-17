Return-Path: <SRS0=3SR4=76=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D416C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 04:09:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E4E9206DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 04:09:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YLY27ynV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pABTy1T7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E4E9206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8eR/cnn/iGrLimWYEWF7nVKyi1bCEdH1EVitLak+Eec=; b=YLY27ynVg5oj/f
	GbLRYuSFELjGh5olgX98/qRAVROo/Z/67BSIQmKM5jpcJjS+Oqr+fpZA2RHCIx2Y3JpPnUd4oHMsC
	AUKwZk3N86T874Qy2yqz2Cm5fyug4KkKj4Z38RTKu6Mdsxh2TdPuu39reo3m2sGasVhdKSQnNthYL
	hwQMdBbPmc4GJH/batAp4LfsrCGERamoNRKv5O5RcweeN5zP4MV1fpD9VnfTyBaBWM8j1NFZGYI5w
	xKYdXrkJDycnU4KPDg2Wb2/lLPYM3wrvceC5oM4OZhKyI0khQio/I3yPQfCght/AgB2tT366pDNp4
	QiUZZADpb5Aad3rqRlnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlPNY-0001Rt-P4; Wed, 17 Jun 2020 04:08:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlPNQ-0001Ma-VG; Wed, 17 Jun 2020 04:08:42 +0000
X-UUID: 1d786445c1874bd59d4de727291a4d3d-20200616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=J8u4UWY2G4d5/E7DWKw+p+qbm1PghnIow5Vag4ifkTE=; 
 b=pABTy1T7Xcoou7TOVVET4AwChQc0Yj+mqREDzs2EHOoR3jYdXvGFPNkAs9XeFyHBfo68UXTN2OVL6eBoSeu7NFN7aK4/lU/HPHKwH4XIMWlTentiBsnj/VedVQHPjpeIGV5skLauQ7tHn/pHmnE8BRAzs77W84oZf9o7E9lrSx8=;
X-UUID: 1d786445c1874bd59d4de727291a4d3d-20200616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 531224116; Tue, 16 Jun 2020 20:08:32 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 20:58:32 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Jun 2020 11:58:21 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 17 Jun 2020 11:58:21 +0800
From: <sean.wang@mediatek.com>
To: <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3] tty: serial: don't do termios for BTIF
Date: Wed, 17 Jun 2020 11:58:20 +0800
Message-ID: <1592366300-29503-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <CAHp75VdSvE9RPq3V8LTVX7OjaYs1PThVi2f1roh3p5EY_k0ANA@mail.gmail.com>
References: <CAHp75VdSvE9RPq3V8LTVX7OjaYs1PThVi2f1roh3p5EY_k0ANA@mail.gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_210841_013074_B6ABDDB5 
X-CRM114-Status: UNSURE (   7.21  )
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
Cc: Ryder.Lee@mediatek.com, steven.liu@mediatek.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, sean.wang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 tthayer@opensource.altera.com, linux-serial@vger.kernel.org, jslaby@suse.com,
 matthias.bgg@gmail.com, andriy.shevchenko@linux.intel.com,
 mika.westerberg@linux.intel.com, sr@denx.de,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

>>
>> From: Sean Wang <sean.wang@mediatek.com>
>>
>> Bluetooth Interface (BTIF) is designed dedicatedly for MediaTek SOC
>> with BT in order to be instead of the UART interface between BT module
>> and Host CPU, and not exported to user space to access.
>>
>> As the UART design, BTIF will be an APB slave and can transmit or
>> receive data by MCU access, but doesn't provide termios function like
>> baudrate and flow control setup.
>>
>> Even LCR on offset 0xC that is just a FAKELCR a. If FAKELCR[7] is
>> equaled to 1, RBR(0x00), THR(0x00), IER(0x04)
>>    will not be readable/writable.
>>
>> b. If FAKELCR is equaled to 0xBF, RBR(0x00), THR(0x00), IER(0x04),
>>    IIR(0x08), and LSR(0x14) will not be readable/writable.
>>
>> So adding a new capability 'UART_CAP_NTIO' for the unusual unsupported
>> case.
>>
>> Fixes: 1c16ae65e250 ("serial: 8250: of: Add new port type for MediaTek
>> BTIF controller on MT7622/23 SoC")
>> Cc: Steven Liu <steven.liu@mediatek.com>
>
>> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
>I didn't suggest this change. I only commented on the name of the macro.

my fault. i will remove the tag from next version.

>
>> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
>>
>> --
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
