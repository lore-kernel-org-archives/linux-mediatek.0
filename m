Return-Path: <SRS0=mmGE=QF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E01EC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 10:08:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28CE161B64
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 10:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28CE161B64
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eAIEwVDLX+1IEBm3aBEGSBozglKoPEAzc4wUfCMUUho=; b=iHWuG+vsHrWk1x
	lYk5wTz3Yj1812wrFib/fFvytvUavxNFE8mCHnbcjVzNLaBsLvuHaJgyYtHQejT0yWWY97sX7ysaT
	lDtXGDWZCqDPa9q3OO1GyQgi0nEAA9CXfFrxB26hG3as52OxvTMYOk1xqt9MAmkBneLs3lOF9MC2B
	UjovN5ERfNZz+B+aMhXpUsA259VqLnjMqNxyVxZxmkZla/h4wDsXRCSH555bZPpoYNMMYV3NdeEXm
	grCt0ko4b2WoXBzJbmfjVMApmvT83+wsWGzOBqaQlFVZWPrxQ6GOKj237NMHvkB8J2NLzSPS8pdvj
	9EKEFgwkKJ0XYYLJd0ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mneL9-007QPh-Vy; Thu, 18 Nov 2021 10:08:24 +0000
Received: from mail-eopbgr70070.outbound.protection.outlook.com ([40.107.7.70]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mneL3-007QMQ-Lz
 for linux-mediatek@lists.infradead.org; Thu, 18 Nov 2021 10:08:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+cEOq8DznssYAFhioeGDWDr/AzR0C8ja+iqOY0NS6mj9U+BrOY0da6Fa5leaYgHSAlWtOsYxlBPaMHMT+eocRrl0XDEarCJv9tJjtEw+VR7lVvGZ1IVFeJVO5xcd88T3/3vD4opRhWLyG9HOiV8f4Ldom0sh1J1aGcM3l+1Qm8Z2iDXXPfK9QmHU7OOqqIMHp7/Hb4baO3cEA2bJlg7qbpYSbrPsywHTg/qNJXPLtT1urIBgyne3aYeEkj60rYMP/Asvu4UIokd/V0/5ayuPLza/sxO/2V3vjw23aEBCqOMyC0lwDJZZFuR5Jv2Dlgk/hCFUbiRTClilZmpubCO1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/TcaXutvCfzOqQoZbUtGznDhLVWnllTNgKTJn+BGJg=;
 b=b6hgKOcg97CtyqlN57HtBkESq3iFCH8QQ4cjDB+E9XY/fONuqmNm+xrTt5iAnn0zrsKJ/hZ+Vzecjs+wKqW9ktoN/f9ICK9dwIPH8ww6lZ83wlz1pNfMK4AGzxZXf8n7PSbdrnNbKUHss0C5MJlv6I2ElPF8KocMRqMOsbMmei/8ZyLh2is5TqA2Dev2H02s8Uf/2BZARJMaeKyEkyp6LQrEDQb0EEMglMbjmOYLbE1YNjsbkiBQWUYK+qi7dhV6jLz+OFRwq2uvD1M+ipbWFWx7Mx4ZJxk+vinYVJGN1VLaeV4uTAI2FDpLH3FlARj/vMkjFrYe7OFKmdPQDSXrqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/TcaXutvCfzOqQoZbUtGznDhLVWnllTNgKTJn+BGJg=;
 b=hJryKLPeBm2/vvtqCvXYyPJ5GRf/4i0dBJE1RlZPQl5vhn8Dhi0xvUD10S+JdC8Sg8x/KsCz/bph6U+pj6Zy1hCqVhLc86k9m95bVQRq5NVVEfJj0dryYRZXGcAO0Td17/G9kn8jf3SswDKTNHLlD6U3JJOjS1FMM71ki8c7UGk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR0401MB2429.eurprd04.prod.outlook.com (2603:10a6:800:2c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Thu, 18 Nov
 2021 10:08:11 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 10:08:11 +0000
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
Subject: [PATCH v2 2/8] ASoC: SOF: tokens: add token for Mediatek AFE
Date: Thu, 18 Nov 2021 12:07:43 +0200
Message-Id: <20211118100749.54628-3-daniel.baluta@oss.nxp.com>
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
 Transport; Thu, 18 Nov 2021 10:08:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd8090af-0a46-48df-afbc-08d9aa7b53c1
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2429:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2429513960DE9E3A5C14FCF0B89B9@VI1PR0401MB2429.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5lX5Ki7YIKPVgjB1/Jue1MM7P+/SYl9cBDST0yD6zkxiBtI8eKV/ibzw5671k9xMnuRZGJWfUN3SyDR6CHvsILNE5+pjuXMEQqOh97BfFE/D6xERNHSmr+qBBB/XOqkuiWmXbr0xCylDPcqLNdTJPADYhixb30wM0bpFFFCGDT2+9IZN0eBcMutPKemYBXqi87BMHZHBKN/DEh6NZmhXt2raLjoLXC+/wLuraUEKNB24oo3R+zN4RgihIkG4PtoU6ZkXAE3mOYs0uYwLxw5K0ZuWCqwPoEAx9NyM3DY3vvCeVNBmXui98/fS4UxosvrrsivNk6fDowpEQFxwq7stFRnoiLdThK9Uz5qX/Am4zHXW+ZkRpCe6Qwd6ChqrNHd8/lO24/8LQBGAMoSmQ4S+VkApQGFxnC0MrioPaMJGjQ4yELU/5exG4EX9WnHiwr3koWDSdvAVZ0JdH7TgNiZQBnvhFsEmuFuHoi4X1cLfR3H0vl7XEg2rq7uX+xAl0boy01/eCmZG0Ua7GoaRa82YhI1YnYYPc0GKOcGDIl6xRwhbTmbEToAtwBDQVYbsF4+ghTxhFFacym8fyVc//B8OU4wbvT/4O3FAiodzrNIh7ooAChiw30EhKNTZSvL53xoUBq+BJKfZ8oTZjhA57d2dEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(54906003)(316002)(6666004)(7416002)(52116002)(6486002)(4326008)(1076003)(8676002)(38100700002)(2906002)(44832011)(186003)(508600001)(2616005)(66946007)(6506007)(66476007)(8936002)(6512007)(86362001)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rm1hOHI1MytNMFlydlJYN1c3K3Z5eVlJcmE3bmdSQXJhWXQrRnRoS3dHNlo2?=
 =?utf-8?B?d09jalF5ZitUVVdMcWVKdnMyWkU3Z0JFbFFZQ0ZHQ1VUVkRIY1YvQTlTcVNy?=
 =?utf-8?B?RW91aGhHYXBKVXUvOXJtbXdFSzUvSzZzY1R5UVVvcko0UXVHaXZWRWc3ZVFJ?=
 =?utf-8?B?MUdvZCtuVUFDa1lNcmRBNjR0TmhpTlZjSVp3SjBtbXFOWU1NSCtxbW5EZ05Z?=
 =?utf-8?B?Y2dtYjF6c0kvTVlmdE05dUkya0RqcVZIM04wRnZaSVdKcXkzaUZlMjZMNlJ6?=
 =?utf-8?B?aTZIODVYcXh3QWNBTUdvMXo1UE1TY0lMRjJSV0JIajROakhkOCtjRk10S2pE?=
 =?utf-8?B?SSt3YmVydXQ5VzZZc3A2UEZkVDBTRVRPdnZjZGp0WDdUejBnbWY3ZDkwNVlt?=
 =?utf-8?B?RjRuVThUQVhtY1FsaWVWcWN6VHNvcXcybmhSVmpFQnQxZ2ZkNitVUFF5VXJH?=
 =?utf-8?B?YmVURk9lUVRpZjVOY2JxMFdOcktCa3QxVkY1WkZ0TUNhZ1RYSjNob0hncHBk?=
 =?utf-8?B?MGZxdlJCVmIxNjlSTlloYmpPRVFNb0tHWlIvK1ZsWE01UkUweXZQWTdndWVo?=
 =?utf-8?B?aTdQT1RDNGFDWENMdEMra3NqalJDYkx5WWRkMC9uc0hGYWxnd1Z0SGs5ZlBH?=
 =?utf-8?B?K0hBbFZud0pUSVdBRE5pd1ZwQkV5aFNhOU03L0p2R3pkU2JZSEE5Y0V0cEdX?=
 =?utf-8?B?VElDMkdWOGFGM3ZKQmMwSVVLUExVNG42MG5PbnUzYTlMQmFTZHNaRFRvcy9B?=
 =?utf-8?B?aVpuUUZQcnJyNy9aVEVWVFYvRmYzOWF5dDN5Q2I4clA5cG9zanhSdHczTGJF?=
 =?utf-8?B?TFpDQ3Y3UHQzaXB1ZXRUV0I1d3ZDekNMSWMzd2VvQjR5aFFHTTBPM1RHcmN0?=
 =?utf-8?B?czBJcEh5UUx4QW51Q2FsMTBtWDJ6dlJ4NU9XbFRtcjBacVgwMVpiOVErK2l0?=
 =?utf-8?B?SGJxdWxtK1dTWHVJYVg0cng5b1cvdjF2bEZ0ZmVpUW5VMmd5OE9EVUFBcFJF?=
 =?utf-8?B?YXdKQUEwWElGRFJiakFWSVI1OGdYWnd4L1VDTUtQWWVFbGIwN2FVWU96YlFt?=
 =?utf-8?B?RVVOcHMrQ2ROMzRzRU9zV1k3NXlZQXRCTTlFblFBcGFvc01DRnlpS2Y1T0Vl?=
 =?utf-8?B?amRQMnUvUUtLQzRseWVDR0dQVWp4RXJBMGk3b3FWN0lqRGRucElXVkVoS2hS?=
 =?utf-8?B?R1FtVmkvRTV6YjlCTzdaVFRQOTgxZDRIaWZ0aGhZYjFHQllnRXY4SUIwUzdt?=
 =?utf-8?B?Vm0rU0Rnb1pNczNGL0k3ckhsZTQyb3ZEMS83dVg3QkFtVWpsV2ZsMmJnbWFC?=
 =?utf-8?B?NW8ydkg3TjNHUlJTVnkraG9SeUh1ZmdQWUVJcDFuc1lOWnBZWjlrMGpnTSti?=
 =?utf-8?B?Y29BQ2l6MUhZUTlYL0dxbjBLUHgrcW5YMmtxa0VNUlR5c1ZlWkFhcEpkenhy?=
 =?utf-8?B?UkhpampFeE1XcDVBOHc4bzlHQVB0cGRiZXZaRkZURURGYTAvc2hNTEl1c2Z1?=
 =?utf-8?B?M3hoekVYdnBzK01heW9kSXlpNVdzc2dZT1ZBK2xRY2FNR2dyMzhpUWdaSDIr?=
 =?utf-8?B?QmV6dEZ2VzZadDFlMkQ0NEF3a0k0N2MyNmNSUE1qdm9McXpXZ0pkdXJ4MWN5?=
 =?utf-8?B?RVlRRlhjMFNMRGQ3QmU0SHhMcHlXeUIxZUdOOEVOK3dvSU0vZ2J2cWJZTkhG?=
 =?utf-8?B?d3NYUldTdVRmazRkam9hSEU0Y3NlZFZLYStIdHNZOG5VRVAybVhBSXZSWGk0?=
 =?utf-8?B?cUlocG5IeTNoQjV5dnVqUktkU2xmODZIUTBYZWcxOXAxQ1VscEV2UCtkOUtq?=
 =?utf-8?B?Y3dFR0xWRDdJeFNRMzhxYVZROWtaTmgveXdLUU1XaXhyb3JsNVJPMTIyb3BN?=
 =?utf-8?B?Rk5lVEczK2JGcy8rTXN4eWZDOVFtVTNSMHlZSzN3bFFYZzhIZFowREZFY2I5?=
 =?utf-8?B?azlDM2ZEZFNSZFl1ZCtWY2VKbG5TRjRaMURrR2VsYmx5aExzT0V1SXF0TXpE?=
 =?utf-8?B?ZVR1U1hhNEphclNLTWNSOWViRjByc2U5bzlrU1NEMUZTc1dVQTB5TnArQVRh?=
 =?utf-8?B?NnpaV0lKMjlvMlUxd1JSMFV4MEhuQ2R0UDl0R0Y2T0xvdXNMNkZCSUhCTEdM?=
 =?utf-8?B?dS9iQTEyV3J3K1FFUDAyRDR1dTU2cEhFckxwZmtMNmFrVmdDRW9RMjlUNTlT?=
 =?utf-8?B?THMvMFRYV2gzRWsrcVpWTkZEOGlIQ1h4OFQ5c09IaldMWWljeXNRakl4ZjdL?=
 =?utf-8?Q?z+eyoP0K1wnPm9Zv7LlyjBhkL1TYp3o4d3849uZ7Do=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd8090af-0a46-48df-afbc-08d9aa7b53c1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 10:08:11.4806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46HsWQxwmIy3KFKOmcdVN+rHKKCn7D7fUIoLMcRmGjUyUQ6OrVJGWS2yFkcU7WQagMeomVsaIZhcRW0a1E4Tyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2429
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_020817_809821_2A04C726 
X-CRM114-Status: UNSURE (   8.22  )
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
bnV4LmludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IERhbmllbCBCYWx1dGEgPGRhbmllbC5iYWx1dGFA
bnhwLmNvbT4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIEJhbHV0YSA8ZGFuaWVsLmJhbHV0YUBueHAu
Y29tPgotLS0KIGluY2x1ZGUvdWFwaS9zb3VuZC9zb2YvdG9rZW5zLmggfCA1ICsrKysrCiAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL3Nv
dW5kL3NvZi90b2tlbnMuaCBiL2luY2x1ZGUvdWFwaS9zb3VuZC9zb2YvdG9rZW5zLmgKaW5kZXgg
MDJiNzFhOGRlZWE0Li5iNzJmYTM4NWJlYmYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9zb3Vu
ZC9zb2YvdG9rZW5zLmgKKysrIGIvaW5jbHVkZS91YXBpL3NvdW5kL3NvZi90b2tlbnMuaApAQCAt
MTQwLDQgKzE0MCw5IEBACiAjZGVmaW5lIFNPRl9US05fSU5URUxfSERBX1JBVEUJCQkxNTAwCiAj
ZGVmaW5lIFNPRl9US05fSU5URUxfSERBX0NICQkJMTUwMQogCisvKiBBRkUgKi8KKyNkZWZpbmUg
U09GX1RLTl9NRURJQVRFS19BRkVfUkFURQkJMTYwMAorI2RlZmluZSBTT0ZfVEtOX01FRElBVEVL
X0FGRV9DSAkJCTE2MDEKKyNkZWZpbmUgU09GX1RLTl9NRURJQVRFS19BRkVfRk9STUFUCQkxNjAy
CisKICNlbmRpZgotLSAKMi4yNy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
