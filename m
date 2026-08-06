Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90352C5AC7A
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2026 22:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUUtL1D30/arAiUeNNdivJiAS5w98hDY3XRx9eiZsMo=; b=F7ygSXoz+VecRVfxAYJkpQFIwq
	/goI5AEstHWaDcY73Q3ENbUHCdHIFQUErhuAx6qR0NzMV6Z+JHbCTl3ofulEYJ6ehZNIoBA2WfFvS
	7hOJvsMyXO0jAQRfbCoUtIi8UnwlP6/Aa8Oshpfa7LQlIyQx5/Ziavy4YSXmcqurBSXUK1gQt82hh
	FLfsETk/AZLZK9J2WF+XLBfBtmZymeIg0UX2/LnNJ12MUCa5zwyG6UBWJaxlA1BP1fs+iL4ehjJ1q
	pcZUVQFHJ793WfDLVSf/H2VcH4mcYWLlzuZoB15SnJeSKamHMt4EyEkPC8TxalK0SSjt0ZiP7XU/j
	ZU3IAt0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws6Ek-00000006lhx-2nHI;
	Thu, 06 Aug 2026 22:06:50 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws6Ei-00000006lRq-2uzG
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Aug 2026 22:06:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xk+JMzTtIobY9ZD9zppXQPKY+/fXSkpPVOW3Ebyxvy0pdyHW1+bpGKL/4dx6Lh/kjiLqW3D2gfHNt2EooheuVsl9yyod3eLmpn9655Y0u8nzYDWs8RU/zj8Uy9NCybL+0fJVwhlFLuu4ROcT8RvNHaheevxKL1oZNLkH/pMOYNp7sdSm0t+xm9jRAM1cMGMVJheQBiZJ4t7R+RXAEn7nP03G0sfL/DJ4aeoOM0FB9bUO/BZrL3xNt4t05qtVF2N6ruklE3Yp81JFQebtB/SibIjYku85E7M6xFZ1sNEAuWnYkanbvCZadfARM3iv6Zkig1C7R1DsJ7/Q2iOGdA70DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUUtL1D30/arAiUeNNdivJiAS5w98hDY3XRx9eiZsMo=;
 b=NUL2OtceqQag17LVNezitWXIFInd5Q6KBBpOTeaOPdMC3DRsZwojLpL2ae8ANsbYUEAvM12HgTos90nSa7xDi2C1qCPgoghhnsjy2N/u5NrSL9GBHDNJrDz2aKuPFsW+4GlZNlUVzAmB1uPwPfegzl2FcLVtQu9z0O3RSZiLsCeuO7qYD+9hpC35ijj+W4PgWVuz6E98T6Mwij/Jm/vhuC3Ir1EGmBzMTsPgtYxFVWyFwAZZGNGmXDnUoLEv2TmohaWr3kGYai6w9pkai1pOERox/qmaAfxY2PF8QQD8kewUtFDsbrBm8wWyjdvsvpGfo+SLzVgoi/+xynXJiUmXRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUUtL1D30/arAiUeNNdivJiAS5w98hDY3XRx9eiZsMo=;
 b=F4PYlBFKLU54hRwlJ7UqoCJi01NpyrZLK/BJzh4LwePt6ArG3rQziNwojeNwtrHPTM8MREPV8PepUcm1nASbjVFwELGux1wvXCO5Tah8HwWvJeHcq/7wO7yDBGQjf1t+SRktU9gJekxvdnCJ8I7wHMWx8vRaJ9cFbEyjvim8jIcmf9cB8lnEG2fmX3i1aM/WIrsMAXrvd5bFQXE740K38aL1PfeAOwxlwUXfBqZR0+C8zfsvLdF0hG+12FwVmob1BBlXYYEg43pBmaRuX6MakSnAcitELWpg5suqyEK8F1gyut0mJJvanhwGabZQuMtpcQSXce32A3dbLiP8tcbV+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM9PR08MB6705.eurprd08.prod.outlook.com (2603:10a6:20b:300::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Thu, 6 Aug
 2026 22:06:43 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:06:43 +0000
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
Subject: [PATCH v11 10/37] pinctrl: airoha: fix I2C1 pin mux config for AN7581
Date: Fri,  7 Aug 2026 01:05:48 +0300
Message-ID: <20260806220615.4078303-11-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AM9PR08MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: 760bf981-fd63-4eb5-5d7f-08def406ffac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|7416014|56012099006|10067099003|11063799006|18002099003|22082099003|18092099006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: MCcHL5JtKO6eMBbtuwjRm2/cBBdX+eu531vwgD/Fx+PDe3wtcoiRh1qDud+QOTx+/b8fdEkHq7mnJFLHuCiZxCsuSfLPAMDYDrRGJ0A3IZNBjBz9f4RXBHNE8UcSyjp/swWBtT3u2TmfZt1rKFajgU0kyaegB14qKT7wadO+cUaz8lcK5RNVv1BSSbCP5Dys45SbU548ATlafiaSmKjTZ87yh3qcon6k43GbKHHFcLttViDROmj00+sHi3mWd5MqA5xsrbDK/MQtQrzAK516xVuw4J9buwIpLf1rGzxj+UIhoZEPIC4QgKAJTAser4tn17VOW9+RnRnNxIGwTPUtxrErtmpxfJFx2gNzckjAtfmeHotnalkdw1PftrrIWNekxSYKr9ksnNQxN4yz21oGdrWLfH3meTQEOnzsPmFGU+RDQ/BLn2CmaeWIMnnb0Inz+7xH/8CoFxHmIoiPuW2wPQhY9OCFvor5diebPRfaRPwrfp+P2W+Co/TlX1aM4z6tbGuxlpOnzvfhEF31t/ahooudUtpJ8kvFEBRhIOmXqUmpBLoej0GbDUmxXslbVlk/FoLSToiJo/jR72d6JT9A9TWs6ZMGMWC8/orE0V4n2OruNiQqko+P0zCpBmvxg4jCfhPTV8AnzeK99Thon4AFPP+81037Zp3sTnV2uK32YReIfpdtnosBE69coyxoeSdVHaA3zegq3g0RL/QtKBjET400Co0jPhU/CWrA3VVMng4l0OL4Q4ZE2fkua6ulgjIm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(7416014)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(18092099006)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GnRHcKgAOngZrnfCSx2S+G9QY2g+NjJ0q1v9MbQYQXMOJJ3KEPm7c9KexSfW?=
 =?us-ascii?Q?cfcIc7/hpg2ESfqkY1uDUynPUvKUvdLHMP1C/ESSkJzFu9unmKtsAwFuDFdG?=
 =?us-ascii?Q?W1J5I4dg7YwhqILONZzm0ddO9z6tnBXAa6aOn+Iq11gLT6kgjdfL0oXiVvXV?=
 =?us-ascii?Q?5+pFC8lMjHdvUmAjbIUbAnMtyEuUGoJCEdJbubF0JkevivFYj/YXvhZN+T4a?=
 =?us-ascii?Q?jYRRaZt1p4FKtWYCQVOb9bxr1EebT6GXo+FA2mTez6dcw3ON3YNc2BX0abFo?=
 =?us-ascii?Q?9N2tP1FgELBXPZMw010d8Um/mckjqO9u7z0rcUVoQ4cRebMGlmYKbdeFE9qx?=
 =?us-ascii?Q?U+CXggKxeGGEPA7eFE/94ZB0pAGIE+O5I9dkSCmNKrhO0NihWyh7t3b1p8ia?=
 =?us-ascii?Q?GslTAs31Zd3TZjtzsWDvIu8Fjakm+aqzRy72UvE8pVIaWfeqQ9pxUDXjIpBs?=
 =?us-ascii?Q?K3jm49W/rY4buWoKSMR2QrCn7X5w9BAr7hdgsygW0NDVWJTuZMtWGOuW7l7X?=
 =?us-ascii?Q?S1f+JMEEeARfHH8YUTwGExi+nj0xaZwRAuwW5g7hF8nGdL4qiEwhfqEXUbiO?=
 =?us-ascii?Q?0R34eyF/tKv+7DPOeH331kYSbvfG8RJR9zgcWwcf8AaT6AvEjLusdQSoRl6n?=
 =?us-ascii?Q?usatmHI03YNyIFkD+tvpGMnDejfnBIoIsbSyOvSG8Gs5cvb6Hv3Fw1WsnEIS?=
 =?us-ascii?Q?orCvJDawvPdU0pVa0RSqYHds0cH+Pl7/HfX0lLb8fURPxTLa4mhxfobDAPLN?=
 =?us-ascii?Q?GSTzGyFcYbu1fFkW2P0BnMv4wf4AKW6fwBD1UOkfWHoLqD8mVFyR4fEoiMse?=
 =?us-ascii?Q?mjOezIJF9Jcm7avArrBbFl2tbz+LBu7y4kIOQ3FrnycOCcP5S7P8AUAtIMOU?=
 =?us-ascii?Q?NXectg1Pt8fojLNBlKMPjRCHVmhWsUOw9YceWWClfY8OeHuWOA3KlcmJhOXE?=
 =?us-ascii?Q?xEtdI5AHLrRtvd7CN7y5LYhoKILrwx3Uxi73lD1NI7TY9nGb3pRLHSstHmsh?=
 =?us-ascii?Q?Y0Rk1yOpTahVvQz5FkCUSe1JJFWZ8876OGv4g13Ifgd7K5ttEmb0tfS87zP7?=
 =?us-ascii?Q?yjulxPJsgjODtcxSVttO9C3hg9JVPF0Hpet2wz9LUHotpa/aYGQFcXHIPCUF?=
 =?us-ascii?Q?RH/30YrobkSMpyzO1HzGNT49dKqnWu7YR14VVTcj1MCfVMqRJjhBrr+A4cxJ?=
 =?us-ascii?Q?wr3gnIaRfPj3EUNKv7aLX38h5uzOaLoAOt11+8sM+8Ha9x1MOYkXF6lbWBCe?=
 =?us-ascii?Q?vgEBj912C51xTgWWPEFAW1RGhQN3Dzxd1prudiRqtJ3IXnFPdE/n7fTc7yWR?=
 =?us-ascii?Q?VFSecgjTaeit+Mlsn6L0JDwMpqlv7wScvelSXDd1AzPOLJXh/O37HFJl/0cg?=
 =?us-ascii?Q?dByVeskdrl372zoWSK9tK2A7+aOAUysFGcdBZD+L8SIfDgzSeoK+qqbYNW7a?=
 =?us-ascii?Q?PiXvRyNOU6WYVvUKgLvciYtgt6TBlskqSQr/pUJfZUY/q0xUDK9WzgURztlk?=
 =?us-ascii?Q?s5xAdrxTQMd1J0BjxR71Zt4ut9zf4hP+SpLUnon+q8PEOtKrpapaYnTXph4n?=
 =?us-ascii?Q?ehT6gN7vJqPMbwWiSqt7b9NArUEHT70uJkKm9eqOE7aYRAG/ryGU7QyQljcQ?=
 =?us-ascii?Q?fDN0JLoIPOLDSqiAGX5ukwkBdi/2wO8avSkVNlAuXA0xwVwzkgzUin8hmQHT?=
 =?us-ascii?Q?DUu7IdKCOLQc7qEc37LqxP88ycyD++XfTv7WwbdReevOAUqTbN/+hznYLJlJ?=
 =?us-ascii?Q?y+5YdqO/UX3m/HPCwxLsw8GYdF0h7jo=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 760bf981-fd63-4eb5-5d7f-08def406ffac
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:06:43.1576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8rVMJF42wlLIOL+Hx+oRoWtCZwCvGDh5HiGKScXBaQAfbbq+4dTrGs7So5WcbEXhFPaw6hlu7+0XpLSZyoo7ywNkHDgnNa7JJs85yfnFJtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6705
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_150648_732812_CF0EDA4B 
X-CRM114-Status: GOOD (  11.01  )
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

From: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>

The pin mux on GPIOs 1 and 2 on AN7581 supports I2C in master and
slave mode. When selecting I2C the according bits (bit 13 for master,
bit 11 for slave) must be set in REG_GPIO_2ND_I2C_MODE.

Fix the i2c1 pin group to set bits 0 and 13 to set I2C1 master mode by
default.

Signed-off-by: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 89979a2c0e357..db6644bcd3aba 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -1158,8 +1158,8 @@ static const struct airoha_pinctrl_func_group i2c_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_2ND_I2C_MODE,
-			GPIO_2ND_I2C_MODE_MASK,
-			GPIO_2ND_I2C_MODE_MASK
+			GPIO_2ND_I2C_MODE_MASK | GPIO_I2C_MASTER_MODE_MODE,
+			GPIO_2ND_I2C_MODE_MASK | GPIO_I2C_MASTER_MODE_MODE,
 		},
 		.regmap_size = 1,
 	},
-- 
2.53.0


