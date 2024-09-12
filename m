Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FC3EED627
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 17:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/x1pi7nJR5p65DcWqca1temjrJBEMDHU2fd5qZt5Cc=; b=Q305AjIMC+UeLJ1I+bhusW0btl
	HtjCKj/HUVaiDkdzvV9HxOPBlUeAzb7F0P9Lslv+tWcdWv/qn47Jp2dkpjMz+d65mNSAHyT0ABhMx
	xN7eP0NJAY1WtP8929Mbv+gk33LqzxU+RlhYiuIBzwd7Zfi6uiRxwm3qZEN/DGejt/WXXyySR8W7b
	/Zihj+mafx9H8Ef58DiFXm7xRFgA4jU7fIzJ3mCjUzKKBSm+n4aziZPge60KQOEoZQ9KN9+PG3Svb
	9g07W0lme7nt5TehbQZJKGa3kRnyizm9qumEWHc1SyG3LW88MmkkhkBbp3SOY3xHNevuH6i/mNcYK
	yFngHV/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sonGz-0000000DmyQ-05PF;
	Thu, 12 Sep 2024 17:06:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sonFu-0000000Dmrw-3jfI;
	Thu, 12 Sep 2024 17:05:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5F0C25C5A38;
	Thu, 12 Sep 2024 17:05:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44938C4CEC4;
	Thu, 12 Sep 2024 17:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726160717;
	bh=Jn+D3Ldn3xXWF87flG57S+s2cGeeN6zBdVn7hWJkyhI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TyuyVELgN12TDDomQTcsuk0TYow8KnxpOq3PzmdVvokNIyhoCAJQ7xDJmQL5Slu59
	 WMyQyaIgHncTo8y35lymIgT8mJG1TQyiZWQ5fe8MvShwRtOUuixHANcGUNT+01zla2
	 uKYPkqiWHO89YUnv/GBLy11prPheXSfloiAnCh76Q4jN1E6GHHKXO8rQmx8tHWpBeU
	 R/SWDke4OFbHWQwJl6mh9cEXZ+LnqZq/pL+HuqiO1GwzzC9CTVHRzAIDUTho5aujdb
	 7OxQcwea3IYmy1/XP6Htw5snZQWVaVA3B4lh3k3/K1CJJQLxUGb6/EWJGsdpOkjTN2
	 I9V5tNOsGe9IQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Nicolas Belin <nbelin@baylibre.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20240911123629.125686-1-usama.anjum@collabora.com>
References: <20240911123629.125686-1-usama.anjum@collabora.com>
Subject: Re: [PATCH v2] ASoc: mediatek: mt8365: Remove unneeded assignment
Message-Id: <172616071500.69425.1928964300196117932.b4-ty@kernel.org>
Date: Thu, 12 Sep 2024 18:05:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_100519_036921_5B1D48F8 
X-CRM114-Status: GOOD (  12.42  )
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

On Wed, 11 Sep 2024 17:36:22 +0500, Muhammad Usama Anjum wrote:
> The ret is being assigned, but not being used. Remove the assignment.
> One of the reviewer mentioned that dev_warn should be replaced with
> dev_info. Make this change as well.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoc: mediatek: mt8365: Remove unneeded assignment
      commit: d69f11e8c57e9459c9e60bffc0f2c6c3aa02f4b1

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


