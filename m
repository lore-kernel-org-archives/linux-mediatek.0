Return-Path: <SRS0=vX0G=4A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2498CC2BA83
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 11:15:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAF1020848
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 11:15:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d54pxE3h";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="InfEDylZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAF1020848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lshIDMxFVYUhiXPmWEGQ5RaJ/sjrbpRoYHoOODm0Co8=; b=d54pxE3hoiYK/7
	Hwdg4EZpoNvsaZpXu9ZgMOfEKD2i4MkEdt19I/lllsOOVvE1GnFRMyyUYszG46Re+THjaumdtCQHX
	E00gczsHc/ecoUyBPS5mTfx2Uq5NPVXFts+Drjuyg7NSo+7kBslTwUTIXQXrTwJOQJdALBZbuZWbX
	9MJVe14XusladsZueZAQZK1r5JC82PyUeNmrsVdCCN+D5cGhfWJsPx6dPm5mdiqCMf98M5w0tCNGy
	LAKYv1WsOlX760zZ2zi8oDZX4iVLl9ks9pZDI6RuvZxX8tipN/ZnWcfB/DUYQ/0BOOLmPVVxnP2ZO
	DIBQONDBX/jGn20/L3bQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1pz8-0004X0-8t; Wed, 12 Feb 2020 11:15:14 +0000
Received: from mail-mw2nam10on2044.outbound.protection.outlook.com
 ([40.107.94.44] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1pyp-00039y-DO; Wed, 12 Feb 2020 11:14:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gG1eL+xdVHiLtDpQLmJiJN4YCXqvv0vItfNlGYCbNlE/uvADIfQNUx9frs1dElYtIkYbLN4VBiZrLGfxOpYdtBqcrdeJE7qpA8Vb2H96qLmbcVtfO6p0kO9ZWmC/FDJ3flIjhlkJ3U4MjfZu81trtq2MqD8i68XmgU17PnXeUlGH/6JqAQI7agmMSuHgq6hKTDvBd08lVP0btxm/c6W8yys0GtRCLu7DPbSc/YkfvezLLFHOOWsdv5yu+kheEQT4Ot/u3n/f6e05GFhWewHxCRj5oFxcmyjXlZ6JZFzPKNxeQF4LLZkX9re29xfn/01gXP/brmSPCBDk9J3tEbAm4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twpvHZEms3tuvH2nBeYpnefXIBMh8mNWxuwuqlSsfpQ=;
 b=V/kbs1MoN17QDjEB73JlSbwa1OyISlVaE1oKpv4fOfRfAwuVrPZPjIdt4TdiQtKwM5gp8Pfq+4jakCog77cJSHo9dJo4IZqelUIjOxvLIbd8pOS2Ut4bFmn1E8v8XGCxApMavmS5hJEq9NaJbDRvSSFn+GgztHoFaiA3NGPp2unhBvxUpe4rz0I9MLO9p0MYtkZMsFVoozCRTQiogOseYNMP3nnX+2jECrdBkJpCxRJkPl//Ml5Pz4Emf8osZSj4f9TgOmLnLDpIKS3jROWsFmLzJZh6qvIllPgulxyx+I86GCTuKSGdNi11xNVZofqDlgSyjl6fwAB4ExT2ZQ0Nyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=glider.be smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twpvHZEms3tuvH2nBeYpnefXIBMh8mNWxuwuqlSsfpQ=;
 b=InfEDylZEyu55FVoTilThsFgKw9kNUJZrVYL8Y/IPxDo8gyuGuSrTb5xqGQtetTIuHQ83tYxmX3cXS+5Rv8o/N/N8+PL5ScMB6B1cZQd7oAfIgEQSzELZ/jfs4dxjZXQ/CYRfh+7fjjMGhCalNo+546Nib4cALcoLtNPjj4jDWI=
Received: from BN7PR02CA0012.namprd02.prod.outlook.com (2603:10b6:408:20::25)
 by BY5PR02MB6643.namprd02.prod.outlook.com (2603:10b6:a03:213::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21; Wed, 12 Feb
 2020 11:14:52 +0000
Received: from SN1NAM02FT021.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::204) by BN7PR02CA0012.outlook.office365.com
 (2603:10b6:408:20::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend
 Transport; Wed, 12 Feb 2020 11:14:52 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT021.mail.protection.outlook.com (10.152.72.144) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2729.22
 via Frontend Transport; Wed, 12 Feb 2020 11:14:52 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <michal.simek@xilinx.com>)
 id 1j1pyl-00089d-Lz; Wed, 12 Feb 2020 03:14:51 -0800
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <michal.simek@xilinx.com>)
 id 1j1pyg-00023d-IM; Wed, 12 Feb 2020 03:14:46 -0800
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 01CBEfQs016071; 
 Wed, 12 Feb 2020 03:14:43 -0800
