Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCAFECAAD2
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 16:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uUO+SBbyTPwDYAvd5O3Zia1JgmcyUAvEUfLW7ShsisQ=; b=thVVs/fVvm9BExkV2PRqHIRJGZ
	mu8UJNfzmbslPlX9Y4Q0dJkLimibFbh3gh9jFrBtTkW9FLFkgrdm02+yUf681gD3xenD/d9R6vr08
	q2UrzVh1zTdA+1BWqlNTWxK079lglPLggRxFnD/0LlHYcF+wDrV9YelYyEqiUFTpWTo2+oWGP3mrZ
	U346vKCK2h5UdTnAWfhmRxmKFBygFJaMscdnekptQjiJOeitNq2mRCXGV01E0++VgdsXBb3Z838CF
	JS2SoBaDCDc86GwDD/FBonRXl6ESK0JlmynJH6o0TRO9KtjD4WFxUO5kPAHd8ML5BlpuRFyO0+jna
	30zZ27mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oShEb-00Ba7V-ML; Mon, 29 Aug 2022 16:03:33 +0000
Received: from mail-bn8nam04on2053.outbound.protection.outlook.com ([40.107.100.53] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oShEN-00BZxz-DQ; Mon, 29 Aug 2022 16:03:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=StfSkWuUrE59QAcybNKgSxjXX2RYS+IxymNcXLdVyk8pMDQw2QXtKYuO45rxPnY/ZQPaJYjSEAYgUEOSQtdO8eVNPXtc2EJ2Mv14K9jXk2ZuwCN4z7ID6FHCYI0evEluzMROX8H5NSq7QAknyMLRs+8zbvXVKIkGWpP14KZNwc/bXR7MkdOroSkIyRc0+q5KI5a85n0rx0czIraU0kkKhm1fVPHYoJmi+w/+qBvSw74bUXtTtMLz+LfBbXDC+nKnLnFkC9LQYHQc2WCE6XnjMVkJc3nU0X/o1N6FEPsnIgcBezu5/9gvd/hRkyQn+DqyiCfrOwxRMnOZik5lNHWqJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUO+SBbyTPwDYAvd5O3Zia1JgmcyUAvEUfLW7ShsisQ=;
 b=Bm6Nz5pM9q9h7P8wURlsxf4SK+BpVeRBgWrOxOrxgiD68rbJaBAX4zSfVrxV3Sk8JW6Dmh28vCc8lPo4zlNo7pTmXUaE3faqVsFRnCNh8ykgH1FH7KuJbcgr9eKPefbc4ExCdKPkK4kC2KBVbb/00MknE8WYZBVmd1cnvnwsIBUAc4W5Z8n13xEeZ4acN2cnGHwHfsMxz/XpcUVz7qJ11Qlf0dvbhuAI0jn4UnHgkV58mY2BRlKvfFamzPYOpqsjHZzEfUcrcBw3bfa8S6WNYKcFg/s1Tt9GenetzxVq6yEwn4f4MijtnWolXGTRpxzb1ujj+DaSPWUslqzRGU3f3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUO+SBbyTPwDYAvd5O3Zia1JgmcyUAvEUfLW7ShsisQ=;
 b=cICpxOeDiAUKEP5upyh5ViAnkc82nxwdhSYAGNHzLWRm6z6WE8si516PEhlf3PbU56HS5ZahgZMt1xRAqyLO7imWDUhF2AQQKmol++HfYnVDzSl6Xx1xG7VCnE/LvUW70lz0fCQTmkwUHBaGPEu+vuxzuoPidVoCIzz/hk57XC+pc+GZIU3ni+6rUOtwTM01WypaJtj2PhZ1i7MF7FNa344Qph41+3QixPPS//Xuyd27WCxStJ4Yo0nJ1/+TBEl/dFvjkrtQZ3IeQvoOZsXFiQ3dMECKLhPWa6cI6dsq3yaYa+N0HT4VaVO2X6thk1H9rzdbCDQMrKpPcYiQ3YWe7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7SPRMB0001.namprd12.prod.outlook.com (2603:10b6:510:13c::20)
 by MN2PR12MB4048.namprd12.prod.outlook.com (2603:10b6:208:1d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 16:03:15 +0000
Received: from PH7SPRMB0001.namprd12.prod.outlook.com
 ([fe80::3ca6:ba11:2893:980e]) by PH7SPRMB0001.namprd12.prod.outlook.com
 ([fe80::3ca6:ba11:2893:980e%6]) with mapi id 15.20.5504.025; Mon, 29 Aug 2022
 16:03:15 +0000
Date: Mon, 29 Aug 2022 19:03:09 +0300
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
Message-ID: <YwzjPcQjfLPk3q/k@shredder>
References: <20220826114538.705433-1-netdev@kapio-technology.com>
 <20220826114538.705433-7-netdev@kapio-technology.com>
 <YwpgvkojEdytzCAB@shredder>
 <7654860e4d7d43c15d482c6caeb6a773@kapio-technology.com>
 <YwxtVhlPjq+M9QMY@shredder>
 <2967ccc234bb672f5440a4b175b73768@kapio-technology.com>
 <Ywyj1VF1wlYqlHb6@shredder>
 <9e1a9eb218bbaa0d36cb98ff5d4b97d7@kapio-technology.com>
 <YwzPJ2oCYJQHOsXD@shredder>
 <69db7606896c77924c11a6c175c4b1a6@kapio-technology.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69db7606896c77924c11a6c175c4b1a6@kapio-technology.com>
X-ClientProxiedBy: LO6P123CA0060.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::20) To PH7SPRMB0001.namprd12.prod.outlook.com
 (2603:10b6:510:13c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfa6fc54-bd98-4e3f-e47c-08da89d7fb2c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4048:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	SGX5iAxvuswvzzIboVJfmlcV4xLFtzVNNAY8FhTUnYUhzNSkHdC5twkj/0y2AeIapEnMELu7qTCTr6NFj8QABOjVCM5nNofGI5XSiap0qg0BygP4G9yqWCa1J1hlTrLeoI4avaEfaWbJePXD9KssAfy/T6Bpu5qCMJfGgEVlBKSmr01bV7b4S9t8bTO6wEIanHp8Mg00zBCSl3roddgpHmUzdpV83JfR+nra/C3S82iHJksWJolB2udnXrtFv5CFA8NPkUlp+MZ2bhAqZUzyZOolDj5kKs01CEzipKINaWimAHew2Y7wcny0yVtTBe219R9aUPjElA9RRxF3HnUQHKPM1HonZ2i8kPNfNsusi6SZ/USivrWJ9lNrdNv5nKxRwMSwl8yOnCOQBv2/Vx/+9TdFAFV69bV34Ulq8zareRMTB5iIp/tSHVXcVN+zsbVV3AGDnfilocqG+U4m6eb6H/SYrNRzAPJp+7IxoxUA2/0ks80l35mH4PEeHR6EGsvRaDcrIj17Q4Gc2GnETcGg7RlmQcvV22noh9StQZCqMU329TjQWRfq2I1TCdIaH2Qc3+76rAE0Dp0XT3HIOm8tn0jiQmnCtUihrb1dtX5HvJCDAryH9+YVYQKjR8ID/k3k6iN9f7lZxOiXlpIftGAdhBFJcGVjCp7BZov6szxfWHR07e7bo1/K+tXcops1yyouMFS7mm2V5SyZsdwN5Sk89g==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7SPRMB0001.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(8936002)(54906003)(66946007)(66556008)(66476007)(4326008)(8676002)(316002)(6486002)(5660300002)(86362001)(6916009)(478600001)(7416002)(41300700001)(7406005)(26005)(53546011)(6506007)(38100700002)(9686003)(6512007)(2906002)(33716001)(6666004)(83380400001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?QMb3Z8b4ENTUaFb6MlDVejxRWceqI7ELZeU9f1Qs13OhI8zc1n/KrvXTonKh?=
 =?us-ascii?Q?u7leJYSDBgvMHeDHb8mA633rGpGIDCAG7LkTfwS1/4574wgBOYtmdfUvuWnY?=
 =?us-ascii?Q?IprHwHKyAX8Zol5HWu5nKBaz2K+zKpm27/84SR8i9dlN4b4krJ91nr5K7XGm?=
 =?us-ascii?Q?4USfHtmbBKi0H6qXi200sc25NKLzpIhu3bVUHjwStVYNy5+W6Q3Jok+LXXph?=
 =?us-ascii?Q?UW00At36fBr6NzBs7ytZtbEBT8/Dqh9Gy8OpOSsNPr1Py8rdplZFcSvtbmGI?=
 =?us-ascii?Q?cRsXoxHYD7M35115WqbGH1Ikgt2J8z8ExNnZ8XXJnd/DuNBTdUOKZpSrAnk4?=
 =?us-ascii?Q?gYycCij9l4i8TWszjPMPSRmHv1RAaTP/7D0F7r9I+3fn6pVzcs48GWBswzXI?=
 =?us-ascii?Q?yKHaFedda99Lcs+ggA1zCL44KgMN2her1An0WBndwGqcs5dGfHXA/JgaY+lt?=
 =?us-ascii?Q?mlxWXK1EIqySbUZOcRETqi6Bj7YlZ3W+ZLsLIWEneZxUGMnaJXKSJdhQ1Rn5?=
 =?us-ascii?Q?iOQrdXCz6fN/eWceeIhAfFq0GRYslNISTAPYYXV+qV6qdMpeyBcK2kKuqalu?=
 =?us-ascii?Q?n4zuSZLNaBwUMHcAh8CUiTYs6k3BzIoMIQ8s+rT/rN4ghL9SdtL+L0VmWsk9?=
 =?us-ascii?Q?cOUXeGcRYAVgpnwNt0FuhCV11//uErL3xbBI1H85XyAxwZtMb24bwIKsJB3o?=
 =?us-ascii?Q?se4lRSuku6/2dF7MR3mYdWaNIhasFwdgjnIVgKpi+O/rJd15+45o4V0eEUZa?=
 =?us-ascii?Q?cGTWcPcOdqxaOTvWZoXo/db+HoNH8/nCIkAJrZzBz8Ix7wVvG8mzZQYO/vIr?=
 =?us-ascii?Q?ESzimOM9fM8tubrxhI+LVdf4NWODYPGYohVYv2D7B/DevZ9yg7Zs7jeHHRn5?=
 =?us-ascii?Q?S8LW/btJazNnff/kwzbbFZvARFdOUV1FrMM5AAY3TsMZwxRVVvTBYOad0GBo?=
 =?us-ascii?Q?821Wa8SIfTjJY0+sB3VsxocowHvRh3QqvDSt6L20vYsd4f0DnQ16iNe5YvzM?=
 =?us-ascii?Q?W/TsMZAB7dBVQ7EK7vfdNgrIZ8mxo3uTPLbnMEPPQTN7/qnK5ZzuhcBsacZX?=
 =?us-ascii?Q?h53YXDXTlMMX031m65eIAJzMMWgrqxvsio3+PG4f90264CDWnv6zmIncVKKC?=
 =?us-ascii?Q?rR0G2oxj5pQfXTEWSYLgGtwOnvtrUmHRFgtFgzNpxUF5or6pvSfgMhIZgOi+?=
 =?us-ascii?Q?fNSH1dPtSNTU19laEm8yNaKbnGfNkBr2IoJPhQPdsLLBxDUTXXvNJYjZ5gnL?=
 =?us-ascii?Q?KAKl1S3V/wMqdQdhvaObfIsdnPt2yg6wL8oiE9aBprE0iSY18B0mQCJY5I5X?=
 =?us-ascii?Q?2wrndeKnK8126D4ONVLUkT4hV/YkhCLCfXcTHBkK61tnc7ddTwLyyZLcncrg?=
 =?us-ascii?Q?8n8xOf6Pdxvc3hlUZIY5bSJGSFGPutGYxEQ3ITln06vpemIYKR1gACtzEBFZ?=
 =?us-ascii?Q?vNN4c9Sc8h5SKy0TxOJxDNI67YIIOUeTf7xocBOLGNhTbRLfLZQHMFzf5jaG?=
 =?us-ascii?Q?beCXfDRvCt54aClmT8JgQJLdGWhv3yZoOpQniryxNjCMoalbGYDvMrG0To2W?=
 =?us-ascii?Q?QPeO9XIgBpK8oNqJ5IpTRa7XxU78HeRsKVTeJWhE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa6fc54-bd98-4e3f-e47c-08da89d7fb2c
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0001.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 16:03:15.2437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 29d9G38BIbOkDRD+ZBODP9mSv8eigm+bv5gW3JuiwhoFfatD6DNxwhQwbVyB/1zkv2VD/DKhU4DUEzguuBkGxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_090319_687498_38FA09C5 
X-CRM114-Status: GOOD (  18.61  )
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

On Mon, Aug 29, 2022 at 05:08:23PM +0200, netdev@kapio-technology.com wrote:
> On 2022-08-29 16:37, Ido Schimmel wrote:
> > On Mon, Aug 29, 2022 at 02:04:42PM +0200, netdev@kapio-technology.com
> > wrote:
> > > On 2022-08-29 13:32, Ido Schimmel wrote:
> > > Port association is needed for MAB to work at all on mv88e6xxx, but
> > > for
> > > 802.1X port association is only needed for dynamic ATU entries.
> > 
> > Ageing of dynamic entries in the bridge requires learning to be on as
> > well, but in these test cases you are only using static entries and
> > there is no reason to enable learning in the bridge for that. I prefer
> > not to leak this mv88e6xxx implementation detail to user space and
> > instead have the driver enable port association based on whether
> > "learning" or "mab" is on.
> > 
> 
> Then it makes most sense to have the mv88e6xxx driver enable port
> association when then port is locked, as it does now.

As you wish, but like you wrote "802.1X port association is only needed
for dynamic ATU entries" and in this case user space needs to enable
learning (for refresh only) so you can really key off learning on
"learning || mab". User space can decide to lock the port and work with
static entries and then learning is not required.

