Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C632AC47DAF
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Jan 2024 12:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rKndGcaFr+VI64e8Vu/mjV/lynKbFFTYkXoRG1OAVK4=; b=ywLmXc83hhH9uO33qq6iexrTN7
	enkUypWVOtzQyGTbgpJHbW/8PRP/XBpKCqylQcV1VG/j9wRs3ftUFg2yT5goF5088dUTYCUUGUY2X
	AX0QzpP9Y6Vt9HMWwndshXDY/1HEc9f665MLqwbv9tdeFcjCxNl5tgAOG7i6mVuwHZyNBOXoPFhfo
	W7NVIcYT4S4rCILiRjPh73sBiDcbJWP1EIOtn2GPBrS44O6ZK3nwAQB5hD37sp3G8nWoi86X1m00/
	APWb9nqWi8X16xUmKpSV1SrKY04ua55lDyy5IKaiVg76HFkJpFfPUpeRti7lCmPgj/yvRfZXFwmdU
	GsMXsngw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRX9H-009WOf-1k;
	Sun, 21 Jan 2024 12:42:03 +0000
Received: from mail-tyzapc01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:280c::800] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRX9E-009WMM-1f;
	Sun, 21 Jan 2024 12:42:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=alnx7Nv66GqduNj04ccav/kWiWYcOXIhyUcQdyv+shqf4dfFiB0bSXI3gPSO0xnIj1X6OxTRzWb/sASzzdN9FYAMPW3IQrjXniF3xUGdRjV0SHtsO6PZb2avciTEt+xC6BkKU2ykWTMSjHwGRz6fF+gbgM25yALyX9QORFwwZ3juf0aNVEYO3SfPNx2VBxJAis1KxkXEDsD4b3Ra0HgUaRA1Omkz8vgMBN53ynrO+ezKQvoPRTwkw9nQQv2OMFM497JSdQHRJcV3furu+65LN4tCsJRl2RVf/4j7nQVFlLQ5Sga66Qq2AVaFSdLYhVpISOtlC0i42WETv5Zy1Cv5Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKndGcaFr+VI64e8Vu/mjV/lynKbFFTYkXoRG1OAVK4=;
 b=KIAEHkmAlANsfn4ZCm3quq+tRSF8qjMX1bwb2Aaj8c1ngDDBJ7Pgn2hDzts0DG50KdebS1LV4ScOn/nyAgvvQrlzIucPj3NOsArAMoz+4qtavoEHE9b6hEq4NM3TqrmgRzrnmSbeJb6fE3jJ04ju/AV+jnGhoqbTy0D1ScjWOPxZpFWxDw4ceaFrUW199HsTvk03a6F1aXpCwTEW7NWrV3tRcqyk0ic4coAIIF1LudLsAUpkGIiRuObpa2XmKt+fHXTJnoGFLciBNRODIH9gPdkOCYWkVN5bmH4q+XSKsXAb7TuzDLVov05yYbnLbZp0oZusZB2hP6m0GJFQwisJHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKndGcaFr+VI64e8Vu/mjV/lynKbFFTYkXoRG1OAVK4=;
 b=Yt6tDlHvb84ZJGL1HPx2Xu1tj40lgCkhwYfVyAdpPbxrFg10RGO7Upg2slibgjd9IlRAZyLRwRv1Ysk4zuc2YxWpJa5eAFq2PW86pIZ1YZDTCJa85bFZvLqVm/LaZ6UagBkfPmpGS0deiLX6oL77+1PZkTMzvxcsHG2J73jgWxSWk9btL9eULTQqXxSOi4ZdZyn5auXc3RMlXWYSCR07OupYShqrzCKaa0RNSI7ZxTMbemtq3QpCXEK8ScqsDd8DukmjER42n5fJH4eQuInJryaXyHOB3E/iEn8gxKoOTRtYrJrEiYGfO7H1Lh2zb5mDMVcrDDqH/ftjJZAEdD+IzA==
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9) by OSQPR01MB6119.apcprd01.prod.exchangelabs.com
 (2603:1096:604:27b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.30; Sun, 21 Jan
 2024 12:41:41 +0000
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::bcb7:50f4:7a16:4ec0]) by TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::bcb7:50f4:7a16:4ec0%7]) with mapi id 15.20.7181.019; Sun, 21 Jan 2024
 12:41:41 +0000
