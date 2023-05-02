Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE3BC77B73
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 May 2023 15:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KDBbbX3BI8ybwiWEwQ772cU55r9WiK2OVUn/WgHlJNo=; b=yEUBqEJknqj+6WriMonauGwuj6
	T45goap403L//JANZUYZm9oxri+ktbflX7ruQslr8wlf4TWRUuba0hKpRDG+vuqZ9vA52ROw+Wh3W
	5jfzHAddxYLc1Fydt+UpbjSpdGQ0P8XYuh0yceGOeB+Uhx80vW08SdVuNZYkaV31Yf1XQNYF6O/nO
	gB5jbINmAntiIdWabs4GiKsnD3NHjbEueBVab0Sylc85O3mxRWds4FYdqtexbUHfwLe5gQPmOsVsW
	s6jpazY8D0cTiit1Jqe0J88StYGTkqnDZiu/ltqrkHS2GW2BZ7KTo6Wm8QrI4YkclmYYiJH0mM85E
	oeH9Fbdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptrsV-001wRi-0P;
	Tue, 02 May 2023 15:25:19 +0000
Received: from mail-bn8nam11on20601.outbound.protection.outlook.com ([2a01:111:f400:7eae::601] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptrsQ-001wPc-35;
	Tue, 02 May 2023 15:25:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tcyb/Q+FWAAsQB6Lo2Q30cu8Ny8f77VFbKheKSZbvOOVCbCk7wWHD4gzkuc7xw6qCym3IAs7l9gFe1R8wYaTt6Mga7EBM1MsN9KxZB47DwnFERckmnLFQZ4hspXLdvORKNJ7s/Cvml6W2FChxL4+z6DQVOLDEmNQ29yXQc6/X2jCZS4OLDSMTT5dpLjha3sTOK0vojcPoYmkc6JPwCGUx28WmRsDFnYq9v5qigbpWv8RB5hzqvglLF18G3eBtTc+oaE7gnwYlw/XBLxZrIQd3E5/hJnIFkh7uxaOW9RWuXNHUTgw7vFZEax4Mar3k9eud2K7/Gw/nbuPcop+9zSccA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDBbbX3BI8ybwiWEwQ772cU55r9WiK2OVUn/WgHlJNo=;
 b=SKuNXQMX53cn6jr+kNlquWfAkFxtNTQwyR3cIlGzpw0DHP//16ecBicoTUPCJs5gB9hQfE5QJ0dpfTktizDYQL/HiWKE3xlANWYkgAWF5bg6Jy/OzUYfVgv+bUfwrzJWZ5jCDurQLBB0Uimx2bY7mjZ4dm5dRcx2wLBFFlEcYJEK0TcYyEAtq08CatH+SCtFVxgHH+I2v+xPXmOl4FIxB5BZecMWIC1HQremKtMHjXFOKfhLumo3XS0RZdeOZolXQCj9u6ZLuJFlPYaxzS+EHzwbErDrFeiqH0t+XA5ikaB/qPWamTDD//anDPuivlSGwt4VhCEk7DGnznKXtUyW7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDBbbX3BI8ybwiWEwQ772cU55r9WiK2OVUn/WgHlJNo=;
 b=C8zrQrUR/odibz6N9Lh31brF1x/EJWeLaGv80ILIzR1bXLGTeVzS3zoYaxGTQh7qFgHZamyCBmMvZNW/pP4NgwH1x9y9r03WsT76Z65tOwwiOYhQ5zBwH8sc92CXjMX/cIhuVWHShyrpnrp6JDH1D9s7GSqCZHW/X8bpEW4RZJpDlCw3F+oc+SZMXYRzZOIPbfylOeW3DnZz+pKvMNa8Pt1f8XQY/uk2m9MLk4WgUhZ3pIMYTWGxYB/Uo7JczXoxS7puxy59dURrjJAYx8b+JlL1P7KDxn0ju3Wqr/Ihl+3QVoU9C9JCeAyl8rZnd/hcUvpIfGIzMbLvXMEMrpxoLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB8426.namprd12.prod.outlook.com (2603:10b6:510:241::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.20; Tue, 2 May
 2023 15:25:09 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 15:25:09 +0000
Date: Tue, 2 May 2023 12:25:08 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Andy Gross <agross@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Orson Zhai <orsonzhai@gmail.com>, Rob Clark <robdclark@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 20/20] iommu: Convert remaining simple drivers to
 domain_alloc_paging()
Message-ID: <ZFErVOr8RDoeZ2tq@nvidia.com>
References: <20-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
 <b9b6a50724b4f1ac2b98e518a8b9a820a912850f.camel@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9b6a50724b4f1ac2b98e518a8b9a820a912850f.camel@linux.ibm.com>
X-ClientProxiedBy: BL6PEPF00013E0B.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:10) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB8426:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e2d5a08-163f-46b2-06ea-08db4b216a78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	XMCJHI/QGKOYNL/H8/aY4TUIqL2UI52cWv7h7S4/xkTX5NEmXoSmmNAMq4niAooQfEnchjUWHo1us6dnSBh3KeV23CSRt3+wi76NMhfaPX8bJZNoRPf+tq+JDaCQw/YfMWZermN08H59hAGkU00ZIxlKGt+h6UBB4k9sS1p5ZdlNstedpoAa2rLt9UQ2AifIn1QmJfGA/RFR+lLzsZ/DW7IjEh+AGk/b0oOJa/D5ZCs6TiaPpWhlXArCeNQMhrSikQ4xwHBhVICybYdBCEYf0TK0GxsGQzspX35Mb8l8NfsbIocF2icvlnZzHn6UXJ5uFK43Ozx80sI+acjswykqz2vahcv60TlYC/z5wMA1+0Q/8HGCOl4xMUzBb0L4qdUBLBPLS0BMoV28BCzkXUUvm8I1qe39+61bEfCnvPsR5UEVG8WF+jf+ESd73N3o5KRy8QTe1bLZq5I8O16vd91H/LIROcJFkVkt3tuTQmQNC/HMNf8Z9b3P/ROk7qh9XaEhX41TpOqqVKMg99j3ARNv/D0GiuNyTrQMgUHe+HGSSthIr9h1eaPDT4jtB2Qz9yUK
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199021)(7416002)(7406005)(5660300002)(6916009)(86362001)(2616005)(83380400001)(186003)(26005)(6512007)(6506007)(38100700002)(8676002)(8936002)(478600001)(54906003)(6486002)(316002)(36756003)(41300700001)(4326008)(66476007)(66556008)(66946007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?7GT5/Aq4qmHLdHjns4lu5JRl2LSxJnFl5+5ChBONMPpRrOeIWrDZ7XPIO0Wz?=
 =?us-ascii?Q?P8+1PicryyyrkneuO9fSK9SaReBJxAtDYNCaonoM2X8PwKMjFAzzK6oEiqd7?=
 =?us-ascii?Q?zRGS6gwNLQ96D8B3ydW1/IxO2s/oh6KfIZpyXFOFk+c+ui02xs3fOQrsOyPD?=
 =?us-ascii?Q?+TP/SKRk2TraIYvwcJgSiIZ54ZnhbyZuQPsQxpmP07VmrNpxQuwXD+qzr5kN?=
 =?us-ascii?Q?ORPqVBr1wgCokNQ/5+ob1zhLtUJp/vm/o65Qa8uB5iz7F8t27fcVz/O9TL+a?=
 =?us-ascii?Q?yEE6FkSalDs/QTUPjwkoknz7g1Zcf5wk6EMo33+cJSDiirSwL04zTYW+mlpv?=
 =?us-ascii?Q?kh0P/nz5gD8mXO278tw+o4IzhXWyLVnkd8qtlHYZ7+hW/nUMzJp15RNo9nWy?=
 =?us-ascii?Q?JFLL2Uw0Ce40SG3tGf1mhz4raFjr2WXl474N3U4k3r2emwAiGeM/QiUreGh1?=
 =?us-ascii?Q?v7mv1Xb58dLK3mP17WptVu5O3Ic28jv5PbtxoCB1BvJjWrnTUXUR3eAfpm58?=
 =?us-ascii?Q?LkeXNX3wxsWClJfjS7Qjy1dWkagrE+JWbNBQEbRy7vYftnXp4yXY/6jh0ju5?=
 =?us-ascii?Q?8P1GkzpndUgL99hGH45socxJQpQ/vzlXL0MOpghNSwuj3uX0aQB1gCq//e2U?=
 =?us-ascii?Q?/SzXbZJffrd/OfZTpWZ5DLSIX069gdMIDM9G0rN68/ARMdkjcp1o16BmXsNJ?=
 =?us-ascii?Q?ywzVOxIHqAezsEAT+vkE3U/Y2V8DI0QmDvZ3AMy7p2MD5R8Q6eC06smW3rhr?=
 =?us-ascii?Q?3i7PzyWUTSXmdrdqN9ml4daiAgsl/9A4tWSavKLthvPOeb/w1cI488aSSSSq?=
 =?us-ascii?Q?O3aRwdAv9fJaF24sJ4OFYaVx6z1LJAcvdrn65COuofP8oloRO02wpmWWR27y?=
 =?us-ascii?Q?/+jmbzPOZFNHy6H7oGfdqfMc5N+BSb/WgGg4BKvKtN9ZwaMMjEtyYpZUKBy/?=
 =?us-ascii?Q?qcgXPeY72XwNdwKxHnSzDBPGJuRt8vDwD0FQj9Rb5C/tVYYD0b9r55gYw9Nn?=
 =?us-ascii?Q?D59wjAPIhFqlnDVdT7KAlPTShEU9lVNAZBDdRpZCEZQusT8DQ5KvvxgqmSqT?=
 =?us-ascii?Q?Gi166sZup9CKapH0Qh2eK9RETdqTzEA81IZg73lF6hRcEt437WKBMzgq4/iR?=
 =?us-ascii?Q?w5znMSxZjaeN71mRJJIeRQRe2CFDjKLrJRGUpZzTpFZyAmzDCV2D2khXcKQ5?=
 =?us-ascii?Q?bIq+CxvA51UhOosAMJh9emOxRZU5At7QzXnlItdKc7YhGYZZVw+3m58XmdCR?=
 =?us-ascii?Q?Tez2TsnDszMPAFMkjl3bHpLPPu73MRKqaiMXuj2XbQXzcI59Sg4cfC37vjBO?=
 =?us-ascii?Q?X6yqlS7JP27VED1y2ch/3vc2CgDF0tk2Uw1qHCbqEu2/bnrTd8aiEP0PJhK2?=
 =?us-ascii?Q?9GE7O6p84nuVA2yeCMhkQ6Jn2/NtmYDwa9EqXQBoAIq/f1rPtYUQmzYqPT+8?=
 =?us-ascii?Q?q+WbltEEdzB/oii6RnEzqn8hP0LHm3tfH63TJJil0xOhVpAfU6GvXUxWgAZv?=
 =?us-ascii?Q?K2Kqm9ak+RSOSaVjH9fHEPZtJZKh2xWl7KIYmH0BmzgrbxiZY+1a2jbXlgvy?=
 =?us-ascii?Q?hsAucatvftFJW5g39+awGgOfnotynDoTvfniWLVh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2d5a08-163f-46b2-06ea-08db4b216a78
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 15:25:09.7554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DvRnqMM2z5zxO/SiGUto0UfDBO2kiKcTjT63DbjIJYAXo2EHHT1zzSMCsvHJiAPF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8426
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_082515_000428_D051BADB 
X-CRM114-Status: GOOD (  13.52  )
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

On Tue, May 02, 2023 at 04:52:32PM +0200, Niklas Schnelle wrote:
> @@ -1947,7 +1948,7 @@ static struct iommu_domain *__iommu_domain_alloc(struct bus_type *bus,
>         if ((type == IOMMU_DOMAIN_UNMANAGED || type == IOMMU_DOMAIN_DMA) &&
>             bus->iommu_ops->domain_alloc_paging)
>                 domain = bus->iommu_ops->domain_alloc_paging(dev);
> -       else
> +       else if (bus->iommu_ops->domain_alloc)
>                 domain = bus->iommu_ops->domain_alloc(type);
>         if (!domain)
>                 return NULL;

Agh, yes, it should fail, this is right, I'll fold it in, thanks

> This then uses the fallback of an empty IOMMU_DOMAIN_UNMANAGED and I
> get a working device in the guest. Also tried hot unplug where the
> device is taken over by the host again.

Great, thanks, I'll add your tested-by for the s390 drivers.

> I think with my DMA API
> conversion patches we can support blocking domains properly but for a
> temporary solution the above may be acceptable.

Yes, this is a good idea, I encourage all drivers to implement at
least one of BLOCKING or IDENTITY as global static singletons that
can't fail - this will allow us to have cleaner error recovery flows.

Jason

