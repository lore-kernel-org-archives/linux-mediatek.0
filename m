Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339B1C3ABD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 May 2025 16:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCC2wFvX+VRXPFM+UqJWuDREx7PiggiD0yB6yD7SpzU=; b=NXvFwhjeKL3sMm3rAgK0PFmovt
	hLM/SfOX6fLGBOi2I1npYA782BySPpuWlwgUfCnWFZyo7Lwbg9ijHb4A1TXLRJfTDnShaARcyJ/gH
	W8ygYBBuF/H5JcIshp7PgM2ADfkEPMfudIvzi1s7HOJ4CsQNM6U5c6esuGnUlCtE4A+H24ahdTU+U
	ZBchUeyWkna6GNSyzQlP3hovFemT+9bB730Yto8+MmWIKUbtKlzGo+c+ScNmN64KTKJ7W7Gclwyl/
	QNRG850m1DkJh7Mu62LSe7q/1gCtGfrFYqrd6A55zFaGXtV+5r4wQAAAtEpKZUp/z6Ol/9L1FfE1n
	BRxq/S4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxg7-00000003ynv-0PJL;
	Fri, 16 May 2025 16:12:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxDW-00000003tO3-3Bm0;
	Fri, 16 May 2025 15:43:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5685743786;
	Fri, 16 May 2025 15:43:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B69C4CEF0;
	Fri, 16 May 2025 15:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747410202;
	bh=JX6JzbUHGsSlhtbCchsrt85j6DDVCcgzO9j3GrNG8PM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=T42LItu/hK1i86e2aCIt+WEP4NJzf4EQ8lDPZyKYgO3dkrEMLM78MUkRcCoDKnnzC
	 /9WjEBYk989deDxl0d8r877edJv0c3Mlkbxpjtte66iq6UIR67890PwDSSXIA5Pjau
	 znqMjRHhNDgUHyu2cbOk0o7+9H2GIGfRa4+6aHt+OaCjN5eURvrkHxoaP1QYy/GvAk
	 eCy0T4bLBfr2cnlrV+wKiqXJNc+xxwsXAapB0qtnmOgWkB9W/dqwYyj+UPNydatxXP
	 sFz63Dg8wJ/9moBgA1cZdZVZZQms6APs9jDtbZubuCTKKT6tGWITa1WiV88T1+5FBY
	 fx5M4fHy8MM8g==
Date: Fri, 16 May 2025 08:43:20 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jinjian Song <jinjian.song@fibocom.com>
Cc: andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com,
 chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
 corbet@lwn.net, danielwinkler@google.com, davem@davemloft.net,
 edumazet@google.com, haijun.liu@mediatek.com, helgaas@kernel.org,
 horms@kernel.org, johannes@sipsolutions.net, korneld@google.com,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 loic.poulain@linaro.org, m.chetan.kumar@linux.intel.com,
 matthias.bgg@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 rafael.wang@fibocom.com, ricardo.martinez@linux.intel.com,
 ryazanov.s.a@gmail.com
Subject: Re: [net-next v1] net: wwan: t7xx: Parameterize data plane RX BAT
 and FAG count
Message-ID: <20250516084320.66998caf@kernel.org>
In-Reply-To: <20250515180858.2568d930@kernel.org>
References: <20250514104728.10869-1-jinjian.song@fibocom.com>
	<20250515180858.2568d930@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_084322_822208_A31D85E5 
X-CRM114-Status: GOOD (  12.09  )
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

On Fri, 16 May 2025 11:46:57 +0800 Jinjian Song wrote:
> >Module parameters are discouraged, they are pretty poor as an API since
> >they apply to all devices in the system. Can you describe what "frg"
> >and "bat" are ? One of the existing APIs likely covers them.
> >Please also describe the scope (are they per netdev or some sort of
> >device level params)?  
> 
> MTK t7xx data plane hardware use BAT (Buffer Address Table) and FRG (Fragment) BAT
> to describle and manager RX buffer, these buffers will apply for a fixed size after
> the driver probe, and accompany the life cycle of the driver.
> 
> On some platforms, especially those that use swiotlb to manager buffers, without
> changing the buffer pool provided by swiotlb, it's needed to adjust the buffers
> used by the driver to meet the requirements.
> So parameterize these buffers applicable to the MTK t7xx driver to facilitate
> different platforms to work with different configurations. 

Have you looked at
https://docs.kernel.org/networking/ethtool-netlink.html#rings-set 
?

