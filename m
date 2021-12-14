Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A906C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Dec 2021 13:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XXfkSmtrdF2QeH/bEEXJEXWa5NxjaZDkjhjkEh37CAU=; b=cPnQy83OLL5R3Z
	jIm3rdHnPzAC+GQTudX+hvb8c15xrJO5vueVHwwhchC9ufeZwCeieWy2UFnNYQuG30VFdbaGJEmzB
	ZTRG8MRGMiS4LVSKkcFyGI/hZwqzxnhxLhrR8EXZbluOAXxb+yeFJAd+tACbyjT6r2eq3Qe6hpH/a
	3qM8kINK5Z+8cQND/Qf0N3FvKRP6tnEDTgOXw0/Br3WAFbEMeeS6ysAChWkqLzNaMk6/TlZTxJmYU
	hUSr+9olKF/PVenu0XG7iF3iY2AvGP5yenbux463gBwqHycZBCCd7urZiZpZS5wIWv5F9Pu4HbHj1
	hz/5K0iGwgkkLRO65Dyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx7oW-00E9JN-35; Tue, 14 Dec 2021 13:25:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx7o8-00E9Be-54
 for linux-mediatek@lists.infradead.org; Tue, 14 Dec 2021 13:25:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BA233614E3;
 Tue, 14 Dec 2021 13:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10650C34605;
 Tue, 14 Dec 2021 13:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639488327;
 bh=C1uJktXTIMr7sT2GFRLDAAL2YnFQrtakUNIPjjHazus=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=pBayhBOI91scR4orTqi8lR9XS5GYX9pBvTo9urfTJAaIPYF3hkmUt2d5VVrmSz9X0
 V4lJohLQjkfw7Zj0jlYRtotFOahoesgLNJhiozUm6YZJMJdv41mUV7gWqSs0Jy9oTK
 jTDv3J2C4csu8xxImqbkCadkQAql+EXOBV+rvvUV+P+LN4NYz4xEpJ0SVCLjWzJ0si
 Y7oh4ILao5VkdyVj+XYV1ISd6c3qjjb02nyWYi2T/jnvKSZ3BVguGAW7Hp+/l6slwu
 qipepkPv3OTBCL/+aQZRFH50jukBBotgzjsAQJJBO0uJ67zsTIu3+KSdHYXENYJG3i
 kKLbZqFUS4gog==
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: ranjani.sridharan@linux.intel.com, linux-mediatek@lists.infradead.org,
 Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 Paul Olaru <paul.olaru@oss.nxp.com>, linux-kernel@vger.kernel.org,
 Daniel Baluta <daniel.baluta@nxp.com>, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org
In-Reply-To: <20211209200830.145005-1-daniel.baluta@oss.nxp.com>
References: <20211209200830.145005-1-daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH v2] ASoC: SOF: Remove pm_runtime_put_autosuspend() for SOF
 OF device
Message-Id: <163948832478.2865729.8112402279770630792.b4-ty@kernel.org>
Date: Tue, 14 Dec 2021 13:25:24 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_052528_255058_7C5FF8B4 
X-CRM114-Status: GOOD (  12.37  )
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

On Thu, 9 Dec 2021 22:08:30 +0200, Daniel Baluta wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> In SOF OF device, pm_runtime_put_autosuspend() is not
> matching any pm_runtime_get_sync().
> 
> This is imbalanced for PM runtime.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Remove pm_runtime_put_autosuspend() for SOF OF device
      commit: 475b17b4a875ef31246c6a038ee60d5ca4982ea5

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
