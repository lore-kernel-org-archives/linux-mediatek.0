Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74504C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 18:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VpVyOS69s8ZQgQrb52eFDJ5KQZL1DVwJV6zVwzZWAR0=; b=wPvYDWsZCyX3hF
	3Kq2OlLloByrEsg4ANaU7n9p25UREHDO1uESxY+6PvAeRH03Jyme9fMGa7D41xnpWcl7w+i732PJm
	uTfQVYYHnTzNs1ut8yuX2gQ5a21CpT4aGAbIytW8Z68GB/oWwn93lJ7vsWyNXhqThiCqZnmBQsRZu
	EPdhurJ7UhhbY0BQVQNUCkj6NeBBIC61fP86c7mCxNZwiaby6biTaSAtetBQpxuhrJ/Cn73hw8t8R
	d5XTWVWM5HKmDiBYZ9s094kigEougj7JEHd/ovDC+9khGrSweqjHb5eaDxUQts2ii1+Ckg6xmzJrE
	sB4goIMyZVUaYgz/CHOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muII8-005Ae8-GK; Mon, 06 Dec 2021 18:00:44 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muIHv-005AaR-18; Mon, 06 Dec 2021 18:00:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B40B1B811C9;
 Mon,  6 Dec 2021 18:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1AEBC341C1;
 Mon,  6 Dec 2021 18:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638813628;
 bh=zHUTDXXfzWnxTHaFvSpW2L0XNbOVdHY/sxh/MV0nomI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Tnx+LyrFNU/9Vvi5FBG2FmEFVQZunIyrA7BceY33+nYpWIxa+o6MqazpOp3xQY6ut
 +4LDzpPx2FXoJG3xN8c3svkItB7ogm2e/JvrN4IIs4dIm8/O+t856zmk4xGYS2Ajl5
 inhSKEjGfld+8p01/pQ9Zpk9nLonB3CwuVresSTw5WocLmlEJchvnNxAJyYtCF2KN1
 xYC5BOiJ3fFSKHKgC8ywjQzOf3vszFM+MfbIQPTf8ADLiwkDhdp8dqotCDNn33B6OZ
 Zfg/nfW9If9WjmVnGwlrLHTxk9W5CcI6Iy8qYl8g5PfWEGIosqozSWo6HUTRlRFDju
 xpLjmq68/rEiA==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, matthias.bgg@gmail.com, tiwai@suse.com,
 Trevor Wu <trevor.wu@mediatek.com>
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, daniel.baluta@nxp.com,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 yc.hung@mediatek.com, pierre-louis.bossart@linux.intel.com
In-Reply-To: <20211129141057.12422-1-trevor.wu@mediatek.com>
References: <20211129141057.12422-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH v2 0/4] ASoC: mediatek: Update MT8195 machine driver
Message-Id: <163881362422.2769299.13576953689584169746.b4-ty@kernel.org>
Date: Mon, 06 Dec 2021 18:00:24 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_100031_231519_764C6F78 
X-CRM114-Status: GOOD (  15.78  )
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

On Mon, 29 Nov 2021 22:10:53 +0800, Trevor Wu wrote:
> This series of patches adds support for RT5682s headset codec in mt8195
> machine drivers, and SOF support on card mt8195-mt6359-rt1019-rt5682 is
> also included.
> Patches are based on broonie tree "for-next" branch.
> 
> Changes since v1:
>   - remove patch3 and patch4 in v1
>   - add SOF support on card mt8195-mt6359-rt1012-rt5682
>   - add new propertes to dt-bindings for mt8195-mt6359-rt1019-rt5682
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: mediatek: mt8195: add headset codec rt5682s support
      commit: c9d57a25de53800e54969f4bf2b672b3a58cdaf5
[2/4] dt-bindings: mediatek: mt8195: add model property
      commit: 629e442761bae0c62b2fb14061d66bbd08b4155e
[3/4] ASoC: mediatek: mt8195: add sof support on mt8195-mt6359-rt1019-rt5682
      commit: 3d00d2c07f04f47aa4228700b440ac47abf13853
[4/4] dt-bindings: mediatek: mt8195: add adsp and dai-link property
      commit: 6182ec4616d6ffc046bea798c683a0dee11ded67

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
