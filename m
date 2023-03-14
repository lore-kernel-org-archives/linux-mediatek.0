Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C73C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 22:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	In-Reply-To:Content-Transfer-Encoding:Content-Type:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhNeqOwa0nMUKJYXldE1LfzvitbV5nGRhgCwrOgnCpE=; b=C/Tx26yUX1/ULjKLX9h1wDhCPE
	3DJTvaJPBfbZzIqQL7bg7FDeZkzqn7LXTPLrTwl2IKQMAtPFz2m80IIN5ciSQ4+0AeyvrkU5kt3PL
	yEiyA0K3cm2sUQlS3c/Qti+0N35KPzze/+wLu8/TpYRVzjDA/7F7h3GCYpMn68wJa2akiBRYZJTie
	x9Q+QiyU0AySMEoTFvV24eOhI4Q9DnZNcwDc678X03dWAjVpnSM+fPuE9TvFE21nykrJWWX5l4zp+
	2dvatpXVSpRLXllJ6I5BYVMfdODLOjCukORJnc1/jQpXudMbNK7LkzeCqiEA2G6ewcNKW68HL5wLS
	P1zUYxQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcDSK-00BjHV-0d;
	Tue, 14 Mar 2023 22:49:20 +0000
Received: from mail-db3eur04on0601.outbound.protection.outlook.com ([2a01:111:f400:fe0c::601] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcDSF-00BjGT-2i;
	Tue, 14 Mar 2023 22:49:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PV7bU2uTVoP6VXWI/apGGdGYfw4TerSOAQQ8PzX1XbVdkib4e9BzdYlV/CG+l8aYKOob9Ek7KeBHlFuVJ20fAYgIZgZsbSM4piV2SHG7xGoouFSQZvRLU8b7VMPtH3BeOcCXw5CrfFLs7RmfHIXqiE++lmP69ESJaZuknPYT7IVKDOllawNk8Ip+4zK2pagdduya1QR1Ze7DwIRTVd3L2rJr5X/m5R7rVVeM71UabhDnLOUxM1DjrTK1tjme5iYFrq/Hc/McfRsQq3VwIw3m5/0QstY8wmW9uID9aT/UGtRL/dzqAI2TWlMs2gJUVIrULp3GDGeYnrmOH/OtJwH8Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhNeqOwa0nMUKJYXldE1LfzvitbV5nGRhgCwrOgnCpE=;
 b=AsqfW4881hiLLtDTzfLAu3LuUEy8wERZrBXn9kI9+50UklZls0nbmZcfNpjp6Uoj+jQkT7w96zWEC2jOct1cUqcp6wOuZzCuHc+h2n/S3C0ZXzcttzu3VnooUkK+WZ51eB/JD628VzB4/xWbpbczsgIAqFmsMDaiIW6PvnVSSdUQbL7bsF7QdOvuAkJ0ApXuKAgGVC+jGFPOUtjtQFSfUqvQVBegXvLLK98F+lou9834lbsTXxBzpg5gZi4Q2xzuJkPHPmepIQG7D+B6ycklBz5SAaj+JEiH+pklzETnz+fpDp34n47970vGjRwn1tOepBXARqmGjuhfFKhNmDxJBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhNeqOwa0nMUKJYXldE1LfzvitbV5nGRhgCwrOgnCpE=;
 b=XWWBDLc67UuMTBuR4FXyn053eml862Bk4qZeepbn7wucvAx89YDyk+a1+ZRY9klgT3XUwl3EMJ6dffuURLcpeD57vBpjt9gLbXFNouT2/zuHc1whDjIFendqDslbC0P02z0TUdmLySXN7wC9hejFD7QGt46Nm0Qbilf1i5+72BE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com (2603:10a6:208:16d::21)
 by VI1PR04MB6800.eurprd04.prod.outlook.com (2603:10a6:803:133::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 22:34:18 +0000
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::29a3:120c:7d42:3ca8]) by AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::29a3:120c:7d42:3ca8%7]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 22:34:18 +0000
Date: Wed, 15 Mar 2023 00:34:13 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next v13 11/16] net: dsa: mt7530: use external PCS
 driver
