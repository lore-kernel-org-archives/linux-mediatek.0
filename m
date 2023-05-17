Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81ADAC77B7D
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 15:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OhMr9sZi4rABGR79KHcDrNxiczite7LhBujapFvUJ4M=; b=Qw2FijK1EDFBn0VmUkWaPoRFjR
	fxlu2xTfxC+vgDyGMvsd5ba1ROL4y+uS9ucXRMaLca9yLc9Mn5lAJkTHD/PlqB4Bm5t/RHcAPxvI7
	BbLthXu2X3/7Tncnfr2PW6mkC+ZJevwYimtpie/zpGN5E5A/k4emBX1N2IARXdruaHiq2YWgXZJSb
	oJCgbdUD07g50MRpjlS2XX6lMFldmigdl/zz8angFS94jUTedN85IL17IPAlzKfARHct5F1VvPoJa
	q2m3sbPZ9N3EddBcrQCRIZHFXU63sDc8iwKC4z+3ygmPsnw/CYWJ/r176H7aH+NGVDu4s5oVHDhMy
	CHwLPXDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzJ0u-00AI4e-0B;
	Wed, 17 May 2023 15:24:28 +0000
Received: from mail-dm3nam02on20719.outbound.protection.outlook.com ([2a01:111:f400:7e83::719] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzJ0r-00AI3t-0R
	for linux-mediatek@lists.infradead.org;
	Wed, 17 May 2023 15:24:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uvy7eDycdY/Rl8k5ccTYrLQWRQl0r9JyceQ8TmRJIGKQNGfFOBHEOyNkzNoigUo0pnS6N2FjzS3WFP6mg/5dlUylwsAWpk2fKOY21N3P+fiEIPm9fwPJnfhmmZqqP5x1p99a7juOZDz5K6tj8BVUJP+DItAqA0KpkMKuXk4/YPClfVTOJ40/CdbTXP2A5crnHx5CzCeHPSsPNQGtcMOEcZCD/SrhttWvt+Y4qE1afYTJzjRemZ5lC8/URbiCqkmh7haX3z0UpLuSEovNodifzM2eUSvFzyzfcmEL2JyvHCADbTVyyWzWLKc3MfkzGtvAn0RIyBxjqcZ60OpmHwStpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhMr9sZi4rABGR79KHcDrNxiczite7LhBujapFvUJ4M=;
 b=BGjUNelvluY/b/tQb49X4yVIzIfsz6B7e1LLflBsA7j09u4bMIzSgVMWI2KGNSw4DOun8bWYA06AHHKknc5D6xQDuib244lTV+OhLuSTvieBfMu3JHtz5WRPKe57QVSv9LL2I2kmYFoNWRsAVdOq2Tz+xbiAVSKKUTI5BNrMPE/iJ+IDNPGFToLclYS+aYH79oQObc/IsVorg7vp1S2HMmetjBQ9unh6FnQl9VVU7+DCAIB/B0spt6tqIhgqQoPcr5ZSR4bKnGTpQYvVgXuvUyCtLJUELlL5I4Q+UBcItQLXNHt6ktAsH2qYlCdN9WdWySFGkJ2RekyRAEmET3a+zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhMr9sZi4rABGR79KHcDrNxiczite7LhBujapFvUJ4M=;
 b=qDhmt2Upn362MCV/yNOGZFfuCSGBMBi+6/6kuBZm6dhr4RtfR3GBH5to+Ee4XmgZmL8aMJ+TFKNIBCyAAc7l9lkwlVfrVYQLbghdJ3r6Xpobop+xDjdHno3RhkCrZrD10rJkgX0GQ4KgmKEmcH+H6G7JDthbE/ypn3ATiuTLVck=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by LV3PR13MB6406.namprd13.prod.outlook.com (2603:10b6:408:19c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Wed, 17 May
 2023 15:24:20 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::f416:544d:18b7:bb34]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::f416:544d:18b7:bb34%5]) with mapi id 15.20.6387.033; Wed, 17 May 2023
 15:24:20 +0000
Date: Wed, 17 May 2023 17:24:11 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Deren Wu <deren.wu@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Soul Huang <Soul.Huang@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Leon Yen <Leon.Yen@mediatek.com>,
	Eric-SY Chang <Eric-SY.Chang@mediatek.com>,
	KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>,
	CH Yeh <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>,
	Stella Chang <Stella.Chang@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] wifi: mt76: mt7921: fix skb leak by txs missing in
 AMSDU
