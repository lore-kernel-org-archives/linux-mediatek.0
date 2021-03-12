Return-Path: <SRS0=zPgu=IK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397C3C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 20:41:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8A3464F4F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 20:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8A3464F4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:References:
	In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dnKIX7Droh4PP22XjKFt3NAgOErYhoZmDXeMMxjb5oI=; b=B9r4gOdGCCIMkgcL5sHbXcXiV
	S7VQMAIqXJ27druqIag2QCmQKhTH2YP+racKZFmA6Cl+smVzMUyz38Eg6mrM9cNdccYvxsY45c4f+
	zxH4pQjIDkcfqq8RoO7fPs+cfOXc0VY6QOTdYFW90M3bYTd8FMuLZ92Iihw8PKXAmxbVlOy5wNkfx
	CjQKWYe613hO9ID08QcCgOLP4d/HpcbgrLdzx6GhC3uKJTIAcSMdXObkoCj2NC4DDBAs1l25rdtSf
	n/q54RaAlt3Y95p8yRg3yUjGNg/iKHAIioaD4kHC/cj06q8n/Fw59itkLyFQmzukCAk0oAVbteMmO
	m+m/14TSA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKob7-00CMRO-UQ; Fri, 12 Mar 2021 20:41:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKoLa-00CLEs-NC; Fri, 12 Mar 2021 20:26:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9BF6E64F86;
 Fri, 12 Mar 2021 20:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615580721;
 bh=XM03Gt6hwnAQA+iUKmdY5gbRmhZPWBo/y7O/aK8RnLI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AASoTXXQed8pOwRYePS/BplyEU4iF/DWiw9dztQ9fY77nPOvMd3JqW88ovkxaHKSS
 QWYdBSJIWrVWP2IfUUPcXhKpRi0JtDjvIR6hy92HzXiwH/sRvK4/C47DWXOSXRrwJE
 +s3XoTTFqZaw3vJKsgciSSUmzY7CVDgi/oWN18rqMjCwCo+YcK/4tx3uxususyvgSi
 9WofbZ7sEC5BiEn6uASFFbIW2krlkSo8KUC7iBuFyklxyHaoVRSEF0L/mu2oiz6j6e
 Ze1+vrAlbAQzNNj/GY1ssut9EeH1VwRITv0oPMD6LDaog5gdhgnFObsoTTcj8eNVSP
 8/JRPfCjEXFVA==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel@vger.kernel.org, tiwai@suse.de,
 Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20210311004904.121205-1-pierre-louis.bossart@linux.intel.com>
References: <20210311004904.121205-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: mediatek: remove cppcheck warnings
Message-Id: <161558062957.11113.1173652950898922023.b4-ty@kernel.org>
Date: Fri, 12 Mar 2021 20:23:49 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_202609_024350_3E28AD34 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

On Wed, 10 Mar 2021 18:49:00 -0600, Pierre-Louis Bossart wrote:
> There should be no functionality change, this patchset only fixes
> shadowed variables, prototypes and removes a useless assignment.
> 
> Pierre-Louis Bossart (4):
>   ASoC: mediatek: mtk-btcvsd: remove useless assignment
>   ASoC: mediatek: mt2701: align function prototype
>   ASoC: mediatek: mt2701: rename shadowed array
>   ASoC: mediatek: mt8173: rename local irq variable
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: mediatek: mtk-btcvsd: remove useless assignment
      commit: 2e5e57f085a3243aae7e4af88dc2c40e5ff4d3be
[2/4] ASoC: mediatek: mt2701: align function prototype
      commit: 57f1379e77a7432759e2f35b720c71863e2d83bc
[3/4] ASoC: mediatek: mt2701: rename shadowed array
      commit: d9cdc1335622866c52a463325b3aaea9844cff1b
[4/4] ASoC: mediatek: mt8173: rename local irq variable
      commit: 14667403a5631ce2fd2935d90c6d36f7975f61f3

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