Message-ID: <20230314223413.velxur7gi7snpdei@skbuf>
References: <cover.1678357225.git.daniel@makrotopia.org>
 <2ac2ee40d3b0e705461b50613fda6a7edfdbc4b3.1678357225.git.daniel@makrotopia.org>
 <e99cc7d1-554d-5d4d-e69a-a38ded02bb08@arinc9.com>
 <ZBCyqdfaeF/q8oZr@makrotopia.org>
 <c07651cd-27b4-5ba4-8116-398522327d27@arinc9.com>
 <20230314195322.tsciinumrxtw64o5@skbuf>
 <3e3e6a1e-61ba-a6e8-5503-258fb8e949bb@arinc9.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e3e6a1e-61ba-a6e8-5503-258fb8e949bb@arinc9.com>
X-ClientProxiedBy: AS4P251CA0021.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d3::11) To AM0PR04MB6452.eurprd04.prod.outlook.com
 (2603:10a6:208:16d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6452:EE_|VI1PR04MB6800:EE_
X-MS-Office365-Filtering-Correlation-Id: 337ac558-acb2-49c9-5f8a-08db24dc3f86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	n4BW2C+aGwSk9AQmdiYercxAgBjhj3IOdpZxhWWFolG3yhl+laH3KaSzhdGJrJ4CpnIorQ+Ntl+zCvvb57QdhvNpN01schNhtNSlgQrmuc3hHfecN1usSiKAejsccFKrMq9btcHYAh/GcJKY2DBQOq8fOc6X7IIBlQR6N/4M/DpnAbpWdrZCXnztexNZPRfP22HdxNg8JPqEszygo5PdCjb7QejSnV3GiyPjWu/40DsSrLG7pS83wxEsL1Moi5DBEk2MFvTwEuL+0d05muH8DZbgI/Ea9dRgcDJqWyiu0oUwytdI3J07pqmX717pc87BtPEy3mOJ78yiK4F3fufzfbwjmr8y7ysAd5niJ0H2tounnkA07C+VGGXMeAw0ta1zo9sRsK74R176vnNnDFExSG/RQUqZfIbmIw5dIGm9/w9VFRV/aOn2CnoaEzrTiOraYMmp3DWc8qsnosuMCPONoLtLXpdiv3Hs26/ATl6lAw8DPL5n6B+CdPNeXxDcncYGqQg9+RzHcTRBAJ8NK9SkxXCykVJR83e9TR5ApA0GN3CqDmC0Xv0iDkh8evqSc8gU1gMfsq3Xlm2YX3kRoxtCymqPF0Qunz3+GsVht0h6owCYb25QAK2T4uGg0Uuepg5e+oJB26L0501EF3UeZMXLXA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6452.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(451199018)(66899018)(66946007)(66556008)(478600001)(41300700001)(4326008)(66476007)(316002)(6916009)(8936002)(7416002)(2906002)(5660300002)(6486002)(44832011)(54906003)(86362001)(8676002)(186003)(26005)(6512007)(6666004)(9686003)(1076003)(6506007)(33716001)(38100700002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?K2k2ekpxUFdiMmxuOTVZenhULzFKeUs0UmdFbHlXMGVJSDJMYUI3cDNzdDFp?=
 =?utf-8?B?YnZkbzBlUEFCOFZvUkxBSTZiZ2JYb3VYNFI1YjJuSXdhSVFUZXJLdE0yTlBL?=
 =?utf-8?B?V3BnK2pmSmlxV2xZNHUyK2NHK2ovandoMVVNSUF3MkJJOUpReUpnc3RqSDlN?=
 =?utf-8?B?QkVodlVoaGlsT0k4WEZ2UFhRMVdpQ3lZY0RkWVF0a0pLRjExa0xFK0pVdEtt?=
 =?utf-8?B?SU9IMTNyUUl5Y3hCUFdyWHU1eGlUT3dhWis0a1hORDRZcVNqREI3aWNqTTlT?=
 =?utf-8?B?WlpOeHRwTU9NUEx3U2ZjUU52V0pyOS9hQVNVN3RzOW5BSEVxdWUyVFFObGEx?=
 =?utf-8?B?OFBvZnhSVUd1MlRNbStHNzV6ME9jMUpXMGUzYVAxM0g0dWZ6eTd2NC9oNFAz?=
 =?utf-8?B?M3BGNGhPa1VHY0UrTG1jd0lNNVRTUEZNQktGaFpoUHBEazZEWXBXMzl3ejE0?=
 =?utf-8?B?OVIvOTR3eWZSM0FxTmJweWlPd1g5TUY3cWx3cmlkc3RVSDdxb3pxSitSMEo1?=
 =?utf-8?B?MjdRSWhlWDhDZm9OZUlIdmhKZlAxVmZOclFDOHNmV2ViMEdmYml6VkRpNEhW?=
 =?utf-8?B?bTFGUWM0cUxTVEpiQkZvUkFNYmE2eGlPSnhOVTMyWnZybUR6elJXQ0R4UmhL?=
 =?utf-8?B?c3Q1TGdKMkJXMTE2eExaSGIzZnlFbFFUU05sU1F5U3RZeFBJNGV3eWU2SURK?=
 =?utf-8?B?OGlYVWtMVlR0NHEzMG1kRDBpYmRZUnR3REJJV21yeERTTDZMOHZ5a25ZVXJP?=
 =?utf-8?B?dXdmZWpVaXpQMCtFYjlhRlQ3c2QzKzFmZjZYT1hObXp4Z1J2bTFUNitBbnda?=
 =?utf-8?B?eklUQ3lTU3kwOEx5c3JXam0xWW9yTFBTV0dzSmJJeWkrR3I4d2VvWWNOK3RN?=
 =?utf-8?B?c2UvS09iZ2xVenNKa0Jkd3BwU05TOFk1eFhoNEhIa1N1L2pDWEdGbTUyaHJC?=
 =?utf-8?B?bmFmTGF1UXhGZVlBT3VXa012NDBOVkFDeU1KN3V4MDRzN2NyRjZ3cWlDZFA4?=
 =?utf-8?B?azdCd095dVpGWnEvMzJZSnRubFUxRXJyL1ZJc3pqVGhTbmYrT2VCWVluNk1Z?=
 =?utf-8?B?cXI3c25nS28vN1F5N3FEZ09GRnpyK01mNll1SE1Tb1l1Nk5pcWJZZ285OWtJ?=
 =?utf-8?B?SzhoMTdhMG92dHZsaHhtVFVKcEhwMWxYemo5bGI2YTJkRXVxWkhjUkxDRWJI?=
 =?utf-8?B?bjhvMUlHWVhNYVhvVzdZREZObGlEckRnbUJUYTZxeDNIeW9rRDgvdGVjR1R2?=
 =?utf-8?B?WjZSa00yTzVzOXlVZ0Z0TFZtcU5WckdtdXEyck5nVi9JQXpvSXFqZ2RDbzli?=
 =?utf-8?B?dlFGdFd2TWRkcThFSWZrQmFhRVN2anVUcmdnem9sSTBBMzRLTzlSUzQ3VmNR?=
 =?utf-8?B?TTlEczBZRFNXc0ZzU3g5YmJXUk5ZQnR6cGVxQllZRGVDZjdOTFFMU1hIUk9N?=
 =?utf-8?B?dTYyMktQQk83YlJ6WUJvWkd1Y1FsUFp3QnZZbkJ6WTdGWkdQdC9ETVpKVXpP?=
 =?utf-8?B?RjZYYXovb0ZvYkZxZXpQMzBCd2FBWkxMYXVvL28xWFlnL2pEbzVVdlJJdmtO?=
 =?utf-8?B?ZTFHZElpam1obHI2WXN1THpVa2FPY0N5NG5PVm93MGRuQ3JmQ3g1WDhUd3lw?=
 =?utf-8?B?eXVrSCtzMEJCZ3B0STJRWmdaK0NsQWJBUk9YMG9FTzB3dXI1RTVGS2Z6M1Bh?=
 =?utf-8?B?ZlJHZGM2Rk5oSmJCTk5DWDhxRGQ2dmt3VVNjTkRMdU15dEgwRGorMm9RT0c0?=
 =?utf-8?B?eUxpbWJKbisxL05NZ1dWaHJTOU9jRlJGUEJoVzV6RWR3ZEoyQnh4R0tqK0V4?=
 =?utf-8?B?S2w3WUFyVC9nYjltaUtYM2xYbFQyV2tMOGlRTnBSTDNvRmlyQmRrTXk5YUl1?=
 =?utf-8?B?aVJmVDRCSVIvdXBJUGw3ZURENDdFRWFJTlE1dWFNdGFMbHNjWndXNWI3c1J0?=
 =?utf-8?B?MjQxSFJrSnNuQjh2K2J6dWZROThYeHE3Q3hxemJWMHlXb1liY0tTdkxPZyt1?=
 =?utf-8?B?Y1ZZNU9JbC9maVFQblBZeGRPWGxmOHV4bVRSL3pvck10NUE2L1dlNXVzTVVr?=
 =?utf-8?B?a3lhdWk3QkR4Zm1icmp5STQrbllWN1Z3SUZEUkpVRmNKWWpEc0RtalFjTXRK?=
 =?utf-8?B?SEU3T2RkSFJMbVhmUzhHNktZbDJkSnhqTFJ2S293eHJMZDlEbFVlNFkvMmhx?=
 =?utf-8?B?WHc9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 337ac558-acb2-49c9-5f8a-08db24dc3f86
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 22:34:18.3045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3bMyDUxjloDhCa4J7RaAsX8fQDRHaDV3lUHGvHMUP0iK422u4ERXDyx/V/BI5KgETQcMWhhwEnWFfEXk/huvug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_154915_908214_32CB224C 
X-CRM114-Status: GOOD (  21.46  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Couzens <lynxis@fe80.eu>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, =?utf-8?B?QmrDuHJu?= Mork <bjorn@mork.no>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 14, 2023 at 11:59:40PM +0300, Arınç ÜNAL wrote:
> Look, I don't ask for renaming just for the sake of renaming things. I see a
> benefit which would make things clearer.
> 
> If you rather mean to, know the driver very well, by saying do 100 useful
> commits on the driver beforehand, that makes sense. But I think I'm capable
> of managing this. I've got the time and energy.

I'm absolutely sure that you're capable of renaming mt7530 to mt753x,
that's outside the question. That change can be made without even paying
too much attention to the code, which is exactly the problem. If the
proposal is to touch mt7530_read(), mt7530_write(), mt7530_rmw()
(which it seems to be), then that's pretty much the entire driver.

Sorry for being skeptical by default, but generally such refactoring is
done by people who have the commitment to stay around when shit hits the
fan. Think of it as minimizing the time wasted by others due to that
refactoring. That could be time spent by reviewers looking at the code
being changed while trying to identify latent bugs; could be time spent
by someone who fixes a bug that doesn't backport all the way to stable
kernels because it conflicts with the refactoring. Ideally, after a
large refactoring, you would be sufficiently active to find and fix bugs
before others do, and have an eye for problematic code. Respectfully,
you still need to prove all these things. It also helps a lot if you
build a working relationship with the driver maintainers, or if you gain
their trust and become a maintainer yourself. Otherwise, more work will
just fall on the shoulders of fallback maintainers who don't have the
hardware. If there is a self-sustaining development community and they
take care of everything, I really have zero problems with large
refactoring done even by newbies. But the mt7530 maintainers have gone
pretty silent as of late, and I, as a fallback maintainer with no
hardware, have had to send 2 bug fixes to the mt7530 and 1 to the
mtk_eth_soc driver in the past month, to address the reports. Give me a
reason not to refuse more potential work :)

It's great that you have the time and energy, but with the symbolic 100
commits I just meant: start somewhere else within the driver, build the
experience, the knowledge of the development process and the appreciation
for the existing code structure.

