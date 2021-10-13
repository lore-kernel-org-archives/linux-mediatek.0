Return-Path: <SRS0=m4qr=PB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C1AC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 20:00:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EF7460D07
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 20:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2EF7460D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RdVHkhsPJQqa9mggX4L9DQ1zYNvhFVdsj3LhIivWQI0=; b=EEjVZTZZnZjh26
	CwuujZzDpJ32b0VAuiRgBlHXdzNS0RFNyHp3f3KgYNeT2JrhY6iHo1I11l+iQwx96e7mQHf8xOxuk
	IpfSxzG4CmvSSm1iikHDgVhv2XUfhSX/rmtxCTMbrSJu5QmN+LMfR8sCLMS80/PGl5Ke0Ee9BZGgg
	RwCh6rjcpC7gQWw93k0rRRk6/j+lq6RqjasRM3zH37UA7oZIjh69VQZkOiB71nrAjUS56UMSyYG5R
	LhhHk2B3L1vuerVj56lbbwosBCdGmxlZYumJ+nanC/4i0B4czmM2/dbkHUYnVx6TvI3ANq4PK/akX
	1eqWuJiDQ1r2jJ/StWjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1makQF-000TvE-Cm; Wed, 13 Oct 2021 20:00:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1makQ2-000Tt8-SJ; Wed, 13 Oct 2021 20:00:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E9393611EE;
 Wed, 13 Oct 2021 20:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634155206;
 bh=om0HazlAjz/5nUCLR5kLqslvvq5C7vKYnMkWeQTOsBs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EmI2cldZLk7dXlFCA6+ucpCFWa7lvxlNiJZYbWmw92AuUSrCbPFjjkciTpiDcIi2x
 4w17i9RqXDo6Ai1crmQVnvy0WmPbTGahMUV03YqK1H3ifwtkIpkFARIPGyxFkNBwKp
 y2VLt3mCy6NIy3eWKcMda9HgSEWEiRIqGbH/raO1kqGAD3L2GjVFJOJ2GuIogxquv0
 Qsac8OJXZLPOOFrOuq4d7EnQjbzuBLZzTe5UV/vf7fm0x9lP8vf+EzRHtc+fN1FdlU
 gxt4hqqYJ0eYO7Hsl90fSO52bLW1Y0n3RvXZxCDxGaeMyBfAc4kytdA2g3cH7S5RwW
 Ada7zRIhVddFA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Tzung-Bi Shih <tzungbi@google.com>,
 linux-arm-kernel@lists.infradead.org, Takashi Iwai <tiwai@suse.com>,
 linux-mediatek@lists.infradead.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: mediatek: Constify static snd_soc_ops
Date: Wed, 13 Oct 2021 20:59:48 +0100
Message-Id: <163415517073.1358186.16264637881632852203.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211012205521.14098-1-rikard.falkeborn@gmail.com>
References: <20211012205521.14098-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_130006_958499_85B86E81 
X-CRM114-Status: GOOD (  12.62  )
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

On Tue, 12 Oct 2021 22:55:21 +0200, Rikard Falkeborn wrote:
> These are only assigned to the ops field in the snd_soc_dai_link struct
> which is a pointer to const struct snd_soc_ops. Make them const to allow
> the compiler to put them in read-only memory.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: Constify static snd_soc_ops
      commit: abed054f039a69579a21099dbb53aa008ea66d03

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
