Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C5CC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Dec 2021 10:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2YdC1SK6vptJcS4LNbjCITfae3V4h73eua8WXz0yblQ=; b=m2ozScWe1oVpc0
	eq/YDmZean80ZXh28gdhu8xepVnuq+AU6r1vfEDEkjVdmpw/1axDt0ID1G953CTdpXrM4UFGSLLBj
	NbEIR1DXF7ywGbb3rAcJZM3+1/mBDZO4sXHuiJ5Dii/KhvO9gBBJjmlsmIHBqdsLDIVm4o7dciAjG
	YvRUaVcr0ySEJUcGQFzcsBspwi2ZESMXcmkS59fttL9aKHCyRchZo9CHbEFnLSh8+Sd2NiNFOyuTG
	sVXFW9oS1a+XCwIJlt2lS//xBVGc/Vt89OhOSw4VOrG7mgyVV4Z/JEETAmiiGdgYPGxwmHkhksFJW
	5g1kx7NTox5DqSZs+9eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mytcr-00Fi3c-P6; Sun, 19 Dec 2021 10:41:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mytcg-00Fi1l-6H; Sun, 19 Dec 2021 10:40:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1811160C83;
 Sun, 19 Dec 2021 10:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42E80C36AE0;
 Sun, 19 Dec 2021 10:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1639910455;
 bh=vSC2BJyhnf6Q1CVJ13NrRvcfJTkRhr7dQpxqqDwXIvw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LoyK0JYVdZskNUm33a0xe5yTc4u8nllKzGjR4JTvwtLoc4i659gpry64XOzAMTZEG
 0W5JBHy3Q7LkzBrcQ7BDg6JRqLh+vf63s+4YtVKCwnDXMb3+wszNTrN//EpLuYZO+B
 Kq07EAeTByK4dZYe6WgNg4jKYdYG3S7G4wBH1Z/I=
Date: Sun, 19 Dec 2021 11:40:51 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Felipe Balbi <felipe.balbi@linux.intel.com>,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>, stable@vger.kernel.org,
 Yuwen Ng <yuwen.ng@mediatek.com>
Subject: Re: [PATCH v2 3/4] usb: mtu3: fix list_head check warning
Message-ID: <Yb8MM2zL2Ecfzv1/@kroah.com>
References: <20211218095749.6250-1-chunfeng.yun@mediatek.com>
 <20211218095749.6250-3-chunfeng.yun@mediatek.com>
 <64b9453a-84c5-8d41-26d5-698d1ae9d473@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <64b9453a-84c5-8d41-26d5-698d1ae9d473@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211219_024058_325033_5D99E334 
X-CRM114-Status: GOOD (  10.43  )
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

On Sun, Dec 19, 2021 at 01:14:25PM +0300, Sergei Shtylyov wrote:
> On 18.12.2021 12:57, Chunfeng Yun wrote:
> 
> > This is caused by uninitialization of list_head.
> 
>    Again, there's no such word as "uninitialization" (even if it existed, it
> wouldn't mean what you wanted to say); please replace by "not initializing".

We are not English language scholars, most of us do not have English as
their native language.  We all can understand what is being said here,
there's no need for any change, please do not be so critical.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
