Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C8FC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 17:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOuzsj/gcUL5lfsjjDZ0Z7whqVkh+NMOfsNsuz82zmQ=; b=paC4DDl3VCdBJVLsV+akgbRkx1
	m3hWihQgHITuwcuRdbIJWNEGrnksXqwWlfefowxVHOcQr5AedtzzFtQM2rnQrQ+f7hgjrygzBKm0U
	jOYFXD1j1+3JnuhG6FnaqtGS+v1ao5O2+nT3hsW0Hv+zuGusL3BNkeR6DQzKVK2oJ9QZP0keic+0M
	6UcVl+RcblPamDCH5x/lNi8tVhhSzRpQC+2baX+0/uc9p9nI6wzJ3EQqIuK257VbZA40LuoRhVPJc
	3z4JJCPHlUOO6oQINR+DHcfqGKTqGEeWjqKH04rLlPEfP1ZShQIzjl2O0PEiVYiRyNkGfDri2auNj
	WnH37wUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2FTn-007dnR-5m; Mon, 05 Dec 2022 17:42:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2FTi-007dfi-91
	for linux-mediatek@lists.infradead.org; Mon, 05 Dec 2022 17:42:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B9DBAB811B2;
	Mon,  5 Dec 2022 17:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F193C43146;
	Mon,  5 Dec 2022 17:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670262123;
	bh=HUvXXPySnmgJs4So8nvqneqZ8dOcoHGWjpwV2GIFH70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UTJ/oR+8yLOTm4JGOs0E1JDWZitESkEkbYBZwW4Qyu2tMN4AcKCHNOJeFlalZjMnj
	 murD1unxoNbPM+D9ENQ/scUTVBEUp51fLLq5kvfPXAvZEdsQlwxrmKP4qK2WOlUd1E
	 jGBY4O8/QwT4Qy1+Q6VnVON3Q/LjbQUK8uSZFi86y+5UWdxw/xusOyC6+L8TSoLAue
	 wWW9TKl+0mRlpjyVLemVV1jM46Yt2i5MFAZDGmUH8ga09SDQs38Ql2aw+7N3qWXbo7
	 HAGMPzZd2l4UMgdbfx9XkHAt7RlCi2FmX3F7ERXzHrRtHbLYffoQPGYTr3ujZ4iolz
	 9tXyJ21MwnSIw==
Date: Mon, 5 Dec 2022 19:41:58 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
	sujuan.chen@mediatek.com
Subject: Re: [PATCH v2 net-next] net: ethernet: mtk_wed: add reset to
 rx_ring_setup callback
Message-ID: <Y44tZlaHPdJhXCGd@unreal>
References: <29c6e7a5469e784406cf3e2920351d1207713d05.1670239984.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29c6e7a5469e784406cf3e2920351d1207713d05.1670239984.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_094209_442483_F592F202 
X-CRM114-Status: GOOD (  11.90  )
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

On Mon, Dec 05, 2022 at 12:34:42PM +0100, Lorenzo Bianconi wrote:
> This patch adds reset parameter to mtk_wed_rx_ring_setup signature
> in order to align rx_ring_setup callback to tx_ring_setup one introduced
> in 'commit 23dca7a90017 ("net: ethernet: mtk_wed: add reset to
> tx_ring_setup callback")'
> 
> Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
> Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes since v1:
> - update commit message
> ---
>  drivers/net/ethernet/mediatek/mtk_wed.c  | 20 +++++++++++++-------
>  drivers/net/wireless/mediatek/mt76/dma.c |  2 +-
>  include/linux/soc/mediatek/mtk_wed.h     |  8 ++++----
>  3 files changed, 18 insertions(+), 12 deletions(-)
> 

Thanks,
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>

