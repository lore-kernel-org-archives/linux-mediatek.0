Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4FFC27C55
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jun 2024 21:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WOlpLQ2G/JrxkWOksWA+ZHCRe4n/xv4qYGk5ccuRfC0=; b=hMeAFtiPsLMarvsv/6StzB1Tx/
	tNU85M8mEduNlf30JjgVEOCmOfZKbzNDx0lSW1NSOMxKVGaOLzmL+z0VgHMgZwQK8oQt/Rit6nYOH
	/h/782MCJNjOBg+w5w6+DTxdcl3TL7SaKrXTsmsUcsqIq3PtZbOZ6+zbU/LdvU31nS846WGmKmFf8
	ucYAZmadSemr9P5PdYzmDjNPKcmqCB8IxkJ1eX4IiKn+t2TYDA8HlHx+x4i1p6OsaFxXuwQ/sOD5u
	brekOWfbuyATBRIxMxwiUDVC5DX/o8CPkiorVwfr80N2Qcm/ALMzCZ+iX+QW45ZWnUOBmfWSSPpH3
	EwrZjLBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGmot-00000006ZPK-1reL;
	Mon, 10 Jun 2024 21:44:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGmop-00000006ZN0-3pbf;
	Mon, 10 Jun 2024 21:44:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5F69B60B6A;
	Mon, 10 Jun 2024 21:44:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78913C2BBFC;
	Mon, 10 Jun 2024 21:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718055887;
	bh=Yq1fJAM7TJWvAOIEFxNG4hN4+EqR+5pk4rau/PBxoRs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=a1iXrHE/BKuNDrm+Sp1K/Ct8YZb/la8YIZTOAQUJPhe2XXDboTko82d37wJx5vge0
	 YcTeEz+hGWjzREYDX9/rlL1vtP1jiR/wAw/pBQCWP3hwRgtWepRp4/ACFF5dBOEcZj
	 QcIjCj1SapkMPKL28OZMu286SnHADhTd3LV3PNhnfy/lUzFMQF22+MTbhy0n6EeC/M
	 w4+cYa55P0SqKoHxdIdOX7RJpUmCmUQ27ueXM3Shx0XimxWhnvSrqmL4JmZhHSMrCR
	 2U/CKBn0CJ0OW8foY+F/e7RVFNuCzi6N05OdQnKEcpDR8RW5fjKTZSDEVp1TIcljy6
	 /B/JUS1XAZsXQ==
From: Mark Brown <broonie@kernel.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
In-Reply-To: <20240610-md-drivers-regulator-v2-1-cf39106d7e54@quicinc.com>
References: <20240610-md-drivers-regulator-v2-1-cf39106d7e54@quicinc.com>
Subject: Re: [PATCH v2] regulator: add missing MODULE_DESCRIPTION() macro
Message-Id: <171805587951.166318.13582723419199956307.b4-ty@kernel.org>
Date: Mon, 10 Jun 2024 22:44:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-4c370
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_144448_058535_3C76CB04 
X-CRM114-Status: GOOD (  11.46  )
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

On Mon, 10 Jun 2024 07:30:51 -0700, Jeff Johnson wrote:
> On x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/da9121-regulator.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/max20411-regulator.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/rt4831-regulator.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/tps6286x-regulator.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: add missing MODULE_DESCRIPTION() macro
      commit: 8a2744f2955a584188a82d631937aa365d4ea966

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


