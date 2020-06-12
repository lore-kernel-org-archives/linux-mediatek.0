Return-Path: <SRS0=I3u4=7Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5820C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2020 14:02:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 967EC206A4
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2020 14:02:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r22Ut3af"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 967EC206A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DeMsv5dfNhii5KJrPcAa8P+N/ivbivId2breCOYoUkk=; b=r22Ut3afN5ovBI
	+6hNCHfHC4M8sYyw3Fgx2KIg5bss6qi0Y/GiyR4SYSyN/qfes6Sqb05XSdEbXu0mm7FDtXiqLMU49
	SZ6tQVRCNDYNderiueYZxZz9baTTkTEu5/l3koGeT7gYbEqRzvSKyfhy934l7Z4xFIQPt0raxZtUA
	ukUF3R4/yHEnjQW8YwNpNLJTWzgJRXyukmO0I70HK7vPdLzramX1y5zeHyqu8peNydeGtb2gKU/Yt
	c4/qZbMSlQUihUP/h8pjfAdccqY7lIoDn/bNeUdLu6rUPE2fJHMFO61N8iHGf7eRBDg5XSn4hyg89
	3JFfAV3SWegLmGe0xGWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjkGM-00038w-Jb; Fri, 12 Jun 2020 14:02:30 +0000
Received: from netrider.rowland.org ([192.131.102.5])
 by bombadil.infradead.org with smtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjkGD-00030c-SM
 for linux-mediatek@lists.infradead.org; Fri, 12 Jun 2020 14:02:23 +0000
Received: (qmail 13466 invoked by uid 1000); 12 Jun 2020 10:02:11 -0400
Date: Fri, 12 Jun 2020 10:02:11 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Subject: Re: [PATCH] usb: replace hardcoded maximum usb string length by
 definition
Message-ID: <20200612140211.GA12639@rowland.harvard.edu>
References: <y>
 <1591939967-29943-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1591939967-29943-1-git-send-email-macpaul.lin@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200612_070222_056991_AA9EF78B 
X-CRM114-Status: UNSURE (   5.91  )
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
Cc: Felipe Balbi <balbi@kernel.org>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Jim Lin <jilin@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Macpaul Lin <macpaul.lin@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Siqi Lin <siqilin@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jun 12, 2020 at 01:32:47PM +0800, Macpaul Lin wrote:
> Replace hardcoded maximum usb string length (126 bytes) by definition
> "MAX_USB_STRING_LEN".
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

...

> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index 9f3c721..df4a9cb 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -1815,6 +1815,8 @@ static inline int usb_get_ptm_status(struct usb_device *dev, void *data)
>  		0, data);
>  }
>  
> +/* USB String descriptors can contain at most 126 characters. */
> +#define MAX_USB_STRING_LEN	126

This definition belongs in include/uapi/linux/usb/ch9.h (near the 
definition of struct usb_string_descriptor) because it is part of the USB 
standard rather than specific to the Linux USB stack.

Alan Stern

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
