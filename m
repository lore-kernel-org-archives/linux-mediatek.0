Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8DFC6FA91
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 09:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3IvI68HNXt2YZ0VNl8nNBDa7vXPvMDsD98MTkVEuWjQ=; b=AwBuiXNZtVoP/z9gr3ovilzktN
	UKg83V5x3AubGO7rqKvB5rDFQ3E+QMrVIg56aTVMuQ8iqneVdwlUVoqubgAEFILoTJkpLh+y7iNET
	8GBQwMuAlM7AgroXMker+xy7D5JhOFDvvqiEIOwpdzH2tDGRmAIzH0r8O0txHLaq4Yqlms+yYxuNo
	36fQtKvMhMwX7+l+0vsvAGYJ82cZ4MrBYCywqOTHTYsll4JXKMb+2BRa8HWFWO41REpFTu7HzE8QF
	46TjuyZm//jCSXmdm6jZMV3JEvCUiw30gtTivPfWW55lWjPCmOlbtSwN2BK+LW2879qaVOowDegTL
	emsidGwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obIQr-00EQpB-Hm; Thu, 22 Sep 2022 09:23:45 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obI7S-00EL7v-Uv; Thu, 22 Sep 2022 09:03:45 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MY8Nf0QNDzlXNv;
	Thu, 22 Sep 2022 16:59:30 +0800 (CST)
Received: from [10.67.110.176] (10.67.110.176) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 17:03:37 +0800
Subject: Re: [PATCH 1/5] mlxsw: reg: Remove unused inline function
 mlxsw_reg_sftr2_pack()
To: Ido Schimmel <idosch@nvidia.com>, <petrm@nvidia.com>
CC: <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <nbd@nbd.name>, <lorenzo@kernel.org>,
	<ryder.lee@mediatek.com>, <shayne.chen@mediatek.com>,
	<sean.wang@mediatek.com>, <kvalo@kernel.org>, <matthias.bgg@gmail.com>,
	<amcohen@nvidia.com>, <stephen@networkplumber.org>, <netdev@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
References: <20220921090455.752011-1-cuigaosheng1@huawei.com>
 <20220921090455.752011-2-cuigaosheng1@huawei.com> <YyroqT8a0InvBaaL@shredder>
From: cuigaosheng <cuigaosheng1@huawei.com>
Message-ID: <e5687025-edc2-84d5-f0ce-cc63b6c61e06@huawei.com>
Date: Thu, 22 Sep 2022 17:03:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YyroqT8a0InvBaaL@shredder>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.110.176]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_020343_414330_9CD467F3 
X-CRM114-Status: GOOD (  19.17  )
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

> Please rather remove the entire register in v2 [1].
>
> Subject prefix should be "PATCH net-next":
> https://docs.kernel.org/process/maintainer-netdev.html#how-do-i-indicate-which-tree-net-vs-net-next-my-patch-should-be-in
>
> Thanks

Thanks for taking the time to review this patch, I have made a patch v2 and submitted it.

Link: https://patchwork.kernel.org/project/netdevbpf/list/?series=679311