From: Ziyang Huang <hzyitc@outlook.com>
To: mcoquelin.stm32@gmail.com
Cc: alexandre.torgue@foss.st.com,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Ziyang Huang <hzyitc@outlook.com>
Subject: [PATCH 0/8] ipq5018: enable ethernet support
Date: Sun, 21 Jan 2024 20:40:39 +0800
Message-ID: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.40.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN: [ert9Mh57VppqbQ2FUxLhaMiZ3rYoe/qMQBXWesUVLUI+xdghwV9kEw==]
X-ClientProxiedBy: PH8PR15CA0023.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::22) To TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9)
X-Microsoft-Original-Message-ID: <20240121124039.3328587-1-hzyitc@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR01MB5556:EE_|OSQPR01MB6119:EE_
X-MS-Office365-Filtering-Correlation-Id: 085daddb-4539-429f-0f58-08dc1a7e50c5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kSfuwsfaLKSVFzAGt7VVfRCVyh5JN2bSPQGKTX67Ch5P/r5g7zXCdgOxDkBPE1iCuqg48/VBdYM2ksBukBxXDnxKGFX+yb2BlYE7UrWCUqd4nKuq0NseqlNxbbpixMA30TbOaN33zQ3TpReUW2qmRNzBDCU/gkDAi/8/dN5TR+deUsl/D2Ri7OJ3KY5VN5KA8qhz8g3jeXbYqW8etWjbJq9ZGe/ehuhZrReYWh6Gib+Od6XdisdJ6yp+WGOlBVaZQZku2beFqWHp8dYhB3k5acjjAiBRu9gyDSOl1bHDzbvV9C5fF8LMhLUp7F59feMHvwYGAPPPAG8fUi7LCayKGpyPxVXhgR6dh7HeYMiZwPapRG2SPzPNVwla7S2Lfcym29uXlzdKIjkDxBuPriSFEmp3lhgme5qcwnO2/xunoKrdwmY5sQBIYeYD4WSxS2Ka6uAuM44CvCy4pIj04eW/p2i2dIZBrpf704c9WJwzZkC2U4W1fjW6rAnsYOxhvSwUzcJW+IMjFy4Xprp7twcQMo1zkuOrzr/tmswXe0N4dNys7PbxwGeiIol0JCf/yQVPiJuj4+bSAExGICSlOkOV1Uf6A8vQMfrYvZW24lHQVr+3BQSpRAQsE61nObyc58W/
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aER6S0kzYko5UU5NVFhCd3YwT2lkNVkzd1NlVGJOeGg1b3g3RFc0QUYxOVRl?=
 =?utf-8?B?MDc0eXFvM1AvQ2JpN3hwbkpoeWNhclVoS3owT0lheVpraVY2bVZCbHdRNEl3?=
 =?utf-8?B?NVBTcld0RVVncWV5VlBvazRQQ3NIV3dEK0NZbll4VlJOV2U2MXhwekdRMXZ2?=
 =?utf-8?B?QVg0cHRHdk45ZG1JcnEyVHZGOGtsb2pvNEpNd2kvZXJvRkZUQjR0cU5DR0Ji?=
 =?utf-8?B?eEhVZW93Q0lEU0c2MjhDeUJHUHdHeXh6dUZSR1NsZEpVc1hHaytueVptNWJy?=
 =?utf-8?B?dXRzR0l6T3hjU2ZDaFNLZnZsQk1INzM3eVh2MTBWcGJtb2x5UCt5dEsvTlg1?=
 =?utf-8?B?ZDU3RzhVa3hmZEMvdWRDb01pRWNXKzNGTmV3eHRvcTR2Q0hDVmwrMXQ2ZE9r?=
 =?utf-8?B?NzJ5NWllUDRKOWJvRTFvSGVBSzFBeTRqam05SC9uV25VZ2JFcys1bHJodnRm?=
 =?utf-8?B?RzhLZGdjc1FHbHZ6eUhnRWRJaGpqa2RxSWNOUVVZNkdTTE1Ld3czNi9GbWFC?=
 =?utf-8?B?ZStJV3BsR2pwa0tuTXN6QjlpMHA2K2FqRkRxQUVjSE81TGdERHJpbCtyc1pY?=
 =?utf-8?B?VjM2VVhoYjRXUldMNzkxK2VNNHk5TFdUdllCc2hoQzdic2tjSjdvaHZNQkx2?=
 =?utf-8?B?NkttMDhXTVR0MmpEUElUN1RLK1hSTm13VTcxcGdnYnBvRituQ3ZpU0pXb044?=
 =?utf-8?B?dDJoZWU0VWh1dmJIKzdhM1NhZEZLQUJwK3NhL2ZsRDBwTHJ3MDJsdkZ3cU9h?=
 =?utf-8?B?NksycFlZRDNpcm12UXR3eGxRSHhWR2Z1cGpNbVRMbHNqT3p4NHJKOEhHUjdu?=
 =?utf-8?B?OWVQdWFyL2NoZ0MxK3hPdlZWMnVTVmlwOHpDMFFLcndIUjlWN28rUFJ0QXYz?=
 =?utf-8?B?ZmxiSklHWUcrTGxNZ1ZDOGFCYW5RbXNlMXZBWFpIQmpUWnI2c0tDUVViSG53?=
 =?utf-8?B?Ui8yMUxvUjY4eUx6QTJ1RWQ2ZDVob3FZa1dxZkM2SlZjV2t2VDhqNHVsR0Z4?=
 =?utf-8?B?TGhGbFRuc25JR3lPbkVTTWhpd3UzZ1Bsakh0NStPbm1qTWh4QjFQOVhwWEJM?=
 =?utf-8?B?QkhDTUM4L0ZjS1RmZndTK0xyMEhjZUZNSFdjMkZwS24zbldNSnBHVkJOV1p0?=
 =?utf-8?B?RC9nS3JhaFZpd2R4SkNrZ1NRWUp1aFpXVjByWjJnV0tZWTBuZ1ErTUhyL2hZ?=
 =?utf-8?B?Z01MaFBFRUZYdkR0TFpueUN0UGxyWkwrKzhxRUFHZW01UlV6WVpKWUFwZU1w?=
 =?utf-8?B?N2lDSk9wWTdxclB3TDFxQUt4S0hHOUEwcHI4SUZURG9EeXZ5a3ppZzhjc2Vh?=
 =?utf-8?B?dm9CWTdPTzZsMXJ3Y1Z0M1N2U2Z3UlorRWJMbVd2U0hJbEl5ZlVXM2xodFFC?=
 =?utf-8?B?UVJLcFlibnYwcDBhWVNnem9QMENJZUVKMnhlcG93alZHdmw2ZnZPdG5FMFYy?=
 =?utf-8?B?NXU3NlNkQUpxVGtRYWJRaFk4elBvaTQwbmptZlB3V1NWL1I4bHFTRm8ra0VB?=
 =?utf-8?B?N3JzU0hwUERFeFUwaGxGU0dJWTNac0RTWXFGMVp4a3BPSngzTGRldDhWK09D?=
 =?utf-8?B?U1lWVHhsR0FEczZXakpmZkJGcXo0SGFscWxqcklLMjBsSnhUNzlpUkM5NjBs?=
 =?utf-8?B?em9lSE0veThiZFpWalpyNmFTbUw4QlVQWjF5V2NOOGtpSU1JV2lPMDZxWTVn?=
 =?utf-8?Q?FXwKLDwSMFBF6Mm+fiKQ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 085daddb-4539-429f-0f58-08dc1a7e50c5
