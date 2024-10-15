Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C52D21699
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 12:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tz2awaZwi39u9xfTdC1IzB67ciK8zom3+O5F5wZRvws=; b=C4jI9IFAcaQfPzrj9L2u1qfK+Q
	UoC45haDKui8JeB86YHZwHo2As6RWVyGg2v7ThU2LKDDxkNkJ3kSp/l8QwvPgGTxM69dmqxwSskCT
	/ZNGsIztCVH3nM5OiPp56gnMr/trfm8VN8WWJeYckY44t9xWCtllqzmPjNSA8jJeu3pILbGWIMiMv
	vREVRtekEexGIFEHhKH2IyXvu87JftAowe4DLjIrr74ui1Cd7uJOIpkcLk+3LVsf1XflYtrVyUcY3
	rCxgxF21D4ZNH61tNbR55ZbGxFV4OPknUoDy2gRYu3/Jr2H/TPDw+H+RXVyFXCZGECSszv/BOsjlW
	EGms3t7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0gwf-00000008ELf-2LOA;
	Tue, 15 Oct 2024 12:46:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0glr-00000008BaR-3OL2;
	Tue, 15 Oct 2024 12:35:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BE563A425F6;
	Tue, 15 Oct 2024 12:35:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 874A6C4CEC6;
	Tue, 15 Oct 2024 12:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728995726;
	bh=ZupsWivaJNf9AbMr2VMo7f7YbV6GJym0nRD6piwnCN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ksC6jF94ERjrFtljP8v+q5LG23xm7l7Wq1PEHAXpM3QBCzgscZvwio8MpdEdRYmu+
	 iV587e+SFjEm0rUjEYGNLB1DXhbJbIOdi1Lu2H4zv7Nt7oKN9yUhHHwdd7tfqDSnCq
	 zPOlvnLOsPUZswH4RvQ4IxK3ZF7B5uwHkURs1IohPK0aI6RKqMu+NCZaUZK5TKx4M7
	 xWr3ZbriNt8iWZt56icN5UJOkTZSHYLeNgNsgNDxvQFcm8iU8572F2l9Nh6KpYTn2A
	 FwmDkwHyNuEyjdqqBfUUeynOyDaws2oGHHNFFxv3Ji7iEx66V7t9p0MLw2BICE/ZtH
	 uNaa2STtyn/FQ==
Date: Tue, 15 Oct 2024 13:35:21 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	ChihWei Cheng <chihwei.cheng@airoha.com>
Subject: Re: [PATCH net-next] net: airoha: Fix typo in REG_CDM2_FWD_CFG
 configuration
Message-ID: <20241015123521.GF569285@kernel.org>
References: <20241015-airoha-eth-cdm2-fixes-v1-1-9dc6993286c3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015-airoha-eth-cdm2-fixes-v1-1-9dc6993286c3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_053527_936566_0A749802 
X-CRM114-Status: GOOD (  18.73  )
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

On Tue, Oct 15, 2024 at 09:58:09AM +0200, Lorenzo Bianconi wrote:
> Fix typo in airoha_fe_init routine configuring CDM2_OAM_QSEL_MASK field
> of REG_CDM2_FWD_CFG register.
> This bug is not introducing any user visible problem since Frame Engine
> CDM2 port is used just by the second QDMA block and we currently enable
> just QDMA1 block connected to the MT7530 dsa switch via CDM1 port.
> 
> Introduced by commit 23020f049327 ("net: airoha: Introduce ethernet
> support for EN7581 SoC")
> 
> Reported-by: ChihWei Cheng <chihwei.cheng@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>

> ---
>  drivers/net/ethernet/mediatek/airoha_eth.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
> index e037f725f6d3505a8b91815ae26322f5d1b8590c..45665a5b14f5c646d23aaf4830e55a118e9f1a8a 100644
> --- a/drivers/net/ethernet/mediatek/airoha_eth.c
> +++ b/drivers/net/ethernet/mediatek/airoha_eth.c
> @@ -1371,7 +1371,8 @@ static int airoha_fe_init(struct airoha_eth *eth)
>  	airoha_fe_set(eth, REG_GDM_MISC_CFG,
>  		      GDM2_RDM_ACK_WAIT_PREF_MASK |
>  		      GDM2_CHN_VLD_MODE_MASK);
> -	airoha_fe_rmw(eth, REG_CDM2_FWD_CFG, CDM2_OAM_QSEL_MASK, 15);
> +	airoha_fe_rmw(eth, REG_CDM2_FWD_CFG, CDM2_OAM_QSEL_MASK,
> +		      FIELD_PREP(CDM2_OAM_QSEL_MASK, 15));

I agree FIELD_PREP is correct here as it will both mask (not important
in this case) and shift (very important in this case) it's input (15).
This matches how airoha_fe_rmw() will use this argument.

>  
>  	/* init fragment and assemble Force Port */
>  	/* NPU Core-3, NPU Bridge Channel-3 */
> 
> ---
> base-commit: 60b4d49b9621db4b000c9065dd6457c9a0eda80b
> change-id: 20241014-airoha-eth-cdm2-fixes-92d909308204
> 
> Best regards,
> -- 
> Lorenzo Bianconi <lorenzo@kernel.org>
> 
> 

