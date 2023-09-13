Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E9ACA5534
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 10:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKbWHqhFxyGpgvtMoZyfS8As4URyEu0jfpQVpIZMkgw=; b=jlEYI0bECVESoxIH5mBg7dezWp
	OGA2bEjPCb+DozvFlWdkzgqVktu7iOA9XuP9l8fW4NF+dm+CmJRz1s2gv4X/5xedsoXnYRpaWdLWH
	JmJkSz4xQgPyLGynnaUYs5TfblkgDSYxhR8ldT9hvW4fD86g6yPRM4gtFnqE/5IDRrYL6ox6EZPxC
	fomRuveCDKCyn2Bc06xRCL/K2Qjr1l3gvFtQe5twxdvsH1NnG4g4sAXJe5sD0ZsC+IRfhL67eglKD
	FjDqgzeMssshgjTXXElFbv5hFLbYkV3MOU5U5PiCUIktgsbWZ5OSmVgVKM9GYNYV0gK7sMJeSwtJO
	zmP2f/VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgN4M-005Rqo-0o;
	Wed, 13 Sep 2023 10:26:02 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgN4I-005RnE-37;
	Wed, 13 Sep 2023 10:26:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D8831B82303;
	Wed, 13 Sep 2023 10:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 040C1C433C8;
	Wed, 13 Sep 2023 10:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694600755;
	bh=4k2IeW5H9cEqbLtJFKkr6gJFeGtpZv+ntg6InyehTu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MsMiX7Bq3wu/ubrt9go4Zl2qtpZZZdKThoIZMlsHjdv+fHu2fusSjJfXcdrTL0+1h
	 7c1jVIQcD03WR5z9RerPkcDNylNLW5Wq3XcKZ5bQYWy1wXrd9cTvRWfIPl3MwXFskV
	 XPH3kH0v1uj9MuRwolV+w+vLF0LjVfOEoRv4JRCNrGQpP+Jxjf6cG7TlggmqUuLepJ
	 Vat7PzDJUQrphDZ733Kkrcn9wU4VLMBBeNki+N7/G53aZI9TMUHiPzXSVDuhsMMjz9
	 Dmy5ALThLPMKpNRjZyQfJhkygiiY63lqSxswU6AkAvbbdNCesDQtNF2bRM3DaEuEmo
	 sHH75LxTD4r6w==
Date: Wed, 13 Sep 2023 11:25:46 +0100
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
Message-ID: <20230913102545.GA12021@willie-the-truck>
References: <1694429639-21484-1-git-send-email-quic_mojha@quicinc.com>
 <1694429639-21484-9-git-send-email-quic_mojha@quicinc.com>
 <20230912101820.GA10884@willie-the-truck>
 <14bf3fca-f031-d000-6fd6-d82f4de9b255@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14bf3fca-f031-d000-6fd6-d82f4de9b255@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_032559_325811_3D18ECEE 
X-CRM114-Status: GOOD (  23.56  )
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

On Wed, Sep 13, 2023 at 12:32:54PM +0530, Mukesh Ojha wrote:
> Thanks for the response.
> 
> On 9/12/2023 3:48 PM, Will Deacon wrote:
> > On Mon, Sep 11, 2023 at 04:23:50PM +0530, Mukesh Ojha wrote:
> > > The reserved memory region for ramoops is assumed to be at a fixed
> > > and known location when read from the devicetree. This may not be
> > > required for something like Qualcomm's minidump which is interested
> > > in knowing addresses of ramoops region but it does not put hard
> > > requirement of address being fixed as most of it's SoC does not
> > > support warm reset and does not use pstorefs at all instead it has
> > > firmware way of collecting ramoops region if it gets to know the
> > > address and register it with apss minidump table which is sitting
> > > in shared memory region in DDR and firmware will have access to
> > > these table during reset and collects it on crash of SoC.
> > > 
> > > So, add the support of reserving ramoops region to be dynamically
> > > allocated early during boot if it is request through command line
> > > via 'dyn_ramoops_size=' and fill up reserved resource structure and
> > > export the structure, so that it can be read by ramoops driver.
> > > 
> > > Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> > > ---
> > >   arch/arm64/mm/init.c       | 94 ++++++++++++++++++++++++++++++++++++++++++++++
> > 
> > Why does this need to be in the arch code? There's absolutely nothing
> > arm64-specific here.
> 
> Current clients of this cmdline would be only arm64, and that is the
> reason of putting this here.

I don't think that's a strong enough justification, tbh. We should at
least be able to compile this for other architectures using TEST_COMPILE
and so somewhere under drivers/ makes more sense to me.

Will

