Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E6BC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 14:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DhekKPDmGzWv83bW4u7ogkDt1jnF/aWhLGso5fOiTmw=; b=KeZuoPl6jT/qq7
	B8B6ZjH2WyS4f5XTBB+HUg4f/x580M/6baqKuJHbwQkU3zr4+QsXKOIlvaMOvMHlABWbNPaVqKCDP
	dBhvmvCmoBW2bjhlrCEPzSUMs1GuJr/fxwf8IDbwSvShAeiooZaqwMQX3rhX1+ojUk4D37vHVwjUe
	vzzF/KNJqNB65NcBOt82Y2XcfRF9sGVuBQSFPb1quQBg0ljLBZAjmBykFpj8T78H9iPRi2lZ9Lahc
	vjvAMw6Mzllch96xd85T0zh62ck4Dp4ZWFfCK0bcuk64ga0pGX1QWPS1/uv+GZn77DzwT78RB5doA
	xAhYsYeDIIH40s/mAtEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwmP1-00A59V-Va; Mon, 13 Dec 2021 14:34:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwm9f-009z2J-Dw; Mon, 13 Dec 2021 14:18:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D45A561021;
 Mon, 13 Dec 2021 14:18:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CBEC34602;
 Mon, 13 Dec 2021 14:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1639405094;
 bh=NtWdzlEjft5tnQeFaBXUVrmubHd8T7HRkrRLfS+HxKc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ef4dtFt35n0BNeZHb5cwHF2nWR84NPJ4B4Ej+DcAmvR7/HzogwktH/W/meMnZnx1/
 Xg3O6A+RredIYQtKTQ5Xmko6sTk52Ckx/QDevDNiQkd9m6eeVOhNiVRfdPIU5wthcz
 kslBCgGFDpF4EoLzXiuVfEO/wBb1eXc3RIOJDVQs=
Date: Mon, 13 Dec 2021 15:18:11 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>,
 Yuwen Ng <yuwen.ng@mediatek.com>, stable@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: mtu3: add memory barrier before set GPD's HWO
Message-ID: <YbdWI5PD3e6uFz8U@kroah.com>
References: <20211209031424.17842-1-chunfeng.yun@mediatek.com>
 <20211209031424.17842-2-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211209031424.17842-2-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_061815_567106_06383700 
X-CRM114-Status: GOOD (  20.94  )
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

On Thu, Dec 09, 2021 at 11:14:23AM +0800, Chunfeng Yun wrote:
> There is a seldom issue that the controller access invalid address
> and trigger devapc or emimpu violation. That is due to memory access
> is out of order and cause gpd data is not correct.
> Make sure GPD is fully written before giving it to HW by setting its
> HWO.
> 
> Fixes: 48e0d3735aa5 ("usb: mtu3: supports new QMU format")
> Cc: stable@vger.kernel.org
> Reported-by: Eddie Hung <eddie.hung@mediatek.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/usb/mtu3/mtu3_qmu.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3_qmu.c b/drivers/usb/mtu3/mtu3_qmu.c
> index 3f414f91b589..34bb5ac67efe 100644
> --- a/drivers/usb/mtu3/mtu3_qmu.c
> +++ b/drivers/usb/mtu3/mtu3_qmu.c
> @@ -273,6 +273,8 @@ static int mtu3_prepare_tx_gpd(struct mtu3_ep *mep, struct mtu3_request *mreq)
>  			gpd->dw3_info |= cpu_to_le32(GPD_EXT_FLAG_ZLP);
>  	}
>  
> +	/* make sure GPD is fully written before giving it to HW */
> +	mb();

So this means you are using mmio for this structure?  If so, shouldn't
you be using normal io memory read/write calls as well and not just
"raw" pointers like this:

>  	gpd->dw0_info |= cpu_to_le32(GPD_FLAGS_IOC | GPD_FLAGS_HWO);

Are you sure this is ok?

Sprinkling around mb() calls is almost never the correct solution.

If you need to ensure that a write succeeds, shouldn't you do a read
from it afterward?  Many busses require this, doesn't yours?



>  
>  	mreq->gpd = gpd;
> @@ -306,6 +308,8 @@ static int mtu3_prepare_rx_gpd(struct mtu3_ep *mep, struct mtu3_request *mreq)
>  	gpd->next_gpd = cpu_to_le32(lower_32_bits(enq_dma));
>  	ext_addr |= GPD_EXT_NGP(mtu, upper_32_bits(enq_dma));
>  	gpd->dw3_info = cpu_to_le32(ext_addr);
> +	/* make sure GPD is fully written before giving it to HW */
> +	mb();

Again, mb(); does not ensure that memory-mapped i/o actually hits the
HW.  Or if it does on your platform, how?

mb() is a compiler barrier, not a memory write to a bus barrier.  Please
read Documentation/memory-barriers.txt for more details.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
