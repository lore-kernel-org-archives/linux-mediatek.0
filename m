Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2BEC5AC7A
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2026 22:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W+jBT+uWJBuanlEpVtrz9RycQApjs6zqw4F4Hnb+uOI=; b=TDjX+9omxHgA+MgL0DGGCSgEj3
	USUftv+EvxaenNB1yiatayIovWwa2r+nFhinDAmm7TH+dT6WlujaT4z1qD9JWe13OtIIZjr/Yss6Z
	hALnxCoDt5+2fnYszBJDukNjt/v7LUlzpnEBMHV3U0JmJ3aHhnHsav6vmofvNxNQU+0nnjAv5n1BA
	jiXYcTN+eEXMh/qACsLlGSBsD4YITiEmBkrONmddji3HbmPO+ZoXqEsdR1Zp2bghP5HySkMwUZGTr
	Fymt2lEsgvhSwDI3K8BOk01saIc9Nhg3KcJhl+3Y1oBN8LP0akgwTfbLgwkKMTyzjTcuzZepsuXlZ
	NSE0okGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws6F2-00000006lxv-2MvX;
	Thu, 06 Aug 2026 22:07:08 +0000
Received: from mail-westeuropeazon11023113.outbound.protection.outlook.com ([52.101.72.113] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws6F0-00000006luJ-0PkZ
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Aug 2026 22:07:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cfyYtDLtW28r0KJLZqxjpQA0ENoAgdUZ/on6WUvNwM7Fhngs9OwUy0UraO3oPt5mVFQteQDym01GWdctVZN7k5TDhdnB/sFWZP9p4ndSh/NH8hcDtq8ko8tpnRTvqeW9q/IuPWAgbVDtGjXQGwg7W7GNtutj4Yboe3repNmvu13GzuTOHf74GpkshOjpidjRCmRIAjk/4t0GBzBp5f+xI6HqLqmf0BFr61BMTADjLkIJuqjQks80kltZVxupPP1E7XIjEMGUfigrIEkXPxyaE1q/EuOZR4C5Cxfz4eemcSBguo0SbM8C6rSbNiGozt36D/syI+qH2tZMwepgNgwifA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+jBT+uWJBuanlEpVtrz9RycQApjs6zqw4F4Hnb+uOI=;
 b=LMna8V+WX6j5JKLREoV1Z8hcE1heBNwCOKbfGt3X39uTEhT+nFZAP3KwDrtxN3Zt4YEU7/X7H1jP+bHRNwwBNl6DQQN0tQKJjqFNzBxqTGdHOoaZufI/zyW1ZgotAAzkVixVtmbsghc/uSGE+WwE51iSpVsiY6woD0aB5kbTnjrSikuySpcp5KfHfazczl1py1JPRRaYvcPuL6hJ7Ol/5nU9VeyDNL7nMNePLb5wkmEwn/lsg9vTxiMwaoi5HLt5CXOlp4CXNgSNUsimwC+ZlXnBfAX/SZd0djFLDn0eD7rpGVLzNxeUNkXvj2tT1KnRvpp66Ma3HkHxgrvfHnLV/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+jBT+uWJBuanlEpVtrz9RycQApjs6zqw4F4Hnb+uOI=;
 b=uKxFiILpjolIaiqHUa/puPzJ2T5Yyug6VMrX+txQopTv+YoNdR/63xxTpCCCGmfkNhqZJlzUaLqhm+pRPwyzTaP62Frj0JFgsrH1jOhASW6LEWkCMFxlDdOXVJiUZFtV50uh4j9ZPaO21emgp2aqedJuRIvzE6JwcbMlyolzYQUE2/KaLkOSShZe7DcYZGpyUatq/D4CKRsG3x+M3aDB+7BirmjliAUEVsvV6WIVlXd5An0v3sT0yfOOKDh4MDHFTkA0ZsK8Tdw8auN2N0xUiPP0eawvvDg2COvx6cKUI+9we/EPe64+4rZLGmINm5WYPYbG5BhtwZ7KZixdTvs49g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by VE1PR08MB5823.eurprd08.prod.outlook.com (2603:10a6:800:1a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Thu, 6 Aug
 2026 22:06:56 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:06:56 +0000
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
Subject: [PATCH v11 17/37] pinctrl: airoha: minor improvements
Date: Fri,  7 Aug 2026 01:05:55 +0300
Message-ID: <20260806220615.4078303-18-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|VE1PR08MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: da72797e-2fbc-4360-0186-08def4070759
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|23010399003|366016|1800799024|921020|38350700014|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: Mju53hfD1GW2M2H1ABCnKH7iEw4KNWtHnDVrv3qEBMTnvpWBTW6wU6p+1J9kVGnx4pjjZv5NNedWVQObmwLPDnQHJgD5LWpzk6sfSisjEG2v9g0XCcCBrPJ9WKx8iEJ5UTwYMXtibb5zJO1KFOYUSwCJT7sQftQgDwOLt513+N2SjptqZhUeilOVw3XfrI88Z4p/ViENMHZWBmfiKp7u6dvZKHu8CQsGdxtwZk8MWiS67alhsdtQd1VOkuhDasvXsxX+sBMTJRVlc3CoM8MvyPLZ3XMD6zT8RzRCZSb2dxm8ckS7Pb5h8RutiSsKa0WvqpjiULFrTxiHDT/vcRBQmlGeNn0+ecLCr3wib6CnIjoMzBNsnoya9j7VK8CtH/ZaXf/vgvarUEZ+/UJSh1MxzrWo4dv1FN/6sMez3/EbNxDhGBEmU92mDNAFCZBIeUQYAPiDoG11EPyIZg38BZbdTOhxmjFbxEIw5VkYxLqfOzRD6MKltaJ0W5G/JosncLC6POifePrONmqDWqWcnR36geI0GrlpOvxlNZciXBVDfJHqrdh2eeyA+V7m9oCm987KfbIRtahXONCY3mc7od2wfaVEleleRawjKHreQ/R0Mk+zmEJNmtHxy94cqxDYnK3Vp46e6QRZyDV4PXim/kVF95UBGPHOSdZMVJV8S3/XE6iJNm162Tk2T3aRGQsObzEnjwM0WuwfSVZOk4WWqkcOe8owMwEDDFI7tn0tCj91G/Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(23010399003)(366016)(1800799024)(921020)(38350700014)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pxEx30hu6DWUHay9r594BgHB8/rwZ27dLICyfIBePHE/kXOzrsrLoBQP0zB8?=
 =?us-ascii?Q?C55gcwYkuMpYMzwGw4OVoGKs/AYKilRXM4qyiY0nQKMZgGHQydh+YG2ZCLlO?=
 =?us-ascii?Q?vEmqsX8D8wEp/h30d8O3beFCTCnpgf0fJ5QSITXn5AkQH6oB36ITvDqe+Fq+?=
 =?us-ascii?Q?C2TqIPt2UVfx4QlFR5d1R2PJjXtmAo0fdP+5nWNgN7ZbY3AkJ7UnfNlDKDDQ?=
 =?us-ascii?Q?wD+cIPQ2o/P9k/CLjcsnIld4UHpDHem++fpowLdaqOS7S4VgyFYkqDTKL5x3?=
 =?us-ascii?Q?a2agBTpZyUnT5cxxsmGqb66Cc+8o657XqNOlgGQ45YPJHG/+UWut8HiN86UD?=
 =?us-ascii?Q?YzFqjkB9faOnyj+5uoLmmPb934GVibsDBDclhcsgnAP/m12mEINJgitLaiKy?=
 =?us-ascii?Q?3WCfsQkj6VgZkGCnOb6VaAdoLUqU2ORF3rn4VgvbhUhtA7xSLspKYf9GINOu?=
 =?us-ascii?Q?5Fx2Xc4sMUyNgDq167C0cAhb7ni2XHHOPSjQSERJd2BVbHKXGlIrdaV7y+Q8?=
 =?us-ascii?Q?PhBhfkpl5pRry/NAZsX5dqM7wTdo8IID+wkOtwk5lxRa7zn86Wj0G5vfs7xF?=
 =?us-ascii?Q?ccPPnoJkz8p7ozIaT82Y5TsS5Fo1bNcW+fg4m0+ZT8/PF6/MZN69Cza83rw1?=
 =?us-ascii?Q?ZZr+tk97bITylFfOIzuSXt5IoJdHjJnIGtD6wcP/2OlGuFevUhZitbYkg3ES?=
 =?us-ascii?Q?NYDZzU8Np7F3hGQg9L1xNnVrVBoUoSoqmShpkf9Oi0a/y6ZD789TiqTJrkrF?=
 =?us-ascii?Q?dLGAPbl8jMN8r0m675e44y9364P5LXfT02RqKpPAvdwVmhQldaTHv9/60Ari?=
 =?us-ascii?Q?xhL4zRGOI8RCuSQ0uhXQMrovJHUNXqeA70gO2CWEt8gD44hz8fPIM0CufLpS?=
 =?us-ascii?Q?5jkGeiILGd7g7my7W/mv/TDRxKV3Vi+15yj47mKDOu2wctrHoDbB08GxXQ/1?=
 =?us-ascii?Q?u6EGQTJLlYAGcZ7NVEWbhrhXOlIyAMIc4hZaUTnozwNwa4GVnGuk4+jrgeTD?=
 =?us-ascii?Q?UeDGdzp/PcaUSKLOQi87+PXYvt93g74DPrCVESrr7vRhuVTtdl76wnRxw9SA?=
 =?us-ascii?Q?ARIGrnBKJhLVr/+2W32pmFDlzuF+9LiBFl2CcQ1YV7HJa3kkdREGfKze6ga0?=
 =?us-ascii?Q?YUjleGibRheCIAg09E8fX4DZ3sX5kHIxMqu5Or800csbvUwAzx7e5ThUYMgT?=
 =?us-ascii?Q?OeL0O28d2P0PgeFcfFi/2oOapFS9eL7NxBtWZeSCZoPh1ie3L5wcH0lVkyp/?=
 =?us-ascii?Q?amBbgjc4kdRkEXLgCu8mtM+cp/g937bGrpc8XnY4FdpCtR+Unc2ogrJU2qVv?=
 =?us-ascii?Q?ciuFjG+IL0hxsrGNEUZR1J0/L+L4nAsoHGJmaRaHDmtX4mNivQOQNU6tTgar?=
 =?us-ascii?Q?2rhV0jYrSc01HVhc7Y7Jjuua30Nt1QuJb8eQBbKZ1H2oPdWmCa7NQeGxvt0C?=
 =?us-ascii?Q?6bMASTb0aeqhsGCTa0UiW+v3Jhyu5F2doxmOAOzebU7qc7lX7M6wdJPbXkwL?=
 =?us-ascii?Q?v7S2cudEt1W2WGvfcGlyDSFyjDnzmJIJ7RSHg1DNsvCdYDa8qxNwm6zaMN8B?=
 =?us-ascii?Q?5zc20hP312J6+iihAxkguNE5V/nXjS+xvNY15FSXMiL4eiqfJhQxlwm3jW4H?=
 =?us-ascii?Q?q1GpLPWZJMSuwSoT7tWzY0QhsH2qqj/TRlRJHwUFwChVMcdQU+62zuEidt/u?=
 =?us-ascii?Q?mSEFtG/2G1WSYPkRU5wg2rZoiuvfbxUaUAED1owm9hORRAzTnCivqKLx0Dbt?=
 =?us-ascii?Q?UuFdLyJf+tHhhu4B0H0QLZI3ICI9BdI=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: da72797e-2fbc-4360-0186-08def4070759
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:06:55.9853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 30qvKKHYvuOgoQanxM6kjd3bajqPW4//Ta+C9kQkWekc3F6LrP0sR7O6uYYrTlwBt/hA8BB6VgntME0teS6Zqe/HW4iujjoXTiRgk96sSyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5823
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_150706_137037_71B1678C 
X-CRM114-Status: GOOD (  11.73  )
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

Changes:
 * use field_get() macro instead of direct bit operations
 * improve error handling

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 56 +++++++++++++++++++------
 1 file changed, 43 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 746728d3df901..e4bfbd1571233 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2840,7 +2840,7 @@ static int airoha_pinctrl_get_conf(struct airoha_pinctrl *pinctrl,
 	if (regmap_read(pinctrl->chip_scu, reg->offset, val))
 		return -EINVAL;
 
-	*val = (*val & reg->mask) >> __ffs(reg->mask);
+	*val = field_get(reg->mask, *val);
 
 	return 0;
 }
@@ -2862,7 +2862,7 @@ static int airoha_pinctrl_set_conf(struct airoha_pinctrl *pinctrl,
 
 
 	if (regmap_update_bits(pinctrl->chip_scu, reg->offset, reg->mask,
-				val << __ffs(reg->mask)))
+			       field_prep(reg->mask, val)))
 		return -EINVAL;
 
 	return 0;
@@ -2994,7 +2994,7 @@ static int airoha_pinconf_set(struct pinctrl_dev *pctrl_dev,
 			      unsigned int num_configs)
 {
 	struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
-	int i;
+	int i, err;
 
 	for (i = 0; i < num_configs; i++) {
 		u32 param = pinconf_to_config_param(configs[i]);
@@ -3002,16 +3002,35 @@ static int airoha_pinconf_set(struct pinctrl_dev *pctrl_dev,
 
 		switch (param) {
 		case PIN_CONFIG_BIAS_DISABLE:
-			airoha_pinctrl_set_pulldown_conf(pinctrl, pin, 0);
-			airoha_pinctrl_set_pullup_conf(pinctrl, pin, 0);
+			err = airoha_pinctrl_set_pulldown_conf(pinctrl, pin, 0);
+			if (err)
+				return err;
+
+			err = airoha_pinctrl_set_pullup_conf(pinctrl, pin, 0);
+			if (err)
+				return err;
+
 			break;
+
 		case PIN_CONFIG_BIAS_PULL_UP:
-			airoha_pinctrl_set_pulldown_conf(pinctrl, pin, 0);
-			airoha_pinctrl_set_pullup_conf(pinctrl, pin, 1);
+			err = airoha_pinctrl_set_pulldown_conf(pinctrl, pin, 0);
+			if (err)
+				return err;
+
+			err = airoha_pinctrl_set_pullup_conf(pinctrl, pin, 1);
+			if (err)
+				return err;
+
 			break;
 		case PIN_CONFIG_BIAS_PULL_DOWN:
-			airoha_pinctrl_set_pulldown_conf(pinctrl, pin, 1);
-			airoha_pinctrl_set_pullup_conf(pinctrl, pin, 0);
+			err = airoha_pinctrl_set_pulldown_conf(pinctrl, pin, 1);
+			if (err)
+				return err;
+
+			err = airoha_pinctrl_set_pullup_conf(pinctrl, pin, 0);
+			if (err)
+				return err;
+
 			break;
 		case PIN_CONFIG_DRIVE_STRENGTH: {
 			u32 e2 = 0, e4 = 0;
@@ -3033,18 +3052,29 @@ static int airoha_pinconf_set(struct pinctrl_dev *pctrl_dev,
 				return -EINVAL;
 			}
 
-			airoha_pinctrl_set_drive_e2_conf(pinctrl, pin, e2);
-			airoha_pinctrl_set_drive_e4_conf(pinctrl, pin, e4);
+			err = airoha_pinctrl_set_drive_e2_conf(pinctrl,
+							       pin, e2);
+			if (err)
+				return err;
+
+			err = airoha_pinctrl_set_drive_e4_conf(pinctrl,
+							       pin, e4);
+			if (err)
+				return err;
+
 			break;
 		}
 		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
-			airoha_pinctrl_set_pcie_rst_od_conf(pinctrl, pin, !!arg);
+			err = airoha_pinctrl_set_pcie_rst_od_conf(pinctrl,
+								  pin, !!arg);
+			if (err)
+				return err;
+
 			break;
 		case PIN_CONFIG_OUTPUT_ENABLE:
 		case PIN_CONFIG_INPUT_ENABLE:
 		case PIN_CONFIG_LEVEL: {
 			bool input = param == PIN_CONFIG_INPUT_ENABLE;
-			int err;
 
 			err = airoha_pinmux_set_direction(pctrl_dev, NULL, pin,
 							  input);
-- 
2.53.0


