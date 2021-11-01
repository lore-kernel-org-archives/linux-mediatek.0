Return-Path: <SRS0=DXFh=PU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80BC0C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 08:01:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E7DA60F70
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 08:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E7DA60F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=klKwHmCVoB/LWuZcS/gqBSyY0j3cWqLygE2Bt+qtUJE=; b=jGsSj8bUrSllP0
	D8zskFwFSLSmlWrnUju9JXN51/XecvCqPQeJZYdK6g0fsg5icTYuNlWX+RAJ8XzL5TSUncMOZRu9q
	DitDg00heacgy4TeEdw7CSrg90q4y3ASx96oWoQuHje11XcUB5KWBhB5E2k4jLsTeaZeO8BbGO6fx
	U470tk4+4K1O6YJ4vubqNQG+BQtdm6yDh9KbELexf/69Hy7frUCtNJgWEG6CCVUELPPluBRLz050i
	OUY+b2T1S/yl6r9gIgB62qgETS3/DnePEO8YXstzlEJCgb7vv340GT9BPNd5A+Hk297A2tc9dCzJb
	cmYf9qAgEKYYPu1qsGFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhSFU-00FbnP-Mj; Mon, 01 Nov 2021 08:00:56 +0000
Received: from mail-eopbgr50044.outbound.protection.outlook.com ([40.107.5.44]
 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhSFS-00Fbm8-0I
 for linux-mediatek@lists.infradead.org; Mon, 01 Nov 2021 08:00:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzAfdJeoEPj/Z/W/jgXqdW+Tw06u6xkErJHMkUouc9iLnCrdfBmdvJLsXH6xVuybdy9ZyHMAW8VDSCU/NXbYFaCytFnxGQtQn0c5CRfKdtPhe9UEGAaUiTJ7lFabcXGAB6wQ4PHl5b0+g6suez2A5qiqDuvOemZy5ImPkqc3KEI6jGdnoubQPCVFUVlYKxYc1W8I2obwb5xtzStrP44JZN9CM6eUqhmzTWvYAxprfy367DP9qi07GKHqdMJr6Zj077/jTq7Lcn9M6fOARPfgso06boW+anrHEvuYugAA5YWv8EGAz7Y4eZ5gXlWSZ+/XbiVaWFqyrfi2oZOeaKQL1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aqt20fJUIGTFP4E/vWRRVNFTpG1mnUMB2/YdINTbsV4=;
 b=fIV2CzHBr/UsfNGnn03UXqBZJqQOD9rin2L8SWPjyaEI+Y80TExsBnsRcjWna4mXiE8DjCpCTQpqNU9PSwv8c4cZHaWshmiRleywdDuQSnxSMAVVjNLqHdYW3JKIRSom6udsCdpl/jOEbHluLwURWy9TRPKEclwkv386KNHoCl6xiJL8Ym8kZqtH/xOb5sjy2xv3fh8IqA0Utm8rc9+yjotYBOtV1od66r88hKFFcZwtztaRVWIVfQU2xQkUD7zafAgHkyKWwxhmd5WAq1SakTiaqZWck1rzxGF2+ZAUOLeKwZzh6R9JVSmgGYa3aKnjFVR+RmJ3Z2/nCK1pWHK54w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aqt20fJUIGTFP4E/vWRRVNFTpG1mnUMB2/YdINTbsV4=;
 b=B5UESwyLVTEjNWZB3za2DG72jGdw5Wogp2Hk4F8yZYKyw6pDCr5wyKTyIJvocJV/s9krzKwh4J+l9n5yjN3NG8L8sLKAFm5AX7jbuvXuNZNXVCvqEY8CcLM/+SOyoDUCw9JD5lR0ClkoUY6iciiPkjr+lAK8Ncv7YA8uX2T06wA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR0401MB2430.eurprd04.prod.outlook.com (2603:10a6:800:2b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Mon, 1 Nov
 2021 08:00:50 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 08:00:50 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Cc: peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
 guennadi.liakhovetski@linux.intel.com, daniel.baluta@gmail.com,
 linux-mediatek@lists.infradead.org, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 YC Hung <yc.hung@mediatek.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH 2/6] ASoC: SOF: tokens: add token for Mediatek AFE
Date: Mon,  1 Nov 2021 10:00:22 +0200
Message-Id: <20211101080026.297360-3-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211101080026.297360-1-daniel.baluta@oss.nxp.com>
References: <20211101080026.297360-1-daniel.baluta@oss.nxp.com>
X-ClientProxiedBy: AM3PR07CA0070.eurprd07.prod.outlook.com
 (2603:10a6:207:4::28) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5719:1500:cdb2:376b:257c:429a)
 by AM3PR07CA0070.eurprd07.prod.outlook.com (2603:10a6:207:4::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.9 via Frontend
 Transport; Mon, 1 Nov 2021 08:00:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c9dd50a-e17b-4483-0c26-08d99d0db816
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2430:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2430D52AA84F480DA1D2C22DB88A9@VI1PR0401MB2430.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EqxBmEOIB79aqUgcsADftyXcxLEnzYkKud9uGRBuEls6BFN/jLs+TETgRXFe6ozov8CmvhQAAAYCD60JHGKiKjtcY5oW57MURWOOvf//1yq0CQTzRsd0j/V4FJrEA3gqKwhZnIgOwysBlr9g7dEkT+/vmy2R8JYCMXkk8hFh0rcN01fyJXlLdUkZfRV7ucOXB/AwJbvMChI8WHwuoLcJc3+qAHzRqM7uLk1KFvfqWaBJATbR8dXd2JsLTqKHbPSKuM6GKUEV0ctujlomEpeKFdU8JBWbiHnVMV2RwAMet3CeNhw614AQ01Mf/WZNzzXjqUAXa+XLSHMCscquNhCR6IGkqFHurm3He67c2VKBcOoDPuZdXxxxsye2oxM3fDfExesmaheyh5as8yvtjFeZxXMg/EhCyGkVjKNV+qzlsUT89GWk79ZqJ7DDO8C2lwzwSPQiUTU7ENS9OR14fo3KDUHBAYcY9wniipeTOmOD7LIUNHjeK2qMLINYle1X7RxNpi9Jbd+HCkLwFvpsbWm7g3gbw9XF1gxZ36sX6al6VWOwYFFN6DDvOy4Ww60teyvdHdr7GqFS6CXar7pQ0T4a7L6nyUeUX2UTxTM6JD+bckCsFvfk8Mhj/fDJvm0LyttAmxtL/1Et8LMuq1lSp8JOPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(8676002)(508600001)(54906003)(6486002)(8936002)(6506007)(1076003)(5660300002)(52116002)(6666004)(44832011)(6512007)(66476007)(2906002)(7416002)(2616005)(66946007)(38100700002)(186003)(86362001)(66556008)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0tRdEcxRDJ0ZG53M2xaSTRJTWp4Nk81QVZrMnpqWTNYSEpXWnlnZTZObk40?=
 =?utf-8?B?dk5nL1o3UzlVc3hnVElTeTArRUI5QTJsYy9UdUdoVDVlYmg1L2YyUEQ2aER4?=
 =?utf-8?B?MEg4YlVHenJKWG5YSVMxMHFORXNNelRldUgrWmdKS0tnWTFhYmpmakhJeHVX?=
 =?utf-8?B?NU1YaU50QXQwa1lteFVFcUFqUlo5M2NpUStCdzFBWEVkRE8wNFhjQnR0UTBP?=
 =?utf-8?B?UzFiKzAxaDJoNkdLcHV3NE1ON3pEQzBnbjFDZEsvb3M0a0pTczZtZ2N0L2ln?=
 =?utf-8?B?Yncyc2czcnF2UW52bGpqSXphK0hrdzN2SUFoQmZBRERDVlg4Z2gvdVpiYmdG?=
 =?utf-8?B?R2UzbCsvdGkxMm1RMHRETlJPT05OMzZjbytNeUF2UjVQc1c3ZjhUU2xSU1JP?=
 =?utf-8?B?YXJ4LzAybExQWk0rMkdaZ1B6clFRVkxxaGFHbFQ4TlYrSVNISzFEOHdLTlN5?=
 =?utf-8?B?NVJCOVN1eTdVM0RKcHozRzZzbG0weTNYTlFqdmp4WDRQclBrZWRWV2dZU3Fr?=
 =?utf-8?B?TGk3MFNGamxROHN4UlllVytUbjVRWmYwOW9rODJOZkY5ekxaZG1YUFZ0aXRT?=
 =?utf-8?B?VUxYK21iTElUdi9ieHRoSjZtcFNuMHJFWHBwelQyTW9HNzBMd1NsUWhHWVhD?=
 =?utf-8?B?bUpaNWlhOE0wQjBLUVJybGlXbzNuSHlMbzVJM1pNaGxhQnFmUXhsb09yeVpW?=
 =?utf-8?B?QU9adHk4dU0yZldXZkZjdHlVR0puWUZHRWNsSE1lSXhuTnNRcUl1QTJLeEVp?=
 =?utf-8?B?OEJSK3cxdDEvMjZEWGpFNlBnZHJkNXozaCtBKzVhb2RkVm1rT3g4OHhUUEFa?=
 =?utf-8?B?ODlJeE9FRWdjNGZrNGJaN3MzaVowUDc5aXplbGUyV0ZkQldjcVdzWmxnakF5?=
 =?utf-8?B?TTVTeVV0aEVGK2ppaE5HVkIwZkFoRHdPSnNhMytkd0Z4VWYvR05oRXVqZEtl?=
 =?utf-8?B?RHNTbWgrSklwMTZQeCtQTXd0cmVScTRNMUEvT3NHNS9nODR1Qkt4QXNVYmhy?=
 =?utf-8?B?SlVIV0loMUJOeU5kR2sySklMM1dqTnhIMUtKUzRoWHdHS1Uvam5jbTlxcEpS?=
 =?utf-8?B?anczcExlRUFldlZtaERJZm1teTB1dHhGZWdBRHFOVXNqVG9vK2dVOUs5WUVH?=
 =?utf-8?B?Zjl4Q1JBcXdwWFhvYVhLNm1ZTDZYN3FiOFdldUg3cDRYYXhabDMvaG9GU3I1?=
 =?utf-8?B?d2xHS2Q3MmdjUkduVktJNzVxZHB0V3JvTTFkdnY5R2krTDl5TUdneEhCanVD?=
 =?utf-8?B?YjZqZEk4Z1R4NkViWWkza1lDR3pwQzdodjFieGVxUlp4SVRYV29JcnJrdC9X?=
 =?utf-8?B?eVZQNVBJeVZJa0RmOEtTY25kbUlsRDB3ZFhaZWk0Y08wTDJ5aGdFNUlGN3BZ?=
 =?utf-8?B?WlZMV3V6NktHYndIbUZpMGl5amZpN2c4NmRhcEFUeWhiMDVaSkoyTlJWUHpB?=
 =?utf-8?B?VElWNTEwR3FPcE03bmtnNmhUSjhWSVZBNThuQW02YnEvbGp5V2JkZlRwNThp?=
 =?utf-8?B?bkVHcUwwUUVmS3RCRnhZNng4VERENEhSMzA5RmRIOWJIWGlRbkpUcXpxaHVm?=
 =?utf-8?B?bVI0b2YrV1NBbmI0RUdRbDhpK1pQRFhaQkduMHkwYzFsZ21pYjAwT3pNc2NG?=
 =?utf-8?B?UjlTTFFDbXRvVnU5YWdLekI2a3hVN3lKYXMvaGt5ZG5tL2RFNnZraVVxNEVE?=
 =?utf-8?B?MFJ1NkxIYXZlelhDY1Z6NjVMK3hlZG9WZ2tNL1R1N0UrMVA2Y0dydk5EYkJK?=
 =?utf-8?B?Nk5mWm5pYUlQMGpMRTNod2hST2VIZVhsLzgxaU5SWEtxNmFScjdOejJHUVZy?=
 =?utf-8?B?MjVuaEtpdC92K0p6RE1hM3g2eHJTR2U1OXc1WUtRVDVrZ1RJVTdTRGJTSHhE?=
 =?utf-8?B?SzQ4MzFYZitRd01CWmFzZVF1RWZwQ28zZEZXTUlQVVRFRXROYk1LUWVBcWl4?=
 =?utf-8?B?RzRIeTdxNTJhSExRelovNFVBZ1BYY09JRklyT292MHBOeTR2MG1HVkU1V1hk?=
 =?utf-8?B?RjdLMWZVaTliQ3Y4a1pqRDA5ZkxKMW01L0tTZGcyeXEwYy9GQjk5OXFidXRM?=
 =?utf-8?B?M1V2ZlBOTnlMSThVcHVITnMyM2N3WXVyM24rekhSUHBiUE1tVFFVYVVhbW10?=
 =?utf-8?B?bTlrS1NoWG5JUGtzS1pEUTNLMDFxV1pyYms0VEdBU2lSb2NJT1VLS3JDYk9v?=
 =?utf-8?B?NXo1VjFWRml1ckk1Wm51dVllaTBERG1ZQW9ZRDBlSVRIbG1QQmRqTUlNYzBG?=
 =?utf-8?Q?N6KXwLiSFm8sHwWBSb+oDEBfVsEl42tIB0Y+e5h3C0=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9dd50a-e17b-4483-0c26-08d99d0db816
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 08:00:49.9923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cx6JJlzCq98sDjkq/HnSqM4ICmM9NROzjSnFVnRmv/qO8rJIR3fJ6q2i4xSx7I9aqJNo4naAb00OR3IduB+FVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2430
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_010054_073537_064CD6E2 
X-CRM114-Status: UNSURE (   7.61  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RnJvbTogWUMgSHVuZyA8eWMuaHVuZ0BtZWRpYXRlay5jb20+CgpBZGQgdGhlIGRlZmluaXRpb24g
Zm9yIE1lZGlhdGVrIGF1ZGlvIGZyb250IGVuZChBRkUpIHRva2VucyxpbmNsdWRlCkFGRSBzYW1w
bGluZyByYXRlLCBjaGFubmVscywgYW5kIGZvcm1hdC4KClNpZ25lZC1vZmYtYnk6IFlDIEh1bmcg
PHljLmh1bmdAbWVkaWF0ZWsuY29tPgpSZXZpZXdlZC1ieTogUMOpdGVyIFVqZmFsdXNpIDxwZXRl
ci51amZhbHVzaUBsaW51eC5pbnRlbC5jb20+ClJldmlld2VkLWJ5OiBQaWVycmUtTG91aXMgQm9z
c2FydCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPgpSZXZpZXdlZC1ieTog
UmFuamFuaSBTcmlkaGFyYW4gPHJhbmphbmkuc3JpZGhhcmFuQGxpbnV4LmludGVsLmNvbT4KUmV2
aWV3ZWQtYnk6IEthaSBWZWhtYW5lbiA8a2FpLnZlaG1hbmVuQGxpbnV4LmludGVsLmNvbT4KUmV2
aWV3ZWQtYnk6IEd1ZW5uYWRpIExpYWtob3ZldHNraSA8Z3Vlbm5hZGkubGlha2hvdmV0c2tpQGxp
bnV4LmludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIEJhbHV0YSA8ZGFuaWVsLmJhbHV0
YUBueHAuY29tPgotLS0KIGluY2x1ZGUvdWFwaS9zb3VuZC9zb2YvdG9rZW5zLmggfCA1ICsrKysr
CiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91
YXBpL3NvdW5kL3NvZi90b2tlbnMuaCBiL2luY2x1ZGUvdWFwaS9zb3VuZC9zb2YvdG9rZW5zLmgK
aW5kZXggMDJiNzFhOGRlZWE0Li5iNzJmYTM4NWJlYmYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFw
aS9zb3VuZC9zb2YvdG9rZW5zLmgKKysrIGIvaW5jbHVkZS91YXBpL3NvdW5kL3NvZi90b2tlbnMu
aApAQCAtMTQwLDQgKzE0MCw5IEBACiAjZGVmaW5lIFNPRl9US05fSU5URUxfSERBX1JBVEUJCQkx
NTAwCiAjZGVmaW5lIFNPRl9US05fSU5URUxfSERBX0NICQkJMTUwMQogCisvKiBBRkUgKi8KKyNk
ZWZpbmUgU09GX1RLTl9NRURJQVRFS19BRkVfUkFURQkJMTYwMAorI2RlZmluZSBTT0ZfVEtOX01F
RElBVEVLX0FGRV9DSAkJCTE2MDEKKyNkZWZpbmUgU09GX1RLTl9NRURJQVRFS19BRkVfRk9STUFU
CQkxNjAyCisKICNlbmRpZgotLSAKMi4yNy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
