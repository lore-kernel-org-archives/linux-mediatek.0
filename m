Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D61CC54F4E
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 17:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wD+lxUNPuCtHCMY+8aJM1Qy/t5a9qx/WpULHltCbXbw=; b=W4kgf6AkT+NB7i/tM/RWgctS8u
	sFqYa7jsgz/6SOMYMEzT/RUO6ewH6P2hoVsnTlNnDm9dCm1URABSwPmTcneTEpxSdogQStA8BWvpu
	VHut2jIET6SU/SzWRv229+bshUhUP3z3Es4lA2iq9PsHekuVvCzDnf8yNpbirdp0iuMKUM5r6RN9N
	4zAT7JvCNhXj4jMG0tZAkIpVD8OljuSh8rPFYk0ex+PmO7LwSfFSUL4JPPkM3YwCPVLcR1CXZDmmn
	Lu8p/1+CBXLC7ml5k6D1RfPX9W8CzKGQcpKBi2gNTzU317TsxEjKHnnpNGYMakGUhfUVVRF6TWHy/
	wMY2oXTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPLi-00000003Yhj-3FkK;
	Mon, 27 Jul 2026 17:42:46 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPLf-00000003YXE-2wyY
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 17:42:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=av8gg7ZUyP0a61KVXxxBghTZc9eqdfLHashTp7cwXFcdwdKtbkAO5Ul2h9mDkRYyVIFHBYg93a6HK6xko7xQG6MWr8pg9AoWpR2gf3Vsv6kafJ37qk5qda6GJeHMgsdgKFc+zLSfHm8Kat2NiCjRDp/K1La5Kfi08UDKzSlcws9wm1EfVi1fNmmufgTd8d/JhWAxtrlyuk6BB08y08m9w6T6KWlogFcNWxWOIX4izqBuqNLzh+rtNys3/CFEMSwgj0n/GwXz6IrafzX1sIslJHBlz4tnlxsOdQCE7c5rXs7KxYf+tE5Xx3rD4Rb8JqDGEKNgODw2AXDiQbUO6lWvNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wD+lxUNPuCtHCMY+8aJM1Qy/t5a9qx/WpULHltCbXbw=;
 b=ANXo/iW3wNvpu6ggdAoxkEZHMgixZYd+ktGLM4e3t+doVx2Ui3dmoQwIXMo2SsCNE0MlWQCYLeOTBIJhnrTiLNPJJBBTu/1Sn+x2g7AGFPWEQlo1HGqtXIig9XaF+fhPjv8KLsK6xmCto77T8A8Mee6l/KUSribuFAgO3bM9OberLPgtrIXrlL7GxOSSIgZJWp6mgOkuiiffBiieSTbN165Ww5d7GvvpYidtWd4WwiPqcEWMmhVVfOxknyEzmIpnsi/3vtgeo7WyKBSOkeTbYRASkrcoZV4qK3MqZEe41j7P9rqv01B/Gx2mQJNDx58jJhCvVd4DNO9nB3qBseHIkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wD+lxUNPuCtHCMY+8aJM1Qy/t5a9qx/WpULHltCbXbw=;
 b=CV3JqKbsLhY1H8Lw0fEVGqZTJZTtIv2ISkGyhJG+PU9Ne7ngTHRexUqxiQ9aNqyEhE/fRlOYRCBc4v1l+G+g9d5/jH3smK/dP1YBQgT97Vjd6xPubcFUSrrX5PgFzmFUEQ5e8kwBoTCYtLd0+BXUHwSyO6EubsFWIHaL4RK/cizOJddzT6JXD3JORW9Gm/OFhJvd6wslqgMxN3+GF69ZwGgp/z22KcCX3qEgbWcSGuVJRrro4LhPF1/WT+8dELedNLZ/9mk8LkytnD06m5F07A8+Hx0BTNcA/mbqKppkjgaRC5gcHBSlmcYGaBSGn/5XhWIow+pBdpSJhX7PWlT3mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB5888.eurprd08.prod.outlook.com (2603:10a6:102:e8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:42:35 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:42:35 +0000
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
Subject: [PATCH v8 25/35] pinctrl: airoha: an7583: add support for npu_uart pinmux
Date: Mon, 27 Jul 2026 20:41:31 +0300
Message-ID: <20260727174141.664933-26-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 5c76c6a6-91ce-4e2d-72ce-08deec067192
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|366016|23010399003|1800799024|921020|38350700014|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: wMo4z435cf/jPPRDujfkEWhQepQb6AdByg8UFeRCCmnw4UBhBqMwIRi9KOxeKAoNFtXZ4ud/R8Kc7V0R2kEZjrfuQyzRuT9BnxZLVOoTAbv2WbjYM/yk86H0of3lGY+7zAwi0a8Lek0vF5Cp0uz6SYIzBYYycziQaSk+fY/MHuzgHI+HAFG0SjA0qrA4wfq6ODyA75cz/FoOfykibflnFamTQ+kbhg0FRSj7U/OPcCLJuuVsX1Ma8m/3GnKOCOqWt/uHrKOyJ+wlJgFWl6rNoiROq1RJ98rM99P51Per5WMa2Yvsdaw3d4AKFuSzWEysyLsnHkRc8VBw2/Q9Ut6Jsg/g/1T2eAVlgBjoFSJELUA2Wn0B4Bk0ICreTqsZyk8Me068M8fC+SLrrkTa3MC33mHDpjPIWKRQoJsen3ZXRojKNX/fFNg0oX8k6YxdC/WghhthQa2WU4Vu1nZdNVs6LAgQb+RgabGK2zufloN6bu2ySO79p3SkGBwAHDT6I4p4yyba3fvhwYSxfRPkwlDSQT3jINV+W8wfOXtkei0Qne2cguprIrb9kBRA8bDaNb0X800lkZJdezraNEJK+PD6tyHYwokP/Yllp5Sud6BnVXbhNJTiad7ITX62t+KG13D/e0j63xEqLyUGFFD9EEMAGyVmQvqrCuGN2ZLsuMSF8sVK+Uu6dnWUyz2+GVMhy1/czT8TeBbFDZov40Z2lRJDymLt3sXeJrdI4BFS1MXvRhVPuxxj486CYdMRzsT3k8St
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(23010399003)(1800799024)(921020)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fj1Jf/yQdiZGQ3wARF416f6PKMudcTPWsiQ5vxb39jZrJ6CVsEv1dmLNsagR?=
 =?us-ascii?Q?MpdWBHKVN92XTWjkmGs6tMiMkPxUUTqAM4kVeCPd4xqTmHZjUMPOjHke76GE?=
 =?us-ascii?Q?sRU2fTESfL4o/84ZLYa4vN5pbTJBKrbMCTnqvtnEILYvgtvMXdwN2QyC0cDq?=
 =?us-ascii?Q?Ckbt9SIaitqmSrS63tQaPPYp8FoUvzaWb2F0D61nLM3zLTACWZ50GSSSnSFA?=
 =?us-ascii?Q?tBPuMHsqX70sVUndR/g4g4EgbRWpsZGJGXZOrfGsdZyklkT6zgPLDTvITd33?=
 =?us-ascii?Q?PGntZQBXz4oDqE9msQWQebIqJqMwmApECKjJnebq7Lz8x1rg09u09DfIw9JG?=
 =?us-ascii?Q?JcpkCnTsgZqWhpHA7oXPEkCcuHhYP22htLyZaTnpJlx0EUl6ztA+w89DGMRF?=
 =?us-ascii?Q?r6ieZxIibdEKj/7bc92y0IJKaOqHefN+4BTksLYaqfAPIflEaxOy0yvCPHah?=
 =?us-ascii?Q?lDbhHLg8yLpu6W6AwxUlP1Uv20hqUKVt4YAZEI6kRWN/mmuz2p3GI0cFygiw?=
 =?us-ascii?Q?nUoPRaeDCdtO8lT456ubNXMArrhRtrEv8D6iVIT31yEx9vSL7o92r+0ooMS0?=
 =?us-ascii?Q?XWOjzn+hYumPKdr85TMUT/YYWkiXQPpl73SvKKhnP9BCVBafRmjWIQ7uAg7c?=
 =?us-ascii?Q?jHAFxS5hsdrX6xPfH1oqJgd7y8emVXwsHfEcSkXF88X7sFGxBcvlfOex7TUY?=
 =?us-ascii?Q?q4deqVapyW/FITP8IWLoP0kbg4JAQvAX7VxC3cDHmAaNpAGDgbuAW7rPjRUs?=
 =?us-ascii?Q?4SveW95r4VQgFH/SWoD9H6cnIa9ojmElvDXQ3JYioKUHWXGdJsaiRnPMOXir?=
 =?us-ascii?Q?AP9J0ht5KH+WgxWX3HPbx3bjWT/OQ8rUNvzq4dpHK72HBMBhDtSBKMHHH48O?=
 =?us-ascii?Q?bxScujJl/w//ekIqXdslSXquzP3xt6uMG3tkvm1vB8RLUWVJH8iHnAtQT7im?=
 =?us-ascii?Q?MDvWio1v/VBx+n/toGbnP4nkcgkWBVHd2nQzOqQIu+yed3snl6PHLTCDSpIu?=
 =?us-ascii?Q?U+5J1Oi1fPoc65O2uycvxPBW1YkkEmCGYARADzX2YtoQ/r+QRlxP9FcJxgDT?=
 =?us-ascii?Q?/e5uYnPwqkIHLaJwCmWT9Nnt08BRZ8bVQG3ZpB8KGIk2XHW2A+LXBmb+WcQD?=
 =?us-ascii?Q?spBgnhVUIYFJxxmlEjrrwu63C+hnBAYrEvCIN2Tqw4ZTwopm3QsI6t4eOwoa?=
 =?us-ascii?Q?Vp9JVQHE6V7Kr693Jm9mTPT7kw53R5WzUU5Y5ioQvy7LPWLczieiA3W+O+6K?=
 =?us-ascii?Q?RU9/cApFjC73HFIuLUWpydhoLkFMt2VqotYpG8Aq2KhVECay4tdo0yjBXkIY?=
 =?us-ascii?Q?SwXwczu1w1oI6uOzfczga33EjcRbm5Ty1BbiILOEC3Rce4Fd2MyiX2YYUSv2?=
 =?us-ascii?Q?w+cYrZYpQLOIch5Z5fc16DGnq3ZEbkl+F0SfyY9uhAuW04UeUGodjXawC9Ml?=
 =?us-ascii?Q?oq3K/DsyEWZ4ZUQLk+g4n0RLn1E5Wz4yK3GHeMKA1VJnhIpnloNXObjCiqVf?=
 =?us-ascii?Q?uSNIR5cyM3b4aZ5eRnnAfpT2SCla47BL3UXdKQa7hH33uDqR9k4YGSWvOSDU?=
 =?us-ascii?Q?OuS2q3wusZcwH42cFwTaKuadcgqhilgSKRnP3JomnV6n4uTmz37NZPvj36XV?=
 =?us-ascii?Q?MTdiONrGS+QIb2YQLgpjirtyjYA8dEBOlR/kewZsyLZrC25uTGPRMp8w/1MI?=
 =?us-ascii?Q?KR3hZwzWP4EvwrsBQlKx38+e/iXRKfO7OglV2bsac7j/R9QoTzQWGRh5J/c6?=
 =?us-ascii?Q?AlZnXlqCbpN3q+jTAYNP4vQga0EfGus=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c76c6a6-91ce-4e2d-72ce-08deec067192
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:42:35.3910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7nkLyy/4lOJFklVljIm081AexL6DXciPxjqhG5ddJe30YzT4jsuRR7sNjMzfpUyGDHPLa4y4Ph6CkotC0TP5kXnDyNNZS6g1wwBGwxrvahI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5888
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_104243_827286_ECE02F48 
X-CRM114-Status: GOOD (  11.27  )
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

Add support for uart pin function for npu_uart pin group.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index b0b1dbbb4d768..9b5c7ea5e5472 100644
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


