Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF34C32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 13:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkKVO9TUZBtolQ9yp/fgTLgS7UowFhvXh2n7xNyKDfE=; b=0Mbp4IHaEo4HorAzVrzjq9tnRL
	/xMGUiYELOx9DXzctSAxyHO79TUql0YYm4idEwUfMiJcdaiWoGmZhOT6ifNb/t7mRzJT2u10AG7Bd
	cwHnLWsKqTZcXDKLomezznnMUq3riSQ+zEMct5ncrjyqvRNWl5AJI6nKmmA2Nyv0gaIFYUfWsq/Ga
	4P75Ppjk+iMjflKlpHrOEXvvjln4EXC8RZTaorReECE+VcwwRceDYKz73Q6LScb2C3FPbXkSm75zU
	u6DEqZvThzu39vpFmw60tnRzJbNyoB6ca3Y1/qgPx5l3rWAbfNhINyIcokeY7lN/aOX4xz21dgZ7o
	MHlcw0KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQTWD-0068na-4T; Tue, 23 Aug 2022 13:00:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQTVr-0068Zo-KY; Tue, 23 Aug 2022 13:00:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 26D78614CC;
	Tue, 23 Aug 2022 13:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B39EC433D7;
	Tue, 23 Aug 2022 13:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661259610;
	bh=vFYiXo/P9K/4JU1QhwwFk5O85O6WmJkkrgsVcBQli/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qESWTLeRSSaxMmItsSzL6/p8MEOxyEJ0hZSoJajH9L6X9Trnt1jeca3kAE3HRcm3q
	 7LOpt2l+Y4UCV6geAcu+6BlTOLRgUy4Gg8jBHvfgfbyfaNvQ5836Ufg0P6KsOSrvA7
	 UPPlMtR6rzOgPBcoP3LF6qCfFOaY2Duu4xjyYw6i/1oc4T0lSrL+HhaFC9umHSnns3
	 E1X8h7iypVxoPsGVT7WAdpryn/lQAJSuFZ7AG/tB5UL4I+gG3ljrRQlwBu7CdavUMw
	 7SkZzpdILB8BsHZpBhqWf3If3EDg9J2GDpDHs2qdpZciv5hnYgv2BBcDXyzZce73xZ
	 EnW8kmObstBHA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Felix Fietkau <nbd@nbd.name>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4] PCI: mediatek-gen3: Change driver name to mtk-pcie-gen3
Date: Tue, 23 Aug 2022 15:00:03 +0200
Message-Id: <166125958529.60702.17839683437013330997.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505083907.86598-1-nbd@nbd.name>
References: <20220505083907.86598-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_060011_752927_60D85892 
X-CRM114-Status: UNSURE (   9.13  )
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

On Thu, 5 May 2022 10:39:07 +0200, Felix Fietkau wrote:
> driver_register() will refuse to register another driver with the same name.
> This change allows pcie-mediatek-gen3 to coexist with pcie-mediatek built into
> the kernel.
> 
> 

Applied to pci/mediatek, thanks!

[1/1] PCI: mediatek-gen3: Change driver name to mtk-pcie-gen3
      https://git.kernel.org/lpieralisi/pci/c/034fdac01fe5

Thanks,
Lorenzo