> On Wed, Sep 21, 2022 at 05:04:51PM +0800, Gaosheng Cui wrote:
>> All uses of mlxsw_reg_sftr2_pack() have
>> been removed since commit 77b7f83d5c25 ("mlxsw: Enable unified
>> bridge model"), so remove it.
> Please rather remove the entire register in v2 [1].
>
> Subject prefix should be "PATCH net-next":
> https://docs.kernel.org/process/maintainer-netdev.html#how-do-i-indicate-which-tree-net-vs-net-next-my-patch-should-be-in
>
> Thanks
>
> [1]
> diff --git a/drivers/net/ethernet/mellanox/mlxsw/reg.h b/drivers/net/ethernet/mellanox/mlxsw/reg.h
> index b293a154e49f..1cc117c8f230 100644
> --- a/drivers/net/ethernet/mellanox/mlxsw/reg.h
> +++ b/drivers/net/ethernet/mellanox/mlxsw/reg.h
> @@ -2251,76 +2251,6 @@ static inline void mlxsw_reg_smpe_pack(char *payload, u16 local_port,
>   	mlxsw_reg_smpe_evid_set(payload, evid);
>   }
>   
> -/* SFTR-V2 - Switch Flooding Table Version 2 Register
> - * --------------------------------------------------
> - * The switch flooding table is used for flooding packet replication. The table
> - * defines a bit mask of ports for packet replication.
> - */
> -#define MLXSW_REG_SFTR2_ID 0x202F
> -#define MLXSW_REG_SFTR2_LEN 0x120
> -
> -MLXSW_REG_DEFINE(sftr2, MLXSW_REG_SFTR2_ID, MLXSW_REG_SFTR2_LEN);
> -
> -/* reg_sftr2_swid
> - * Switch partition ID with which to associate the port.
> - * Access: Index
> - */
> -MLXSW_ITEM32(reg, sftr2, swid, 0x00, 24, 8);
> -
> -/* reg_sftr2_flood_table
> - * Flooding table index to associate with the specific type on the specific
> - * switch partition.
> - * Access: Index
> - */
> -MLXSW_ITEM32(reg, sftr2, flood_table, 0x00, 16, 6);
> -
> -/* reg_sftr2_index
> - * Index. Used as an index into the Flooding Table in case the table is
> - * configured to use VID / FID or FID Offset.
> - * Access: Index
> - */
> -MLXSW_ITEM32(reg, sftr2, index, 0x00, 0, 16);
> -
> -/* reg_sftr2_table_type
> - * See mlxsw_flood_table_type
> - * Access: RW
> - */
> -MLXSW_ITEM32(reg, sftr2, table_type, 0x04, 16, 3);
> -
> -/* reg_sftr2_range
> - * Range of entries to update
> - * Access: Index
> - */
> -MLXSW_ITEM32(reg, sftr2, range, 0x04, 0, 16);
> -
> -/* reg_sftr2_port
> - * Local port membership (1 bit per port).
> - * Access: RW
> - */
> -MLXSW_ITEM_BIT_ARRAY(reg, sftr2, port, 0x20, 0x80, 1);
> -
> -/* reg_sftr2_port_mask
> - * Local port mask (1 bit per port).
> - * Access: WO
> - */
> -MLXSW_ITEM_BIT_ARRAY(reg, sftr2, port_mask, 0xA0, 0x80, 1);
> -
> -static inline void mlxsw_reg_sftr2_pack(char *payload,
> -					unsigned int flood_table,
> -					unsigned int index,
> -					enum mlxsw_flood_table_type table_type,
> -					unsigned int range, u16 port, bool set)
> -{
> -	MLXSW_REG_ZERO(sftr2, payload);
> -	mlxsw_reg_sftr2_swid_set(payload, 0);
> -	mlxsw_reg_sftr2_flood_table_set(payload, flood_table);
> -	mlxsw_reg_sftr2_index_set(payload, index);
> -	mlxsw_reg_sftr2_table_type_set(payload, table_type);
> -	mlxsw_reg_sftr2_range_set(payload, range);
> -	mlxsw_reg_sftr2_port_set(payload, port, set);
> -	mlxsw_reg_sftr2_port_mask_set(payload, port, 1);
> -}
> -
>   /* SMID-V2 - Switch Multicast ID Version 2 Register
>    * ------------------------------------------------
>    * The MID record maps from a MID (Multicast ID), which is a unique identifier
> @@ -12876,7 +12806,6 @@ static const struct mlxsw_reg_info *mlxsw_reg_infos[] = {
>   	MLXSW_REG(spvc),
>   	MLXSW_REG(spevet),
>   	MLXSW_REG(smpe),
> -	MLXSW_REG(sftr2),
>   	MLXSW_REG(smid2),
>   	MLXSW_REG(cwtp),
>   	MLXSW_REG(cwtpm),
> .

