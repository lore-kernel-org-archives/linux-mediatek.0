Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C438DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 17:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LY3i0WzR4QPAvOdE5+CejxE7xAPiSFx2dp1Lgzfx/iA=; b=h+M4BMqJOr2vjZ
	9q1A9SqIavWqwgn25rotm+XVCA9Gx7JL2soLPpAJmi+2+38aSpmZhZ3GOWFi7xZ0Yw1JD03RzpwTb
	eQv2SgaayTmYF3qviQKh7TM4bqjH34u6D1zNHEaL9bdnMiPcR8CHhOwLi/WKxFv901mn070J7jWAV
	tmYCepfEeGY1C1aZKWLMNbUtZS64456pLSs2HxqXaBe3605oWODcI9jdIntM5gaVRqgsH78YOosgg
	GvcQgNHxYir4Xs6hR0qq4AAD7RUBjMLsOduKNWpg4VcavKJc3M8rzjeS63hL5EJMNbNFD/ikTzUGD
	s52wk6ROr7lCYHQ/Shvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRdkh-005Zgp-NM; Tue, 08 Mar 2022 17:36:03 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRdWE-005UrL-2p; Tue, 08 Mar 2022 17:21:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 93DC5B81B8E;
 Tue,  8 Mar 2022 17:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C297C340EB;
 Tue,  8 Mar 2022 17:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646760063;
 bh=VXtXZwmTg2CbEhaflPUS8x55Hns993/Kt31uJMvMLc8=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=tW64Ce1U/EXWJOzttKG02pKqy8yiAZ70nH7BuHMz+MNAdF4xKAk9EreguqHoWCcRM
 cjwQqF3L4KsOt+qTMEQCwZHJKe2t+FhbZoaQ7fYpHuydx9MDYwf1NN0aaP2ymzJNV8
 3Ij3yHlCb9vnWoC2lSpDTQIgrVNGiZ1Z9WaJ8XY2VvziCg8VEqSwZ3JHbPlXW8s9LL
 tjHJa3rfNX8GmTa34F07Dej2TMTcWG75LyNtEGt5FL+8GxDv3FjqwptnClpjgtxUds
 TphFgFT8MywsNP4ofWThY1I9VFfw6XAOKV1ONQTUheu8WCHrh/Zkfx9cv6mUZ6QdDl
 3kwuI5Kcm61Ng==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>,
 Miaoqian Lin <linmq006@gmail.com>, linux-mediatek@lists.infradead.org
In-Reply-To: <20220308015224.23585-1-linmq006@gmail.com>
References: <20220308015224.23585-1-linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8192-mt6359: Fix error handling in
 mt8192_mt6359_dev_probe
Message-Id: <164676006096.54315.8478351478662604607.b4-ty@kernel.org>
Date: Tue, 08 Mar 2022 17:21:00 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_092106_322063_4AFE2A6B 
X-CRM114-Status: GOOD (  16.16  )
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

On Tue, 8 Mar 2022 01:52:22 +0000, Miaoqian Lin wrote:
> The device_node pointer is returned by of_parse_phandle()  with refcount
> incremented. We should use of_node_put() on it when done.
> 
> This function only calls of_node_put() in the regular path.
> And it will cause refcount leak in error paths.
> Fix this by calling of_node_put() in error handling too.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8192-mt6359: Fix error handling in mt8192_mt6359_dev_probe
      commit: e45ac7831ff3e2934d58cce319c17c8ec763c95c

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
