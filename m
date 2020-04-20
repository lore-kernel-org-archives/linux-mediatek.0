Return-Path: <SRS0=eXAR=6E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79F3C3A5A0
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2020 10:48:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72620205C9
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2020 10:48:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i9vKIJyW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72620205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xmNeuFsPbBLkcC4UgfwH6VvusZjE9Qm9K9blrLxyxKs=; b=i9vKIJyWDPdkhU
	P0e3jwCiUVBX4PNftrRAw6UzOqI+F+bjPw9o0JAaEuqUxUPa0ZC/Tg5OsrrLcR6LXDDxz/FheLaX4
	+tvlmLYOkCtBnHzKx+jM6U/r1f7GX00Qac0MsScLOHF1iO8kb9PK6ebIwtHS4Vp5LzUnpYN1+WQzy
	lYbSSVDRvVa20ZYyL+fMICRljOoNnkk9Cj66Bb/I6mbOXzeDEbjOMs8kWV8sMpRgUZB16fgMC6V1d
	7R5+L/188tKB8Pq5XfrWVo68wqaZqSjWQZ8rGQTaPcgSMpiy3niWtU/B/g4matkpmSXwuXSduOugk
	Vp/GardW0uEJyx1j5geQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQTya-0005vw-1q; Mon, 20 Apr 2020 10:48:32 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQTyX-0005mw-5c; Mon, 20 Apr 2020 10:48:30 +0000
IronPort-SDR: xvg4JcvPSNgzezY0YG+9seuLxV1clIlBXwwGmw58jxogUEilPH5RlvkK8Pmi/0SObpLMoqdes+
 j8+C/n3Yizew==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 03:46:27 -0700
IronPort-SDR: gqUa2NhFFBxpA+ZVLvhBn8RJ1hvpe6GB49JVUbOyEeRIcPXjthoaV+XHMwtDv7/Aw2elwXYQsb
 57n4HI9A7boQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,406,1580803200"; d="scan'208";a="456343723"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga006.fm.intel.com with ESMTP; 20 Apr 2020 03:46:22 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jQTwW-0020d9-Vj; Mon, 20 Apr 2020 13:46:24 +0300
Date: Mon, 20 Apr 2020 13:46:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: sean.wang@mediatek.com
Subject: Re: [PATCH v2] tty: serial: don't do termios for BTIF
Message-ID: <20200420104624.GM185537@smile.fi.intel.com>
References: <8c47aea3aa3cce4d7484b840ddb117cd16bcf1cc.1587347988.git.sean.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8c47aea3aa3cce4d7484b840ddb117cd16bcf1cc.1587347988.git.sean.wang@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_034829_263234_0B682BE9 
X-CRM114-Status: GOOD (  11.15  )
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
Cc: heikki.krogerus@linux.intel.com, david@lechnology.com, arnd@arndb.de,
 linux-serial@vger.kernel.org, Steven Liu <steven.liu@mediatek.com>,
 gregkh@linuxfoundation.org, hpeter@gmail.com, linux-kernel@vger.kernel.org,
 tthayer@opensource.altera.com, Ryder Lee <ryder.lee@mediatek.com>,
 jan.kiszka@siemens.com, joel@jms.id.au, p.zabel@pengutronix.de,
 jslaby@suse.com, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 robert.jarzmik@free.fr, linux-arm-kernel@lists.infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Apr 20, 2020 at 10:06:38AM +0800, sean.wang@mediatek.com wrote:
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
> So adding a new capability 'UART_CAP_NMOD' for the unusual unsupported
> case.

...

> +#define UART_CAP_NMOD	(1 << 18)	/* UART doesn't do termios */

I would rather spell it as NTIO or NO_TIO (as TIO is a well established prefix
for termios IOCTLs).


-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
