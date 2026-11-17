Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239F7606A337
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 09:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y6H6Q6ER;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Y009F4M0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GgK63glnyj/ZxugxcrAE4B7EHWl/JpNRY1nUgx3hoXs=; b=Y6H6Q6ERHoZTVOhRF+fUrB4wFS
	edX8z7qHiY1zdcw644LG30TQwMyXf56FPOwZFatm2mLPL4fasSx/2uV0JOyAbOMfhapGH3EDe8lXw
	sTteM1I2op908DDlR9MQAQ8RN7ziUi+990Mk8/tEXrUD++nRNqJ6B1u+NMTVS96qylQEDswSLBbmb
	4sZSpYc+jKOK98Q+ZTJYYT+96U9u8KTRJw4C9jkcVDdopte74NTgww00FR6s1G283rY65noPMWUmI
	ArJz9aUTOYggA7orL6kD+9ijl0jhaN8hmjVuGzmW/y6Xf1OA27Fi9aUrg2EtraTrjq9Zobx3T2c78
	RQjFOUyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTF7Z-000000050p4-317q;
	Tue, 17 Nov 2026 09:04:57 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTF7W-000000050jL-2awM;
	Tue, 17 Nov 2026 09:04:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vSX/KnOI+sE71ccphPtuwlnMcGFzdgDer7ID1WqqJZyE8oqYJQQhOtoaxPzO/XaRnd4ACPkAR9Lf7C0TZBZ9REe33X7WO8AaJW4CsjuC1fOgcGJEiWEHlhn+D1SVHmTEphwZlcF4J69VxGSVkY5iWnHC9GkpccuUF3BvWzhMBEfwotfDqOLLHD/2lRo3JYF+sbc7nbUr944iUA7XeBG/q0Lbf7Ad8Tov1h6c2AxB19SJL6cE5oBquFgVoZDzqdBqDhKzCozRkNC9q6ygnXb8a+PXw2f9ANpDXoT14khPXQK3MRABCV7sS+VEgf2jxVaOKBPp+d2VQbm7oWgs+5CwMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GgK63glnyj/ZxugxcrAE4B7EHWl/JpNRY1nUgx3hoXs=;
 b=xrrRojlsCH/Swc27ZXi05MjGBJXpTMq1dqQOkrBt5QwTSzlbXZzu91cTv90jppIuQK741COVHsK6UEL4hD8XeBfurlIWJJB/CwOht8UyXkWWIAIVjJW2QEnr490Ntz5Cotgtvixt2DRWiYphzgzzXdWphmVC430/MURb89WQWRgY9q3q/y7am5dbNYQ6kwj3KnVQsyx1VDHuHTUCnywUxEvOzY2gtstERfPN4DfM7ngmtt5T5P5vvjM5T1+gYEVIlbhKVla3W1wfDviAir9M/h/A/XhvVDovNq0Twy+zaGxB26DaVH/e6h1kexF2hTmhY8UiK6hG0fe7VlCsUUvyhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgK63glnyj/ZxugxcrAE4B7EHWl/JpNRY1nUgx3hoXs=;
 b=Y009F4M0fQHxhwiBl7MDNVjZph1F0scqDFaxbbYVt51ME/8jMwztkS59xBZ88ItL1+S7IYGI+IoIyewvKNVHeIXGEPs/8bZsxYy8o8fKq6jnzvVO9mnEJIe0xEfzhz/5Sfoge+gTL1IfSN/YmvKHx5/CLr/Nwpib8djDhlNPtWx7cVvPDX2EF4G/g4lXCU4utHxzGLQfg6Q79djACx5n/FDTBGMBDvCJ6QxPH7WbgJM0JvZ75ILR05lBKZVAtErdJZ1leglNZQX2l/19fRZ0Dy97PXEVimgailFICvSUgSXaL7YJJvHxkjjoF5kLyYWgqGJ/Xt1L0+YUKAn0rvspuA==
Received: from AS9P250CA0021.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::19)
 by PA2PR10MB8720.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:422::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.6; Tue, 17 Nov
 2026 09:04:46 +0000
Received: from AM1PEPF000C1ADA.eurprd02.prod.outlook.com
 (2603:10a6:20b:532:cafe::25) by AS9P250CA0021.outlook.office365.com
 (2603:10a6:20b:532::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 09:04:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM1PEPF000C1ADA.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 09:04:46 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 17 Nov
 2026 10:05:30 +0100
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 17 Nov
 2026 10:04:42 +0100
Date: Tue, 17 Nov 2026 10:04:40 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Joshua Crofts <crofts@kernel.org>
CC: Vladimir Moravcevic <vmoravcevic@axiado.com>, Tzu-Hao Wei
	<twei@axiado.com>, Swark Yang <syang@axiado.com>, Prasad Bolisetty
	<pbolisetty@axiado.com>, Mark Brown <broonie@kernel.org>, Karthikeyan Mitran
	<kmitran@axiado.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, Michal Simek <michal.simek@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Heiko Stuebner <heiko@sntech.de>,
	Jyan Chou <jyanchou@realtek.com>, Yu-Chun Lin <eleanor.lin@realtek.com>,
	Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	"Sowjanya Komatineni" <skomatineni@nvidia.com>, <linux-spi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-mediatek@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 04/11] spi: stm32: remove redundant
 pm_runtime_dont_use_autosuspend() calls
