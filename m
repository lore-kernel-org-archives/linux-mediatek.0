Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10ABB606A330
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 19:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lK7RWk8U;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=DBXVvnI2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ti6ylpjPTD8khzVpZqatJgcmEG0EmklAupgOPYtpeOM=; b=lK7RWk8UuShwuNg6yTSaZkar4s
	aU6g/Y5WWpw27zzBFBnTDkhaq8XLtUq8+3D3iZX9/NBlqucjbl9txDYB7GAR0yv0a03xSvIZHO9/9
	Yj/IgEQLisNuERXEqHASK6fLVfzDVzJIGQgKct10FNg5zw0OPkoSmK42GtnBk+5oDx43cgrUqvi+X
	E1U7AJFnRNV2BhP3EaW85EZKYSp2r0Jisku1tbe90INEHfC9EQGxDeOZh6aQbXs/lkDNpJxwOf+So
	mOmpXfpct3+lfF5BQjXBsuEsRb/WkKq8b8ZVVty4/aBgcQakBT66RRHLa6ZpnWdG3LiyS5MXwd5Ml
	ZZ0VHEQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVa84-00000004l4U-3FAp;
	Mon, 23 Nov 2026 19:55:08 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVa80-00000004l1m-0cLl;
	Mon, 23 Nov 2026 19:55:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nwqfQ3gjn2brCxNMx08Va9Je2I0XlWgZZhHzBqFNldq5yvKuoabe+sXLWl+DUm7nIX2ECkXTyxp4WjD7mTztNeykR4oR9KixR/QzP1mbyBSSXNOP621PsNgqo745sneFRXyoRaHuTLDpPhg3LT8TI3tJhpeWM2b38pMBgmTMgXOlZCUrCZfjCiuyy9tNQicHYM8nmtpoLR6iYTeLJus2q14A7dHvRMlTnT1prJuDoApCrpSe+9KXff9vpbHzr1zirD3YbF+XmFH59YmQwxeGTUdVlfOo1Jyjqbh4hOam9giq2yJLDaJOkElIXVrRM8l18dH0iaFa+Pq2n25/4p512w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ti6ylpjPTD8khzVpZqatJgcmEG0EmklAupgOPYtpeOM=;
 b=s6cs2C2/F5i0fma25keZcCyItenjql0SBMuuUh2uvqpNZDQyv2VD548MAvsgl3QqHkn1xQSK99RrdORhk7f88taSajTtmR0YvRLmzhxJ4I3+SG4tHsSiZb3W+yJsU9fae6XqP+5RWLff3Gq+2lD5UO3b8lTqCRTeJzC87d0K3X8dTTGvwzK+h1VXmIpCQj6ffQoLIIWAj1S5GuyayzZEvDkYsyyAReXFVD3lJM09Z7o8/caeXEIL2AyShydMHNXHYFhmcBbeNXNiwKRVb+ms0V4sf4C2acea9REPHk8mE6syJf7MdNMEt/vCSSPDNh6+AlPFuhuH7oe0Oh0lC7e9bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ti6ylpjPTD8khzVpZqatJgcmEG0EmklAupgOPYtpeOM=;
 b=DBXVvnI2nZZFbEMnspITup4u+0bw5ZJbBA5mHgnjjq5KlhMnOoBGGxlrBaXSf43olR2YbSXIpmv6t7WJHphq3JNfLWA1hDfsmEHM/4NHKzFEMrfkHKPkYUgGd6b8eq6+CK9vWyi9l2rPfFZEa3rWHe1/cQOIyGS9BjHEpMYWs0y8YyRl+mqXIAhCAjBug24wFROlTsIUeGKaslCAgtQ61+jMSPBifQqGBL0WdvFJbuc0Mj9sfv6mfrIYhpv0qHDjmrrthRxzsCFPJsrFmld/kT22iaaYS6RybTCwT65f5GxamkdhrDgnx3BBUzRHFm+EP4KzUjvRl5lv1n+LATVqFQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 19:54:59 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 19:54:59 +0000
Date: Mon, 23 Nov 2026 14:54:51 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Defa Li <defa.li@mediatek.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
	mingchang.jia@mediatek.com, yuhan.wei@mediatek.com,
	hao.lin@mediatek.com
