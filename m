Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C70C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 17:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=846AMvNEk7IVaJayEmV28WGMxaD5x5Zv7zInt1V8jz8=; b=VORnqQb6LHaCTX
	S15VQKB/vjNxe3tmIQ/o9AS/aXvYRn/z9+auYDJj0SLHy6i1HhoNylw7yTAgitbzE6C2wzZgC8VQp
	LhxYEdx8K6wIz2LuQbyP/9HUvMAdRapu+FY5GfgqpW7yTdf+HBCzLGxyrrUeXAUiXZalY7akLb/5d
	Ss+o8oKo6iNpE/CgACemT9kHaV0bc5xDIQ4HDxCRWbBwdayMAmnVJ3L3jLt0zruSVSWgbzT+J43fB
	Lvp3nzU+3q3QHMsTmn7/LSgr7bUQUy2OSfqqxnf/U4WxPtHxwr+/RdiUk2c+7yLYT2RPfaNiGNunm
	VaGQy4MoH8G2Ga/+DqTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRdjM-005ZG2-NY; Tue, 08 Mar 2022 17:34:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRdW7-005Uo6-D7; Tue, 08 Mar 2022 17:21:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 977C160F89;
 Tue,  8 Mar 2022 17:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA83DC340EF;
 Tue,  8 Mar 2022 17:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646760058;
 bh=wSgfdJeBnQuD5Tw0f9riM3mLX4grfj+Fq6bUvc86P64=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=OCeTIOQh9qpUvmWZfWOIAHCl07UBaqndWDIed2WZLKCEj6mM+IAu2/OlhJ/IH590C
 LpcWjyKkTwoDt7u2nBbe4ZeBMRTANTgGV3HkoH+vLArzFNOfSs+rNX8Qz0Numr2JkT
 b/LWAdoFLatB4+ZAoUxXHipZX1Y5Lo69Xx6xu/ebiAwlUu6JGnRABEBqF5epD0APUm
 8txfRgGU+zsu+02WBuxVu8dxvE3QozWxKbKaXI6nWMDN8gepdgRtDcbqk9dsE//RC4
 5eEtaNCoEjamqaakfjzWwRcbp3LiqKstoY++yeAfDkS64QrlH2MnLi/AA4FBnQglrp
 TK9zbhdiwpTBg==
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: alsa-devel@alsa-project.org, trevor.wu@mediatek.com,
 Tzung-Bi Shih <tzungbi@kernel.org>, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 perex@perex.cz, Project_Global_Chrome_Upstream_Group@mediatek.com,
 tzungbi@google.com, linux-mediatek@lists.infradead.org
In-Reply-To: <20220307033056.11463-1-jiaxin.yu@mediatek.com>
References: <20220307033056.11463-1-jiaxin.yu@mediatek.com>
Subject: Re: [v2] ASoC: mediatek: mt8183: support wb bt audio
Message-Id: <164676005561.54315.8574406268011125156.b4-ty@kernel.org>
Date: Tue, 08 Mar 2022 17:20:55 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_092059_525261_8ECD4DCB 
X-CRM114-Status: GOOD (  11.43  )
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

On Mon, 7 Mar 2022 11:30:56 +0800, Jiaxin Yu wrote:
> Use "bt-sco-pcm-wb" codec dai driver for wb bt audio.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8183: support wb bt audio
      commit: 5ea14bf62ef4501c13f56fce75f6752cf643748f

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
