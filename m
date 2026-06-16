Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81CCCD8CA8
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2026 06:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igO4ZzTiWTfVX0v1XidgEG0TPm1OP1lWnu7q79IVhB4=; b=KNQbChuXjcxzbaO8K3w9SKXrNI
	yHxNK5F0Dnc2LNav5mebzBIzOGnYqOuZm5YN5H+1XcDT+fd/tF2S3bp9kg3m8WoqApUCta5NPDbBw
	CT9MrxT9YEF8KIbnWdMccBcufeOzbToSEvavQtSN0JJKAS8pZSQ3fWUWFKpPhYg+qmDa5cOYvppou
	wBwDujCLK6/bNLrT+hlhj4EgiN/tXBpcRJ3/dL3pLLDuwiRCWsMZ89kUSWY3htwrI5SDlFbwhmv8z
	+QB+w/GXLDmRfjXubSI9C9+IADZKkUQ78N2JP/3kJWTfCeI0nAEJGukvxbTYLpwp1OO1hvpEN4LFe
	YigcKXnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZN0a-0000000FICf-1bje;
	Tue, 16 Jun 2026 06:10:48 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZN0X-0000000FIBH-1ntS
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Jun 2026 06:10:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hb+VLOytl0FsZMpVNH1Iby2PHAD04WnaczNBssWa7dUY4f9j4MtaE/r1SK/2fTxfibVlAB6QgDznIGR5zQwi4CwRbWP24tEaiNqOmHqYpXH9za3OWFTo3MsmQ/a9mDptXA2k2YqjAbZjew3e11TDh1lk4FH0DsVjDNTLowGjMcayWSv2QlU9zXRfOzF4+h+FRAEp1A/tPi9UvZ8RKL+PRDxRU8DVN1EDa4Zo5pRmq4I5wX1a87sjgNlG/Y5oUnTc+1zS+7SylcIJED2CycZfKtENmkv3MV6MuNE1w3LdlBVmBaGMmMmb9VjDXZVNlIp7Yydn5R7Fyvqp2mVy2o23QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igO4ZzTiWTfVX0v1XidgEG0TPm1OP1lWnu7q79IVhB4=;
 b=jVMK9XbiXE2Xw73l2EhEOfPKZ7RrraMqLXCm/Zbcd9n/+GOPJe1Ae/IWvGx+DRp7+vpGPQ9NOjGRdLDfEfjJapIIpy6zNQPfKWV9ki9hJP7oDqlRQ6xcUSE3ZXKDIvhtf2ZG7OZvf4QkjGuTH4lKDhJeGnBWqMfo2B0mgiK8yb+t7mJiGxS8jeSrlAB5zI2RG66kgO2ctmu+H5kyAnW5/hyQEtCfR7QF71KObbGP1Mq7kwrwkFcLvnb20QfmPVAOuhaZ4rZV1qPfmEeFbXeoHusr99F0j5W+0k6bm2GpmRwkLncbYZ3HHI2C1a4GM29e0bXypW01JP8azoQPSUjlgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igO4ZzTiWTfVX0v1XidgEG0TPm1OP1lWnu7q79IVhB4=;
 b=2fqlFXPka5WzKP5nsjs9n+dSFKi/+mOQH7cWKNZpBMm4t6A+QPOjt10gzOVw6v2BYYGToObApNSPZbjfNrkWc8enb288zryxaYSyG2os01pA5Qykm5X/wY7QAcfnIyk7ClrIZ07+brvIy5JirIHsQclVf9xwfNrBsH1qGWbh2vFNeHHx795ei4Y5Y6u7ptUfzQ5tQzyxueP3A5p/m3AwHGQEtbvCLcQXZV6OxWLc/BqmufmGNoYw/590N16+Y9Qvq2pyfD8z0NZ3/Us6/Cy7GOd7gbbCoHsqiPri5+JscL0yJX7nPCksVoPznyu2ad9RL5PraokAAWfLQhmSD94UKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB6206.eurprd08.prod.outlook.com (2603:10a6:102:ea::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 06:10:40 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Tue, 16 Jun 2026
 06:10:40 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v3 01/13] pinctrl: airoha: an7581: fix misprint in bitfield name
