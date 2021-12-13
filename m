Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F81C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 14:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qi4LIIB3tCdhaA8vadpRv9KH6U23uKmz7ht3uS68mNo=; b=lgjP1Qv4UBM1XN
	Fgnw7ybggCpK5s2ze00pBu9mLgge3bK7XZUAmRRRwPDS0wM71t+IiqWAXgwqonfVC7ekuCJL/2Sqm
	Blkz9lZe4kRoVB6xdxM1EkYaFH7QIJm9z07TPJJalmPUbZjq3FXlAV3oVVIJWG8gny84x+Fe0rfO/
	ctPoaFfqpW7HVcK+14Hs4Wxpp8ps+woO1v1kClAHk9a+UF1+wyKFDPUkqH+mrSmKh48jV+98yL7cF
	JuQ7pv1GKIJQh5LEi0mFzTuRUauCJsV/ru49DTxreVl4BcjakSsDICxhq1cbrcQ/ygxSHHW5Ry7h0
	f6HeErmCtwdh26E3jojA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwmQn-00A5v6-Fp; Mon, 13 Dec 2021 14:35:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwmBJ-009zeo-Ey; Mon, 13 Dec 2021 14:19:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E34F561074;
 Mon, 13 Dec 2021 14:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D60C34602;
 Mon, 13 Dec 2021 14:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1639405196;
 bh=G5oL15r8MfACBMd4Acl40Vokbu2uNByzt91jDIyzlS4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r6C7sH9BeXpM3ZWMpbrtz5EUGv4/DvXWFtvpFkVgRwm586OCMYotKuqJUTwqTCk6Q
 qUhMlv2GlSiDYEVt0oGWwFBWTJdP8GNlJ6MldEJyyd8+fq1tMDX22zCuOjnUfzL2BU
 BMUyLKuLYe24bbvuLrFQLUx/2Ud4C+Akl9mfkVtg=
Date: Mon, 13 Dec 2021 15:19:53 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>, Yuwen Ng <yuwen.ng@mediatek.com>
Subject: Re: [PATCH 3/3] usb: mtu3: fix list_head check warning
Message-ID: <YbdWiYU+LJHWd4wQ@kroah.com>
References: <20211209031424.17842-1-chunfeng.yun@mediatek.com>
 <20211209031424.17842-3-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211209031424.17842-3-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_061957_583185_1CF996BD 
X-CRM114-Status: GOOD (  11.10  )
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

On Thu, Dec 09, 2021 at 11:14:24AM +0800, Chunfeng Yun wrote:
> This is caused by uninitialization of list_head.
> 
> BUG: KASAN: use-after-free in __list_del_entry_valid+0x34/0xe4
> 
> Call trace:
> dump_backtrace+0x0/0x298
> show_stack+0x24/0x34
> dump_stack+0x130/0x1a8
> print_address_description+0x88/0x56c
> __kasan_report+0x1b8/0x2a0
> kasan_report+0x14/0x20
> __asan_load8+0x9c/0xa0
> __list_del_entry_valid+0x34/0xe4
> mtu3_req_complete+0x4c/0x300 [mtu3]
> mtu3_gadget_stop+0x168/0x448 [mtu3]
> usb_gadget_unregister_driver+0x204/0x3a0
> unregister_gadget_item+0x44/0xa4
> 
> Reported-by: Yuwen Ng <yuwen.ng@mediatek.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/usb/mtu3/mtu3_gadget.c | 1 +
>  1 file changed, 1 insertion(+)

What commit does this fix?  Should it go to stable kernels?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
