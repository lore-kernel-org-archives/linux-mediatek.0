Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC41FD88CE
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 23:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=qyk02vs5Nu9tKg1eJ7LEVABMTAG90k7843koIbfC7ck=; b=WR6ZLrG+KN89AT
	Jp/yRIZHyR2PsY7K2m+PnDN1dDiVU1ULmK5rJuXi31KmnZXAG+qtKjH/1kr7KgZM3Kkwri0V6N98s
	PeK60tG/pBGLjzAstZfy/RFOGGt8+VSE4IXW1nzMyo4GCmrbYZSy26UT0mcl9uCOFg6h1vlMBhPPE
	WbE3vEx+fC2CShG+PyaleTo8hpIiC3m+uxSVzvGG18a4xRcTxcFqJyl1X4Yby9bRCHJFy4WcmkisT
	glAx+wZcAUKZ6hsfExTrbGvqCDM2G2M+IJZYHuRNWdms5a4wViZ61oIXYFsQFLrh7oJLtRHxzsK96
	JpUIYrBYOZLDCJEWeqPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w06pB-0000000AOYS-2Ymo;
	Tue, 10 Mar 2026 23:49:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w06p9-0000000AOY4-1ONu
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Mar 2026 23:49:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B6A2943FFD;
	Tue, 10 Mar 2026 23:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70775C19423;
	Tue, 10 Mar 2026 23:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773186554;
	bh=WKyMe7L4kmEhFwVr7IreJCVbASQUbCuM9pTkohLng58=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Gz9jftw3oyW7mcL6QP2edC5JvYUfVj1j0c8NTHRzsTYtr70qC2WdthLp6eela6HGn
	 GREjj+o3SDG+LORvz0VchHzlfM4aPvSsxXBkco7dEPIiAiJJpboP9IQVFf7Nq8JvZQ
	 kU5Par3SJK86OTxJam29fEdfV3a2hWNSsKVifr+yPUXfIRLDUQQ+sUaHdxowVoNihk
	 bSirhWE+mH1/IZ2VmVhN+Yq8ivnx7A9kAsHLUzuSTHC9w3Js9oW72tI2j0hQGJgacE
	 GBN5iiAGFRANR2r6FAeUO/Oxu8ikpzej139Vf1AveXs/+OescUdAaBSttAZG6MB/BW
	 sQTrLHT4c9pUA==
Date: Tue, 10 Mar 2026 18:49:13 -0500
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
Subject: Re: [PATCH v4 7/7] PCI: mediatek-gen3: Integrate new pwrctrl API
Message-ID: <20260310234913.GA874899@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310091947.2742004-8-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_164915_392214_C81F2DDB 
X-CRM114-Status: UNSURE (   7.39  )
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

On Tue, Mar 10, 2026 at 05:19:46PM +0800, Chen-Yu Tsai wrote:
> With the new PCI pwrctrl API and PCI slot binding and power drivers, we
> now have a way to describe and power up WiFi/BT adapters connected
> through a PCIe or M.2 slot, or exploded onto the mainboard itself.

On pci/controller/mediatek-gen3, I had replaced "exploded" with
"populated".  Maybe "exploded" is industry jargon, but IMO it's a
little bit too obscure and evocative here.  I'm also open to something
better than "populated".

