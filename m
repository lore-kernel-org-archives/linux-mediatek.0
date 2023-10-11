Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71608CDB470
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Oct 2023 17:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bM2ZtT57neAX/wQjDtY6kTjEfhq5pvyurdRnUuf/xJM=; b=T2pc181tVyvZpNgiTaqdcEAvw8
	M7jfQWztxI/J7mRtmEAxBPI2Ji4EE/EyEJyY19DSvPKpaFY3m+4UhAjxKPWvEe0nj6mb+O8OMv+Nc
	1dsjVYCMBDl48twQTS75LQ4m7SinRsSt/30A3Tvrs3/D0gbmQhJDzrQIG3Jqxh+W8r6QKGM1AmXWe
	DMXs5qemre/rXjuXPThHf9dMzo4lJ4qJ5m2q6Mq8n5FtsVwawBV37u0qmT9yJ3YyFJ10UlZddQaoH
	0v6fo0L+w/Sfo6Mo9iPqwRrEyiuDqewSrIE/bufY1jnUSAHrHNrvSha47myB8J7x5Yelz2aiEVQb+
	LqBshXFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqdKJ-00GNR5-12;
	Wed, 11 Oct 2023 17:48:55 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqdKF-00GNQF-2I
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Oct 2023 17:48:53 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6910ea9cddbso39856b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Oct 2023 10:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697046530; x=1697651330; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bM2ZtT57neAX/wQjDtY6kTjEfhq5pvyurdRnUuf/xJM=;
        b=tRrvECBQfNm9u3ExrwtBiPPnToJlEjzZVyzkjJ3ExDSAbsXqv14OQOWdYWDmvLkKYp
         frNcQqnGfGp6cnP8nVm0hP91uJBv0A5Sx6V6e3xpK4QlhF0NId5r7Tmuygh+7QjvRrjw
         KxbmJ/BOiLOn8fwDsJIkaohDvueDaS3EeEJ5IWfbGfyV0C7CIqU/pHkEyLmJle8msN6p
         gmwX4WjLrGE4a4c1UDDZNp4RnaN4jT7nnykcmWOc78I6klJ8LWT3aSr/HccZksM8OqHy
         5euYiqnh5TrqhXC2PuL0wUVyDRzLYxt5Z5AawUGVjb5bE4bgFfG0z7YJ5VI9nbO5oJwl
         kQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697046530; x=1697651330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bM2ZtT57neAX/wQjDtY6kTjEfhq5pvyurdRnUuf/xJM=;
        b=uhFVKTd++1tERe1j/R+bvB1DZLUNx0O1FCutquUSlKgBs21BMmqDET38s6lWNHoXsX
         en8CxHmBjXiGLl+UI1GxzLK2R0aDCL7NTt3YdWXtVFdnxKroP5eaF5AVMzHMKXAuIj3S
         Dxi1RlFLCkd5crqnTQsi+uF0HKZAxuUAQg8UmkMEC63ele7ZZdEF9VLrUWOUYOgKU0nk
         9Al9ZKczeYfMN0jK9frkq70xQa9NV4sc7DaAImABnungy+PhedR1rNt1CQV1Vtsrd4go
         0+vAE+ojb562uyzmGcAGyfsouUCjCDc7JrAlBdmKt57DJW+d+HlMe5JNSkEMN0/vtWPM
         WggQ==
X-Gm-Message-State: AOJu0YwNlqyaIqKfwMqPjUxJhw/hBmraZpX4nEF/7gYBYMaHDeF/MFB5
	qk3xzboHs3m7oJPSATjCfY4cvQ==
X-Google-Smtp-Source: AGHT+IF4MffnY6FNeJJc1juHDvYlAxYH24seuPoeHgjPkWoCKjPIY6tr0GTX+skm36H1sgCf0PrVBQ==
X-Received: by 2002:a05:6a00:1687:b0:68a:5395:7aa5 with SMTP id k7-20020a056a00168700b0068a53957aa5mr24585337pfc.17.1697046530225;
        Wed, 11 Oct 2023 10:48:50 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fbd6:ce83:3759:dbcc])
        by smtp.gmail.com with ESMTPSA id c4-20020a62e804000000b00690c9fda0fesm10327293pfi.169.2023.10.11.10.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 10:48:49 -0700 (PDT)
Date: Wed, 11 Oct 2023 11:48:45 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: corbet@lwn.net, agross@kernel.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
	catalin.marinas@arm.com, will@kernel.org, linus.walleij@linaro.org,
	andy.shevchenko@gmail.com, vigneshr@ti.com, nm@ti.com,
	matthias.bgg@gmail.com, kgene@kernel.org, alim.akhtar@samsung.com,
	bmasney@redhat.com, quic_tsoni@quicinc.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, kernel@quicinc.com
Subject: Re: [REBASE PATCH v5 04/17] remoteproc: qcom: Remove minidump
 related data from qcom_common.c
