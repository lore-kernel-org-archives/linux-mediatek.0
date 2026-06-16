Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57114CD98DA
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2026 04:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igO4ZzTiWTfVX0v1XidgEG0TPm1OP1lWnu7q79IVhB4=; b=tC8DR1QFOXCmVWh0ynISAt1V3Q
	Xsyb3DD1bsikqNjQ3Z/dKXsjzXykKvJDsqPPed0N50SjoIHD8M+Tk+U4WvxiXMrUdEipPvlbZAscR
	sV+gD9a1xQ1y2mau9R9WDmroFg316uZf9VtU/BiUqt+4PZFXL/KZnCoVNZuGz0XVsQ8B6GZgLIIV3
	hVLuf9kIkF5K6D2wIMHIGBbwepOyCm30NgDZPD1D9MKO1ByG8SuThqqPNcqBDkF8YP+4TceOPv7b/
	n23weoDolKKqOwSko9uaJVzI5A3/pqbU7VD5g16PZlM9yZeQfIA2Lc8yi3l3do4W5obMp4MIG07Sp
	UBEUIdYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZLHQ-0000000FBql-1u3Z;
	Tue, 16 Jun 2026 04:20:04 +0000
Received: from mail-northeuropeazon11021078.outbound.protection.outlook.com ([52.101.65.78] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZLHN-0000000FBp5-1jCt
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Jun 2026 04:20:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PBKl/PtPjhB2sJ9Gqzy5G+0GrH//UzASGl7xLswpihypQDIJCvW8maP3eFjSYr5VL9G282Jcqq9EoI+n5VIHR4bVSPtvbEchQxi9yqJWexD2/RjwGEeq6Dfl7IUSgECKVvHqpAdZ98P/J3hePkQApUmbKSIjwuCk6dr6/Byj17NuY16EAkMEN9X+1bl3Wx6Lg0NZpPBhbwo7QgVHfW+bHKKGnSlZhHMjngheMYin5P1FqAA1jNHDHma6SYu6wIqt2TUdk69m3eM8x4ZoKe+qlOxGk8+w8xCUCpa0Z7n71THXKQ/Rsj+bvyt08hUKmbHOwUGU7B0YYgZQS5faTi0AIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igO4ZzTiWTfVX0v1XidgEG0TPm1OP1lWnu7q79IVhB4=;
 b=fJ2RvBl3f4KbM6sjUMhrHgk5GopntPn0H3zZkYjPDlGwFePe7xciLYL0UhLlvHlRvp9wX3257NHucsCsUwze2wn8C44RuHFSz2wU4l0wDToP4tHq941UXz/Cz/jfPQsR9Vn+VQIWEyFe7kaJqO0QnGRJzauhS/ja5GoZNQtK4erOw6hpvMkyYbRi4wXp+Bu4Mt/6BZy9owbNH1fADDV1CAigPe7yRCScyY0z80nZiHwYh7hWXsmKIKGZHZ+Dbj4mMJxRSt0YzQpVJMtsnzABpKK+miA1RHHNzve88xJ+3jUeBLJuw7wbUprj8Io5eqmOQl8Q32sze15CMGwClcwfhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igO4ZzTiWTfVX0v1XidgEG0TPm1OP1lWnu7q79IVhB4=;
 b=DdKbOEq7yq2g4a/XdJYSzsxOpCKa70RP6wFCUS8XCfHH9Ku4vpBzsLsYhUiXklL7VgU06VxN/hNcMi27NKqy1ZAuwVVqpTN1YrMPcBDmpAg+t6rTLqYSCRXKtB3XSvNemHT2jVY0jzx30+yFXR3EEAzpfInoxLxTUbt7/3fNbdZNOXH3prP7qdVimUfExJn5iQG9mrzhL3HvXni7wbiEPMY2nd3FnJzrrBVA9dsMcOHiI+4hE40pmCULAhHEhEFvb86jS4drbh64RmGzDZmMCh6O6soIQOpWVy2nq6DejAHRNGa5tv+0aGcBFqK88ND4UCYv9cGMuvZNROhf2nqFTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB10055.eurprd08.prod.outlook.com (2603:10a6:20b:645::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 04:19:53 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Tue, 16 Jun 2026
 04:19:53 +0000
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
Subject: [PATCH v2 01/12] pinctrl: airoha: an7581: fix misprint in bitfield name
Date: Tue, 16 Jun 2026 07:19:28 +0300
Message-ID: <20260616041939.2587012-2-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 0bad5db1-a494-4215-77bc-08decb5e8401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|18002099003|22082099003|38350700014|921020|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: dZhAlK1VkBllqqmZcl3uO5D3UScxuoX2luJMSVXvfANa2G3nEe5quj1InrFJnLiXTr05JrK3zy3IteP2TQYy77cljnDE84GLQVUQvXkDKoYeGoHMms0uf/yaNRf9DucepV1CnPjHmQpl/LAFkod7yEWcd0QE/wLP1FBmkHxnAr2bzy5UImmwVNtPButXLZgbYc8/zYYLimOrkdfkZYK7gC85YUqfnP3qbrMgAE6E0IgWNPy/2rB4b5yJ98Uh0VDSe6mrrpEZh+a8KVEB3LllxmUWZaW4tWBKv5z5Z/GX4dqgFUxN5Nz34rUEsthbux/2RL6qMR66c6H8WXW+oU5GiL14qXSA9pSVUGe6qjfUvOzLWjUmtBRI2htOXgUT1wkYxf/LGxvrRLtD/MNJsZg4UycViuJU3F2YOZQ1utViu1o9XzS78ht2zQBrbfgaEV3hRas+yvbgn4ti2brkfLkcYNua2g1z7vqdAFukJRTIng8aE8UusVLhFgmQFysUiZu8z36Czngwfv1SPZNXAr0TvTID9CfocqWx9MdBxubtg0V5gqPZPhVLwqHDei42zB6gsmtq0/OKJlWyOc/8BLGUk1Iw9gl5X8qet7oRCJdXHqmuBPNmd8F40aRdWIAv9SYvs4wbBHiNbeazQLi36J7/1wY8YZUTM9mbluNtcIc69jx+lhdfmhEAdlh+WZ53BHCZcELYJWUODtrEnQJ/HlCPaoB/Af9lZ0eJXabvoEhaQDmrC8QvWWfV/ABZd6LU9Aw8zJRFXJBmwoDAiGpFrDLKrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(18002099003)(22082099003)(38350700014)(921020)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dh/rvGKTKkQf/sGP/J5ViO5lVcnUj+wOBqSEuiu1EupDQRHr+ebnW9TvGgJt?=
 =?us-ascii?Q?TUo75T9o7D6TXUBgyBeYOFciOBfLetxPM8PTQ0V+C43l3a87ffLjdZLDY0j7?=
 =?us-ascii?Q?KseRHU1U77uLlSheallpPCbpPoKnDf0fTbhRjt7Wz3IvOOyz8D37zPO6U4xf?=
 =?us-ascii?Q?UJ5fNQNaVqYTHVsRPK+tWUCvIP5BUv0R/V8jy9HJW8pns8DU19C7YkFcZSRc?=
 =?us-ascii?Q?rSuGmG60/B6n7fuyP3Q7aNtXhNh9y1kkV/9lR7vyi24bAKEY38hQ8Q8ITSO3?=
 =?us-ascii?Q?RAfwfEVzl5p/2R6bii51jjdeywopDcFTlFgBUGcqWcBeUr0pL8Z26/k86IP7?=
 =?us-ascii?Q?v8z/6ZnWBKjNPHNdpUmDQLHExoQvOa9iM5r+cKwXkPbWacLvJYOWsPO2Vlii?=
 =?us-ascii?Q?FccTZhZyGXmXGUqxuZ9sCBCeJ7wQlaonxA6wI9sjGV5dqlP+sAazJeblqp+H?=
 =?us-ascii?Q?14+3tm3O43MLcuTvHTjjuID4qkV+zJoK/uhmTh9mfAePMmvdau1hNhT9A4XH?=
 =?us-ascii?Q?pvaV95RFgZmvBBpF1F/ZMA/EXS9uQpUejrMa+Y+J70VP9jkoEb0A859Vt/d2?=
 =?us-ascii?Q?LiGbABTiwaPTCVzDRoGE/RKSrEkp9BImkZ+Uaf+976HgQFsyKd24bGNB/l+6?=
 =?us-ascii?Q?E7b9IFle4EQZE0Hh96g9D8zgcdqmIdqbEF7Fn/UWsqRtd/es7K7pFpKovqsz?=
 =?us-ascii?Q?WRcjYhFHMcBaOCcrhUj1edDA04SWfmvAXh0/5Ph29Lh4wHjzGot0sPpfoc6i?=
 =?us-ascii?Q?eDjt8R+GNByJvAzNpdKAPNYsMoyeyQoIkXpuRfDCDRvV7OzK8I1YhVjD4w5+?=
 =?us-ascii?Q?cGmywon02YwK6Xk7bXZyN/I14mabEFC+w1fim8r7cwPOqpGokpKCIQ/GlxgN?=
 =?us-ascii?Q?vbuaWEyg63MYkviIj1yBQOn7kq9Jzi5eimCSxy0JXekFmfd/Tfd4ihSdDTnf?=
 =?us-ascii?Q?V21cjKGUuAIQgeUkqw57BR70cZ3IIt6sQcysNNBrkja1TZW+n/k+Gpwxo/hP?=
 =?us-ascii?Q?K1O6Q6G0GL0sKv+pv86dPC4NyYMaqESrnUkWCkjCXNqftT0upz+2cnMkhYgN?=
 =?us-ascii?Q?+8UM2FDNX7erg244Szi4lQuCE3IQZ5czlC01eZUytLAEPJs+dsMrrwTvT17b?=
 =?us-ascii?Q?1LelHL/dkrm+SVqnst5sn+jB0DVDzQBC/f1cmHpHACWBW6ewMuPX93LrDTif?=
 =?us-ascii?Q?k0Pes75wo/3AnuqTPuSHbs9tjCKiCtJVRxv6PwNVLOj2T0gAIyKaBzokWDCV?=
 =?us-ascii?Q?hoe2LjO26DyC88+e3oVtSr+udGVlFeqy2aDrJWtwBHYvx2/PmR1Rfrv87Son?=
 =?us-ascii?Q?PRnS2/B7db+aVY4yb68G2Msu2hnK0Efr8uUr1XPHTOGaeFvgi5tZEXxnICjZ?=
 =?us-ascii?Q?8KrDEgWD9MuMj6FHVAGDQnqc+fbFL6RfEXAcuItIYjs8De60HdRcFN2F4Ped?=
 =?us-ascii?Q?ktxuZuVFXrJM7YXN0X0sYKLwSlY2kO1g31S/ch/SJaSlPaDv4WyUhYw5wxMq?=
 =?us-ascii?Q?SigX5dYWhKQ+M70beyKCFZBIKdZZJ7diWkXiaBsrI/hEvQqF+C+vsqOjeexi?=
 =?us-ascii?Q?3OtA7Fgr+6UdUaEEDIknHElTt8cOITrBBTzPYDx4d59YSZEzyg0462emuLna?=
 =?us-ascii?Q?vX5oKLYiCbaIZD/1yATEVR/MYbl1AttDQjRLCGc7A61OGIFjgpbwG6JCqwpX?=
 =?us-ascii?Q?vu6GGweiuLKChlbr9EZzYW46KvGaiqOEa4A7Sde3a3CqZeGOBAuWXhbc/fei?=
 =?us-ascii?Q?cNTvkI7kOp+yam/pyde5VJwXSEVl46o=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bad5db1-a494-4215-77bc-08decb5e8401
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 04:19:53.6560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FqOIF/u92KGeuzHqqKNc7Jd0vRUT8RNHY8rhI9aGYNQXQDJNNI96WkEoCWBWjrlsC1HH/fxcNK1Q5jdOcVt86oDcydTu58IepBjhTyO7UU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_212001_489203_A9FAE221 
X-CRM114-Status: GOOD (  10.53  )
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


