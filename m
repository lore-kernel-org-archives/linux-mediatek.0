Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BDBC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 14:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sRRYK/U/CJzk5eMXpf6INDdoQGruqkss9pGzO0PlvwQ=; b=dk5XhSnvnAkROReJZeNEd5byIa
	PvROVXaQ1MI+OCn1LtCqrP0BN+IXuIrDev7a56QFtQFP3Nv/CHMbqodoWUnvx4YVOVC6BYEt3NjGN
	UnHSnCDpS1TGQoUr70lNOg+JkNpNnnqmLN37GVd+VZKPrrBv/GwA4IdC9SdK8PQhBuFKTzX3r7Fl6
	8mObhiji7pDhD824Sfuq/4EP7bHWU0JakkuYxN6GtZ853y16a1IInFsBLqbxostQY4sB2Wfw85oue
	mGOTHWQCC6llwNS1qrSbeICVUsvDHmhSbWT1GbEE38aNRDdNRI69caHVRXwXwN5hOiHc36qnmlgE+
	hTBq8WJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyZgS-00H25E-NL; Fri, 25 Nov 2022 14:28:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyZfN-00H1d0-6K; Fri, 25 Nov 2022 14:26:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 84EFA62478;
	Fri, 25 Nov 2022 14:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1007C433C1;
	Fri, 25 Nov 2022 14:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669386415;
	bh=JKtC7qtcSxIuqkmHYKE7URD9FuSd5HE3xVKxSH1HLmI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=boEIeSQ60G4VOhUzILoGxqAFKjsRD3RAa89jJdeEiMtSsb5jtOkjlljXyeoUjrwaC
	 rVJFj3zAkyPfLGc3KD5KThRNL3ilM/lYEXKlKcprXpX5mtBV+/xj+gewBL4JX+ikTf
	 s/GcOZ4EF7jjYnPhoGa+ZMYFDSw+4zqYQfVoEKF/id5m5tAFJZjO6iPkZXG6UqtvYr
	 xCH3+wrJahNDLiiSG2sE3/JCOgfsnbTQ3a5ygBzBVi/yDtXdP6bLgfgHpyJDp7ViEb
	 qlEX/8df2nk/Hb9uCTlD9Qj+XSWBRn2C8dA4OdWa2xxv3Jl84jQ4a2YpIPv+KeZ/1p
	 77AwQzFJdGxzQ==
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, angelogioacchino.delregno@collabora.com, nfraprado@collabora.com
Cc: linux-kernel@vger.kernel.org, ajye_huang@compal.corp-partner.google.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org, chunxu.li@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
In-Reply-To: <20221124023050.4470-1-jiaxin.yu@mediatek.com>
References: <20221124023050.4470-1-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v2] ASoC: mediatek: mt8186: Correct I2S shared clocks
Message-Id: <166938641371.506633.11848933919826451690.b4-ty@kernel.org>
Date: Fri, 25 Nov 2022 14:26:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_062657_308240_01E3835E 
X-CRM114-Status: GOOD (  12.87  )
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

On Thu, 24 Nov 2022 10:30:50 +0800, Jiaxin Yu wrote:
> In mt8186 platform, I2S2 should be the main I2S port that provide
> the clock, on the contrary I2S3 should be the second I2S port that
> use this clock.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: Correct I2S shared clocks
      commit: 248579fc9a4f3bf36e7cfe9f6a354cee0f9848dc

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

