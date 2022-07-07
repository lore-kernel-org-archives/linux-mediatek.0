Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F67BCCA47F
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 07:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7JBLo6RfO198jrv9NaOC/hy23cgnbJ2Xmv+W9Ubx9b8=; b=1zeGRFca6EJEJUiFD4qIqhK9z/
	F70Saq51zXVXrr0nGprmwRoBia6U3KbHq68x131bl3MVictVJASWVCBiu4yeEqiHZsiC8MiSgXHEE
	1b1utOwxm2oclHsf6pe7AGnsuiyPUTI4dT9JVMl7NQVCyaZmkKlLo8m0BG12lk3E/H4VvszbRHatY
	YyHMNgey+4kdNUoPSqB0VwLp+dWM15yGm2PmO3gfjJeRsWO9NpN7K7z1EyZ5d1yUjxo5hEvwwfv87
	zk/YdSnXnip7awWZKNKvLR8RepJQSkLDtzr+w610FS5OT589ELWn5BRb7QQ3YJ6+K1WUPObQ/mid6
	E40S9h/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9MAp-00ElPn-5S; Thu, 07 Jul 2022 07:43:43 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889] helo=theia.8bytes.org)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9MAe-00ElNb-EX; Thu, 07 Jul 2022 07:43:33 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 7D622423; Thu,  7 Jul 2022 09:43:29 +0200 (CEST)
Date: Thu, 7 Jul 2022 09:43:28 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Will Deacon <will@kernel.org>
Cc: yf.wang@mediatek.com, Robin Murphy <robin.murphy@arm.com>,
	Yong Wu <Yong.Wu@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	wsd_upstream@mediatek.com, Libo Kang <Libo.Kang@mediatek.com>,
	Ning Li <ning.li@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v12 0/2] iommu/mediatek: TTBR up to 35bit support
Message-ID: <YsaOoI0rcKKVuJPd@8bytes.org>
References: <20220630092927.24925-1-yf.wang@mediatek.com>
 <20220706115028.GC2403@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706115028.GC2403@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_004332_674505_25C84AF3 
X-CRM114-Status: GOOD (  10.40  )
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

On Wed, Jul 06, 2022 at 12:50:31PM +0100, Will Deacon wrote:
> On Thu, Jun 30, 2022 at 05:29:24PM +0800, yf.wang@mediatek.com wrote:
> > This patchset adds MediaTek TTBR up to 35bit support for single normal zone.
> > 
> > Changes in v12:
> > - Update [PATCH 1/2]: remove GENMASK(31, 7)
> > - Update [PATCH 2/2]: remove MMU_PT_ADDR_MASK definition.
> 
> For both patches:
> 
> Acked-by: Will Deacon <will@kernel.org>
> 
> Joerg -- please can you pick these up for 5.20?

Applied to arm/mediatek, thanks.