Date: Tue, 16 Jun 2026 09:10:17 +0300
Message-ID: <20260616061029.2630777-2-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260616061029.2630777-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260616061029.2630777-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF000167ED.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::672) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PA4PR08MB6206:EE_
X-MS-Office365-Filtering-Correlation-Id: 72bec9b7-cc3e-4919-71f0-08decb6dfd68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|921020|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: ZBRp4Q0+uA9VVCz1BBcpxqA4vVToNE5sQgqTxF1vIymw6YEJQOne56SgLVjiCaS+flHwLeRqHPkx1JCRsjFlXDgOABTKmDSaIDk4+nnlv/FFlZR4kiS+TQqWn/2+/lMtKLaP2Q2xJYJ3UYvCLCEqrfqTTH+Wr7kzGxCWf2G4yhEuviRPuPEBXpCfMQWH5zPyzjMwDvjJYjOCdmT1KbMXOwp5ETj2vC6IlvdSGB1h+iIKQ/4cXr2lX4rDfHPJH/abX+nYm5mCJuu4KoRwftHYaKBf0TqGAIbNukOjiepCPFL5543+1Fz2ou0vKaYtp1yeNxI07os5YuNDg+AxKUqzSHp/LdshgZ3gccs3/o4LBXPqymvSGBvCIINmH3Ka7sx28UF3yIbquAqC1SjbydX2TLbpJCvILnwWrKdiv5izjLl2kdQJ33OOTUlEDZd7GuHkwIk8zsVoVfv/hSmzCw9kItsOoJKEXK1jOifIw9p9QNUSY5CWrb3xHsdSEXap5aesL1oR5V/pmEJNQPZaKcKthReQzxVwbjD4uMcH8mwaPwcKVCKMTr86U7mBOPjT6HCi8j8/nSg4jiMpleJzftUDyyVFo+6kDZVHcQPrmc3eNVj9XqSNMKqIfUW0eOO2CjjojTKaMIzJ42ZWCyQUKnwwXnn0NPlRNdFKUPpV/Dy6D0MD67XpXQ82RZNRL9gAZIFvCqh0hevy56nrzsnm0P2lyBR6qV5iI3YlK500Se/DVj/tRz3llCtGQO4u+do5VOv+qCeDrG/jHBng1ULwP/ge0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(921020)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z7T3l+6bUc54qZg7jlhM3ENdtaGdWgi8yaJK4H3ulskQHNUiLlTI326bMSpn?=
 =?us-ascii?Q?KuSZvUFvHIOLFWwy6rWyP/gxgWShzARJrXUziDBia6e9oleVrMiFoMOGg6uX?=
 =?us-ascii?Q?nTztP28MyOXsIrBfVn1vdsoF+sig4CsIWFEJ6SVrNrxlOA++/+SgPiX6ZOSt?=
 =?us-ascii?Q?iLr+Uy8DehXibg/NlbXNIG9KiaNIYhi6DpA3Ucux+puUr11LcY6SjPSihftf?=
 =?us-ascii?Q?WW7fCML6aobHR06pvQAhsq/oGRj1+twhsxfHFH0ZzEsBceqBvrcQTQbSEQe5?=
 =?us-ascii?Q?PU2huxFRPnFSTNUdZlpVjZsUrSSAvVcDFsZZKb/G9iSK2So2ia6QbolFZ1/p?=
 =?us-ascii?Q?Ww4/i1rL/G+sPmJm6Znl7aWHRYxw/SfEbdfYxjvnjR/LEP82uMDxApZ/sXvc?=
 =?us-ascii?Q?mxROBqaN75ZD0OVVP6cVKrQEoQ8sJ5qGBxMS2EIBBzA9KGhmTrrOq5Ycqk3a?=
 =?us-ascii?Q?6gWo+vcoTn4sKfwVNwUQasvnJkCQ7engAutQas2JVt8X2XNGzi+pCx52tEMg?=
 =?us-ascii?Q?IJcGc+rz80fHqJCyqiGg+igl8ENTpLORdUKnQUdjGuGJ9a7XnIn6eoiEMME+?=
 =?us-ascii?Q?r93FP5g+2zbTc0rdv8+r23VMLptU1xiQ+JNgUvLF+rGRv94fG6LYinoSNvYt?=
 =?us-ascii?Q?I7yGrNyBwmTx2ZCkBzDHjJcR7UiIRV2Vfcf/XwAr+3fImRTcVDKKWOqBJOMy?=
 =?us-ascii?Q?ti7FYboc1Qw5IlhhQZU6CSYl+3I8SQUrg01XXgVbkBGwxx7SYdRC96IAP86w?=
 =?us-ascii?Q?niUxjD0SFewpxSqGLZjhOJbaaua0T6Adqax9u+vA2hT9AWMq20nxK25cSsLh?=
 =?us-ascii?Q?Y2H22/46jyhwEqjuqz6w4oYItA1E5o5OFZ2TbjdRXuBEGaLzq03/VzuYTa8I?=
 =?us-ascii?Q?0jpoMLEIJ0GA0hAGjGE31YPaffM0FTBHPEckYrRdbl7yolzeKiIpugdDaCTD?=
 =?us-ascii?Q?ZuOPlHOgAX2XBdju7V2j59Ot1w8toZker0NYXpj4J8g20hTI1yHSnqpLhP9I?=
 =?us-ascii?Q?8ytkaAJCyXJVx4GOUL3Y+sX8yXinFmLPyQQxDs6f+EZSs94FgyIOzOQDLFku?=
 =?us-ascii?Q?ffgxfdUCGp75Cv5D7l4mX8x1aw2XzoQVN98KLnLKIGpfptfBOy6f4TR2f8cZ?=
 =?us-ascii?Q?WXcc3Hhlx5H+l2VS5506TYJksI+oPzi1Dg1UGWeidN5AhywKK1h4SvLxCNEZ?=
 =?us-ascii?Q?b5ib3G1zp4z652bUslN2vq8d0dYR+w/FIU1d6mfiu+9B5a1kS9poo2Gi7UMR?=
 =?us-ascii?Q?JaVMoeg1fdF0mO8Eqw79fqSu0ZZ6MMnVjUKKmwtjkfzrS5CyvJQ9MUimTaBY?=
 =?us-ascii?Q?XHTDCYRgFwIzhOQ59EnNQmaCScya6BMPZbvZvwvH0LzK0rxWfzA4Nr7t8ztY?=
 =?us-ascii?Q?exTG74/dwScnZ/5xu7eyqwCfu6KqnNabXPXmeLIuOq5ssJytdogUdbl2enhZ?=
 =?us-ascii?Q?qJ7Qim7b1ofV1QWLA0p142cHJx3+PMWNmgGvpMjh8oWwfzdDpLBKRy8UVXVb?=
 =?us-ascii?Q?DLZI5K65MCOnCnfvdaVchAXljWr2nxm/PWxV7z0PH69PYGDFS2oHnNeFMApf?=
 =?us-ascii?Q?5xF3B0YfPl+iM5343GyEL0vrEeXrNRy4xdLYW28Vbcuu4lt6LvhGnDDlUBUd?=
 =?us-ascii?Q?6JhcEh1MTWyTZPbk9DwKK+8OwHOwzifF8DsdjS875avpEnHJQx/OqKLVF6NZ?=
 =?us-ascii?Q?jpHO3OAazeSNA/YjhNe/h2lqXuCoTtzPox/if75VGG+cZmNPjD8YBAovWBAP?=
 =?us-ascii?Q?iJp8VWyMRrbas0G8YeWN6P2aBCqUESQ=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 72bec9b7-cc3e-4919-71f0-08decb6dfd68
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 06:10:40.0892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IEuq4T47n0Y8Cn/n26+tcYcPNmOc1F+pIX8Z8iqFaHu4S5YBhmNcVZ6vAraUgGvYIJY47whLnlNaczsMEQeNeBkx1iyATlh2MUIbKVzJMFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6206
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_231045_465040_17CB30BF 
X-CRM114-Status: GOOD (  10.43  )
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

