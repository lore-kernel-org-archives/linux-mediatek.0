Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B7DECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 18:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8JpKbYvC/8XGkAVo2LK6A5WwJ2wsthGD7r653CCQd4=; b=BqNy06QzMeiCRXaSI0aOcKTsTO
	fBKtIFgeLpB1fsYvm5H/dji6Ap+BTAmUFa3xxfhhkbtAg5dBvmhm3fvyIEc5xWdo4uK9QCSvy+l+J
	u3TIOY9cyEMqa0mOjQKVJ4QWRdRZItScEi7FrdXOSt616vsqyGgJi/w6K6gcHULpRHWU7JViqybcB
	8n2yKP8lHOHhOCMeqA4sDqIIG8dP4ey4uvjm39et0XfRzh/IbQ+LwDfg6oTuIFfbSTDl7hZFcoMpQ
	6AZbl2/dRh/R2hZJZMR8sGrAn/94FvGcq8ltmS6bsdAFjXuHZw1JKiMQ17a6d9foeuM67oWVG482A
	AZqV5wiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWj9W-001SO9-US; Fri, 09 Sep 2022 18:54:58 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWj9U-001SKR-6T
	for linux-mediatek@lists.infradead.org; Fri, 09 Sep 2022 18:54:57 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1oWj97-0000Gi-3A;
	Fri, 09 Sep 2022 20:54:34 +0200
Date: Fri, 9 Sep 2022 19:54:27 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
	Bo.Jiao@mediatek.com, sujuan.chen@mediatek.com,
	ryder.Lee@mediatek.com, evelyn.tsai@mediatek.com,
	devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH net-next 08/12] net: ethernet: mtk_eth_soc: add foe info
 in mtk_soc_data structure
Message-ID: <YxuL45OghfKVGTrM@makrotopia.org>
References: <cover.1662661555.git.lorenzo@kernel.org>
 <0d0bfa99e313c0b00bf75f943f58b6fe552ed004.1662661555.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d0bfa99e313c0b00bf75f943f58b6fe552ed004.1662661555.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_115456_255067_A25E9346 
X-CRM114-Status: GOOD (  12.87  )
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

On Thu, Sep 08, 2022 at 09:33:42PM +0200, Lorenzo Bianconi wrote:
> Introduce foe struct in mtk_soc_data as a container for foe table chip
> related definitions.
> This is a preliminary patch to enable mt7986 wed support.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c   |  70 +++++++-
>  drivers/net/ethernet/mediatek/mtk_eth_soc.h   |  27 ++-
>  drivers/net/ethernet/mediatek/mtk_ppe.c       | 161 ++++++++++--------
>  drivers/net/ethernet/mediatek/mtk_ppe.h       |  29 ++--
>  .../net/ethernet/mediatek/mtk_ppe_offload.c   |  34 ++--
>  5 files changed, 208 insertions(+), 113 deletions(-)
> 
> [...]
> diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.h b/drivers/net/ethernet/mediatek/mtk_ppe.h
> index 6d4c91acd1a5..a364f45edf38 100644
> --- a/drivers/net/ethernet/mediatek/mtk_ppe.h
> +++ b/drivers/net/ethernet/mediatek/mtk_ppe.h
> @@ -61,6 +61,8 @@ enum {
>  #define MTK_FOE_VLAN2_WINFO_WCID	GENMASK(13, 6)
>  #define MTK_FOE_VLAN2_WINFO_RING	GENMASK(15, 14)
>  
> +#define MTK_FIELD_PREP(mask, val)	(((typeof(mask))(val) << __bf_shf(mask)) & (mask))
> +#define MTK_FIELD_GET(mask, val)	((typeof(mask))(((val) & (mask)) >> __bf_shf(mask)))

This seems to trigger a compiler bug on ARMv7 (e.g. MT7623) builds:

  LD      .tmp_vmlinux.kallsyms1
arm-openwrt-linux-muslgnueabi-ld: drivers/net/ethernet/mediatek/mtk_ppe.o: in function `mtk_flow_entry_match':
/usr/src/lede/build_dir/target-arm_cortex-a7+neon-vfpv4_musl_eabi/linux-mediatek_mt7623/linux-5.15.67/drivers/net/ethernet/mediatek/mtk_ppe.c:406: undefined reference to `__ffsdi2'
arm-openwrt-linux-muslgnueabi-ld: drivers/net/ethernet/mediatek/mtk_ppe.o: in function `__mtk_foe_entry_commit':
/usr/src/lede/build_dir/target-arm_cortex-a7+neon-vfpv4_musl_eabi/linux-mediatek_mt7623/linux-5.15.67/drivers/net/ethernet/mediatek/mtk_ppe.c:533: undefined reference to `__ffsdi2'
arm-openwrt-linux-muslgnueabi-ld: drivers/net/ethernet/mediatek/mtk_ppe.o: in function `mtk_foe_entry_l2':
/usr/src/lede/build_dir/target-arm_cortex-a7+neon-vfpv4_musl_eabi/linux-mediatek_mt7623/linux-5.15.67/drivers/net/ethernet/mediatek/mtk_ppe.c:134: undefined reference to `__ffsdi2'
arm-openwrt-linux-muslgnueabi-ld: drivers/net/ethernet/mediatek/mtk_ppe.o: in function `mtk_foe_entry_commit_subflow':
/usr/src/lede/build_dir/target-arm_cortex-a7+neon-vfpv4_musl_eabi/linux-mediatek_mt7623/linux-5.15.67/drivers/net/ethernet/mediatek/mtk_ppe.c:611: undefined reference to `__ffsdi2'
arm-openwrt-linux-muslgnueabi-ld: drivers/net/ethernet/mediatek/mtk_ppe.o: in function `mtk_foe_entry_ib2':
/usr/src/lede/build_dir/target-arm_cortex-a7+neon-vfpv4_musl_eabi/linux-mediatek_mt7623/linux-5.15.67/drivers/net/ethernet/mediatek/mtk_ppe.c:148: undefined reference to `__ffsdi2'
arm-openwrt-linux-muslgnueabi-ld: drivers/net/ethernet/mediatek/mtk_ppe.o:/usr/src/lede/build_dir/target-arm_cortex-a7+neon-vfpv4_musl_eabi/linux-mediatek_mt7623/linux-5.15.67/drivers/net/ethernet/mediatek/mtk_ppe.c:169: more undefined references to `__ffsdi2' follow


>  enum {
>  	MTK_FOE_STATE_INVALID,
>  	MTK_FOE_STATE_UNBIND,

