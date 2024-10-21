Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F5DD15D88
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 12:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IjfStAl4X5APuJGdHfqLtnXkKQl7kdSwd8Ar5E4YipQ=; b=4O4ziEe3TwwQ/iwjDNJaaMQ8/h
	ckCXeMwnR0Az8eNiopU67dxLeeIXzq+G+UOW4KlBwY8v3Cvq//cWX19EhJGzA83NdLUKlp0RkiFDn
	Y/gLiPio4ED6AiiVUvM+Y1b3FShEaoVIblUyvc7mLFcyfp0r7KQ7PjggGMGMAXsqozoLSehvjqE4U
	NpCoX89klgBPh27wNJPPWPSJFOQ64jYNH47e/EL1Zg4xn3pEhEkA5bLsNgj5z0zyDduT7gDxaEG7c
	kdZp+q5rxE6dmH3kTfPqlNt7+mE/MnReWEsby8VDY+MO1ycCsvMhaL/zYjdjCBY4y5a0zAvyFqYJb
	/l2om1GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rZB-00000007Fl6-2slw;
	Mon, 21 Oct 2024 12:31:21 +0000
Received: from mail-psaapc01on2072b.outbound.protection.outlook.com ([2a01:111:f403:200e::72b] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rOD-00000007Cye-3zQQ;
	Mon, 21 Oct 2024 12:20:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyS9GH39wOhBky8vN3oraeu5g7ha7+zJqMnpwYlRNjElc8Wggs9kBGZak4TkggWdRWRtbfRpIW+zgzCbf5A+NxnQsFEFgsggA3ZAt7Hd/sKJ6B0h/HGZwiSG8WBiWypBujVlUjLvPAKMXR9mKmw560Uv+ca4s+tikIGQv5N5oxUEjIPBU0FNntV/rDmVUv3FWiIAZCxvmdmXB4NSQSV4NzoVCMdGoofjgI0QsvDjmaFjd6PhRpFyztz/XoOqvJrSgeP2pNG6h7KK4hdhEM7LFoYY9AS/W6Yc4cxtJglLjCXzX4rN43ocKUj0W9LueAnv6gL1rF8k48VS7jQ1DpV6Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjfStAl4X5APuJGdHfqLtnXkKQl7kdSwd8Ar5E4YipQ=;
 b=Id5BEsLo5q6/FL7cXMqMTgi88ocRUjJMHznsOdji5v/PVd8uPwCQugLyJ2TzM0BDx5udJtdy+L1jW9lXtsflPaDpd24IrhsTc70uGVpJ9c8jCTqJJQpP61JQugsQFYkczoDn/OI/tnM7xdCs4xo9pw0t69XzxGI0oh7XT69yooqZvaN4DJE+X22wytCGbjfErI84uGkhVN7SThhG1zYXKHkJKmMnnByG3ARybpWLKc/W6QZ7OW2hoJdzUrQ7sZANRmMPghD7YmF0p1+Mm9X0MJPifvCW+1nchoUjS41F6m9UiOVx/hcNxWgFbT6UaRaF9zUQlNiHjQ2TfbikjryR3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fibocom.com; dmarc=pass action=none header.from=fibocom.com;
 dkim=pass header.d=fibocom.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fibocomcorp.onmicrosoft.com; s=selector1-fibocomcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjfStAl4X5APuJGdHfqLtnXkKQl7kdSwd8Ar5E4YipQ=;
 b=UA4XZgFk9v4yd9w7lOMtSnpUo8PS2TdzJQrYlVaW5iwErbpwIxvKrMf4TFz8UFP99Z5xlOnI+P7gL8j1VYbb0hbXHDYAFYfL+JOW4XniagpuyPX5czCynnaGLcAlXiyy2GDVDeYVdL2D7XYNy0e9NlJ9WwDK9MJu/dA+ySCPOsA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fibocom.com;
Received: from TY0PR02MB5766.apcprd02.prod.outlook.com (2603:1096:400:1b5::6)
 by JH0PR02MB7479.apcprd02.prod.outlook.com (2603:1096:990:62::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.23; Mon, 21 Oct
 2024 12:19:51 +0000
Received: from TY0PR02MB5766.apcprd02.prod.outlook.com
 ([fe80::f53d:47b:3b04:9a8b]) by TY0PR02MB5766.apcprd02.prod.outlook.com
 ([fe80::f53d:47b:3b04:9a8b%4]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 12:19:51 +0000
From: Jinjian Song <jinjian.song@fibocom.com>
To: chandrashekar.devegowda@intel.com,
	chiranjeevi.rapolu@linux.intel.com,
	haijun.liu@mediatek.com,
	m.chetan.kumar@linux.intel.com,
	ricardo.martinez@linux.intel.com,
	loic.poulain@linaro.org,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	matthias.bgg@gmail.com,
	corbet@lwn.net,
	linux-mediatek@lists.infradead.org,
	helgaas@kernel.org,
	danielwinkler@google.com,
	korneld@google.com,
	Jinjian Song <jinjian.song@fibocom.com>
Subject: [net-next,RESEND v6 0/2] net: wwan: t7xx: Add t7xx debug port 
Date: Mon, 21 Oct 2024 20:19:32 +0800
Message-Id: <20241021121934.16317-1-jinjian.song@fibocom.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0139.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::7) To TY0PR02MB5766.apcprd02.prod.outlook.com
 (2603:1096:400:1b5::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR02MB5766:EE_|JH0PR02MB7479:EE_
X-MS-Office365-Filtering-Correlation-Id: e287564b-63f8-40d0-0a33-08dcf1caa950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oO0ctwE2aWz5VWEdvqbUWnCcnzN7uQSNoq92fPjAKFTT0UkGPoOg4EJLtdNl?=
 =?us-ascii?Q?fksWAblMmfzY1OD/yc7GcUcMa/HfyYtzo6qatifELW3zwqZw/GMtxcU8TLWs?=
 =?us-ascii?Q?BBGpmTZFYm91jmp0iLcAuLceDPaLqbUQRwaXgrrNFWWegzTN9kGmixLqHTAB?=
 =?us-ascii?Q?CQ2C8L6CmF7PEzCodS6gLiMkm+uC0RxyhiBaZvKIU7Ct8t+GzTRE3bO+2i8l?=
 =?us-ascii?Q?9BjbziJxVRfuDizTaqlkYWw95jYCwjHymIrOxVcriFf6QTHUBovg+zwWdqkl?=
 =?us-ascii?Q?BnnuL1z/sV8Q8w15pzeniT9OTDiJsSVWgIK7sJUjgBSc2n39fkQh662Hykyw?=
 =?us-ascii?Q?RIlboUTzWi8sU0rrPTps9JdVZrL6buds2gRAG9c3Hhpc2YVrHZsNZMoWvtHr?=
 =?us-ascii?Q?Q6Pq/fppN8OVSvync/kT8s/sSWwFTQkRfpEh4AKCEQVszOiOSgWzb0AAra/I?=
 =?us-ascii?Q?f9S6GOJU+XMF90XeU4vrVF+qH9fgJXnX0C5jNkB7iVLYrExQawnUf7h8RG9R?=
 =?us-ascii?Q?fbB+o9BzK/rS0FnTr2G4Cg/sN1UJsLjFPXoopoxuvgwckdFfg+orUx/RTnXn?=
 =?us-ascii?Q?R20hYOC1wY6kR9p+M0hUpRJDNQoTs7HYwRRD1HKPgNqa+2sFVsr0SVank79p?=
 =?us-ascii?Q?IbpWWLI/pe+37oMZhXCEAE7yLBk+0A6febJyEw1HTbrRtoXZ6Btlk/4VV4DI?=
 =?us-ascii?Q?oWjBEWDhEt5EJPRP2X2kKaWCvBJ2a/i6wMlakyUAUWvBzoKyXr6cCkHVykGE?=
 =?us-ascii?Q?dTrooa45p5oQEshYf9v7GQiUtZrIM7kdNBVNwkL6lEMsCdBEHxQf7i1PzgMz?=
 =?us-ascii?Q?CQnrNvH6YpWs/WVy71XEoyfPnIAp0fvRmDVmOgFZPpZPrPrVzdJI/ujzUYbt?=
 =?us-ascii?Q?Jo9VEh0S/ZWhBc5qmNCYI7D2qRFJUs3j6039cymn4kbdEXZDwZsGHM1ZvNE8?=
 =?us-ascii?Q?eivTrWK/BfN4VMEhMOoX02QC6htTsTy/g2T6j6Kbpl+jixpiJst0jc8CM+S4?=
 =?us-ascii?Q?OWeRuKocnQcjcUQwwFvjDwRdLQdyyc/abA/EXC2KVwm1IQGh8soC5SlGDYz8?=
 =?us-ascii?Q?VUASIiUWj9I7cKmkJF+3sy1qvwf0KZvmX7NSBQskx0dFoI9WVR692o3wzvjv?=
 =?us-ascii?Q?HVwh6bP2g/AJgGOJRFZpsFSIAGuKBUFVFqt+3Ldow3rHL7026RCps1WzPcYq?=
 =?us-ascii?Q?JI5eqztY122xxYQqY/12ypdvHO4sgvFq2OeXg6qzERZQsJxkonBtLnaYmNHc?=
 =?us-ascii?Q?Hfw05+sBK9DsG5IT7cyShFTm2HHZR4B0P8es9Eq/1JbZ2ajjTT/Cwgwfi0CT?=
 =?us-ascii?Q?B+XS/fbUSPeirfq+6+OmshwE8esIQI7ZcsqXGX5SLdpqyT8MMTuZ4J9sPScV?=
 =?us-ascii?Q?ZKcbL3VkSZez2LHPTFNtolfXhpNV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR02MB5766.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?15H/q9Fwhs7/JqYoPdRyA92C8WPEidVzhUtUwlpi6Q/9TRfhveXIgORmuCWt?=
 =?us-ascii?Q?g51O7JQgvrHA+QgnTpRLbFOmL4KfIdNfkhUkuCXERwEq42lGZow8rNRR1Hrq?=
 =?us-ascii?Q?EgEtuK41zBvACU8XSuezikgjxSAOJjjKkEnE4QgijrwroR3gns36/JfWULZy?=
 =?us-ascii?Q?k1kgc63HXIBuJm/JWfyzR17MS7DWjzzEJJuYqwCMJy70LnTvsjBM9LMLhUcw?=
 =?us-ascii?Q?vrEZ9pJZkv+0zA85pwFfs+2+mUGLWwIDivRhT6RUmlqWfAj+WGmxuXkZldf9?=
 =?us-ascii?Q?urkU5h4odpgyzuICmIt/m4CQeKDaG1+2vBoWRC+EM5grwWwwa+hlUIYpIpXR?=
 =?us-ascii?Q?4zCmlR+/E9RWa1JRN73nRMOlGSHAkjh68ZmGJL+NbKWSk/wKB+52jjDugkmz?=
 =?us-ascii?Q?4KxSfx6+xEAWNj5LK8acY29uCngytPBUQsfKE33b8P7YJQ/JUsyGWIBrAvEx?=
 =?us-ascii?Q?U/ZK5TlMFdhU8c7g6ZVzR/IvfByUYcGOP44AjKxmMMi+Sfw4sH3jmdHPh2GM?=
 =?us-ascii?Q?sTAU/xpBmDb6izBNkIMsi0P565SdBwlEIPrZ9X54Zojj2TGj9LATm+C0jU/1?=
 =?us-ascii?Q?aTz644vtRaym579d34nrCx2x8Utpuxc7Wlf7hbzK5/jZmbN2Bk4V90bfwPt3?=
 =?us-ascii?Q?CqBLrN607PGyifqFFVyvD3i39QRLmiqV6lYud9JQdGXB6K1+LohbkPBdbQo4?=
 =?us-ascii?Q?mNknQX5TAKC89/GAplXcYvGXxRAqF8BYA5m83EWbcHwBNnBJTQCa/jcVc1Bj?=
 =?us-ascii?Q?Fu5zoGOQp7FfXvkbwqxKh8Hzl8x0XSMak/5xcWrb6/Hqiox2huwcbUrqlyqn?=
 =?us-ascii?Q?4j34711XNLk/Oq6D9EfkJOOu0mLymmcIFnorjAoHxwfPmmcMUAtOELPcVXoS?=
 =?us-ascii?Q?z2x05TxUwAxXYNSPy71NxYgydj4JZbfvf1cNVCJh2jiwewZC/BbpI1M9URW8?=
 =?us-ascii?Q?4jHc8cejGfPVwTk/iCPepd2pRg19bNXxuHqDMaNAdkDMo3DTbpUVCxPtuuau?=
 =?us-ascii?Q?+uiO/hQqthVDdvYNGmVrZgNLEwRHvMop6MzNtz9GehBP4tCqoNTWHsONgpdE?=
 =?us-ascii?Q?Pwl4SWSHMey60M77dHlEIP0aEFAnFAhwTzOx6M7T6GvVTgdaqGt3ZGWAmpbY?=
 =?us-ascii?Q?F+quGqPaWEM6Clf3pJ73YwmSoPrvkd+XfwvbobUZm1L5xVsEmj9uXet0cCJJ?=
 =?us-ascii?Q?407VK7J1i7xDkoQYEbUdI9C0KWdwCGi43qzrcmfBqM99vy/IhbCZZCNzLuZ7?=
 =?us-ascii?Q?2VdtUSpj8yThMftx7r4nSVBlb7Ce30RG10bjYVg2nv85URugumw5s36P2PlD?=
 =?us-ascii?Q?lJRbTsTUHLZNXXka3SVbELRXbxWro36z5EQLfb0bMOYD2iNzoi/xqFInlAFR?=
 =?us-ascii?Q?i9DtFl4vYyglbC1wT8LCllLwcUoXsqP/PfnvT7MsAxpyEAYUy3qf1LqGVNtT?=
 =?us-ascii?Q?j7/+pnNxYwxv7sMFuArm/RNxhMqBkEfcIMBLnP4/gMM8qLsktS9rzZW6glCV?=
 =?us-ascii?Q?hiwXUlt+/tQbdn/p4IBhJzoZzzUNvFQaS7zWmiK9SCJHnHU0mJGs1KWXzSkw?=
 =?us-ascii?Q?vOwpr/lQHkC14u4Nkwbgn/z86LekL+/i91NMJX/U4zUP7dnM6/cRULzx1f9x?=
 =?us-ascii?Q?gQ=3D=3D?=
X-OriginatorOrg: fibocom.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e287564b-63f8-40d0-0a33-08dcf1caa950
X-MS-Exchange-CrossTenant-AuthSource: TY0PR02MB5766.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 12:19:50.9817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 889bfe61-8c21-436b-bc07-3908050c8236
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 49NhrGEHhpCErc8hXVW7m6AK5+J81WKzH2VpiqQIyEgb/T961Dt92OIxVIXXOJaHUxZd7OxjK+6XwHmKoCEFvVJ2V3qpDzZ4uojp/ShfG24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR02MB7479
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_052002_025970_E6ACCAE0 
X-CRM114-Status: UNSURE (   7.16  )
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

Add support for t7xx WWAN device to debug by ADB (Android Debug Bridge)
port and MTK MIPCi (Modem Information Process Center) port.

Application can use ADB (Android Debg Bridge) port to implement
functions (shell, pull, push ...) by ADB protocol commands.

Application can use MIPC (Modem Information Process Center) port
to debug antenna tunner or noise profiling through this MTK modem
diagnostic interface.

Jinjian Song (2):
  wwan: core: Add WWAN ADB and MIPC port type
  net: wwan: t7xx: Add debug port

 .../networking/device_drivers/wwan/t7xx.rst   | 47 +++++++++++++
 drivers/net/wwan/t7xx/t7xx_pci.c              | 67 +++++++++++++++++--
 drivers/net/wwan/t7xx/t7xx_pci.h              |  7 ++
 drivers/net/wwan/t7xx/t7xx_port.h             |  3 +
 drivers/net/wwan/t7xx/t7xx_port_proxy.c       | 44 +++++++++++-
 drivers/net/wwan/t7xx/t7xx_port_proxy.h       |  1 +
 drivers/net/wwan/t7xx/t7xx_port_wwan.c        |  8 ++-
 drivers/net/wwan/wwan_core.c                  |  8 +++
 include/linux/wwan.h                          |  4 ++
 9 files changed, 179 insertions(+), 10 deletions(-)

-- 
2.34.1


