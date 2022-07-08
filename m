Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB061C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 07:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=saayqzx9SZ5b+vHV0TOe8kfbdu6z8VlLYhsmt3OEpBQ=; b=kLB8P3c7aHWegtHpHAgDnbRbN6
	Wb9+7tnrFs32UldpDpioz/eQL6vbSxgaE8iijewe/x+t/ZKxQgfOwJ4zYIYh/zuQ3yABRD8vAtlX8
	3WbveWrYkM+MX1CNdHsI4Szj7IGTRNh1vesSdOpcKaF9a+SbCxpZii2xpbpQYHnYee4rXztOE4ftP
	nadOgCR3P2BGSgzSPOKSxHGuxu4VJsNpeuh2i6xTxAye8kBpSSFMjFP4tfFQRID+ByIwm0PTH1sJu
	qXEU/rrFXpyk1c/IEBYeteyOFa1VtkYL85OSHssTIdTajqz+A0KM+zS82Nkh1PT30xppFJhkZW3Fl
	oaGALnGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9iNf-002E1F-OY; Fri, 08 Jul 2022 07:26:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9iNV-002Dy2-3m; Fri, 08 Jul 2022 07:26:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 819CB621CD;
	Fri,  8 Jul 2022 07:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93C0BC341C0;
	Fri,  8 Jul 2022 07:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657265175;
	bh=QdvPGPSzMNSg9331rSs6uqhsyZcyL0jGteXXpQTEB54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eQpH3wwn/LMkE/zE1L6/QVSe2SW+7eP99yr6bduwIXYsXehxUIblhDiThhWU+HDob
	 8HSMfy3fkaLzxj9YpXXGxnDFRb5rvabUFzB0Uh4X2Rq9OHFJb0e8/8ePL3t53pYk4n
	 Vwnk/2vgWmp0/yVxfz/G6Z2tyf63Ad7nyYYWLZi8=
Date: Fri, 8 Jul 2022 09:26:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Felipe Balbi <balbi@kernel.org>,
	Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [PATCH 1/5] usb: mtu3: fix coverity of string buffer
Message-ID: <YsfcFXtkDxe6ndFT@kroah.com>
References: <20220708071903.25752-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708071903.25752-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_002617_231057_8CA29040 
X-CRM114-Status: GOOD (  19.56  )
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

On Fri, Jul 08, 2022 at 03:18:59PM +0800, Chunfeng Yun wrote:
> Use snprintf instead of sprintf which could cause buffer overflow.

How can it cause an overflow?

> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/usb/mtu3/mtu3.h         | 4 +++-
>  drivers/usb/mtu3/mtu3_debugfs.c | 2 +-
>  drivers/usb/mtu3/mtu3_gadget.c  | 4 ++--
>  3 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
> index 8408e1b1a24a..9893dd1bafbb 100644
> --- a/drivers/usb/mtu3/mtu3.h
> +++ b/drivers/usb/mtu3/mtu3.h
> @@ -92,6 +92,8 @@ struct mtu3_request;
>  
>  #define BULK_CLKS_CNT	4
>  
> +#define MTU3_EP_NAME_LEN	12
> +
>  /* device operated link and speed got from DEVICE_CONF register */
>  enum mtu3_speed {
>  	MTU3_SPEED_INACTIVE = 0,
> @@ -272,7 +274,7 @@ struct ssusb_mtk {
>   */
>  struct mtu3_ep {
>  	struct usb_ep ep;
> -	char name[12];
> +	char name[MTU3_EP_NAME_LEN];
>  	struct mtu3 *mtu;
>  	u8 epnum;
>  	u8 type;
> diff --git a/drivers/usb/mtu3/mtu3_debugfs.c b/drivers/usb/mtu3/mtu3_debugfs.c
> index d27de647c86a..a6f72494b819 100644
> --- a/drivers/usb/mtu3/mtu3_debugfs.c
> +++ b/drivers/usb/mtu3/mtu3_debugfs.c
> @@ -132,7 +132,7 @@ static void mtu3_debugfs_regset(struct mtu3 *mtu, void __iomem *base,
>  	if (!mregs)
>  		return;
>  
> -	sprintf(mregs->name, "%s", name);
> +	snprintf(mregs->name, MTU3_DEBUGFS_NAME_LEN, "%s", name);

Where does name come from?  It looks like you control this string, so
there is no overflow anywhere.

>  	regset = &mregs->regset;
>  	regset->regs = regs;
>  	regset->nregs = nregs;
> diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
> index 30999b4debb8..a751e0533c2d 100644
> --- a/drivers/usb/mtu3/mtu3_gadget.c
> +++ b/drivers/usb/mtu3/mtu3_gadget.c
> @@ -635,8 +635,8 @@ static void init_hw_ep(struct mtu3 *mtu, struct mtu3_ep *mep,
>  
>  	INIT_LIST_HEAD(&mep->req_list);
>  
> -	sprintf(mep->name, "ep%d%s", epnum,
> -		!epnum ? "" : (is_in ? "in" : "out"));
> +	snprintf(mep->name, MTU3_EP_NAME_LEN, "ep%d%s", epnum,
> +		 !epnum ? "" : (is_in ? "in" : "out"));

Same here, you already control this string size, so where is the issue?

thanks,

greg k-h

