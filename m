Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3030AC79F9F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2026 08:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r6Zm/H/Lmzh0U1M//5cp7HJj5u5E9gqYg7yfdLufV4U=; b=hrMF/XKV+DSTkj8xZiNOYnn1l7
	hHCYreshcHaVv6GD36PrgyyKvraVs9sJMSD1gMDavBlZWHI7tBrAtrrK/ATQD2oCKd9RerCRv+fMT
	d2Pg9em0vvkDzODLSmlP1zQr+yAKFh9ucZXcT9gEnadq+XSZ0VUnhMmWAJVDQpPQc81fFGrzqpNq5
	IRaOAC0v36ho3Z9UHrrKmldwYGmMBGFcfWIP2T9IQWhZWQissrxQMx34kRhSFc9xzaAFmqB/p5kbr
	3QZWiDVyLpg1KEDrnxk9aOXJ1JubrUV4DqOzWKglGBxOsscRMKshapkdZ6ZK/kW3S6pJgpOUk7Ou7
	BKCPWqxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Zro-0000000DhLo-0Rh4;
	Thu, 10 Sep 2026 08:10:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Zrm-0000000DhK5-1kXY;
	Thu, 10 Sep 2026 08:10:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D6F2A60200;
	Thu, 10 Sep 2026 08:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE3701F000FF;
	Thu, 10 Sep 2026 08:10:37 +0000 (UTC)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: ryder.lee@mediatek.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
 mani@kernel.org, bhelgaas@google.com, 
 Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: robh@kernel.org, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, linux-pci@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260728122810.3475-1-sreekuttan2156239@gmail.com>
References: <20260728122810.3475-1-sreekuttan2156239@gmail.com>
Subject: Re: [PATCH v3] PCI: mediatek-gen3: Fix 64-bit type truncation in
 mtk_pcie_set_trans_table()
Message-Id: <178902783731.2684.801323745956768589.b4-ty@b4>
Date: Thu, 10 Sep 2026 10:10:37 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
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


On Tue, 28 Jul 2026 12:28:10 +0000, Sreeraj S Kurup wrote:
> The variables cpu_addr, pci_addr, and remaining in
> mtk_pcie_set_trans_table() are of type resource_size_t, which is 64-bit
> on 64-bit architectures.
> 
> Using 32-bit helpers fls(), ffs(), and BIT() causes 64-bit integer
> truncation when computing window sizes and address alignments above 4GB.
> 
> [...]

Applied, thanks!

[1/1] PCI: mediatek-gen3: Fix 64-bit type truncation in mtk_pcie_set_trans_table()
      commit: 13335fca4c23b1a6736ec9c7efc3750154a2ca24

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



