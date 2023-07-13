Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3A5EB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 04:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yfx9lAORIyS9M5LAnuWNbeLvqLfTUU6MatVBQui4DdI=; b=cPaY+W8vxZ9EIyBjWQewh9ZJzT
	HuW7IAiPPgZnWFvHRDajnCXN9gd+89GNnjIpzFPwcsLTINqCqmGtgLBHyA9YnoEg7cBjANwnD3V83
	oldH15+ShVd/8HcSskfyTnyQmXFHHU1aXaNxZKGcyoU/DqmhVQpYcqxaVCmsPVoMqReX9wMdeZGIz
	dooJbH8iSKs5qmb6CNHoIzUL8Uy4oLFP6N6O8i0Dcd5mau2MQvuUOFdRVUCKU+KH6Ezu2k56EcTUN
	++2t/aaIKFiiJoMhZtQ7LLFPo8VYxYNMWLmOZmhEZFE1EShSa3lvTs7bznq4tOduP9VzTkt3qCsmy
	0HFy51aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJnsv-001uMH-2s;
	Thu, 13 Jul 2023 04:24:57 +0000
Received: from mail-psaapc01on20725.outbound.protection.outlook.com ([2a01:111:f400:feae::725] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJnss-001uLa-38;
	Thu, 13 Jul 2023 04:24:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oq5+43TetfrwLi2jyZMv1bcnwXFaX4/avqzaCGciMKuDFvfsO/Piu/QaTvrqDlhSsOvKiyWVb+4HqD/+/2IFPjIipFBYWTt4+XSzL2BSX0toOjKmewXFmgoetxq44FGDuO9futrKxlPPJKXTTJYGZCAqKCawZvgczUyNQLy3EE+zvYLLSBLolSAVn+ilZOF5bMomJ1JR5Ts2exQj/2WozlPaUOjdX7oIF9ofrBW5VFnoiF6AiRGPOxtkqMvIn8ysDstkY+mpc3u19wlwUb9bgagzJpzpFpgbFM9JJTBr/HPceBD1Nm0Wfj1dwSTZQU2/ZdxH7gtdau0l3RgAxsq37A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfx9lAORIyS9M5LAnuWNbeLvqLfTUU6MatVBQui4DdI=;
 b=neo6vRTPSVQZCy84dYvXUDQcL+rGhtzMfqqgUfuqU9qrLUkDbJhAwJKH0POZ4IMjnqSgOxYXfjYAL1rcN5laGUZAv9yU0xuzl7JRV8L2S+jr9kv7jhkbGo08fpWsZJbvNTFGtDIZCK85NBB+rOuo+XahcGs+7ylONk4WXvQN4jNmgRVFU/6umx3SuthkZxKMMgPGD7CFDESPO/8pTBgfhZM1O6JmGQAOcxQLaigZhFGxGtz4wxY5oHS3DmoRCHQAMSjJb6ccjk6gRqif0wpingLc2vmLbrSbCNXIZHspf05EQEqc1Y1i4SBMvP+qPQwt0t2MVPZ4sawmpyVX6T6gVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfx9lAORIyS9M5LAnuWNbeLvqLfTUU6MatVBQui4DdI=;
 b=eGe4jf4DvF5wtoKMlfAzkW7sZflCCHYvDGecNQ+5L3hRBDjiWY3FPlVAEHHzRYWzraAnGiEh7Fz+giWlriAMeLjeVjfRIIIM70bw/+wVq07dMjL9Ewdm1LBb5j93Txho+qn5SPZ9Ee4vSR0/QoysE4j+hU/pRPgYul4lAhVt3CvXSp1vi22QZZn2r0HUwRHFuep+Q5QOaKf4Zx1CP3wx/ulcgJrXVOCD6pNM/pXVwqFSAsu47UjMyZVtvATAoea6eg/aNvzjBcBaSCdhdnhGdkGp6ncjlynTLgvyA6s/9hAl+FmuMbKzL2WI0xtRTcehqlQVoG2I4YH/UrjoaIwsUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB5288.apcprd06.prod.outlook.com (2603:1096:4:1dc::9) by
 TYZPR06MB5025.apcprd06.prod.outlook.com (2603:1096:400:1cb::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.24; Thu, 13 Jul 2023 04:24:33 +0000
Received: from SG2PR06MB5288.apcprd06.prod.outlook.com
 ([fe80::f9b8:80b5:844e:f49a]) by SG2PR06MB5288.apcprd06.prod.outlook.com
 ([fe80::f9b8:80b5:844e:f49a%6]) with mapi id 15.20.6565.028; Thu, 13 Jul 2023
 04:24:32 +0000
From: Minjie Du <duminjie@vivo.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Minjie Du <duminjie@vivo.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-pm@vger.kernel.org (open list:THERMAL),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1] drivers: mediatek: fix parameter check in lvts_debugfs_init()
Date: Thu, 13 Jul 2023 12:24:12 +0800
Message-Id: <20230713042413.2519-1-duminjie@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0254.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::8) To SG2PR06MB5288.apcprd06.prod.outlook.com
 (2603:1096:4:1dc::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR06MB5288:EE_|TYZPR06MB5025:EE_
X-MS-Office365-Filtering-Correlation-Id: cf84d3d3-f347-4270-5bd8-08db83590ed4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wWLxAfhsmZT9JNeERZMJ+Cbc6Z73qt/HNhm5m+iK1DUAO9ui84WOPp/Fpw3vZ26CWD5LIufZR00Dx8cxAFfS41KvKQYsOHrR7HaljZGMdbTUfdmDZweTWsg/f0gS5OSYuD4J6ob7uG+SnuZaBCnPtyz4C9pvYMEwXZQujmAcZmOIs20S1hEe+D8a2YgnNY1cWfRV9mCy7M4JTbqp8n5GZjo4MA/euPn3RvbD2Hi7Hd1/nqPYnDhA5sUMhUjsmdm6zhO3Lp2WQmf8j9lcrd7Q2eV+KPvoP2zL9jX1RNbh/FiSoRjrhWfuPCbTCw5zrYy/dyX2ZD2AFetcfC1NqekDqRVIy4PbnOMVP954suoY7mIEb/oUDgitd8EVsnV3s0Vm+Q5hrGEBhnSgbjpyU84LaRzy9r5CB8BeWfU6tb7qPgVvUVaBZE9zSeeT7+pHhBH6iEeFpNk92f23SkiCwL+ltfpwhcpoZMsxHMJFQs9pPIUWwMt+OX6JloXXlL6Y0SrZXl5oO6kUh5/45BC2aq3t7ZAg+Osjdu2tbyUto6Pq+ojBw9t9moHh1TNdooqWOqMyckduqT/AskZAAU2R0RFc7LJTV7zrKLg7HFZhrKJNZ5Izo8ttDxtiBG+PqPdrUDXN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB5288.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(366004)(376002)(346002)(396003)(451199021)(8676002)(8936002)(107886003)(5660300002)(478600001)(41300700001)(4326008)(6512007)(316002)(6486002)(52116002)(1076003)(26005)(7416002)(6506007)(186003)(110136005)(6666004)(66946007)(66476007)(66556008)(2616005)(4744005)(2906002)(83380400001)(38100700002)(38350700002)(921005)(86362001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t2J2dKqycPB+kWYZs6NET++Sl+V82C6vGGcCW4mcF6QSX+I4uS6V5yhy2HOG?=
 =?us-ascii?Q?ohnET/SXYBhLutI6nu/0ZigBsB75AgKOmaq6Ttj1t9IjsmuhWxRvj5YkP3Fq?=
 =?us-ascii?Q?o3CNu/bULYhePQPI0OetOZoX1Y7Ur8cJgzRgXSGIjf1bTsCEiUnP8GNQjk6A?=
 =?us-ascii?Q?Ze6wO32lfO3UjagFPxmzbcFDgWaoPpXj5LVpq5NXksC0iDUlPduILbji/bhg?=
 =?us-ascii?Q?pkHOxY2/fumMgs+lneBdiYR55tMxhM/UMQnVNXB8AAFgsZDBcyQ8bLcsPa3B?=
 =?us-ascii?Q?mMsi6SU7O58gsZr2t5H2XnV1nf7Aprj9LJogNEILOEcARedle4Jt8AbrRv+P?=
 =?us-ascii?Q?bM6SWLULFgaJq8E0a1OT0r+BUCHPrHF8+kgt9QtCABDVSKaTW9pM1CqTPnxC?=
 =?us-ascii?Q?frM5l1ml/kY004niw+fl9zzDfEbQE7zgIzrNOaJZRQCMFtJ9DXOTmRW26pUP?=
 =?us-ascii?Q?uTO73I2fOt/iTnMmAevBw90EsWPe5MMwivxpBpdiwrJMbuJwkGIgj+1ZtM9O?=
 =?us-ascii?Q?gudq/7t7rjhaVT7cBQ4jj3l/JWtWnZwUGxehjIPl/MfXcoJJe03+vPgUvsR6?=
 =?us-ascii?Q?DmDC6fmf2U0FYCOqZP9ZP7Jc9YJjbqqsoJ1pq8xigihToqTSlt2LFq7UHOKu?=
 =?us-ascii?Q?+mmirfifn2a2mlhOl3OYQK1guy5gK5g8ndOIjv6Lu26O+NQd8kYMYuOuv9M5?=
 =?us-ascii?Q?ikhdWB7wrzOoVsYxkaMahurWi4zqKL2+RwHLGCb8OG0WDkQOmQQ1kEfLzD1I?=
 =?us-ascii?Q?DuNQ5MEMcaNSmX4b8iMceBuZlTMvBs/U0RXSJ6o8DYXm1H81YVDEBOTTYCxp?=
 =?us-ascii?Q?yIjj55hn8oBWZ8CIPi4mIh8Ph2VEL5hvoYeKYsIUmp8ZWy7tepetciYfnQTD?=
 =?us-ascii?Q?DqIfJ6vILxt5b11dCh4040fNQD1hOwDZGnKIXHfcOtB8PQRemvB8Nv4l5YYH?=
 =?us-ascii?Q?QQwsgDEbYUwCuxaqs05hgWWy5DqRH1d8vTHPL2uOQsJlrpaCDW3DkQNogoFO?=
 =?us-ascii?Q?CjDaBKZWMGRMccssjmtZ8HI+6bkOnnaGStxXB5SCh7oucTafDkO3izxsII28?=
 =?us-ascii?Q?6rTI6/6T7lmY9bwkK+Xcz++Iv1IPSUEdLaJX0tm49KfsqGwI0DFPWEDouuJj?=
 =?us-ascii?Q?ocxvdHtbUrrBA68lYK6k0byBY/jIIk58ESD9+i1Mro2mmX9HwFxCZBm5yX5c?=
 =?us-ascii?Q?/eGRdwXAI6V++2beBRyxjHKNUgGrsoLj5Pw+astvcKikuPW7sQsTMsGdiCm6?=
 =?us-ascii?Q?DwIkEUdxOTB3o5CDOhhOdAxCpF8aXFmO0cOXR5gqaZLzqlGOdB5Mk7ycqzg2?=
 =?us-ascii?Q?fZBhvV272NUZ7RIIWbUXOyl2IT0YNWDCUCemjD4BqDdeMW/XYsR857cn2m2o?=
 =?us-ascii?Q?MQcqhErLPcSI3QxyO/LJ1Svhs8ZbeTLhze7hY5M5o3UCck0CnMBHFYAHAguT?=
 =?us-ascii?Q?ehkGddXHLl9q1w8FkUbdjuFJGEunGIGXaUTeYARTbmheUlb6TnLz0qX6ol43?=
 =?us-ascii?Q?AqbH54dsLfPJ7BprtYfTPNvzxZgfhWCTrHBdPii1Qrk9s4GbVjQDAfN8/5/I?=
 =?us-ascii?Q?9O4GK4E6B+yrJYRtdJeH5UCMoDSbTmc7CZkGAyba?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf84d3d3-f347-4270-5bd8-08db83590ed4
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB5288.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 04:24:32.9254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P/96naRJqFErKwNdQVeKYbEv3YsHutj3E5hjMMWqeCiAjthcinMXobFkZtU1x9fYbiQz+/3O6dwztkILjEdhNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_212455_016518_CA0180EB 
X-CRM114-Status: GOOD (  10.90  )
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

Make IS_ERR() judge the debugfs_create_dir() function return
in lvts_debugfs_init().

Signed-off-by: Minjie Du <duminjie@vivo.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index b693fac2d..b46f351d1 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -190,7 +190,7 @@ static int lvts_debugfs_init(struct device *dev, struct lvts_domain *lvts_td)
 	int i;
 
 	lvts_td->dom_dentry = debugfs_create_dir(dev_name(dev), NULL);
-	if (!lvts_td->dom_dentry)
+	if (IS_ERR(lvts_td->dom_dentry))
 		return 0;
 
 	for (i = 0; i < lvts_td->num_lvts_ctrl; i++) {
-- 
2.39.0


