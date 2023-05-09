Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A71C77B75
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 May 2023 08:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WUxzmhYD7Ez6WaeQt0/7Yyu1JY/K842KnzyOPTR7oco=; b=EjtFrxhK+c+NA7irPf4x4/KnHO
	C7PhMJ0iMiqIsUK2ze9rmCsKTsAJhnKrhFq2lmqBw2K+lNHsHYwEUHX28FOE87yUuiVI+6lZHRIxd
	0/aqX1bm90fowF22dN9j3ycDhSNFCoidNvg4f4LILjTczNKmbyDjMyqlDyBqM2NxqGYXljyhPeJAM
	gIPkqJ52bAk/W0oW8YZKDPImPP58DUERYen+57gRlc823OKNSjeFrMiPba+HPVf2Bud3l6Gca/qy4
	jzQZIxnn+MDWO7B0mmTunCDev5Gr+VjLQ0Sh4Ne2KRAh47w19D0gRRH5WAsvZHWQI2LGcjgzEJP3O
	Cls2cGDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwIUx-002bjm-1S;
	Tue, 09 May 2023 08:15:03 +0000
Received: from mail-co1nam11on20710.outbound.protection.outlook.com ([2a01:111:f400:7eab::710] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwIUu-002bj3-11;
	Tue, 09 May 2023 08:15:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jp4lx7T6+DxwKyVSCdioBSOG+QnDIbT+CCPXidEDznSN1jAtahPzrRu90JVW0k0CptsVfjbqq9nR8Xqx0p2NviJ4+NXjioNUCwYVOQjoL5WkbvCCfFZn62ssHj/U/UM6qhcMMFYkYvZAbv4abkck4Q/nVtp2XfI14LGcMMl2AmePGBNJ13HZrIxDp3q1/NaD2aKXX3Pd0cySFQ0Zzux8AlO0Lf7Oz1Zr6fKBSgjUBAT/Z6y+F4Z4hp7nPezcxjFqCAbfRX4F5jq4PPGbSAXSKdQMdbOD7z/qpeWBnOi6amb/vwOR3TytTZxltujtynMtv3PN0VKUonjTJzdweHI87Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUxzmhYD7Ez6WaeQt0/7Yyu1JY/K842KnzyOPTR7oco=;
 b=glBpCyUP4O4eqDPiodcFGmOtTj0CZxYqsg1jEqHZ0G+2LYcY2BEcL2CGh3BkYfvZFsBT1wG3HB4nq4wHAD3+w0mOIXBbxYlLhmFt4Zu9rgCm9v46ajjkDmXbyVi7kit0tHjrOWqVVYTrN/ugsRyfcb/MzxfQ7H1byXcxQ6zx96eGLksivTyZr1JdcvwDj0LZoaYWP9S9tkXZdPleiZxI/81mvkYezEy2cjd5dyAcnHdVSxGkoIp2ALJSo3AixrAhqyanwNzNZ1GKFiPnOwYUjtqhSaq/l9mIOLo2n7iPaxD3AT3oo4IBsfmZs123YgoLsXTetLG3sBlbbUZH0ZnlzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUxzmhYD7Ez6WaeQt0/7Yyu1JY/K842KnzyOPTR7oco=;
 b=dsJtOutCjnJ0REeJK3iHn7S9Y4z/yyZGW/rjZYqGyJlNDW31fYwD2ARNoUu7vINdtJsPXfwRSV3Ex1Aw5oea+1F2F2g/4OigEGcE8e8+6zRRaiYyS0Ih9h65y1Lwu5aoBpTLMyCCVcTBw9K3klUs7eti9uYfDQpZcrK9Z8k2L0U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by MN2PR13MB4054.namprd13.prod.outlook.com (2603:10b6:208:265::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 08:14:53 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::f416:544d:18b7:bb34]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::f416:544d:18b7:bb34%5]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 08:14:53 +0000
Date: Tue, 9 May 2023 10:14:46 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix NULL pointer
 dereference
