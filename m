Return-Path: <SRS0=A00R=PR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376C0C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 20:55:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0028261075
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 20:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0028261075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l7jQ2+N4mt52k3yIBlSKyyQ6K4KvXwuE+IFwkEwUwXs=; b=DYfFv3ZzPzYNO2
	V6gKHk+1wH74NcuuiqaicMURwTPWbRS7tM5ClMljimdIJ7+WJTiEOzCX/J0VMtPMF3CTQvwG4On6+
	4mad/W79HyNqXHYm6kMR3zoygjT5meNkTYd/EH1OKTU9TwpJOt14pfeEqdEH0q03/QqqRWEYCj/Ae
	3mfNtchb+n64vvXDCFVK1mxdvqT6Pw4CCKvQUAOWAPIwVim7877FerlaGpRkSlFzWuQSbkMM/UD42
	8EaSGE6XedHFkMYOhTEmhtR0PpTINUwcxiMgB8H8+l/1EfkGrEluKVR/9FpTeCoENbmIo6tSLAccB
	qBPnP1uZL8txyuC5YY2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgYuE-00CKtK-UV; Fri, 29 Oct 2021 20:55:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgYtr-00CKnl-QG; Fri, 29 Oct 2021 20:54:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8172A61075;
 Fri, 29 Oct 2021 20:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635540895;
 bh=pOJQpgaSJK6t2EtQjZhIopjYqTh/FOv6CfFCmJ6dhqE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=uS4HqaU85jBAkWVmi6fs6wzFG4WpNMC6VW447pGwOE+NKlvNBnhPvm4cdRS9InG/b
 bu11Ky4Ccr3F9Uxf3o0vtuSd8WdKyd1/a3UHaV0bGxVu06yq/MDsME2H3tBuy57bv1
 vA9X1746ZihdPiJJ2FbJZBAqTnotLaPRDkY+Ev2nE9shgUngx7bk2bQ7R5f/yGDWop
 yY7j2BGx55uz5QNVZagVJsUqtBoUojgqvBzcLAw5OwpeMHaK1POpmF4WM280kHuCmV
 cmwcZBniKmeo2aWcem3Q3sYFU63/sRXLGjFNS+BMC8BeTLzbDjyZrG63CPi5u/A6bW
 /Su2O7yYK4MCQ==
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>, matthias.bgg@gmail.com,
 robh+dt@kernel.org, tiwai@suse.com
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, aaronyu@google.com,
 pierre-louis.bossart@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
In-Reply-To: <20211020071428.14297-1-trevor.wu@mediatek.com>
References: <20211020071428.14297-1-trevor.wu@mediatek.com>
Subject: Re: [RESEND,
 v2 0/2] ASoC: mediatek: Add support for MT8195 sound card with rt1011
 and rt5682
Message-Id: <163554089329.1997146.2620727675711869109.b4-ty@kernel.org>
Date: Fri, 29 Oct 2021 21:54:53 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_135455_894987_8DFF2C49 
X-CRM114-Status: GOOD (  12.85  )
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

On Wed, 20 Oct 2021 15:14:26 +0800, Trevor Wu wrote:
> This series of patches adds support for mt8195 board with mt6359, rt1011
> and rt5682.
> Patches are based on broonie tree "for-next" branch.
> 
> Changes since v1:
>   - refined code based on Pierre-Louis's suggestions
>   - added missing of_node_put
>   - fixed wrong fixup assignment on HDMITX
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mediatek: mt8195: add machine driver with mt6359, rt1011 and rt5682
      commit: 0261e36477cfa2608468c1300e30cb667c5e1269
[2/2] dt-bindings: mediatek: mt8195: add mt8195-mt6359-rt1011-rt5682 document
      commit: 6c8552ebba7742e7128134859846e17edbfdf222

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