X-MS-Exchange-CrossTenant-AuthSource: TYZPR01MB5556.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2024 12:41:40.7119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR01MB6119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_044200_577302_B46FAED0 
X-CRM114-Status: UNSURE (   7.94  )
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

Enable ethernet support for IPQ5018.

Praveenkumar I (1):
  clk: qcom: support for duplicate freq in RCG2 freq table

Ziyang Huang (7):
  net: phy: Introduce Qualcomm IPQ5018 internal PHY driver
  phy: Introduce Qualcomm ethernet uniphy driver
  net: stmmac: Introduce Qualcomm IPQ50xx DWMAC driver
  clk: qcom: gcc-ipq5018: correct gcc_gmac0_sys_clk reg
  net: mdio: ipq4019: support reset control
  arm64: dts: qcom: ipq5018: enable ethernet support
  arm64: dts: qcom: ipq5018-rdp432-c2: enable ethernet support

 .../arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts |  52 ++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi         | 120 ++++-
 drivers/clk/qcom/clk-rcg2.c                   |  86 ++-
 drivers/clk/qcom/gcc-ipq5018.c                |   2 +-
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   7 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-ipq50xx.c   | 155 ++++++
 drivers/net/mdio/mdio-ipq4019.c               |  10 +
 drivers/net/phy/Kconfig                       |      +
 drivers/net/phy/Makefile                      |   1 +
 drivers/net/phy/ipq5018-internal.c            | 125 +++++
 drivers/phy/qualcomm/Kconfig                  |   7 +
 drivers/phy/qualcomm/Makefile                 |   2 +
 drivers/phy/qualcomm/phy-qcom-eth-uniphy.c    | 494 ++++++++++++++++++
 include/dt-bindings/phy/qcom-eth-uniphy.h     |  15 +
 15 files changed, 1057 insertions(+), 25 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-ipq50xx.c
 create mode 100644 drivers/net/phy/ipq5018-internal.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-eth-uniphy.c
 create mode 100644 include/dt-bindings/phy/qcom-eth-uniphy.h

-- 
2.40.1


