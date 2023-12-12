Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383D8C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 11:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LznIPv+artTQrJcpJ3JO+c3yzW30qzm+L268Ns/clFw=; b=A80CYwAcJK7I2jcEkVNb+S/TiT
	s2gZsli6juIrcVrl8Iy5nHUalYhKwnCY/M5ssE6HiuQrRNr0zgcitV5yGTlryo1QjCNUBoUO5DrjX
	T5K/z6rSfm3Pku1XIzJN3Ld6ylJ7Ohv4qhBR0U34BSUc4U/NhetwOHw6bBNW0B3jp9AYytmWav8Tn
	GyEaDzE1FQqF+NFhujQAUjp7egnxhauyPi/MWTUXuog2MfVcnh0PhFs+cgYQm7PnjHiUSvK/AyY3t
	t+XHBPyyAmmtnSKs2orOAKoat3hpquL8rk2bg61f8UuLy+Cb//mWOOxuORtjssBPbgufrqH63yjHZ
	3JZVuOPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD1Ca-00BZU7-0s;
	Tue, 12 Dec 2023 11:45:28 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD1CX-00BZTO-1E
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Dec 2023 11:45:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 693A7CE131D;
	Tue, 12 Dec 2023 11:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF18C433C8;
	Tue, 12 Dec 2023 11:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702381522;
	bh=W+wu89yS6ISCTJNOIGobljSOiLONbTsNZcOU+gHhOC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y3aY10B2veYLe39QbwiYhKctBqWU8+cZIFtuv8UrnHy7ioljgw+VVW/xAlNjlKfN2
	 B2WnPBwXc/oNFPrFR2vlf6kGBIrDUmXXWXG+4P3vtUSvEp5aa4zPgdvg2FvtTcrLJH
	 5ncaF+llV88ZZGQLVK7doz79ajaV9ARwFxKCa/o0=
Date: Tue, 12 Dec 2023 12:45:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: shitao <shitao@kylinos.cn>
Cc: alcooperx@gmail.com, chunfeng.yun@mediatek.com,
	justin.chen@broadcom.com, kernel-bot@kylinos.cn,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: mtu3: fix comment typo
Message-ID: <2023121208-tattoo-grief-a78b@gregkh>
References: <2023121216-shabby-hastily-f094@gregkh>
 <20231212110959.3115422-1-shitao@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212110959.3115422-1-shitao@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_034525_601555_323D3F7D 
X-CRM114-Status: GOOD (  16.68  )
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

On Tue, Dec 12, 2023 at 07:09:59PM +0800, shitao wrote:
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: shitao <shitao@kylinos.cn>
> ---
> Hi,
> according to your suggestion, I have split it into two patches and added some simple instructions.
> This is about fixing the misspelling of "empty" in the mtu3_qmu.c file. 
> thanks.
>  drivers/usb/mtu3/mtu3_qmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3_qmu.c b/drivers/usb/mtu3/mtu3_qmu.c
> index 3d77408e3133..03f26589b056 100644
> --- a/drivers/usb/mtu3/mtu3_qmu.c
> +++ b/drivers/usb/mtu3/mtu3_qmu.c
> @@ -221,7 +221,7 @@ static struct qmu_gpd *advance_deq_gpd(struct mtu3_gpd_ring *ring)
>  	return ring->dequeue;
>  }
>  
> -/* check if a ring is emtpy */
> +/* check if a ring is empty */
>  static bool gpd_ring_empty(struct mtu3_gpd_ring *ring)
>  {
>  	struct qmu_gpd *enq = ring->enqueue;
> -- 
> 2.34.1
> 

I would strongly suggest that you practice kernel patches in the
drivers/staging/ portion of the kernel, as that is where people learn
how to do this properly, and not bother other subsystems or developers.

Please start there and learn the basics, and then you can move to other
portions of the kernel as you will not be making simple mistakes like
you are here (hint, you forgot to version your patch, AND you forgot a
changelog...)

thanks,

greg k-h

