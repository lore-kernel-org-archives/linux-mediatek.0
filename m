Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD84C001DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 14:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aiek+NzBWHSAmNawhBA4EfFDicpqdIZWtcoJ1zynDtI=; b=LiBjLeXjSvdGVdzrCAG5jN0XXI
	st4zDTvmD7FGmwYV4FbCUxXsFnoAQjMIShiz8Y3BPxmUYlru5Q/l3C1KitUxX6L4MhHstCMzgMQ/c
	jDQiYCaorSYmRvpFtV1bmS8isSCPAxF2qOfTFylW86Q/HPQemwwyHglkH8PTf71VdZph3ay60AW8R
	z7tlJ2/MpOR5N0epQkZWTQC58T3TQdMGvJBpFeNUZngaPzdj2WsAc8ZmSgRMk5mzQsI+R/tJbC/da
	2kOyud9mEpTW4uKut5kGGX+PVsEtikIDV5DZ4hFBFnyoRjzcb4vCQ5H/m7PqvEsnesA+Pj62wCKsR
	4uROfsog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVYeg-00HMAm-31;
	Mon, 14 Aug 2023 14:34:50 +0000
Received: from mail-sn1nam02on2060c.outbound.protection.outlook.com ([2a01:111:f400:7ea9::60c] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVYec-00HMA4-0c;
	Mon, 14 Aug 2023 14:34:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDv6ZRg85zgz+YoFEFF8nQp7+Je5pqIMp3gHY+4VlhP2nETQPhpgmSlvXvaPGVYler1EsDJpl/6B/kNAdnmlKpwrAKhyGsbZR7Cdtm3+ssdoStoMUqB8JHdxBt6L1K9H+sqGIrakjk8BFk7q4akW8rYnOwcbDGdrqIAKtEBu1xrkkETvdKsgwfDUW1Z1L5r+ZCMpXPBstW7+fteRXGo5uxFU3NRSgsQY/xt1apzriou+dsQ8SRmjq7QkbdMAJTnBOaUM2U5Klah+4AVpOGJjzUpqWqFdTCBF7/OvMjhE3334cO8GsEvShba41Si1HK4VJNpwDZ8iquL3iB0Wbs4WMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aiek+NzBWHSAmNawhBA4EfFDicpqdIZWtcoJ1zynDtI=;
 b=nDYcBLSWw/l/+e7PZ6034Z6qx4VP01+NPz1ZKILYxXj7UID/kcSvNy080wvfMEiv2OQmBJ0MqGGy/FJ+4N52lWZp7l5McOpxbfuQkLLa5VtxtCWfP/hkM+rcGZFxBNFFlB74RxAMd5dzjIZJUahTVjdSN9Xh6mkNVHV/56g4T56SpOPf+it8CPDwpBVfKKwXq5IFnGCuIonPh0K1x56nKGwfDigvbXG24R9fs2joE4BLhdSb0W4px2Z2wa/7+6Eoh3XC90zlknjUm2hosECtiyQOCoNOxUqeB6pXNJDpfdfg+vFxmxcJUkExDevBFPLJASUeu8IgjjiS02dEnT2Hpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aiek+NzBWHSAmNawhBA4EfFDicpqdIZWtcoJ1zynDtI=;
 b=Bq/hltAM8HmOT6sdaJ4fkEUIgi5oyoObkLS65jm/GK4qw24DFF7/DI+jTANLufP0XTN2wfrrF9+ksjYh/Y8iQJuKB6D2/HWffekaZQqLKv2io5t5+IQNsq7YEh8/2M0ogHqSs6tuG72+eqaq8c39yier9b8yomevjhEK560CjlRFg8FX+IJ60epuec81ztTMs39kE2zcZF2iXMvHxG8c5OclhkRrSQnY8NTppMRiwJeId6hjipCiRTe5yHyE2aHGkWYNQClNKOty60f+H+a0g61iJButbwbjjG0NCfXeZ/x+tOWP4JEA0A7EG9B8ywOh34Ub34+O5kqKxNhPmItZ2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by LV2PR12MB5752.namprd12.prod.outlook.com (2603:10b6:408:14d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 14:34:37 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 14:34:36 +0000
Date: Mon, 14 Aug 2023 11:34:34 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: Andy Gross <agross@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	linuxppc-dev@lists.ozlabs.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Orson Zhai <orsonzhai@gmail.com>, Rob Clark <robdclark@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Steven Price <steven.price@arm.com>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v6 07/25] iommu/mtk_iommu_v1: Implement an IDENTITY domain
Message-ID: <ZNo7eqMZEDBf7VKn@nvidia.com>
References: <7-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
 <7b6b8118-813a-f4cd-1067-d209d2b40025@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b6b8118-813a-f4cd-1067-d209d2b40025@linux.intel.com>
X-ClientProxiedBy: CH2PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:610:38::33) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|LV2PR12MB5752:EE_
X-MS-Office365-Filtering-Correlation-Id: 15e85150-5e25-427d-72d4-08db9cd3953c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iBPTzvaJuyEAUVZ31eH/ZC+paNxEqgVCIkvsfBDkKKlUA90wQCd9tx3Ned32XWdKCg4KCZQ/iF6NdQ2JnA/u06tPVOJ5z9iWprUyqBmdi7/j88XZSXTxghGgPY2GfrML+yX24PRopKzuE5AR+ycY/Xkvee0CRTqVUc62OMQ8Yw9B7/gJ6gRhYWUtl5GPT2+SiKUrq4c3cCVzft9nsi94FhsmhZNlkQReicWiaoyIIZ0yMBJrer8esiiJ8x1Jvci/1+12c9UWSq/Haz+GB9RNsh7wvVlal67kidDGwDtJmhPcwVSJxuxXuCuIPidu3nz35mazJGpLx4K70VC9VwCe3yzoJ9CgJkQXrem3ElEsdG4sqfqyRDwmAuMA7nFcuo6eruTHYpYmlzAOymggn9HOivLhexnBwlGs3rgLOuaBmWC+eYw0EuQoFB64/Uw8z50Wd+PEajwtCzuMhMF0sR86XHXljbRdqObc0rBVg48B8X7WbzspFKlDDIhwVDchSgT+QjwUFQFN45uvK9xCidyqKPFS1XMhjiyrwO4ZFR6McWFwQh2zWpwTL7xd2mR7ZzZq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(39860400002)(376002)(366004)(136003)(451199021)(186006)(1800799006)(6486002)(6506007)(478600001)(36756003)(86362001)(2906002)(7406005)(7416002)(6512007)(107886003)(26005)(66946007)(53546011)(2616005)(38100700002)(316002)(4326008)(8676002)(66476007)(6916009)(54906003)(66556008)(5660300002)(8936002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6rAA1GUNNiKqg0WadYQaQqeCIzzxFcdLDHEZ98Rw0RQ665ewM04hopFXL1la?=
 =?us-ascii?Q?BwYgmzr/oU6IJp8hZsbqGAk4yFjw704/awFPMNIwAXISL33FOqr1l06wqjpu?=
 =?us-ascii?Q?NtBNyxQopmLmhPCvIKj9ZRq1Tp4B0e+SxRvGu/aZKnPRPlnUyaMGCnnfNc41?=
 =?us-ascii?Q?CkTDJorhpEyCLrlk3IQwTPBSuy1N4bC0RbhNhkHb6cb8soop2UMqaNonfBph?=
 =?us-ascii?Q?AYcTXcNqj11DMhzlp9g8C/vHvg5TNtxy9FCgUqrqdLHQiZUQXej8P+DYWXlb?=
 =?us-ascii?Q?Jow6Y4AqEipbTNXeezkHVHpzm+EPhcOYg/nqQV6GCHL8Vu2TGgENR2CoOzN3?=
 =?us-ascii?Q?5aKtUSTYYhCh9ZEXk/hwaH6esHiDk6qMTWNR0dn+KTtW9qZUoGsgPZMjexb4?=
 =?us-ascii?Q?Uk5e86Bi3SAq8HxxstQtb/wAaeZqZtarNb8i7/qx0Y5Qpq4wIYs7EsZwzwnl?=
 =?us-ascii?Q?SZsQR9Izce72jRoN+sR4Wph4Nop69mdd7q3RPtgwolodKaiNV5WA7ECA6055?=
 =?us-ascii?Q?9f9LU6RCwP9M2ukv8x6gMlc30e3Ce0ePaUBj0VjDHHIdTfBG7ZLFMNi1kkoH?=
 =?us-ascii?Q?qNpHvQPjm9TmVDbIZNTphEuLimtRYPqwf3lp1pkFZfweZNtdZ9gllJxA7+O5?=
 =?us-ascii?Q?O5ClyOBfnQQlRTWFBpno8JTl+517rgzsRn/3DQxTFbKOGnAWWUE0/b8v+nR1?=
 =?us-ascii?Q?EMkIk5Djv28xtU/ynOAAbezvdd0sh8UmVlLW3f3MuhN3fhNkZqAqevoaFKCQ?=
 =?us-ascii?Q?k5l9DuPrHsGP4XyspFL5ZdUEZQ56e0w+9QZZ5+qAonhzLqGs2ZuT876yW+7p?=
 =?us-ascii?Q?XiWzuHnf0ahtI69baowjJiJ9NYHJDzYIxG/cgw9AOXwROx9Uy8gmzjXnTesX?=
 =?us-ascii?Q?JP9Sc6lLl9rIDOdhA52Dogi/Jr0Dl3qHXSRioK3bsnNNSlCC3rSCKbUDmLlA?=
 =?us-ascii?Q?SUNUglUjPpzTbFE7idYOEMe4cRap/Ktr77pvV3Kp4Wh2eFa1wcb+W0Xxc6i+?=
 =?us-ascii?Q?Rd85vOGpJnVA4+4sAqEdT6dVcNblb3zA4LWMc1wyFca02SWO3IPHnSczv3S3?=
 =?us-ascii?Q?n9KShLJJNwElroSK1wLqVS8fEEj9BxvjbZpGguOn6qZN515NKwRzW0RNLzZD?=
 =?us-ascii?Q?9j2Gg+XYWvj4R5LD/TEQDFSsteWvUr/+8tjJuU7EtRRz9wZCgcDlA0djgx0G?=
 =?us-ascii?Q?coLF0qekdMdsUzm54QqKH5ugntKiQV7faH01IzmyJUENN+16SqVDjZ2xWiZa?=
 =?us-ascii?Q?+YrJ+gdHrzJhRdt3IvbtxHECftvVzvdwLlOfuVT63VwIJbuGGeopDgMNYPz4?=
 =?us-ascii?Q?bm3OZsFkP+kigsZaWqklmzAkI29gdRCLa3dvtJGF5gljFczlPGZST5NxFse3?=
 =?us-ascii?Q?4leM2rAJCZZKuBTVLZS0Mryq+A3DyAhCXUsGw06jGzMkg2CYi/pIMDAmBnEO?=
 =?us-ascii?Q?BLOXeCl+I4k4eTMcGVD344oteOJP7JbBxNwC1UdmqqO8J1ulZXqI2KhEq9i2?=
 =?us-ascii?Q?hP1cwV+zmUBFcuVEfWqeerEQdOZuODbWOv/N6v8wacVG1W1FnvLEkZlHMp5K?=
 =?us-ascii?Q?a/klxlsxoV5x2DomJplr1LymVICiqth4ko5ZcLfp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e85150-5e25-427d-72d4-08db9cd3953c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 14:34:36.7141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7i4fqKEzylOWuapdzmD6Tn4a3KdGOtHkRm4fHV90mMJWM2pBWYQneha50kob3IPu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5752
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_073446_234886_7D260F73 
X-CRM114-Status: GOOD (  29.53  )
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

On Mon, Aug 14, 2023 at 11:06:12AM +0800, Baolu Lu wrote:
> On 2023/8/3 8:07, Jason Gunthorpe wrote:
> > What mtk does during mtk_iommu_v1_set_platform_dma() is actually putting
> > the iommu into identity mode. Make this available as a proper IDENTITY
> > domain.
> > 
> > The mtk_iommu_v1_def_domain_type() from
> > commit 8bbe13f52cb7 ("iommu/mediatek-v1: Add def_domain_type") explains
> > this was needed to allow probe_finalize() to be called, but now the
> > IDENTITY domain will do the same job so change the returned
> > def_domain_type.
> > 
> > mkt_v1 is the only driver that returns IOMMU_DOMAIN_UNMANAGED from
> > def_domain_type().  This allows the next patch to enforce an IDENTITY
> > domain policy for this driver.
> 
> This code seems to be not working properly.
> 
>  * @def_domain_type: device default domain type, return value:
>  *              - IOMMU_DOMAIN_IDENTITY: must use an identity domain
>  *              - IOMMU_DOMAIN_DMA: must use a dma domain
>  *              - 0: use the default setting
> 
> The core code is not ready to accept any other return value.

Right, it is not following the spec. The design does do what it is
supposed to though..

> > diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
> > index 8a0a5e5d049f4a..cc3e7d53d33ad9 100644
> > --- a/drivers/iommu/mtk_iommu_v1.c
> > +++ b/drivers/iommu/mtk_iommu_v1.c
> > @@ -319,11 +319,27 @@ static int mtk_iommu_v1_attach_device(struct iommu_domain *domain, struct device
> >   	return 0;
> >   }
> > -static void mtk_iommu_v1_set_platform_dma(struct device *dev)
> > +static int mtk_iommu_v1_identity_attach(struct iommu_domain *identity_domain,
> > +					struct device *dev)
> >   {
> >   	struct mtk_iommu_v1_data *data = dev_iommu_priv_get(dev);
> >   	mtk_iommu_v1_config(data, dev, false);
> > +	return 0;
> > +}
> > +
> > +static struct iommu_domain_ops mtk_iommu_v1_identity_ops = {
> > +	.attach_dev = mtk_iommu_v1_identity_attach,
> > +};
> > +
> > +static struct iommu_domain mtk_iommu_v1_identity_domain = {
> > +	.type = IOMMU_DOMAIN_IDENTITY,
> > +	.ops = &mtk_iommu_v1_identity_ops,
> > +};
> > +
> > +static void mtk_iommu_v1_set_platform_dma(struct device *dev)
> > +{
> > +	mtk_iommu_v1_identity_attach(&mtk_iommu_v1_identity_domain, dev);
> 
> This callback seems to be a dead code now.

Not yet in the series, it is still used. All this patch does is
introduce the identity domain.

> > @@ -443,7 +459,7 @@ static int mtk_iommu_v1_create_mapping(struct device *dev, struct of_phandle_arg
> >   static int mtk_iommu_v1_def_domain_type(struct device *dev)
> >   {
> > -	return IOMMU_DOMAIN_UNMANAGED;
> > +	return IOMMU_DOMAIN_IDENTITY;
> 
> def_domain_type can't be used for this purpose. But this seems to be a
> temporary code, as it will be removed in patch 09/25.

It looked OK when I checked it, mkt_v1 is really confusing what it
tries to do, but it should call probe_finalize and basically do the
same hacky thing as what UNMANAGED was trying to accomplish.

Did you see something else?

Jason

