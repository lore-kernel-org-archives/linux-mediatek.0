Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA26C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 06:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8i4x/mwUJ8ykmZTRvUljBkWg1Nr9eu0kchcsmorp4cE=; b=Uu6L+mx3evI4FXf8SZlOY5CSSW
	bP6dlzH7gfN5J1EOkiQIDswIzjONwY3h7ZZTAZcjGeYe3Mwros0x0NZ9fpK7IL32r6uaS8c01rWzM
	s6tmkDve3+YzJOyJ8DbXcgR0QNzLc4bWLuldMdsn1XY37v/tmrjJftZ5RAMffajlUzs+oEUyYNTHa
	xXEphFQs/hoY8/WoZXoq75NEjBqQaCaUXQ4zCbTeEQEFf/poOjOv9lw4WorIcFhtYcqTqBXEKJYL+
	NXHk61lXjH92wxaZUFbQ7OafugrT2pHwJ3GYgTKc9Xd9FYioJfZzW7FVAzHiOPd37PaaSSGkl3KBO
	F9Ra037w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBs1S-00BJ2f-Dv; Thu, 14 Jul 2022 06:08:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBs1P-00BJ0T-38
	for linux-mediatek@lists.infradead.org; Thu, 14 Jul 2022 06:08:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4E3E261377;
	Thu, 14 Jul 2022 06:08:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D443C34114;
	Thu, 14 Jul 2022 06:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657778901;
	bh=jTQ/LyaYu+ARB0uVYgcaJmX7KusOZC2F4u5PaYlebJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rF00CT6C+ERTa7bYl82AbZdlhHqLE6sMYd8MieOzHoOXNJzT5mXgGkUjMtjBQcF2S
	 xNFIZREC4AUxzFrVeDnuTjOdAahqS0ug2nvYmhIHyUOnjboMFff+Go0v8svr/JlcLZ
	 NSj5BMG8gp6vfZmsWzY4qGCUBnhnNfTXdpOSpZSA=
Date: Thu, 14 Jul 2022 08:08:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: sean.wang@kernel.org
Cc: stable@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH 5.15 1/5] Revert "mt76: mt7921: Fix the error handling
 path of mt7921_pci_probe()"
Message-ID: <Ys+y0vP9PKc+skNE@kroah.com>
References: <4bdcd29552ba78c87d8799181b9acddec465ad3c.1657764335.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bdcd29552ba78c87d8799181b9acddec465ad3c.1657764335.git.sean.wang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_230823_213232_BE5E596B 
X-CRM114-Status: GOOD (  12.08  )
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

On Wed, Jul 13, 2022 at 07:07:37PM -0700, sean.wang@kernel.org wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> This reverts commit 663457f421d41e9d2fcb1e84baf43d1433f80c08.

What is the commit id of this in Linus's tree?

> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
> There was mistaken in
> 649178c0493e ("mt76: mt7921e: fix possible probe failure after reboot")
> that caused WiFi reset cannot work well as the reported issue
> "PROBLEM: [Stable v5.15.42+] [mt7921] Wake after suspend locks up system
> when mt7921-driver is used on a Lenovo ThinkPad E15 G3"
> in http://lists.infradead.org/pipermail/linux-mediatek/2022-June/042668.html
> So we need to revert the patch first. Will be applied again later.

We need all of this context in the changelog text.

Please fix up and resend.

thanks,

greg k-h

