Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD57AC55838
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2026 16:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dh/kFi69mYW9kmuBoFljUEeL5HuzM8hl9++Y0TTJcUU=; b=o06hN2Rg1OUtZ5e2YIN8lwZRc5
	uGUSNzutCePxqj7TINjiB44xeL9VAKWv4hA/dVgngbMwH/uKeqyGFUt96xzXyPJHC25hHaADBMo72
	/t9xkFCn8oaVWkoyn6eFkq+Jl1vIoYgzRavrD+scSI8LV9NmUAm9aO3Y9/CFCbQepxca0PfF2MiEU
	ou5RV45tHtG83l4BvOAiPso/+1Rdi/yDaq98B9xLAdwyGmePB1oAJzsgKo6Mc+6yosjEH4ISsjYZg
	le53LvgsMmiTtrAsC7WmjPMx41YdwVU0LDEIRIw2dc0zhS7sF4DHwODrMPaIq6X18xoY5al5acTjj
	cE4Ogfmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHdE-00000002G8p-1spS;
	Tue, 04 Aug 2026 16:04:44 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHdD-00000002G5k-0C9B
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Aug 2026 16:04:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FrJwYgudhnLCnqnyBgoqa/Y2M9Adw/OgP+ns+woOfR48k2Hgm7hkHUOKQ9OrUKwj5wIAvtxbnR2eg+6WzI71S4pFSW1vDjeYkon3cBMf8+xfF7DspZBxSRcJPJoJdzUluJ6X0RUnwtTvi3QHKvmozUINym4Cmve5MzvVgeEXrdYvEBkdVtjDh80HioDzsadoPxkBdXcKJHqIjjtyJmYfYhen88e8fXjDNiM0AWOd/C6BUnJKkOuxYQhhQvSMZR0dO8rwhBb5/hRPOav5p8JCorMKRvXtdsCVh6StMheSYKtm4hh8CjvcjlFN5/lHJFkAcCaHKuNxfBSAulnBHuz33Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dh/kFi69mYW9kmuBoFljUEeL5HuzM8hl9++Y0TTJcUU=;
 b=Ha4iQ1vs6ZZ388uCNTYxKBm2wV66euGW7+mJwCoXlxgNvo/sJKCIneVfq/5O+Dy5XbVbSVd7rKyW9BUD4EfRFNEjcbfXdEgeG1aPMF9v9NItObNtqTCcZcGE0jkkUqEENi8JoLwzUF5GIYTyaZljZT+k5g9MigGYICNb0HTiz3XHuGDSTt+Be8bV8gqlM4hSUYU3+gWcdENANweHpbYrKQvXuotNokPp0jvpUQCSX6XpsIKOrxIGwYLCqzsWQUoNEtGZ9t3Bh/Wnjp2lRqIDGfxmHnUSVlgBUa94tcxEQMPOXWnsGeGHXAzDoq/RlCFmesIsh8WLOH5cRlcTxBE0rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dh/kFi69mYW9kmuBoFljUEeL5HuzM8hl9++Y0TTJcUU=;
 b=Oo2FW0OYIogoemXzU1GFP8kSFuVtvjJmcrEh/JCyxocGnXDFxwRC8OJfbdSH/6bzq6cGjPDmJGTZq9cYcbQjwpaES+CNunS9+kJNpwqZWxZuQuISktpqUOl0BzTcg/0ZY/UVs7YH5Wuo2a4vCxIWU91iFNAC8ej9QzmbKIqv39UhWM6AXRfnBaveD7tk50DdUStCa9h4R2CM6JoOt9SzF2IjEzQ/bi2bzpijTK3FZSPe6nfwK04WJiHan4N79SA2cMcfjC+J2hIj1+F3abtr0ocAxckz2OSwberHdZQAdThQEUCLIJWJPStYm5dmI66uw7mFMrjpokkcD4TDKbLK7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM8PR08MB5761.eurprd08.prod.outlook.com (2603:10a6:20b:1d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 16:04:36 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:04:35 +0000
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
Subject: [PATCH v9 04/36] pinctrl: airoha: an7581: fix pinconf of i2c_scl/i2c_sda pins
Date: Tue,  4 Aug 2026 19:03:47 +0300
Message-ID: <20260804160419.3592327-5-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0237.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::12) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AM8PR08MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: 27136b22-4d0b-477a-9553-08def2421466
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|23010399003|921020|38350700014|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: idbg/jN4CB0l5yH3oCBUYik8IdRhkVli84CXlYhhoXxeR2egx9z5PKIKyBHwf7fnP5rWJBphLoT6e0ysrtuzf4b3n3+MSVGxWFZtnStETvsjQmMjDhsYSuXYx5cq7HSXqTExoNNiUoS+d5cukek3kngE1BJYRkwQ7XVaw/1uTeC/662EH5qjNKxeJ/q8ApzeTnRHPhJDgO5Bdv8tqaYZRMwJAww2YeP4ZvGrufHiqgf99glOiPtjPVjc4j1cQaJOQYf9R59A3gOOSqHbBBQjhQE480qSPz3MedahEZMZVU+wwg32a0rzdMpHlTIBw4464kDA8VWQJesQlNnIbC5PJC0GK6fd++FQhQ5rAh5y+KiMGicZIUjSxKlc8163Rdvn2EUZI6Z8IAUJCTQrV1XfviV6YJi+5m4MRqJkS3MlsO7hcwhncpABPuCjtb16imuMxAKnT3xgKGWRktMbV84wx3U60IRo6whAeUpJOtTdhGdoHjgD6kKpswlip3HqFd2D2v5C+WWKBY/5gXtxkj8IU4CtU8q7Fgxthx22LGImN/uz3JukhLTHWsOQN68FDGy3LrM9tWgiPYyse5ZIccqNpw2UhdfZg+L05cl4DJCskSHiEamhUPruoE6IE4lHU0vW3CVmclHiZ0jfaP8/+ub9WLw4uVrSYbGrY1SARNdSysA0s+MZxglZ7fH1nNVtCgcN6Pbhjw6YobFawaeyPodElwbd9l6MmPIiTyJbK2C7CXJaGz/x4A5q/sDO1NjKdaOZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(23010399003)(921020)(38350700014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w9Ddj+oriTKjwBcoaOy8r7QjUjXRpJkTiNHB/ZQv6XubYGNbcf4MxkMNKN6k?=
 =?us-ascii?Q?oOAD6EGAu3b+SvqOOhZWUhX6J3a4ix4mENldOiilmWDoB3E7NUV4eQS6NGzR?=
 =?us-ascii?Q?Y4V/0O61b0R2FgJwQGkwsjkyrRIOYauvUzUsQ9MLJbE4C+P9B02PQ1X1fE4e?=
 =?us-ascii?Q?o63eyqVDabeHcm1VALNFrAtgP139JPRSxJ3XZQy2DiljEl94xgBa4d3GVjUk?=
 =?us-ascii?Q?xL9gzAeLHFXwTMspiaJtN761iLVbrDzhVEo5XBwoAjnOc8SPgYABCRNiaOKd?=
 =?us-ascii?Q?WFIaTL4giWO4YudjjIQWhWkAorohzOWLi4p+nHUlT5dLUVED0RWVDgHvrtUt?=
 =?us-ascii?Q?WeTJ67dEptYvxyQBes6Oq7NORM1/Fe92AjomAmZJRm3QVt8w1lU3dWqesL1m?=
 =?us-ascii?Q?VZZasFBSKZ6j344hbW7PXKwNrOWhRlHb9Vxq7E9k+9sJ2UPtOoSlYdkf5obO?=
 =?us-ascii?Q?Akgu85Ww9emwG3mtX1RtXimAPRvvdJXYSurZyCBvSzBShizGedvtH+Bw+nip?=
 =?us-ascii?Q?0SVFm8Fj32EekYr1v6yKxT8SG9ITImo6L4y3YvMWgJmkzYlxwUZqtF4mpSMm?=
 =?us-ascii?Q?2CkzK8fqZqbqfatP5LMQ15IaHcS7lUjJW7j/+41+QTbEaaGM1y2VUt+H6+lC?=
 =?us-ascii?Q?vlyZbOWy5FCDugVJaJObQ5OLWEkRB6CJMZ+uVqkCbIPHoUJfm+nYvIvC0gP8?=
 =?us-ascii?Q?lQZwqNyQrfHxcqSl0zpUMfZXcBzYfZalI57JiUUCZs10y57rVKjqIwpDzifN?=
 =?us-ascii?Q?BFkzIYwcxhKPpN7cdsukBWTYUr6VqTG8+7nD2WHSpyDiHT/yEUPbZnztU+6V?=
 =?us-ascii?Q?xZQav6yGkwCXr9LDVFMjXp3ZXxVbbQGlx9lekVutLx8GutgVBbRh6H7ZGnwe?=
 =?us-ascii?Q?7Yin/7SLQYrzLuvhzaTSqOzrk+Cj9c+TRi+x9tUi77ns+CjaCwXSeDVBweLK?=
 =?us-ascii?Q?8Eo/Wk25rvVrsUat4MkKgYjKgCIy5NNHUlzhNxhyn/RmER4Om4so19LkQ/R3?=
 =?us-ascii?Q?i2v79UOO/350tcMMT+Q4+2bVKMfn9aRvD4c0hTT5K2DugrLvzFYIhfbHdzvY?=
 =?us-ascii?Q?G5FLqbdVKjYOVV7RgXW0l7lSHz3iYm/d9C9blWOgs5yGe1WwASLcBS0sK1GX?=
 =?us-ascii?Q?UFdY2scwF0SNz1G0XS3AIMBo7ZVKlHTzj3vL/B/s+2XU/C2MSJd7wyjInaHf?=
 =?us-ascii?Q?GiWj8A7uNTqL9GeDaVVK0QqJCqH6yU5B80GEahQkGrB/d4ekeSwbMRPiE526?=
 =?us-ascii?Q?OY3pBBS2Y6Wf5t0lLt2zus6ogeGDXGEFmLujRTPBT1avrHHC13+372jse3fj?=
 =?us-ascii?Q?PHV4DKySc8f2NHMI9IwZgdNsi4KCuGsi3g7JKlx0VLElV4sxj5N+xtQ6PVwA?=
 =?us-ascii?Q?XzzvoG2KTC69g18JLP6wKOLreB8exOYyFWcfKcGoRPG7gSO9FAH1Au8ZZZJk?=
 =?us-ascii?Q?Pt2GkHUNuZn+MGuzGq1Sm2JDvQQx5GIxKlu5+Q9T02sFu260kRKcM92ai1PJ?=
 =?us-ascii?Q?8H55aBmyRUqniblAspJMhohbLTFhTeTxZyyHbdQF0w1XcjhAYdxSAJOBwFzo?=
 =?us-ascii?Q?tL2fRevg08T3E5Cdn/RofGbcWd2n0R+SnVAvPl9gD3G4k1cFv6MTB8/mQ0wM?=
 =?us-ascii?Q?Q1k+++FT/4v8pNcGl/F501P7pGvk66s9xITbhD6Nl3T96Z6rCaOHi7OK7s0o?=
 =?us-ascii?Q?HJvUXPUhEYpzYPhb7qmXSvR9ytHr84ZnBNrPfOT3ZYwNLy+64Q0UNquYFQFM?=
 =?us-ascii?Q?M2rEdHKFYBuzL2PsaqJRE9d1yOnAuaY=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 27136b22-4d0b-477a-9553-08def2421466
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:04:35.8902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Djtho91LrYsx3KDwurgmBL7pPg8P2M+C/Ts9uSRPvK9/mdy+FD2jDGbwxqTZ7G/HMyrnTb5O+B7E51oUUTBOEMlCeqc6TmZ+Hi0SKrCfpYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5761
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_090443_085556_C286E0B7 
X-CRM114-Status: UNSURE (   9.38  )
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

Pinconfs of i2c_sda/i2c_scl pins are swapped, this needs to be fixed.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index e8c018620f1e9..36d14103798b1 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -1844,8 +1844,8 @@ static const struct airoha_pinctrl_func an7583_pinctrl_funcs[] = {
 static const struct airoha_pinctrl_conf en7581_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_PU, UART1_TXD_PU_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_PU, UART1_RXD_PU_MASK),
-	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PU, I2C_SDA_PU_MASK),
-	PINCTRL_CONF_DESC(3, REG_I2C_SDA_PU, I2C_SCL_PU_MASK),
+	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PU, I2C_SCL_PU_MASK),
+	PINCTRL_CONF_DESC(3, REG_I2C_SDA_PU, I2C_SDA_PU_MASK),
 	PINCTRL_CONF_DESC(4, REG_I2C_SDA_PU, SPI_CS0_PU_MASK),
 	PINCTRL_CONF_DESC(5, REG_I2C_SDA_PU, SPI_CLK_PU_MASK),
 	PINCTRL_CONF_DESC(6, REG_I2C_SDA_PU, SPI_MOSI_PU_MASK),
