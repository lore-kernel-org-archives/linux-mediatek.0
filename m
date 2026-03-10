Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC995FD88D3
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 23:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=r4SnVFJB2JfKCJ/wWBvjdnnONwaG/B85cKlc37hC0uw=; b=dfz4ZeJyZVhUAp
	oSfpa/kYuA3OXmbSPY+fAe6jkViYg+Ar3C0fpmqLlMrHOFvcvD/0Z6CkRxEOOUtUeoAuNEb+4Bkql
	3JMfKIupE82RYfB2aAYwwrX8mGPmwNivLfH5gK4oCJzmVBB9hWW7a7LkuAx1HNKkMNUM82+fcf72s
	BNRy6SdEqOWx3issCqMgLWHA8LwCp5s7z3p5DPnVSvMMLDDbspstE2C4993CAJsVY6kxXxRt8O0DC
	TeCr3aQX63E3GvQ5Ad4hIHl5pynLfHLdMUCghPWEyWf0q8fXw+WXJwUc0X/DOuqMHK759cywEVCOE
	ydB7vUQiFVeNxnjQVHaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w06ip-0000000AOLU-3Z40;
	Tue, 10 Mar 2026 23:42:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w06io-0000000AOLE-3GXF
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Mar 2026 23:42:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A09DA600B0;
	Tue, 10 Mar 2026 23:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06860C19423;
	Tue, 10 Mar 2026 23:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773186161;
	bh=Rpuzb3qFLIHbB4t+hFWiH2qTADPLyy65pzE6mzOqFfw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=q4pxsZq9nfJccNFgGTEpooCkqvdoKMUab7Ic79rlNmQmB71UyflWjnNtPKpHZp6bO
	 2I7c+vpokSgrBMXUXywc539WELU4Q2EtOd5wkkhEteR33Japc4j5NgdZmXHTMZL5I8
	 HHpAHLdkPw0VVuRUXJxwQvjxQvxikTDbfcY6E8pGPZBDrQ/ygx9ZzYIgexzzbj79Uv
	 he/00+lPgwYf6weNuwarrSbJDxVHY0gi2jdUD2wMZ5OtZiG88ewcVET/pBc0iDkzPG
	 gVmtCHU9eU6aC93ywrbOO9xHfSl9K9b5Q/kxuSbc6WF3Q0SdIh9apsK3fuRvD6Hefi
	 P8lZ1VDvIB86g==
Date: Tue, 10 Mar 2026 18:42:39 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v4 5/7] PCI: mediatek-gen3: Split out device power helpers
Message-ID: <20260310234239.GA871399@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310091947.2742004-6-wenst@chromium.org>
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

On Tue, Mar 10, 2026 at 05:19:44PM +0800, Chen-Yu Tsai wrote:
> In preparation for adding full power on/off control with the pwrctrl
> API, split out the existing code that only partially deals with device
> power sequencing into separate helper functions. The existing code only
> handles PERST#.

> +static int mtk_pcie_device_power_up(struct mtk_gen3_pcie *pcie)

This function name suggests that there's only a single downstream
device, which obviously is not always the case.  When you later call
pci_pwrctrl_power_on_devices() here, apparently that powers on the
entire hierarchy.  Maybe this mtk_* name should be similar to make a
connection there?

> +static void mtk_pcie_device_power_down(struct mtk_gen3_pcie *pcie)

Same applies here, of course.

