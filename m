Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22329C7EE23
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 May 2023 14:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9PzCa1lY9nUR20Q3fDAZA1RsBEr5LdyYZXsjJQssc8=; b=0QkdEPk6l8uDFJZtJtdOFJVBmf
	aczvvYW07eVBTBCVBzEuoykwzv9QIRTfuEoalsUJah/u6sgZRrnhm40xf1jA4FVNBj2EbQhq/YLYA
	7+iwhvNydSOJbOAu9cighjFi+y8dyJtmVuZsOBsLsHb75wwA8CPdm+zai+Z0cJwgII7L85JQcLiS0
	zIxfFq1oAqgzSnSQiZm32RqDrzjsNBZHisGqtzdpwZYn22C/BfpEwIpa4nDMKQ7WUbDq5yet8N6Bk
	u3Yc5B6LOt+LWCnxaDKg3zNVuMcJ87T8vHaKy8tKya41YsL+Ih27Pim7ydJcIUOa++bx761vJhmwm
	pFSRdDiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptrO1-001s6F-10;
	Tue, 02 May 2023 14:53:49 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptrNv-001s4J-34;
	Tue, 02 May 2023 14:53:46 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 342ErN65031685;
	Tue, 2 May 2023 14:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=A9PzCa1lY9nUR20Q3fDAZA1RsBEr5LdyYZXsjJQssc8=;
 b=itWJdKMD0Vb1kIguS2uvvFOOLyK9gL3u+2PzJEPocTOIRjyJRVVEm0u5BgKPrNWHt78+
 9JZR5LqNUnWgKyagrJRVwRXl45H59PXlaUDtqaj2PFPMUZp3hMgAJvwvJTTuAsM4Gytp
 /bYtg7X+0tpvaSlRv4DO35XyuHtzCCy109LAtVqLIJkKtEuZTUSISou1oFEFbWv8V/ay
 Qiu1BETXlt//c8thokXeJy3C8PX+m/VFcDBVgQ7213tir+ncGT95DRwKuq7owvQ/K9oZ
 1M6av8FikOWDloi7BlO2KaLxC5a+yU6baB8o1Bh50Gzz33k+hXMOa6DZnkhGcKbDghgq sQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qb4h3rbve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 May 2023 14:53:25 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 342Egimo031178;
	Tue, 2 May 2023 14:52:56 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qb4h3rbpg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 May 2023 14:52:56 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 341LC9Fa005173;
	Tue, 2 May 2023 14:52:38 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3q8tv6snm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 May 2023 14:52:38 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 342EqZPw54460742
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 May 2023 14:52:35 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F3F742004E;
	Tue,  2 May 2023 14:52:34 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D981B2004D;
	Tue,  2 May 2023 14:52:32 +0000 (GMT)
Received: from [9.171.18.35] (unknown [9.171.18.35])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  2 May 2023 14:52:32 +0000 (GMT)
Message-ID: <b9b6a50724b4f1ac2b98e518a8b9a820a912850f.camel@linux.ibm.com>
Subject: Re: [PATCH 20/20] iommu: Convert remaining simple drivers to
 domain_alloc_paging()
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Andy Gross <agross@kernel.org>,
        Alim
 Akhtar <alim.akhtar@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Gerald Schaefer
 <gerald.schaefer@linux.ibm.com>,
        Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonathan
 Hunter <jonathanh@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>,
        Konrad
 Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matthew Rosato
 <mjrosato@linux.ibm.com>,
        Orson Zhai <orsonzhai@gmail.com>, Rob Clark
 <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Samuel Holland
 <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna
 Reddy <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
        Will Deacon
 <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang
 <zhang.lyra@gmail.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Steven Price <steven.price@arm.com>
Date: Tue, 02 May 2023 16:52:32 +0200
In-Reply-To: <20-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
References: <20-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: T6YFZPN53T-8NBr50MiQVf0_hbdxvlIx
X-Proofpoint-ORIG-GUID: edimN0IzfVknfN6LBbnWL53jz6o5saRq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_09,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305020124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_075343_998560_2E0DABA1 
X-CRM114-Status: GOOD (  30.26  )
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

