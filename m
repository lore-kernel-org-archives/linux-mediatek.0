Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C3B606A326
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2026 22:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aOMd3ZnE;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=lLkofCIK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fYROGaWWEuzGAu5dtTnw4QlTAW+v+opptPz7qagaCgE=; b=aOMd3ZnEjAkSgi8MN+kUhmn8SE
	lBWh8m5JznmMYAqnw6oltiCLji1a+RO19wWGAjf5kfIX41w6hH1A2gcuG7jBYbqLVufUm7fvDUrJe
	rWjJ6K9kZtFl0ma0xR8n3VcdcYfxyJ1/gMTd3FWWt0BIEixIz/4Fd0Rpd4dKezE5rZfd3fiGPvgNh
	q06ah9dy3XCJkzhPiscXx3EXWGRDSq4G1GngfYCGuD7HyIKqLrrm0iw/fxeF5eWsRGsZWVj0Q3AYQ
	SUWGEoEoaFqZpFANEJxOrj7MpPZVnppEuFv3qV4Y+IhR2GUej8qpWWqk3CDi1frVGz0RG6U0gXQI9
	IjM4tahQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPSAD-0000000DlWo-3okJ;
	Fri, 06 Nov 2026 22:12:01 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPSAA-0000000DlVs-2L6I;
	Fri, 06 Nov 2026 22:12:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJ7QlGEVsZIgCKxDJ/k+t5aTcD4TTeOYoazyYzt+aY06AN/UGF0lGMbCKx2kLCld16gbewAtIRCHJ3Lhca5Gogm43RbymAaH074cIeALFDATekfIU5mt1RIbptVpYvT1XMx5tkuu0GSVD210WR6Xkw/xAtBrG6X3O+DyVU7CQRPBojlekvdnpL9jGtBgRYLOv8q89npiM3l3oy7VVDugRA3KncTGNn4EmAjafAv8Xul4PbrbfZtpCaIdK0W7JpWAMDHjb1IHjyM03gsERu64OvurI5zm1UwkXPG+DTmE6JogIDW3POaJQQYkMaoFNcDSvgHiOgXWhgXVKIjBKLVfwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYROGaWWEuzGAu5dtTnw4QlTAW+v+opptPz7qagaCgE=;
 b=Q4Nx9d6a7RwMm8L7bR/CrERUUL1W1UDhSuj5sa9PwBIWNlfBDqxmv33p3e6Sf001FRKhyNsg35G1lWBGtJ42vnHVndEw2bTsA6Q1pJG93ec84rnIsZXyHxyf8hGE7OAosZ5YmEGi8wPmprayn7hxG1ns8fg4PuGv42/cU/3nz8C3LjV1NiilqpHTJUcLvbWbNPf2wqswxDhlZgPan8wf2aqxKLp5QKQZ3V6PEEmpJk+kHtYE81QacAedNBDXCBIr8E0zvFdKrj+L5uiaBu5q6cValQOeS9x3xEX5UeU/0w5g7RWotvqHdwsAATAbBX6R5RpGBELkcbCP+zF1/hOGLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYROGaWWEuzGAu5dtTnw4QlTAW+v+opptPz7qagaCgE=;
 b=lLkofCIKqZZl5ti68K7rToeUYnjLIq1FlaGA0BLNfsckwA702Bv8PZ6jOxGpXxWp6DcdrdmHh9nhDOKNCv2DGmar43qmZ9nsNzjIgrAl5gFNcO/OI67MkxQUXex9D0UCN71wv4QWS/Ll4QiGVSTKl9XSUcVS5tKrvdnVgHmlav+mFwrEqQuiPGKDC4zUjPTwBtGlrlKau92ZKFSluJxj2ZvSjqQIhnhoCHiC0rfwR613XDdYEQO0rVZCfLXyPEPC/4hU8fPpcz6730zhDtupv9Bh7wZVU5uAjl/iBKRLK8Nyms6PAvCXkjxMef89tcJ2leFVlzUO+PEtCZqs1K7Gjw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MA9PR04MB629231.eurprd04.prod.outlook.com (2603:10a6:250:10a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 22:11:51 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 22:11:51 +0000
Date: Fri, 6 Nov 2026 17:11:42 -0500
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
Subject: Re: [PATCH] i3c: master: Set I2C client for dynamically attached
 devices
Message-ID: <au5QnvfvZmfjRxWd@lizhi-Precision-Tower-5810>
References: <20261106055637.563626-1-defa.li@mediatek.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106055637.563626-1-defa.li@mediatek.com>
X-ClientProxiedBy: PH7PR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:510:33d::30) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MA9PR04MB629231:EE_
X-MS-Office365-Filtering-Correlation-Id: 92b76f6f-a876-4411-8a6c-08df3c52f558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|19092799006|11063799006|56012099006|261021121427099003|261102123227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: MbW77KVWwv/5SgS846vll8Ma7qJQI3g53dE3EX9YM6Tohvl3qomovNYHXZu2JorsWsFnXzlro4XD8Xt6cDvf4TPvl+SQJevHF/QDpCiyX7eja9VuIMKFfqzLe8CU0bpTYRpJ+xTdJ64wAFwKbfEeTzsAMc+CqJCGvnpnWztNrKDmJx65GrTo/z3Owp5CDQjMspN6dx1dOzngbJ+1oCN+BbRslCm0Ufin+Hv+TqNU0YgteGW61SEnOXmaAs3/BvhWhm0YF4Sw+cxt+fntlq6gsTPCuw2FguwxEw1rMeFotWv5zkgtSuDieOSQOA+C5cJqzKT3XaZQiAPOgAFeQuPl3f4Q2hSzqZ1zRwRJHUVnNj9CJyHkCIOYOZnhYJGkorXYtktZLgDEX9MvHCT4w46TNg/AaQPLntpvnWpg52wrjsHnngfw3IQAnr9YElvqFE1IgtVOr5negtj+QEFMZu0Pf6BAQKI4gZBqzoD209ih0EOAGUE5ylLndbOJOgb9+YH1TAPPNgUt2hChAkrZdfV3w8UTifhjWpS+Jc4DhfqITXvcb63DVvgvQi54MTwH/DvcAcUwYX74AyAW5DWCwBL34xHnBg3J+5KHZ8xAAcZuip9s4vlOlLWC+gtEUhYGLgHPyoduVORkUkG47sfIYltAv9UB708CTNv4E5eKqX7aUus=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(19092799006)(11063799006)(56012099006)(261021121427099003)(261102123227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vKkOF5EXP5RLfwgvMTKftKPlFxxt1hjKsw2P5EQIE4RFYJHlxV4a/tQ2VCDu?=
 =?us-ascii?Q?wmMa8x/7RE4tj5Ob2H0ftn0zG7biYAlUpBH2fcz/gEXI1Bcgig4KdiglnkmS?=
 =?us-ascii?Q?Q5mmDhaA0WzL2vmGFUuIQKuRXsU5vTr/4qnR7OG8SYXLcx7yLBWy5sFHATq4?=
 =?us-ascii?Q?evVL73buTUMB1VxOA4zXgJA6iT3Kn3LNBG3fQq3LcMPEbMxG0cMnB1cqRHgh?=
 =?us-ascii?Q?+pYoxm3Sr7ia1dp2wpjx5QegPp9qGAb4rv1Iorhsch/fnqGCJ/J+ko54rnob?=
 =?us-ascii?Q?29kX3feooRd3fbfHx+NUmVGYKo2vj6p6gmDAlXJsKZSDWN1zBglrzgiYd8n3?=
 =?us-ascii?Q?Zk3PgWXX/s/uqOpyE+ZjbRoW0BTYXq2tQMJvnjjyot0HPFa2jnxI+p75iVYN?=
 =?us-ascii?Q?QPdIY71YZvs0qE0W1UnBSF8ZzailMGYcYnJK6fIg/j2h3Cw7g26sl8yXSGMx?=
 =?us-ascii?Q?/4LSTUZxCIPuo7fxfWnt8MMbWQ27D1BKYkEFhUVriSDNxno/9FJSXW1jVtdQ?=
 =?us-ascii?Q?Wd1qchV9oFgkGxQDyAOAFlVAdxO+wShXMaTV+bOeChgzkQR7apKMW56ay72D?=
 =?us-ascii?Q?yhY2rvx09V917IDnK4t0/E3n4QqUNbqiC+Ye20avDt8m+/z9Qv36u2TVIaQv?=
 =?us-ascii?Q?j4im5FudlzTyPsSDJyl24jIAk6Vc+imn/943oiH4q/t2H80PKOP+jTyyfmL+?=
 =?us-ascii?Q?0aDCiUqfhZpfHIgY+UjbuFNhRDgbtZMrFayWg/IzovzBQzhn63UME73avZwv?=
 =?us-ascii?Q?QYyf/ocqcqJ96NL2H4teSPaVwgmVg6zWcYE5ZAp9Otl6lJD1eDqrcoK+E8LW?=
 =?us-ascii?Q?HUw/Y+3K77ZAfxxRHilEox8BR6oKzAGDV9tu0r5v6fxe8r+wtDLXfrc5Nyov?=
 =?us-ascii?Q?w/j+jThxER18KmIUGMmJ2Env2mbBq97dPURfo4jgWMVpoVqE6ho+DrL5yusW?=
 =?us-ascii?Q?mHuvrgACcO19q536imRlDYiryPc6VryK0R+zwcdqBoa6VVjMCgSybUvwjyjB?=
 =?us-ascii?Q?dgy2tA3WgKscahHeD/CYnYKQB9QWF8QsCRYaz0Pt8LL+gKQDWDvqwpDLxR97?=
 =?us-ascii?Q?EaEQXO0ZqNvtf2hj/os+oLVAZFohHjzl2FNmnx/Hooxa6e2JIyaJb83CMbb0?=
 =?us-ascii?Q?qCHwhiaL+H2RqSwve7lPEorW6cSrklPwe4gkd9n0yUxU58jfoSLW2ONwGfPV?=
 =?us-ascii?Q?3D9JGKX2ulOBR6Mt2ZP7b9ROF17z0BGn6WYgmsUnaB2yCqaFaWhgjC6xgfyw?=
 =?us-ascii?Q?YiXIlmTzsqrp01uqeSMMwfIP0/kUGRi2O25ynDM+HejseQ7QMfXE4C72riuT?=
 =?us-ascii?Q?6yuLyTKe1GsraSAjjye7cEYYs3eGKk2exOzzKpln7rnuBZeo3LOzNAACNQku?=
 =?us-ascii?Q?Dz+3nHQvxlJtl5SO5X/kwne2PP7N6sGDWMrds4oMK6hjmZcLsNra4TgA5sPm?=
 =?us-ascii?Q?twf78q3kjo/jioHazte0qZ5d+YI7BXAo9m11UBHqohaK9qeonbnld0h9lbSO?=
 =?us-ascii?Q?NLQqcQMdlkAZ4bjN/81SW4fSc87IYkii1iBCmEkXE3jkFGBxfvjNTjM3HGWN?=
 =?us-ascii?Q?sFJ/sT4Oi+v0g58uAxlVg/m4r6eGyh2kKKVOrGDMv4mFmmd0ET9IF3GEk/F3?=
 =?us-ascii?Q?VmQHENYc8dtwb3MDeg78C7VA3pZlNYHv39DhygkpxPXEnG1MuHU7Fe4tvaQg?=
 =?us-ascii?Q?DEemQyL14Ka8vITk1TOW39/4C8A7n2Y3Dkn7+f++MNnuTcT5DUEVV0vKZKD/?=
 =?us-ascii?Q?3i9ZZ7Q+eSC/mUBkCZN1e8SXpGOnGM37X+f8ar07SUMmzMnGGxvJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b76f6f-a876-4411-8a6c-08df3c52f558
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 22:11:51.2322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ay1XZln0DCvZJxKotznxUosPqzyX5SntGnt70uTymLOozNWeZrdiznCp11WKxUxDmtFnysB8dqREarg83RO72+CAsI3f9JGN0BwF0IoyqWejmrgI7KAN5ZAjLC3wUSe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA9PR04MB629231
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_141158_606675_6F24B203 
X-CRM114-Status: GOOD (  14.25  )
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

On Fri, Nov 06, 2026 at 01:56:10PM +0800, Defa Li wrote:
> The I2C attach callback allocates a descriptor for clients added after
> the adapter is registered. Store the client in the descriptor after
> attaching it, matching the setup used for board-info devices.
>
> Signed-off-by: Defa Li <defa.li@mediatek.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 01e05bad8661..690a045bffa0 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -3467,6 +3467,8 @@ static int i3c_master_i2c_attach(struct i2c_adapter *adap, struct i2c_client *cl
>  	if (ret)
>  		goto out_free_dev;
>
> +	i2cdev->dev = client;
> +
>  	return 0;
>
>  out_free_dev:
> --
> 2.43.0
>