Received: from [172.30.17.107] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <michals@xilinx.com>)
 id 1j1pyb-00020F-15; Wed, 12 Feb 2020 03:14:41 -0800
Subject: Re: [PATCH 7/7] ARM: zynq: Replace <linux/clk-provider.h> by
 <linux/of_clk.h>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Russell King <linux@armlinux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Heiko Stuebner <heiko@sntech.de>,
 Magnus Damm <magnus.damm@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Michal Simek <michal.simek@xilinx.com>
References: <20200212100830.446-1-geert+renesas@glider.be>
 <20200212100830.446-8-geert+renesas@glider.be>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <60cdf168-a4c9-d3c5-871b-cd1bd5bfcffe@xilinx.com>
Date: Wed, 12 Feb 2020 12:14:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200212100830.446-8-geert+renesas@glider.be>
Content-Language: en-US
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(189003)(199004)(70206006)(356004)(186003)(2906002)(6666004)(9786002)(5660300002)(81166006)(81156014)(110136005)(70586007)(26005)(8676002)(336012)(4744005)(498600001)(31696002)(36756003)(44832011)(8936002)(4326008)(2616005)(31686004)(7416002)(426003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR02MB6643; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c692e37-1659-4377-a336-08d7afacc80e
X-MS-TrafficTypeDiagnostic: BY5PR02MB6643:
X-Microsoft-Antispam-PRVS: <BY5PR02MB66434C47E6EC75022491BE4EC61B0@BY5PR02MB6643.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-Forefront-PRVS: 0311124FA9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h7hKVJhLOPgc8K74hZJb+qKJ1vbApeHU7HnvtXkWwRxehL61Cr+WpB8R/g3YB+9b8BPfNcrmNnjKQLW2oyz6VqXZBK3kBtpz1Xb/s4JygCH5NE0LxhUhQz5PsIATsv6W1U9CELWZ5HcIDY/hJWHlmnVkZkBDaR+irsr+KVynQYReOuYAAGMEs8PBk/KahUru33+OlTLI66DU5e1wAKhGqzdpA9WDKJphmGRfUAfvWT7JPBdlHkhK96XxUFGr8TTQUs683/vTbJZPG6ZcEyuVkuZgkt8H8FMdecTGw4Xqif1rsnQ4BV2GfJuMDW5SLYvqnu5bqSiAcoIRAyPsIGIb0Wzd2Y0DZc0HgJzS50oWn9GGwBc6VcMbdjptjXb8kxrIAkViNKIF1raQQTwYKa+pRMkUDwiEOykmbYRvz7pLlpdwA9+mk3/4/d5ta5x8QZYQ
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2020 11:14:52.0731 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c692e37-1659-4377-a336-08d7afacc80e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6643
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_031455_456661_B0947982 
X-CRM114-Status: GOOD (  15.77  )
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
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 12. 02. 20 11:08, Geert Uytterhoeven wrote:
> The Zynq platform code is not a clock provider, and just needs to call
> of_clk_init().
> 
> Hence it can include <linux/of_clk.h> instead of <linux/clk-provider.h>.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm/mach-zynq/common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-zynq/common.c b/arch/arm/mach-zynq/common.c
> index 3a4248fd796281c3..a9dd2f71cd19d2a9 100644
> --- a/arch/arm/mach-zynq/common.c
> +++ b/arch/arm/mach-zynq/common.c
> @@ -12,10 +12,10 @@
>  #include <linux/cpumask.h>
>  #include <linux/platform_device.h>
>  #include <linux/clk.h>
> -#include <linux/clk-provider.h>
>  #include <linux/clk/zynq.h>
>  #include <linux/clocksource.h>
>  #include <linux/of_address.h>
> +#include <linux/of_clk.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
>  #include <linux/of.h>
> 

Looks good. Applied to zynq/soc.

Thanks,
Michal


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
