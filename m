Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5F0C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 15:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l2bjvhziqQgoV1E+Psh8obSDlAdj8esriACJkfQ1O+4=; b=pxkAWKkhdTB7DlhW8U5gqn1zuF
	bgpMX6Lq6s1xoY5yhwZ+kJRLCViaRJvZXGgIU5OJskwHiTdO62S8IsDY/g+d2G2rHTTpK2v3f66GD
	QNqGGDyl31m1xjUSVp3YPeHn/rKB3rXQ9MC3Crjg6VhMpLIYXVCfz1rb9rsSd2RYXkBxDgsS6UXYG
	kv9RnwbqqieEu0PXGbovqSsLnliGFSoK7oW+k1KwK/ksHYp1DQzBtRiHu8TqMhUeOgZOR7b/o1/PK
	fVumKWkar41pM+E9bry2eQGZT9NkbSGbbhM+6lmHy1eOAXzGem9jpM8cXMeTxSwawsgD5FxBJ0ZKu
	uwF70Gwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZZNu-001HH5-2r; Tue, 07 Mar 2023 15:37:50 +0000
Received: from mail-dm6nam10on2071f.outbound.protection.outlook.com ([2a01:111:f400:7e88::71f] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZZNq-001HFL-KL; Tue, 07 Mar 2023 15:37:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9Gk/dU2z/GTmxf+VAub8QYr2pjhF/TwCbzvUkFvkJ2M1MD4m6geZQCG9ppExhBlgX3m5Ge1bW7TZPqM0zQKyQB3L75ldTo6ettbzB4EP3vc3+bgJUj0LZJl5zGyvgR9baJlEXrXFCXh814r+qRhY7gZLSDdgIVAGfyUHlr22E2YWvgSmoGLf8Gs0/kwuw4ajrNW++yRcfKMx7g5KLsAX+WBwTI7Ykqt2uA900JzokqzxAwOG7SUbmcD9GF5yBiExYNsAx3lwPfHQ3Wug2dCGMzap6DpYbE10RRPAuIi8SfRqP6y/55U1gJzelI6672LUrMSad1iS10qnkmNzror9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2bjvhziqQgoV1E+Psh8obSDlAdj8esriACJkfQ1O+4=;
 b=Fv01L4Qf7osx29uc3KnHBMTa3+wZH1an17+Uyq1S85QYmtZoVZD7DzMUWuGIyg/kwSUrA/fPSy1sxOiP/am0X3rPcyXDmF7YkTDHVeX3NXQmiJ2/4TqTrXyCwiuDwxwV+id346lFxcnycOPd17WP+j0+hqFc+DWgyH1cKyveJbNPJik4riTHaiN0ciJeAIzzPiXn9n4JuSRv0o1GKOwoFGNTMvvgmcxTLJXciDAVOHRoCgT68bp3+LuyPFjO6Rvnl8cT65i+KSub3QeEzMBSKUgISbunwPTq19DPO6nVsApF0mgPwsIB+ADijB0uzUjGrmIgbz38lchVJrgTfP0rGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2bjvhziqQgoV1E+Psh8obSDlAdj8esriACJkfQ1O+4=;
 b=tuRtoAGpdsjfdy4svfz8qD8REsO+ya4LjRPfAmFMvqHQ16gyMnXbFKgtWgQLaZ6nB0oFBPxI3Mfrh5SISMb3Zr12TjOBv8MPbrMFRaBghJKBfN7ygHydUGoj6SlIZRK9/992zyUovdJWOIdLVF7dJzoS7VLbbcOvsOQHvvkhs6Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by PH0PR13MB5035.namprd13.prod.outlook.com (2603:10b6:510:75::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 15:37:40 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::85f5:bdb:fb9e:294c]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::85f5:bdb:fb9e:294c%2]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 15:37:40 +0000
Date: Tue, 7 Mar 2023 16:37:31 +0100
From: Simon Horman <simon.horman@corigine.com>
To: haozhe.chang@mediatek.com
Cc: M Chetan Kumar <m.chetan.kumar@intel.com>,
	Intel Corporation <linuxwwan@intel.com>,
	Loic Poulain <loic.poulain@linaro.org>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
	Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
	Liu Haijun <haijun.liu@mediatek.com>,
	Ricardo Martinez <ricardo.martinez@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Oliver Neukum <oneukum@suse.com>,
	Shang XiaoJing <shangxiaojing@huawei.com>,
	"open list:INTEL WWAN IOSM DRIVER" <netdev@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:REMOTE PROCESSOR MESSAGING (RPMSG) WWAN CONTROL..." <linux-remoteproc@vger.kernel.org>,
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	lambert.wang@mediatek.com, xiayu.zhang@mediatek.com,
	hua.yang@mediatek.com
