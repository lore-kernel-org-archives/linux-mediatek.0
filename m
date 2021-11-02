Return-Path: <SRS0=eBCQ=PV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9C8C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 12:12:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E22260F24
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 12:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E22260F24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=smui540XLAlOo/SIX0GEw4lu+Sjzi2DI57HhiQLFDHw=; b=atT0BODPUkjp0G
	dGL0BFHJsq+b+kDG5aHfPpvKZHkNtujY2g9x03Lhd1KnNfb58E5oHHHx9xFVvi777Ph64Z1wSmcHn
	9d+Qqwf2dghwA2XJFgZwt5s00wFDXFdilWXqbMkikaNpLAB3NV0CGjMNUh9nh/KjRfvy5iiOB1NHO
	GR1W1RLajzF/tyetVdemSglA7RleXoJgKddXnp30NjjldbVN4NTw0gdPrATfTSW5IGZ3xsI66eF0g
	gG1q8UL/CqmAmCqNbG4NT/LWLfF96F1JTnQDwaQNa1iUC5JIwrDHS/UvQKsvADGj/J2tjQMIzH6gO
	MxeDpYAqQdBNk2V/4I2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhseH-001bOz-OO; Tue, 02 Nov 2021 12:12:17 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhse3-001bJw-Gn; Tue, 02 Nov 2021 12:12:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o6FGnU4FYOY3wyYVmDluYr+k4/2zK3R/YdK8+ZD+B24=; b=xcBw0Q2V9DCSvPYJKTfqqnt58Y
 Xxi0DhL4Go3hSmgmSTgUKCBZtG/cqy3CiK/5jx2H3aDtAlltAzP1H5p2UTKPiXQDJA+o538iXovEP
 /FxuEUidPzD7z9R3XJnumXLmvIerc1DIkMtH/sg/cHQyE8aEEDOW590g3N9MQl/Qkgc2a6X4Jl9RF
 QZtmo1k87gLy1FpzUvbuuQKGoLtMIrLa0HWfEoYI+W8hriexTPLAN12u4vF8Wln7tCirizlfSqK6a
 Xag91bRze7t2HHj9PJCLJ1/HRdurlHwC1AuGBu7F0Q7hZBEuqDo6yrJO531TXnOEJgRwnQJmHxkfE
 3OeQn7uA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55436)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1mhsds-0003mX-PL; Tue, 02 Nov 2021 12:11:52 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1mhsdp-0005Oz-CD; Tue, 02 Nov 2021 12:11:49 +0000
Date: Tue, 2 Nov 2021 12:11:49 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
 matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, yj.chiang@mediatek.com
Subject: Re: [PATCH] remoteproc: use %d format string to print return error
 code
Message-ID: <YYErBcJlkTi0sJ/N@shell.armlinux.org.uk>
References: <20211102120805.27137-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211102120805.27137-1-mark-pk.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_051203_582570_35BB9FC5 
X-CRM114-Status: UNSURE (   8.82  )
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

On Tue, Nov 02, 2021 at 08:08:05PM +0800, Mark-PK Tsai wrote:
> Use %d format string to print return error code which
> make the error message easier to understand.

Even better, if you use %pe after converting "ret" to a pointer via
ERR_PTR(ret), when the kernel is appropriately configured, the kernel
will give a textual version of the error code, which is even easier!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
