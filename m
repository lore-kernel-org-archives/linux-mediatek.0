Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B94C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Dec 2023 15:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:From:
	Content-Type:Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:Reply-To
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zj3otIjXP4LSB+Uwe+dALim4FgAPILsOWMY0boB28nY=; b=FJ41gF1F/zvvR9s1p9bOCc9Fk/
	IjpB6IIRF3WCS3wKre9w9GxdVGlToaLcEdzPoh01KKYn+Rfhk0cGRekIkUOWILdTsiMMvK1Djr4FF
	8EkjicxZpB0hAss+45X3FGa4BgOo9w6JTzCdKwqmnQdaukixKh4h7BrnPQFWJGyn7y/44X0W0h18/
	eRIZ6LpSyayOXEJnKBf3+mOzQIdQ78nJLbbgo4RL9d4Se5iq7iE+El6aa68m8yZOgsa1tNU8FQ5pe
	SEB1Jkp/bhp0/n0sfILSblXngl8ouSxHrZDgkVkIQAkxFQ8hqlXu/nOkx5Z7CcwwUbkMUyq+gG4Nj
	bfeAxXpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHmtV-00B2of-1l;
	Mon, 25 Dec 2023 15:29:29 +0000
Received: from mail-maxind01hn2231.outbound.protection.outlook.com ([52.100.218.231] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHmtR-00B2nZ-1h;
	Mon, 25 Dec 2023 15:29:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LnjVApKKepZH73S8/D3Rmlv6uDng5UN+WG3xdtVrK9JwdRjsDm/r8N/8tfVl3IvGi4HLsVMR00RptccvZ99nGBPWvyysX6tCwr2vIQpiea48GyhhkZVV2J2tFcKI49WynMxJVo0V2C1B4FPyjf4ZjeTFJNF3mwsNdADuzi/kIcEXCLoMgiMd0nc7Z9mV/dwpQOCgced/CNHfrQndT2Zail/M1GZhaQlujoFU4wZP85VHax7OuCsiD2DFsIDC7CcV0kLhGUDAAoxAfAqrMzXGWUr24I7mLlGfEtnQkzj7y0faeSaBv12DQM/xT4uqlRpW4RVD4/aeTXn/rAFblP6sJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zj3otIjXP4LSB+Uwe+dALim4FgAPILsOWMY0boB28nY=;
 b=IhvQTTpZub30g/o83pzwj7R1gZr9SDPwwpBu1bD181hGKoeJJrY9tEpoEWUtOQP1q7D6r8+86gEfzBnCLkRFnEDEEd698DFGGvPSviDFobMuo9hEz8mFdasi/XWy6DUf3rf1xHdSg4PRoYuaGUxtajmEnbPqRvBw7ZXcRvAZ/DH7H8dfPiRsBAZEJyUBbL0IwgPA5S5rQOMtto3ru/yDSslBAzgrCortYjBd60wUk6mxIaFWpOyKpzwanEEdHAUjOlDVHVsJE/YVxNzlnal0RFbkQlrC75LowA2BKt160TXs5CKCFX//oL0+9k2V+nLGMmJcNOpK00/SigJEeKYlmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=none; dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=;
Received: from MA1PR01MB4027.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:7b::14)
 by PN2PR01MB9106.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:159::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.26; Mon, 25 Dec
 2023 15:29:04 +0000
Received: from MA1PR01MB4027.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bde2:b62:220b:76e4]) by MA1PR01MB4027.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bde2:b62:220b:76e4%4]) with mapi id 15.20.7113.026; Mon, 25 Dec 2023
 15:29:04 +0000
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: kishan.dudhatra@siliconsignals.io,
	Chen-Yu Tsai <wenst@chromium.org>,
	Tom Rix <trix@redhat.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] clk: mediatek: fix cppcheck error for uninitialized variable
