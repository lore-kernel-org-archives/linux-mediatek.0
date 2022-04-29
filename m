Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A341AC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 15:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aKBsiAtjJ5LY578Rkf2e/V6lKN5fp7dNZgGW00ZM5zw=; b=FxiKswEVhsSx7i
	pm3V6manm2n913iH4106vhefN0TE6YGPDNyKV0p3plLGapndOlj6YkIRiKXGOsFTPkBIFxjIh/ZwO
	nYGKPa6ZQ4D2B2fCGTMqJeCAOAdEdSG/vc0BnaZedTf7r8oHpk1vMSiY9COW7LW5xcw4TZQyZ9Wsm
	5Hm6jIv8274Y/9V658BUoIil1kOGFy3J7c9jriE0cy8LF04vn9R8g9hAm5EHQikNGGFpZCj9ZCCjD
	NIfvNMxiTqE1Qh0/6SJwxUvW29hisbVi5EmCvhY1kttP57vWrXBYVLBIXzGVVy148qMdSRKegMGyL
	NXc/embq26CY7jCLBnUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkS8Y-00Bhqt-AG; Fri, 29 Apr 2022 15:02:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkS8N-00Bhoo-Dw; Fri, 29 Apr 2022 15:02:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2E7EC61FEC;
 Fri, 29 Apr 2022 15:02:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1B1C385A7;
 Fri, 29 Apr 2022 15:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651244533;
 bh=Q9J8nfFbLcH6u/qm4eHj84G34KDbxXld+7fzihyYfPc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SFfCAJ/UJgPZA4oKecLcRClW9Fno8hmmkOuJIQMxdyyKOV9qPnwDc4fbFS10xuLxv
 XtTPLfkk5ePWl35qAHXSY5+VW4l5vn3a7AgM7jAleqtkxNyVWZeSh96eXXW23MB7OF
 Kr7nUnMC/GTNn/b75wVf0J/i4Ikr5paHMZTu2fHNTbb1riEk2lJo+i2a5OLu4aJ9NZ
 39VzDKDjiVYV4Gvm/c31qka5PbHJcxgdsuhArOPTClpVrGq2XJrabP62XZKiuQ3qDR
 X/cplXnllK7b3WHU4Gno1RX6I7IcmdhCTKImvOKNSBNrqSQPoCtAp1u/K9xds+RUWY
 glyyXxana3kQw==
From: Mark Brown <broonie@kernel.org>
To: matthias.bgg@gmail.com, tiwai@suse.com, robh+dt@kernel.org,
 yc.hung@mediatek.com
Cc: trevor.wu@mediatek.com, daniel.baluta@nxp.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 allen-kh.cheng@mediatek.com, alsa-devel@alsa-project.org,
 cezary.rojewski@intel.com
In-Reply-To: <20220106064847.15588-1-yc.hung@mediatek.com>
References: <20220106064847.15588-1-yc.hung@mediatek.com>
Subject: Re: [PATCH v4] dt-bindings: dsp: mediatek: add mt8195 dsp document
Message-Id: <165124453080.141488.6009641744846773699.b4-ty@kernel.org>
Date: Fri, 29 Apr 2022 16:02:10 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_080215_547919_DF1680BF 
X-CRM114-Status: GOOD (  13.12  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 6 Jan 2022 14:48:48 +0800, YC Hung wrote:
> From: "YC Hung" <yc.hung@mediatek.com>
> 
> This patch adds mt8195 dsp document. The dsp is used for Sound Open
> Firmware driver node. It includes registers,  clocks, memory regions,
> and mailbox for dsp.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] dt-bindings: dsp: mediatek: add mt8195 dsp document
      commit: 66727cdb250ec5d3f42558e33ace5c7d0fbd9477

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
