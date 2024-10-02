Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FBBCF31A9
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 09:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aofZkyqKYkFbvu2+2WiUO7h97NjPn5Gp7tHHAh+s1Gg=; b=DInuYrEalDNcJImSxbEhY0vPYB
	XLrNxHBUUuT7+xBixJo9U8J2l8fsqOrY/iNpABe7OlDrhXkhwFCoqkwTyJBJeNnIHQhtHpNAhPBD3
	d5UlpQkMVVSu/X9v0uLfpPxnbbhUGozObFu85/uMzrw4pYMfn1h7AsDl+D291oVGmfy9CO9LZ/nS0
	s0uo4d12fns3vJs+1tI9dhDDuvIeZ3XqRm/rkvXPeZ8M0PU4y5t1qrOTYMDGPyJEgeNLwAlmicbld
	waE7eBEwhH6rj82m/+d8gZ6M3hgWxUg/Kxa5y3thQc2QQGEnbUUlrUAJgZbrB7NiFsqrQlEXhCc5Q
	KOO4YYNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svvmq-00000005MWm-1XCR;
	Wed, 02 Oct 2024 09:36:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svvjd-00000005LdM-1las;
	Wed, 02 Oct 2024 09:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727861607;
	bh=Nq9kP7p2LUwPE7XTmkw3W7IZnvP6w4fKaT6mxZ9wZbM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Qk7LgcV+pW9t3qtRm5COEeLA9ch6WtSAb+ZcgFbZGRt2ddvzO2NbhOjvkWigZ6Vl+
	 ZXb6qfsXrbEcixpUbKZuGgbOifEIWxdnFXn1b28H1AiA1rIHncT/l74gjZ9Fud9+M8
	 mq1FlUBf/Sh56oxviFwCXtEULXt2s+u4YW1S9tb1R3gA3u5ubmQeY0rYbp0zobJ1xA
	 2Dqh8k1fwRHQtXD2oQ4/t1qxU8ZuTfWLaJXbvknO9MS6tVD8D8ks0Scmm+4GCcPznW
	 JKMLkAPhWb5KVqes7ikdEMvxuoRIv1bRiV0UePgn+Fc6mOlPCaAzo2bfl/kx7HCKXR
	 sDO2hVr8wREDw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C7E5A17E1201;
	Wed,  2 Oct 2024 11:33:26 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Fei Shao <fshao@chromium.org>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Bin Liu <bin.liu@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Conor Dooley <conor+dt@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 MandyJH Liu <mandyjh.liu@mediatek.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Xia Jiang <xia.jiang@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-pci@vger.kernel.org
In-Reply-To: <20241001113052.3124869-1-fshao@chromium.org>
References: <20241001113052.3124869-1-fshao@chromium.org>
Subject: Re: (subset) [PATCH v2 0/8] MT8188 DT and binding fixes
Message-Id: <172786160676.39477.16621812934064031504.b4-ty@collabora.com>
Date: Wed, 02 Oct 2024 11:33:26 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_023329_718035_2D185F59 
X-CRM114-Status: UNSURE (   9.71  )
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

On Tue, 01 Oct 2024 19:27:18 +0800, Fei Shao wrote:
> This series is split from a previous series[*] to focus on few fixes and
> improvements around MediaTek MT8188 device tree and associated bindings,
> and addressed comments and carried tags from the previous series.
> 
> [*]: https://lore.kernel.org/all/20240909111535.528624-1-fshao@chromium.org/
> [v1]: https://lore.kernel.org/all/20240925110044.3678055-1-fshao@chromium.org/
> 
> [...]

Applied to v6.12-next/dts64, thanks!

[5/8] arm64: dts: mediatek: mt8188: Add missing dma-ranges to soc node
      https://git.kernel.org/mediatek/c/ad9d9e15
[6/8] arm64: dts: mediatek: mt8188: Update vppsys node names to syscon
      https://git.kernel.org/mediatek/c/c1134cbf
[7/8] arm64: dts: mediatek: mt8188: Move vdec1 power domain under vdec0
      https://git.kernel.org/mediatek/c/66c466da
[8/8] arm64: dts: mediatek: mt8188: Move SPI NOR *-cells properties
      https://git.kernel.org/mediatek/c/08ea5de5

Cheers,
Angelo



