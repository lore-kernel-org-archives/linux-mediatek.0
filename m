Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD93C352A1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 15:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LTgw+ebYiNXVnrlAolQo7IMsP8uGvJLbiJKtx2T4awk=; b=SU3eUX4MFUsZnO
	u1Lhg9NZ4u9c+f7aMH5m6uoo8C1CDlK24AE6MoDnkFLRK/2yDIn+kuBlASyg/Xc8c07WXhSuQ0jc1
	WSOyFV6RbulpwICy2ylNWuQvkGmO2yvUdaPTNRIMcnStWvCm7wlNjeFEr5mWbPQf1lP3aquEHo6qs
	X8PU5QVhukjgwQkLXcXJBBmeS9AbpbaUkgvWNpQu+OSOk3ZwthNrBlSWXggmIqY5lP4/WQoxsT33r
	6WDWCRUS4TQeVjLMKB4cWE1536bBkKCl2TAcwJaHbdlk0JgKyKp5W2R8LC1fPDZS6ndTWtaTp5izD
	V9FxZjjruWOnouKf+tDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2a6K-00DBJv-6k; Tue, 06 Dec 2022 15:43:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2a5z-00DAHy-Qc; Tue, 06 Dec 2022 15:43:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2E0C361580;
	Tue,  6 Dec 2022 15:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C8EC433C1;
	Tue,  6 Dec 2022 15:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670341378;
	bh=b/5+AO9U5t+K6P2Qc72IGGvfLNBkWTdkKVJBlGbBbqg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XW9NlZ0DGcOT577Q6XkL82z2pzFS61TaxTo/2qp6umxKWHM6XNBhYzrHaFgT72Cvi
	 JheV2qBoLC7xlJ4qQ6LhUSM5adgmQKarz+bAunznpmmJbVkTMKeIL/T8aB13Sgi4LL
	 JLwV6hJTkvwgy+k1Am6y5D0TyVOerx6Nl3+Z79cCbdwZ5n2d5NhKDDdQu5/43r5UMy
	 IhXw+wURveFx3VJCleJw02tutPVpaGfi+smUHIP7+dRTSQGAs+ro2m+1QHH2AkNMxk
	 wsu2CxraTZdSMWFKs6fPzuOHQlVkYn/DnYQSPufrEidZ0QMLGhn3WHSx53tV0Vp49s
	 xf1PAFhIlnhaw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>,
	linux-mediatek@lists.infradead.org
Subject: Re: (subset) [next v7 0/8] Add BananaPi R3
Date: Tue,  6 Dec 2022 16:42:50 +0100
Message-Id: <167034135386.88271.140848740488398853.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127114142.156573-1-linux@fw-web.de>
References: <20221127114142.156573-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_074259_941481_BF7ED272 
X-CRM114-Status: UNSURE (   8.81  )
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-usb@vger.kernel.org, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, linux-kernel@vger.kernel.org, Jianjun Wang <jianjun.wang@mediatek.com>, linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 27 Nov 2022 12:41:34 +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This Series adds some Nodes to mt7986 devicetree and the BananaPi R3
> 
> This version is rebased on linux next from 2022/11/27.
> 
> i included sams series for mt7986 DTS with small changes
> https://patchwork.kernel.org/project/linux-mediatek/cover/20220427124741.18245->
> 
> [...]

Applied to pci/dt, thanks!

[3/8] dt-bindings: PCI: mediatek-gen3: add SoC based clock config
      https://git.kernel.org/lpieralisi/pci/c/ec9eaf68c1dc
[4/8] dt-bindings: PCI: mediatek-gen3: add support for mt7986
      https://git.kernel.org/lpieralisi/pci/c/d3fd0ee7a4a1

Thanks,
Lorenzo

