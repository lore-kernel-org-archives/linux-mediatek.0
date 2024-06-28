Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BA6C2BD09
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 03:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+//wXB68Jpy2YJduJ9kimvXQao2KtNmz8Qw5kp+Mio=; b=k0vfVT+CAyxYZpVAf8BB1AAWvu
	oPzgzYwfmIM9EDo4IKinvpwHJPQKxDsskUJFFhZ4P5VIIfYa5qEqgtftJ9xI2qvf1pSHqF9epbkI4
	AwBczBafOSc6jSkb8E9djMdEqc9rCcdyb8u3MzqgpJ2/ceivmvki5l/4+lIYh8IBeqSXTx4FLgzZF
	gT1jyYpbitooIyb79Z6iGYoLD6pyDHc5n9cMoFTCNu76DotLWe1jHflXGR7mi0ZPHVaRKnlfWrMv+
	ev2GZNzh7ZO0h59t8SyiXhTb4H4LrsL92RWUwqf+MLXIswLqynIRKLEPC180EfWq1wkuoP+R52GWw
	69NUBwYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN22t-0000000CPwE-3mZ0;
	Fri, 28 Jun 2024 03:13:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN22k-0000000CPrn-0lDx;
	Fri, 28 Jun 2024 03:12:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A6D7861DDD;
	Fri, 28 Jun 2024 03:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B868C116B1;
	Fri, 28 Jun 2024 03:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719544376;
	bh=3nifBkuhyILV0xYL5KUSjJ3xZHJ6CLiSboXZwYqFvu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tomto9naGoth49hJ1Rqkjib9MtgFAQm2S7pTq48tc6rqrauyDcKmnKlwpoPr/rngK
	 9xbddlb7mrhi5Qqy+ffwIryqSTByhVCfm02zT0UJ1QF9FTuegKKOCG+f4368GCcTA+
	 nhVA0h+3qZWJcqHsdFT1i8QVGF61Svws6Jzzq848yHBAWDkWzVMKNQcqxfZmJ164Z5
	 Kgv6HRaNY7fupHqT0u3eJEuehwpyiclDcw82J0dIu7FLpleEMj6OoVMYwpRGLjaz0p
	 w9JF5O5yCA/ORfJCdZWjauPvRDsGDMjpiqcu2qRZYwKj5svrGQ4vboyHk1naQEyEdV
	 PJnqTj5Yj+4xQ==
Date: Fri, 28 Jun 2024 11:12:50 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] remoteproc: mediatek: Don't attempt to remap l1tcm
 memory if missing
Message-ID: <Zn4qMmeuIqeszQOA@tzungbi-laptop>
References: <20240627-scp-invalid-resource-l1tcm-v1-1-7d221e6c495a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240627-scp-invalid-resource-l1tcm-v1-1-7d221e6c495a@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_201258_306700_F7C5D8A5 
X-CRM114-Status: GOOD (  11.57  )
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

On Thu, Jun 27, 2024 at 05:20:55PM -0400, Nícolas F. R. A. Prado wrote:
> The current code doesn't check whether platform_get_resource_byname()
> succeeded to get the l1tcm memory, which is optional, before attempting
> to map it. This results in the following error message when it is
> missing:
> 
>   mtk-scp 10500000.scp: error -EINVAL: invalid resource (null)
> 
> Add a check so that the remapping is only attempted if the memory region
> exists. This also allows to simplify the logic handling failure to
> remap, since a failure then is always a failure.
> 
> Fixes: ca23ecfdbd44 ("remoteproc/mediatek: support L1TCM")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

