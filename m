Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DD3C3A5A7
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Dec 2022 08:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRfgBclvpC2u/WluoxsI9AaZOh5CYYIc1QgqvETO66g=; b=w0Ya5ElEdv4TaTsK9PHlqMZ4uJ
	ClHVVhzU/IY2qwmCrkb/SjCrWo+Q8ISdZRckWMgYoId0J+QrXtBh6pt+2Th7pC20cGIf2DEyzKrhg
	1dodqHDXSJRSquqX+NDCBXprOLjSLI4+pDb4B02qWiPIDNn8IQ7azBAl+uelSMwflRy6Mt2p3Inkb
	xdJ67l/bKWBa8F72cjwAfD0yTHxgptGA8a+qu/gDCO924MgCqUsHZbTjZwvFKIPgIUeM1LmEErrec
	wqkkqDWyBbSvsx3BPUgQFeWkO47a8zRduX3bc2iFMBPx/UuXn+fJvgsXVqIhq3sewUEaxClp4LPxz
	i0aBxQRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3CW7-00AFNA-Mc; Thu, 08 Dec 2022 08:44:31 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3CW4-00AFGm-LV
	for linux-mediatek@lists.infradead.org; Thu, 08 Dec 2022 08:44:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E8954B822E6;
	Thu,  8 Dec 2022 08:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6652C433C1;
	Thu,  8 Dec 2022 08:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670489065;
	bh=2YEakhHt3jTQkyImWYHVRYLy3q29iNcp/+rDAHl+koQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g2PKy7GBtil9gXKTSA3GRIOWGL6tjJCmD/jKvkqA3x4InT+BWk2P6vqZDnS248Fbt
	 GamaAN4Bz6UoOAj8qtp7vZRgfpW9Wr5oPmMpr4XzUOE3HxqTTVlpfOe2cWsUZ6MPQq
	 fvA88IvYnIolTVJZGIW3KykN/JKVwQ15Jm1QU9JwvhTxSth9r0PLlkDFrEQ+f4QNi6
	 vKHbCBAYYDdEoxiZZiHxo0NY7bOC0Y9WN13FGw5FZZ+kvPqNqhgjpkbR0INg0kA9VM
	 6oBfw9A1aUaKYkGqkd4mp8Kx59o7sLth+Z0LEWprm0irDaklZ6sVYZl9fj2ekO1MW7
	 q5MReQeqi5qhg==
Date: Thu, 8 Dec 2022 10:44:21 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
	sujuan.chen@mediatek.com
Subject: Re: [PATCH v3 net-next 1/2] net: ethernet: mtk_wed: fix some
 possible NULL pointer dereferences
Message-ID: <Y5Gj5fgVmQLRdorx@unreal>
References: <cover.1670421354.git.lorenzo@kernel.org>
 <44cba2491b6dd1a64d0e8099efbab836e6758490.1670421354.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44cba2491b6dd1a64d0e8099efbab836e6758490.1670421354.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_004428_893342_E26C50CB 
X-CRM114-Status: GOOD (  12.18  )
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

On Wed, Dec 07, 2022 at 03:04:54PM +0100, Lorenzo Bianconi wrote:
> Fix possible NULL pointer dereference in mtk_wed_detach routine checking
> wo pointer is properly allocated before running mtk_wed_wo_reset() and
> mtk_wed_wo_deinit().
> Even if it is just a theoretical issue at the moment check wo pointer is
> not NULL in mtk_wed_mcu_msg_update.
> Moreover, honor mtk_wed_mcu_send_msg return value in mtk_wed_wo_reset()
> 
> Fixes: 799684448e3e ("net: ethernet: mtk_wed: introduce wed wo support")
> Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/mediatek/mtk_wed.c     | 13 ++++++++-----
>  drivers/net/ethernet/mediatek/mtk_wed_mcu.c |  3 +++
>  2 files changed, 11 insertions(+), 5 deletions(-)
> 

Thanks,
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>