@@ -1961,8 +1961,8 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pullup_conf[] = {
 static const struct airoha_pinctrl_conf en7581_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_PD, UART1_TXD_PD_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_PD, UART1_RXD_PD_MASK),
-	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PD, I2C_SDA_PD_MASK),
-	PINCTRL_CONF_DESC(3, REG_I2C_SDA_PD, I2C_SCL_PD_MASK),
+	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PD, I2C_SCL_PD_MASK),
+	PINCTRL_CONF_DESC(3, REG_I2C_SDA_PD, I2C_SDA_PD_MASK),
 	PINCTRL_CONF_DESC(4, REG_I2C_SDA_PD, SPI_CS0_PD_MASK),
 	PINCTRL_CONF_DESC(5, REG_I2C_SDA_PD, SPI_CLK_PD_MASK),
 	PINCTRL_CONF_DESC(6, REG_I2C_SDA_PD, SPI_MOSI_PD_MASK),
@@ -2078,8 +2078,8 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pulldown_conf[] = {
 static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_E2, UART1_TXD_E2_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_E2, UART1_RXD_E2_MASK),
-	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E2, I2C_SDA_E2_MASK),
-	PINCTRL_CONF_DESC(3, REG_I2C_SDA_E2, I2C_SCL_E2_MASK),
+	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E2, I2C_SCL_E2_MASK),
+	PINCTRL_CONF_DESC(3, REG_I2C_SDA_E2, I2C_SDA_E2_MASK),
 	PINCTRL_CONF_DESC(4, REG_I2C_SDA_E2, SPI_CS0_E2_MASK),
 	PINCTRL_CONF_DESC(5, REG_I2C_SDA_E2, SPI_CLK_E2_MASK),
 	PINCTRL_CONF_DESC(6, REG_I2C_SDA_E2, SPI_MOSI_E2_MASK),
@@ -2195,8 +2195,8 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
 static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_E4, UART1_TXD_E4_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_E4, UART1_RXD_E4_MASK),
-	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E4, I2C_SDA_E4_MASK),
-	PINCTRL_CONF_DESC(3, REG_I2C_SDA_E4, I2C_SCL_E4_MASK),
+	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E4, I2C_SCL_E4_MASK),
+	PINCTRL_CONF_DESC(3, REG_I2C_SDA_E4, I2C_SDA_E4_MASK),
 	PINCTRL_CONF_DESC(4, REG_I2C_SDA_E4, SPI_CS0_E4_MASK),
 	PINCTRL_CONF_DESC(5, REG_I2C_SDA_E4, SPI_CLK_E4_MASK),
 	PINCTRL_CONF_DESC(6, REG_I2C_SDA_E4, SPI_MOSI_E4_MASK),
-- 
2.53.0


