Return-Path: <SRS0=tiIh=64=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353BEC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 14:23:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ADD52065D
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 14:23:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hsmhPBpN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0ADD52065D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+w/nid8rOch0SQbfCZLFaDfLuLZQJwJICSfy2F2lJL0=; b=hsmhPBpND/nVia
	FNLajA2I/rPGRecPFU5ZA/ty9XyDK5PcD+c8EulbCDmT2fqrP5AlrG/G34dxx7uLqUckgUhOVFUeH
	fM3eSoYhKy0t6tMVRxlJ3kBfpjmtH2X8izGlNf+KZvc11QkwuJubV2s3h0VV4Zx64Kcpe1TBtGCPE
	OEXOGF12OaSK7kV2vqHvzBiZjLZgD9FLlZbkdy9v3aj5QlPI+34IvPNRRT3+fmX9UzUxxgGtwcL8Y
	Po28MTeWAQIV8AcFb5LUdNmbw2HRgs/zMuHaIAwK2WYU71tShtErgvGs3YIwcFuBtJgV1jxg5sOq6
	MBpDNLBnxUZDhE2tIyuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZElB-0007b0-LV; Thu, 14 May 2020 14:22:53 +0000
Received: from netrider.rowland.org ([192.131.102.5])
 by bombadil.infradead.org with smtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZEl2-0007Rg-1D
 for linux-mediatek@lists.infradead.org; Thu, 14 May 2020 14:22:45 +0000
Received: (qmail 14203 invoked by uid 500); 14 May 2020 10:22:37 -0400
Date: Thu, 14 May 2020 10:22:37 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Subject: Re: [PATCH] usb: gadget: u_serial: fix coverity warning: negative
 index at array
Message-ID: <20200514142237.GB12181@rowland.harvard.edu>
References: <1589443500-3990-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1589443500-3990-1-git-send-email-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_072244_225982_8F35D361 
X-CRM114-Status: GOOD (  13.19  )
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
Cc: Stan Lu <stan.lu@mediatek.com>, Felipe Balbi <balbi@kernel.org>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Sergey Organov <sorganov@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 14, 2020 at 04:05:00PM +0800, Macpaul Lin wrote:
> This issue has been reported by coverity scanner.
> Replace "int portnum" by "unsigned int", this void negative index at
> array.

Can you please explain this more fully?  Why does coverity think the 
code might use a negative array index?  Is there some possibility that 
the portnum value might actually be negative?

It's noticeable that your patch doesn't actually change any values, only 
the type.  This means that if the code was buggy before, it's still 
buggy.  Alternatively, if the code wasn't buggy before then coverity got 
a false positive, so no change should be needed.

Alan Stern

> Signed-off-by: Stan Lu <stan.lu@mediatek.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  drivers/usb/gadget/function/u_serial.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
> index 8167d37..53951f2 100644
> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c
> @@ -587,7 +587,7 @@ static int gs_start_io(struct gs_port *port)
>   */
>  static int gs_open(struct tty_struct *tty, struct file *file)
>  {
> -	int		port_num = tty->index;
> +	unsigned int	port_num = tty->index;
>  	struct gs_port	*port;
>  	int		status = 0;
>  
> @@ -1211,7 +1211,7 @@ int gserial_alloc_line_no_console(unsigned char *line_num)
>  	struct gs_port			*port;
>  	struct device			*tty_dev;
>  	int				ret;
> -	int				port_num;
> +	unsigned int			port_num;
>  
>  	coding.dwDTERate = cpu_to_le32(9600);
>  	coding.bCharFormat = 8;
> -- 
> 1.7.9.5

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
