Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A9FE7E631
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Sep 2023 12:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tVpYREGcZJVanM5RfakAjfqIDCMaPtiV1Bhso93+I4=; b=aMiNa+jAs0szXp2XHyPSklGCb5
	ZxkcRy0cJh24NBJ1XhsWj3wNrcb8By8s/TctXWGWHMi+KCsHu9IDQQfDYejXkjf269hXhdYLQGvqS
	sh1IuJEPxTku3Nac7nFlRE1Gm5H78r0kV6+BOcG6sY+W+VZTLfya2mV6jISGyGAgtOOIKtbjItoY9
	Pf1aBYhaqVKwpb0WWTd3Nhqd3T/Up5JDAVPK4+ovci3dSLd5p41kxcVC5RS/eOzvfuU+L7R7Tp9vI
	lcBX463BiLLf4IZC0c4XGdImChwoFwRL7FD/ndK++X23Nj+jSFoOzJTPTwoxyZid00pm62i04cK7n
	wn7K/avA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql7en-00GPl1-1f;
	Tue, 26 Sep 2023 12:59:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql7ej-00GPjf-2N;
	Tue, 26 Sep 2023 12:59:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7207A612CA;
	Tue, 26 Sep 2023 12:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96DC6C433C8;
	Tue, 26 Sep 2023 12:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695733152;
	bh=UdXp7/c8ut306XYvTzfbHKmn3lSMCaBtkxOMszStqKE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PZFvLk87Q413q3LN6ydWJV2pQrGIQ8xU9ZpkCa3MIYBHcC99H3Q/XXkFEacqtgd4r
	 HVn2hYeXxVrfj4oAtTKhkXA1oOJD8ROYcZcHbIVNWTa9oZ5lOBLD0q2pGGfA5u5g34
	 /AuCwAEn5iMDMKbug9VXAp28nTpfDfXItO0s9jQD42Ub7eFK7di0RCUhMBwGCSEiuw
	 sT04zdKqLIr8WnTKuBmf2IKZd3ytZwA2I8/AI/OOxCUaB2IsyQ4A7GIxZAQd7dUMXH
	 oRYO28D/hNuAucWeApr60xMs/Xxvs05EFBc5WGCZS1N8f2BQlAdPxhryMIL7WmS33E
	 zkzZAQ2SZuk3A==
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20230913082919.1631287-1-wenst@chromium.org>
References: <20230913082919.1631287-1-wenst@chromium.org>
Subject: Re: [PATCH v3 0/3] regulator: mt6358: Remove bogus regulators and
 improvements
Message-Id: <169573315033.2623509.11014819361960340290.b4-ty@kernel.org>
Date: Tue, 26 Sep 2023 14:59:10 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_055913_851258_8B9D2D20 
X-CRM114-Status: GOOD (  13.02  )
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

On Wed, 13 Sep 2023 16:29:15 +0800, Chen-Yu Tsai wrote:
> This is v3 of the remainder of the MT6358 regulator driver cleanup
> and improvement series. v1 can be found here [1]; v2 is here [2].
> 
> Changes since v2:
> - Merged patches dropped
> - Fixed up pickable linear ranges' selector values
> - Collected tags
> - Patch adding missing regulator definitions squashed into patch using
>   the definitions; recommended by Krzysztof on my MT6366 series.
> - Remaining dts patch split out to be sent separately
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/3] regulator: mt6358: Fail probe on unknown chip ID
      commit: 7442edec72bc657e6ce38ae01de9f10e55decfaa
[2/3] regulator: mt6358: Add output voltage fine tuning to fixed regulators
      commit: cf08fa74c716cf20e5038d1e7dbbd7dba1b76062
[3/3] regulator: mt6358: Add output voltage fine tuning to variable LDOs
      commit: 017c6658fd59740f9845ca0d3369ddd778e3e0c0

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