Fix misprint in bitfield name of GPIO_2ND_I2C_MODE register

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 04b4424c688b..63c82268aa82 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -49,7 +49,7 @@
 
 /* MUX */
 #define REG_GPIO_2ND_I2C_MODE			0x0214
-#define GPIO_MDC_IO_MASTER_MODE_MODE		BIT(14)
+#define GPIO_MDC_IO_MASTER_MODE_MASK		BIT(14)
 #define GPIO_I2C_MASTER_MODE_MODE		BIT(13)
 #define GPIO_I2S_MODE_MASK			BIT(12)
 #define GPIO_I2C_SLAVE_MODE_MODE		BIT(11)
@@ -1026,8 +1026,8 @@ static const struct airoha_pinctrl_func_group mdio_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_2ND_I2C_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE
+			GPIO_MDC_IO_MASTER_MODE_MASK,
+			GPIO_MDC_IO_MASTER_MODE_MASK
 		},
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
@@ -1051,8 +1051,8 @@ static const struct airoha_pinctrl_func_group an7583_mdio_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_SPI_CS1_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE
+			GPIO_MDC_IO_MASTER_MODE_MASK,
+			GPIO_MDC_IO_MASTER_MODE_MASK
 		},
 		.regmap_size = 2,
 	},
-- 
2.53.0


