Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9BBC27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 07:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U7JboHS+8f700/0r7dXQ2wq+jRDkoPUXLFMelFlwKf8=; b=xXfxCsmcRZlZxzTAIdhG6S5iwG
	br2U40xuyB1HD2UrgQY04IlRmu0iHjUD0k0RwFCXUxBJz16uC5O7ps5bIfvxZmpb7fgze+GRwVecc
	IlzlfZGxV3SeFaGHTMHu1t4h65ddkWxvuh436rBxuwOorxbxU2OfIcF8twc/1lrzb0A261L6JAtu9
	TGDgyQA/s/37mUiKUvUuJC7OSEOn8fbCcrB3Djj9VkO5m1bRWWo6zAkR3oTsBjCcRSpCYCm3uYZPW
	1jniEayGm6lyEglIAEN60Ldj3yXRKWyAtWNUsbTObbsrnu+YOf4RHThsvr1PgVfwZxpTKmmXUyX5H
	WmyuXDbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIpH-0000000BXts-2QyW;
	Wed, 12 Jun 2024 07:55:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIpE-0000000BXrf-0AEs;
	Wed, 12 Jun 2024 07:55:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C11A612E1;
	Wed, 12 Jun 2024 07:55:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B61C3277B;
	Wed, 12 Jun 2024 07:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718178919;
	bh=kA+gK3R1K0N3WlcTK15m+Is6Wd1GEeoj6lkFDDgAOGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W82+Lsoifld1Xd0wRHjr777X5Id5PyHMOGCc1qjZuHKvHM/rGphrmsPqp37Ngyy6s
	 KYWxRjuX+xeBl5O7BXUBfCnTzs0gJkGgO6d0k5bpgdk/sra8DB1OL/MSnKZLVp8tZs
	 VYJKDLywhQdEr+1Y0DX9Bc3mdhMGwpBXbwEhgz04=
Date: Wed, 12 Jun 2024 09:55:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-leds@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Pavel Machek <pavel@ucw.cz>, stable@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH] leds: mt6360: fix memory leak in
 mt6360_init_isnk_properties()
Message-ID: <2024061209-giddily-slander-a6db@gregkh>
References: <20240611-leds-mt6360-memleak-v1-1-93642eb5011e@gmail.com>
 <010b1c91-fbde-4b01-a92e-8c14751c7699@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <010b1c91-fbde-4b01-a92e-8c14751c7699@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_005520_408870_EC55359F 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jun 11, 2024 at 04:01:49PM +0200, Markus Elfring wrote:
> …
> > Add the missing calls to fwnode_handle_put(child) to avoid memory leaks
> > in the error paths.
> 
> I suggest to apply a goto chain for a while.
> https://wiki.sei.cmu.edu/confluence/display/c/MEM12-C.+Consider+using+a+goto+chain+when+leaving+a+function+on+error+when+using+and+releasing+resources
> 
> Will the application of scope-based resource management become feasible with another delay?
> https://elixir.bootlin.com/linux/v6.10-rc3/source/include/linux/cleanup.h#L8
> 
> Regards,
> Markus
> 


Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot

