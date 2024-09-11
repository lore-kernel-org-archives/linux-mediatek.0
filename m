Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC9AEDE997
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 03:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CaspPLTg+HV+EcUnHwMLUvrGkx1xe8uSskvjKYQEtm8=; b=DkyrtHvY81dD43+CxdRvUuSIHU
	SPNWsuntpFZelQ30lAmtA+bmvU/UGUl/6yjf4la39FNMaKu3r9tlSAaVnlg8gR01pmcliChFK+/4V
	zzgbKkAalJLBQah+tkTEa25ef4ksldn5x3d0DCs5UzrEEZM1K2H0NqcHBzVlBL+9C+fwjNEWdYuUz
	Y5iRBc7kt9NkoFpNnjGJ+yiaDdXgX41pPAVmTv09CNa8neNlAddjpVHOActTt7sM/OQXCfkT2oCP/
	aJ1FOmUM3uSwcHqsAilLzBW76xmQispD/w/S2bmJVfliXEmmzpcvkGpzg8VA3/yTSlrm3DGm/b1Wl
	1MmsoY6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soEHN-00000007xUi-3CHf;
	Wed, 11 Sep 2024 03:44:29 +0000
Received: from mail-tyzapc01on20622.outbound.protection.outlook.com ([2a01:111:f403:2011::622] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soEGJ-00000007x1B-1luw;
	Wed, 11 Sep 2024 03:43:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o19WlMps///gb3+FTb5rObCKQPTXfjtZ0Ehqe3xP0gev7jvXaVbZ+BJTlCIU8PAaki2TTvlTgb45fWkpzNmHD8AIwN6uVwXpo+24bKVWJpgMO3hXJrD1mHzE1QoFtJNcNmlCDeB+t4eR3N7FvFwwioqoKRJhHY+Vig9bHoo8zKsY0VJlsl1SB4fL8dQ4kjfgJzZ5WA8SHvSWYZKnGmxr/l5D8pG8wZ7cedlfz5hZiNvMFITpRCkT5N7vWKztjstB/TylsraTrpu3Y92mt4vAQdndIcZxAbRcyAzW0mO0dwjkew2rlKszA5Tl5zDZ87ekBrIZcbp0DYB4TngbNgabyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CaspPLTg+HV+EcUnHwMLUvrGkx1xe8uSskvjKYQEtm8=;
 b=MVBl/SE/MuasBnjeUodT2rrrBxjS7mIbM2NqPiC6oJLyux8l2kCwGBBZA6wIpOcno3l/wTii1MZhJtCxuVCTv4+DTcFWP7jGfRVnf/B0IddSpgNlPyJDrjlsXgWdwm3JW3c08XkxleAZT0UwkK5xkCbDHAvk4AxB7B+ibUNUaaarP0mibvep+0EvMZDBPuVXZQZ2ZGgetcHp7YXt8FJHUbHOdSk9pCHrf4Q6jYqJ/aiVlYh27W/aCE+MxEgY4kTJr9CJJYiAtaomrI2/yZtblnNwD6/fdp5bSSwu1v94MhVbB92Te9kqbyDzG/mt5o2sNhGz2pBUjGtU4tGVrEYCqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CaspPLTg+HV+EcUnHwMLUvrGkx1xe8uSskvjKYQEtm8=;
 b=F9N6gWONxWzQk2Womk5M8e3qLuRvBvaV0CvX6OMW8qptJTSxbqtwMDVGcCxDV9i2qplB24BQrt/D3MFnt+y2Iw5Eug3bnZkrGOnOOQSy6gUdpAIe4cOHlaK12ZmZtYNTwp9WYmSvLgSTA3vF8aQi1Ks2OJZzAy3CIkXgf8I+WJVufgiJW/QA8INTCOsn+oi7w1O7IUG46+Iho8aCgax5Dbf5K/9O8+n7OcvdDnhQT4A4h7UODUPUfPfI0B5S/M3rWWA2j2lESg/gYJl6UthHIvenAKr3+uWiOiAh7Yyfkcc6WH9UJFv+oS/RDTFOg7YG9STz7IizgBm/x2Uz8J1yCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16)
 by TYZPR06MB6378.apcprd06.prod.outlook.com (2603:1096:400:419::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Wed, 11 Sep
 2024 03:42:57 +0000
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce]) by SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce%3]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 03:42:56 +0000
From: Shen Lichuan <shenlichuan@vivo.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	opensource.kernel@vivo.com,
	Shen Lichuan <shenlichuan@vivo.com>
Subject: [PATCH v1] wifi: mt76: mt7615: Convert comma to semicolon
Date: Wed, 11 Sep 2024 11:42:43 +0800
Message-Id: <20240911034243.31596-1-shenlichuan@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: TY2PR0101CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::25) To SEZPR06MB5899.apcprd06.prod.outlook.com
 (2603:1096:101:e3::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5899:EE_|TYZPR06MB6378:EE_
X-MS-Office365-Filtering-Correlation-Id: d5101b37-e69d-4ae2-e8a4-08dcd213d2d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|1800799024|366016|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hmPb0G6I+l3r9ZzkqfhoggWcJs88jTj9QP4xu0kDRditFigI0YOPdZirWfbz?=
 =?us-ascii?Q?uwlwNDZ+kDJ/gl0mT6gQUZjrb9jfNgC1FJBHz1WfEtV1AIGe+teKDFPbPLkl?=
 =?us-ascii?Q?fwUjTkexFBVnhflr6XQAJ0+cc4TOn0rdxF3eOi10KWuzUDSz11SiKKKRnCaJ?=
 =?us-ascii?Q?DCBDqytXflsifq63YeJGm40UisYf3HjU9ShPna+OA9vAYHyzXDXSI21p3uoq?=
 =?us-ascii?Q?lAU02g2910CzyZEW2YGoFLrh3nZA5q+eMQYdZ07hCdL4ixMbZcdot7KiYWjt?=
 =?us-ascii?Q?a/QDQ+/hGEYaqgOTLcHYJSZCytVyxlUEy7tz7DeOU/6nAGIdpQZmOpDfXUwB?=
 =?us-ascii?Q?AT3drgAAwc8ej7Cs5HKJZm/wp8jI/6ZV3AtYFJrNC7tZF6Vnp5Zo0PtB6FXf?=
 =?us-ascii?Q?8/nTYu9YzH7mnHSafaV7iCouRgrMgQ/mBmU5rN5s1w9FNTs51JN7g9EX2Tjj?=
 =?us-ascii?Q?GKKp61S/WNIGYNAnkB9NMJfxbMNRzPvonDXvXvkJMUjubx+dyJDeCvAZgF/Y?=
 =?us-ascii?Q?Ww4AXariJlR1GxI4OIXg0mR2dYEM39r8h9DvLl181Yc7wjOxKyV7/j49ZyGn?=
 =?us-ascii?Q?C+kk+nCPawTiywWXecerOvP6jh5ZoWiN8NOohoM++WdOu6eLeJE55qRcHqJR?=
 =?us-ascii?Q?9rUU76csfrd9ElVV8q1muzLlynU0qEdxNN8nXzmNdRs3wy7KkiON0iD+O6aJ?=
 =?us-ascii?Q?6WYyRUnxH1PMYjHD41F1a1DyvX5dflXh8fEImMwqjrcCofLaxqQ13HhLnP8L?=
 =?us-ascii?Q?322OEkzsfub6z4qy4g8vaCgo+09UxIP9SLBsg40/RPehg8XBAK04lSbnT5Jw?=
 =?us-ascii?Q?L2FvzoyiYO2cDrFQil0jpQ/CQcJo6vFHVoNCl44IjFFGTnbAaUyOpZ3P3I/z?=
 =?us-ascii?Q?yzKwkqmplXrBvsgNKrM/aBpV7mNnJkmWICG+PlEbc8Q1d0r9PWix/y9GMcsw?=
 =?us-ascii?Q?/F8hQl8Yh4DmdGT8LD3wa3O2E4320UVXb4bt7T07RWaYXd5vFDXu5Tv/izri?=
 =?us-ascii?Q?TPZG2Am6bCrR0iYVO05ncEf7WyUEs+QqBkQzcsCrCHRmd2xXphWB+TLv0/tp?=
 =?us-ascii?Q?xqlYoSNbdSMBV8C41KjFpCeCd19KvON72JZQPVVil1sD8nDPvzwP2RVg1+Lq?=
 =?us-ascii?Q?UysTfm9PUQLUk4pX1j+Bhj8zJ0v6M29LcitomNU824Dwot2CSO8gK3ft3D90?=
 =?us-ascii?Q?ZdhnJZcrlRzBca9nBlmjRD/YOUc3JsPdwygMN9fJW9R7yfazWHLlWE1rlQzW?=
 =?us-ascii?Q?8uGPN79+7nudSutEempyEE9cBLxFR4gYn1z6ksXX39uU0vCKlKM+b2RWvW39?=
 =?us-ascii?Q?AObzSHKCC93w4dy5FuzBsVDFSZkvM7YR9LcgH6ax5bUqpBnL0LMbUuCLeQYi?=
 =?us-ascii?Q?EW9r+gcjsKEZ6AYa1/4JdcZIyuXRVqLUtFh54E95MVclrhnGxw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5899.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OsJ83t3sU2+Lh3oOYBSrw7tSImMNZbflBFps/QoHlP2WGkgIKRjsCq7o2a8d?=
 =?us-ascii?Q?NSjFl60nqh7KPv18G1ICRal0eKrNm2OT07POdeZRsQHaxwXtfFu5GyRrPFwC?=
 =?us-ascii?Q?6p5it9tytEI+PcE7v3aNwgzO4qLcQr4MlWJDgOSdEoY5W2SNpANZhxJVV4tQ?=
 =?us-ascii?Q?njuvCOrueVGx5qbdlAW0sInShtrxDLlUvbxhLZN7bIKKoxr78MRMLJjexn5Z?=
 =?us-ascii?Q?wdrlnzCpUsbh/46G81aGFOhY2zfPBwOJE0QxdYlm4/H3I9g4zID126myJRJW?=
 =?us-ascii?Q?lcu0Ls1e/eRjfmPBsNB61JmG7s+VvqgVDrtT3Dgx9/L4XalBlkEetRbb8FJo?=
 =?us-ascii?Q?s864VWcC4K65ORsoCfGd9Xw9r5/Ypzu1Au/7bD/Y23D9bJznrIGTeiFtsDfj?=
 =?us-ascii?Q?clyfCXUjhvJ6pDsewmk3DZEY+hZJmpNYAZHOBOar1uMfilrPTX/8y0FbmRcP?=
 =?us-ascii?Q?ECh/PnaydVNlkjIjnW+6P+xU+4hu9wCksJF+kRcbn3C5BcXhHTf2qaXHHa3s?=
 =?us-ascii?Q?/K5sfRgqa5rXMsrB6b2uVHCqC8rlrGjKYjVxgzq7Eh2QIEyJjjnBjlLXnR/p?=
 =?us-ascii?Q?Fvu8ST5bmLzYs8Z9QbPDL7PbrVJyXO397sp0v4w/iBc++h0N0Tq4Hyaj3tgy?=
 =?us-ascii?Q?wzziNqJ9Rb0MkXj1XAOPIENZa7RU+8kwpnCyueR5gp32h0vL4eghvLE5Jpte?=
 =?us-ascii?Q?Ab8DvqID2txk+UXxjTnxyuJJr4Vh2CCYr3gMd4Xwc4hGJ4JH8sOSfTfXReQK?=
 =?us-ascii?Q?chLzdKw4xuHv5A6GPt1YFhW1BB1XCvyUzYYaXdTJu6BWVEduv2KDyM6Qqa+L?=
 =?us-ascii?Q?bp14WXggoqLhwxdeKQ826JG/MZZZATFEcDQ/qC2P2uxjXbRi6CgtGoPgTBqN?=
 =?us-ascii?Q?e/B89NL37jsD9Cja8T+5MZ6Rib5mVHxkJykd/0Z7klmm4DBG4lzmN17fU0Tc?=
 =?us-ascii?Q?k0HsH6FopBt6OI6hWi9pma0G2ReRzVrNwq3sdMpzCCTeob3ut4Q3f3gRDM3C?=
 =?us-ascii?Q?tHROlaRXx8u7Jw2TVF/xme73LMQEAXUnOuYYoeOZ9I4skAEYS5cYvfkoglD1?=
 =?us-ascii?Q?qQa+YYge3NfXtuJqk8FgGxBPPTfzV/tO8/oWvHTprE0Igyx0fP+FLr2sqDJK?=
 =?us-ascii?Q?ZRrcNQIPz89xPvD/I5pE76rZsJuleHdyQE5sWB9Nqw5m7bpaf4EVkFFOHtAA?=
 =?us-ascii?Q?75Xf9rk44nhFgmhiiYB6/6iNyQGvF41aCH86uJJJXmbx/CAJWWUbURIklnqb?=
 =?us-ascii?Q?6I+bE7xcnFa/vrGpKPLQcKOV60oM+QIHwi5wATUaAvcJ3a1DXRUIdrY5GpOy?=
 =?us-ascii?Q?NzkdvOVyHxJ2gzaaKB8lfoAEK9essor4sJk4xz9mrarwwK/xxEo7sJlpDKvs?=
 =?us-ascii?Q?JnU6/jwN5NFuTitzShaE1cqiM6xbhk46efo7DtezN61vTFJZwX6JrhXUAHPI?=
 =?us-ascii?Q?5QSAPw1KEY796c2LPlg+IbZ+3wHIZXvRffAlJFIWK8uy8kptmhDjKwFLZU05?=
 =?us-ascii?Q?d26waIma9Wt+R2RycpNC6+n3c7cQxFKIFuU9N1hBPRrIytABBacDN13gQqSV?=
 =?us-ascii?Q?GDZAMvGJ5b3KDKl223Zn90mdgDp61Svg+dhQtjDg?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5101b37-e69d-4ae2-e8a4-08dcd213d2d4
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5899.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 03:42:56.5036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 39OHNEKA1EiQoytvvqy6ltLXjA/kKArjmAVo5d0LT0/992tSByJf9kz+OPzAzzZXGHqBwilQc4JhYfYdorsHww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6378
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_204323_492406_BB3389C0 
X-CRM114-Status: GOOD (  10.05  )
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

To ensure code clarity and prevent potential errors, it's advisable
to employ the ';' as a statement separator, except when ',' are
intentionally used for specific purposes.

Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c      | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/sdio_mcu.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 96e34277fece..804d3f5a5244 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1700,7 +1700,7 @@ int mt7615_mcu_init(struct mt7615_dev *dev)
 	};
 	int ret;
 
-	dev->mt76.mcu_ops = &mt7615_mcu_ops,
+	dev->mt76.mcu_ops = &mt7615_mcu_ops;
 
 	ret = mt7615_mcu_drv_pmctrl(dev);
 	if (ret)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/sdio_mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/sdio_mcu.c
index b0094205ba95..a7b8acb2da83 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/sdio_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/sdio_mcu.c
@@ -147,7 +147,7 @@ int mt7663s_mcu_init(struct mt7615_dev *dev)
 	if (ret)
 		return ret;
 
-	dev->mt76.mcu_ops = &mt7663s_mcu_ops,
+	dev->mt76.mcu_ops = &mt7663s_mcu_ops;
 
 	ret = mt76_get_field(dev, MT_CONN_ON_MISC, MT_TOP_MISC2_FW_N9_RDY);
 	if (ret) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c
index a8b1a0f8b2d7..33c01f8ce8e2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c
@@ -72,7 +72,7 @@ int mt7663u_mcu_init(struct mt7615_dev *dev)
 	};
 	int ret;
 
-	dev->mt76.mcu_ops = &mt7663u_mcu_ops,
+	dev->mt76.mcu_ops = &mt7663u_mcu_ops;
 
 	mt76_set(dev, MT_UDMA_TX_QSEL, MT_FW_DL_EN);
 	if (test_and_clear_bit(MT76_STATE_POWER_OFF, &dev->mphy.state)) {
-- 
2.17.1


