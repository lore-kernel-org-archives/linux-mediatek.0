Return-Path: <SRS0=N2rV=IA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3039CC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Mar 2021 08:42:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40BD761494
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Mar 2021 08:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40BD761494
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GwMmHYopCKfXOI5iDRvy8ZXK44SihqgwXfJ8rIwS2+8=; b=jBx4sHhCh8ZVuPsxMbTByYYwa
	kq28iTGvsdQzHi/bl43ow3+e02E2k+XIHZW9/yeK7UXIEEE+6JrDAn1laHMjbAD/8qBp2UZ3pzr5N
	EEJvIXYxfvSP/SPuf5Y3pEG0WIjyKx1gkj67BAifs5MfFCFnYSDJIEz7n20PiMzQ495tY9eC+UtrO
	IQyXfxmf1VCGcF8jRDSYBPdYXCqBfa3tSDPXWN4rHpujhV7OfEi+Gq282/uJg9E4gws8RYtykEMoG
	L562qp1HVL0EWxCHrYBCs7F/MlSbJ3ojXF9AoQ9mhjsp1WCu36ckUmK2p/u52Fg+5m0YOvY1RA4bQ
	rff03zsiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lH0c7-0003ig-Fi; Tue, 02 Mar 2021 08:42:44 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lH0c3-0003hE-Uc
 for linux-mediatek@lists.infradead.org; Tue, 02 Mar 2021 08:42:41 +0000
Received: by mail-ej1-x635.google.com with SMTP id do6so33696151ejc.3
 for <linux-mediatek@lists.infradead.org>; Tue, 02 Mar 2021 00:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=agB1pi024Vr3XPHFnK8A8uxx+WSFW4Ss4wEt+UUGomA=;
 b=J2KxhfvYp/C4dNeiEuJ9uuzNtGkOnSWtZXhIKfyFPrvIRJ6Uz0nzrFUHlf/AJVfTX/
 pLADSL75J4ZVY+zeYfSOGPpkv9fP0XuJELCjv+CBzNjYyvbNqlvNEdO8o54dfEDtVYBf
 B8f+aY0ITlqdbI9sz70TTv+y26cx4W3D683xiB7w6RgFMzqfamj5eb16BuAy55JtBSXb
 dHUXhCpLl5GWmGLxuqBy+sAutKvDqQuvAKeG1lj97jpL5H7RzgzsMY62RMWRXHXy0Zc9
 6g2R/ewhXtTLFZtKya22iW6Hyt61B1lPKlWAWzZPyyeUvdmeh2YHExJZm3eape88OnIr
 0+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=agB1pi024Vr3XPHFnK8A8uxx+WSFW4Ss4wEt+UUGomA=;
 b=kfihVb1PAxEhrw+p8d7dwzpReBzwOFdaTwYs0g19pfZNpDi5Oyxy/6UXFsRz+Ua1EB
 2I7XoXMeKdta3AOiT/almNs5Y+QC233BZ6o9k18AyiEs3aQzqWHbWpw7/oYnXr7r6Rxl
 2G7VgmT4Tblim60Lt5NYWYfb0sSTagUj+3Zisg+QQApRXBjYGTFIg+VpI0iwhXNXZn3s
 mHuNn5we5Odgr0K1nuGU0W9viS+jkHFhjzfCXCtiXPdooXOrhTf61cto9v5kqRHAHGCB
 Vvw1gHhbavobpiITtuOzCvHVeGYgayvhTSyejLKQRpjJP31QT3PsLtv7P2RHLiUgE0mq
 KqdQ==
X-Gm-Message-State: AOAM533frgaUa2gNj+SsXxuQCJS9BgPndJWRQjIXlLhzC3tND46cPQgr
 FDl3UpdGVEL0Kng+1drcDDUi3DsGfQwI5PqhP4tAZol6SGxORg==
X-Google-Smtp-Source: ABdhPJxrNudJeeR8IfVRpsk7slwS7VNf7SxzFv8Xp+r4FDzk4q5SXG33aC9jWsXdNCJ5zn9Z9QMi1b64BHGjO2kV73Q=
X-Received: by 2002:a17:906:3105:: with SMTP id
 5mr20113035ejx.168.1614674557016; 
 Tue, 02 Mar 2021 00:42:37 -0800 (PST)
MIME-Version: 1.0
References: <20210302033323.25830-1-biao.huang@mediatek.com>
In-Reply-To: <20210302033323.25830-1-biao.huang@mediatek.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Tue, 2 Mar 2021 09:42:26 +0100
Message-ID: <CAMpxmJV_MmOrP1eKdcBsD2sjzC7p52vxBz+HE+yHDdr9RTujqQ@mail.gmail.com>
Subject: Re: [PATCH] net: ethernet: mtk-star-emac: fix wrong unmap in RX
 handling
To: Biao Huang <biao.huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_034240_149822_6AE43BD1 
X-CRM114-Status: GOOD (  17.28  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: srv_heupstream <srv_heupstream@mediatek.com>,
 netdev <netdev@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 LKML <linux-kernel@vger.kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 arm-soc <linux-arm-kernel@lists.infradead.org>, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 2, 2021 at 4:33 AM Biao Huang <biao.huang@mediatek.com> wrote:
>
> mtk_star_dma_unmap_rx() should unmap the dma_addr of old skb rather than
> that of new skb.
> Assign new_dma_addr to desc_data.dma_addr after all handling of old skb
> ends to avoid unexpected receive side error.
>
> Fixes: f96e9641e92b ("net: ethernet: mtk-star-emac: fix error path in RX handling")
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_star_emac.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
> index a8641a407c06..96d2891f1675 100644
> --- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
> +++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
> @@ -1225,8 +1225,6 @@ static int mtk_star_receive_packet(struct mtk_star_priv *priv)
>                 goto push_new_skb;
>         }
>
> -       desc_data.dma_addr = new_dma_addr;
> -
>         /* We can't fail anymore at this point: it's safe to unmap the skb. */
>         mtk_star_dma_unmap_rx(priv, &desc_data);
>
> @@ -1236,6 +1234,9 @@ static int mtk_star_receive_packet(struct mtk_star_priv *priv)
>         desc_data.skb->dev = ndev;
>         netif_receive_skb(desc_data.skb);
>
> +       /* update dma_addr for new skb */
> +       desc_data.dma_addr = new_dma_addr;
> +
>  push_new_skb:
>         desc_data.len = skb_tailroom(new_skb);
>         desc_data.skb = new_skb;
> --
> 2.18.0
>

Thanks for spotting that. Maybe also update the commit so that it
says: "it's safe to unmap the old skb"? Would make the thing clearer
IMO.

In any case:

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Bartosz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
