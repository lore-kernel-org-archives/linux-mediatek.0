Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63FECEBF7F
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Sep 2024 07:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sScctYbtYghJIotKwyBAiR9ZXfCFd+nJ5oMds3kIT7A=; b=3pIBKXAYT5s30aGBxoaP2TFnMy
	NjyU2pQrgI73R+m688/bv0JkgCcFeAbJx8Za+v2Bs/tkHkL1jSja5S4yVQtFA5r6hgkmEdJGxNG/4
	bEFOGaCoQRFVQ71EGAXZY36LCjsOc5bTgHVAsMQzLA6z7IDNfQ550tRfbpei961rH+rUmeVi7Pqr0
	GjGI1MK83xSEtaopQY+ou3T6iGXXI8DTMp1orTeWFUJ2pxtlRwaASUtXyfIW/coAAIuzORNJP1eWg
	pz64T5GMvlGK8CaV/9oW+rf0rkdKZknCkhuMjAM/IiJdXg9bmT2Qy7bgvnjBeN4gJsXu5Wll0nWkR
	jcEOJ3QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su5fr-0000000AOR0-2bT5;
	Fri, 27 Sep 2024 07:45:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su5fo-0000000AOPK-0gm8;
	Fri, 27 Sep 2024 07:45:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7804DA4529C;
	Fri, 27 Sep 2024 07:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D42C4CEC7;
	Fri, 27 Sep 2024 07:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727423154;
	bh=muHlqJ7iEOLfJfdfnWfRQ+Z4rZB4TQDLw6WtJrxW/FY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=IloIFCHQVPrmcLnhS3Iihmfb/Rcd24BcaORt9mlaW+c37RrYEgtgRNkITVY51uovw
	 bl5kjuT3ljwQiEQHrZVjBP7+Vx0RUkuMDqg1oDhtTGroKD/xCIr22LVQhMB1yuP68s
	 SZSI/1KRueCUqGo7kSSWyUcJMEw/wZu2wEIvkUkZEUo2ZNmxktazbBQfpOZU+EugIm
	 8h/BPS2wdxXpxWRGlJ5UvYdO5vqB74ndbB/67+qxPXVd+cprGszrfx145c0svxxFqg
	 whyEQjU8IM1LLGgb68qfvB7beaP5QcLEDjE9vM5e3EvC/a/WFLOOkD/DkrWkMA/cLn
	 oFcajaknfB5fg==
Message-ID: <545585e6f2e9d0bbe35f0a2785838cfa@kernel.org>
Date: Fri, 27 Sep 2024 07:45:51 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Vignesh Raman" <vignesh.raman@collabora.com>
Subject: Re: [PATCH v3] docs/gpu: ci: update flake tests requirements
In-Reply-To: <20240927052416.1833889-1-vignesh.raman@collabora.com>
References: <20240927052416.1833889-1-vignesh.raman@collabora.com>
Cc: airlied@gmail.com, amd-gfx@lists.freedesktop.org, daniel@ffwll.ch, daniels@collabora.com, deborah.brouwer@collabora.com, dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, guilherme.gallo@collabora.com, helen.koike@collabora.com, intel-gfx@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, mripard@kernel.org, quic_abhinavk@quicinc.com, robdclark@gmail.com, rodrigo.vivi@intel.com, sergi.blanch.torne@collabora.com, virtualization@lists.linux.dev, "Maxime
 Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_004556_300605_139DA3F5 
X-CRM114-Status: UNSURE (   4.88  )
X-CRM114-Notice: Please train this message.
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

On Fri, 27 Sep 2024 10:54:14 +0530, Vignesh Raman wrote:
> Update the documentation to specify linking to a relevant GitLab
> issue or email report for each new flake entry. Added specific
> GitLab issue urls for i915, msm and amdgpu driver.
> 
> Acked-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # msm
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

