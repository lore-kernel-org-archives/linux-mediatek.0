Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449A0C54F4C
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 17:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twHBjwxIrWHWurd2jBcOK2Cj31Z/XCgTinxT7gVKh+s=; b=DoHoMl+7CSn4OH/TbjnBnnhHCG
	VFJiRjXIsbTtwnTucpI/OvAwDGaM4kDkmTPJbmR7oKe94YhKDOup7hN5B0RUkMl02JUVf0PoC6Pck
	zFl21NtZiHKYgA6f+hUbWA0S8U49S/Jq9fKl39wbUovT4Ias5b7v7VGWDm0Egxf5lTkiJ5COrwde5
	xCIqMENubtLYxCv87pegB1kDcjJUaGDCm3Fbf/z8AB4KM8t3vaIoTWQQhHPmBJQPdK6GEUDq+lQOZ
	rlxf951ppBOXlx4Mb1YfD4qnwhQRHE5DsaIy3cppceZuaC4a1Wn+g1GlS3oK1hnNDzaTRLbaEjXc8
	gZgOvlFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPLC-00000003Y82-0bcB;
	Mon, 27 Jul 2026 17:42:14 +0000
Received: from mail-francecentralazon11023082.outbound.protection.outlook.com ([40.107.162.82] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPL8-00000003Y2N-2uZz
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 17:42:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LqnjLCn4uT9NdFQWDpYxrU+svJo0rC/39tYY6CYI1A/lQ/ylMPv5z34rvMLZRfD+QdzCD09Z4+pW2Dhe174pDVn0XcdTw/PBUSRbqf2hJ40sDj0zlUuEMbPlwI/cse3omOCEqm37mRkAvxbvb6Dw1uG+Yja87Kg+Q1TMi3/PEBpbxi0RjaSv4PiCnVzPGy+cAGVUUhKzcyM1z4B0KOMe3hbM2FABxgeVMwj3nPcQTm7IZCgvlAi8WiSdUxkVzindBzL6RUgk8cqq1EK9G9frV0MyTb4xVo7O+Qmj//qDIFUAbCj1ReRe8PiHwFbcGhqLWMVAQJsMHzdbIjKwCEdyUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twHBjwxIrWHWurd2jBcOK2Cj31Z/XCgTinxT7gVKh+s=;
 b=pnIxS+Itum53mLtaIgIo5UnLpinrIRqy9972BRxxsfGLomV1phCRrRia4QKMrIXKIljviZCjNEtsNXefJp2+1IK46J4Bb4jMsqkqXcdIeojJEcMnAJ7awh1ucqIDkxhh21qeOgMIEEpilP2SyjZMQLmg+wnbxl+MvDqcMtp6/DmMawV2ZqbMb66A5Cf3G+4FvSFwNErkYBoP1GViw2g4IPuNqAx6Gso7WdOH4yBM5/PSha39vGOtelEBWWLk51Xj34C23DLxUGlasTr3o4nKPPUw24Hshu7KKenOaizrpPpi3VATaqrTQt5DCEyL0XnN8XHxBlY+haEwfkZUCy3mQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twHBjwxIrWHWurd2jBcOK2Cj31Z/XCgTinxT7gVKh+s=;
 b=kRWp8IryQQ6MVXh2n4H5P1Sc6CfqjBRVDUoe9GCxTm4oYKdR3liIboZTYs5TshfXrhjDcSDcK8UjXY2qUzawmyQE3az7sU1drlhD8ei4CssnwQH7a3WqXaup555ZI/+/isdv0ZEsjo/wahmzLHDwaso7OCGBFZ+11PWndyS4ipsbb5PeY56igXnip0xefl7B312salSTQidwdT6F0/xoerHqqgLCtz6YtsdsbFFuUSG9AlK6dlG+xq3aOtUqczFAaGZiYfFen7AbikaYz8svG4V6Avzd6npikRovi15MpKRcAIAeg9AOmDvpDvg0KFBHGSP0bP1FOmN2F8+X8/Fkhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB5888.eurprd08.prod.outlook.com (2603:10a6:102:e8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:42:06 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:42:05 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v8 07/35] pinctrl: airoha: an7583: there are no muxes to enable i2c buses
Date: Mon, 27 Jul 2026 20:41:13 +0300
Message-ID: <20260727174141.664933-8-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0064.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::24) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PA4PR08MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: a06cba7a-7104-4e97-3f48-08deec065fe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|366016|23010399003|1800799024|921020|38350700014|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: NrNy4/9TPBPfkdGB93hUgqFXBzjzIVSIlSxub2G4G9hCfAp8/j/IdkNWdx+nHX79bersblkw+gVis17fV9lI9AOfaIJgHLGUOUv6fgfrjcOMifhYvtV3fKF84X7VxiAjV9iwyw73ezR2TJgA2q1NGcvtZEVgHuSKRTxgfFI7kbsGJa0zcW69l/RNn20W/2lAVqzWLZe8giTyUcbeccZGUmOcfr3AaPxfa8wBjccQb4b2PIhtFkUC1mVF0dAfpKDTYR7+h4KZuFXbhYGeHfCucKcCnzai8FO6NVAPuzylXzJNP/kjoel9n/rSaf4qiM1W3ymn1W3t3BBhKXBUyoz8D45Yj7bLqDjjg5p1oJhatC9FxXU06Vm+kZPsp4ETA7bz8JHRFBj0XiibeBvWsIdnjRAFNtUa8eeGZVDc1+DSWLZeoHrjjxjmqulAH/cNYzIoo0oGA+foGipYyWIzmNSDTnqLZ1Nd4clY1JxAK9R5Fd7lM0p4KnvzeEVWekxPhljRVQNCwAz5YonwPLhyuz5uQpysmdMw0PPnTzn23td2eCEO3iWVuM6tosTnqA65snB8TYqjPiCf9sFfbG/w2ORwl7guVqhfURKFYRvw8Zls12faZYK31HK+qlhY6pf2ANZKz5QV3ZvNCiVyxOFFB9KTjh9ReuXFV0yO1AHBIUAuj8JA+5M/B4RD8E+pI2TptgZrgb/dGRoRQqLdi7qdNQ5z09HxksAyr52giTFFnpn6nl6ZISXI/OgFnCC0Q15Ju7zI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(23010399003)(1800799024)(921020)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AvIOh93l30+9om7trrY0iMHLKJclQMkX4vH+xAsl4QL9MLwY6zO3JeP+Axkl?=
 =?us-ascii?Q?eeBO4KErGQtvfhIW92/sl99RTGG6oMvIdEgUa9P1qjMvuGC8vqdZB6vpHHX6?=
 =?us-ascii?Q?OfYNfJxKJKHyXgbAYojf2elyZsKS+j4TMFvsB55tRK2R5fMSxmBnCUTxmIOH?=
 =?us-ascii?Q?7ChKgNukkfX7DsozWfqzyCgXKBn9QLG5qmTpc+s87ww6q0Na4kDCMHWbSSdl?=
 =?us-ascii?Q?tceetfGxb1KJyxHenYcYY4XEYMtZCyqRy0OCPFtgvt3G6I/JqZt/IIrjrbMc?=
 =?us-ascii?Q?dPOhVM6jZKHRiu11E9pZxogNawH7a8sbM4MqfoMt/KX3kEKOzcvkubNhZAQL?=
 =?us-ascii?Q?s2bSiTX6/6pvPfzGz7znH3hGL3YBDKsrUF+9ccYLDvm7ebyXctdvFOvFS+Ns?=
 =?us-ascii?Q?AhuY2/c4x87fq07HDiQeZfQtGlf9QD4EG5k+zEPsKwe1AQmQ/Dq0ZhyA+iPx?=
 =?us-ascii?Q?xjxrI4zjTaT9X1vzcYu2lZloznV48D41nFVNjkPD88TGixd02JNQnS9QfjHv?=
 =?us-ascii?Q?6JsccRlwfSYFjaU6f4hFfXnnRZnT1CX9Lon4tQGF52/21xit3X55xd4VxYF9?=
 =?us-ascii?Q?CkAjYqONyT/O7ps2yEwhzAlTTu+u2n2K2dZaKDK7/rlk7moDckjOR5UZ1Lm2?=
 =?us-ascii?Q?wctwSo6hnBsYUdYtTd+dZyvRl5oO/+SFs39lTYN2rXuCHyG4OfVfKjPfBcnJ?=
 =?us-ascii?Q?ZCiPzOuJscGENJ4kFZycggekNynOziMHVKyeGAuqXWtRzPBeItZMBX00f/Va?=
 =?us-ascii?Q?CeVjmzH44ZyUIjKL6JDh2hcYxUe62RyJ19CANMoHSP4QVo55xT0viXcGyhmQ?=
 =?us-ascii?Q?kRCMDehd0+/tESpOalspC4oQFZ8NCQK+EWa7kJOEyJDauTr8qPWIBcngUFxr?=
 =?us-ascii?Q?7x3d0GKuABBYM+ZhN5Zz1Zbnxyg/Py/SncQAv2jyNniI64Kd6kR8ILkuH2mN?=
 =?us-ascii?Q?TsDarQNfBPg1O8Qy7vwkLbOA/zcky5zG0A8ZZOqphmSA3A7yK/8KvsIBN/m6?=
 =?us-ascii?Q?su+pZ0GKtPwe8aDkgCE4vJR+R0/u+cWbwxyQL9eGOFuAxoz/iPLTlADPKBl7?=
 =?us-ascii?Q?53eFwuHbSWBtxr/ZdDjgnQvSfZN3ltUrr6ktvpgSxyD5PFqhX3PMWKQa3UV+?=
 =?us-ascii?Q?pXWaHECH2QTQklOkYKeBRy4v3LnKxQOMiB3Af7kz1HIUNLnDsr2r8uMsHhEM?=
 =?us-ascii?Q?VqtqgI9HkDmrb97pYbl9LsUK+utHO0FNcuVBL2+E1OsFZdAtckq815rCSJ5d?=
 =?us-ascii?Q?3P6KajmqjrNEquPq8E/rq07YxcZS9SsMQV/BD+l2u99oOUvzhw5aEOqnkYIR?=
 =?us-ascii?Q?ZlJ/XHEeev8NmMv14A/lq7s1xRRO4imWiRO0GMD3VcCI8zjVlTpKcDPWlv61?=
 =?us-ascii?Q?1QkE22O7w8/ZyWErKh+XzpHvfEsnviUyMTZllHJ0DlUpjUWxDuOu94/5m8f2?=
 =?us-ascii?Q?jS8OqLI+TEtKsgN/VGMRrIc68G5ADUBOiINTBWgXXwPV3N0FvVB9iWolQYTc?=
 =?us-ascii?Q?39KcxfTSfHtNAHF1ICEhjH1/XdoHqNUvV/ii9fA+3ezizoOlIQlwmjupYVhY?=
 =?us-ascii?Q?vvt6rLQixgkP64lbstSVVJ99XPkurV+o0kFNJiaJtbW2Ua0HdtNqKaNkGsfF?=
 =?us-ascii?Q?ObCMLvNyjMZkAEY0zZEZCEDbBFu8+bdWTJltUZn8vXvHRAYH6U3njAek+TMM?=
 =?us-ascii?Q?TfQt1j2yOYRYD2d/PIBqIqi46zrtk3tytQ6h6y8liLSbZ9nA2OlnQ21t5mEJ?=
 =?us-ascii?Q?vWNQmILR81b4GdgqYRd5kf04cCc4zos=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: a06cba7a-7104-4e97-3f48-08deec065fe2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:42:05.7012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJ2H1WMKMDcTN2bAilMsemfTnVH/zKHKS9zprqsWHoGcKGuO/VV19BSQysbF6Kphi/9yFEUNDOP+rN/2BC+YRW3AoUeDHm7pRcYJ6Oth4Co=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5888
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_104210_763545_57307638 
X-CRM114-Status: UNSURE (   9.07  )
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

In the AN7583 case there are no mux bits to enable i2c buses, so i2c pin
function is not necessary.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index d743d7fdcf0cd..75a5167b67186 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -1822,7 +1822,6 @@ static const struct airoha_pinctrl_func an7583_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("sipo", sipo),
 	PINCTRL_FUNC_DESC("mdio", an7583_mdio),
 	PINCTRL_FUNC_DESC("uart", uart),
-	PINCTRL_FUNC_DESC("i2c", i2c),
 	PINCTRL_FUNC_DESC("jtag", jtag),
 	PINCTRL_FUNC_DESC("pcm", pcm),
 	PINCTRL_FUNC_DESC("spi", spi),
-- 
2.53.0


