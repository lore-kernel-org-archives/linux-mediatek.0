Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E98AC54EFC
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 07:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R7IDxFDLPiGoYsKb7Gll4es3EdwninXIYn3tkpwAotA=; b=aulaccpumfRGYNh1AeM1aAbbuS
	xKCpw1F/lNv9xNWOExxnOcPzqU+CcG6SEtxcX4btuXIUEzQC8hbK0b2e4C2l6SkyTclA36oMd+sCb
	9VRMumZAjLgPHjsmNu1Q7giD/AJo/HG9BWWn9i/ZI4WfjrftW3fPY013c1cJppdDPzSqmi9SWsgm8
	AS0k/7OMNZXW03BWh+APIT5+SdgLz7amQp9kn0pJD5kdwQvLz8xBmdcFQQL45qSurwU6ikxjLC059
	0Zng7CeKs83ZXzTXlCzU68fuRG9zRWzHSrvAcUg7HRXOlWaaikZ6rSLB4UxiYtjU2agGgHr0V/0XD
	HMPr52KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFzG-000000029t3-0Zzx;
	Mon, 27 Jul 2026 07:42:58 +0000
Received: from mail-northeuropeazon11021117.outbound.protection.outlook.com ([52.101.65.117] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFzD-000000029nR-38Ti
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 07:42:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DUlX1KffpGGemIW1zchSyt5lKYEntFTzh4ETyIS6j/V3QBeaOx5ccD4ET5aQyDrzcZ9kIOvCWKVCUHv3xngkB9ziqXgWoX1DgZhS/A7Dqblo5sY6iPByyLQ+u4+GZAc+hYsglYzuhQxayE+RUxH8CNslxEAlMjD6PIWYrpBt2U7MdhQWC56TOWdI5oysZbTx0209dTNhm2HYh0/wsmOjnYr2TJRd17Of9/Vn8QLNIFbpSvayvZDPUMgc+buE6rDAj+dowyjgWF2LIfx2oDpaeC8hpegqY7VFqNQ7YURgfmDSMTyqe0jgtWvFph0KEfURl6CZ+qpNCPGREyljCz1ZPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7IDxFDLPiGoYsKb7Gll4es3EdwninXIYn3tkpwAotA=;
 b=wYVzJ/6NtffLW+uq649/9wXSubBJLLmu/5ygpMBii293StuKRNoNxD6cHQj7vi3W8JDqSNTiGVxsC2FVAFdwVoVl0IaOINzbSwNZYb7qFM+afgq8nH8ETar+E3e3gudiD8DLdyM+CRcvdNMgXWsoalM4kHJO7QTldhn0dTnAyhJn5kn6HURNPE7/3oTI0fixOdOGo6f6JcLRFxu+KsoRPazeBWv+AbeQ97sLa2BbMI4PZNSIUqsy4GijrbgFQ8a+BRx03XAwXgqsVTXSDFabKxbE3JRfP5G36cSz+iKk3M3SeHYZZwzgk5aFTRwxH6CaYCQ2W3RNwBkYsBsjp8289g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7IDxFDLPiGoYsKb7Gll4es3EdwninXIYn3tkpwAotA=;
 b=5hxZJk86qNNJsUERS+N/bbSJfIux6Arsz+PXSAUKexIpWTCVZMeiOA39mxxUWtFcY3r+xiqm9GMvltI6GINgbXw7w4Nb5uuUP8KqTrWEGXMtfOSYctjPE7+YBMPckFTBUDjq7U4nCwsYVuIaXz4Imvj+7d0NfWo+vmCCOgonuSNnJPPC1T3JwZvHkUarsqZRsa64LEYw59DzO/gTsWv/Thud1ywmny55GwsHiJN28cxP/NY6jnPT0/heiOaH26ll8YNy+Ypzx4JnnfLr+PaUbSEELD4O6LTN/4WZzrqiSUfPKL+AUGa80VxSFKmFybFjdpU4NpTn56HtH1XilYcLJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PR3PR08MB5868.eurprd08.prod.outlook.com (2603:10a6:102:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:42:47 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:42:47 +0000
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
Subject: [PATCH v7 02/34] dt-bindings: pinctrl: airoha: en7581: fix pwm pin-groups
Date: Mon, 27 Jul 2026 10:42:02 +0300
Message-ID: <20260727074234.3761170-3-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::20) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PR3PR08MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: c8513ff9-4518-4453-6fed-08deebb2a71c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|11063799006|56012099006|10067099003|18002099003|22082099003|3023799007|38350700014|921020;
X-Microsoft-Antispam-Message-Info: xQOhBIAYBa+35z2ehO0Cq5BpnnOsjSJ6cgecJBD3aNulw9l6/J+F96C5brILFuoXbYqPSKsP/PZYzCoXQouCzUgr9gv9c9IrijWNHE0AdRJeGPTcONJh/AHzA5X1SMrHlcX/+chtNK7ozPqA4QJQBh7WIy4qvEDe0EEZcXXkHq32Pi8nivD9YpfcyHmxIYBKl/2Wv/e5hnil5ppwm/zFcM+3RnCxDtvyjUA2lkwTWThsK3zCgs+/EsePNYF1FIbfoX+IGP+nCkZjnzQ5auu7Qa6YnbFbMnOQLu9nzdHuc1NrtmzxA8SbYsDPwno/LKKnkv/9RpH8q0L0d/WlfsmrLTerKJ3K+r/l7DavBwpouhN2+QeqWbkkc/Dpm9p3Dj8PUok8Q1J2eYMKJF1XeFBKuOj5pj7jF6vz8uAf+rvXX6ZJkjKqOImwkmMUPfcRYqEAjNKpopXWz4rTkvPoLydZ+PJdWMtk+JThgHVUZePZfu60E37gsfpvCQZFvkDTpvc0YHCfbBsL7SgG0oOlBNk1zSabKEtPDp568KSI/V7Z5sXu5lhWLQ8CXKFQPfAMurwbtZX/cWGczqx4HwlchVTKcXlbal1NW03M3s4Yh83t7pKmNXmuqKYacK6PrYSsbkJBlu+y+YKsHdXTKbdjMiriUQg1QyUL6OgkkpUrj+jseyG1KtoOu/++WYcUldn9lFd8G80H693mpLmNq2T26TXAbofbKeZTyJZjSrqgdDXmiHvACnJ33jb9w9ubM8MNqfsV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9MVmfKHDFR5kzjMjamnDAm/311GwdJiZlNasj3rLnarD1S/SxacfWPWVCsP9?=
 =?us-ascii?Q?2jtR6O6VbdYnnt+HojLaJ9uEY6czYFRL6xepGjNQP2CZDcuGTfO+tV0RXX67?=
 =?us-ascii?Q?SY5tzmtCDnmRHOzArlf6S8WvOeRbPIlhrHBaQmAMvL158DCSVhN/ynIxzJOs?=
 =?us-ascii?Q?4+tB1V7LzeqJ6cNdE4UhhwytHM29kbEhrlXCADeR34eYkj0rGRshkJ7wUl8+?=
 =?us-ascii?Q?xak2oqjUNw6/2cTsbszXi2i4ImH1FTqmy6OjD83PUxHd4CoUrE+7gazv3Wdl?=
 =?us-ascii?Q?TvDRgMdPPyZtAmVB1gwKUebJfLCtWvtkPL0NE8rlnlzBSHx590x7DGuU1i5v?=
 =?us-ascii?Q?thXiVazibONs/NymxIKnnzrinwheoTcxU/Hwqkh2o/vbF/Hn6xYk3CHaSfds?=
 =?us-ascii?Q?BcxMP6idHxcIbBekSYZZn7iTpyO+IMafmh916svWEXfNu79qk2V13IZLBiAY?=
 =?us-ascii?Q?GEIYm1GBuPlyM4chO7U5DLaLX42rp0prVE1FoXfbxMdIPNekyDgaIx+QF2vb?=
 =?us-ascii?Q?/lEL6MqhfOBbdf/idSOjTsZAUt50cRWDZ66zP1+GDDLPFSnA44Ct68cd/G7r?=
 =?us-ascii?Q?RULadgvL7zeIoWMsPBqCPMQnRvVMAfocvSaVCE9rpK50XgHjAb47oCNUd9VO?=
 =?us-ascii?Q?rk7S2vj32VExt3FnzXu+SJh0WyRmF55yGbkhiAC2Um/tBLog51zU6myeB4wg?=
 =?us-ascii?Q?CvTPGGggv7Wz+0oBglNRoHpQS/Q0U+SON9an7E6hW33Zl6u6pJDI3S5JM+MM?=
 =?us-ascii?Q?/RVIqfINMVxLu5TS1UtMGH4jGDpE6vxV6ELoQpxQy/f2wjMkbQZHd2eSqlIS?=
 =?us-ascii?Q?inkOFj9P/8Bfx8NUgua+pO30TEIZzetmqfRFwMgOuKphI1Pqm7OV6UsK65Db?=
 =?us-ascii?Q?cHXf0X11SovkmHjwYZ3DCrO11HHQkS5iKLHgUVFwGPSU/7otSC8f2QI8A6Z7?=
 =?us-ascii?Q?LZHZ6g161WnCamme2zNHcdgGO+5Vs1ceMSsdsjqd/ecn5YmmoN/f/b5qKekC?=
 =?us-ascii?Q?eO4ZoK7cgEe+CErqiEbHNubyRFmLOGKTR4XbhdWEt2Urq6cMkTEsAKy+DcDF?=
 =?us-ascii?Q?6WCLvAQjpqzDZPMRVvkjW5L2W1m2zWdjfzqZjbz5zQhMw7t9DII+BQZ5Yhld?=
 =?us-ascii?Q?OcQuzkWMAhbMVeGWdvBUL9R99o+hyl6orb5CyTDDMpoKnINxkxRtaozRTmY7?=
 =?us-ascii?Q?9i1iCYpf8m17CX6+ZyjpULjMpSclfkOn/5ZtxarKK5lXKxg+EcUQWm5gk/FY?=
 =?us-ascii?Q?lay30fliJtnjIUQeTsBi7/m86GmMZMSOzU7looo802BbvetUBRQ9NwW5en3v?=
 =?us-ascii?Q?61R8S3qNLKkHrW9k7ItjxJLGn2eKtMcEWXKLryvH0IewBgFKi4+aiuBhnOBo?=
 =?us-ascii?Q?Sclid3jeVq8UzdYaxY3Wf5u/OtelmmSmKeFLw320hi+rW8pwbGjX2V1Bv0pK?=
 =?us-ascii?Q?2xsqZ5VRhURV6A8g0Hj2/247zHIB6F9vsKQ4HWx0zs7Y8P+cftcEkDJ8M5S8?=
 =?us-ascii?Q?39f2FnduUcjwx+LKdz0RgEjDtlUsnwUvQSJ2x9Yvbx4ZV0tlNwIccCmpeswF?=
 =?us-ascii?Q?F8qe/rd4erNy4iSYACpzxspsXX1wvAqSdK+SXqQYkccqI+5gMoGQhNIzO6LJ?=
 =?us-ascii?Q?OFtxRtit7KtULeoQVeWZmOhUELoWIL8Rc20cipPFLp3J5NvEhRi5kqnfUJSX?=
 =?us-ascii?Q?uW5Y3fpn9hl+ed6xtpAftRadRe4b7x7iWO0u9SdFE0DN9e+kVvwUUVBKjcas?=
 =?us-ascii?Q?CQeJi1UoXogKOkF8j2Rq6gaiRk4/V3E=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: c8513ff9-4518-4453-6fed-08deebb2a71c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:42:47.5669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mG2XXUfLmyd0VaeXEOHq0PzT6lgtc37CuMqM2OfUEyMVrnb7vN94DtUz2f+4a5RbDfgYD8i9ZhgYQPXbT1jp0hgky4wWTB4pZLm2tTf0+VM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5868
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_004255_791755_0CA55174 
X-CRM114-Status: UNSURE (   8.65  )
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

According to commit 08a5af468e613b ("pinctrl: airoha: fix pwm pin function
for an7581 and an7583") there is no gpio47 pin-group, so device schema must
be fixed.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
index 0c5a7eb6d563e..12dd85b5b4105 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
@@ -208,7 +208,7 @@ patternProperties:
                          gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
                          gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
                          gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
-                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47]
+                         gpio42, gpio43, gpio44, gpio45, gpio46]
           - if:
               properties:
                 function:
-- 
2.53.0


