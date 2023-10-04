Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F69E82CAC
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Oct 2023 14:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MPOjKsqFTyWVakwv3T4PYKGPhYhPt9XYXboN0Al35uM=; b=WrOuNrnePR4sgDgBEWp7fP694u
	B+iYhQ3Z7UrUJKOELR0iVRxhDY6lOZYWsFEEqhr5cnP/0e/8UdtkMfehUgRZFbx3V2Fr5B4dkKXTU
	VCVVmilKSp01/3eLdHw8vDREC4W8UhoHpiOVCpYNI0oJO5l49ByJR2+d+n3ekMzK9QP8IvrjXH+zt
	3e1CN2wErSTTT/HxXcwCGKB2LbcJEirky4HYFB6TIUbfGg1g82/qepStWxhG0LpR2oikgdJDto+B6
	GPRrWYcvHz4oBfYqm3sTvwJ+BNGx9xlupoADD2jY1lzkaNEzNWgM+HVpDeJAdx9M9h2GQcDAThCin
	JbMdAM1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo2hX-000CdI-1q;
	Wed, 04 Oct 2023 14:18:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo2hU-000CcT-1I;
	Wed, 04 Oct 2023 14:18:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 2349EB81EB8;
	Wed,  4 Oct 2023 14:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E65EEC433C9;
	Wed,  4 Oct 2023 14:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696429086;
	bh=1SSxbMRto1cv7K/OV22a+RO/1d1PaOeTe9kLraLmCug=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=n2K5H+OVrCpg3TOSvk9GC531Wi9M+KZn6D8at5ZfZku8+V3KBicomrhMMHD/9ADI4
	 Hl2WgLpo6VBJht8XBbWiVjXX9+rvyu40Hyaqr24P3RdBrGOA6TH9uNDz7aPr0w+pi1
	 TlF+IrUSsIT7sjDk336bsuZsqI44BRogCP/YYePzQM4HhkWu95S0t7tsjf8IraW8Vt
	 tsGwjG4hZSVyIYS6NpIFLf9NNJvZhsI1I0mT3Z9pjVyqHYRfAq220tYS/EiG+zQsOB
	 5J+RF+gahYrcoTWziZG25qsOd+0ag4akGyWvzIgT/x9gRHujza9arHIOuAd34U9is0
	 TcEZGLwUe3/NQ==
From: Vinod Koul <vkoul@kernel.org>
To: sean.wang@mediatek.com, Duoming Zhou <duoming@zju.edu.cn>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230806032511.45263-1-duoming@zju.edu.cn>
References: <20230806032511.45263-1-duoming@zju.edu.cn>
Subject: Re: [PATCH] dmaengine: mediatek: Fix deadlock caused by
 synchronize_irq()
Message-Id: <169642908358.429977.8140374757545835839.b4-ty@kernel.org>
Date: Wed, 04 Oct 2023 19:48:03 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_071808_577657_BD9941E7 
X-CRM114-Status: UNSURE (   8.50  )
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


On Sun, 06 Aug 2023 11:25:11 +0800, Duoming Zhou wrote:
> The synchronize_irq(c->irq) will not return until the IRQ handler
> mtk_uart_apdma_irq_handler() is completed. If the synchronize_irq()
> holds a spin_lock and waits the IRQ handler to complete, but the
> IRQ handler also needs the same spin_lock. The deadlock will happen.
> The process is shown below:
> 
>           cpu0                        cpu1
> mtk_uart_apdma_device_pause() | mtk_uart_apdma_irq_handler()
>   spin_lock_irqsave()         |
>                               |   spin_lock_irqsave()
>   //hold the lock to wait     |
>   synchronize_irq()           |
> 
> [...]

Applied, thanks!

[1/1] dmaengine: mediatek: Fix deadlock caused by synchronize_irq()
      commit: 01f1ae2733e2bb4de92fefcea5fda847d92aede1

Best regards,
-- 
~Vinod



