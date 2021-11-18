Return-Path: <SRS0=mmGE=QF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC61C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 10:08:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8110E61B73
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 10:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8110E61B73
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N6qxHGybiScGPZNJuFY6+1x7E9dkVQxdpHvn2keYN1c=; b=emnSQ6oVVMA3/7
	mpO8arjQbASJ8yovzW0lJwyn9dzMMegaERP6fzyiOETBJppXAeXnXKYGuqO60rQraXxpfg4JqTTg8
	Ln1keSKijUeY1tAVBHIeAXuDPTh0rQUT5I996XllBtXnxPAsKYOu21X2PxAJzKLV8tufgKPjqARWV
	3wxurzCseWrvG32G/ZI+56hvlWvUkj2ltdpVHV9KclNxtlBoQdcxvuWXe1FwxnUt1VAIRcnBwOyde
	VNi8Xbb4+THuCwX3HDQvDXeGKCkBCt7pJV5UH3Wq1CkCZLCmeqo3eV4Zmnc0W2WwRZ5mwJlYVFUx/
	IQj5gJEmDjehGK/kU2AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mneLB-007QQd-N7; Thu, 18 Nov 2021 10:08:25 +0000
Received: from mail-eopbgr80081.outbound.protection.outlook.com ([40.107.8.81]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mneL7-007QM6-Lu
 for linux-mediatek@lists.infradead.org; Thu, 18 Nov 2021 10:08:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cKBCBPU0r/NTHkzP9DRyIB0XSFE8vXvkLVs2O9kfbnWAEHM1vsKHmKdRk8QemoUx9M58YdrXZ8LNqVmHZ3ltwRbQErvXLcm+5q0R43+THmWvcQYjFeoH2+wQYukjApeSSAlTmvGtBGozTguPQb2Qwhg17ekQiu1mAuNccMXH+1x+UyhfYyVAGRnhwI2DjD2EWAbjSiCnQfz0raI3ETm/iKgLd8CzpUAvZluE+oMENsqwQ8e55HylhHKnag051JL8jAmHX19n5idUQGQmOlbWkI7mA6X62W++FJNm4Ld+DyLfYK2aZW7yFtdQcc8gx48aIPd1TpSllw1Vx3DBuEWB/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcbOQalXySIAbgXzXcklFelsLSCQ8XryxySoOXJvAdo=;
 b=B3dv/1mHTeJNt+XQuapJASGDbgCzZeSbXqzmHfD5PuI/eTCHIBwciuFsNnlH+x4oB2bFhZdce6HJvby6OSLsP8zkj4r8tPYorPc54mhO/FGbI2AcX1Ys+TFG1dKBBHMLBqAuLXT9pqugg8Ug3fu4Xq3Kx6XjdsOovTC9i9KygmgmXM/6+ktreL49DxoyBsNEvw056DE9fdeFsdHJq/dKpsFBNhAz4KNCNSji26+T654ZxldPDO6u8GW1Ek0D8mcjDfedLX+ucKZn1Lfx6J0M34dKn9oOj+i/D9hpv1Z+8iw11IaYjNkrwFB7DoQgB5Qx5ucp2hJfREEoq+/BBQhwrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcbOQalXySIAbgXzXcklFelsLSCQ8XryxySoOXJvAdo=;
 b=iTkZuRmpx0lH8YmuR2awohdmVz6mtnDduyQFkJDr4QeLljFldobpNqtv8I8Tk7YFXOL0uuI5yo98CzJZhr398tux54TDD5AaPJ1XA8H+FsByELQO9G0eKFr+Y7u520x3wmpaJCGG0xgtMX9RwGDkbSPjh2ojlq3PEdGBJarFz/M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB4285.eurprd04.prod.outlook.com (2603:10a6:803:4a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 10:08:13 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 10:08:13 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Cc: pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 daniel.baluta@nxp.com, daniel.baluta@gmail.com,
 linux-kernel@vger.kernel.org, yc.hung@mediatek.com,
 linux-mediatek@lists.infradead.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: [PATCH v2 3/8] ASoC: SOF: topology: Add support for Mediatek AFE DAI
Date: Thu, 18 Nov 2021 12:07:44 +0200
Message-Id: <20211118100749.54628-4-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211118100749.54628-1-daniel.baluta@oss.nxp.com>
References: <20211118100749.54628-1-daniel.baluta@oss.nxp.com>
X-ClientProxiedBy: AM4PR0902CA0008.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::18) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:863d:d4f3:969f:6fa)
 by AM4PR0902CA0008.eurprd09.prod.outlook.com (2603:10a6:200:9b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Thu, 18 Nov 2021 10:08:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d1d97e4-97f4-4dc8-329a-08d9aa7b54b0
X-MS-TrafficTypeDiagnostic: VI1PR04MB4285:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB428577CFF2CB5433EB99E347B89B9@VI1PR04MB4285.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aGD0ckE2eko+mChns2xRwfqscLNSXz1hDoRVt7zxxsNfkKRfDC5ae6MUSZzA+N+Ptl0GUhyE57wJrLtXH/iHAwH/Yw6H5r2t6iVhxhZCRVu/aPtDS7rTssI3yymf5vr/xk1ksMdBbybGqHAAQaev99bZTwnKR9HubDn4ggXWJOHJuOLdTGPlqlIllOtt32khaofzE/p+6OWXLdR96t40lRhpQ5WoWgSDQ7ZFiri+GXd3cADMspZk9Qmr9kesfimjVYFwIwdCrCgHxw8eRr7X8hWW3s5c2fYdH0Fa2enuGxVkubkrQ81QVAGX/kKOT2H6pkKP3Qv6icFlx0Uw/9e/DEcofeOOb22o1trNmRfaD4q0Q/4MvpVPWLcCX5NOHMdpLXmWq/m1Ehp4hji+tqOG6lGegv07vUHFUtKvTCa22bGsWWJLZFNqeRco6V+9IkovfGXsr0wh7nTKvfJne+OShnTw5r3aFL4c2/Ea0MhrpOFb0XVNU6EJsmltLT+vUr/sxuZ2GW1ighxZ+huozJFHlHXbqovSLD4t9eujbEXRcj/lWOoP+JRK/0LlHsNXyb+KdLHspzK6V9AiwkwXiPo6luEoTlA3wN76QYtFdANGCwLpxyXLGumyzF8H1F+Rbz1UnHnW/jrzvtsWumjaxGkfIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(54906003)(8676002)(2616005)(4326008)(44832011)(86362001)(7416002)(38100700002)(316002)(508600001)(2906002)(52116002)(6506007)(6486002)(1076003)(6666004)(66556008)(8936002)(66946007)(66476007)(5660300002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUFmVDhaZHlSMk83VmJqMHdVd2tMdXRSTnRuSGkyUkx5Vy9udE5kcWdrZTZm?=
 =?utf-8?B?bjcyUkJLMy9IdDkrT2ZSdk53dWZVNXdZeWpZYkw1NzU4WUpNbHRZUlBrVmUy?=
 =?utf-8?B?QVducE9lNDQxYWRKMWlnMjVpNFdqVSt3MG9XeEpYSHFKWTNyQVcxbGw3NVFn?=
 =?utf-8?B?b3Nua1VvU1JmT3RoczFMelhVODRyMDcwQXF0ZTZmS2wxOUtISFZrR2wwMDNU?=
 =?utf-8?B?Qk5RYjF1ejdKMUZoWVdybXJZOTV4SVhPQW9GeEEvUkFJMkcvOUJFcDlPTDdH?=
 =?utf-8?B?TE9TVTh5c2J4cTRpdVpvSTEwSTUzc09FclFnMXpZSkg2MDVZYkdIZDFJUjdY?=
 =?utf-8?B?RVFsZU5aL0dNWjR2clZXRnJiUWR0ajlOT2JqUmQwNUpIcjRhZ2xoaTllWnRB?=
 =?utf-8?B?Ly9aRGYyTTk5d2prei92MVl2KzVjTEl4elJ3V3NXWUVReU5pLy90RE9UNUpB?=
 =?utf-8?B?Z0tCVmQxR2N4Y3V3by9ORFhwWTdCT3o2WTQ5WEJPcENwdnkybFYrTFVyMDE2?=
 =?utf-8?B?VW5BVEcrMkJ6Z2RGZ1pMQ2hBNFlnYmQyeWw5V1B2Z3JBSHpaWGErejZYL2N4?=
 =?utf-8?B?aDZrNnVNdVVtZXlmTldUeGlqMVBGb2VicjAvQWpCbnBpL3RtcUR1ZVpSeUhz?=
 =?utf-8?B?Q01ldkw5NERLbnB0bm1qR0F1OWlsUEVSRTVZWnFaNE9XQldQN2w2UjZHdEw4?=
 =?utf-8?B?cERvN1lUUTlRbUhhUEhoWDdqMWV4L1lzVDNhdVNJQURDaDFCR2dtbVQxSVNz?=
 =?utf-8?B?eFE0cVlYUndCQklYekdqTHBKN1NRL1FqVllHbXc1RUZSbWxmMEFrcEFSZno3?=
 =?utf-8?B?MEttQ0RTMCtMQjJNaU5Gbk52TEpHVE1qY1UzQWFycUZNd3BEVTI1S1hManJZ?=
 =?utf-8?B?Qk5DQlNzQ2RPbWl5QzlpS3hwc1hlbUl5SUpPQWtvTEd0REkvakNiQlVRUCtG?=
 =?utf-8?B?Z0EzeEV0eTZVVGd3cDdHQ2dGaHZoVHNVNTB1TmQ3RlhsM05zeE94Mm5iMFpm?=
 =?utf-8?B?TXZaNWVMbEFqVkx3NitsWnBPalZUT1NIN0haV056dE5hVWVuM0huaFhETGM2?=
 =?utf-8?B?YzEvZjJGbnpIWFBBSTJyVGNOcERrL2VuNVhEL1BoZ2Q4eUtXaG1rTGM5QWhE?=
 =?utf-8?B?dE41NTFlVzFLbE1PdHVDZytLRFhwMUtsYytZTTA3TjlHblgycXB6UTg2SXYv?=
 =?utf-8?B?T0djMTFPMjJQQTRSbFREcCt2Z1BKb1prK3gzR3RqeE1zRDMxemdZVmUzOHBn?=
 =?utf-8?B?YUFTK1dDY3Nzdy9kOEFQTTYxYVBRWmsxRkNCb1FUSXlFYWdmV3k4TVlLNG9F?=
 =?utf-8?B?SWd6MGpKQk9qalppZm0rb2RWTEtnR3p1R1ZoSlIyS3pUR21HblVRZSt6Y01R?=
 =?utf-8?B?cEtWOS9hWnRuWHpGWE92cXZXNFdab2xPZ2ltMUNsM3VsQlB5Qks0QmZQa2Vl?=
 =?utf-8?B?N3dTL3hwK0RIZTZOdU9oMUJhaXEwVW5CSGdWQXVqK1publJVOTlRR0Q1dFBn?=
 =?utf-8?B?d2pLdE80akZwWU01YWZhRTJYb210eWpLa3JDL0lqdkRiWXpIRXBKZldiMmI1?=
 =?utf-8?B?RUc5a3lPaGtXMVU3cTR3RldXVXNybTQ4SDQ3TjJZK0hnenlWT0Rkb2o4NUZz?=
 =?utf-8?B?TGNvWWFNWEJKU1ZpeHY2bFFJRUI1Uk1EeHJOdWZhVFdTa1NteFRrMDFPT0lE?=
 =?utf-8?B?OWpQMXhJdndGdGdRWGdHeDFMTWFpdWJoQldjTkhwWjBFdDFTaGVvdlJ1QUVu?=
 =?utf-8?B?V0lvaFhjSXFNSnJQOUhDYkkwY3ZVTVRPVmVNS3ljQlEwdnJwWlUwQ3ArWDh2?=
 =?utf-8?B?QmhtdzJUM2ZOd1JYTEtZRy9oK0V4Uk9JbnNOcHRYUUk5bzZLTm5qblhtVTM5?=
 =?utf-8?B?VjdGQVBnUHVKRWpDSHFxeHZnaG9LNFNXblg1anVuKzVRU3VONEk0T0RJVGNh?=
 =?utf-8?B?ZGxZcXdYd24xZGt0WnFXODNmVFgreWkva0ZXWm9HSU1vKzlqNHppWVVQdlJI?=
 =?utf-8?B?MHlQdW84b0pRS0h6aTdtNWhDNDFzbGwyY2ozMzk4dHdNY29WL1FWNC8zMUkr?=
 =?utf-8?B?VUg0djVXM09XZ1B0YThZMjZIcC9GRkRUTXFrcXp5UUE2ZTBJektjYlNMc20z?=
 =?utf-8?B?dCtIbjR6VUJ6OWsrVzJVK2pJTm11VFh5a1llMHBQTm1HcG9sOWFPMUtvLzM0?=
 =?utf-8?B?b25IcndyWG11SmdpbDNQU0ZZQ1cvT2Uzb0lTMGw2a0hzU3V4cEJ1REtWU1F0?=
 =?utf-8?Q?F1CI/Ppe0ddl0WcNhXFGVDypYE+rHWxpDsV6A7sP5E=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d1d97e4-97f4-4dc8-329a-08d9aa7b54b0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 10:08:13.5764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64eiMknWr7u0SjoUbpDdOE4FsiArEX/tzl6l9CJXMjPpcvs9zL+rMdpCx2VVMGbccfmT3xWLTQsA/Swj/9T+lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4285
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_020821_783444_FB5FC53C 
X-CRM114-Status: GOOD (  18.64  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RnJvbTogWUMgSHVuZyA8eWMuaHVuZ0BtZWRpYXRlay5jb20+CgpBZGQgbmV3IHNvZiBkYWkgYW5k
IGNvbmZpZyB0byBwYXNzIHRvcG9sb2d5IGZpbGUgY29uZmlndXJhdGlvbgp0byBTT0YgZmlybXdh
cmUgcnVubmluZyBvbiBNZWRpYXRlayBwbGF0Zm9ybSBEU1AgY29yZS4KQWRkIG1lZGlhdGVrIGF1
ZGlvIGZyb250IGVuZChBRkUpIHRvIHRoZSBsaXN0IG9mIHN1cHBvcnRlZCBzb2ZfZGFpcwoKU2ln
bmVkLW9mZi1ieTogWUMgSHVuZyA8eWMuaHVuZ0BtZWRpYXRlay5jb20+ClJldmlld2VkLWJ5OiBQ
w6l0ZXIgVWpmYWx1c2kgPHBldGVyLnVqZmFsdXNpQGxpbnV4LmludGVsLmNvbT4KUmV2aWV3ZWQt
Ynk6IFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IDxwaWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRl
bC5jb20+ClJldmlld2VkLWJ5OiBSYW5qYW5pIFNyaWRoYXJhbiA8cmFuamFuaS5zcmlkaGFyYW5A
bGludXguaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogS2FpIFZlaG1hbmVuIDxrYWkudmVobWFuZW5A
bGludXguaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogR3Vlbm5hZGkgTGlha2hvdmV0c2tpIDxndWVu
bmFkaS5saWFraG92ZXRza2lAbGludXguaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogRGFuaWVsIEJh
bHV0YSA8ZGFuaWVsLmJhbHV0YUBueHAuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgQmFsdXRh
IDxkYW5pZWwuYmFsdXRhQG54cC5jb20+Ci0tLQogaW5jbHVkZS9zb3VuZC9zb2YvZGFpLW1lZGlh
dGVrLmggfCAyMyArKysrKysrKysrKysrCiBpbmNsdWRlL3NvdW5kL3NvZi9kYWkuaCAgICAgICAg
ICB8ICAzICsrCiBzb3VuZC9zb2Mvc29mL3BjbS5jICAgICAgICAgICAgICB8IDEyICsrKysrKysK
IHNvdW5kL3NvYy9zb2YvdG9wb2xvZ3kuYyAgICAgICAgIHwgNTkgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgOTcgaW5zZXJ0aW9ucygrKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IGluY2x1ZGUvc291bmQvc29mL2RhaS1tZWRpYXRlay5oCgpkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9zb3VuZC9zb2YvZGFpLW1lZGlhdGVrLmggYi9pbmNsdWRlL3NvdW5kL3NvZi9k
YWktbWVkaWF0ZWsuaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjYy
ZGQ0NzIwNTU4ZAotLS0gL2Rldi9udWxsCisrKyBiL2luY2x1ZGUvc291bmQvc29mL2RhaS1tZWRp
YXRlay5oCkBAIC0wLDAgKzEsMjMgQEAKKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BM
LTIuMC1vbmx5IE9SIEJTRC0zLUNsYXVzZSkgKi8KKy8qCisgKiBDb3B5cmlnaHQoYykgMjAyMSBN
ZWRpYXRlayBDb3Jwb3JhdGlvbi4gQWxsIHJpZ2h0cyByZXNlcnZlZC4KKyAqCisgKiBBdXRob3I6
IEJvIFBhbiA8Ym8ucGFuQG1lZGlhdGVrLmNvbT4KKyAqLworCisjaWZuZGVmIF9fSU5DTFVERV9T
T1VORF9TT0ZfREFJX01FRElBVEVLX0hfXworI2RlZmluZSBfX0lOQ0xVREVfU09VTkRfU09GX0RB
SV9NRURJQVRFS19IX18KKworI2luY2x1ZGUgPHNvdW5kL3NvZi9oZWFkZXIuaD4KKworc3RydWN0
IHNvZl9pcGNfZGFpX210a19hZmVfcGFyYW1zIHsKKwlzdHJ1Y3Qgc29mX2lwY19oZHIgaGRyOwor
CXUzMiBjaGFubmVsczsKKwl1MzIgcmF0ZTsKKwl1MzIgZm9ybWF0OworCXUzMiBzdHJlYW1faWQ7
CisJdTMyIHJlc2VydmVkWzRdOyAvKiByZXNlcnZlIGZvciBmdXR1cmUgKi8KK30gX19wYWNrZWQ7
CisKKyNlbmRpZgorCmRpZmYgLS1naXQgYS9pbmNsdWRlL3NvdW5kL3NvZi9kYWkuaCBiL2luY2x1
ZGUvc291bmQvc29mL2RhaS5oCmluZGV4IDM3ODIxMjdhNzA5NS4uNTEzMmJjNjBmNTRiIDEwMDY0
NAotLS0gYS9pbmNsdWRlL3NvdW5kL3NvZi9kYWkuaAorKysgYi9pbmNsdWRlL3NvdW5kL3NvZi9k
YWkuaApAQCAtMTMsNiArMTMsNyBAQAogI2luY2x1ZGUgPHNvdW5kL3NvZi9kYWktaW50ZWwuaD4K
ICNpbmNsdWRlIDxzb3VuZC9zb2YvZGFpLWlteC5oPgogI2luY2x1ZGUgPHNvdW5kL3NvZi9kYWkt
YW1kLmg+CisjaW5jbHVkZSA8c291bmQvc29mL2RhaS1tZWRpYXRlay5oPgogCiAvKgogICogREFJ
IENvbmZpZ3VyYXRpb24uCkBAIC03MCw2ICs3MSw3IEBAIGVudW0gc29mX2lwY19kYWlfdHlwZSB7
CiAJU09GX0RBSV9BTURfQlQsCQkJLyoqPCBBTUQgQUNQIEJUKi8KIAlTT0ZfREFJX0FNRF9TUCwJ
CQkvKio8IEFNRCBBQ1AgU1AgKi8KIAlTT0ZfREFJX0FNRF9ETUlDLAkJLyoqPCBBTUQgQUNQIERN
SUMgKi8KKwlTT0ZfREFJX01FRElBVEVLX0FGRSwJCS8qKjwgTWVkaWF0ZWsgQUZFICovCiB9Owog
CiAvKiBnZW5lcmFsIHB1cnBvc2UgREFJIGNvbmZpZ3VyYXRpb24gKi8KQEAgLTk3LDYgKzk5LDcg
QEAgc3RydWN0IHNvZl9pcGNfZGFpX2NvbmZpZyB7CiAJCXN0cnVjdCBzb2ZfaXBjX2RhaV9hY3Bf
cGFyYW1zIGFjcGJ0OwogCQlzdHJ1Y3Qgc29mX2lwY19kYWlfYWNwX3BhcmFtcyBhY3BzcDsKIAkJ
c3RydWN0IHNvZl9pcGNfZGFpX2FjcF9wYXJhbXMgYWNwZG1pYzsKKwkJc3RydWN0IHNvZl9pcGNf
ZGFpX210a19hZmVfcGFyYW1zIGFmZTsKIAl9OwogfSBfX3BhY2tlZDsKIApkaWZmIC0tZ2l0IGEv
c291bmQvc29jL3NvZi9wY20uYyBiL3NvdW5kL3NvYy9zb2YvcGNtLmMKaW5kZXggOGQzMTNjOTg2
MmNiLi4zMWRkNzliNzk0ZjEgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9zb2YvcGNtLmMKKysrIGIv
c291bmQvc29jL3NvZi9wY20uYwpAQCAtODA4LDYgKzgwOCwxOCBAQCBpbnQgc29mX3BjbV9kYWlf
bGlua19maXh1cChzdHJ1Y3Qgc25kX3NvY19wY21fcnVudGltZSAqcnRkLCBzdHJ1Y3Qgc25kX3Bj
bV9od19wYQogCQljaGFubmVscy0+bWluID0gZGFpLT5kYWlfY29uZmlnLT5lc2FpLnRkbV9zbG90
czsKIAkJY2hhbm5lbHMtPm1heCA9IGRhaS0+ZGFpX2NvbmZpZy0+ZXNhaS50ZG1fc2xvdHM7CiAK
KwkJZGV2X2RiZyhjb21wb25lbnQtPmRldiwKKwkJCSJyYXRlX21pbjogJWQgcmF0ZV9tYXg6ICVk
XG4iLCByYXRlLT5taW4sIHJhdGUtPm1heCk7CisJCWRldl9kYmcoY29tcG9uZW50LT5kZXYsCisJ
CQkiY2hhbm5lbHNfbWluOiAlZCBjaGFubmVsc19tYXg6ICVkXG4iLAorCQkJY2hhbm5lbHMtPm1p
biwgY2hhbm5lbHMtPm1heCk7CisJCWJyZWFrOworCWNhc2UgU09GX0RBSV9NRURJQVRFS19BRkU6
CisJCXJhdGUtPm1pbiA9IGRhaS0+ZGFpX2NvbmZpZy0+YWZlLnJhdGU7CisJCXJhdGUtPm1heCA9
IGRhaS0+ZGFpX2NvbmZpZy0+YWZlLnJhdGU7CisJCWNoYW5uZWxzLT5taW4gPSBkYWktPmRhaV9j
b25maWctPmFmZS5jaGFubmVsczsKKwkJY2hhbm5lbHMtPm1heCA9IGRhaS0+ZGFpX2NvbmZpZy0+
YWZlLmNoYW5uZWxzOworCiAJCWRldl9kYmcoY29tcG9uZW50LT5kZXYsCiAJCQkicmF0ZV9taW46
ICVkIHJhdGVfbWF4OiAlZFxuIiwgcmF0ZS0+bWluLCByYXRlLT5tYXgpOwogCQlkZXZfZGJnKGNv
bXBvbmVudC0+ZGV2LApkaWZmIC0tZ2l0IGEvc291bmQvc29jL3NvZi90b3BvbG9neS5jIGIvc291
bmQvc29jL3NvZi90b3BvbG9neS5jCmluZGV4IDcyZTY3MWMxNWEzNC4uMTBjYWYyYjFhMzNjIDEw
MDY0NAotLS0gYS9zb3VuZC9zb2Mvc29mL3RvcG9sb2d5LmMKKysrIGIvc291bmQvc29jL3NvZi90
b3BvbG9neS5jCkBAIC0zNzksNiArMzc5LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzb2ZfZGFp
X3R5cGVzIHNvZl9kYWlzW10gPSB7CiAJeyJBQ1AiLCBTT0ZfREFJX0FNRF9CVH0sCiAJeyJBQ1BT
UCIsIFNPRl9EQUlfQU1EX1NQfSwKIAl7IkFDUERNSUMiLCBTT0ZfREFJX0FNRF9ETUlDfSwKKwl7
IkFGRSIsIFNPRl9EQUlfTUVESUFURUtfQUZFfSwKIH07CiAKIHN0YXRpYyBlbnVtIHNvZl9pcGNf
ZGFpX3R5cGUgZmluZF9kYWkoY29uc3QgY2hhciAqbmFtZSkKQEAgLTgwNiw2ICs4MDcsMTkgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBzb2ZfdG9wb2xvZ3lfdG9rZW4gbGVkX3Rva2Vuc1tdID0gewog
CSBnZXRfdG9rZW5fdTMyLCBvZmZzZXRvZihzdHJ1Y3Qgc25kX3NvZl9sZWRfY29udHJvbCwgZGly
ZWN0aW9uKSwgMH0sCiB9OwogCisvKiBBRkUgKi8KK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc29mX3Rv
cG9sb2d5X3Rva2VuIGFmZV90b2tlbnNbXSA9IHsKKwl7U09GX1RLTl9NRURJQVRFS19BRkVfUkFU
RSwKKwkJU05EX1NPQ19UUExHX1RVUExFX1RZUEVfV09SRCwgZ2V0X3Rva2VuX3UzMiwKKwkJb2Zm
c2V0b2Yoc3RydWN0IHNvZl9pcGNfZGFpX210a19hZmVfcGFyYW1zLCByYXRlKSwgMH0sCisJe1NP
Rl9US05fTUVESUFURUtfQUZFX0NILAorCQlTTkRfU09DX1RQTEdfVFVQTEVfVFlQRV9XT1JELCBn
ZXRfdG9rZW5fdTMyLAorCQlvZmZzZXRvZihzdHJ1Y3Qgc29mX2lwY19kYWlfbXRrX2FmZV9wYXJh
bXMsIGNoYW5uZWxzKSwgMH0sCisJe1NPRl9US05fTUVESUFURUtfQUZFX0ZPUk1BVCwKKwkJU05E
X1NPQ19UUExHX1RVUExFX1RZUEVfU1RSSU5HLCBnZXRfdG9rZW5fY29tcF9mb3JtYXQsCisJCW9m
ZnNldG9mKHN0cnVjdCBzb2ZfaXBjX2RhaV9tdGtfYWZlX3BhcmFtcywgZm9ybWF0KSwgMH0sCit9
OworCiBzdGF0aWMgaW50IHNvZl9wYXJzZV91dWlkX3Rva2VucyhzdHJ1Y3Qgc25kX3NvY19jb21w
b25lbnQgKnNjb21wLAogCQkJCSB2b2lkICpvYmplY3QsCiAJCQkJIGNvbnN0IHN0cnVjdCBzb2Zf
dG9wb2xvZ3lfdG9rZW4gKnRva2VucywKQEAgLTMwOTEsNiArMzEwNSw0OCBAQCBzdGF0aWMgaW50
IHNvZl9saW5rX2FjcF9zcF9sb2FkKHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqc2NvbXAsIGlu
dCBpbmRleCwKIAlyZXR1cm4gcmV0OwogfQogCitzdGF0aWMgaW50IHNvZl9saW5rX2FmZV9sb2Fk
KHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqc2NvbXAsIGludCBpbmRleCwKKwkJCSAgICAgc3Ry
dWN0IHNuZF9zb2NfZGFpX2xpbmsgKmxpbmssCisJCQkgICAgIHN0cnVjdCBzbmRfc29jX3RwbGdf
bGlua19jb25maWcgKmNmZywKKwkJCSAgICAgc3RydWN0IHNuZF9zb2NfdHBsZ19od19jb25maWcg
Kmh3X2NvbmZpZywKKwkJCSAgICAgc3RydWN0IHNvZl9pcGNfZGFpX2NvbmZpZyAqY29uZmlnKQor
eworCXN0cnVjdCBzbmRfc29mX2RldiAqc2RldiA9IHNuZF9zb2NfY29tcG9uZW50X2dldF9kcnZk
YXRhKHNjb21wKTsKKwlzdHJ1Y3Qgc25kX3NvY190cGxnX3ByaXZhdGUgKnByaXZhdGUgPSAmY2Zn
LT5wcml2OworCXN0cnVjdCBzbmRfc29jX2RhaSAqZGFpOworCXUzMiBzaXplID0gc2l6ZW9mKCpj
b25maWcpOworCWludCByZXQ7CisKKwljb25maWctPmhkci5zaXplID0gc2l6ZTsKKworCS8qIGdl
dCBhbnkgYmVzcG9rZSBEQUkgdG9rZW5zICovCisJcmV0ID0gc29mX3BhcnNlX3Rva2VucyhzY29t
cCwgJmNvbmZpZy0+YWZlLCBhZmVfdG9rZW5zLAorCQkJICAgICAgIEFSUkFZX1NJWkUoYWZlX3Rv
a2VucyksIHByaXZhdGUtPmFycmF5LAorCQkJICAgICAgIGxlMzJfdG9fY3B1KHByaXZhdGUtPnNp
emUpKTsKKwlpZiAocmV0ICE9IDApIHsKKwkJZGV2X2VycihzY29tcC0+ZGV2LCAicGFyc2UgYWZl
IHRva2VucyBmYWlsZWQgJWRcbiIsCisJCQlsZTMyX3RvX2NwdShwcml2YXRlLT5zaXplKSk7CisJ
CXJldHVybiByZXQ7CisJfQorCisJZGV2X2RiZyhzY29tcC0+ZGV2LCAiQUZFIGNvbmZpZyByYXRl
ICVkIGNoYW5uZWxzICVkIGZvcm1hdDolZFxuIiwKKwkJY29uZmlnLT5hZmUucmF0ZSwgY29uZmln
LT5hZmUuY2hhbm5lbHMsIGNvbmZpZy0+YWZlLmZvcm1hdCk7CisKKwlkYWkgPSBzbmRfc29jX2Zp
bmRfZGFpKGxpbmstPmNwdXMpOworCWlmICghZGFpKSB7CisJCWRldl9lcnIoc2NvbXAtPmRldiwg
IiVzOiBmYWlsZWQgdG8gZmluZCBkYWkgJXMiLCBfX2Z1bmNfXywgbGluay0+Y3B1cy0+ZGFpX25h
bWUpOworCQlyZXR1cm4gLUVJTlZBTDsKKwl9CisKKwljb25maWctPmFmZS5zdHJlYW1faWQgPSBE
TUFfQ0hBTl9JTlZBTElEOworCisJcmV0ID0gc29mX3NldF9kYWlfY29uZmlnKHNkZXYsIHNpemUs
IGxpbmssIGNvbmZpZyk7CisJaWYgKHJldCA8IDApCisJCWRldl9lcnIoc2NvbXAtPmRldiwgImZh
aWxlZCB0byBwcm9jZXNzIGFmZSBkYWkgbGluayAlcyIsIGxpbmstPm5hbWUpOworCisJcmV0dXJu
IHJldDsKK30KKwogc3RhdGljIGludCBzb2ZfbGlua19kbWljX2xvYWQoc3RydWN0IHNuZF9zb2Nf
Y29tcG9uZW50ICpzY29tcCwgaW50IGluZGV4LAogCQkJICAgICAgc3RydWN0IHNuZF9zb2NfZGFp
X2xpbmsgKmxpbmssCiAJCQkgICAgICBzdHJ1Y3Qgc25kX3NvY190cGxnX2xpbmtfY29uZmlnICpj
ZmcsCkBAIC0zMzg2LDYgKzM0NDIsOSBAQCBzdGF0aWMgaW50IHNvZl9saW5rX2xvYWQoc3RydWN0
IHNuZF9zb2NfY29tcG9uZW50ICpzY29tcCwgaW50IGluZGV4LAogCQlyZXQgPSBzb2ZfbGlua19h
Y3BfZG1pY19sb2FkKHNjb21wLCBpbmRleCwgbGluaywgY2ZnLCBod19jb25maWcgKyBjdXJyX2Nv
bmYsCiAJCQkJCSAgICAgY29uZmlnKTsKIAkJYnJlYWs7CisJY2FzZSBTT0ZfREFJX01FRElBVEVL
X0FGRToKKwkJcmV0ID0gc29mX2xpbmtfYWZlX2xvYWQoc2NvbXAsIGluZGV4LCBsaW5rLCBjZmcs
IGh3X2NvbmZpZyArIGN1cnJfY29uZiwgY29uZmlnKTsKKwkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJ
ZGV2X2VycihzY29tcC0+ZGV2LCAiZXJyb3I6IGludmFsaWQgREFJIHR5cGUgJWRcbiIsIGNvbW1v
bl9jb25maWcudHlwZSk7CiAJCXJldCA9IC1FSU5WQUw7Ci0tIAoyLjI3LjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
