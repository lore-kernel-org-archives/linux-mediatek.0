Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6279D37499
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 15:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4uqH2WaDORCDyS4Kfh9ETbVIBGyMrAnowdInK4g/jQ=; b=C91A/+bgGf5q8Z/Rzmt9FXF4rQ
	Z7kyi/FmINX4cQ258wXIls1ePFteHAUwoO2SFZ8M/YV1r75H9u82kLePdLkxcPTL51JpPCa+OMFj0
	A6CIzL8TI0ROFrDIzZWIYcUnbkZw7Vzq05K8DDpwbYy/LVYBb5QiljpS7LOrm2kCDydkh/NeSalhV
	PeP8AqFpIJQEP8dBdekJMFhXfsuOpyBakhl+pCp/EvwrOh8+okD/W4OgjMuoooM8dQSLhAeRHBshM
	UCeGOeBmCIsSaP7tQJO96lRWYw8w0Y2m8caf+AfBDPWiJNqlnYp/QtQCh78/r3R2Qv9kIx5c0PdDB
	V/GNmMdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1SiR-0000000FLl3-2xEu;
	Thu, 17 Oct 2024 15:47:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1SXo-0000000FIwN-2reA;
	Thu, 17 Oct 2024 15:36:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CCF3CA44132;
	Thu, 17 Oct 2024 15:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC5CC4CEC7;
	Thu, 17 Oct 2024 15:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729179367;
	bh=0r0JjnkkjqSE3jNgXwiFfV5tkiZFhPe4hiVJEamy0fA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sZVYgJ2J5a0gA6RIyL4Yvbt9ouXNMdspscC7MUdDEmKFY3iJFg6AJ7J4ZkKphTPVn
	 Zjs7ZS30LO58nKjNB7qjkuuJNp9WbvRDcBR6pjaalJzdgJAeI1n9BmRuzFzfj0nC2O
	 WHtkfKreWXzg4BSNjLezKCifxYQ0Kw3rdWyggSAEZ28JPFkUU7uiY2z3valjvBct46
	 nSFeMC5HyScWkPYCytouRLKYiKEVDMXHB9zO4kabMU1yWekDOqxVAR2XqPu6TkIoYi
	 0+ejBlf1gxjAcuMNsdEaG5Bt9vQuLsquZl1ve5n5cArMdOiSPIH1wvn82OElNTE4vY
	 oQhFG4m0nxCNg==
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, 
 Macpaul Lin <macpaul@gmail.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
In-Reply-To: <20241012035016.17667-1-macpaul.lin@mediatek.com>
References: <20241012035016.17667-1-macpaul.lin@mediatek.com>
Subject: Re: [PATCH v3] dt-bindings: phy: mediatek: tphy: add a property
 for power-domains
Message-Id: <172917936283.288841.9548294790735623997.b4-ty@kernel.org>
Date: Thu, 17 Oct 2024 21:06:02 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_083608_827545_16FD4A15 
X-CRM114-Status: UNSURE (   5.79  )
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


On Sat, 12 Oct 2024 11:50:16 +0800, Macpaul Lin wrote:
> Include the MediaTek TPHY in a power domain.  Add the 'power-domains'
> property in the Device Tree (DT) Schema and set 'maxItems: 1'.
> 
> Also, include a reminder in the description of the 'power-domains'
> property.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: phy: mediatek: tphy: add a property for power-domains
      commit: 2ac03d0811b94c2397d5ec3c82a65a112aeab5b0

Best regards,
-- 
~Vinod



