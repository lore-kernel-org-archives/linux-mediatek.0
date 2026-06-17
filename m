Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6027ECD98F3
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 04:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4NnpCR8m5Q61vaQYwB+tHmg7AS31l7ZOwCdkgSO3cM=; b=MEiht1c5fjwTehd/1rTboiLaYL
	DPLXbCrioO2NxYpJsD1ZLz/5bFmtg71F6YksbFD+q7Blj75/6dzKUTTvI+ikTgNK8Eyt58Qz8wuNJ
	Ax4S/l4+u5CCiRsuIPAgP+EdFeHWdrVUmcYou2N0gPEOvc1j9L9c7qmalFfAPSPYVWeSAnmhISEOT
	W9fUQkEC6y0aILSZ7FptA2p+CAg9xWgCsdq/PLsXhW4xHR6zwzo/uXilPOH18LPjjAimZz3DlMKmr
	/P142glLe4fu2JpQii/26TnVqxvyVJY9QJtavHZzrpwND6s1w0aadKGs9+h12pPfkIoqojYDedtyt
	ughiQuEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZi1i-0000000Gbg9-1BNX;
	Wed, 17 Jun 2026 04:37:22 +0000
Received: from mail-francecentralazon11023116.outbound.protection.outlook.com ([40.107.162.116] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZi1f-0000000Gbbj-08TO
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 04:37:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OjnxQXmTnGRHguExo80S7A+tI+LtoXI+6nmxejZLHFEPksbDxoGwFgUzkRGntFbnCkC/WjyDYCkpmkH9kjSAQL1uIsJho1pubLc5c5lxvY7yTac6w6nI8doj/fcfYxMIXpxQe4QRPLUo7KfaZQg1k8fx8050ZMnzWqArBJUB7YCoCDmS/77Lud7zXcBop07COC2kBNgKvf6Q9rsWZcpiaZR6bYpPsHZY1sZ5QFM7ts5tXJZXrlW1boRZ2d12TBhWBntCIZwUDaaj+1hLEnKZmzxXWvtY3CYDUUsoHcLxDYtNc3MWoRrIgHhqdTUrJnXGqp44gI+LGXGsYNLOiTK/4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4NnpCR8m5Q61vaQYwB+tHmg7AS31l7ZOwCdkgSO3cM=;
 b=EZ7oS4J3/pLZX6RDtYxzMihOFH9e9TWdK5N3McDknffQdMVa4izIgSVm/ixSQaLNeHj0ModDrLdpMY+3mTHc2Npmem/K+C7ZwVuC755T/6Kd6leGz1glDUsbLskD1KWGkvkwJY72R4847ge+lsfQB2Lw9HRyD14etVUkCL5mUhh+5PtueoVOu7pzKQTbvBz+OQksUzOGKu6lxCxrg5M7J5BWh+0d67xT9Mn/OWA7mPtW6HKuIjnL9GTiDS1xDEJU6eAEsVikXB59UmlYZBcyxZWgwCwQ/xwfn3fPAo1RQt2ehlvtuhCaXK5OSdWzuEzlNcohUvtxg3CNR4yBEzh7Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4NnpCR8m5Q61vaQYwB+tHmg7AS31l7ZOwCdkgSO3cM=;
 b=PzV6fkCCAWE7A1UYnNkBaU3cQ6kZKGIVBuwJXiVUWEhwz3VuXzAO6brfnnahn7+RzOyDnF5tDwW04mhOamrn/g4QDPkjOKf20hSNo989+t/IzqIhFrlIBktZlOxSmwLsCP/3gIuWrAwdXgf3IEguqLzyA7bNc/32KkeKsbJaC1tzOEjU3u9GW5CMdKXWjW9lFc+L7x6MwcHCJ7ng2Mrv6et+OrobpeJJ/PBtYcW0AnYOw+E4Qghvny6hauruClflmLvWBE1hSEkyoDNwcHqYzIvH1yFVyYuVwCRivJrHfKleGgK70EhemOLXu2FVp+x52eusxDYyLiXvPEtEurfAAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV2PR08MB10384.eurprd08.prod.outlook.com (2603:10a6:150:b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 04:37:04 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Wed, 17 Jun 2026
 04:37:04 +0000
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
Subject: [PATCH v4 02/14] pinctrl: airoha: an7583: fix I2C0_SDA_PD register bit order
Date: Wed, 17 Jun 2026 07:36:42 +0300
Message-ID: <20260617043654.2790253-3-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617043654.2790253-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260617043654.2790253-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::11) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|GV2PR08MB10384:EE_
X-MS-Office365-Filtering-Correlation-Id: 5afaab9e-27c7-41cc-a72d-08decc2a14ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|1800799024|366016|23010399003|38350700014|921020|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 0eIB0IeLV+Gfs1unVG+8j0STECppTq1OFTgXykjOlZ/GCtk74sxGQZYnY5mWbRfZi9VnURaPC+ZHMBzEJ0v2WymlYrHxYb6XQfjR8+lhpq1+RIxVs0uo0i2es2/NkHbvQT76eM5vc3gEGVqokLc4rq1sUgEZkCcoHMi/GlOtzmbL4CJF9PxfVQXH2dYZ+wx4hb/j4/1yENMxTJ3t0F3GZ4Y0aZTUoktdY+mu7DhlZDZrZ2wVAITvFZBnVkx9Me9RFhXi7UXf3IIKG5jm8E3CUdS7OfnaNiJpI/XU2ocCyGl/D10C+YcEpNNA9jLXxvaEqjFgnPN/k8Bksru2am+qVVYWyRreSrcReXNqicoNucsbvvZWrmBoUJsPTf6W85r6YmxTSgZfFOGfeARBynqIcRRC7b7EOtDOn0M6bSBAjnwl0YC4XHFqjcIXoI7wCGfQUS7s6xkesQLUT+U4CmZZJe/p7SDcRKkqnjjQRrhYEdyAxRyZnzyoA6tbMaCIe/khluOU21w4lh0zTibrSuBdneA2S6Ka5Qb3qLdN0VYD7+64yfKVqAnbvQTKatEXugXd9CBBqo9dU4K8QSb4LijWMf33TmQl9rRo9jGfjECZ56xAC13qDfSSyB0BdNawoK/pCowd1BMDq+quQqetwAw1rEG5AjE329sdreSKkrUYeGHHkl/Q4/UKrr5nepUTjtuylG1dOpuofJDn6lMAMdvu6QSYDrkcC/49e9uhg6aVyFWGIIh/uBIfkx4H/YEwU27DzVl9TncZj70VAzolFGLTiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(23010399003)(38350700014)(921020)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SnqszdUsmQgGgS7XMz9L3LDkYmyyQbCIJiNfe6tZ1h4kmAenGvjppxT4+pKC?=
 =?us-ascii?Q?/Hn94V+wGVJQIzNUJsaGPR2CcdC+p3RYE0CojM+/saVPH7HDkcfN3iw5KBJd?=
 =?us-ascii?Q?dMyF2tLxg9I8GMGOQLxRy9ydQQtnBhPtoJCxzvKu50XupTpCZX4oRBDSXKx4?=
 =?us-ascii?Q?L+lTG+m5liBicKvNd6JlotYCjfsCCHzWZsVUvXIYRthLJQHgLWuHPkahnsYd?=
 =?us-ascii?Q?Hc0/jAt4qhAbe9LZdD1nVQ83L+D3h/07OYTvd/E72y6OkyLkLRjkiMui2g2d?=
 =?us-ascii?Q?luK9SqddCwoMnnrJR73VMzUlwt943xzTJZcDwxq6epKh3vTBVXUMllz7RjyN?=
 =?us-ascii?Q?XCvWMjUhd4H1Jew+WHQkBbZvGLJzuUvbBqDrKM+h/VNUpH/ajktFm4ok0m32?=
 =?us-ascii?Q?TIKb6g29QCVrK0iYHw2EP9WwICnBNATSoqb/6WNukqKNnl37FNrwsRjSEGsR?=
 =?us-ascii?Q?zZP929OxKmWQWHhua+y4ewJLWpGt0ubLraj6XmmfJo834jeJo7w8QsIqMwZt?=
 =?us-ascii?Q?Q98UrATU0qohJFaStaWZ+OEmgnTM50I4mVIdVxq0EM1ENn32sw6JSWy2of2Z?=
 =?us-ascii?Q?cSzxW6vcyyXEw8HPe91OgBQRg41vF9XQUhIlHyUIhluDsrfZTnIfy0KcGkki?=
 =?us-ascii?Q?nXy9lPa0dRtm8lxUCAVCTJHOEijRRY5b5Q4CK4wZV1OpH9gAqaWi/jmYWEf1?=
 =?us-ascii?Q?UxStk8yRPLS8u8kbCEBrBysWsI/VSUbs+EFOeMuQclWez2plP49I6hPvHYT7?=
 =?us-ascii?Q?PXd9z7NgYreg0Fotybk8aAnnqnQroeJzkekYMPcad5c0vdsBZHQlHmsE7rSr?=
 =?us-ascii?Q?bRveK56kwTqQSi71SyxYLIjv0HjEfUInCvMVVU7MSjy6NVnR2XzQEt0VAvqJ?=
 =?us-ascii?Q?Cbt4DAdaglAj43Hw0uJ8fg6zcGB4ONtDW+SAP9Ewgbat4sIOX2aCY4FBz6sr?=
 =?us-ascii?Q?7tfcHMj8x9cDxrX/bcQz/7+zoR5fOAxknrNTe5UuTXylQiU404inNZkNDjtZ?=
 =?us-ascii?Q?Qh6etqT6lMlcFmSCihgDxskp96A1+8y0hmRT5TBNCmbU94JeISTi/3qtQm7h?=
 =?us-ascii?Q?Vjp4ssP3wifaaV6QWQMC7hxltC1pEpxigwQQAHiE8ujPgbpCrQT/snyxIaCX?=
 =?us-ascii?Q?ojvcYK3W2yamUkMOQjdS5wsxyvzCY1EbC9lI51hqeMzXztxnCz4G0Wynhhk7?=
 =?us-ascii?Q?EvRnjfG3qYSgMJ2NsCTB0brI+iQANzbk5bcpsVD+KGXMrLulLv0rbaLuZcqM?=
 =?us-ascii?Q?zbLtR7m+VHjbrPEj9k0YvMdnDhYhSVxsPjLWmyTDV19F2ESiC5FDmpSbSCSJ?=
 =?us-ascii?Q?vSVyBro6MF4q+1+h4wsh5/UO+qn2T5fNzPrlT4/TNB/Dob9TUR1ngOTfnX5E?=
 =?us-ascii?Q?N3sEvsM+6e9TubzevI2jrsXxEaxoMk0oQmtxcd+UvK8A8BcBKaBMObGP+teE?=
 =?us-ascii?Q?h7NL5gcZHWPa7mPjXBvsL2uSWQHOrD3Any4BTqye5VrjmTp9t3P6RK61WyWs?=
 =?us-ascii?Q?qubdOGU4hmyqo+7UM9TE1pwIIsePDa5BzxBA46l4qJJHFklohpqJtoE/hF0l?=
 =?us-ascii?Q?rg8EV5NHxJBuh9IhxPHEWVnRJf+Dg6mnqET5OyJUhhn9il8W7CQXHWBExLWO?=
 =?us-ascii?Q?60zitfjMDuaN+5bdn5lnp/pqsAL49HkdVPUTEp2H8buIaTbGCxhlloY4nZzZ?=
 =?us-ascii?Q?12AUv3TTndGyF6orplVcJ5ofiT7qf3KFv2cIXvK4HZrU19j+OMf3zgpJtRnW?=
 =?us-ascii?Q?Dp8HAJY7U8uh/SayLFImpQrRnVO/fx4=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5afaab9e-27c7-41cc-a72d-08decc2a14ff
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 04:37:04.7640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WyjMtAqGJXOsdHmyFQImLcS53Od//3NyoRscgq0pPZC0wLQzCQomQIkK8xA/m+qHN+kL2XpQa3dcooIQZW1Zr2cGm6hJ0AxE643c5YZt6Pk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB10384
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_213719_074628_337FCCB5 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
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

I2C1_SCL_PD and RG_I2C1_SDA_PD bits are swapped, fix it.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 63c82268aa82..4076bd0261d1 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -184,8 +184,8 @@
 #define I2C_SDA_PU_MASK				BIT(0)
 
 #define REG_I2C_SDA_PD				0x0048
-#define AN7583_I2C1_SDA_PD_MASK			BIT(16)
-#define AN7583_I2C1_SCL_PD_MASK			BIT(15)
+#define AN7583_I2C1_SCL_PD_MASK			BIT(16)
+#define AN7583_I2C1_SDA_PD_MASK			BIT(15)
 #define SPI_MISO_PD_MASK			BIT(14)
 #define SPI_MOSI_PD_MASK			BIT(13)
 #define SPI_CLK_PD_MASK				BIT(12)
-- 
2.53.0


