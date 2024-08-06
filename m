Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154BAC52D6F
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Aug 2024 09:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GD6UfvEC97KIOXebIuAdSZtO5uJ9zS4OySQ69BroWWE=; b=n3ZjBOMErocGMVB1Bq42M4Okjk
	5hBIStZnaN7NfOmcZC9bjVIXFS15TvqNIYPXzyLja/j0A+pkLhIVXxro8OIhRm1H18caVx3xKCmy8
	Q+vZjCMPO3JFFzWcLbQNQ9AZs5ZvKvfJC5TEK8lLPRHAnz+GlAUggIKc9OnkeomrKzB0QiIETrPe3
	/cusjHdGWA1zY6FvSWvW+p00geQxEyGK+sMlpr9JirCmXbqdybNwGgsrIBPIUtJghJvwwnW7dvwJk
	zhVid7r2Eih+/2MiZO40tiNTAGqqzI41CPh/C4ebmFVJ6Kr/Gq1KHceDU2T9WWv6zd9FUkl6T7R8l
	/0ZULDaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbGo7-000000018ta-3GxW;
	Tue, 06 Aug 2024 09:48:43 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbGo4-000000018t1-3Hti;
	Tue, 06 Aug 2024 09:48:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1722937716; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eTRyLMgnJDJ7dunwP9cq0OaMk0Kmu34D9i95rhbTYrubDVQWQFS6qgnJ2yX4vFpuArtH/TcdBUamrepDklk7/XfpfI+PvGBC2vFF/g/bT3m+LAGwMsGyX3H7A4FeioV4VVCDr2dJn6fNmEbnoD94IEFbrHGW50/ErC3EhpkaLFo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1722937716; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GD6UfvEC97KIOXebIuAdSZtO5uJ9zS4OySQ69BroWWE=; 
	b=WsXNK+A2p4HobHfRJZMNprnn4NGoYK7jhdVcGLaZBV23xa7NwCHOrJRZ7zdk3t9ntafVy5UfCP1fCiUAUoCtozcHsl7aWBbdnL0si6QuseVtdxmrXeOpYWvLGpjg+uRpbB0+wMeMngyYOGQd+ZRvhyHPc+kQIDhPTm+xVTktS3I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=angelogioacchino.delregno@collabora.com;
	dmarc=pass header.from=<angelogioacchino.delregno@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1722937716;
	s=zohomail; d=collabora.com;
	i=angelogioacchino.delregno@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=GD6UfvEC97KIOXebIuAdSZtO5uJ9zS4OySQ69BroWWE=;
	b=YmRoAwQselZS8RKt9U4ejDe0TdSc1YP400EhtrGgI/a5YDaEVuZoJz8Jd6XYUREi
	XqjzmRAeThu1LoyqUKGn37NKj2Fry1k1hd8L8jtRjRGluzmCRfs12Z0xa2LpdplqGiJ
	ZEytU6EB2vE6cN6u+tjE2G5iZ1PhfD/jdCLUwI5g=
Received: by mx.zohomail.com with SMTPS id 1722937715671111.35593195710089;
	Tue, 6 Aug 2024 02:48:35 -0700 (PDT)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-pci@vger.kernel.org
Cc: ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 0/2] PCI: mediatek-gen3: Support limiting link speed and width
Date: Tue,  6 Aug 2024 11:48:14 +0200
Message-ID: <20240806094816.92137-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_024840_890947_39C17637 
X-CRM114-Status: UNSURE (   8.00  )
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

This series adds support for limiting the PCI-Express link speed
(or PCIe gen restriction) and link width (number of lanes) in the
pcie-mediatek-gen3 driver.

The maximum supported pcie gen is read from the controller itself,
so defining a max gen through platform data for each SoC is avoided.

Both are done by adding support for the standard devicetree properties
`max-link-speed` and `num-lanes`.

Please note that changing the bindings is not required, as those do
already allow specifying those properties for this controller.

AngeloGioacchino Del Regno (2):
  PCI: mediatek-gen3: Add support for setting max-link-speed limit
  PCI: mediatek-gen3: Add support for restricting link width

 drivers/pci/controller/pcie-mediatek-gen3.c | 76 ++++++++++++++++++++-
 1 file changed, 74 insertions(+), 2 deletions(-)

-- 
2.45.2


