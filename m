Return-Path: <SRS0=VCtr=AT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 072F4C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2020 14:58:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C764E20720
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2020 14:58:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tKEh+CBD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C764E20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eWa26dYhh8KGhEc1uNHFSWhq2/tX/aMXRJAUWtyYM64=; b=tKEh+CBDetYnV3FTtEP+KqG3o
	jjuQT0V3SFWe+eUq4pf0c+FRzB4Vwz29edNCt/VyErLwYFI0CSACVtrG79eV0wlVp2ujESwUHodt0
	uTitLHGos5bjjXKbtXw4D8t9FOQv1x/qtNvUfUDhM3UhON8aJ9TmU+UUulvRsHb9KiAaXhtnaP7UG
	JFFOEzaFbUneSUtq0cUKeqA7ggqN99uu0ThVBSyYWmaOUptEuLBUqMXjgMzVZCV23za8w7Tj9KANN
	gNNe0pGzlar86i9/GbbiLHNfeGJyMXlWvg7LovPmWmPo5GfG62yty2KvNuuvbj35Z6bqNXG90radu
	9At7EdR0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtBWf-00029c-IL; Wed, 08 Jul 2020 14:58:21 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtBWd-00028n-RR; Wed, 08 Jul 2020 14:58:20 +0000
IronPort-SDR: /NnsMn1Mu9fCDt/dR+Cymf0hAS3L6WUUlP7R0A3/C3StSbhApLLoUAGSHNJs6Sq2A6t8oIqpa/
 t7JPWg7OwUZQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="212750321"
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; d="scan'208";a="212750321"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 07:58:17 -0700
IronPort-SDR: id16Q0uJtbOwrtqSPDTWmtvVUzlkhQZprKMISQjsDMxp0dUVrEX7FPeAtyajoU+9ZFd/GiqnvE
 KR9Em0UU8CYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; d="scan'208";a="427862028"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga004.jf.intel.com with ESMTP; 08 Jul 2020 07:58:13 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jtBWY-000gwo-3z; Wed, 08 Jul 2020 17:58:14 +0300
Date: Wed, 8 Jul 2020 17:58:14 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: sean.wang@mediatek.com
Subject: Re: [PATCH v5] tty: serial: don't do termios for BTIF
Message-ID: <20200708145814.GN3703480@smile.fi.intel.com>
References: <7c67171728cdcc4ccc10adfaea1a14bfbcf8375a.1594163304.git.sean.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7c67171728cdcc4ccc10adfaea1a14bfbcf8375a.1594163304.git.sean.wang@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_105820_018664_81F8BE59 
X-CRM114-Status: GOOD (  17.08  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Steven Liu <steven.liu@mediatek.com>,
 arnd@arndb.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, tthayer@opensource.altera.com,
 linux-serial@vger.kernel.org, jslaby@suse.com, matthias.bgg@gmail.com,
 sr@denx.de, mika.westerberg@linux.intel.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jul 08, 2020 at 07:11:22AM +0800, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Bluetooth Interface (BTIF) is designed dedicatedly for MediaTek SOC with
> BT in order to be instead of the UART interface between BT module and Host
> CPU, and not exported to user space to access.
> 
> As the UART design, BTIF will be an APB slave and can transmit or receive
> data by MCU access, but doesn't provide termios function like baudrate and
> flow control setup.
> 
> Even LCR on offset 0xC that is just a FAKELCR
> a. If FAKELCR[7] is equaled to 1, RBR(0x00), THR(0x00), IER(0x04)
>    will not be readable/writable.
> 
> b. If FAKELCR is equaled to 0xBF, RBR(0x00), THR(0x00), IER(0x04),
>    IIR(0x08), and LSR(0x14) will not be readable/writable.
> 
> So adding a new capability 'UART_CAP_NTIO' for the unusual unsupported
> case.
> 
> The bluetooth driver would use BTIF device as a serdev. So the termios
> still function would be called in kernelspace from ttyport_open in
> drivers/tty/serdev/serdev-ttyprt.c.

...
>  	up->port.quirks |= skip_txen_test ? UPQ_NO_TXEN_TEST : 0;
> +
> +	if (up->port.type == PORT_MTK_BTIF)
> +		up->port.quirks |= UPQ_IGNORE_TERMIOS;

I don't like to see this in core.

Can we have this inside 8250_port.c? Something like extending struct
serial8250_config to carry quirks and assign them when you add a port or start
it (wherever it's appropriated)?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
