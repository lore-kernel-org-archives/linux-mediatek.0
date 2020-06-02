Return-Path: <SRS0=f9HX=7P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427F7C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jun 2020 21:17:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F2BE206C3
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jun 2020 21:17:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D8O8zRul";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="apb7WPvj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F2BE206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Cc:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1yAxmaUuatcDh/3BxhmN5DNC8x7dkIDrcsM0BI739jE=; b=D8O8zRulbAxTPOjnatJmRcLbQ
	9uEA4TDSZkdp+UJSYPcN87rBmBs5iM88TFAVXPNRiR+AjJvRnXauPsstCK7D5534D6doblpeDdBiA
	zoE+q50rp0ZxI6cMcpkyO5w2/nlyuzt4bJURkqEPTHjOUjJd9i6QSB9pHG3FejBqhEvyJxXEYCcZ0
	g/y9juXf5YTcrRXCt7MBlNBkBx1w53hU/dCZ4DiAOqF+DZ/pkmNjJhzOxTyblZm8SmKHfgyu0PIOl
	6qqtLUdXx9o+vdHXKzvpo7W1Z2G20eXkyLuHSWB85Xy8yRu5SAVjP5lSBTQ0WYo0STys/Wf5Ig+2q
	DHDeELCDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgEHr-0005eA-H8; Tue, 02 Jun 2020 21:17:31 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgEHo-0005cv-1F
 for linux-mediatek@lists.infradead.org; Tue, 02 Jun 2020 21:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591132645;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Ylu/HiOGtyIh3U7JFEU/kaSkFMIS4f2I77a/faIj58k=;
 b=apb7WPvjn+ZpTogqKQgf9Q3eOWQwpMH0QjPyM1BP286Lp273Jz2xnmcrh9sgyocbVJ+kAY
 ehOXabtgSFgqZkkPeyxZWPFSiIwQOGp31x+7Eui7MK33yC+VwO0C6GwjN2yu9klyEGjXmH
 hRLyBBrzxCvoKZBP9/ZeYKm6NynvMX8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-hsCdn1F9OteOeDKIcScnZw-1; Tue, 02 Jun 2020 17:17:19 -0400
X-MC-Unique: hsCdn1F9OteOeDKIcScnZw-1
Received: by mail-qk1-f197.google.com with SMTP id v197so8768181qkb.16
 for <linux-mediatek@lists.infradead.org>; Tue, 02 Jun 2020 14:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:reply-to
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Ylu/HiOGtyIh3U7JFEU/kaSkFMIS4f2I77a/faIj58k=;
 b=bnQLhOMiPVY5bRuTya83PoWhoQCLcizq9mzqRwGGEsglHue/LANdRh6925Gl9Rocrp
 Xn43v3qrc7hkyAUd8vJpwRqB4I3wtRnV/bowvIlNOzxGvbM1PdX1PASCohNKdtbA1wEj
 XIPSuYTX1b8WHYNsSmR3i3gthBmSGTGNSSY6mZPC6c4bGS1HWS6GUaZgunye/QhHVZFK
 IcxiLSCgj9KIIkP5Ud2Lhf6mt1tanOqUfjLr3k/IO0t0SQVxjUY6eRU/uYKNDCur2ORz
 LeMQvwO7RkRBYN/wXztzdWYiUfg2ho/DWfMEHnljcpcO2jUe/y++CXDxnvNj+Sa0AXfD
 f8xA==
X-Gm-Message-State: AOAM531QQTKhZd4ygZ2NKmN+ejNmdi2aoHXu22+QQOI41Q2MFjJmyUeh
 LiCViSSdtpGs7JD4J1MRSzTeqL8NAJIkk49oe2weTYJspZhgWp9jN1EfatlHAzlAJEhvhRPvKoZ
 BRF2VGfbOqIOMFmzO22xM6+LcIIoPRdbU
X-Received: by 2002:ad4:4572:: with SMTP id o18mr4280465qvu.228.1591132639431; 
 Tue, 02 Jun 2020 14:17:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjUlzm0vhI6fKGjvvF8hVsaVisMes9o90lVEfQF4r2oAsbB6iugyCZPUzy6UK1t6uFVWKiBA==
X-Received: by 2002:ad4:4572:: with SMTP id o18mr4280428qvu.228.1591132639109; 
 Tue, 02 Jun 2020 14:17:19 -0700 (PDT)
Received: from localhost (ip70-163-223-149.ph.ph.cox.net. [70.163.223.149])
 by smtp.gmail.com with ESMTPSA id l9sm3244877qki.90.2020.06.02.14.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 14:17:18 -0700 (PDT)
Date: Tue, 2 Jun 2020 14:17:16 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Joerg Roedel <joro@8bytes.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 linux-rockchip@lists.infradead.org, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 00/33] iommu: Move iommu_group setup to IOMMU core code
Message-ID: <20200602211716.mcwacflxvh7kycya@cantor>
Mail-Followup-To: Joerg Roedel <joro@8bytes.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 linux-rockchip@lists.infradead.org,
 iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
References: <20200414131542.25608-1-joro@8bytes.org>
 <20200529221623.qc6twmpzryh7nkvb@cantor>
 <20200601104240.7f5xhz7gooqhaq4n@cantor>
 <47711845-98ee-95b8-aa95-423a36ed9741@linux.intel.com>
 <20200602000236.j4m3jvluzdhjngdc@cantor>
 <20200602142312.GJ14598@8bytes.org>
 <20200602163806.o5dpj2tpemwdzyiw@cantor>
MIME-Version: 1.0
In-Reply-To: <20200602163806.o5dpj2tpemwdzyiw@cantor>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_141728_155071_94E35681 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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
Reply-To: Jerry Snitselaar <jsnitsel@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue Jun 02 20, Jerry Snitselaar wrote:
>On Tue Jun 02 20, Joerg Roedel wrote:
>>Hi Jerry,
>>
>>On Mon, Jun 01, 2020 at 05:02:36PM -0700, Jerry Snitselaar wrote:
>>>
>>>Yeah, that will solve the panic.
>>>
>>
>>If you still see the kdump faults, can you please try with the attached
>>diff? I was not able to reproduce them in my setup.
>>
>>Regards,
>>
>>	Joerg
>>
>
>I have another hp proliant server now, and reproduced. I will have the
>patch below tested shortly. Minor change, I switched group->domain to
>domain since group isn't an argument, and *data being passed in comes
>from group->domain anyways.
>

Looks like it solves problem for both the epyc system, and the hp proliant
server,

>>diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>>index b5ea203f6c68..5a6d509f72b6 100644
>>--- a/drivers/iommu/iommu.c
>>+++ b/drivers/iommu/iommu.c
>>@@ -1680,8 +1680,12 @@ static void probe_alloc_default_domain(struct bus_type *bus,
>>static int iommu_group_do_dma_attach(struct device *dev, void *data)
>>{
>>	struct iommu_domain *domain = data;
>>+	int ret = 0;
>>
>>-	return __iommu_attach_device(domain, dev);
>>+	if (!iommu_is_attach_deferred(group->domain, dev))
>>+		ret = __iommu_attach_device(group->domain, dev);
>>+
>>+	return ret;
>>}
>>
>>static int __iommu_group_dma_attach(struct iommu_group *group)
>>_______________________________________________
>>iommu mailing list
>>iommu@lists.linux-foundation.org
>>https://lists.linuxfoundation.org/mailman/listinfo/iommu
>>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
