Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4757CD8CB2
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2026 23:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZzNBuU42iUGlwdNUZ6TNIEsMSFrQ31sAf2Spy/FdtjU=; b=pcZFjT6ODBWj2Uf3WsoMZ9U5+Q
	wnjrNhZK4Djh4kOgf0jmo1OmDtUJqYUuRiqZgGSX624+NdCqC2H4VZmGo+VltHG6jVzvJqaMOmftz
	PQNZ5KW9vUW8vP6N8EucgJr2RLCCBR8NerNb0K3aNrSqwZW1xu5t1gAaKA4sImos/rewewEwlcW0n
	V6R8NwyF1+xn4n/cYKqwM6IiJttlFkhxhjQIRtcqGlu+9zYRkf5O+RXs9tecvPpLqq5kf35FXZS8K
	0JCbI+d3GGaHfXUAAXHWDX5BSmV5EunytKVxqSGV1J9NDexYqT/ZGoh2bTAXFeVdcXtV17pu6rMFm
	6Trv48EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX5Wd-00000006Ujb-2lfk;
	Tue, 09 Jun 2026 23:06:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX5Wc-00000006Uiu-1xyT;
	Tue, 09 Jun 2026 23:06:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C4063602CE;
	Tue,  9 Jun 2026 23:06:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD6B1F00893;
	Tue,  9 Jun 2026 23:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781046385;
	bh=ZzNBuU42iUGlwdNUZ6TNIEsMSFrQ31sAf2Spy/FdtjU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=amnIU6tlg9gLd5MzqFNWfclsu1Oa5zSG65TO8mdHqcvPc65EMKn5rPoDzW1xEnx/e
	 fhmCVi0NCN47EAfMA6Kwl1ArxqpgoKlw2Fei6lqNmpySkHRbnWJp74VlQJZP1rc3J1
	 sX/F9WCvaRaOALI7uzW/3TCNpTpVgcl2Kx5LCIdEx2ZzOKrgS8dhqGfy/A0v2JDb8C
	 GcQ1A6HnVH8LFQEZ0XIQrgm6hd1H4An3S4MRCjReweN8b7wuu1TAKfkjmHmmci3zFa
	 yjQSo5JW6GjT9Y9MOJpkhR1Q9zGUK/3XJs0poDVQgBceWR2VCOjPIWY2d0kmIC40OY
	 HOGqvdV9/l9oA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260609083630.1600070-1-wenst@chromium.org>
References: <20260609083630.1600070-1-wenst@chromium.org>
Subject: Re: [PATCH] regulator: mt6359: Fix vbbck default internal supply
 name
Message-Id: <178102806038.34323.14976409499713411842.b4-ty@b4>
Date: Tue, 09 Jun 2026 19:01:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1140; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DFFQY8CRAP8o+5wOCS13Mgn45pFttGsOfZlQdRqMmvg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqKJxuE5a2FqVzyXSu+sKE+UKeGeirjLsfpwu+E
 IIlUQuvkFyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiicbgAKCRAk1otyXVSH
 0AL3B/4xcZ4U5BJz83mBb7lh91W9bFHrA3hg/+NZXGf+V3Qh2lkeYPaspTo0mY6PAW+CNqlUorX
 8sq6b6NxgyGVByPYEKzcqSA6tNX2Wex29KhLaTtJCYX/48wiECYrvDxi7OtGr5Y7LqWOflE5SOX
 G20e+IhqX9wQ3tHUEqt084umVQSGcKC4U+d7S9NY+lC/ou48PrLgCHIU6eH1VQVp3i3EAzl+/JG
 seLHbGHOpCR++Vbvzgh3GSdgMLig92n0dkzOIKq5GzPRlvdmczYMP/Vg0xgDv0fJHtffTSlPh3W
 t8EXfvUSfy9NEzRtdEmZ1tFHc4mPjj5ZIfdzYGCfZR1b+Zc7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Tue, 09 Jun 2026 16:36:27 +0800, Chen-Yu Tsai wrote:
> regulator: mt6359: Fix vbbck default internal supply name

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.2

Thanks!

[1/1] regulator: mt6359: Fix vbbck default internal supply name
      https://git.kernel.org/broonie/regulator/c/9aeba1351a22

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