Message-ID: <ZGTxm5o9w8c+mSmQ@corigine.com>
References: <3c9926f5492523e0128bbc4897815d75b83e324a.1684312995.git.deren.wu@mediatek.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c9926f5492523e0128bbc4897815d75b83e324a.1684312995.git.deren.wu@mediatek.com>
X-ClientProxiedBy: AM0PR08CA0020.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::33) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|LV3PR13MB6406:EE_
X-MS-Office365-Filtering-Correlation-Id: 919974f7-6e2d-4b25-2856-08db56eac903
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	D3a6jiuzs17Vvn8dhm12g+Aea81SkBbqaSd2feyFEJSMgwBTNkAzdfTxHVagAv7TmBVzvF6khwoyjOmgETeO1rF73pEMIdn9QbtRj8YXONpQDIAn0l1/TRjQina6foUDu/x4POIXrQBHc++rEPmKPLgJEccnPF+6HhPHFZH3bQBsmKCPCqk1XCVUo+1Fo4zO9LtXPdrLVngt1b/VwRrMpda4R/Z1QfrW+s4Zse16SEikwyapmmgaObmeSQBrHnAKMoeMKA1Q17+9Dge0CsIaKe5rknrj5zp8vmp+DgFI4/1f8X3V0oN/bmdfwGKw3gFawlv8aL7JIov6SHrq8cPPWX8WJGGyO9/u6dKikcXAx3RxSUdp1V5em5Ip5v5t4uqjyKkb8zPPCKHhGCZZda6llfUAeOIK02pCv81y9xH2cAjNZ5ZTxpXWV3CpV0SDu8xItbXfsPsCziv5ICADMOorwWAYun77wGAdu1VW9kfuXgRM3T+1LdZlDvBXkZ9Zp2eh1+E219XtjBveI5xmKUPuB8tg0Cx0phz5851N93WwjW//3iiX3yp3oXdGGGEWRhaUyBTIvgFBJBPu2CV55tSy5V0dDUdcQqXdRR8kEGTbcXdn6avs6vsVopnds7yVQFKCqCDSTE1MxQvvZc18RAnXx2++ZPZvdcsDJp2UqwGtQMI=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39840400004)(376002)(136003)(366004)(396003)(451199021)(36756003)(86362001)(54906003)(66946007)(66556008)(4326008)(66476007)(316002)(6916009)(478600001)(6666004)(8676002)(8936002)(6486002)(5660300002)(41300700001)(4744005)(2906002)(44832011)(7416002)(38100700002)(2616005)(6506007)(6512007)(186003)(83380400001)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?tGd/oMdHJQwPu8LXBmC4bIimx/t3/nfo3tL0FCF+ybeeJwRF6Znk6NEMPVfa?=
 =?us-ascii?Q?0kJNd5vGlsAi2aKlClkaiqRrMKOxHLVTKO/0QlPm6eWymzCncFyGtKRSZfNa?=
 =?us-ascii?Q?1eZQfEv2TGe5LB7n5SrnrXo8/RCj1HYondDeGzDiRvlH6vpOscXPxrHKFoHh?=
 =?us-ascii?Q?biYeIkD/iwxxnyTdHF60uey9abGcy9QDX65Yg1il/VpTG/+IG/owrvw+XYbe?=
 =?us-ascii?Q?WOt6ZkfcAU4jUorAeZRn42Ucsre6al3nBdxktIB+56AKIlrG0GWt8am+RuX/?=
 =?us-ascii?Q?e6Lc3QGlvy+Ca+0vYWHN1qVJJxMeA30b6JYKbAfmePKkZzXzejw5LtiFqBBl?=
 =?us-ascii?Q?czcUka1Ga/PwKvPOTnpnnX2jve8nXyqA+Vvpr32Icj0OISolXiob/8FqlC1p?=
 =?us-ascii?Q?UYOkSKQ8CsJHZ2dxwoRPQxdPn58kHUBi7G3wUNBXw8AGl+XGGqvjp6QS/02M?=
 =?us-ascii?Q?JX1KpDzHb7RRKSZGQg7kDNA1NbeabZjc9kl79aJ4u9gd1Urh8KmxjdxV5MU5?=
 =?us-ascii?Q?M48LWmXE7qLJZAAIGEW0BnmVp5GVzxOTQYPI1/SfhrNoYXy+h6CIc3hpoN55?=
 =?us-ascii?Q?Hs2viBeFHvIQWjKySBYC9yyy4LBaOcHd1JogY6QCAE4yjDWR0CSN50IRgIbT?=
 =?us-ascii?Q?WDuAb5nkYkQhuHZhgrYqWG+dm8Qw0DtSrGGKRRkMqV8dsddSfMDd8tbLMu8Y?=
 =?us-ascii?Q?pfVWoG9qfiRMzf2hx9pptBBBMlBUOi2IC8EvpoSB0g9H231QwG93vuvIka2L?=
 =?us-ascii?Q?rlejEtaBfQlPZPCnAzawarr6whOlyO9Oe4Cc9SKTAk3rbPTyDOCe8rgbrWvA?=
 =?us-ascii?Q?INCt6TzcWz0vu6KqtfP36BJDdqN84hfmaC3fACeEFGkgy+kmdWNCg0Vmen9+?=
 =?us-ascii?Q?mgGGQwkz1cv/Lqw3go4UZNzH667gNGjjr3hrACjhMGple8bmVUJLnn8rMsp5?=
 =?us-ascii?Q?cETKei2s4YCkjzymqgOuGznBWeaxsZLhpa0K4Tp/9st/5EkNQ4TVo8te8hD2?=
 =?us-ascii?Q?qfSRdMKVmghGisI9eahEziBWQuc5/5wk1yhq3LrgadO/xsQwYowsi4CZmlDH?=
 =?us-ascii?Q?OAGCevQ/7ADOT2GJT7xwpqPSMbvJMrB0hevS6yPNRCaKtlGfX7KbF8Zzz7P4?=
 =?us-ascii?Q?tGdqsSVDlCUX8UuOtTGRv+gvY/YwLu/SXIMM195vWoaVFB9qlcHJhGFVy6wv?=
 =?us-ascii?Q?wj4F8qFcFTHcWiumjN+/o8IWktpS/AoCmjEhFyF+BXLdjOX8Hdy2sQdzcxHS?=
 =?us-ascii?Q?uk+yDCqbIJKyR7YyKBps48faCL7Ino1cndHk8rY6XJxMyGvMU3YO/TxD1xTe?=
 =?us-ascii?Q?6wVqRzPKHERxZe4hFrICM2zQaZpQE0xb2arFDM0H2hMR2nZX5anuZUMWYHq1?=
 =?us-ascii?Q?w3+WunD+Lj0yp8nmBQOOipnJ8ux6dlerHbNLwptppR2qVqVPtP9KaM0V1Lfr?=
 =?us-ascii?Q?qTgov+A6vLzpyvFR+WNI3jOSOaWp1z2MuKgrt2XKpoBTO1XcOjyv1k8SE4d4?=
 =?us-ascii?Q?+bvnY3xnaGJITcLStSg933QMNOREHRpG1HAZJnIlvvIH2g4VVQfgL7bgRj8c?=
 =?us-ascii?Q?HirDKUWIYTxa87UUx4Fu3+XVUiqAMgQ017VuhuAmRsg9AlrtmpPj4gI/i9qa?=
 =?us-ascii?Q?PcOzWN+8DRUrUOTiGuXIChgyXIw4QT+ykcQ9nHq1rFKVH2R+maLt7gR61bbe?=
 =?us-ascii?Q?5Mm2xQ=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 919974f7-6e2d-4b25-2856-08db56eac903
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 15:24:19.9610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4s8gHD452RgBtK+uG0h3ov0SgwzNTlv/Jl4HCdgaqHR2dUpxCbotG6cztrnHPFHyVF7vS12icMNnFGjvMTdCgAaR5AFgbN8NVT0vBBqSv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR13MB6406
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_082425_198331_7F260F77 
X-CRM114-Status: GOOD (  10.19  )
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

On Wed, May 17, 2023 at 05:18:24PM +0800, Deren Wu wrote:
> txs may be dropped if the frame is aggregated in AMSDU. When the problem
> shows up, some SKBs would be hold in driver to cause network stopped
> temporarily. Even if the problem can be recovered by txs timeout handling,
> mt7921 still need to disable txs in AMSDU to avoid this issue.
> 
> Cc: stable@vger.kernel.org
> Fixes: 163f4d22c118 ("mt76: mt7921: add MAC support")
> Reviewed-by: Shayne Chen <shayne.chen@mediatek.com>
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> ---
> v2: * update operation for booleans, not bitfields (suggested by Simon Horman)
>     * rectify fixes tag for downstream backport

Thanks, LGTM.

Reviewed-by: Simon Horman <simon.horman@corigine.com>

