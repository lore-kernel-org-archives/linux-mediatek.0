Return-Path: <SRS0=kQBs=A2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23275C433EB
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 09:17:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9FA12053B
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 09:17:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WMoin1yj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9FA12053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6mmS+hJc9D7Cq9Dgk3LYjKzap1u8l5mvP3wKZTs04Xg=; b=WMoin1yjKOgFaN7n4N7UE2goH
	7y/GtcP345lFIeqL+OV6jvsHNzp1uWUPBhB6tYNOehx6wcgUibmtDdggvxKKm09zAUBOnFkI3YBuX
	/5OGvrt+ym9n3AzreNkxdYdgNZBczQZ4wSCoYR/dNmmpgI83NnejKZsAGi675ILx+GWXgNhc1WA2e
	ho/A2YBQZwGyG92TZV5dofv0G5aFRZ9f1xwEmdhFPwdGmY8aBIBHkJHMVGvbOl33SjSKxaXwsgv36
	Gv7rq4MWxZd/6Z6y3UfxgjXmiBFEGVHfQWWErasMWAHmmpdWbcWrBAAiutWtg1SJ0fhCpnckjzkwh
	uufKLrW+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvdXf-0000kl-Tp; Wed, 15 Jul 2020 09:17:31 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889]
 helo=theia.8bytes.org)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvdXd-0000jT-9c; Wed, 15 Jul 2020 09:17:30 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 5C98829A; Wed, 15 Jul 2020 11:17:27 +0200 (CEST)
Date: Wed, 15 Jul 2020 11:17:20 +0200
From: Joerg Roedel <joro@8bytes.org>
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: Re: AMD IOMMU + SME + amdgpu regression
Message-ID: <20200715091720.GV27672@8bytes.org>
References: <1591915710.rakbpzst8h.none.ref@localhost>
 <1591915710.rakbpzst8h.none@localhost>
 <20200622100257.GD31822@suse.de>
 <1592839701.mxvvths2x9.none@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1592839701.mxvvths2x9.none@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_051729_453770_50E95272 
X-CRM114-Status: GOOD (  12.97  )
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
Cc: Heiko Stuebner <heiko@sntech.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Daniel Drake <drake@endlessm.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 David Rientjes <rientjes@google.com>, Joerg Roedel <jroedel@suse.de>,
 linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 virtualization@lists.linux-foundation.org, jonathan.derrick@intel.com,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jun 22, 2020 at 11:30:04AM -0400, Alex Xu (Hello71) wrote:
> Yes, it works with SME off with dbed452a078 ("dma-pool: decouple 
> DMA_REMAP from DMA_COHERENT_POOL") applied.

Okay, I can reproduce the problem on my Ryzen System, and the boot log
shows various warnings/bugs from the amdgpu driver. I think this should
be looked at by the AMDGPU folks first, as I didn't really got far
looking into the GPU drivers code.

Regards,

	Joerg

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
