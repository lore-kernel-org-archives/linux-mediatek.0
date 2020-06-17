Return-Path: <SRS0=3SR4=76=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF85C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 03:51:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 728A22080D
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 03:51:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jCMSxMRJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NUE3uXzZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 728A22080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4PwNMTcGGVe2dlIIyc5PQq0/3WyvfwckagltF1PhgnA=; b=jCMSxMRJ2k0bt4
	iO4aI17k9arpbBANyOE4e+B4bvdhKEb83yiDHlaSv1Leve2w7hJRBGTjl9jFvMh2r1AWU6xn31boH
	7vlaO/qOBpLAAp4cIUV52j2VEAipAFoqZ9y2vzePuIl5ViCb2daOBPbDXCXV0lZxBlMUsRn26+c94
	8hdzhdwEi5ITz9I0YWSknXYHLfo10UH2XnOwoP1GnaM5mXoNKdLzZURgIEur8A451dirTbeZR/EL7
	j8N1D+5h/0PQNoksx7d1rN+rzRHxjwGPOP5TPq2q6F6eMRTjhC2EV+JYwo9LG1FmbeWhi1ns9SfMi
	CR2HqFJMb46NnATUM4vw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlP6j-000179-UP; Wed, 17 Jun 2020 03:51:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlP6a-0000zm-BT; Wed, 17 Jun 2020 03:51:17 +0000
X-UUID: ee8c8609ea3f4c55821ee5454d641e07-20200616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=E0n2lDonFBEI59Ci1XWwVT6HIPc/UsUckcKN/vDwwaE=; 
 b=NUE3uXzZCZjfQVdSh7lskhgR/2NE0EqrkTEtdkVyZl4g8eHFf1vejckADPY0aXiqG+9aoTQVB/pok3V2BElIgnnYTzTTGKB6opDKV01c+UUMIF65j4co5DoARzG4Nr4DsjU1VS8WBfV32dedHfbdNTmwTCrJvGVKh75uxMXvW98=;
X-UUID: ee8c8609ea3f4c55821ee5454d641e07-20200616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 886113131; Tue, 16 Jun 2020 19:51:08 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 20:51:04 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Jun 2020 11:51:00 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 17 Jun 2020 11:51:00 +0800
From: <sean.wang@mediatek.com>
To: <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3] tty: serial: don't do termios for BTIF
Date: Wed, 17 Jun 2020 11:50:59 +0800
Message-ID: <1592365859-26714-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <20200422180900.GA3454664@kroah.com>
References: <20200422180900.GA3454664@kroah.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_205116_470113_A1A146DA 
X-CRM114-Status: UNSURE (   6.69  )
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
 sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, tthayer@opensource.altera.com,
 linux-serial@vger.kernel.org, jslaby@suse.com, matthias.bgg@gmail.com,
 andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com, sr@denx.de,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

>On Thu, Apr 23, 2020 at 02:02:08AM +0800, sean.wang@mediatek.com wrote:
>> From: Sean Wang <sean.wang@mediatek.com>
>>
>> Bluetooth Interface (BTIF) is designed dedicatedly for MediaTek SOC
>> with BT in order to be instead of the UART interface between BT module
>> and Host CPU, and not exported to user space to access.
>>
>> As the UART design, BTIF will be an APB slave and can transmit or
>> receive data by MCU access, but doesn't provide termios function like
>> baudrate and flow control setup.
>
>Why does it matter?  If the connection isn't exported to userspace, who would run those termios functions on the port?

The bluetooth driver would use BTIF device as a serdev.

The termios function would be called in kernelspace from ttyport_open and then
to tty_set_termios defined in drivers/tty/serdev/serdev-ttyport.c.

>
>thanks,
>
>greg k-h
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
