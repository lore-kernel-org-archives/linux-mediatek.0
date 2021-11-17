Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02FD8C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 09:39:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2A3A60C4A
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 09:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C2A3A60C4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N6qxHGybiScGPZNJuFY6+1x7E9dkVQxdpHvn2keYN1c=; b=rVJR4ilG1coIHe
	9ANCzB6BCNz0kDIzc4peNAlFumQDRUMmup/midxjfxbeXJgOQ3dLs8HK+ooYk5VV6XQeqM9Qq7kfL
	zWqLKgb5Fbtqu3t1w0IXIi8zPAL/uWufmEIJ9JDlEwNtq/+Udl37B5XJksVonjdNpffOG+E46iz04
	GCcYV8upZAGNR2HStxta/Z2mqEQYNnlKUJEQ3Al1QD2sPeZAXbSaO9LB3x8CqgHFX9KsfMA6thoGu
	ERVQ40zwQpWw0Gu5UMfrnLmc+0o+gEqfsXTZus4T4IR5GBqRhImwgEYEUOW7r67aPvbBNrHxkCXuO
	Yfr/qRgsBFmQvWAfJoig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnHPl-004Jey-Oy; Wed, 17 Nov 2021 09:39:37 +0000
Received: from mail-vi1eur05on2072.outbound.protection.outlook.com
 ([40.107.21.72] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnHOq-004IyU-LQ
 for linux-mediatek@lists.infradead.org; Wed, 17 Nov 2021 09:38:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIYpnabFTKUcR9MhHt0uUUSjw0TQEwf7/S2qEoLmefcMH2ENNcO5cbMVNIGh/eP30IpC69NUaSJ62dOdMM5mQZ5UVH7ZNKprD42j4D0v5+0fcKAWXkNvJVXPGfUoV8xocAh2sJ0s49N7Zj3hWE+aHaqIb8/vqMg61h3yqusCapXnXcW0QFWZOq9tPc0c/5VOsLyZzaMkHs2SMUQKrzGwAVk4cOzXEhDHA5zZs8bvCYlXDvFRkACrq+Fes8I25Rt/iA0QHSi9kByBVo+9gVWxzoAqgH5rTQ0NlF7p7y+P8tA9EmQz2SjDCAbYP3NlcFu3im4M96etIvzohjBol+7Jwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcbOQalXySIAbgXzXcklFelsLSCQ8XryxySoOXJvAdo=;
 b=JQQH7+Cly9fuqqAJWy6LtW0Mx+ehF1QdAVB9Y0+gYx0MCvCqMsulc1U7jZgd/MI7PPd507kvkxDXQhUg3r0veoyooXiPIJOMBeC1cAdQOpeUAPNJwe+8OYQxarBW6ClZXFrT8TpDoI7SwCkFqvMxsQr7PhZFctXfZy0tLMFr++Bb/cAAUxuBYNf/9EWLRa5uxuNP3Pf7fpBPOWlN+knQrx72Qja6lswacyFa4qfLyyg1CJw13Dk4BcvbBVCLXkHmpADTusHxvT+krjc9gKVGSUfRrOIEN+2GBXOs+5YLBis61+3FStT3hB6+3vNlccmBeILrM+dbr2ltHhQK72ANhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcbOQalXySIAbgXzXcklFelsLSCQ8XryxySoOXJvAdo=;
 b=VnUk10kmBw26d4QlC+fghob3DEysts7Nyo0QshHsFQVLYuXVAXVf+wu13yPUqVmcceXo1rg7Naxuat/yLE2tl1dubgwqcw/pQzZ33WcJ574S46eoCMukmDUVh+VbqZ/+jbO7tgBGuGwUuXR0jzyJQZc5/9idEvzZsFvsjEGnn04=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VE1PR04MB6623.eurprd04.prod.outlook.com (2603:10a6:803:125::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 09:38:34 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 09:38:34 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Cc: pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 daniel.baluta@nxp.com, daniel.baluta@gmail.com, AjitKumar.Pandey@amd.com,
 Balakishore.pati@amd.com, vsreddy@amd.com, Julian.Schroeder@amd.com,
 vishnuvardhanrao.ravulapati@amd.com, linux-kernel@vger.kernel.org,
 yc.hung@mediatek.com, linux-mediatek@lists.infradead.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: [PATCH 16/21] ASoC: SOF: topology: Add support for Mediatek AFE DAI
Date: Wed, 17 Nov 2021 11:37:29 +0200
Message-Id: <20211117093734.17407-17-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
X-ClientProxiedBy: AM3PR03CA0060.eurprd03.prod.outlook.com
 (2603:10a6:207:5::18) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:22bb:b216:ffff:73e1)
 by AM3PR03CA0060.eurprd03.prod.outlook.com (2603:10a6:207:5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Wed, 17 Nov 2021 09:38:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a94991d6-2914-4e33-f9a3-08d9a9ae0639
X-MS-TrafficTypeDiagnostic: VE1PR04MB6623:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB662338565234ABF55A64727AB89A9@VE1PR04MB6623.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: urFpllXah3h1Eb8RGYU7Ua9uMDRPOiE5WEr/Jw1DwOSPhF0qvDZrSQol+ImrhlofAe+PHNeVedOao338+2MQlrWqXPBU38NSOzZ2e8F+rX/D7DWx5ciD8T05g2h4v56ebLxDlSJiPPiD/VNHl5/CO6T87XSXfXz9DDJNKO6FSQNpNjVBNFGYhtslugr4e/a94t87TCC9KSNFjrHUh+t6UjZ4+6IF60ZnGknc/M55vi0AbgoIcwNJv9OcxufunvF1XS+J5S/JCYJjaTUTkipbB467DlopUnCMvzFmh//3ncOHSJ4Yjoa59aare6Srh1MfJDIPhVOoVUaRP99PV+Q5cX13LsZufvmyOIpS4+RsQx8MeCuiGc/OlraqrAy51NpGUKTouA8ECi5+ne/BLW5UX1PCDHHRwAyehzIhElvpm8udbAZ6NJwDa0tM/gK2KfEHQmNb3oEjfY1i7/xGDY4WKo8WmgqTbf53si6Ftrg220OeGEQ7vT+XB4zDybGCDLG+GuUb3FPKpTc3VUlhTDJTunvU5oL4opsMkHV3qMeU4UCMHh1+UwbtIfyEVl8LnOZIdgWZtTGJlUrdRY9XwllZ/P2IP4veE6YecE7bnUdO6wo/yBTeuiXHIXhe+Qi6H6wkv9sv4z9QIkVPoeweEHNhZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(1076003)(52116002)(6506007)(5660300002)(54906003)(8676002)(508600001)(186003)(86362001)(6666004)(2616005)(6512007)(7416002)(44832011)(66556008)(66476007)(4326008)(66946007)(316002)(38100700002)(6486002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1YrY2tlSU5kOUVKQkY4aVlQVkQyVU5TT2VGckhZMG5oWFhFTzlrZ2puT3ZI?=
 =?utf-8?B?Nm5GU3hlT0dnNnNMWmRqZnhJb3l6SGpDVTBqUnNGZGJzZHBaTGJLTzJmck5n?=
 =?utf-8?B?NWVDZjg5b3dOdG5UMUdTdTVIRnZHUkJBRGRPSFpUVlJiV25hcERqOWtIZUlC?=
 =?utf-8?B?NlZRZ1RXOEFmMGtvSVpRUDlmb0psT0tXNlVyQkRZQ0ZTYnErL3ZmdE91bnAw?=
 =?utf-8?B?NDRJK1Y0N3ltZ3ZoRVZDd0RudHNDdzRHTy8yakhRcWw5c2dtVytJZ0Iremxp?=
 =?utf-8?B?aXNBRHdMV2k1dng3cE54OE9kVFZNbkdjU0FDSHhZa2NRMGZDK0l5UHJuQ1FF?=
 =?utf-8?B?dFovV00wb0lhWit4Y2dxVmUwYzZ3ZGRlK2pwMitrMktsTUovbEUxUnJOVW55?=
 =?utf-8?B?RUdrSE12UG5RTEFRZ2N6dE9ZREJHMnFqQ0lBUFkyVk1RMDBpK08zZnNGekIz?=
 =?utf-8?B?Sm0rM05JTFVHK3d1Z1crSWdEbHB2RjYvcS9kazY0N1ljb0lQSjJhMm9EUmd3?=
 =?utf-8?B?UjVOZjk2QlQxY2E0VTJTYkJmb0c2UitMVkk4VVUxcHdLNHdGUFV5WUp3dVls?=
 =?utf-8?B?Y1NvMFprKzlETjBQL2Y2czVQaDdYdnBlb0xTYStsRyt6Vmd0cHdXRytjY2RO?=
 =?utf-8?B?MnBucno3UEJOMVNOQlVJUW0zRzcyREJIeDREeStBRFJCdlM3bnhEemNmcWpU?=
 =?utf-8?B?RHF2dUhxNFhUZFh0dXg0UTJZK1ZLcmlVaHNVcGpXYncwRjhLMkp0ZXJaWlFL?=
 =?utf-8?B?RjQ3SnRhaFppZmN3bEpDOThzVnZZdTM4V01NU0QzQ1NpTUJCOTVwQkpMZGgx?=
 =?utf-8?B?SDZ1R2x3cmJ2MzM0R01Fdlh4WUV1aWZMeEgxL0p4QmpYWXI4TytEeWhzQ0pR?=
 =?utf-8?B?SEVSRURja0lOYnVjWHE2S0ZGblpBb0tKbmlBUEtzZFhKaGp2aThVaytsUUgv?=
 =?utf-8?B?L090TVFRZGtueFNtT2pYNkJ6UCtEV2l6M0gwVVFhNktYbkhSYXRZU2tZSVZO?=
 =?utf-8?B?YVhuN0UzWnYzM09kczFlUllEdmtxUWY5WVpZaDI0clovTmFKNkJhM0xsWTRU?=
 =?utf-8?B?K2pJbEh3ek93MFRXb0FrcDN5YkN3ejEwV3RXNWYzUytSQm9SMWF2eENROE9h?=
 =?utf-8?B?VG9kb1lvaExsRHpXc2RaQzBFTWJ0YUppaXVaZENRV1ozY3krN3BLdnhJVXVW?=
 =?utf-8?B?ZW10Y01JN0ZxUU9PRTMreU5XR1NnNHpvcTZWNitnQkYxMXI2VVhJTFAxNkhh?=
 =?utf-8?B?TGorT3FHSFVOcHF5dmZFdEtvSElicXYrYWFrNzZrUFZXeldDK2NCUUtZQ1FC?=
 =?utf-8?B?aHJQcWE4M1k1YmtyY1hhRTczNXBQRkZ4TUZJY1RLcUdmWTd4RkpNWFB6MDl4?=
 =?utf-8?B?b0l2T1p4Y0xoSlJiUXFEUTFqRTZVdTBJOEE2dnhlRXdLQ201d3BEU202dWI2?=
 =?utf-8?B?WW1nZElZRkRXL3FQUnJzbHdhNDk0eiswN2dJbGg2V1hpR0lYWDdXMGE2U3Z1?=
 =?utf-8?B?VURseU14a0JvcG4xRmFPeGdPRE9naDNQUURzaTkrVzM1ZGg0SDZvVkNyMG8x?=
 =?utf-8?B?OGVzb3lPYzFsMkIvOXpoZmZpbHhEYVIwdk02MzhmdkV4K2VxY2dMeG1aV2tF?=
 =?utf-8?B?T3dHc2w4TkVFNDRQaUxTdXVLYUtZT1VxS3YwdU5zb25zS1Z0M0IxMVlYUDcv?=
 =?utf-8?B?U053a1Q5cHZrY3JNQVo2WkwxcEh4YU9yaWdlZlVtWjhnUWFpZFRwZWNJVzZQ?=
 =?utf-8?B?YzVTVTVmTXBvWGVxRGw1MU5mRkxVYkxCUFQzTC9CVVFGNytOQ1A2UlNVM29n?=
 =?utf-8?B?UEMxYm8zM1FneXptVEx2UGdqbFMzTW1zZzE1M2VNTUlkZ2czTk94UlNyemhp?=
 =?utf-8?B?NHc1Y2lDVEIxUmZZSjJGbXhPYWhzMm9zeUFsZVJKWGY4a1UxTklsTi9ZblFE?=
 =?utf-8?B?eWQrUVE1TFBxY1BGSFkySkxvM0dxSlRiQkw5QjJ6VE1jdnRHaEQyT1hmOG9N?=
 =?utf-8?B?ZGdOaEsvMWU0ZU84VkdTSytoVHBBZVJkaUNzd212bHJyelNOTUJtRFp1NUpZ?=
 =?utf-8?B?K0VkdWp2dlcxWE1RRU11QUJzc1c0U3cwMHpCVHlqa1lBY3hSN1FIQXlGdmMy?=
 =?utf-8?B?UUdaa3NWd2ppOUVUbDJBZDA1dWdVcGxNcWxMVTlBSFJlc3BpaVZqaDNGbUo3?=
 =?utf-8?B?VGhYSXB2TjV2NGhtaUlIS0czTTF3NmQ4SnpWZW9oRU5JVTQvZy9CZk45a3Nr?=
 =?utf-8?Q?A6D7BBAS6eNahaA4f1IrjEZcOuG87N9OC+I77oJw5s=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a94991d6-2914-4e33-f9a3-08d9a9ae0639
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:38:34.4741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CQx2jjLKHBIVmYXe/MO/vxF+VIYzhyh7eQ6tfFxtUcajLhtT/mxdENogKjcnO6mjRwIJ9/iTQ5QpPNIRB9wyng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6623
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_013840_779291_3C8BBEAE 
X-CRM114-Status: GOOD (  18.77  )
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
