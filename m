Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFC8C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Dec 2023 06:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2BpRnQ9Poa/RzGqVi78BfpPiBjbMH29PWk0HOiuGvyk=; b=Q1JsLk2UgxIAFdf2CbeVt+8dMG
	x3Anm4YK8p2UDmqnzxotYyByCJi14rXv1i3HBHE3qTI+k5W/ysDlFN1YD3KUCcBw5ZmntBh6YGu5X
	FMqX1/Eaxsvg9onGUe3u9D3BiszcOyOnSrjthnD6P03jBDTKCZUvpld1vjCSwA4B+Zu19kms57laJ
	2dmdNbGxX1Fay/7CsmIKzAHv8TQ5mVPfK00GGrrkXh2NbFX7z/zohSDZUhnEvTNAdqz8eN/awinr1
	eKbI7KLQTWiCAJ3HnEHifbWcaAygNqkzP2u54HcYO1Bz6tFz99r5/L81xVkvmOgr9gRo4sfOtjoor
	MmUrHO3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBUR3-00EsbU-1J;
	Fri, 08 Dec 2023 06:34:05 +0000
Received: from mail-mw2nam12on2072f.outbound.protection.outlook.com ([2a01:111:f400:fe5a::72f] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBUQy-00EsYb-27;
	Fri, 08 Dec 2023 06:34:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kNyjEfwrfVzzWyMiGHbwnZEch1Wgg426EZ7zXG8W7ZytWT45XcTNtO2X6YFGD8BD2CEia0pVuGv1Tis/ScLKGvmVSSxMqq/AUxD3GjOTygvLGBDoPZ32KEGapHoW1DDIghdvcyaVZVC/s8wLjJHnwH2wKu3FruX+MK9mcXIJU/a0xOxhLDy3KNtMKpaIxv2kW+ERU/syTebgYofEjKK6iAiyeZe0Ilgogdk6C33caW053ZxCVIqjyDNzjJ0MX2rO1hUfurxzIi3e4N/ohTAI8D1At+u4kdLFrYX97T9sBYf0fcSfhsve5vrgxFCsIh8G57E2oLAqffD+Jf59syjSNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2BpRnQ9Poa/RzGqVi78BfpPiBjbMH29PWk0HOiuGvyk=;
 b=SKKhcMrx8hknqtt1YFS9Wp2frGd59esjRcXKILVcL/dRWZ95T2WlDnShFFD+KVE888tjAXKNlFan/iUjp3QtnFtVrngUdYd0ljJqbCvwcX4+n1TDeMkf7NddquSFxqezFLNTXRXBIl3VgIa+fpQd9mnTPKOSF5406WHwPWzBjKpJI+YeCTWwUQDu8Hd+UpCYfJUf90htu05KkbNZq2SayDV9KEVw1Kg/SqfhSZxnvOjr9zClQAF9JcEpa7g05iaSQAG2IsS+xuTR5gseHQWwWUOyA1y2CprctFTGjPLgWCz6RdlTS9c0w4pgiR5oWSN5WdVWZOJOHmEQNgTXt9zXYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BpRnQ9Poa/RzGqVi78BfpPiBjbMH29PWk0HOiuGvyk=;
 b=UAIWCdMRf58z52FiqIoauBLeM6b8CPclEG8ypMl0YrKToeVQdAGQti7gb6kBH5xU4J4OBSbqoSJaDZS2BWjuJFszYoE7UHZ8UTqi2Le8EgzBngYOQq4II5dn34vUCrsOjHvRhAxSiwvwBqv1KPsgxcsW4UBgNF5I6kpR19q9QE8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from BL0PR13MB4403.namprd13.prod.outlook.com (2603:10b6:208:1c4::8)
 by CH2PR13MB4441.namprd13.prod.outlook.com (2603:10b6:610:63::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 06:33:51 +0000
Received: from BL0PR13MB4403.namprd13.prod.outlook.com
 ([fe80::d3c0:fa39:cb9e:a536]) by BL0PR13MB4403.namprd13.prod.outlook.com
 ([fe80::d3c0:fa39:cb9e:a536%7]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 06:33:51 +0000
Date: Fri, 8 Dec 2023 08:33:22 +0200
From: Louis Peens <louis.peens@corigine.com>
To: justinstitt@google.com
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shay Agroskin <shayagr@amazon.com>,
	Arthur Kiyanovski <akiyano@amazon.com>,
	David Arinzon <darinzon@amazon.com>, Noam Dagan <ndagan@amazon.com>,
	Saeed Bishara <saeedb@amazon.com>, Rasesh Mody <rmody@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Dimitris Michailidis <dmichail@fungible.com>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Shannon Nelson <shannon.nelson@amd.com>,
	Brett Creeley <brett.creeley@amd.com>, drivers@pensando.io,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Ronak Doshi <doshir@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <keescook@chromium.org>, intel-wired-lan@lists.osuosl.org,
	oss-drivers@corigine.com, linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net-next v5 3/3] net: Convert some ethtool_sprintf() to
 ethtool_puts()
Message-ID: <ZXK4sgtuvJQswZLS@LouisNoVo>
References: <20231206-ethtool_puts_impl-v5-0-5a2528e17bf8@google.com>
 <20231206-ethtool_puts_impl-v5-3-5a2528e17bf8@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206-ethtool_puts_impl-v5-3-5a2528e17bf8@google.com>
X-ClientProxiedBy: JNXP275CA0006.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::18)
 To BL0PR13MB4403.namprd13.prod.outlook.com (2603:10b6:208:1c4::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR13MB4403:EE_|CH2PR13MB4441:EE_
X-MS-Office365-Filtering-Correlation-Id: a3856e89-e3a1-4b75-93f5-08dbf7b7a43b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yIFntbk6hUTgtpQrUXivOS4RpMua6e5qJRyINcjhdI8UmoFDQoy3EsFnKbiQXy/0x2B+GyNhPRLPmS+uLnld/qpJB0tty0qHYA2BuamxIgPORzXlGxGb8QmFajNTq9oRYFcvv4voBIqgGubBILDPjPdYWYgOcOGLVmV8y+SV8X6NcbQb7fxjjP0VqH+QhmWmIqO74rKjlkCEo2VwPTwn2e1eN/PzxU0OX0yXNd3IXxq5nCzEdKp9RSiem8hvVZ3/08dB0H8HbNKpBrac7Dv+YEzVlMCqDfOZxA/12svqpIvwYWe1qCV14AuqRzd3qhxLVclFJfLjKD14zkmvQGp+xXnV2+xPDFBCVUovQVHN2jPtBPIz4yYhlRouo9+yAO5YyHnCQeVFftu5C44i3iK46L8Ign7MzpQzW8oGdED4Xb9VU/S2Sks0vVRyS1zwj3//2PH0wPjyOmq8QpQUjSlKrJYqEYc4b9TIBMTmj1D5EabB44lLGzyb+PbX62/gt9Y/1OxTG9V1qD3daQMYzRNVKmjYYtniMds4rU1G6BPwsSyVp03WWQsCUL+zYv0p0Iqg7LyekByvPgEgCg5uYTFGuBDxscRRu/pSC/YOjvAv1CM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR13MB4403.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39830400003)(136003)(396003)(376002)(346002)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(7406005)(7366002)(5660300002)(2906002)(7416002)(33716001)(41300700001)(38100700002)(54906003)(66476007)(66946007)(66556008)(86362001)(478600001)(26005)(9686003)(6666004)(6506007)(6512007)(44832011)(8936002)(6486002)(316002)(8676002)(4326008)(6916009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pXSkISbapldWkEeeOByjOSen4muvzaGMpXGK6LHhGjpOia8WKOdmxo7T/DoP?=
 =?us-ascii?Q?jPC9dUDjOq/M8Gvj8n5okhY7M3RCzWsTmo/N40O7hpwJPemV+uCM/NlsYKqa?=
 =?us-ascii?Q?Aqz4a93S7BI/Qe+AHtKQtFXAHpjcGFJ3jAuYmQaCkgV/aK5uo48FHj4rURfo?=
 =?us-ascii?Q?Thka1J14/AIXNuWs0spcnOf1xg1KtH2zLLm/K93+q77q654KfRQ/C/vGeu3h?=
 =?us-ascii?Q?6azzHjAyTN+EWonpuvT6BOQ2uUQWfcRbSNJ5/wnjFfRXskt4qsIErlWxkMT0?=
 =?us-ascii?Q?ML/II9vl6OdyrFglO9mmY3ibFGVV0SYdzcwBXpsami1tAxR6XzhH+ka+qg+x?=
 =?us-ascii?Q?AEbOY98BG5kmCVFaYyxl4CzJavtGmxrglqrNhb3KcorufYrWe7xblKg2cHod?=
 =?us-ascii?Q?+RWdjjdy9nRVGlAanwVjSYo0mKx+9ZUUcf5+PKwJk6fjnzOjWQiHZ4FTXJls?=
 =?us-ascii?Q?GDhzErXU8BOm2ih8F1uxoLCWh9078LCml6UZQEacbICmxQzZIlLN0BtkDtyo?=
 =?us-ascii?Q?aBCe/U7DaC+WDAf0LBlmXEeRQHk+Jvxm47h4fp0AFX2dlRZZvhlGknlHQJm0?=
 =?us-ascii?Q?xHgVjwqEQeCHioGgxS3q58gH1/HjFaA3+qvnS58sEzAL/Sxgi04i3YcdHT/s?=
 =?us-ascii?Q?CQpEtvAIrbe1dyaA+dPwfbHF+wqLAkaFeszAbb73Yj0WQ0nvJCs5rLFnd1Cz?=
 =?us-ascii?Q?iTwuZAn66uTeq9sGpF1kk5lxQPXaA1LHYpkXY/bHEISPrJL4ACFTgtyAX2AA?=
 =?us-ascii?Q?BA5Hu/n7yy07Xfp9FaFjinsrFerTenET/uWG7ogPgM/3CWPTUsn+Y9MjY4Bd?=
 =?us-ascii?Q?Bampa2FGf3uU8xf33iVOsP3dh57qzmdNMeDzA9LJXjQDak4F47j4sDk8stVo?=
 =?us-ascii?Q?vFtaGJCn8QLKjeLUFJNj/cNWNWJ0EGClE0hL9f0oMwwxCnvaqU9TMa3SrvOW?=
 =?us-ascii?Q?7bIYJr4o9/nwweQkZb6fCx+Cxz9hbYUG9wL+XRGOfc/LP03LHkApCT9bu3bU?=
 =?us-ascii?Q?a6YrOptNPMptX12sZSdPi2LfnnNERag+9qAUi+L+trl1EPNPbOf1uAHgZFaq?=
 =?us-ascii?Q?DKfh5HMAT5Jy0KrY4621r/mWuq1rJ1llB2KW2qRC4Ps3me/6nVUyp+bxj1DO?=
 =?us-ascii?Q?jLFPzx0UjrP3BIB1zbsMSBWDE6B/NzP7PR98n5K4ah2Y8bGP+CWOMy/JweDl?=
 =?us-ascii?Q?B9aTbYxjyMW6luAost2YVeT3d01yac9OzuFkdO0hynnKZBnr2/Z8qCB09WKD?=
 =?us-ascii?Q?h1upqrKydvKnXCCS8JKkTG+PFSaa2pxFg5HcGY6z5ISgsePLZzAGfGXt+x7Z?=
 =?us-ascii?Q?KlwMHo4q2+Zr7ow+7HmpzpLsED9jF2p4eg5FrFG6NL5WdlL88wqOmUfJq1HM?=
 =?us-ascii?Q?c2AVUo0EGUIyaPra5zWjRtbsaHNnG0s7TqF+MNZa+FH4Svsk36Z6oSJJ+mlq?=
 =?us-ascii?Q?pivnYAE0qnbNj7mlLWtppdBIM5ab7zsxnB5Grq9N9YdYjAvStuH/yYM9fVu2?=
 =?us-ascii?Q?5OLVt+wGAZd13O3aNqqW8x8E9ekRRhyTzSiEvBgr9lmBM6a8sjeykI8/WcVh?=
 =?us-ascii?Q?LgakatkK5SNeXYaF2TgZmZKlFu/bULqRPP1tx2QJyd4UFcORzlbgugGHm/6Y?=
 =?us-ascii?Q?Jw=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3856e89-e3a1-4b75-93f5-08dbf7b7a43b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR13MB4403.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 06:33:51.3116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gg7+wXqMBe7GS4Wloe1D/ZTGQRYAftgP4ikH7cbV9RnOrwk1VhOgZX7tnbgX8S8W61pRsbEnkedQ3DP2zSGcqwibuTuaDONejFCfNtkJm5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB4441
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_223400_720452_A427CFCD 
X-CRM114-Status: GOOD (  11.66  )
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

On Wed, Dec 06, 2023 at 11:16:12PM +0000, justinstitt@google.com wrote:
> This patch converts some basic cases of ethtool_sprintf() to
> ethtool_puts().
> 
> The conversions are used in cases where ethtool_sprintf() was being used
> with just two arguments:
> |       ethtool_sprintf(&data, buffer[i].name);
> or when it's used with format string: "%s"
> |       ethtool_sprintf(&data, "%s", buffer[i].name);
> which both now become:
> |       ethtool_puts(&data, buffer[i].name);
> 
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
>  drivers/net/dsa/lantiq_gswip.c                     |  2 +-
>  drivers/net/dsa/mt7530.c                           |  2 +-
>  drivers/net/dsa/qca/qca8k-common.c                 |  2 +-
>  drivers/net/dsa/realtek/rtl8365mb.c                |  2 +-
>  drivers/net/dsa/realtek/rtl8366-core.c             |  2 +-
>  drivers/net/dsa/vitesse-vsc73xx-core.c             |  8 +--
>  drivers/net/ethernet/amazon/ena/ena_ethtool.c      |  4 +-
>  drivers/net/ethernet/brocade/bna/bnad_ethtool.c    |  2 +-
>  drivers/net/ethernet/freescale/fec_main.c          |  4 +-
>  .../net/ethernet/fungible/funeth/funeth_ethtool.c  |  8 +--
>  drivers/net/ethernet/hisilicon/hns/hns_dsaf_gmac.c |  2 +-
>  .../net/ethernet/hisilicon/hns/hns_dsaf_xgmac.c    |  2 +-
>  drivers/net/ethernet/hisilicon/hns/hns_ethtool.c   | 65 +++++++++++-----------
>  drivers/net/ethernet/intel/i40e/i40e_ethtool.c     |  6 +-
>  drivers/net/ethernet/intel/iavf/iavf_ethtool.c     |  3 +-
>  drivers/net/ethernet/intel/ice/ice_ethtool.c       |  9 +--
>  drivers/net/ethernet/intel/idpf/idpf_ethtool.c     |  2 +-
>  drivers/net/ethernet/intel/igb/igb_ethtool.c       |  6 +-
>  drivers/net/ethernet/intel/igc/igc_ethtool.c       |  6 +-
>  drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c   |  5 +-
>  .../net/ethernet/microchip/sparx5/sparx5_ethtool.c |  2 +-
>  .../net/ethernet/netronome/nfp/nfp_net_ethtool.c   | 44 +++++++--------
Still happy with the nfp parts, thanks:
Reviewed-by: Louis Peens <louis.peens@corigine.com>

