Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41108CA0ECF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 10:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pZUV42NSSXD/ZGv1EHsOPC2gOn+cDsiJhzOiI/iasM=; b=VKHNTM4hApkoOmtqhBD6gTvBII
	QcNpoD2rCWOkO17NxJTyPJu/embkt++KmETC+9dj0iuv7qaWt5zAWq8//mhTOsI4BjaxFhkO3phyD
	w0a79LRoHKWOSP1ds2NVPQSRJUwEjsrRalyioTWqUNOqDq37+wgaZka8zW9QiY7hqJsV3+Ht0zUcz
	c/gX1K/tDiECDVLon+4vcW+iKCkZHnu8x0DfgsgfJNUJKKq+TybeoCwWK8z61Uh8vgrPZuyB9iI2Q
	xgTFBpB02oXGijkF1yUcpogMCJY9P8FveulAV7Fyg6ys4U0iQ/I8rYLr3xWJu0j3MYPUuyFOlsGuJ
	tujBYhqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg0Td-002wYC-0O;
	Tue, 12 Sep 2023 10:18:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg0TY-002wWE-2i;
	Tue, 12 Sep 2023 10:18:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 75AB261728;
	Tue, 12 Sep 2023 10:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C03C433B9;
	Tue, 12 Sep 2023 10:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694513909;
	bh=uKvPIfnxCoZtHrrIPaG9nNRcDJHXgQGDDHfQe/MWQZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AQYFILSsh4WNbTikyKtzLokfkY+RYdnG+CMwUDOF4KBxYbpQhedujXf88J52hQ7aF
	 LXdcFlB8e4yXzo/E1ZbP7gDQtTpVc9e3uNGD5t5AtILSNFV+dbdpLboAIf/QHuBeLz
	 JiQraaMpvFZr2mErtyQgWb9r0muXGjyqtOz2zoGnOThZlJw2epVIxJHTSlwPl03P17
	 NromokDPjkkgDl0Js/Aeksn6886MU//9WG5coE3g1sT9569WQKU4lMr4OPhtEOviKI
	 LMcRZ9OWgtXWG3+vpdMNGDuSb4bV6yKGvsYlTSKdz8lMnVUrEpt5WmB5XqBVdrcUSq
	 zcq5/G+WvKQDw==
Date: Tue, 12 Sep 2023 11:18:20 +0100
From: Will Deacon <will@kernel.org>
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: corbet@lwn.net, agross@kernel.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
	mathieu.poirier@linaro.org, catalin.marinas@arm.com,
	linus.walleij@linaro.org, andy.shevchenko@gmail.com,
	vigneshr@ti.com, nm@ti.com, matthias.bgg@gmail.com,
	kgene@kernel.org, alim.akhtar@samsung.com, bmasney@redhat.com,
	quic_tsoni@quicinc.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, kernel@quicinc.com
Subject: Re: [REBASE PATCH v5 08/17] arm64: mm: Add dynamic ramoops region
 support through command line
Message-ID: <20230912101820.GA10884@willie-the-truck>
References: <1694429639-21484-1-git-send-email-quic_mojha@quicinc.com>
 <1694429639-21484-9-git-send-email-quic_mojha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1694429639-21484-9-git-send-email-quic_mojha@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_031832_940217_C77753F4 
X-CRM114-Status: GOOD (  16.47  )
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

On Mon, Sep 11, 2023 at 04:23:50PM +0530, Mukesh Ojha wrote:
> The reserved memory region for ramoops is assumed to be at a fixed
> and known location when read from the devicetree. This may not be
> required for something like Qualcomm's minidump which is interested
> in knowing addresses of ramoops region but it does not put hard
> requirement of address being fixed as most of it's SoC does not
> support warm reset and does not use pstorefs at all instead it has
> firmware way of collecting ramoops region if it gets to know the
> address and register it with apss minidump table which is sitting
> in shared memory region in DDR and firmware will have access to
> these table during reset and collects it on crash of SoC.
> 
> So, add the support of reserving ramoops region to be dynamically
> allocated early during boot if it is request through command line
> via 'dyn_ramoops_size=' and fill up reserved resource structure and
> export the structure, so that it can be read by ramoops driver.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
>  arch/arm64/mm/init.c       | 94 ++++++++++++++++++++++++++++++++++++++++++++++

Why does this need to be in the arch code? There's absolutely nothing
arm64-specific here.

Will

