Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BE3C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Nov 2023 15:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqZ445i8YWqUVB11ymWdYaRJ2lulZPymqzPF04Tldi8=; b=i2tIt+E8uswK2PastkYSYAUQC8
	wl3kVQg3lC6YjVSj/iNw8lUYJuEqU3kmPKXHOducSO7802D92tj/S8gZe5jcw39oKQfOJeHf/Qtkz
	CsFc4wE2otlY2hIo/RJ4/0m9KDV4qAdZ386rgWY2WEZ7y7skQ5I578ziAlbUp3fTRoImepbFGyWnP
	kMEg3NjwaQneqnLcCbBvUhtK4dQ1phWNDxyeHS/KIKnZu35p5QBPGXpibT+UuLVybhu9cRavXFJ1u
	lT+pYKKjsuS8m2Lxu279IAKUmHDiJvRzceOQTJELRAyE+Q2xzrpHCnEg1bLEPtBvWcPCk41a5mRZG
	XSdTlJEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0kku-004DZa-1Y;
	Wed, 08 Nov 2023 15:46:12 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0kkr-004DYX-0X;
	Wed, 08 Nov 2023 15:46:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CE6D3CE10C9;
	Wed,  8 Nov 2023 15:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D4DC433C8;
	Wed,  8 Nov 2023 15:46:02 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Douglas Anderson <dianders@chromium.org>
Cc: Amit Daniel Kachhap <amit.kachhap@arm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	James Morse <james.morse@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] arm64: Move Mediatek GIC quirk handling from irqchip to core
Date: Wed,  8 Nov 2023 15:46:00 +0000
Message-Id: <169945831991.2744977.435558730470523982.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231107072651.v2.1.Ide945748593cffd8ff0feb9ae22b795935b944d6@changeid>
References: <20231107072651.v2.1.Ide945748593cffd8ff0feb9ae22b795935b944d6@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_074609_400623_7046AA06 
X-CRM114-Status: GOOD (  10.75  )
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

On Tue, 07 Nov 2023 07:26:56 -0800, Douglas Anderson wrote:
> In commit 44bd78dd2b88 ("irqchip/gic-v3: Disable pseudo NMIs on
> Mediatek devices w/ firmware issues") we added a method for detecting
> Mediatek devices with broken firmware and disabled pseudo-NMI. While
> that worked, it didn't address the problem at a deep enough level.
> 
> The fundamental issue with this broken firmware is that it's not
> saving and restoring several important GICR registers. The current
> list is believed to be:
> * GICR_NUM_IPRIORITYR
> * GICR_CTLR
> * GICR_ISPENDR0
> * GICR_ISACTIVER0
> * GICR_NSACR
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/2] arm64: Move Mediatek GIC quirk handling from irqchip to core
      https://git.kernel.org/arm64/c/1d816ba168ea
[2/2] Revert "arm64: smp: avoid NMI IPIs with broken MediaTek FW"
      https://git.kernel.org/arm64/c/4bb49009e071

Also "s/Mediatek/MediaTek/".

-- 
Catalin