Message-ID: <avwYqLu0nEGsfAv6@gnbcxd0016.gnb.st.com>
References: <20261108-spi-dont-use-autosuspend-v1-0-3587b0183cbe@kernel.org>
 <20261108-spi-dont-use-autosuspend-v1-4-3587b0183cbe@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261108-spi-dont-use-autosuspend-v1-4-3587b0183cbe@kernel.org>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000C1ADA:EE_|PA2PR10MB8720:EE_
X-MS-Office365-Filtering-Correlation-Id: 87d04b6e-1468-4308-4230-08df4489d3af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|7416014|261022105027099003|261028144727099003|261021123027099003|261026121527099003|261026140227099003|261022075727099003|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003|261009223327099003|261009223027099003|261009220027099003|261009221727099003|261009221227099003;
X-Microsoft-Antispam-Message-Info: MmBcNlKoJNUyPWEa3xjn91urwAHoIMYAFvQVaRwUomNDVn6cmpce7ciYMQpqxJEKUfqyc/kca9NvFQp+vsnowSkCJz5+ske6YkXk9DkhOzP1ffOxUl48JBcKjW4jdZ6aJYJrLO/CYSK6b8TN2qW8D6H15jSIbQFHiDMwWUKTIOq5vmAY+aApg5jlSzV8EEMXY394cqVyF74RNqrMmAE/gxkKBT9Ckm7zWDBDZqAi4LWTG4BORFpKiCyBourSVShz89jCj35p4QAPBU8/xB0C/YSG7p3WkY4G+91w6g/wN9n6d/hEzkFckQpBFvaat0xhy5ldAlexSvCYWAlgYrFeN/cH2hiCUtqKi6AvkhorqkA7nPkwTNNc5YZj+dUWx/O+TGYECjjKOWUbZcvlg1fIyjigXyA/dbPGvQwOn8Har2bscr5LZltldVRK33dW4EbKyXgOnbDVmLhY+B8o1Z8tAtZcy5O4WQ+v7Cj2gDcAAybAm3I4LbRgjKDlHF8ZcjjPi6KHm87fsrS3Y5lGDeQqXptAw2iP+Aw9F9/O6d0b6YW+C1ea7NuBJNBjGMFRNM/708Joj45EPWJgM/UmAQW7P7G0NtWdzPrSj89E5cRli5byaCCitdl17r5qwEl7lyXlkhSl2qnmfAsRXP4ztxhn5mFRQ8VVHPxnldPgftcwPQbH01sZIJ/YztRj279Fc1ZeF6Ff9csZcJLR4qVw+EUwgA==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(7416014)(261022105027099003)(261028144727099003)(261021123027099003)(261026121527099003)(261026140227099003)(261022075727099003)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003)(261009223327099003)(261009223027099003)(261009220027099003)(261009221727099003)(261009221227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uYk6wlbJ7S6TJiySOlPK6qEHBdl2PMQ07A97ROAgANvoCmqsEOxMDP+PM88DUSZny8aDQUT+hi6+A9Teci2/79870GPPmZauL2ONj7eoj3AvgZGd//pCzXhCiF4ukMv0HpplrSCshRURev+3V+VPlPXnp24slwWZrR+mu7/3I3sQn6igj89xs7MGxSGNhr1tWsn6vHJ+lvSZkl/aVcsihpIFv40SmB1V+GzgAXYQM5FL30cEfL1BUY1nxOm+TH51SUrLWn6EG2GMH4GckfnNd1OmKQgUetB8wUFTRnL2c98Rd5uPp/JuXkOhKtRBFB4xuBcd1HDn8VqAQlgaZWylqzv3VktVwlikEdrNkllXpv9gXQCCIESmuus4NNfYxuOpnbNjPklQtvTz6vRHqKOaCQ8drvoLfz45Fgjlt64c8uts4uOQSnOrtplyLdxyS5uG
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:04:46.1762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d04b6e-1468-4308-4230-08df4489d3af
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000C1ADA.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8720
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_010454_660872_F1BD8BD1 
X-CRM114-Status: GOOD (  15.28  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Sun, Nov 08, 2026 at 01:16:51PM +0100, Joshua Crofts wrote:
> Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
> driver core is now responsible for undoing any
> pm_runtime_use_autosuspend() calls on driver exit.
> 
> Remove the redundant function calls.
> 
> Signed-off-by: Joshua Crofts <crofts@kernel.org>
> ---
>  drivers/spi/spi-stm32.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
> index 4c3ae546afc0..95994278cdaa 100644
> --- a/drivers/spi/spi-stm32.c
> +++ b/drivers/spi/spi-stm32.c
> @@ -2544,7 +2544,6 @@ static int stm32_spi_probe(struct platform_device *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  	pm_runtime_put_noidle(&pdev->dev);
>  	pm_runtime_set_suspended(&pdev->dev);
> -	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  
>  	if (spi->mdma_rx)
>  		dma_release_channel(spi->mdma_rx);
> @@ -2574,7 +2573,6 @@ static void stm32_spi_remove(struct platform_device *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  	pm_runtime_put_noidle(&pdev->dev);
>  	pm_runtime_set_suspended(&pdev->dev);
> -	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  
>  	if (ctrl->dma_tx)
>  		dma_release_channel(ctrl->dma_tx);
> 

Reviewed-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain

> -- 
> 2.56.0
> 

