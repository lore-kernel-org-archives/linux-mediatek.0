Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB0DC433E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 08:27:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F11C821835
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 08:27:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fas8RkF2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lcclkXtI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F11C821835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1ohKmfz1wIU2ThhlL+BohhQY/ke+jiJDBh3a5lXkjZA=; b=Fas8RkF2yBLDJtMosIbM8nXAM
	rK1rCmzV2dbqHPvDdWt+E1zmrCva8lh1FxKKZc+3rDw3KrrwWZD3D8unblr4Wi5Qt+nOa3WETnSdH
	xwzdYalnDn0Uniulyp8v1WfCAEUJ5cQiSDYwAjUaAiz75X0Qm+gsukf5jDnu7fY1ltD8p/OUxI0Z/
	u/Yt2/TDt17hM82v/HfGHobiywsxaQvKN4AAZX4Nbmz1cEg4k4W5PnVADjusvXuSnLK24lZUhF3lK
	AQlVcwOELg/JAxK7BbEaAid1GS5w5u0f6QcrJmQ5bN1o8D543Vaq7xkXeUXZUp2Il9he/cw5jDkbB
	hHQKr1gdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvGHI-0003r6-LR; Tue, 14 Jul 2020 08:27:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvGHD-0003pb-Ek; Tue, 14 Jul 2020 08:27:00 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C99E21835;
 Tue, 14 Jul 2020 08:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594715218;
 bh=rkHskXC0fiwa6QUMtcIea2p7i/6OpQKyeZInBl3W1JQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lcclkXtI6xPp5/1tsah+tsY4T4lVY3Dinfx5gzN3lmgiev/hCZ9q8C3ykXyXyNw+D
 rZKK1DCidNuCplg0/JzhvaiYgJidPKjCuFRlTALJMHMrGfZ20EivrOEkbCKuv3CieV
 SLO6dVBOWw7JYumLD1zzF9sVCOTiq10Z7ma3wZ9g=
Date: Tue, 14 Jul 2020 09:26:52 +0100
From: Will Deacon <will@kernel.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH v2 1/2] iommu: Mark __iommu_map/__iommu_map_sg as static
Message-ID: <20200714082652.GB4516@willie-the-truck>
References: <cover.1591930156.git.baolin.wang@linux.alibaba.com>
 <ab722e9970739929738066777b8ee7930e32abd5.1591930156.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ab722e9970739929738066777b8ee7930e32abd5.1591930156.git.baolin.wang@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_042659_575509_307869D7 
X-CRM114-Status: GOOD (  10.23  )
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
Cc: robh@kernel.org, linux-kernel@vger.kernel.org, tomeu.vizoso@collabora.com,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, joro@8bytes.org,
 iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, baolin.wang7@gmail.com, robdclark@gmail.com,
 agross@kernel.org, linux-mediatek@lists.infradead.org,
 alyssa.rosenzweig@collabora.com, daniel@ffwll.ch, matthias.bgg@gmail.com,
 steven.price@arm.com, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jun 12, 2020 at 11:39:54AM +0800, Baolin Wang wrote:
> Now the __iommu_map() and __iommu_map_sg() are used only in iommu.c
> file, so mark them as static.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  drivers/iommu/iommu.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

(I'm assuming Joerg will pick this up for 5.9)

Thanks,

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
