Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423B0ECAAD5
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 07:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HaA/vhJtZKpr0s2EktWOS6qma2h9xSmkonCZoNVig+Y=; b=R1gBwOrtAxYHb4Sjng8ipBA1Ci
	MNfAubIxfQPBSVvFePLhmATW21+O60/mLJZYVZmgJh0/pG+3oE1oCJ0xxF0Wx9he7wag56JW/UoBG
	oGtEiauM+72dFXEsGupeQbZWeA4VyvfqhBuyx0JmMrvHembL7v64sV2ViiTw9IugK1BN4ks7Fn1Gq
	+yKFhP5qka9rBhaR1yt4Hbh4Au3mOu9gOV1S0RqVVtApjvUQTw21a0O1M+ECEHAxx1T0+DxGH5JlX
	YN8DjPLVMH2fSH2kM8d0cqWtbYTzYbOst0k/eUJUD9tNv16PSfuc6plegg9v6cTq9jRcev1GTnD79
	hbg1yyrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWCRx-000hVu-0i; Thu, 08 Sep 2022 07:59:49 +0000
Received: from mail-dm6nam10on2065.outbound.protection.outlook.com ([40.107.93.65] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWCRs-000gyl-WD; Thu, 08 Sep 2022 07:59:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNrsQHz7ru4iM1mT1CUHGFgpZOdhEKt2aq5XVN8BqucyCId+mz6THXfM+dCEnDqDOq8RBAgCTReDMsCtT/iuyElfIPsg4a+x/bzIfM/BK4HvKwl7EJnd32siyJrUWUreQ3mKC4wuyLuNkPclZ3xBsYOGRe2QF5Wmln53eEtef4vI0ATpTtu0FZYbUOlNpx58DMlCS+BJMfvHWz/O9lQiJjZ2wauEzOxPYwICGsaOKwAXAEhEcLDKAAeafy+RpEZEAtJq7Rq/ZSOftzO2vhLO23kw269XFPwRAGoJZ3/qFkP6MyEIngXqlH20YSG40Q8bIev8Ix2m2rJ67J1Vx0saJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HaA/vhJtZKpr0s2EktWOS6qma2h9xSmkonCZoNVig+Y=;
 b=WqI4bKeWg13i/tusJ0jBoUgYH0pdCg5Ja64CdUC0JD2aBu0yYO3y4khro1lebta3VDevji4DCtXzwR0+ISCiKtBQv8tV5aMjo0vmTaJkehnqck/thw6jjnl2TXIjt2MBSvsYTOg5IiQ1HhvOB4WNc7Rqc7AJfeB1ojHHn5y+nOOZaWnRnbE90gyh/kTqopAS75lYNjAxvI5BodPOfELtjllaPvomX0ttb8v9rwtGBJsGcr8wLmJbx3ZeZZy5u2VG49mxBUnuvwS+n90+kTqAvtjHANWRc4v+7lTNxO5I8jFly+SK7Z6EkouyXzFe3kdRR+8LGSrR0lpBTEVtZp9i1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HaA/vhJtZKpr0s2EktWOS6qma2h9xSmkonCZoNVig+Y=;
 b=rq9YY7xdCtPuLb7jSOdeoODdqz9rwMH3Wwi/V0WBpEyCRF3jguvXRsQyKwqOSwB+5dI/WJ5h46R314ejAPAN5/Kd/xMZfK2rqwSTm+zCGNb5aXLn7CYdLWEcnxwc2aFxxM3mvhfhXkYBSekynGEaNPW8gcR3rkh37m26cygIQ/Q4Ipq2S8Cm0n1832iDr7JiqtMst5FpMB+oJX7WrGV4gjCf4pNn8PiJKpcapfnuOWJHG+2v+W8Rc9wPIjxFKXZU/AoepTRO+dpVgforfx4uSQxhHsYS48rLvABMbOcMt3szwLQCriyL+Pjuveg3yj9pOhLUPyad47hTRRmUNfXDmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6179.namprd12.prod.outlook.com (2603:10b6:930:24::22)
 by SN7PR12MB7022.namprd12.prod.outlook.com (2603:10b6:806:261::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 8 Sep
 2022 07:59:17 +0000
Received: from CY5PR12MB6179.namprd12.prod.outlook.com
 ([fe80::4d61:5da2:6bbb:790]) by CY5PR12MB6179.namprd12.prod.outlook.com
 ([fe80::4d61:5da2:6bbb:790%6]) with mapi id 15.20.5612.016; Thu, 8 Sep 2022
 07:59:16 +0000
Date: Thu, 8 Sep 2022 10:59:08 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: netdev@kapio-technology.com
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com, Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Shuah Khan <shuah@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Yuwei Wang <wangyuweihx@gmail.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bridge@lists.linux-foundation.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 net-next 6/6] selftests: forwarding: add test of
 MAC-Auth Bypass to locked port tests
Message-ID: <Yxmgs7Du62V1zyjK@shredder>
References: <YwxtVhlPjq+M9QMY@shredder>
 <2967ccc234bb672f5440a4b175b73768@kapio-technology.com>
 <Ywyj1VF1wlYqlHb6@shredder>
 <9e1a9eb218bbaa0d36cb98ff5d4b97d7@kapio-technology.com>
 <YwzPJ2oCYJQHOsXD@shredder>
 <69db7606896c77924c11a6c175c4b1a6@kapio-technology.com>
 <YwzjPcQjfLPk3q/k@shredder>
 <f1a17512266ac8b61444e7f0e568aca7@kapio-technology.com>
 <YxNo/0+/Sbg9svid@shredder>
 <5cee059b65f6f7671e099150f9da79c1@kapio-technology.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cee059b65f6f7671e099150f9da79c1@kapio-technology.com>
X-ClientProxiedBy: VI1PR07CA0204.eurprd07.prod.outlook.com
 (2603:10a6:802:3f::28) To CY5PR12MB6179.namprd12.prod.outlook.com
 (2603:10b6:930:24::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6179:EE_|SN7PR12MB7022:EE_
X-MS-Office365-Filtering-Correlation-Id: 30bc5113-d31c-4e72-e8fe-08da917005c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	6w6/0Ej21WZcggbHZMOSYK0uekNrIo3t9ZFOo6djdJJoL3qK0COwAay3xjI1o8/r24adNlw6fc0w77CuCaeGqOYx90H3GU6uvr7V2GLWA8jZVAGrKJN8PrA1X8AXoVBgKu3+iYyiTaaC64TjQa/Nfcw67EC/3PP3tnqtvtNdj/HCIfF5kuG1u2yq0TLGDenjBebICQW/e1c5jukxIy5TfzmdDVPH+vwPwoobvNNMNG+g0lkAbhBv7BVeGS/u4KwVC4hcUSAVLGmmzO3Jb+SwsJHebhDZL+ci/qZJmwEXz/0jWuObPc6OiKbaO41vU+DzGmPut9cq1kEQxK6Px6RtO+u+xq9F8B0OGjKOZLEuUWjwC9nPNtX5i5oyPvDe+7yL7UN5saLbe/fsyI7gGfTP/PT2DrjKn7QOL5iLt7Ul1wRUDy5UTpgiGLEy9G5fynDYjvnDchC5k9YvQ6gpq/NRiOKBEB9JF3/JbvBhkPMtP2/oraNh9LnQrrMuc4hSwVw6+s3ZpG6Y5p9db7qRNgIrV//76g8Wfj3QiXeiRlHGps/hXIsYXh0CDHlQ5BrU2Sa/MNyOLlpcRuS5LBMc7goWLaAtSM/Ab6Ih8vnLwk40BBRPn/Jk4sA56JfdzsF35TbeH8XZNx6gERopzliELe5O2UbzqZjw0J86LoVLL6xIr/x74Tqd9Ev477tgqkpJ5q07oKvmYyFtK+VqBTRz7coipQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6179.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(316002)(86362001)(54906003)(6916009)(38100700002)(7416002)(66476007)(7406005)(8676002)(5660300002)(66556008)(8936002)(33716001)(66946007)(2906002)(4326008)(186003)(41300700001)(9686003)(478600001)(4744005)(6666004)(6512007)(6486002)(6506007)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ewY4n8Oh9PQb21Uj6j6d1e2JER1G+sCI22Le1PgtbYHzrq2XNhsrm2qGyAyX?=
 =?us-ascii?Q?vOE36t6LqkwUWRBf+Io47Wk6ZcXlCsdX7HDEt155tJgQ5LUIDc0Dl1uHe3uy?=
 =?us-ascii?Q?sSspl8D6fVi3k3d89etQlNlT1KG87c3AIEnBcXrkhgj+8N5awira9DaEoezG?=
 =?us-ascii?Q?9yMZk677g2TKkhlncOO0gLlR5xNTviqKuBeIbkXaxUzJkJ8YzEhwAgg5PIeB?=
 =?us-ascii?Q?N2gQmIaJQpN+Byeg7sFXCVadOZQ9WVgrwaLSIKJ3pdD+7CvinOC8OlBwa7ah?=
 =?us-ascii?Q?7j3C4sItYpKEdB18B0JAlDH0XqKZBsDsAzvE5mo+xrjKNUcIAPVfc9pYk8hN?=
 =?us-ascii?Q?f7UCChKSwuicwgDu90GNRhslhNCHjasRjYFzHtnrydTnkNNgy5UlB5jhK3hp?=
 =?us-ascii?Q?5SfZEbuGlS5iC/uHmOOtlelloDBZ8YXrPZukqmB84rtOOikCHQcyJ8fQYDrA?=
 =?us-ascii?Q?oI9AlyzonZ7ozYFuObwN20bQnOe2sTqvDbfFJxXvSulAj4NVw+rc8N/yL7gx?=
 =?us-ascii?Q?iNMe5p4YfNYE31D6+YnjivkeOe9GtxWSsKe021Tm8SmUZ/CvBRxHocjuCaRr?=
 =?us-ascii?Q?yCJ3U6BXykPGuwpfPrDhWs0t/fMDcV4cGv+L+34qg2W0oK7xo2ttquFtcyhn?=
 =?us-ascii?Q?J5fksCIUJc714X/1+WWIrpkv6imo7W06hm0KmyxDhhpN9spLPBwDo7P9nVA4?=
 =?us-ascii?Q?aLGdGKKYZF4W2NvhB7SoA0SuvUHfNPXp6kFaPBZoHz3h/heXvVjM3bW+ETH+?=
 =?us-ascii?Q?MVWeLlpwJmwCb2dxKU3yDGMoe+Dz/ETBE9Se1oND33IcSwhvIKX6BGHNf9CY?=
 =?us-ascii?Q?HALCelvfvP6ByRbS5tsZgtpynEJMI1FUDBaV1T9hzI37OZ07qxTPjIEUGFwH?=
 =?us-ascii?Q?NRdDQJuZR9yn1Zo6nQbJhl0/qPv/pf8gZoFO4NtjVxTr89MwLAzRun/5Yq90?=
 =?us-ascii?Q?VyclrLnjVpfvAXXsCuhhLIAOj5neOMj+RQhWEyvv+t6hcZA9NDGCNc7EKuYo?=
 =?us-ascii?Q?SydSMb9Idrj9PW8sjc7tmm6rE1oFEweT8YBLTMJzeRoQpkfjkpKPwDRAZBS/?=
 =?us-ascii?Q?xW0AE22iIW49qkN7DnFjLvQhtMEWs/PYkI+0cgkY6jPFxhDD93nwQIhjm/cu?=
 =?us-ascii?Q?OPepwmwrRBpNvdvH+KMYJVFUV75SGqzB4w/ygG/LgsTy8i5EL18dB08eBBeq?=
 =?us-ascii?Q?aySeqXPlSwGly+tgcJ0h3fWUXqqYJKBJPzPaxi5Blm/yXF2LYap2UOttPSRb?=
 =?us-ascii?Q?YeB+tnwjubAx63H3NzUWWY33JKkWq+SdUCu17o2uX0cgSk4oLS8Afc6XlVBI?=
 =?us-ascii?Q?eFGKhAteEVruc2p2e/UExxdt3HlLGtvDyhDI4rxVwNHcUzzzCkd/63vTkgEo?=
 =?us-ascii?Q?xSY2//etAZih+wb05ooKq6k+XpYJN4ZlZ3UeHY7UiJeyOoYSm2EXnX2t0RLw?=
 =?us-ascii?Q?v3EEBzHv9YVcDe/MDyN0ZlUfKLFx1EZ8zMGjD35f42tEllfbanLopL8/J9cZ?=
 =?us-ascii?Q?w3mTUHMKjfxSSIzBFz41iVw/wPYI/LqLlFvFi8ia+5Vs8Bi6cRmoshfAbxWI?=
 =?us-ascii?Q?bFYmuXby3tHbjy69AbVpOyeUTsgVTVdtRCqtM/TO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30bc5113-d31c-4e72-e8fe-08da917005c4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6179.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 07:59:16.2686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/hhdlvuykF9nWt5WISu8wen66WbuX3bckq83yZYiYhMG3a0uVM8MOdP9DM0qvp5i36Y1HS7FqqphsKrv2boQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_005945_115122_6CF29535 
X-CRM114-Status: UNSURE (   9.99  )
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

On Wed, Sep 07, 2022 at 11:10:07PM +0200, netdev@kapio-technology.com wrote:
> I am at the blackhole driver implementation now, as I suppose that the
> iproute2 command should work with the mv88e6xxx driver when adding blackhole
> entries (with a added selftest)?
> I decided to add the blackhole feature as new ops for drivers with functions
> blackhole_fdb_add() and blackhole_fdb_del(). Do you agree with that
> approach?

I assume you are talking about extending 'dsa_switch_ops'? If so, it's
up to the DSA maintainers to decide.

