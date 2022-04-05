Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B111CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Apr 2022 09:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nzw7kDdOYkcGLn+F58bXTzUEN1UTkKEbYMmcCtW0HFg=; b=hvXd5TfVj2sq41
	Y7jh0ZYpoZlWX7rw8u6o960EzD5E4SaBJZjtjsHXvQJoV2cWblQ6bMue2cFb0//qzuygDIFEcJbdg
	yNhTlgNDq3JpWob4K1RYBgJbhj9MSLvwd63q/0nDH+GOKvTQdY2QP//ODrlcIdw0EONQHEkZ/M9I9
	iStgPjRF+invNeFs+iBeDp/fLXRzY/Dw1QrU+P8xFz4dpUYIz6y2oSUXIBNcmXyITN9N8zXwScKoM
	8mMLOWqLqAA5tGwXRohcctBT9HuBcYXsSP717hP0NkFz74HV3k5X0ssRpDmDE3zx/LisAyOBO/SdW
	+XFGk20cKoWqYZV7w/jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbfY5-000QQk-BZ; Tue, 05 Apr 2022 09:32:29 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbfXj-000QEE-6B; Tue, 05 Apr 2022 09:32:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C840EB81CC0;
 Tue,  5 Apr 2022 09:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E008C385C4;
 Tue,  5 Apr 2022 09:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649151124;
 bh=GjmC2BEcN0KsKZ7ydEfVFphIGpjCxpDNSpkEEa64urQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=nNsuW0ERMiz7rPDxZB8Z1DW5F1ZljqyZDRU3LuRnGbPOfIjyDWGqnYMItXQrFk3oQ
 SL7CUi6P1TQa/VNvIB+wYnsmV8bWHLOT382axLRhlgKaj7kAE7tUxO/34zp8/J7fnF
 IQEWaMWdTIzBMBA8Ttg03eIbBiuqeij0gayJgsogN8eqH8nXGDeEyPQax3fWtqec11
 RMK7Qx4jJ/hxsIqqJTC2EFIMx+QPHbQmoFBr54tLn0OZNBWoqwX0azrqZ/sYX4FgD5
 Zi1xC6asCUFRNOQq5ddKU66DrzQD3IIq8LA7UcbI3KF566PecFxrJyzcVuKfPq8dyh
 +NX9iwxMFKwZg==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, johnson.wang@mediatek.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org
In-Reply-To: <20220317030402.24894-1-johnson.wang@mediatek.com>
References: <20220317030402.24894-1-johnson.wang@mediatek.com>
Subject: Re: [PATCH v2 0/2] Add support for MediaTek PMIC MT6366
Message-Id: <164915112290.276837.17651997512675348293.b4-ty@kernel.org>
Date: Tue, 05 Apr 2022 10:32:02 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_023207_397497_666FEAC9 
X-CRM114-Status: GOOD (  14.81  )
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

On Thu, 17 Mar 2022 11:04:00 +0800, Johnson Wang wrote:
> This patchset adds support for MediaTek PMIC MT6366.
> MT6366 is the primary PMIC for MT8186 and probably other SOCs.
> 
> Changes in v2:
> - rebase on Linux 5.17-rc8
> - change subject line
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] regulator: mt6366: Add support for MT6366 regulator
      commit: d077002c9d07dc6f64d07a362202a1e1081b2f6c
[2/2] dt-bindings: regulator: Add BUCK and LDO document for MT6358 and MT6366
      commit: 417dfad7e4f0501853e05a46742a4e47075f034c

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
