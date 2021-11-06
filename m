Return-Path: <SRS0=PDpd=PZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83DA8C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Nov 2021 16:56:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50B0061027
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Nov 2021 16:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50B0061027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sQTscBxBrVNt0Um/jl6zuKw1lBGh0ePCU8cyQuy+9Lw=; b=Ox56uHLcbaPsQz
	22wIKbeQgMop6E9d0JeFsc9kLFuT2qj6DI8eCrZtQuyyNQb5TMlT5slayrUXem8w4KbCjxvL+z5z7
	H7AFWbUbxzmgonDWqZtz9EYUhrznZAa/zU06aa3HkN4Ia9aUFcl0Gf2vuF56ZvxbEybz6XcFpjvr0
	9UzZnHtJpVIJl6VdErYHMzFIvj727QsRQunDLHLsokxzp/eYBb9nLxeiY6D0dulKJw2ka0yfFXlub
	xzjW9W9YvLs4Cwn6VWhx52ZgpCSxCDdJJ8r3z39cQDhEESx1r8t00wnjXyr37IGrpzy8pM08Y8/fX
	qpmOKQUijQX9lCW7OKbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjOzN-00DBOs-Em; Sat, 06 Nov 2021 16:56:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjMuL-00D3NJ-RS; Sat, 06 Nov 2021 14:43:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=28SA5w7a4FGniuHeq9wxq2PI3sdPVPF1CRfe7uLqUGQ=; b=mepvb6RTZMm8BEUN2AyQUCSY/d
 k4sqbARF+9e74dA5c8RzbHcZhkS3rTqWBUFp9CRb+Yvzts/IIFd/idLo1UddhbKqDNOxQxAHm3+E5
 zur8/fsj1BmuDl4JZ9zuJDapfyoaSeIJNDGMgWt5Iw3pGufRqr2RlV7UWeY2r4HFp9ZrppXTQUCIW
 IKJ4VOEThMu6Y2Du0O/VW9ETcef+8JnI6TMuSXRMXfQnNwhpGDRgkuMmuoYxYbHT98mmkYntsFrpv
 IbEtNV5jXFWz6zYbhrqsKAHqnIpOo63j9sCpCI7mCLITignolo6kXuYK/CRqeVt6FyoXcvJgGL7IC
 MBmd7XdQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjMuI-00EXAw-5d; Sat, 06 Nov 2021 14:43:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2649561074;
 Sat,  6 Nov 2021 14:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1636209714;
 bh=EFQSWC2A+sX79AmgQ55mM3lCqICyKef/vVuUVtOUPQg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B5IpqBXMdalPSmjvlnYyi3YP7VMHGKHlDz/6TjOOZeIrivWSz086HWVdeXGyLo2S8
 e3KTbd32XN9GYgi+d2+MIIK/AsFtMFwYMv1Mr/Cv0jUL+3NPZ40255JEXNDmW3F7Xs
 KJ1hZrmTTuNExDUxBlwaWuTytkEnyxVZYN11FEXE=
Date: Sat, 6 Nov 2021 15:41:47 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: stern@rowland.harvard.edu, mr.yming81@gmail.com,
 chunfeng.yun@mediatek.com, matthias.bgg@gmail.com,
 nishadkamdar@gmail.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, eddie.hung@mediatek.com
Subject: Re: [PATCH] xhci: Fix USB 3.1 enumeration issues by increasing
 roothub power-on-good delay
Message-ID: <YYaUK/rjuAOucOpI@kroah.com>
References: <20211105133050.GA1590803@rowland.harvard.edu>
 <20211105160036.549516-1-mathias.nyman@linux.intel.com>
 <YYVYrksU5/aCB3Fd@kroah.com>
 <b5b59fb7-40ce-929e-479a-d0605994cb53@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b5b59fb7-40ce-929e-479a-d0605994cb53@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211106_144258_450892_48F398E4 
X-CRM114-Status: GOOD (  14.91  )
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

On Fri, Nov 05, 2021 at 09:56:59PM +0200, Mathias Nyman wrote:
> On 5.11.2021 18.15, Greg KH wrote:
> > On Fri, Nov 05, 2021 at 06:00:36PM +0200, Mathias Nyman wrote:
> >> Some USB 3.1 enumeration issues were reported after the hub driver removed
> >> the minimum 100ms limit for the power-on-good delay.
> >>
> >> Since commit 90d28fb53d4a ("usb: core: reduce power-on-good delay time of
> >> root hub") the hub driver sets the power-on-delay based on the
> >> bPwrOn2PwrGood value in the hub descriptor.
> >>
> >> xhci driver has a 20ms bPwrOn2PwrGood value for both roothubs based
> >> on xhci spec section 5.4.8, but it's clearly not enough for the
> >> USB 3.1 devices, causing enumeration issues.
> >>
> >> Tests indicate full 100ms delay is needed.
> >>
> >> Reported-by: Walt Jr. Brake <mr.yming81@gmail.com>
> >> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > 
> > So this needs:
> > 	Fixes: 90d28fb53d4a ("usb: core: reduce power-on-good delay time of root hub")
> > right?
> 
> I guess so, not sure on "Fixes" policy here.
> 
> This patch fixes an xhci issue revealed by ("usb: core: reduce power-on-good delay time of root hub")
> That original patch itself looks correct, but these two patches should really go together to
> avoid any enumeration issues.  

Great, I'll use that tag for now so that it will get backported
properly.

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
