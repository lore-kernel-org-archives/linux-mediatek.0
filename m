Return-Path: <SRS0=Oz0f=PY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5663C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 16:16:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F13161245
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 16:16:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F13161245
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ffEG8RLBErmg4DpTvxpjFx/YNhNG/92MhqCwUQ8aVOM=; b=G+oOsaG29/8sCc
	Uuf1op69U0PAoOvexd3c4hP0XXcjDh4Kw+7LgDVpUNcNk7taL4GijqB2VUWPS0waDD4E3Y/nNtKig
	l3ys/KzNdNHxWcHVtbOUESKo/ypz17+sr+fc3riomttxouDLzWxhi23sSW3qAGI2c37QPMixKO0lR
	yfQe4I8ScnAp6REogmAnzKBQX/aBJFzHzg0lzxPv72wSnqG+BVzMZ3xSAD5DivybJe2aLKOK00jCf
	Hcw3+VUuMs3C0uCCKP3k1BSxYPJBnVudfBDkQ2LJYwPv55qlYYZA3S/oT/2/+65PfwmwTlgPFdAHr
	vleElawSe+riLhI4JVuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mj1sk-00Bvi3-60; Fri, 05 Nov 2021 16:15:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mj1sX-00Bvf6-Vx; Fri, 05 Nov 2021 16:15:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A7A22604DA;
 Fri,  5 Nov 2021 16:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1636128945;
 bh=eSi2TxojiiMOdXbuKV6Ip/WfgZgHSEspnMEj6sfvcw4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bEYW6y5871BDRLKZrKbXuAZvyS7XQlm7dSk/rrkZMQb1+ivyocXHXl9F8pbwbTp3v
 6Ks3HJEGEH3EZvpHpHe8fwXFDA+CnoBLvNc/hDQ4zvcdSXmaS6l1GeyEqKi0deaYdJ
 FPiCuH3wi18aQy0pCxBiZQKzmRsYkYea4DKERTpI=
Date: Fri, 5 Nov 2021 17:15:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: stern@rowland.harvard.edu, mr.yming81@gmail.com,
 chunfeng.yun@mediatek.com, matthias.bgg@gmail.com,
 nishadkamdar@gmail.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, eddie.hung@mediatek.com
Subject: Re: [PATCH] xhci: Fix USB 3.1 enumeration issues by increasing
 roothub power-on-good delay
Message-ID: <YYVYrksU5/aCB3Fd@kroah.com>
References: <20211105133050.GA1590803@rowland.harvard.edu>
 <20211105160036.549516-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211105160036.549516-1-mathias.nyman@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_091546_075250_E5553D06 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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

On Fri, Nov 05, 2021 at 06:00:36PM +0200, Mathias Nyman wrote:
> Some USB 3.1 enumeration issues were reported after the hub driver removed
> the minimum 100ms limit for the power-on-good delay.
> 
> Since commit 90d28fb53d4a ("usb: core: reduce power-on-good delay time of
> root hub") the hub driver sets the power-on-delay based on the
> bPwrOn2PwrGood value in the hub descriptor.
> 
> xhci driver has a 20ms bPwrOn2PwrGood value for both roothubs based
> on xhci spec section 5.4.8, but it's clearly not enough for the
> USB 3.1 devices, causing enumeration issues.
> 
> Tests indicate full 100ms delay is needed.
> 
> Reported-by: Walt Jr. Brake <mr.yming81@gmail.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

So this needs:
	Fixes: 90d28fb53d4a ("usb: core: reduce power-on-good delay time of root hub")
right?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
