Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1302DF30946
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2026 12:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cWJtB5ulo1F2m7/zGgJRecQBNmIpSHpbHTRlYHW5I5M=; b=C5dTTrwhBAODI2S/3mRVK1FfYn
	fwJb/uUZipsMMzwZ8bJDdYOFPbMAbHQFK2L8h1I4Z/wgY1YvNP5UXddc4u44ipyeFDTzZUoRSslC6
	kbgHGyUKogA3+LloYfwi657Thbwas46lgmqVIJJ64+NrXzIA/evo1s6Lg13OUMXXrcKX3guGS5BjN
	TuwdLGsK2li0qegGvsbSBavO3Kj0VqzXiMhLHmTymV0XK+EJiaEQqAeVrC+TtyQnm0onQ+gynQQcC
	l0I548mdYk5wgQB820TQCXdh6UN4VjUvmqjEUb5ZgIQcl0aMLxux4ZSeq5qYUUv58wOw9KGZxOfcY
	UcGgDQKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy82u-00000001nSj-2A34;
	Thu, 05 Mar 2026 12:43:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy82q-00000001nSO-359d
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Mar 2026 12:43:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772714589;
	bh=j2nmEUsed1xGW7mYNjCxskTFeMzmDSGgZTXSXzW87/E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cMlCYiIm9nkWc0v85Ktic0IMmXr0Pjl6WyCyR2/YcPw1cnMxSUAqpvCGUbLOAmIxL
	 wbPMgYmSSsoCbrsomViW6h7d2210+ZMnKQqiQMqvGenv4EkATTrMsfUcjdhIFu2U4D
	 IYR9wIp2lcRsNWDDuwYO13P3SWk1idXsK+6AILiP3O5yTWFJFsB3/LH45bZ17NZ43V
	 WEfN+5NWAFL44RpoNs+IdjTpGVMBLg+EiEnRw6J6UlxE/VnXqB76Rm0z2m3m7DRtwT
	 m6+uFYxOzykD1JwWAEyTAEP/zwEI/F4bj4rcHG0e2pluHcVLLq3Xss0zBmG2DjXYsL
	 eCRxH8kiH6jXg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DB2C917E0071;
	Thu,  5 Mar 2026 13:43:08 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Ryder Lee <ryder.lee@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260302053109.1117091-1-wenst@chromium.org>
References: <20260302053109.1117091-1-wenst@chromium.org>
Subject: Re: (subset) [PATCH v3 0/7] PCI: mediatek-gen3: add power control
 support
Message-Id: <177271458883.33613.9898365722639233697.b4-ty@collabora.com>
Date: Thu, 05 Mar 2026 13:43:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_044312_949711_C993F5CF 
X-CRM114-Status: UNSURE (   6.62  )
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

On Mon, 02 Mar 2026 13:31:00 +0800, Chen-Yu Tsai wrote:
> This is v3 of my MediaTek PCIe gen3 controller driver power control
> support series.
> 
> Changes since v2:
> - Link to v2: https://lore.kernel.org/all/20260226092234.3859740-1-wenst@chromium.org/
> - Made PCIE_MEDIATEK_GEN3 select PCI_PWRCTRL_SLOT, following existing
>   examples
> 
> [...]

Applied to v7.0-next/dts64, thanks!

[6/7] arm64: dts: mediatek: mt8195-cherry: add WiFi PCIe and BT USB power supplies
      commit: 0c5d91b3d0eeed3925dd43f834afcc19a11aa9fd
[7/7] arm64: dts: mediatek: mt8195-cherry-dojo: Describe M.2 M-key NVMe slot
      commit: 4c434585ce6d485ee12ed6becb1524f933454aba

Cheers,
Angelo