Subject: Re: [PATCH] i3c: master: Disable slave events before RSTDAA
Message-ID: <awSaC3TYce_GCgTG@lizhi-Precision-Tower-5810>
References: <20261106062236.564607-1-defa.li@mediatek.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106062236.564607-1-defa.li@mediatek.com>
X-ClientProxiedBy: PH8PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::9) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU2PR04MB8774:EE_
X-MS-Office365-Filtering-Correlation-Id: 64107059-ef94-4d59-1048-08df499ba7bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014|23010399003|19092799006|10067099003|11063799006|261021121427099003|261021123027099003|261022105027099003|261026140227099003|261028144727099003|261102123227099003|56012099006|18002099003|261009223027099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: Ml+smFqRz0Y55yY1zjPx5sM38L9IQAtlKHvgZxWovHa6QtVTHy7f+ywl/Y+JIdWjqUwSu4rK2PQtH0PZrMDrOrjtHiN8jjrKzZod6oyly5ZyIoCF+Dz8FHyGN+ONRdDBNOIKjqQOkBmX+SE4fBIrdQSXn5aYhSdAqWCZzAvg+tzKcpj0blL2O0vLW0n8vAumFTZ5V73Sbumb56l/VYXBT2Rlg8IlDNVSc8M0vox4LKfb6Uh5AFyDD4QFq0BOOYOQ2MlNqAGCs6L00/WYNDpoSu1jB1J52xruy6KCUapRaafYkoo+zn27Am2H4a+4v0d3cSRU9Xra129/jEaHg7atRVwe4D3cdjPcFhU54xvDVNVpj6IDPc0o7rGzW84ygfx0JSHVI+mHVDrM660UAWGoZNUqYg48851MqEtdj7DXLA8GYK7iKKipEl5iCXdwCAP2uP74c1rMfdXgyTz34jlaligvOIP4c6DFuqXCnARcyxSBYd3teY8+p3faioHq8WPf6bm+Hl4RmYaLbU96Mn7AAcbyuaMn9a/t9c2j3Z02Gbh1TvbFPZCUJ3MIvj86BAh5O8VbhjNaKMY8fqUfFz7pyhufguWxgdx/82SdMXWzsZinVcGanCvnOuzedAcwwoZnZpwbHGEOsP9BEXg6Zqoj7pX8Oj/tvPEIfSu1hkwcTdw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(23010399003)(19092799006)(10067099003)(11063799006)(261021121427099003)(261021123027099003)(261022105027099003)(261026140227099003)(261028144727099003)(261102123227099003)(56012099006)(18002099003)(261009223027099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1qGfFhvb4k+MNgGCkoC+YoXktC4o9wcftLjr6m+9Govv1HHznBAH5wqhlgQM?=
 =?us-ascii?Q?Pwfh7febbmsDkuKjxzXZZvH2g9ui6F/ZBeGoZZ+wyWEjSmDyeg/E4/UPl+c8?=
 =?us-ascii?Q?R6ZfrawsKSsVNI0akRmnhni6DyufcxqTny201G+Xo2cDySKBLWxcnN0Z7avz?=
 =?us-ascii?Q?1I9V4UIlemgxOnmgvJmvPTRPq05JXTKAJAVDXEplbWcrv2lwdbD5oeJv2lIM?=
 =?us-ascii?Q?JKpNhEO03OBDeoZhzCPAkHsNOgHdoDuVUitY7B0XFSgXTHPecC+5exlzoTY2?=
 =?us-ascii?Q?8vAiRGzK6keoe77sDOVInbY/G3wyGbsd6eruDDlBitk4Wa6brYRjzQed/fMn?=
 =?us-ascii?Q?kZbo2EIxqPJNig1Ig0hPZWrNZ66kV7OSG/bE7ImkRiFSdmtK95ruD5nlY3L8?=
 =?us-ascii?Q?E7OZ4YXhfH33HLnexxekXt4JWRn2KFRCDOpaiWTBlZVtlzfBodpxiKbMIrr8?=
 =?us-ascii?Q?lXVupjGWaQ+BAvndsWTmUweqbZHwkU9oUXcLdFJsnN4DXyt1odm/EwGWa7uJ?=
 =?us-ascii?Q?KG6xR0H0odkKq699RmWDwzuHM9q5d3AYN5VQ5sC8lNOYA+Vxp+xxHCZNF1AN?=
 =?us-ascii?Q?cCajV4FLexME7hO8lm4ir3k9B0tU4YZMKAdZEFOhEsgQwRunAYxmiBUZmZeC?=
 =?us-ascii?Q?9BqxQ8x1qmtSHQWfklmpSHfkf0UlnJBiDmetyj4uZXcLlvr7wNxDGkfwSyvP?=
 =?us-ascii?Q?nAC8vGaErf0w/63QNbAKAbMneqo+nCTHjRQYr9Qmq6+r0g/foG2vcz5X441Q?=
 =?us-ascii?Q?RTjbgUtBHU70OjbT0CzOZZBPudjdOjd+a/gnD0YPa2L4AsF0c+RgDvlMOZKK?=
 =?us-ascii?Q?ivnTvXfAkmMYEKfChVHpfW0td99HtIFDCa43ziN3HqPQylJ5ym/7rt/JB/n8?=
 =?us-ascii?Q?NyA8hg8Eeels0UyY5RmOkTmyK6FNh2wtnm1EVhC0hTQ4deCd0Yuu4RBDXojo?=
 =?us-ascii?Q?BLWYroai3T0m9Z/iv9dVip0IwIx2Vh0KrvjD8sPbmUZMMY6//rCDcgBf57KM?=
 =?us-ascii?Q?9nEYW7NfK79QDSU4hGNWha7LOcy8rWprizQds55qbcp5u5NvroKOXWtsWmZg?=
 =?us-ascii?Q?hPxgo8ZY8w75qDywO5eyRcOAXl+2R0JeV09d0PmdAGqK7zuZ8GTAGz9Gekj1?=
 =?us-ascii?Q?WVwXez8sVxJh6s12OYLHLNU12Y3JztK7xpRgIkYfGvpcIFbArZPrZmnTIJ0n?=
 =?us-ascii?Q?1bBD1kpi+8m9oB2GpWqkhuy8qWBDHyLoMbpawkZ9PKzuCHXVWtrSARP98Ux+?=
 =?us-ascii?Q?8/xbR9wSeTFc5CmQnaGUBczC2r0uKRj0Y0Ibe1sYhosG1ttQWp9vaZGnMmJQ?=
 =?us-ascii?Q?nV7eMLJc2CaoGyRuelE19cr3etk9SLwXwCQVnmQbmuoqQ9QVOjKjjogRnMmC?=
 =?us-ascii?Q?1p0j6IQ+3bZznD9EgXD4tX2BljykokmBDXRb6dDvOHVjbPEgKWkksip91xtm?=
 =?us-ascii?Q?aPNW/dvhHekRduPFQwTaLxE6oQwAzmVkNyP+ivigc2UATPNdcTGgJohAjwng?=
 =?us-ascii?Q?QtCcc3itpJGSnVqMPTshiubH18gF23P/F11HDYZNwyvcW8UY2H3foWpHApER?=
 =?us-ascii?Q?NZtoKj6Ug7yIDsIq03tlTBUqlNa6CU9sm8csLLAFEoW8UUfSGjKMyme0jYeo?=
 =?us-ascii?Q?pkn7N/O/nAUz7w7f+rGTxxSx8PwUbrsLJEu44/fZENJGgYZbjxhHtghdERxo?=
 =?us-ascii?Q?SkBINJBTvWObcrcC+gno5uGmriJ/CFCzmrdj4SxAE5M0NjAlwvMi4aeHjBhM?=
 =?us-ascii?Q?EbKWsCDfYj0of5l1U20UA081bvf8PEhoaHNxMlRnlOq/pfNnNaRo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64107059-ef94-4d59-1048-08df499ba7bf
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 19:54:59.3958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L0awjjYaWwxbl502mHR/wWcz+m9v7QEpBVqZRHZhbW2zR3NcXZ7cSvbZDwCk1/76jYAYYBFms5CW3NvoAHMUFD9P6cb+ojagIeHfprOcEsQQ3ONEukiguyIjPOTmBxLT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8774
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_115504_220180_1BCAC5FF 
X-CRM114-Status: GOOD (  16.66  )
X-Spam-Score: 0.0 (/)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 02:22:10PM +0800, Defa Li wrote:
> Bus initialization sends RSTDAA before disabling slave events. A hot-join
> or other slave event may occur after RSTDAA and interfere with the
> following DISEC command or the remaining initialization.
>
> Send broadcast DISEC before RSTDAA to disable SIR, master request, and
> hot-join events before resetting dynamic addresses. This prevents slave
> events from disrupting bus initialization.
>
> Signed-off-by: Defa Li <defa.li@mediatek.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 01e05bad8661..4fdc8f721364 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2571,10 +2571,12 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  	}
>
>  	/*
> -	 * Reset all dynamic address that may have been assigned before
> -	 * (assigned by the bootloader for example).
> +	 * Disable all slave events before starting DAA. When no active device
> +	 * is on the bus, returns Mx error code M2, this error is ignored.
>  	 */
> -	ret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
> +	ret = i3c_master_enec_disec_locked(master, I3C_BROADCAST_ADDR, false,
> +					   I3C_CCC_EVENT_SIR | I3C_CCC_EVENT_MR |
> +					   I3C_CCC_EVENT_HJ, true);
>  	if (ret)
>  		goto err_bus_cleanup;
>
> @@ -2585,12 +2587,10 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  	}
>
>  	/*
> -	 * Disable all slave events before starting DAA. When no active device
> -	 * is on the bus, returns Mx error code M2, this error is ignored.
> +	 * Reset all dynamic address that may have been assigned before
> +	 * (assigned by the bootloader for example).
>  	 */
> -	ret = i3c_master_enec_disec_locked(master, I3C_BROADCAST_ADDR, false,
> -					   I3C_CCC_EVENT_SIR | I3C_CCC_EVENT_MR |
> -					   I3C_CCC_EVENT_HJ, true);
> +	ret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
>  	if (ret)
>  		goto err_bus_cleanup;
>
> --
> 2.43.0
>

