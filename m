Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE4AC4332F
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Dec 2022 13:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bynm1BGeLFWYcjxShw/uxj1Cn+8dkKKtKxblASNcaPY=; b=okrCwp/h1n3LdFifKnSA5a3JMV
	YBgo7DuWLwPpN31A0EHqndfXJs9izqfn2T2/43DA3yan3KDEZaS4HTA1O5iHZeMI4WboQqwGCZYKE
	bY/B48XZ3VLYWyQiMt95nnbRIXrHFVFsImGUDxTGTQ1FOHbv0r1/FCkaRAcrOKnp30f9hQ6ZJaJL0
	6wEFwbGBBBVIVlnBAjijc0uvOKENDO/Wczr2El0Wc/BcfFZoOfiRoEGmlwy7MCbH8bcpMn9oF0oIV
	F/1VLNhY3AUQnOTj+acWm3rxOS41sYBcysXNSsKJWP5eAxx/BdEcenAfOWMXBvCOeytINp4A6bnIp
	IYNf5W1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1oi9-0082G6-VL; Sun, 04 Dec 2022 13:07:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1oi0-0082Di-7T
	for linux-mediatek@lists.infradead.org; Sun, 04 Dec 2022 13:07:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4BD5D60E74;
	Sun,  4 Dec 2022 13:07:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A5E5C433C1;
	Sun,  4 Dec 2022 13:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670159222;
	bh=chlRnalb7pVdKBbL3xGD8d14nSvltNKVeqlHVirWbRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UQx82WapAzgvTFf5/1aEQLF7JcEQ7XSfQDR/4FGloJIsltQBF3dW7GctJe711/AG/
	 GmEcukTONqrDRD3Y82mUrqc6FibQSBOrK0mVMtR4LHpldUNO6rUnhyT514RTqnGiFa
	 iy6yJXrk2rz4i+PqXfAGCBF13Yjt0ui1zDOjfxraKniawbmtqvWDD+2OSXvYmAeYlA
	 uOFAHlbOVGRklSFyyc3v+G8f42P7G5PO4vAP5FNABmOjMwMEb0u2BVtte1oUdIQJFc
	 OVLaX2Xn9NGOGTTDig/8JJFN4wZqKlJdRGiFKGuY+6nveEVzJJSpJsRIZWRwfLbUrC
	 iILT8FIZXkzkQ==
Date: Sun, 4 Dec 2022 15:06:54 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com
Subject: Re: [PATCH net-next] net: ethernet: mtk_wed: fix possible deadlock
 if mtk_wed_wo_init fails
Message-ID: <Y4ybbkn+nXkGsqWe@unreal>
References: <a87f05e60ea1a94b571c9c87b69cc5b0e94943f2.1669999089.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a87f05e60ea1a94b571c9c87b69cc5b0e94943f2.1669999089.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_050704_340434_CDC91F9A 
X-CRM114-Status: GOOD (  16.48  )
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

On Fri, Dec 02, 2022 at 06:36:33PM +0100, Lorenzo Bianconi wrote:
> Introduce __mtk_wed_detach() in order to avoid a possible deadlock in
> mtk_wed_attach routine if mtk_wed_wo_init fails.
> 
> Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/mediatek/mtk_wed.c     | 24 ++++++++++++++-------
>  drivers/net/ethernet/mediatek/mtk_wed_mcu.c | 10 ++++++---
>  drivers/net/ethernet/mediatek/mtk_wed_wo.c  |  3 +++
>  3 files changed, 26 insertions(+), 11 deletions(-)

<...>

> diff --git a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
> index f9539e6233c9..b084009a32f9 100644
> --- a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
> +++ b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
> @@ -176,6 +176,9 @@ int mtk_wed_mcu_send_msg(struct mtk_wed_wo *wo, int id, int cmd,
>  	u16 seq;
>  	int ret;
>  
> +	if (!wo)
> +		return -ENODEV;

<...>

>  static void
>  mtk_wed_wo_hw_deinit(struct mtk_wed_wo *wo)
>  {
> +	if (!wo)
> +		return;

How are these changes related to the written in deadlock?
How is it possible to get internal mtk functions without valid wo?

Thanks

> +
>  	/* disable interrupts */
>  	mtk_wed_wo_set_isr(wo, 0);
>  
> -- 
> 2.38.1
> 