Message-ID: <ZSbf/VqpBIlhyUIG@p14s>
References: <1694429639-21484-1-git-send-email-quic_mojha@quicinc.com>
 <1694429639-21484-5-git-send-email-quic_mojha@quicinc.com>
 <bb29aba3-9378-6405-5f6d-a7d77e0374ad@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb29aba3-9378-6405-5f6d-a7d77e0374ad@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_104851_749974_D757FE3C 
X-CRM114-Status: GOOD (  31.24  )
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

On Fri, Oct 06, 2023 at 08:38:52PM +0530, Mukesh Ojha wrote:
> Hi Bjorn/Mathieu,
> 
> Patches from 2/17-4/17  is just a movement of functions to separate
> config/file.
> 
> Do you think, these can be picked independently from this series ?
> I can send them separately, if required.

Bjorn handles submissions for Qualcomm - I will defer to him.

> 
> @Bjorn: I have sent 13/17-15/17 separately [1] as it is needed
> by some folks and independent from this series.
> 
> [1]
> https://lore.kernel.org/all/1696440338-12561-1-git-send-email-quic_mojha@quicinc.com/
> 
> -Mukesh
> 
> On 9/11/2023 4:23 PM, Mukesh Ojha wrote:
> > As minidump specific data structure and functions move under
> > config QCOM_RPROC_MINIDUMP, so remove minidump specific data
> > from driver/remoteproc/qcom_common.c .
> > 
> > Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> > ---
> >   drivers/remoteproc/qcom_common.c | 160 ---------------------------------------
> >   1 file changed, 160 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> > index 03e5f5d533eb..085fd73fa23a 100644
> > --- a/drivers/remoteproc/qcom_common.c
> > +++ b/drivers/remoteproc/qcom_common.c
> > @@ -17,7 +17,6 @@
> >   #include <linux/rpmsg/qcom_smd.h>
> >   #include <linux/slab.h>
> >   #include <linux/soc/qcom/mdt_loader.h>
> > -#include <linux/soc/qcom/smem.h>
> >   #include "remoteproc_internal.h"
> >   #include "qcom_common.h"
> > @@ -26,61 +25,6 @@
> >   #define to_smd_subdev(d) container_of(d, struct qcom_rproc_subdev, subdev)
> >   #define to_ssr_subdev(d) container_of(d, struct qcom_rproc_ssr, subdev)
> > -#define MAX_NUM_OF_SS           10
> > -#define MAX_REGION_NAME_LENGTH  16
> > -#define SBL_MINIDUMP_SMEM_ID	602
> > -#define MINIDUMP_REGION_VALID		('V' << 24 | 'A' << 16 | 'L' << 8 | 'I' << 0)
> > -#define MINIDUMP_SS_ENCR_DONE		('D' << 24 | 'O' << 16 | 'N' << 8 | 'E' << 0)
> > -#define MINIDUMP_SS_ENABLED		('E' << 24 | 'N' << 16 | 'B' << 8 | 'L' << 0)
> > -
> > -/**
> > - * struct minidump_region - Minidump region
> > - * @name		: Name of the region to be dumped
> > - * @seq_num:		: Use to differentiate regions with same name.
> > - * @valid		: This entry to be dumped (if set to 1)
> > - * @address		: Physical address of region to be dumped
> > - * @size		: Size of the region
> > - */
> > -struct minidump_region {
> > -	char	name[MAX_REGION_NAME_LENGTH];
> > -	__le32	seq_num;
> > -	__le32	valid;
> > -	__le64	address;
> > -	__le64	size;
> > -};
> > -
> > -/**
> > - * struct minidump_subsystem - Subsystem's SMEM Table of content
> > - * @status : Subsystem toc init status
> > - * @enabled : if set to 1, this region would be copied during coredump
> > - * @encryption_status: Encryption status for this subsystem
> > - * @encryption_required : Decides to encrypt the subsystem regions or not
> > - * @region_count : Number of regions added in this subsystem toc
> > - * @regions_baseptr : regions base pointer of the subsystem
> > - */
> > -struct minidump_subsystem {
> > -	__le32	status;
> > -	__le32	enabled;
> > -	__le32	encryption_status;
> > -	__le32	encryption_required;
> > -	__le32	region_count;
> > -	__le64	regions_baseptr;
> > -};
> > -
> > -/**
> > - * struct minidump_global_toc - Global Table of Content
> > - * @status : Global Minidump init status
> > - * @md_revision : Minidump revision
> > - * @enabled : Minidump enable status
> > - * @subsystems : Array of subsystems toc
> > - */
> > -struct minidump_global_toc {
> > -	__le32				status;
> > -	__le32				md_revision;
> > -	__le32				enabled;
> > -	struct minidump_subsystem	subsystems[MAX_NUM_OF_SS];
> > -};
> > -
> >   struct qcom_ssr_subsystem {
> >   	const char *name;
> >   	struct srcu_notifier_head notifier_list;
> > @@ -90,110 +34,6 @@ struct qcom_ssr_subsystem {
> >   static LIST_HEAD(qcom_ssr_subsystem_list);
> >   static DEFINE_MUTEX(qcom_ssr_subsys_lock);
> > -static void qcom_minidump_cleanup(struct rproc *rproc)
> > -{
> > -	struct rproc_dump_segment *entry, *tmp;
> > -
> > -	list_for_each_entry_safe(entry, tmp, &rproc->dump_segments, node) {
> > -		list_del(&entry->node);
> > -		kfree(entry->priv);
> > -		kfree(entry);
> > -	}
> > -}
> > -
> > -static int qcom_add_minidump_segments(struct rproc *rproc, struct minidump_subsystem *subsystem,
> > -			void (*rproc_dumpfn_t)(struct rproc *rproc, struct rproc_dump_segment *segment,
> > -				void *dest, size_t offset, size_t size))
> > -{
> > -	struct minidump_region __iomem *ptr;
> > -	struct minidump_region region;
> > -	int seg_cnt, i;
> > -	dma_addr_t da;
> > -	size_t size;
> > -	char *name;
> > -
> > -	if (WARN_ON(!list_empty(&rproc->dump_segments))) {
> > -		dev_err(&rproc->dev, "dump segment list already populated\n");
> > -		return -EUCLEAN;
> > -	}
> > -
> > -	seg_cnt = le32_to_cpu(subsystem->region_count);
> > -	ptr = ioremap((unsigned long)le64_to_cpu(subsystem->regions_baseptr),
> > -		      seg_cnt * sizeof(struct minidump_region));
> > -	if (!ptr)
> > -		return -EFAULT;
> > -
> > -	for (i = 0; i < seg_cnt; i++) {
> > -		memcpy_fromio(&region, ptr + i, sizeof(region));
> > -		if (le32_to_cpu(region.valid) == MINIDUMP_REGION_VALID) {
> > -			name = kstrndup(region.name, MAX_REGION_NAME_LENGTH - 1, GFP_KERNEL);
> > -			if (!name) {
> > -				iounmap(ptr);
> > -				return -ENOMEM;
> > -			}
> > -			da = le64_to_cpu(region.address);
> > -			size = le64_to_cpu(region.size);
> > -			rproc_coredump_add_custom_segment(rproc, da, size, rproc_dumpfn_t, name);
> > -		}
> > -	}
> > -
> > -	iounmap(ptr);
> > -	return 0;
> > -}
> > -
> > -void qcom_minidump(struct rproc *rproc, unsigned int minidump_id,
> > -		void (*rproc_dumpfn_t)(struct rproc *rproc,
> > -		struct rproc_dump_segment *segment, void *dest, size_t offset,
> > -		size_t size))
> > -{
> > -	int ret;
> > -	struct minidump_subsystem *subsystem;
> > -	struct minidump_global_toc *toc;
> > -
> > -	/* Get Global minidump ToC*/
> > -	toc = qcom_smem_get(QCOM_SMEM_HOST_ANY, SBL_MINIDUMP_SMEM_ID, NULL);
> > -
> > -	/* check if global table pointer exists and init is set */
> > -	if (IS_ERR(toc) || !toc->status) {
> > -		dev_err(&rproc->dev, "Minidump TOC not found in SMEM\n");
> > -		return;
> > -	}
> > -
> > -	/* Get subsystem table of contents using the minidump id */
> > -	subsystem = &toc->subsystems[minidump_id];
> > -
> > -	/**
> > -	 * Collect minidump if SS ToC is valid and segment table
> > -	 * is initialized in memory and encryption status is set.
> > -	 */
> > -	if (subsystem->regions_baseptr == 0 ||
> > -	    le32_to_cpu(subsystem->status) != 1 ||
> > -	    le32_to_cpu(subsystem->enabled) != MINIDUMP_SS_ENABLED) {
> > -		return rproc_coredump(rproc);
> > -	}
> > -
> > -	if (le32_to_cpu(subsystem->encryption_status) != MINIDUMP_SS_ENCR_DONE) {
> > -		dev_err(&rproc->dev, "Minidump not ready, skipping\n");
> > -		return;
> > -	}
> > -
> > -	/**
> > -	 * Clear out the dump segments populated by parse_fw before
> > -	 * re-populating them with minidump segments.
> > -	 */
> > -	rproc_coredump_cleanup(rproc);
> > -
> > -	ret = qcom_add_minidump_segments(rproc, subsystem, rproc_dumpfn_t);
> > -	if (ret) {
> > -		dev_err(&rproc->dev, "Failed with error: %d while adding minidump entries\n", ret);
> > -		goto clean_minidump;
> > -	}
> > -	rproc_coredump_using_sections(rproc);
> > -clean_minidump:
> > -	qcom_minidump_cleanup(rproc);
> > -}
> > -EXPORT_SYMBOL_GPL(qcom_minidump);
> > -
> >   static int glink_subdev_start(struct rproc_subdev *subdev)
> >   {
> >   	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);

