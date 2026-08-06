Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F893C5AC7A
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2026 22:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPu8nG2S+0l1LQFPC5oQh7DjRyx2N3Ll+tWsylc8nWk=; b=z25o3j5Sn0EYVsjac/haTBtr/T
	E+aRX28hcWCkrGNw1Z2K1eXQH9DGLckNPcTuL6CaHmAr/OJG9785aOkluaLchKdxe9FiksDFnV0Ku
	n2MPmYdOwFsfAF2VcFFyja8v1OdlKI6hDTgC9q8B3qeT/v8LsOKT9y4+9gQX8xBFArxcYMRTcILJs
	JnBPdzRvcAD/CcKGEgtF5IfsPNbSEEb0jqukAPI4Ny5QCRlg+d42O1nMIH82rb0RZnXU18Q/YYiEd
	IBuqSX2023NXsnCH/Zxx1ZyDExfq8oJQvJ4vkSLy4xmgwZakM4xls34aD6/gpynzPE7B+CkNf1won
	uMfeBJQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws6FL-00000006mGF-2OkW;
	Thu, 06 Aug 2026 22:07:27 +0000
Received: from mail-westeuropeazon11023113.outbound.protection.outlook.com ([52.101.72.113] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws6FI-00000006luJ-1mCQ
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Aug 2026 22:07:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B0T3hYtyZ18wf4YZja8DoOwmvmPgWDKS/tKR0V0gUYc3ouaf2F/hQmklmrk9LILwThrcg0k6lOgdlbnKZ7ffFqb2GNvr3r9KSm5sPq3WS9ZpCFRmzUebx7cf8Wnqf/7Z2EU/hk4oi2mSS9uR5d6koBlJlPFC7e8bOCF+W6hiITgsaPSxyU3Gea0OO8vZ44G4Acb9ODgoUc99XFeX5FvwWWx/hVD0F/WefUlYTHadFf1eSrvcVrS/cHfoaMuVH9WA6mK3ai3h0KdBnMDqXUMFzOS+7A0drzqoxvKX3D67oSHP36xlSF4iPPtF9ikhS2S5bvb7yuAF6lHQ+2Q6hWZs+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPu8nG2S+0l1LQFPC5oQh7DjRyx2N3Ll+tWsylc8nWk=;
 b=zEJyobq+AfzcKClkDBDV6bvORJFez4hxteQeYoTAzg4KTWHxwPT7Iqb3u+zbFtM3j3I6Yubt44paGjsEScV81qvlSDYHTHYT3aZnfbrRU2Ah1668jAs5SeSGS698SeH1u1J9MSJLJHsRzyRDO9gR9WAE2tXC9Y9n4SgelsJIHKemRDJ2ThfSgv+ncalHVi8Wwiz7gQQ7cTS4+u7iDuc3UR7pu8tgkkrK+q4xErR3UjSf2vCzhDp/dgKhwfVM4TS6lmthWR2gTfz4pHBEkR1iKtgh0um2sIEugR0BHtW7Fk59z/A/lJhgmPThWj25gDe51ndHp3w9jdeBCTg+mY+FeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPu8nG2S+0l1LQFPC5oQh7DjRyx2N3Ll+tWsylc8nWk=;
 b=LqOUXEkEboT+xCS0yq32hhEKV5/spSF0thptB8MCfUMajlSM5cO9RUxjik/G0sUhzZKJ79HYwp8zOs2KpbNxJMGpHzg8x5Jzoz0SvPpb8m1Dw+FLFyftiFgslK2kspAfw7P5D75ad6DxdWdQP2CfFIRN8gb4qekWqnPreDRZvcjyVQaJo2jFsCMWMtNrvw7QQlsTEKSvHZBS4zPY0r14L9c5i1g0haWITyFoS920EpaptWnUdT7ZMD3OpZcklyGu9ep43q/nEmIzvem8kargzhtdHq6gEJQCahJSFkbvJkh0vvy5OsnKSM1SJOXx5aI2mtCEvaaxvKBK+T2XwcESFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by VE1PR08MB5823.eurprd08.prod.outlook.com (2603:10a6:800:1a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Thu, 6 Aug
 2026 22:07:17 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:07:17 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>,
	Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v11 28/37] pinctrl: airoha: an7583: rename registers to match its an7583 names
Date: Fri,  7 Aug 2026 01:06:06 +0300
Message-ID: <20260806220615.4078303-29-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::17) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|VE1PR08MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a57121d-d5cf-4c45-a0e3-08def40713a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|23010399003|366016|1800799024|921020|38350700014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: EGBiyzqQHT9Fy+rKZ4OJGZD5CNDiRnBeDUYCoa6RlFmBXQhI9iJOd7schVoyEVMVp5LNnWJzjO/phUK4Ebq8+ALlmU7teIF+aYW8mcRIeSveBzjNFr6JCFn4z7zytnh/X5Q77gNZeVIMKnl3mp6DOVACEdYS+IubDwIU7FTMb8sc8F5uHFE9looDRi3tvZTFDTOh77Ii4n/bH2hW8e+HcDi7O3iNT53Ex4NTJwVNguIpdvd8K5gWUwno2e1e/SNuK1OkVWwxJffcbkfLQzZMoBeeI+4/U0QiarE8ifH4zPkkWJu+0Yo69VVxCp/p3wTxhA6H0casofi9awTLDKGnjDmC9vmHrWcskhmDJOFcBKK6azI1mHg6N4CfTZ8NhHUAwSjos93zzvud0eU8kMby9jiSWSobzQvBgb0ZAiPK6vJsAR5HkSpEbIK59rVkOn+rPmjR1zP1J08u2wXfHLPavPneLr/S1QRFiPXPhaGcV9mNBuMHKOQNK4RFEcDicDUZPVF0MkUpwd6Ix4kk4TH1P3YQK81Zy1sCUFUWXWPt+n7kw65Sy2e6Q6uKWse/01XvFxybJwDaVbHbwC+d6K/RVie8jJBX4Ey29CV8yHQbe9HdV0i7gCC42c8ZkHH1FQ7rkY6CPYqnRNrRe5APqH0jm861ORGNx50aSwDoT4OIxi099BxhqW1eCDAqbqENhymDyhD41sx0mrXucmdKoNF8CTeH12gjy8SEK2VJdSbM5zM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(23010399003)(366016)(1800799024)(921020)(38350700014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g21uMJPBIG/RX0HQxbVG4MmA7GgzCMhlTmfnNNY90zJMrQqb/AuERMADHtys?=
 =?us-ascii?Q?qUjG6ON2GxHJW+GovvXrmtTcx7Vop7WuKguLhl7JlB/n/RuyZO31viPoJdl/?=
 =?us-ascii?Q?ZHYBV5qOlooR7n1dvg3gk+U8okSMx+H4KnO34hq8dA3U+rfENnuEQdhRSFKV?=
 =?us-ascii?Q?NBQm6fcsT5kZIVDi/4MZR6X5WlsKjrfAHc/Yq6LkcIxHCPXnlOKwWK7Ydgpf?=
 =?us-ascii?Q?5cqNpbAyBx1hrl55vR8N1MnaPhgavbgXhGfKOqL8nx65r0NxVjaRgMIhAM1G?=
 =?us-ascii?Q?Tt8X3AZHgyUdJly6jU5FYdzOsFno/UKvuoFABmsmvH2q6zN/XdkTnMQiSW+2?=
 =?us-ascii?Q?tMtudAkY6GR3g6D/g3nDqDW+PySQ48cuu3FI1RIhoq+HzyGKhYIRFFivtnoJ?=
 =?us-ascii?Q?YcIDhFEmvbzgN0a+Wws4uMjIVhShKPjIrs2M9Gh3RCOBq8LLZs/rXQJ2Qaph?=
 =?us-ascii?Q?oIwvDIHX+sJaulCmKSeUg/AwQYj9QJFjvnbhcL4vSK55k8sYswHMY+oZGXlE?=
 =?us-ascii?Q?BSLr9X4SUn6/VJLNXd/lrqNhBBvohkMuU/9kYOE0+M3954oOE25tddy2fq4j?=
 =?us-ascii?Q?HqSU1hZITID9HfbXbAwPoU1MijjlXYXLAyVWQMkKHD5m7TmenoQE/ecH4CpY?=
 =?us-ascii?Q?c8ps5N9TqYUR+BkbF5mYYTCDNAVVlNPvlKPp9VmjxBx8dZLon9td/zHdIhKs?=
 =?us-ascii?Q?MtE/f5RQBuuGwAEq+oKAKW3jtD+JF9wanRiAF9GSJfMEjhf2Xo+ncEuyo76+?=
 =?us-ascii?Q?YIvupghc3PU20ZzkkpUHs8n/jnNSV54P0gYLgiVlfXYjnoaDsh8cP6fVV5ix?=
 =?us-ascii?Q?a+vKsTlI91wY3gzjxxZwtiW6JqVUPL0gkeu94t7OXhd9S0B0zJ7qlqaeqi7W?=
 =?us-ascii?Q?mwxl+/sFVaO9DlWEpxQ1zLzWuivXT1NpJMHoDYMRbDnokP3V3oMpTX9Z5Su3?=
 =?us-ascii?Q?cV+CDnzq86QU9sP1xqFvV/tdagKsyqiK2bUwCN6QfX/9jzTo/bXlfv2zS4r1?=
 =?us-ascii?Q?UJPiKJY3SEMEffkVd1XNW/kprwVx46a9ZXHgHNeve7bN9JpvurSLWOv7ufdI?=
 =?us-ascii?Q?NiY8K8OB/mTe52GkCwtMdZLoB+TXOmynNjWiAxWLzB4XDcFXOcNGdS1EUe4A?=
 =?us-ascii?Q?hUjkjvtSR4BTOQ1tHD37Cnd2lRxWDhFzvO2bm16n+nvvSl+C33XGcVxKgr0/?=
 =?us-ascii?Q?8jNUAd3iYFNQspm1Qu98Dnsyad0LONn5+2gDH/yK2x36XAY2096tvazJN9/j?=
 =?us-ascii?Q?YUiDT9oCwlY16zlsz5JXVZyNGBNMmoHhyER/Pa/KmcZ1I9Fhqqd3ubZxH1Mg?=
 =?us-ascii?Q?cZRHZt4uwOtf/fRHGNd5+YTD8U4xKwmlSOtRoKFrsgQWgySESq2OuC1APMHx?=
 =?us-ascii?Q?sizP4kWbHtMdShQPJmNim0xRI8iCLYebAebc/bkU2CJ2nOUmvPPnF/Ps5LHK?=
 =?us-ascii?Q?hNaCuEiOCuPTLg3d1IA1Udq4lKi6JfsOiGfjvqjblVTeGOCC4gXSWoCP8N7f?=
 =?us-ascii?Q?jdMn22tXFFbrQNz041bZyAUpaaqo9DlrxCo0qhnDGMSjLXdH5/ovyul9u3HU?=
 =?us-ascii?Q?U9mipBzNm1E0ypIWrFPRCJvCK5wf+dsDap8QjJeuoV03Gid2NMmRJ8bOw+dJ?=
 =?us-ascii?Q?0rkTUaW3TAUCVucbegDmYwDZ5I8U/Xw9w/TGwly39WkNXR26yURGb7OpLICK?=
 =?us-ascii?Q?/u7TMyk28VyZLFDrgvdIhrTO5oIr9gBMA1UC7hTcB8mwFe0eJtSJZpiROXmd?=
 =?us-ascii?Q?Eznzee2rAL8IL2s6l61IoWeGkPhIco8=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a57121d-d5cf-4c45-a0e3-08def40713a1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:07:16.5681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8gOrCF1+etmNrig3bkAdaAwb/SbwhLfaZvBtWJ9vr+ZaSFZ/9sC1SttMciUClurG6QeV6rbBAjETKOErLv+vHpMqf7mJ38hWCo6b3NTvef8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5823
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_150724_524128_4539E941 
X-CRM114-Status: GOOD (  12.04  )
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

In the an7581 case the register at 0x1FA20214 is called
RG_GPIO_2ND_I2C_MODE. The same register in the an7583 case is called
RG_SW_TOD_1PPS_MODE.

Let's rename this register to avoid potential confuse.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 6d195096495fe..44efccce78c55 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -8,7 +8,7 @@
 #include "airoha-common.h"
 
 /* MUX */
-#define REG_GPIO_2ND_I2C_MODE			0x0214
+#define REG_SW_TOD_1PPS_MODE			0x0214
 #define GPIO_LAN3_LED1_MODE_MASK		BIT(10)
 #define GPIO_LAN3_LED0_MODE_MASK		BIT(9)
 #define GPIO_LAN2_LED1_MODE_MASK		BIT(8)
@@ -302,7 +302,7 @@
 		.name = (gpio),						\
 		.regmap[0] = {						\
 			AIROHA_FUNC_MUX,				\
-			REG_GPIO_2ND_I2C_MODE,				\
+			REG_SW_TOD_1PPS_MODE,				\
 			(mux_val),					\
 			(mux_val),					\
 		},							\
@@ -320,7 +320,7 @@
 		.name = (gpio),						\
 		.regmap[0] = {						\
 			AIROHA_FUNC_MUX,				\
-			REG_GPIO_2ND_I2C_MODE,				\
+			REG_SW_TOD_1PPS_MODE,				\
 			(mux_val),					\
 			(mux_val),					\
 		},							\
@@ -643,7 +643,7 @@ static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
 		.name = "pon_tod_1pps",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
+			REG_SW_TOD_1PPS_MODE,
 			PON_TOD_1PPS_MODE_MASK,
 			PON_TOD_1PPS_MODE_MASK
 		},
@@ -652,7 +652,7 @@ static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
 		.name = "gsw_tod_1pps",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
+			REG_SW_TOD_1PPS_MODE,
 			GSW_TOD_1PPS_MODE_MASK,
 			GSW_TOD_1PPS_MODE_MASK
 		},
-- 
2.53.0


