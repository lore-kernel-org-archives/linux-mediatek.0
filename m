Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FBBC87FCB
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Aug 2025 16:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=psdLy9YXXn7PjtqX52VHQyf1TMbbni6fpD1uTUd1Al8=; b=m1Aq/8rk01TxK8AZr6brysixby
	Pqd5SBVrBYzclAE5xvl5A0QgBcbx6JLjqQjavWD/yvWbWFaK1+1JYR45zaBjdgp01Ko2tjmEelCi6
	ymjmWwXxgEzP0vthAo2lFuli9UzURStHJEmkVyzAV8shfnbhjlGCUbo8bIBC7mcXBzyRzNRTaFGPx
	HktX/xtsVSj6p/VbH/opa1WmU4mu2A5VG/L0PVswsrmf1Y13hF87uiVuJEvY3ZcrhsseTDj0slPUT
	wu3KyNtDg1XusYvukrj5h728gDt9FRfy5GUdyJpB/+X498q1Q/m82xdJUo3Dq3V5FhRDliwdiMYB2
	7O2F0a0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrjT-0000000BJbL-2jTx;
	Tue, 12 Aug 2025 16:20:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulmoM-0000000AYm3-1pSU;
	Tue, 12 Aug 2025 11:04:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1567DA56C43;
	Tue, 12 Aug 2025 11:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9917C4CEF0;
	Tue, 12 Aug 2025 11:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754996696;
	bh=RRxOCBSxXivjCJkND/Xi61rfzI5zyvHNSkj8HZo57fo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gklnfuVwqJ3+JsA3f24CArOMkooYeMIKHjlDkJqkKeJEt02h/O/5zYiP+K+hFaTko
	 4lzn8pyvTIvMHAZ9+Jh8Y57BGs7xGNhZrvyYaZ0i0R65FJqByZdB0I0u/8LHikGvud
	 53gPJARQMCSzmk/R7C9XsucJFW3ZfXHJLMWr2sr16D7hPsQaBzImrOa7TAagnqQdaa
	 yWoUrhpgyXtbjypMev30B5+Wfutsc0JtPGExclDxBiwXoSH5mod/Wsc31T8HK6P72s
	 aWGYYF6KEB6Vf8FfcPXxZpfuXeLlrSQoNJvCpZxKFIHpUjhq5NwW1H6IZ3L6L4imUG
	 7JniHLhNU2u2w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Terry Cheong <htcheong@chromium.org>
Cc: Baili Deng <bailideng@google.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250723-mtk-hdmi-v1-1-4ff945eb6136@chromium.org>
References: <20250723-mtk-hdmi-v1-1-4ff945eb6136@chromium.org>
Subject: Re: [PATCH] ASoC: mediatek: Use SND_JACK_AVOUT for HDMI/DP jacks
Message-Id: <175499669456.16031.8547433353849911809.b4-ty@kernel.org>
Date: Tue, 12 Aug 2025 12:04:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_040458_544537_4BBAD587 
X-CRM114-Status: GOOD (  11.69  )
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

On Wed, 23 Jul 2025 17:20:11 +0800, Terry Cheong wrote:
> The SND_JACK_AVOUT is a more specific jack type for HDMI and DisplayPort.
> Updatae the MediaTek drivers to use such jack type, allowing system to
> determine the device type based on jack event.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: Use SND_JACK_AVOUT for HDMI/DP jacks
      commit: 8ed2dca4df2297177e0edcb7e0c72ef87f3fd81a

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


