Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A9FCD98E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2026 04:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WEZqaIeaMkDZTa3VVdkBUl+UfVD+FZ4iH6LW1+maZQ8=; b=ZWJ3JWHvVZvbrjTkv7ERfXbs3d
	S1coc8AWpJW8fva50kwip3OiNi/oitt5Lnd3WSCOTTOYslvfip3Bg9XBg4FGbqaSsM08nJq17+ipz
	ABPOIwF28xQpJLZ0IA4WLALx1bXsUmoUs+r/J4sOIcef2E59ECTJi6YQY7rQmAKFLDwTd2PBC+baC
	ZnFy0oP5DWnFnxki+ds1j8vQHmOJktCt/3MKEQSw8or8LbXyvzaM14/BXk0sXNR0gYVxyuG5DYtoC
	93cCT4Ud0IcscrV0a2WPRRlMMxnJLvfMYvRlk9XTFsnyq/6uSDIeXgSx7+wLAPS9tnTDGEjTjMEex
	EF+j0Aug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZLHf-0000000FC2L-1ekO;
	Tue, 16 Jun 2026 04:20:19 +0000
Received: from mail-northeuropeazon11022137.outbound.protection.outlook.com ([52.101.66.137] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZLHZ-0000000FBuU-38DV
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Jun 2026 04:20:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x3IbH6WmIo5YW4V4JMrrt0b64tcXTNwv+DRPo3IfQYv06sh95KPlWE01qB0NC4mb7Mkdd52Ur6Pp7FGSINcXkeJFHGX0qqxSy7ejQvKGcwskj8mcpuBOFPHoGDO1sPP57yAHMeHJMOs+rJBtgitIQeQnGQJ2yixrgEgY+ydJ1ua3DFr7vBHkjv8JvjIWoNpneu4LdhYsCXrKABgVTI+Y3Ko/R9xNMe35gCMKYjzbQoxCILoGSEJn+m71GmQeVLZVHYaGdeiNPTsnj/6h3VC7Ionf+a9uzm41JqNS+oF3uCbRq8AhswQ0y0v8PrtZaenXsQJ7cX49vLJMXxMlYYmEsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEZqaIeaMkDZTa3VVdkBUl+UfVD+FZ4iH6LW1+maZQ8=;
 b=VYPOaIOK4xEJPPyI2FCRUYFTna9P0pdLhT3fkDAe0IVEbpQMPe48PhYWfSGSCvosm1sm6V4sphgH3Zf1F4KpcV2a2AaFGil64aglozwyX0MJqMREks0VfYAFVL5Hbx0jwSkqJGbsEqDu1H/vC39kquOosSJHqgfqmzrNVKN//MLs9CTgOnnMSd7624/UAv0rzfqhYelLD9T5wwgaLs5YtCqp727Mzn0EjhykJWcLOPiYbwNMA7OmUqjHL9gqojbFRHkMXBoFruZpL7nWQ/t6A3q770gTJy8NNzswztkltvmvsdipGyjLnFofSUW1X4yjL2+9sa/Djltn/cR12eO4+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEZqaIeaMkDZTa3VVdkBUl+UfVD+FZ4iH6LW1+maZQ8=;
 b=cc9eNqTclZaaJOaXpdtabjYHDlbz9PNZFd7sDHB5KE6aLadI+T7yHN4P72D5Uga/vKlyJRHFfNoKYAH8rA7rm5kp3qBhpbqjcLNrU7JQGhcVHjxjEfw5FNJTdu9ZuXh4ajdG86BnZg4R0k9MTznGfhvm4tP5h+gzs1K8KpBcVgsm+PBBtjbyRUZJbtMVVLB0IjNdWu/WSVQPD5xyfxEyUAEHXMEzC780/XkD5XZWuyoyBkxhlLB1WmAD93z2Bk7Q6S3n6BqGqZjy2/GKUkBv9bdYFQ4saHxx6K6E4OnC4LYGW0kg1c1raCBKnvzXNRJnNCFBi7GhYdnIt/ChvmFczw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB10055.eurprd08.prod.outlook.com (2603:10a6:20b:645::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 04:20:05 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Tue, 16 Jun 2026
 04:20:05 +0000
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
Subject: [PATCH v2 10/12] pinctrl: airoha: an7583: add support for npu_uart pinmux
Date: Tue, 16 Jun 2026 07:19:37 +0300
Message-ID: <20260616041939.2587012-11-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260616041939.2587012-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260616041939.2587012-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0231.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::11) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS2PR08MB10055:EE_
X-MS-Office365-Filtering-Correlation-Id: 64a1ce45-cb95-4d8c-a060-08decb5e8ac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|18002099003|22082099003|38350700014|921020|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: c1ROzFVYDjqBezqJR2ffS3OSOEXD0rbSWwG5SV5iZ+/5ctwdc0ko/y54LxKFza5YjCpMaOpm3Tqer6cdc4L0wS2rkx+8KDu8y9bpqInVqnEqC9MrowS7E+bn7f+l8n4gqElJf8gytUbDTzW022yLZU0zQtFsyeYKabB4ERj0epjglv+ZDRp9VewacbRtmKjW+J6+SK1oxHuR8tmH8pCklIszhSQqoy6Vu/HMza7aJUWsnM1YRj/Wg++1VET3zzJiMwUOEKAHaQM5KjOaPTCna1cNM8w40znG9RDopxDqb6MLz4C29ZzCStg2CM4Bq/Oj8LblQJtfiln0W+sT5mDvA0F+EqT8btmVj8E6O8Lca/3CFwkzGzw0EiLxlxSdgSgc2QjOT8XcZm9uVUNYRT6EGVD+W/DW8f5BIfJHfXddyby2kC6AZfEC2n44j3dx5xhUbzDxOOo8x7sIS1zZbJ5sYlpvGph692y28QYiqKByptjmrqHrcxZiwQ5DpaGOsZVwxUyh7w45eDkZKKwZRu4v/NdbuAXB/3+E+eRm4HbX+1xJYLEglA0nXmAxiYZaJGrOV/pSDmC4zUlqxsZY5j0dXDyVhxks2Lq29Qpq27yxYvum2/oKN+x6Tu+BlPgd8kb6z/Xjs3NhiEfNKfWxUn1QG4pvOswJ6PdiApGl+DhfRMnQSNY0IBZxTm6/Fm87I2AC5DdcwNUD+reH+YKus1Uwp9m07q1OhWCTfCHCN/J0AkGa8hb9PBk2K0KmIrCPTqAxwE4kH5ILczJz0hpxSOfGbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(18002099003)(22082099003)(38350700014)(921020)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U2bO1ncCTbDG6Bmqgvw6OAwTgxdjFz/P9B7MEBqvx2PlBuIP6heEGY82TLZ2?=
 =?us-ascii?Q?eRD5o73kj05UKlnrHJI2U1CrOLIUdWHcFh/4H2oZ+4CQ9gHmD9cJnU8ygcRl?=
 =?us-ascii?Q?mMzNaPu+azXA5n+WXkUN/9eoRS0mi4jAcCcOk2spkD+LrQe4NmC4v6vdPPDF?=
 =?us-ascii?Q?00whVhXpSrSaMTT5Wo9nL8CtSRns/n2oO19+zNmU35cBc6Q+S4jbgPtmuoLk?=
 =?us-ascii?Q?4ntAM3Hbw7I2Al0xEuhcBGq+hjswRSGHuJ0YUo9RqQDCGMkMbowSjB2bkFYy?=
 =?us-ascii?Q?vZvaVWL20dm7Wak+VwHN9sz+X8xMUy4fED9e7jeEGucmJWN9amV+zjJX7O4D?=
 =?us-ascii?Q?HqLGmyeJrHBWlro7Jgm/aI3xeSqGy0tD3up9xG6LyTI6lWKq76+b0IFkZPeE?=
 =?us-ascii?Q?RaiLuLHawGxDaqh3SokRIH3/sXd3QGKGrQUkgl4V17DxDoFLpRPL/ySLxi+w?=
 =?us-ascii?Q?FkMRG6o55GsFfCBrxNkremDj5TukAH4hhozurWe9+OCz9qa7L/Og4GQuEuMo?=
 =?us-ascii?Q?/sp2gkB67bC5AjPBPHrZQRFG+82L+VeZuaRWVkk4ERheAcAZnAhZtRIGxWQO?=
 =?us-ascii?Q?pGtFh3Ruuf2oiuuNe5M+PMK412CP+wb2rl1NbT0ve049cUXEgvyn28jKKeSf?=
 =?us-ascii?Q?vCBBz3xssWRHazi4ljxSCjydnLEf4bF0YIZfGnH0kyYvqkIsmDEQkfSl3Vo0?=
 =?us-ascii?Q?qY4+mcJgrm2sBGNLxx3yMloh/0syGKtuXIxPHbb1Uo7S5/1qXmbr2GR5Gjza?=
 =?us-ascii?Q?aD0NOyJlBSEZhcBCNtl/hfCxx06C4Et1yH4M1LTlKpCotRxhAm+k0OV8wGsF?=
 =?us-ascii?Q?hdjrgZproggUfsOgIxdLiMnHwbFUmIdqOXT+nEW2j2cTQXODzTjIC8r06pwd?=
 =?us-ascii?Q?M2MuOMRpfz2b5dVfz4NYUw6fD2B9yeRLmmdENCokiPXK0hPed1dkRoslHHCm?=
 =?us-ascii?Q?kMVl79kcUYZI1NH1AJ9yEsJZeJDq/usjP0CTMV1Uu7iYaOeZqsApUVfgooP0?=
 =?us-ascii?Q?8apLMz5n66x7kuSF6lMdhdoT8mrlmX6qp5U14onr6bhzptsnW70oc6zVK6XE?=
 =?us-ascii?Q?BPp7EVlSVKioaRHNNVtLt0nmkKioTUsMR1xEx3o3oIBBdc4E/3+drb6eWnWA?=
 =?us-ascii?Q?sr7Ot4bfkn4zwSZKJiXgtjEDdpgWrE1VzUwWsva057vEV67pz/OIb9/0ZfwM?=
 =?us-ascii?Q?EfuC+ATTI2UpueiyvTPitm6GYPR+xFwx5b8pHs2ju1rNaSZfD2ydtK14vEl6?=
 =?us-ascii?Q?qaKFlMyyObOWNhzc/3sun7AKi4gD2I7IPYcs/3yobXaVH8qffBQHxoiA/q08?=
 =?us-ascii?Q?TO1GrlwSWOT9hyC0ElFFXXPS5P67LcIE1At7sFxpAeJ+xZI/r+iXxSymchKe?=
 =?us-ascii?Q?fApLE33O4OwMmbKSXpxdFu6/Nb2bpZndryUY0YANmexGgx8b6L0fQ+zMsg19?=
 =?us-ascii?Q?7ACDiLoxa9ckAX0Uzfz483d7RnYxV4aE9Fp3STk1MD+j3XMgLssErOfW4pM1?=
 =?us-ascii?Q?dAo3qvtvDz4+6iFHSQO8a+ArxOVJQ0QFsQdFrD09Er2P3kMARtIdIYfLyoXD?=
 =?us-ascii?Q?bC2tttT4m9t6q3FvLQB/9cNslpjhuVw8SIzGhJL4NWEK6u0JLYK4brMtM/jA?=
 =?us-ascii?Q?W+3V0NkOyIx/C6jvE1CN6PouFXfNxe0wC4Qq1+TejkE1Lvw4JcqHNi4u8/jH?=
 =?us-ascii?Q?RpPF/O6KCZdtAH02itXELuX+6jyj01kusfHiMRHphkKttAo0XKglQ1dODz4m?=
 =?us-ascii?Q?38WM+qgGoXyjAGSlapYMwsT4m8TxBOc=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a1ce45-cb95-4d8c-a060-08decb5e8ac7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 04:20:05.0240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKKA+EJz/L152iZ3uikaK4jgMCfpV7KJC9N526TPu9f6BfJowwynglsdc7Y9LQAgOCKWXKk0v78YfFHLt5ZIDV41rRmlmwmMBX30sLKKhIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_212013_818554_89AB7455 
X-CRM114-Status: GOOD (  10.50  )
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

add support for uart pin function for npu_uart pin group.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index d4fbb12fc639..959eed06fead 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -68,6 +68,7 @@
 #define REG_NPU_UART_EN				0x0224
 #define JTAG_UDI_EN_MASK			BIT(4)
 #define JTAG_DFD_EN_MASK			BIT(3)
+#define NPU_UART_EN_MASK			BIT(2)
 
 #define REG_FORCE_GPIO_EN			0x0228
 #define FORCE_GPIO_EN(n)			BIT(n)
@@ -569,7 +570,7 @@ static const char *const sipo_groups[] = { "sipo", "sipo_rclk" };
 static const char *const mdio_groups[] = { "mdio" };
 static const char *const uart_groups[] = {
 	"uart2", "uart2_cts_rts", "hsuart", "hsuart_cts_rts",
-	"uart4", "uart5"
+	"uart4", "uart5", "npu_uart"
 };
 static const char *const jtag_groups[] = { "jtag_udi", "jtag_dfd" };
 static const char *const pcm_groups[] = { "pcm1", "pcm2" };
@@ -754,6 +755,15 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
 			GPIO_UART5_MODE_MASK
 		},
 		.regmap_size = 1,
+	}, {
+		.name = "npu_uart",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_NPU_UART_EN,
+			NPU_UART_EN_MASK,
+			NPU_UART_EN_MASK
+		},
+		.regmap_size = 1,
 	},
 };
 
-- 
2.53.0


