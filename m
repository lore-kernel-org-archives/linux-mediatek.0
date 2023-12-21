Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D584C46CD2
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Dec 2023 17:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYyPnYDxgSY2w5lQbQ4Uzqfc6EirewJcVQ2sGdgWkNE=; b=i0V2/R6nUau32Zu3+6c4qBuSDU
	X81BQzhj7cHYvMXynCCEZQmdSUmAsULw8cXfFWpEF4j5gxAAaTAxDj6BrP5Ctn7Kbr5sg/2aiE2L3
	m2hHtaivp4yWx7IhNxmM5qVvfK59VF9t10lOymE9ze802Jyu4slCyBPi3kRSgX42WKMbtjlPqy1PG
	h84qlDGuB/433wL7GhdhemvLS2wv+gX5g8OvkpL8UXduGnIjgfgHZl/O37get6d8X8d72/IOGGxZx
	7VBc9zmcCX4cObkaWAXcZX1t3Yshp7BUodamdmTKWSurcW9XKzEAhLzvSUZwtUyJK2G0ytsGymZdM
	MCYmyvZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGMeg-003bhO-1c;
	Thu, 21 Dec 2023 17:16:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGMeS-003bd8-19;
	Thu, 21 Dec 2023 17:16:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B8F4461A11;
	Thu, 21 Dec 2023 17:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9BCC433C8;
	Thu, 21 Dec 2023 17:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703178963;
	bh=ddkCtqedJXUfrPiPFVW9vL0khrWJ0HeXZyzlFi+7ZN0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XllADW8fzqgI6ZGH4zVju2IL8ZRfeJQIDo7nwhIGPXo5s7p7HBGyUtX9nYCc1qUdh
	 ETZuKyc9WwEEf5ZDax/GJ5iQrwJCLnHZpjkyDrsMDjTpcPf7aMtwwz+L8fe2kfKnnO
	 jiuPzMYidXNe6vU1pS00Khwr8ffSccCnlQgMjvTFZ0eZi438AcS+B2PzXPSx9birN0
	 FvwDAUI0cLzcfEXKuGFqLdTDkHEvtpcXmN5ZC77EKrK87clIVfvsjzwIX6wYbksbD6
	 9yuABNt3RX3FjRiVjSAVzKJ5ESnBhXF4daUM6bEfWQQH8nIgE3ikiGZx6f6bF//cGp
	 gyZHPHz2qln0Q==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20231211025624.28991-1-chunfeng.yun@mediatek.com>
References: <20231211025624.28991-1-chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: mediatek: tphy: add a
 property for force-mode switch
Message-Id: <170317895962.712473.102387666807925662.b4-ty@kernel.org>
Date: Thu, 21 Dec 2023 22:45:59 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_091604_435961_057A7DEC 
X-CRM114-Status: UNSURE (   8.64  )
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


On Mon, 11 Dec 2023 10:56:23 +0800, Chunfeng Yun wrote:
> Due to some old SoCs with shared t-phy between usb3 and pcie only support
> force-mode switch, and shared and non-shared t-phy may exist at the same
> time on a SoC, can't use compatible to distinguish between shared and
> non-shared t-phy, add a property to supported it.
> Currently, only support switch from default pcie mode to usb3 mode.
> But now prefer to use "mediatek,syscon-type" on new SoC as far as possible.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: mediatek: tphy: add a property for force-mode switch
      commit: cc230a4cd8e91f64c90b5494dfd76848197418ed
[2/2] phy: mediatek: tphy: add support force phy mode switch
      commit: 9b27303003f5af0d378f29ccccea57c7d65cc642

Best regards,
-- 
~Vinod



