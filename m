Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1640C5AC7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 15:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=iG4zfB3mkX/9JfpqPZptcO7ZZiGhOcnJC3Whi+Knzc4=; b=hQsSoMnNn1YhI+kBCxlTv1SpKS
	UvH97n4AeJF1c+UeaMmAYt791m1ahTv830D/8jHq09L3C+Nswce53GNWo5+zFetUluKiNl9beg0l7
	ewM4hacyWy8iZO2XGOjlL4nI052a8BnolGooULF62RDBTSGYy6XU4gNazkfguA8/X+eHr1gPVA5Uj
	++8sIXj1zybitT4hUHVqPmmg5g2eRgxxTTM3m+VCFtfRjA5jfrY+SNC6RsZlvZgubfdgPYcqche1Z
	XG9C0Hh2G5w9tUOTjYQ2Kuk8nZiMq7a6uT0LAK0dWH4UR+CMsk+1vpA1hFHhw/KItre+xAyBdEql0
	yqrU+uZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMNb-00000008KRv-27Xp;
	Fri, 07 Aug 2026 15:21:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMNZ-00000008KRb-2yWj;
	Fri, 07 Aug 2026 15:21:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A7CB600B0;
	Fri,  7 Aug 2026 15:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9306F1F00A3A;
	Fri,  7 Aug 2026 15:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786116060;
	bh=iG4zfB3mkX/9JfpqPZptcO7ZZiGhOcnJC3Whi+Knzc4=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=F9xIqInDTiHDd/d8qIPuMoAMNRb5iBY71TAvq+QxygVPo9hlrdSmDykOOI5fL7COR
	 XMJ6uE2TqHIUe+3as/KvudQnR7vISAqZwIouja74y8krfv/MwVOwvFYSaZKAAJjQjW
	 HDDueZ+wGHviBXEfWMtMA3jkh4fXG74jJGz/FD1FVPnzyTf7qczyJYLZ2yX6QGZ1R7
	 SYsmiN1aGKmSSwD01XgaHxh2r3sKkWm0xkzX52rL5GDETPOAfb1RZtn10uWVIMGKbd
	 WYlW4bZeRrJ2fMJRYlXjo9Dz6c+o+a8sttqPE6WPAeteHnZ2+Q0De82rsr1surN7v8
	 8uBZ1OdrsSuwg==
Date: Fri, 7 Aug 2026 10:20:59 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 0/2] PCI: mediatek-gen3: Add 2-lanes mode support +
 clock
Message-ID: <20260807152059.GA39821@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5HrDw8GWb9zp1AaQU9UW+0FGcr7jOV2jt_zi_2KgfgBqA@mail.gmail.com>
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

On Fri, Aug 07, 2026 at 11:24:09AM +0800, Chen-Yu Tsai wrote:
> On Fri, Aug 7, 2026 at 12:53 AM Christian Marangi <ansuelsmth@gmail.com> wrote:
> > This small series introduce support for 2-lanes mode for Airoha AN7581
> 
> Just a nitpick, but I would probably name this something else, like
> "cross-controller lane-bonding mode" or "lane stealing"? PCIe already
> has 2x lanes as a standard feature, so this naming is a bit confusing.
> It's not like dual-LVDS display in which LVDS is only a single lane.

I suggested the "2-lane" and "x2" terminology because I assumed the
result is what the PCIe spec would describe as a "x2 Link" consisting
of two Lanes. 

If that's not the case, maybe "cross-controller lane-bonding mode" or
"lane stealing" would be more accurate, but I don't know what those
mean, so if we use them I would also like to know what the result
looks like in standard PCIe terms.

> > SoC. This is needed for correctly functionality of Eagle WiFi Card
> > normally attached to this SoC that require a 2-line PCIe card to
> > correctly work (and give the proper performance)
> >
> > The first 2 patch address a limitation of the PCIe implementation
> > where the PERSTOUT reset were indirectly asserted and deasserted
> > all at the same time (for all the 3 PCIe card) with PCIe
> > enable and disable.
> > The 2 patch address this and introduce correct reset to control
> > reset line for the relevant PCIe line.
> >
> > The last 2 patch add additional logic and support to assert
> > and deassert the PERSTOUT and also apply the required configuration
> > for 2-lanes mode.
> >
> > 2-lanes mode is implemented in DT by adding the required property
> > and by defining the "num-lanes" to 2.