Subject: Re: [PATCH RESEND net-next] wwan: core: Support slicing in port TX
 flow of WWAN subsystem
Message-ID: <ZAdaO0w2u8AL27un@corigine.com>
References: <20230307081113.67746-1-haozhe.chang@mediatek.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307081113.67746-1-haozhe.chang@mediatek.com>
X-ClientProxiedBy: AS4P251CA0017.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d3::6) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|PH0PR13MB5035:EE_
X-MS-Office365-Filtering-Correlation-Id: 1993ae49-6c76-4e82-a20c-08db1f21e2d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	2xw08eGL7K+QUxMYFf8R4mVR1/SvpGkq5W02AYcfTKX1Qm8b8YOT3PXJpsTbNEvIFu7sUWANYDgXQH/OqxypagiblzAqZ3eCn+m1I2TtjqzR/9SsPueWeYu34Uu9WaOvKpI46aThyNe0mUPBkuhxfm54+NSiWCBx1OQaFI6lL/jEf7UqQoQr+SdCBaTqtPlYCU5l/pcnaRMIoJZ3r1C4a86Znqaj9T0AMZZ4ijxI8uY6B97znXXMYsw9vqFVQeDq/MIuUnz4ET+SC/xx51JLRmouUkL6pFyZDXf4wIAZ8siAMCeM05zXFzR7PiVx8lO9p7ldb6wRbMeCj9nj6wXt76C3OarrQ3E0O4cjLBOnR+axlxYA9GmsMKPXqqY6exe1OKumen0LeaimnDEzEuEUTFQSPRjHk5TRBtk8FBZNRnFA2qxSvH/I2ICe7cJmGagZQz+zRrkSIhf70SIdbD6icwt8c1aCFquWrUJpmg+T8W7fo2iyvJZqbZk+XF2bkP3MVhUjElJnOr3f3wYEeMmI4YkzexksAVGMndtLYLwievPHNR7Y5Xdd5rPnnVHXWWKASUYT6fBRCd52MlVJPgHFMOwVWyYJR5FuBEhdD4y2oosYKS+dvlUNmcn2tlPzokBdi9N4Rb0jSkak12IILUdWBg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39840400004)(136003)(376002)(366004)(396003)(346002)(451199018)(38100700002)(86362001)(5660300002)(6666004)(36756003)(7416002)(44832011)(2906002)(4326008)(6916009)(66476007)(8676002)(8936002)(66946007)(66556008)(41300700001)(2616005)(186003)(316002)(6512007)(54906003)(6506007)(478600001)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?WrpWl7akwCKYCZf8FqaCj8P8+bEv50PzNauG/LnXL9CLYf6iLaQHrwCRKCKe?=
 =?us-ascii?Q?1UyA9ngVvMA667yR7NKdOURov7t1lAot5nkDdCyOeOCkANQ4zGEQXwJcb50A?=
 =?us-ascii?Q?ZsqP+kTGdSDK/POcZdmixO5qvxKzjDOwt3Cq328OpwGAte24r1WVq8DrJsHs?=
 =?us-ascii?Q?1KP21a5bzRB4/I/j47/sD2QPsFp9mme7ynmXlYAesj/uElAJfCJrhJEPWC2w?=
 =?us-ascii?Q?gweoP3tDBTA+NJhEQyDHE2AxHi0ej1w3K2C6Tx174PUWBSjwEEvfGTaYGfJR?=
 =?us-ascii?Q?AVC+WI8/6ujTW3sCF8Gy5AeS4u9HGWwQIbfNKCi30AHbLu6XOV2hYK08SOCa?=
 =?us-ascii?Q?cVOvAd2oNsu69gF66BEmeAr/Ar+lg0SnbwwosGbCy2VEzSLpJRjLrH3gbO5v?=
 =?us-ascii?Q?jTXhPhMIE0lkSq6uaOgpxHjXcBgSF9igt4iCgI5pIt/uyP/AlfyMAYztO8cO?=
 =?us-ascii?Q?3gquVZtLbKMCEmmJ5dn7Etb+fwBG4HTajKapkR0ITHQvMNSlzs+P1Pp+XZdY?=
 =?us-ascii?Q?/6bv4e/s8RKqTMiLO7/gchL/jYTVDwJTrYJR4tn6Cr59LJpUnl7bFJEmYgi4?=
 =?us-ascii?Q?KaRvZKpA/JWLF+DVZujEYbT3/zOQpkapdCQzWPO7baMIPuZ3UfWjrDgKd/fE?=
 =?us-ascii?Q?5GFkZJatCC4+p612h9naoQZVxM49VFX6eqtbEVhLGiiQimm+nRQerHbpR1+f?=
 =?us-ascii?Q?ubHVj8c/QDi/RtFVeSc3IzZCGvzGu7FCUEmec4cyLNfGX06Tu3CHmEjqGSFB?=
 =?us-ascii?Q?xSENgj4bvqVPSYgGtJLPTDOTJgbVdRJRy47AUB0gcadGFAUxifvY5SzRBva2?=
 =?us-ascii?Q?1GFi36jzunRTlNKzs5ZyekkSWddJypNctRO0KL2rUBaSvcQAkp6uz7kUTO2M?=
 =?us-ascii?Q?bcLssDujtf1fNvTXkTjE7qWQjmdxAiMKiCpBMi8ElBmDnJnWkp6grlF9MJRg?=
 =?us-ascii?Q?kcd4Tla1Wf0KcLQyZY9JjCtawUW+UbvN+Il+39+ZpNRPd+45ABwtC9MC1Ams?=
 =?us-ascii?Q?kh1UMyNjsE3cTfziXnoQpYQFur0mAQz8zH9TyK9OHbO0U40S/k7XQCMPylgt?=
 =?us-ascii?Q?bsMniQ2lLZU5GyuJUCrGw/4wi4Meu4ZvgyqLMTXcaqFYIrfKe4gNMEXrhM0t?=
 =?us-ascii?Q?Pm70TS50v5vGq3OdDUaxKgC+NVMMDN1xVrVie3FQrgNydJFnAqCEq252bWAZ?=
 =?us-ascii?Q?nUYEEgG4jPXqAY8Rpo8a6H1dAzSIc54FH4qzqRGtmFcC+rIU0hPXNBZdGUxt?=
 =?us-ascii?Q?FGTiZwzZysNvwiUBJgt/If70lsT1zACFxLkwLSb2i2YJPaINuE73O3pbVUgX?=
 =?us-ascii?Q?RToWkfebAxiziVJ51tWFM6fgod5aeTHZdnLrXxGwutgGA6Pn6qXI8sbLqFGK?=
 =?us-ascii?Q?BtUku5u7qmb3KJQQ/kVNeYg0ATOTRng3DSUBptFJVcNWsjGrRAQiEgyAhFY/?=
 =?us-ascii?Q?rA0MV5CR/duLm8VOlCzTW87eru6TUR0WQLcX+4qjn8dCkDJMYGwllR7pm3fS?=
 =?us-ascii?Q?25FYRa4V2aWJgh5jlk9KOody9YTSu1bNQ7o/A+VbfEeo+3HUp4qhmZ/3oBFU?=
 =?us-ascii?Q?YrcnOLLAK/Qp/jGBoFd7X+Cz3cIN2u+LXTNr+2at9Ng7FEFbOcOonaGPQ2v+?=
 =?us-ascii?Q?nh7udRcp2qYD7d1xp5w03i8TeUBKlf8iAcZXY80EXPYKxtkgfD6F4rx119lh?=
 =?us-ascii?Q?iRtK3Q=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1993ae49-6c76-4e82-a20c-08db1f21e2d3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 15:37:40.5160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O4xxobh4ziIFB+fOti7lqen13aW7iHRigru6dA52mdU2IC7oQiOR8VCapUvG4cIXs9f9yB5bHlWFxikNbksNPMvhRY4/6WCkWUNw0YDnxxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR13MB5035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_073746_926071_A31EC40C 
