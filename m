Return-Path: <SRS0=2fNz=AI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14716C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jun 2020 14:12:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0DE621852
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jun 2020 14:12:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A53ZTmiE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TfrrfsmE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0DE621852
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1BPWG01IJBVf5rhmQXEhTVwXXdSc5MH0FYBDQ/1JdWg=; b=A53ZTmiEjFqp0ypcEfsu3upKE
	rSL5Z7Nn2+A5dp4kREEKCK9WPz0Xk1FMgZvELsv5EKxULfkG3C3yuUFmRojYxzTCRVKQ8vipDcfdV
	vUX76QwVMuS9mDzukvOF9DxSZ0xvcUfw9c+p6/ljSTdS/IVoc+0No9BNnwGxOq+QtTyWbAtiXiQxc
	olx9SlHU8xWsODdk79Yvm45C5LFYfzBAOcf/Dueh3m5WuDnrlJ3yvzOlVve6l8v+2fICJKMgtBNmj
	/OAHI1w4mslEQ3EH/Q8wCMDyFtRLOrO9PqwNkT8Vw9LDs14IanPtIDe4ObhSjk5Y49mCAg2afrWOZ
	sclupvU6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpBZL-0003jZ-6a; Sat, 27 Jun 2020 14:12:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpBZG-0003j8-HY; Sat, 27 Jun 2020 14:12:31 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AFB4C2184D;
 Sat, 27 Jun 2020 14:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593267149;
 bh=Mm9Jr0Y6Toy3xKZiWCZpBQOjWvs88DP6/BkXW7NSloI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TfrrfsmELqDgVdyohdtQg5RGnq/X72CkFtYXD+vVAHqE8bU22zy+qL2STz3ewIsSp
 a82+ne6RpaLkVeJ5rbGMc/Yhr/6tyXaN6oAKecHhJLWOK+X4sw/UL9jgy/NSwDNSEn
 EEzmq/TNa+IF7b03gev789SKgOHxnvk12u9q00r8=
Date: Sat, 27 Jun 2020 16:12:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: sean.wang@mediatek.com
Subject: Re: [PATCH v4] tty: serial: don't do termios for BTIF
Message-ID: <20200627141222.GC1901451@kroah.com>
References: <78efa2b1e2599deff4d838b05b4054ec5ac2976a.1592595601.git.sean.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <78efa2b1e2599deff4d838b05b4054ec5ac2976a.1592595601.git.sean.wang@mediatek.com>
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
Cc: devicetree@vger.kernel.org, heikki.krogerus@linux.intel.com,
 david@lechnology.com, arnd@arndb.de, linux-serial@vger.kernel.org,
 Steven Liu <steven.liu@mediatek.com>, jan.kiszka@siemens.com, hpeter@gmail.com,
 linux-kernel@vger.kernel.org, tthayer@opensource.altera.com,
 Ryder Lee <ryder.lee@mediatek.com>, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, joel@jms.id.au, p.zabel@pengutronix.de,
 jslaby@suse.com, matthias.bgg@gmail.com, andriy.shevchenko@linux.intel.com,
 robert.jarzmik@free.fr, linux-arm-kernel@lists.infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Jun 20, 2020 at 03:59:14AM +0800, sean.wang@mediatek.com wrote:
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
> 
> Fixes: 1c16ae65e250 ("serial: 8250: of: Add new port type for MediaTek BTIF controller on MT7622/23 SoC")
> Cc: Steven Liu <steven.liu@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> 
> --
> v1->v2:
> no change on termios->c_cflag and refine commit message
> 
> v2->v3:
> change the naming from NMOD to NTIO as TIO is a well established prefix
> for termios IOCTLs.
> 
> v3->v4:
> 1. remove appropriate tag
> 2. add the explanation why the termios is required even when the connection
>    isn't exported to userspace.
> ---
>  drivers/tty/serial/8250/8250.h      | 1 +
>  drivers/tty/serial/8250/8250_port.c | 5 ++++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
> index 52bb21205bb6..0d9d3bfe48af 100644
> --- a/drivers/tty/serial/8250/8250.h
> +++ b/drivers/tty/serial/8250/8250.h
> @@ -82,6 +82,7 @@ struct serial8250_config {
>  #define UART_CAP_MINI	(1 << 17)	/* Mini UART on BCM283X family lacks:
>  					 * STOP PARITY EPAR SPAR WLEN5 WLEN6
>  					 */
> +#define UART_CAP_NTIO	(1 << 18)	/* UART doesn't do termios */

Naming is hard.  I will never remember what "NTIO" is, how about we make
it explicit:
	define UART_CAP_IGNORE_TERMIOS

And the _CAP_ name is getting out of hand, this isn't a "capability",
it's a "quirk for this port" but that's a battle to worry about later...

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
