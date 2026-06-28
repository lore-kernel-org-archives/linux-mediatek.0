Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A1DC43327
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Jun 2026 14:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igO4ZzTiWTfVX0v1XidgEG0TPm1OP1lWnu7q79IVhB4=; b=zfp0zIsFzXr6bkV5OA6Xg/Nrpm
	A75X8zvDIRM0vAaLg17iIT70rITHnzInjMi4a34GtPt+JDN9GPF8ar7xbzkaXcdH4Rk7DV7Iqf01P
	ASElMnKbLAMa+8/ucmQT5UMhiEw7bIwi6fZLXrrSf/ofay74AEaAQP5xxeTAfoUYTDw84jDYAyBiR
	+EaktpS/10aZgzDijcY7M8o8JIKivhWgeqY5v+h2uUdyWSnzyTih0SRncWZB6b+lERNswPHPZaBbQ
	KlKmvycXUN39fNKfndzL0snuFlrh+2UDiNwbLlXutX/isB3S194v4XLLPIdeMsyGMTcyUxBySEFn8
	qzPFHCjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdqdy-0000000D96T-3ksu;
	Sun, 28 Jun 2026 14:37:58 +0000
Received: from mail-francecentralazon11023078.outbound.protection.outlook.com ([40.107.162.78] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdqdw-0000000D957-3Lgc
	for linux-mediatek@lists.infradead.org;
	Sun, 28 Jun 2026 14:37:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iw5Eou8Hv+3D/mTgBPw3D/bnOQJ50qnlE4+3RI4s60dpqPFrf0+6aBg8cL/mFg1KZ0zUcL+C3oPvQV0XrKooWC+GXHoWLIDFHkhBIZ932bgMUGZk96PwLZzWW9LgoCBJFZWAuvspO8qcdqdvluadqAFebK/J2uFJDrfclkRMWX3pc/pZOpXqn3BP9gFk229XnTwtAQqIeQ1CT0Ys1aNAKQsC6FNsrGBhXeBlXH++FIKYIb30OhF4iDfI1XfRX0wm5nQPLVbRv2x4xp3B9mTP6l1UisUIOiOeUy0fUvvpY6DrswC8iblm+7mzl92DuiRKG5KqNY13x4+iQnp63hyk9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igO4ZzTiWTfVX0v1XidgEG0TPm1OP1lWnu7q79IVhB4=;
 b=S7TWK1h2gV3X8ghgeuyYbnDYJ+mqIEnFCHTsvlHWTK8LnmujsMX0X0UEkfvOJdGrSXdFITalQL9sUOa4YEkz8Vtni2HbBoDlEb9+GqjuR37mNwi5+ljMTBMEKLUWSqmbMntyxtiWVMfa4C5anVsUAX8UKlo3mPbAWX9qcgFJHw1KiUhahXH5Q/HbSKdlezQIxxFpDoBZaxIWptrsltqboea9IBl+Bm/FgY/rVti18trRJBo0PJ1nhfG/EmpkUpgaiPivBIEx03RHaX1fXQ8u3bqUR4Cgch8WV9ge6/yC9xfhQIKWc0m/UrMevsRc8Kkhx5tsUtsvavRCDA5jbTrReg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igO4ZzTiWTfVX0v1XidgEG0TPm1OP1lWnu7q79IVhB4=;
 b=apogI8Iwo2c5LFle1b5E4s2xmiub25/USWQ5Mc3h2uF/QrD7DH44M6gDUan5qH2Kt5NSW6GXKO8bnT0VcMIN9C6xx24NtnJVKkBtwYRpa/gPJwQ3Z7cH4lEGFFh0KNmxJ9kD6l6r/frmMDJyHMmNg0jGWzeFgZ1CFboTFh1WMHHrMLU2ioyA7G1XmSnmTcl3Em3FV3lKxPO6dQ3agZZrBnikZvbEd7ANTbyF2ttq9liUT+ZLVkj53yTGJRMnEew2vR8SilcRPmIZll+jch05fjj3YEMXRf475kBFCfRojcgttP7rkenFsFmgJsauaxS8Ka/gq7YV+9xEIhcidsSn/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB10009.eurprd08.prod.outlook.com (2603:10a6:20b:64b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Sun, 28 Jun
 2026 14:37:49 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0159.007; Sun, 28 Jun 2026
 14:37:49 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v6 02/17] pinctrl: airoha: an7581: fix misprint in bitfield name
Date: Sun, 28 Jun 2026 17:37:18 +0300
Message-ID: <20260628143733.273651-3-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0006.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::12) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS2PR08MB10009:EE_
X-MS-Office365-Filtering-Correlation-Id: a6c05b83-b3d9-49a7-d097-08ded522d3b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|11063799006|56012099006|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: xGGjsjEMHnwwNXZIjjLYXWDCuJ/uYcG16GXK2qNf0sWBKTqEAMKBVcPUxd82Tk6KU6KN0W1T0DGFhtnUvthITO2KypYheT4qrQiCegQW1a3IEJsjGmEDawSoQNBqH+Lv9ULZaTfFHKy+a3Zbx/r8OCghARfqbt5FcqtYfXSvlmlHfAiH/hdnehreNI+q/4Vo+x/7MC0QXdXhtt0EczVl7IxVpjb6HlRRRvT7Dn8HymAY0JS9X36zs23qYWsQ88GcYpYFQKJniw9IcnhYmqtz1GoL4a69KGAjmmV70/IWeE58z5GjZuRbDAjEgBp1EMEanVhnID1nXgLE+KxKRtHJpnKTB0YwCwK/f8/Bls65EQ3IocUFRSR5q9XwwdTWSOYaiPCwF8lcgI4FkaHHdmbuEKt+HzFg+P1DQWbX5F28Xz80Es3botK8UMYXVpuTBmKkvem4lGJzEXcgFnEvTz+k4+9RNRKZSF5irJsdMpGD2rvA1pxKCB5ZwBWOGS8OnyxUYyUf8EXHk4VL7NHeqAE6hfISD+W8EBeDdAq8DCqECSGf8lpm7E29cniCSljDnoO13/u2Iq/kFXgsK4iaovwg6U6a28gGIglqfSAgYoYj0IdZWLPVPI4SYln84xDOajyRWUbn9W1Gbgxb82BY087VLch09l242dXDoxFyH1ZloBRewUDGPZzrDKJIys/VFCbYcZarjqnsn3tTysAdmJZdHtWaWGDB+qyvhLVhn9EexwQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(11063799006)(56012099006)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M4hlISslL8+Ctr+yB0Jc+VI/+owyeIQ9lMugtm/Q4kVNHtB1ZNAUqZJdIdH0?=
 =?us-ascii?Q?+EcgQ2smn+8IHRuPpqMo6usZMgXwHPBZQmILdkaEIrg6s2lfHxyUsrpAU1zj?=
 =?us-ascii?Q?xjcyGE1uBr/5mnfN4kW4DX6aUK3vjYVjuWD75Cj6PdRDbQw7hH99bJcuzYRB?=
 =?us-ascii?Q?QLMgoH4gRLeOhWhDWyF6D+JR+85kPjHQtSNmCW/tDkCYJU7D3FrNfBjp4N0f?=
 =?us-ascii?Q?Tq9mTXCKoTKPbCbqZzr/uWhJUrkSzwEU4XlkrbTWoJpKfS8e1dHxTbytJK4d?=
 =?us-ascii?Q?WZqgrFQirSmVrueHPH0MGGM3UuTxpXq36HO7yQdKJHhriVaIWE7CgHMDEHem?=
 =?us-ascii?Q?icmVb5Dd5oSJu4kUigk1Mkex81yJT+UGYYLW3aisHMTsoz+5omUH1d+kLG0U?=
 =?us-ascii?Q?j0nJsyW/Ars3qrEAkj+/uN2ouXyfti4Bjs3qcqAbeNZ7StONpCMaXgaV30vH?=
 =?us-ascii?Q?11n+jcGCEv6IxqRi7ys6rjovOw7EHTMZ/Inh6n/mJtzYbHQ9qL3ATtEVpGuu?=
 =?us-ascii?Q?wbjhbW7oTs1YYO67RKbGk5LClTaMOV0G69uNoLAfSbfMeY2l3gCYZ2bBtE2z?=
 =?us-ascii?Q?4TgytmzXH6IHKge2jc2IfpMIitsFVwpSgBg2wIOtxk2Rya1GhV1bF50EEAQV?=
 =?us-ascii?Q?56eYLb6ATD2wM2lUCD+q5ktLW7p6z7U2GqzbhEnFVMp215j17n3de+jaSlbj?=
 =?us-ascii?Q?9+xYBPLFDYaw62RcJyIbH5uwKa6EElqVoFv+4evZWUR1gdAXypeVAxk4/eee?=
 =?us-ascii?Q?nirkipNUusRxpzxwiYZJbZs37fWtDDbGZA2SENjUFPCn4/BFsY2Va8QxRoe5?=
 =?us-ascii?Q?Re2ucLO4zF1CJCRPh2z+q3dhj7rhA2Z3gA7ut1yZJoCmNVW3xe3GrM3bHjr9?=
 =?us-ascii?Q?tLPkE5algloNLrr9PmwUusumzM7XoJ6v3MtRXQEYSu2aFc3yTAYt+W0ZyG2p?=
 =?us-ascii?Q?AgJDnrqt5+16Bw/SNxlknkzYF1YCMKdMjEf1bKasEzyZjXruh1YF53cqBJvH?=
 =?us-ascii?Q?1oK7gz1HidJ6EFvF2HfiFy1K6wgqTdEIFc0FfNx0S+jroatNAVxbd9wx4+U0?=
 =?us-ascii?Q?gMjtAm+uovSIElaKPPPKS2IVZDP4clJJzj8wq08PXGQpwZamwD5UB3X477V/?=
 =?us-ascii?Q?ezCDomjganxkELHfYBkTzZ5Zj8bmPM7b+xa5BWz2uyuc7IWWXi9Xr/qbQn8q?=
 =?us-ascii?Q?N7m3R9emP3J/bJ+INN7AMEIoJk1kiT7QqU/+41A+i+VRtBsDRP1hfWYkqe30?=
 =?us-ascii?Q?fIcsq04xQI/YH1EvoNZm0GtoZOgU2yZUOg/UCIJQPdL8Y9eqgIwb/X3lHWVk?=
 =?us-ascii?Q?L+y9Imn1bnQKi0y9wHTTgs4yzsR5Nx22hupr3NPK6AN64erTSLSpF9UvuKCp?=
 =?us-ascii?Q?Eu6DzjMfBf+pQwOuQfMi/7otJ9/oCeFEw9Nzr2sOwy9h8kkppRB+lbtmSQYO?=
 =?us-ascii?Q?17+bKH03aBD7R4BWx6uh1NwB9bjLZfx7A5pk3cWcS0gfbR6MDx0wl20h40TH?=
 =?us-ascii?Q?nEguDsOHOOYK3lzyjIm+90mpCCCfLlrVvoL2uF6ICMNhJGXdp/H/GyfJEcUb?=
 =?us-ascii?Q?b+yC816D1Uy3k87Pv/KUdFSM/1hTplyEh0xumFPzND9daThdSabls+GQur9u?=
 =?us-ascii?Q?ldQhhCRTg5q4npy9+16UDcCxL8Hj6DmF+0dw6nZVBPq9azIIelN/OqeI1s0c?=
 =?us-ascii?Q?ksSCbnjaOB7y/iOYf8jwWSwS9YfxnlrKn3vBLlWbH5KQkNaj5fJe32lZMd7H?=
 =?us-ascii?Q?HkpJQmDFFE0oPkKYXexk5Pp4enmREL4=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c05b83-b3d9-49a7-d097-08ded522d3b4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2026 14:37:49.2118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hnmEuh9oD3dPuRmH4G5PFRwJKEyYT561ONAe9nSufnsjw6Vl+pXrj3uvIL9E6Njv3clUYO+Y43Tf8FQv5u2tKJg3P0m7hGoDLzABoLABsig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_073756_843657_F3B8AB1D 
X-CRM114-Status: GOOD (  10.54  )
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


