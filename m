Return-Path: <SRS0=Qq0i=7Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A59C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2020 17:06:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC2ED20738
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2020 17:06:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hRLnw3z3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC2ED20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7eyaKLPLCm7dUzAg4y0J7SEj7b9o3LGQmh3EqnVyjqQ=; b=hRLnw3z3scOb89
	RpecFz0FZZQerbKs8AE01hmpqSz6I6w3MnFWL7XTpk0ZOzY/Gyx8rjUMYEcCRfkSvJOnQiy0g7K17
	GjNAoU64VDiwoiE3lhQEw/7SKlXw95fOHo8PS1o6KbE7ahqtswKZCwFWx1wlk6Iv1OrBG3kZYPWoR
	j2DdbzvblbG1QNTUfEqRyxMH4YDoIPFUH/dSF5bvxGAxCTHWbRO1DvUJiiy1RW9RZEKuCzBGGrd7t
	bf3Y5RqWSgmNcAo4tVczSH0Npg32FpfH7nQAnnmUoRGoCm4xI9MWQ9la7DNx+JkfHdpt6DzAx4/xY
	vtXrQSYvRJg1yLTLgh7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgWqm-0006v1-Eu; Wed, 03 Jun 2020 17:06:48 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgWqc-0006k6-2o; Wed, 03 Jun 2020 17:06:41 +0000
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 053H5cOs013441; Wed, 3 Jun 2020 13:06:34 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31dr8hybfb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jun 2020 13:06:34 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 053H61kr019644;
 Wed, 3 Jun 2020 13:06:34 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31dr8hybej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jun 2020 13:06:33 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 053H1HIo026166;
 Wed, 3 Jun 2020 17:06:31 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 31bf483e2w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jun 2020 17:06:31 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 053H6SvZ852442
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Jun 2020 17:06:29 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E31EDA4057;
 Wed,  3 Jun 2020 17:06:28 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4197BA404D;
 Wed,  3 Jun 2020 17:06:27 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.63.43])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed,  3 Jun 2020 17:06:27 +0000 (GMT)
Date: Wed, 3 Jun 2020 20:06:24 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH] mm/memblock: export max_pfn for kernel modules
Message-ID: <20200603170624.GA202648@linux.ibm.com>
References: <20200603161132.2441-1-miles.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200603161132.2441-1-miles.chen@mediatek.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-03_13:2020-06-02,
 2020-06-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=1
 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006030133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_100638_178796_5EFAB83C 
X-CRM114-Status: GOOD (  17.50  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jun 04, 2020 at 12:11:32AM +0800, Miles Chen wrote:
> max_pfn is uesd to get the highest pfn in the system. Drivers like
> drivers/iommu/mtk_iommu.c checks max_pfn to see if it should enable
> its "4GB mode".
> 
> This patch exports the max_pfn symbol, so we can build the driver as
> a kernel module.

You can use totalram_pages(), like e.g.
drivers/media/platform/mtk-vpu/mtk_vpu.c:

$ git grep -np totalram_pages drivers/media/
drivers/media/platform/mtk-vpu/mtk_vpu.c=779=static int mtk_vpu_probe(struct platform_device *pdev)
drivers/media/platform/mtk-vpu/mtk_vpu.c:861:   vpu->enable_4GB = !!(totalram_pages() > (SZ_2G >> PAGE_SHIFT));


> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> ---
>  mm/memblock.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/mm/memblock.c b/mm/memblock.c
> index c79ba6f9920c..3b2b21ecebb6 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -99,6 +99,7 @@ EXPORT_SYMBOL(contig_page_data);
>  unsigned long max_low_pfn;
>  unsigned long min_low_pfn;
>  unsigned long max_pfn;
> +EXPORT_SYMBOL(max_pfn);
>  unsigned long long max_possible_pfn;
>  
>  static struct memblock_region memblock_memory_init_regions[INIT_MEMBLOCK_REGIONS] __initdata_memblock;
> -- 
> 2.18.0

-- 
Sincerely yours,
Mike.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
