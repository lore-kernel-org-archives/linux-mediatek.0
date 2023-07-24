Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEABC0015E
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jul 2023 12:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmCxo/u+WQHy9yVy2J3azZzE2nWC19OPkgQEis4LzXQ=; b=UabxhlNwX1SGbCtwBY720kqXqo
	5MqFoAzpxHKwRDjoQkyMzOyvBNX2s8KCkpFExfQVozI3t42Ai/TnvNF9oD7yFGqXnhxtsxgKsZhpq
	gWnw57rWvODG0rWHqR8lfI+sXz2p7ea1TA7GM0QSQ+NKdjTz4ZbVXGIwfYxb9P2jCqgmSad7T9pZ+
	q6QaB40j+11KT90ff/p0P2ct7tQzc6TxgR0y0WfZk2BpawLHz1+FfX6AocCuMKtg1H16QS56d2JRH
	8/4uS6ursPKJ0t2HCbavuBRKaOIbbHyogmLOn+y3xLRdr1hahXY0SekjlpjdWJYpC/TYYFFu8Mw2x
	yo/TwrIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNuS5-004BP4-0u;
	Mon, 24 Jul 2023 12:14:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNuS1-004BMt-2J;
	Mon, 24 Jul 2023 12:14:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EF9626113E;
	Mon, 24 Jul 2023 12:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03528C433AD;
	Mon, 24 Jul 2023 12:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690200848;
	bh=bGBRTBKOATzDrEOLC9veX6A/VYAHXhkdefmlUImW9tU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=o2scgzlSqub0MwzcjE1YF2PBthEw88BjAeDWf84QFg0ANrTZu0+TOaCqxd0tWSACW
	 JfIqaWP9UXLSbbSRGW1qnCFcf6vzvXIYXSXU2SZH6ZJxaUvi2Wt5Lpe3C36HktZZAq
	 Sd3O7EynHqvMKuoyGHjzjjvJdQlWzOnX9eURPJq0zSqABfjfJ7cqBz0R9JPBNDojmO
	 qpmo1wXfjD9pkmgthCGUSMKYJKg4ggnPykOgIPs0O+9zZnV+KLQ4BoNVG2iI5anqn/
	 XWhp5QKpbBR/MKkQg7N4uJ95xHNmT4qoayu0sGkoYFifHW7QX1sqNX8SAlmtIAhG8F
	 pcHzS8P0w/FlA==
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230721082903.2038975-1-wenst@chromium.org>
References: <20230721082903.2038975-1-wenst@chromium.org>
Subject: Re: (subset) [PATCH RESEND v2 0/7] regulator: mt6358: Remove bogus
 regulators and improvements
Message-Id: <169020084572.59430.14695443221622565365.b4-ty@kernel.org>
Date: Mon, 24 Jul 2023 13:14:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_051409_797002_DC9610FE 
X-CRM114-Status: GOOD (  13.36  )
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

On Fri, 21 Jul 2023 16:28:52 +0800, Chen-Yu Tsai wrote:
> (Resending with Lee added to recipients)
> 
> Hi,
> 
> This is v2 of the remainder of the MT6358 regulator driver cleanup
> and improvement series. v1 can be found here [1].
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[2/7] regulator: mt6358: Sync VCN33_* enable status after checking ID
      commit: 649fee5a17a7f96152fee2fb9111d9a4db535f35
[3/7] regulator: mt6358: Fix incorrect VCN33 sync error message
      commit: 67cb608838e0aac8efb48828b1165156f99c1af9

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