Date: Mon, 25 Dec 2023 20:58:04 +0530
Message-Id: <20231225152806.3716898-1-user@falcon>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
From: 
X-ClientProxiedBy: PN3PR01CA0101.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::7) To MA1PR01MB4027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:7b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA1PR01MB4027:EE_|PN2PR01MB9106:EE_
X-MS-Office365-Filtering-Correlation-Id: e191863f-1346-4a36-343b-08dc055e39fd
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6u7lJP9QLlnwO4s9a8xiEGnyjm33MQFElva9wkTyBExciRzXfqJFqEpbZwPN?=
 =?us-ascii?Q?xfcnyJbg0n/2YVtRFDJ1j085wXeSs0hIZAnMiXVqvwLKGHIdtaRU31yeLC9+?=
 =?us-ascii?Q?lEB+JRnegTRM8YlEDP3qukrPbW55O9N5CV0r5aBDwpcLcZHSyTAob25OB7d6?=
 =?us-ascii?Q?92y5adK5FfT03ByaBm+9UsOPQyZH4ypy6byhArRia04UkkjnVyCuVRQpo7H+?=
 =?us-ascii?Q?Ex0+pA69IjxPLc4hELHE2Cn4yxJWCkfUpH/eV/T/5iDjwOcDycSvblSsPGTQ?=
 =?us-ascii?Q?45wmiTkpxmjR+lzc5UffFreeB8Ex7RH2Uz5jyTyjnvpbMvVde4lHv814sxV3?=
 =?us-ascii?Q?T9gcU+hSVkxF1rk4jPP5gsc/BEfLz09T0BBcB6kagtEuoaB6ojDQYbrEw71E?=
 =?us-ascii?Q?d3PC7xdqnWQzqRBPAyfwo642b0e5m+w2nFfsJeMt8nMnrgSKaNFYVSqvqHXw?=
 =?us-ascii?Q?ntIWRNaueTUJoTlL40nY/MCaMyWO9+agEdorSCxHvp2ww6yWR+p2KgX15/Oc?=
 =?us-ascii?Q?OBeDOvjmtglVfjA2KLbRlhDbcuP4TT83/Dtgyu7W4op5JIlIJcz1eHnTr5DN?=
 =?us-ascii?Q?agFOWZsw7kEJJ7+DKc3Wfn02f7NnCsZhfToxCiryZ61fQ1/xBrHnw+2jj2E8?=
 =?us-ascii?Q?jG1Pv0UG3jFhmvwDUt0NHzuSapp3m7CyDKUNmtL7ixQ+/cSP04wODFhXVjQM?=
 =?us-ascii?Q?J1iRJkQ6DKMLNh1nilzfWG5OTg3FgP7Q9NPbweFIzqldgBfcudVMoK5yRl/A?=
 =?us-ascii?Q?llRB3ua8Rj7iMtMB8WLSVjetr+e2zScN03ozJNEvOdk3e/U5gkbCAre6FUBe?=
 =?us-ascii?Q?iOu4VXq6ZXpeFdFxfk5qRfXZCjfJ2Eh9+0SaBLgTZXaqgKU3hV7Q7lZdC4f6?=
 =?us-ascii?Q?3R2kVNMVKZtTwiqCcYv7kCx6RdXBWJ70JnEU70r+MTdlDur83eyTFoqaAxqe?=
 =?us-ascii?Q?jgwgo8h+BZGwulLYp9+Bp9USPuNYdzsL3nFOSGo4Zfg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:6;SRV:;IPV:NLI;SFV:SPM;H:MA1PR01MB4027.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:OSPM;SFS:(13230031)(7916004)(366004)(39830400003)(396003)(346002)(136003)(376002)(230273577357003)(230922051799003)(230173577357003)(451199024)(186009)(61400799012)(64100799003)(38350700005)(43032004)(41300700001)(1076003)(42882007)(26005)(83380400001)(38100700002)(9686003)(52116002)(478600001)(316002)(66476007)(66946007)(66556008)(6512007)(54906003)(8676002)(8936002)(7416002)(4744005)(5660300002)(4326008)(2906002)(6486002)(33716001)(1557600050);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UPNCQeLkIkosgMCB+YvEslOx1766+gtBYMx8aGIzwdUSGlrLxHoLmiyAo0O8?=
 =?us-ascii?Q?ZayI133elNmvwWYzFFJ3DyzuK3/MrwiUfaAn+/YbezTy+1wyPpNgIy+XTBrG?=
 =?us-ascii?Q?A3dSAMj26jsE3qWe1ycrEbL+iFD8v/ijDaUCQzZ7PYsUuiOB+OJg7fp3K58P?=
 =?us-ascii?Q?N5WB32NX2qEf5F5FW/NCl7XgzNoTHQaU6M3GQ41KeEjneAgdpNjyCB28hD+b?=
 =?us-ascii?Q?4fGdO4uy0ErtVUwqEbPmlgQ1EWOT5TU9bx7fcxFkb3YEdQ8kzXYTnNRQFyeI?=
 =?us-ascii?Q?F5WCvg9cAZvlsuJmXANkWqHnP9hYy4lAHtNK8QL8UMkoKbmthspi4cdzNYt4?=
 =?us-ascii?Q?aqtKooYXMW9Jvd95MSUgT7+vefJoyzvaJWm5awb0XRWuBsWKUqpovN54ihr1?=
 =?us-ascii?Q?Oz6rYa8t6O3wLOAxHOsT2XTEFcRQclvqnykKDboS1MayesS+tgaPdzjbQoLY?=
 =?us-ascii?Q?P1vFKnUcrhLoI2ELWrU4rJPGRczcPiI/0bg3Fp4uQBdRp3WNSx8rga55SXR+?=
 =?us-ascii?Q?oeFqqFugDtd3SzDIOZA8AZhbHqUx+umawlc7awidwvh+Da3X/1647/ohAQQc?=
 =?us-ascii?Q?Hrzpsf9SYtRmHt2kFU0LfIOSHlrib4ysCNo5XSOpjlVQ8AYZHwYUKKkpuKOE?=
 =?us-ascii?Q?jsw3IpOU7k9g+eaSZ1GG/pgBv5fiuRsaLE5zkwyCcOk9kmvtI8DMOSlpizW4?=
 =?us-ascii?Q?yonftKw+8MdA97gbrB2/rYF4or7c5xEF259c2cV29iSONDna01zjRMATCy1e?=
 =?us-ascii?Q?gtwNnARC1Hl4LwetEkd3vY5iEzUZhOLeBpIccnhmgfr2pnr36othPs2SKTLS?=
 =?us-ascii?Q?NaZD/5J7Df/EbBXVjrr2O9SvCVq+JA4NOE3oqQyIabBNyZU+42OYC3H+3CCb?=
 =?us-ascii?Q?Q5X/RTKkL9aSLsPjbB+d2BRQkNA/gmH/IXNEdJGeMGDrYyp83W2TCGtR97ER?=
 =?us-ascii?Q?rrPJCIXgTJOU+h4zKsTOMT8GwYkGWOOIoJfGegEPy37nld4yeGV7Q4rHIrht?=
 =?us-ascii?Q?rCM1srCYW46AqwiEkqhv19RAVq0YH+ogc8upZK01USbev60qCPqyH7WrZGzs?=
 =?us-ascii?Q?S3jI+yrON4yM/wX70ZTIXoZ7jc6kejIKJdi85sl5Xh2VXky6e4aNQ5in9ajS?=
 =?us-ascii?Q?AZKeN3h9nRA8Tp6MbNSpSQxM+tkQT9dNRn8AgEG/qZkHY39Qm7SESvTuviAh?=
 =?us-ascii?Q?5zOOtHxMlGnWPA3bk1aQb8b7jrju9LEIqfgC4iXy+Ibdncof9CRs4O99mZHw?=
 =?us-ascii?Q?u0+6LoHoPyPPvKJY7lW+XYa/JPjC6c8Nj/80CwzsCbdgU5Wln/BYpeC7bBmu?=
 =?us-ascii?Q?oBG1xllSIoyHskwrDOGEZOWN/w7rZdMNLJl6Tweqb8KmhasIdceI2zluhZNu?=
 =?us-ascii?Q?xN0/9FM4QLHlzh/96w5miCP81S+/kqMQOstiO/mcLsKrQUOsE34KB6FWl/c4?=
 =?us-ascii?Q?WYY0g3MRIIoVm+w1nIMzRDpSKcrZgyScjvqRpaA2EQ2+rjiQ6qH3eFIXY/Yx?=
 =?us-ascii?Q?8ZdB7pWU/RNtTFpK910ol7MlSOe1MGDHMMUCmIdkxo4PrSMw4W2P3JxPArce?=
 =?us-ascii?Q?yI7A1zQYT5bx6AR/Q0NbDMp+2U/vX4mZvc6WslS77hBqmjv2/hwcV0AXO92A?=
 =?us-ascii?Q?70ia+wdR0daWGyjR14JnTCs=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: e191863f-1346-4a36-343b-08dc055e39fd
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB4027.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2023 15:29:04.1476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+vwTHK5SBhy5SRoq+MkzV32Xvkxho1T81rNZqR0RjjILwKEYmc6USh1VuDe9At7am+YqaMbt8C80WDWbQXoqiyxmSdt5UtN1LkQ75Yug2aowxi23IaUKGFl3l8AMBz/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_072925_592756_CDEA8475 
X-CRM114-Status: UNSURE (   6.45  )
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

From: Kishan Dudhatra <kishan.dudhatra@siliconsignals.io>

cppcheck reports below warning

clk/mediatek/clk-fhctl.c:206:27:
error: Uninitialized variable: pll_postdiv [uninitvar]
if (postdiv && postdiv < pll_postdiv)

This is due to uninitialization of variable pll_postdiv,
which is now initialized as part of this patch.

Signed-off-by: Kishan Dudhatra <kishan.dudhatra@siliconsignals.io>

diff --git a/drivers/clk/mediatek/clk-fhctl.c b/drivers/clk/mediatek/clk-fhctl.c
index 33b6ad8fdc2e..b0e71e4fd938 100644
--- a/drivers/clk/mediatek/clk-fhctl.c
+++ b/drivers/clk/mediatek/clk-fhctl.c
@@ -186,7 +186,7 @@ static int fhctl_hopping(struct mtk_fh *fh, unsigned int new_dds,
 	struct fh_pll_regs *regs = &fh->regs;
 	struct mtk_clk_pll *pll = &fh->clk_pll;
 	spinlock_t *lock = fh->lock;
-	unsigned int pll_postdiv;
+	unsigned int pll_postdiv = 0;
 	unsigned long flags = 0;
 	int ret;
 
-- 
2.25.1


