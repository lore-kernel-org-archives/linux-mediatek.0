Return-Path: <SRS0=Y6KA=6G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FCEBC54FCB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2020 18:09:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7398B2076E
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2020 18:09:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KPQFEbnn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y12gr1v8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7398B2076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EkDklizsnBg24a1ll5DE0VmPN5aN6bzXxnXIEz9D2rE=; b=KPQFEbnnoqFfG8
	Hc3ck06jzXbIRAkZ2hhCMNL1VeDT/PhFZSJI0oxvGPvBle586N/aJw2H67bKWvEJKfn7Txtm35KMI
	cMFKsIb+RIR8uYyZI01XvaPFfzvB53OU34J2HvXMdjk5y7gibGUVpvKyekS697za1TYui1mP2PFPJ
	lP0R8OlTncPuxdk6dJz6Sew4+CaS64oQb8wh0RHiiR3Hbq1jy+5M6dFRBDJ4OM9KeUQqd6eHAi0GP
	O1JQc2iTID8mL5J15aLYdj6eTM3E1WfsTSkyMvXaQ//4XCJ8lm8xpc8OOn8gtVcsE0K9hC0t16cxT
	FdO2Enx9aKeG5/FN7yhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRJo8-0004ty-Ob; Wed, 22 Apr 2020 18:09:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRJnz-0004iM-2v; Wed, 22 Apr 2020 18:09:04 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4867B2076E;
 Wed, 22 Apr 2020 18:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587578942;
 bh=DbXSxiXMHu9tU9vMTNParw5iSEIHMpG8ZCFcfxstLUg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y12gr1v8W3Cp5my1PFVQOqrT0SNBpbvuG4iD9FgpkkdHHdSLfpRXKfi0+6uOMVdWV
 dKVWetYESo596O1mJfxXE8Tkhhozi1bUCryhNmRDCs1TiAsHMY/3CF7hvaTANkoKoh
 FVDAUp8UhagDM3QQ8E2ewFDBizGrQFbskObzXK9Q=
Date: Wed, 22 Apr 2020 20:09:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: sean.wang@mediatek.com
Subject: Re: [PATCH v3] tty: serial: don't do termios for BTIF
Message-ID: <20200422180900.GA3454664@kroah.com>
References: <cc41ea10be9ab96568f0371784e3b9f8d9f434b9.1587577548.git.sean.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cc41ea10be9ab96568f0371784e3b9f8d9f434b9.1587577548.git.sean.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_110903_145398_EDE5F45E 
X-CRM114-Status: UNSURE (   7.93  )
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
Cc: andriy.shevchenko@linux.intel.com, Steven Liu <steven.liu@mediatek.com>,
 arnd@arndb.de, linux-kernel@vger.kernel.org,
 Ryder Lee <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 tthayer@opensource.altera.com, linux-serial@vger.kernel.org, jslaby@suse.com,
 matthias.bgg@gmail.com, sr@denx.de, mika.westerberg@linux.intel.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Apr 23, 2020 at 02:02:08AM +0800, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Bluetooth Interface (BTIF) is designed dedicatedly for MediaTek SOC with
> BT in order to be instead of the UART interface between BT module and Host
> CPU, and not exported to user space to access.
> 
> As the UART design, BTIF will be an APB slave and can transmit or receive
> data by MCU access, but doesn't provide termios function like baudrate and
> flow control setup.

Why does it matter?  If the connection isn't exported to userspace, who
would run those termios functions on the port?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