On Mon, 2023-05-01 at 15:03 -0300, Jason Gunthorpe wrote:
> These drivers don't support IOMMU_DOMAIN_DMA, so this commit effectively
> allows them to support that mode.
>=20
> The prior work to require default_domains makes this safe because every
> one of these drivers is either compilation incompatible with dma-iommu.c,
> or already establishing a default_domain. In both cases alloc_domain()
> will never be called with IOMMU_DOMAIN_DMA for these drivers so it is saf=
e
> to drop the test.
>=20
> Removing these tests clarifies that the domain allocation path is only
> about the functionality of a paging domain and has nothing to do with
> policy of how the paging domain is used for UNMANAGED/DMA/DMA_FQ.
>=20
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/fsl_pamu_domain.c | 7 ++-----
>  drivers/iommu/msm_iommu.c       | 7 ++-----
>  drivers/iommu/mtk_iommu_v1.c    | 7 ++-----
>  drivers/iommu/omap-iommu.c      | 7 ++-----
>  drivers/iommu/s390-iommu.c      | 7 ++-----
>  drivers/iommu/tegra-gart.c      | 7 ++-----
>  6 files changed, 12 insertions(+), 30 deletions(-)
>=20
>=20
---8<---
> -static struct iommu_domain *s390_domain_alloc(unsigned domain_type)
> +static struct iommu_domain *s390_domain_alloc_paging(struct device *dev)
>  {
>  	struct s390_domain *s390_domain;
> =20
> -	if (domain_type !=3D IOMMU_DOMAIN_UNMANAGED)
> -		return NULL;
> -
>  	s390_domain =3D kzalloc(sizeof(*s390_domain), GFP_KERNEL);
>  	if (!s390_domain)
>  		return NULL;
> @@ -447,7 +444,7 @@ void zpci_destroy_iommu(struct zpci_dev *zdev)
>  static const struct iommu_ops s390_iommu_ops =3D {
>  	.default_domain =3D &s390_iommu_platform_domain,
>  	.capable =3D s390_iommu_capable,
> -	.domain_alloc =3D s390_domain_alloc,
> +	.domain_alloc_paging =3D s390_domain_alloc_paging,

Leaving .domain_alloc unset here leads to an OOPs with your GitHub
branch (iommu_mandatory_default) when I try to use vfio-pci for KVM
pass-through via the following call chain:

...
vfio_group_fops_unl_ioctl()
   vfio_group_ioctl_set_container()
      vfio_container_attach_group()
         iommu_group_claim_dma_owner()
            __iommu_take_dma_ownership()
               __iommu_group_alloc_blocking_domain()
               __iommu_domain_alloc(=E2=80=A6, IOMMU_DOMAIN_BLOCKED)

The problem is that in __iommu_domain_alloc() a call to bus->iommu_ops-
>domain_alloc() is attempted for IOMMU_DOMAIN_BLCOKED even if the
function pointer is unset.

So I tried with the obvious fix:

@@ -1947,7 +1948,7 @@ static struct iommu_domain *__iommu_domain_alloc(stru=
ct bus_type *bus,
        if ((type =3D=3D IOMMU_DOMAIN_UNMANAGED || type =3D=3D IOMMU_DOMAIN=
_DMA) &&
            bus->iommu_ops->domain_alloc_paging)
                domain =3D bus->iommu_ops->domain_alloc_paging(dev);
-       else
+       else if (bus->iommu_ops->domain_alloc)
                domain =3D bus->iommu_ops->domain_alloc(type);
        if (!domain)
                return NULL;

This then uses the fallback of an empty IOMMU_DOMAIN_UNMANAGED and I
get a working device in the guest. Also tried hot unplug where the
device is taken over by the host again. I think with my DMA API
conversion patches we can support blocking domains properly but for a
temporary solution the above may be acceptable.

>  	.probe_device =3D s390_iommu_probe_device,
>  	.release_device =3D s390_iommu_release_device,
>  	.device_group =3D generic_device_group,