X-CRM114-Status: GOOD (  19.11  )
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

On Tue, Mar 07, 2023 at 04:11:04PM +0800, haozhe.chang@mediatek.com wrote:
> From: haozhe chang <haozhe.chang@mediatek.com>
> 
> wwan_port_fops_write inputs the SKB parameter to the TX callback of
> the WWAN device driver. However, the WWAN device (e.g., t7xx) may
> have an MTU less than the size of SKB, causing the TX buffer to be
> sliced and copied once more in the WWAN device driver.
> 
> This patch implements the slicing in the WWAN subsystem and gives
> the WWAN devices driver the option to slice(by frag_len) or not. By
> doing so, the additional memory copy is reduced.
> 
> Meanwhile, this patch gives WWAN devices driver the option to reserve
> headroom in fragments for the device-specific metadata.
> 
> Signed-off-by: haozhe chang <haozhe.chang@mediatek.com>
> Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
> 
> ---
> Changes in v2
>   -send fragments to device driver by skb frag_list.
> 
> Changes in v3
>   -move frag_len and headroom_len setting to wwan_create_port.
> 
> Changes in v4
>   -change unreadable parameters to macro definition.
> 
> Changes in v5
>   -optimize comments for WWAN_NO_HEADROOM, WWAN_NO_FRAGMENT.
> 
> Changes in v6
>   -add reviewer to patch commit.

Thanks for resending.

Perhaps I am missing something terribly obvious,
but this patch does not seem to apply against net-next (anymore?).

I think it would be best to rebase and post a v7.

Also, the version was missing from the patch subject (but present in v5).


