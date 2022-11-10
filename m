Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9975C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 15:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1CRwfdw8wDbxij7Rui9ADBXpjPLXUCXBCKcItzIs0rk=; b=xbFB62RCV1mz7s2co3/rAoYCRV
	FMFttx4WJHsU/Nc2lohnlWrsflumaEgwAG5WSyd55F8V2dJbWnzztHY2oowYDzhtyN3TvSX46870J
	C9OJYOfqIGhomonpn4IDCx/eZap2s86UAIK0KkQirSAi6Yxw9ionCn8cjR1pLLoQLRpGH8q44nBUU
	z7BvpO9m5RvCHeY3KL3T8oDl7+uS1hHYX73OMVRCAB9lg6JSDgcrkiU/5Ss8/JI/JfJyfaOxOv3ZF
	lxdWuyZtyh32FpDSm5wU8PXqfBk8Tau4tloZnlSYm/AmOYMc+XnIwGenyu9dEh2VpmERC2A9EL3I8
	80M+J5fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot9K3-006gUo-4q; Thu, 10 Nov 2022 15:18:31 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot9Jm-006gO3-AT; Thu, 10 Nov 2022 15:18:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 07463B82192;
	Thu, 10 Nov 2022 15:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B386C433C1;
	Thu, 10 Nov 2022 15:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668093491;
	bh=aWfJdOuQxkek+fc/abYLX4U0ClXLg+ex/ABF0AlJm+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dHwzJSi4AFv7EiV5nrZ+IH1ZUnsEtnGPcwsRYq3QBFxtDrzVgUcIaVdj0afJL4Csd
	 eVsbOsN/lIwNchgrp/9MOxTr6UwDkvcsJHkJrtwv+lRfAQlbtGcRyo1M8sbKgZMWb8
	 +kE0xHc1sxY59K3E78N/lQxTSWiHAustUHQjW+BL+LyDhweUodDp1b7HAEPaX/NiZ1
	 9tdX4j/7d+0DpthG+xzduKqV3kpFa7xI6XUNvvMuB/dhoa0Ont2tFRgP9lKQ9l/y6x
	 QGc7jwn/1UkyGjWO3b18LduF5lKsjjlMJSulPHyN/4Cd6jUjsN/yE6rLqHi3Rc2ldi
	 68foeyLbxyEQw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v5 0/3] Add driver nodes for MT8195 SoC
Date: Thu, 10 Nov 2022 16:18:03 +0100
Message-Id: <166809342824.141750.6981614117590772998.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221103025656.8714-1-tinghan.shen@mediatek.com>
References: <20221103025656.8714-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_071814_524015_0B66860B 
X-CRM114-Status: GOOD (  10.20  )
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

On Thu, 3 Nov 2022 10:56:53 +0800, Tinghan Shen wrote:
> Add pcie and venc nodes for MT8195 SoC.
> 
> This series is based on linux-next/next-20221028.
> Depends on https://lore.kernel.org/all/20221001030752.14486-1-irui.wang@mediatek.com/
> 
> v4 -> v5:
> - update reset-names of pcie yaml
> 
> [...]

Applied to pci/dt (dts updates should go via platform tree), thanks!

[1/3] dt-bindings: PCI: mediatek-gen3: Support mt8195
      https://git.kernel.org/lpieralisi/pci/c/c9bfd858402c

Thanks,
Lorenzo

