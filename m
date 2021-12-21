Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655B7C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Dec 2021 02:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ei6VXmU9/oxAnYS0UAmVrRNKA5Ob6EayLlxF55y+By4=; b=AnqgA+zsOOtYGm
	kHFyVQIeHDEiWIT9OnlQVWKK0FnF33CRPdAxhdQYwOYHtCty2ikRsAyLGKy5dM7uw1mjSC0raMptR
	fTfHJlqlnBOBz7BAiFp4at6MVINoxT9jjKw8VU7Hf8j2/8XXCriiPqFeOcDCrhEcrrdKIHx8+oJW3
	FrHwn4pOdQ+zvXXaMkCRu75Bf7nrHK6vgIicDh4wcnyoqd9WF1P4QQ1dvIsebg62oKIkbKXkJH25e
	2/bmH+XTfAiut2vbFODja/xYzNq3lLUsgbOYB6thspk4815ycFLNjvt1LcLC/ECx52FvSCLYwNHL6
	YeAFVbppZiDvyoZYhxMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzVEn-005Huk-OU; Tue, 21 Dec 2021 02:50:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzVEb-005Hrm-G0; Tue, 21 Dec 2021 02:50:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8945F61365;
 Tue, 21 Dec 2021 02:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F9BC36AE8;
 Tue, 21 Dec 2021 02:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640055036;
 bh=9FyG3W5ip2zv6ci01ldf1DOdvGhwMGzdqpxjmFLSxxw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=drh8QKpzxuAT25mPaCSbOhqZK7c8+1M02Rvw3TLmlMOzg1ARUcZ9T/J8XxiYRiW03
 IDmixepuqCaZX7Ufo5qYKU7qrr/XjLS27l3+y+h0fUe6IQcPXpdCDIls8Qx7Cr8qr6
 5apcwzda1wtxxvt9JthZU3PWxA70TgOGaanGHi0owlBOW3qVydPON77ZbGBO4XZ03Z
 3Q4vG3kIdqJEgFSrDIhakR9JDo4mJ/Kyr4TZnvfTGOqvhLt8cDVRZNvFl2KN+nm+Li
 rDxCLMwnaL/f6B0NUvtKw2W5NV30I8HuwI7FUKTVTqoSQ6LDz7ZeMVVQdRSdQz5bcD
 j4UtzYi6E/bbw==
From: Mark Brown <broonie@kernel.org>
To: matthias.bgg@gmail.com, Trevor Wu <trevor.wu@mediatek.com>, tiwai@suse.com
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <20211216022424.28470-1-trevor.wu@mediatek.com>
References: <20211216022424.28470-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: correct default value
Message-Id: <164005503431.2647762.14895672771692403341.b4-ty@kernel.org>
Date: Tue, 21 Dec 2021 02:50:34 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_185037_651988_6E5886C2 
X-CRM114-Status: GOOD (  16.21  )
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

On Thu, 16 Dec 2021 10:24:24 +0800, Trevor Wu wrote:
> mt8195_cg_patch is used to reset the default value of audio cg, so the
> register value could be consistent with CCF reference count.
> Nevertheless, AUDIO_TOP_CON1[1:0] is used to control an internal mux,
> and it's expected to keep the default value 0.
> 
> This patch corrects the default value in case an unexpected behavior
> happens in the future.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: mediatek: mt8195: correct default value
      commit: 30e693ee82d20361f2caacca3b68c79e1a7cb16c

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
