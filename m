Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BBCCD98E5
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2026 06:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJtQz3a1JCJ17CI7aOVaL9bcuLOMUSqw69VPSSEjPlo=; b=arW+qn4e097jZEZb2+rGntu9JI
	FrRQ1sAntKiTtNRLQZ5eyn9x5tMRA6LKtJJQFJnT4rp+8rrjJHwfmef+BLgAjM41FCIUya0Ovj6Dl
	e5jwVabxkQRKRr6AsejQrQyFIBpPUgk1f/1tXCYQ7c36mtLX/APZxJKwajHqvecEQm0exjqjkb2su
	XFYG3BuI/z5INM2JUStpw+g3Vd6EOhwEeHO0/wLaLjbGXyKLuCzqCQFcWEze46+DZEir0OkPoZMS8
	2Nj+i6SYLjWPZBrJDOXRkniPJpn3Ma9Yk/ua7WF7KuNaZ89pIRwEk+8dwXr+OtTc9elWPvKEKlCK2
	0JHc0nQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZN0d-0000000FIFH-26d4;
	Tue, 16 Jun 2026 06:10:51 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZN0a-0000000FIBH-2fsC
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Jun 2026 06:10:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBqpauYUanjEU/GGFW4tU6MKLSzPv68T65sv9MaJake/gqzMjEFQORLOHEvInAE7WyDIWNoQXLqcM+a2yN91UkPoabNLsJUe9q+KtlJCPkePkAhkXCbCFQ4JwkeUJxhLJl4mYZ9DtfYzX59xwckIQNGJBg/KErSfSNVgSb8Zdhyd+dkG8nNWmIB1tjZn5ZaFsMuteL2XCRE5oTpL4TMTRQvWr1m2PDJ/PTGTdl5e6OQo5iV4lLIS7TdkfoZ71/sp+fcogNs9R7bo9WnTZ+ntQLKPRZwIxU89tBpZzQoKRmjAGyIqSTTGT7hp9LzbkMNhG2DRbZ+Vc2Q503i3sbJiPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJtQz3a1JCJ17CI7aOVaL9bcuLOMUSqw69VPSSEjPlo=;
 b=JHIlBUp2OKdKZTqyShxtAdiwi1VoWUgLS59HPc2HHeTQ/6zuSUPEkDuoLACYf4UN4OsYgClZERb6vPJ2ctcvwD/7NFYODcrUSmGSypGgBlHts/ZWf0AevVG/IsO4TR91fg/z05qKZUP758P8i2CpMFpH/ESgIj3Niz/1t3+qmDzYlRr/yDS6D+ia/AeErv7JcZzYjPWlkhln3OUpvGv/H9vW0sbGA1u+BpxIG8XqdkqkDxmCLh6VU5KEpoitWTGuuJgUqL8zOG4r/+wg5EGQVFegcLWZwYtAFnINufBtUe3+4D05suoLO/KVpYbXYmkdCjVxtktpggTXTMvnQnV0pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJtQz3a1JCJ17CI7aOVaL9bcuLOMUSqw69VPSSEjPlo=;
 b=K93SWp/WMvLlLx/GYzDpkOsH2lFkzYhE44t1RYWyGCs6IuqRxDZAsTL1DrOr14rnEQgb3bSC5l3Rbx0DG8DD4YByJ2S1N+wOdPRpN8WN6Mb6q68EyY6ZmP3BFv8o9qq37xbVsCwZiIWIUTjMXTAn3x335OSInx/z/v8NWFAI9QN+mECx2nnCuis0hRKvF8Afc5EeSyW3P/dGGJo88q1lPCl8IWVXybj6zm7BNAZ5BKrDlHbUEKSVgb+eI0kb7dDxbs6c6LH7xpl49ThK5EQVC9lRo+15/3ScAVv88I3PpIG+qi3hHPJxA3m1Nqz6OBbfEUsudB80gNbu/3RbxP2oGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB6206.eurprd08.prod.outlook.com (2603:10a6:102:ea::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 06:10:44 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Tue, 16 Jun 2026
 06:10:43 +0000
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
Subject: [PATCH v3 03/13] pinctrl: airoha: an7583: there is no 2nd I2C bus via 1st I2C bus pins pinfunction
Date: Tue, 16 Jun 2026 09:10:19 +0300
Message-ID: <20260616061029.2630777-4-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 99283981-d39b-4152-85d9-08decb6dff5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|921020|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: Q+Hx0HmeAAPC0BPlh69xP/VpiyMk5KgepRDPQS1WH4EQbfkFKikTOiBeiigAmOZ1shyezX1hCV66Vrs6B7DFNFl8jTYGdfJj8jvo/nyjSc1eFiZLSBym+GH5PBDcdpG9codJu50Jsd3EjMCo81WkBeHpHpMgFqS3E+tEM7GIRkJHfW6ekmWpMUTeL7xtaB2AzV18v+tABaNmcPkNdRfDJY37ZtTb0PDTYkG8itn81rEdkmPLnMP5lPhEsSa3eWHll8Apt1WgSB1suH6ERUjZY5sDLCdZ5akZ03TKuGCxR7Yigx8xKWVfSTfLDEw11oA4mnfHBPQrrLAbJGbXBN0iyfG/zKhwctWrO7h7qc9olezX3i0q8CBfbzZjIiWv0mYAIecuUGAw8Hd24WyGc1qR4j643lSgt0Q8tT4nd2ioHugWpMjHcja0FLJ6gc2LfcC9/Bd4jjmNCo8mMEGsFKhgmJnY7w7IQ//O1cxMYRYMcZvvzj1333gRGcLhT+j/7p68EwYs8CpOSA/Y+o4wFMD0QSvzdcFgCtTnFHz+4cF/18d2rDFT3K4io3PGFT/524ww6mtClHzp2LVEVkwcwha1ccaTS1V15+yzSnjoeSsKvKmgWNO3K0Ne83TV0GW4DwPax9JAB0bO7EdQs8CscTNCUUuR+LwyJtbNCHQimhsDBEkSf17ERe0cqrePcDKLUdSrRVPbhhhIq1dingklBSAYBbs0N3bAiP2XvBJoWh0IWXPqKDvkS3xrmyUPsZHuhEgCWo4M8isfy/V6+ZoX9PsOiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(921020)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aqmnwLSAdLyFMQjIQIuw2z2NhuKw7sArPk2mjBhWFYkwidf8blgPUc2bXuz8?=
 =?us-ascii?Q?gMcYknJ6G0EHXDYvlPZXzMGSlB/tjPyW2vqKSPvHTSOegK8LjnnsJTtU7I0g?=
 =?us-ascii?Q?wO833EUH+sj1FNk9A9NwN6x9tRf5rhHWtlPmkcmjAVLyrZJ3n0lvtkzsT5ae?=
 =?us-ascii?Q?7TxMyAGg38URglQr1XCTJ7nkswiH2LFb+RBRVYxhZgqHyiTcaCyr45FycDfi?=
 =?us-ascii?Q?MQkptSKYoVCBHI90YxBOkJ4wDnjqSPGoqwxslBcAiMmOqxh35B+d0cuuloP+?=
 =?us-ascii?Q?UHDlqE3Iqac0LHea5qqczQC46+b66585G7ihjCMZC46nehEZF2i31rPz1pgf?=
 =?us-ascii?Q?LgfJzz7gVdTxt1ZrvFXgQ/N8XDEJ5pHZF/w9jqy4aTmf/K4EuVaECAE1qMu0?=
 =?us-ascii?Q?yHUAg4MmXzku8LsOQRd9u21SPzp+Tm9hyKaLByujxbGiEZSvIfPxmywZH53m?=
 =?us-ascii?Q?H9xmaZv4+QTeOxVLUzynmdZLAN3DDkuLZU4q104L047eGHFdTkaG6RUrMW5H?=
 =?us-ascii?Q?Bxjj4jM72E324Tr9WXoHErOVtdGTQYLHPST21bHhWlfx474YIDBFX3zRo3k+?=
 =?us-ascii?Q?DP0tKTl6MRnUvVccp6vuedPu0t8nLrYcJnrnHNhexWG5Q3HoLWE6nWV3hIxk?=
 =?us-ascii?Q?sdppEEacwGhHnF8J1ONlvOf8kW4qlfMCcxC6oqBk7HZaTopdwsCZO96a06eK?=
 =?us-ascii?Q?mF2zxn9yD4yhvvHslqEpwwpw4fvT+dZLFyWBfMjK4qvmc6HpKsVNMR+wsqxV?=
 =?us-ascii?Q?fEa8YbmG8hYPbBTTv42eM/DPm5cS0n0YL1tEuIfB0cGo9n9I+4TewGqaZtSG?=
 =?us-ascii?Q?hp7MLXNLaZcN5rjFa3PYkGDk36iALuO4/pz9wet+tCR2CiRdDMEvv2lz7Yg+?=
 =?us-ascii?Q?wXy8JkQLIOOvKCck30Ey7JVh9g44iIemv2KRqZ4S8pQy6gUKif5WFxLIDGR6?=
 =?us-ascii?Q?eZXVQOZyCSYTqIP70FzFTsfzGaZlS8+0ckyWvyStNNxHWcunh9Rbepx5V5OA?=
 =?us-ascii?Q?kxpbE77S2UUsyDcnBYfwtPcCutFLyN+17gChd1oEUoUaZOk8D1zoTZSAoMvI?=
 =?us-ascii?Q?Q61h3DccQCaczv6J/Cfpz3DIcYa7Reag8QjgaYZdVXWRqpTZOZi/JrpEPoLE?=
 =?us-ascii?Q?9zOqv7ozR77WEC5SiDOmN3Nsq/yUj4oZdRggR9rc2x0jxfG+n/Ve+3lX9KMU?=
 =?us-ascii?Q?BeC14qIF0grffW8HZl+2Q9ORC5iNfDHKdyOy0N+plglXAc/PSi9rIuTW2PjA?=
 =?us-ascii?Q?bRjK+eI3qTurRICLB2lsUAeipOlwoBLFfdUN+5TfSToNixAIco5QMja5unhu?=
 =?us-ascii?Q?7C40iRnBklI8gW6uw/y/fr0jzdsdQbkfTGlHPssDzhAkv0VgV49z6xQJonAK?=
 =?us-ascii?Q?DUJa911lWiwCzVSXkfc7HXMyKd73tHwFfZYLte/wbKyrZMdL69MHW6gmnwqk?=
 =?us-ascii?Q?8AP8uCQUcsUSU9P7a5WntqoZH7ZYuHNbQ/01kj+8egHxcstCLnLfTNVHotR3?=
 =?us-ascii?Q?S5uyXaChTVF2D2dl2o+BU+FGB57YiAKymyNOmTAH+E5AhCN2opqOrCyFz6g+?=
 =?us-ascii?Q?4InD6s7ntWkz1MpfkKyBcPVzoJIpZEMhR76xLW0dzp00/x7CyxPYl2h8EdEC?=
 =?us-ascii?Q?Nz66xbVCII0ZfBD4ouGRIAnu0z0yppcGIRx/WEJqjtVE4kmMFtUVGVfB4mE8?=
 =?us-ascii?Q?SgHPDmAB0hWMBHOmzYKF3xuwZTgoFgC84iAKhkngX4ca4GHiCIZO9PWO+xYg?=
 =?us-ascii?Q?BdkOvF8wmvjcJd5guxayWLTAWLTSbzU=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 99283981-d39b-4152-85d9-08decb6dff5e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 06:10:43.2335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fVFQIjvWjGadAV8/nh6VhKUWSs/CjF9BiBminLuju/XK1QjiC1UdVU4XCDiUsV/EHvqy8NYQkQwp4SQdM+IAlF3uYx7skRs0k5vjn8/Etl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6206
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_231048_675378_212277BB 
X-CRM114-Status: UNSURE (   8.23  )
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

In the an7583 case there is no possibility to route 2nd I2C bus via 1st
I2C bus pins.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 4076bd0261d1..cad56ac3c061 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -1821,7 +1821,6 @@ static const struct airoha_pinctrl_func an7583_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("sipo", sipo),
 	PINCTRL_FUNC_DESC("mdio", an7583_mdio),
 	PINCTRL_FUNC_DESC("uart", uart),
-	PINCTRL_FUNC_DESC("i2c", i2c),
 	PINCTRL_FUNC_DESC("jtag", jtag),
 	PINCTRL_FUNC_DESC("pcm", pcm),
 	PINCTRL_FUNC_DESC("spi", spi),
-- 
2.53.0