Message-ID: <ZFoA9kTa57yakps0@corigine.com>
References: <ZFmfxpsd8Fiqc7K_@pidgin.makrotopia.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZFmfxpsd8Fiqc7K_@pidgin.makrotopia.org>
X-ClientProxiedBy: AS4P189CA0009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::13) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|MN2PR13MB4054:EE_
X-MS-Office365-Filtering-Correlation-Id: e8c96431-9f39-4d6a-ec8b-08db506577bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	A7T0wLYyptjOHRfAaCPVdIJKQrmdlpGlIzlIAGZbdEr/h7nWTIS/jKuZuwtoDymq2Plu20AlsgbX0Ddj2TcyutAZVrfoX0wm+C5aYEFuaduyH8rzsBfYp/xffFJyIq+NRhiJCDBf8DOoomWZmB2Ei2FvDvbkYNs5YEYFICr4IEhu547orH/5F55WSoNnluM/ZA0klILRPhBkGgUiM4UAMqBJuhVKHRpQ9UVCGw8uEp2fYicsD2ZF91H/XaQgFLdTKBgZNyZj9fwpHQNWHfFSHMooBwKg/ZF5Ow8MV1/j6E2IqitWaEfJ6EcFj5Pee6KNJ7UklF7F+KG2uf4u9pXI9Rbs9qMa6xQS2NZE9d+ES6YxoyqkNZK3OmY77PAWvemIH1rR1JSRLh59L+bnhkCCUZTSLq5hQZuy/4/Yj7UUEOLsSiimZzTl6GtDuqs7oc0T/q1ImI/DxTm3wfwArJjza505cg7anMQak9nyPrjnT00G4m2Fz24TqIQcoh4rsJqJ2fUxQJidTB9WRfcGLYzQFAqV+4WSU4A2jLlWSYFsugHpo4H5PP1O4S56bhhe9BCd
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(366004)(39840400004)(346002)(451199021)(6486002)(6666004)(478600001)(2616005)(6506007)(6512007)(186003)(36756003)(38100700002)(86362001)(44832011)(66946007)(5660300002)(66476007)(66556008)(7416002)(8676002)(316002)(8936002)(41300700001)(6916009)(4326008)(54906003)(2906002)(4744005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?5Ixp1Un6vtc6ZziIzPohLPHXbEiZqec8+T4Whr0A/X8TjClu0ZeyNpWqyCpD?=
 =?us-ascii?Q?wxkrg7MwzJQCnD4K3er7MnjHWOg5kZcHF3rX30gzLtbpYfC1rehog7ehoB7G?=
 =?us-ascii?Q?Ap+ryUEGw7BPgHIjZ0b3chRFtKzglJy+sox3hIaSwW0ZylAnRulIaj1NIAJX?=
 =?us-ascii?Q?bBTCLW+vVr09XXl6+THlEpPyDatP4c3lZpQo/BIbLKxfyduX+quFgmy/WD3l?=
 =?us-ascii?Q?wKogJt/JclP+YlmNL/gFz3nUH8ldEXHRcMrO9fjCna/VqjU56CW80/NTrO4a?=
 =?us-ascii?Q?u+8nFF1M7O/abOa0QnTxrweCJ0Ne8aVAA3zet74EHMen+IBZd0iCFibh208c?=
 =?us-ascii?Q?nvNIP541Vso1eRvGW+wS1wL4npze1Ht27RjIAXJPB+3j9woM+c+XEep2PnfY?=
 =?us-ascii?Q?06hJo0jnd1vAdOqFHPToGzb2lhwVIjUqeM7dkbqeGYAhIY/Npeox9OLDoJ1P?=
 =?us-ascii?Q?8MKPQTD1r8mfNDGQwiGAzLbh7oYnqTEE64p24EXVNsCtCLv/dURojldtFg+G?=
 =?us-ascii?Q?IDdircyeZ9/c5jMxGrMWIZ4JWIzcHH8Q5uju1tDjo3lopJQxH8bdBhMlet7F?=
 =?us-ascii?Q?tVSOMJRbgEATlkW9RVZfvcYP9enTQsmS0QtYECtYLpbmMFKtKKUVKS1FjkOs?=
 =?us-ascii?Q?MEWus25C7DL3wt7uam1fG/VGEoCMEqiqBe4qHrZa6rMfLAN+zowaW6il0iIW?=
 =?us-ascii?Q?7hIhf0bm7o6fCnnNPIXM2ykinc39R21cPbnBVlnHzj6drLAev1rIFwXI5vAt?=
 =?us-ascii?Q?IaV5yfplhR6oZzIvdPPBhHSxuQrjjJeGLyCvH6pV9eeaVv7oMGmn1m1+zYxh?=
 =?us-ascii?Q?y9gqAM9n6s8EyqapkmIInZvi1+23pwaQQsDAqULLWUt++kepee1C3rEYE+JL?=
 =?us-ascii?Q?ae5z3+ITwcnq6lyddW1oL8ppY2du3rNlNn79DJyzHtY1PnvyNEHPsbdX2pIW?=
 =?us-ascii?Q?C+Ll1w1L1MMuYqR/o3dJ+Wb625pG2zpu0/63oCvkx2rOpAbVVxwpEX9C1jZU?=
 =?us-ascii?Q?Lp1h4SFnzi+3tH8sd74edfjnW1ZKBXO+xhjH2kbqN4xraOvyMBD4D4AUOoMv?=
 =?us-ascii?Q?PPcYKTwkvY3+rL38iCyZsOFJa7bp3PC7eguAH5IWg0+qjg9JSyuRnFPakwSm?=
 =?us-ascii?Q?2pQBFwvK+ToRKWngkNkHKy+KnvzgaDl4bVycH/HgLIeKtyL3BgPxft71cP+h?=
 =?us-ascii?Q?9LzMbwC3VbY1WTkFXAo1qm4rtZK8VqLbcg/RsDliQNr9hPAMtnNAMAXKykwn?=
 =?us-ascii?Q?71RG7vqFOotoIxrdEvKodyVYht9ctQelHJX2FB+q5UlrM3OTxjyfGZHFNBui?=
 =?us-ascii?Q?8oQpU46p5d+3iaNed3ngVLkqTMFCTfudpMAI6RRjTAgWvA599Dt/f460Qxx0?=
 =?us-ascii?Q?5qqS+rZ5g6/EXGi41PhcPvvU1Tt9Mv0qvlrCiB4i5InY8FwO6PwPK/zDFoV/?=
 =?us-ascii?Q?j8kFjr8YTt15+PhYWTnmu41kvTSZfNeTKg9c+OdizVED1LL4cGkZfqI4TFcQ?=
 =?us-ascii?Q?tBvdvUOwrwnWhHVyiXOELKGuQtgDnLTn6l/dZBE4L22duQz4OzbpAY2EW2JT?=
 =?us-ascii?Q?3a8AfuXwwWbwinkObd6McoAa79nnfBs08DfVuiIdiGyJc/KFTVUmbmBVxEYo?=
 =?us-ascii?Q?eGKsQYKl1pzzkyNeNSYxKGCsdCersji1kN5DO0R+ZnRSQHR75UkBXcuD/KN/?=
 =?us-ascii?Q?YRDvoQ=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c96431-9f39-4d6a-ec8b-08db506577bd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 08:14:53.5633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dGEUlxjZ6++lxS0keXLLKUJRWOIr0nEMcnXjbypXFEgIOy/NZlR/mwOxaPJKEQ6fhDrniYlVHkhjGR/xY9P+egRslmBkkNrxYIzUDXTu7+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB4054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_011500_361024_D5F3261B 
X-CRM114-Status: GOOD (  10.52  )
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

On Tue, May 09, 2023 at 03:20:06AM +0200, Daniel Golle wrote:
> Check for NULL pointer to avoid kernel crashing in case of missing WO
> firmware in case only a single WEDv2 device has been initialized, e.g. on
> MT7981 which can connect just one wireless frontend.
> 
> Fixes: 86ce0d09e424 ("net: ethernet: mtk_eth_soc: use WO firmware for MT7981")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Simon Horman <simon.horman@corigine.com>


