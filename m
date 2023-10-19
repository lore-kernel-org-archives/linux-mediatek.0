Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711EBCDB465
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 20:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fGbK0zpz4BOvoojDKohZzYfEozLie2YXwdNbZDgz0dc=; b=oJke4m1Lm4tvM9l0KyrGyw1w6Y
	Z/uNe+G0IO8pKu5A0pSUQT/WHW2ITLuF9Kz5w/K6SzklKI+873sDT22bMTVJVujGHLuwR25ZtXL4n
	0ZRTIz63CXBqEPpUNxqnrtxl+o4UIRlvJr3h+5qu7PK5WqecHMlpKUHCy23uGHaN2QQ6GrOlev0EK
	g2JJ/bOTfYCy00f3/3h/nM6ZHCLS7Xk1UL731OE6SIWrNm1NhV4Uu1FnVYWVw40cIWjKwrG3gC/OC
	yfPzZVUbYxpWvw0i5T/AL+ktF85Zcz51Tfq/cvX4sQku9z75MrlrCMOxJUUUmEeIhHcFOeJuHzM6k
	3PVGinkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtZvv-000hBt-07;
	Thu, 19 Oct 2023 20:47:55 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtZvr-000hB2-0v
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Oct 2023 20:47:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id CE4B2B82C3B;
	Thu, 19 Oct 2023 20:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B65C433C7;
	Thu, 19 Oct 2023 20:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697748469;
	bh=Xb8ykcuVXNXGLau7z0fj9oajuN6SQh3G7Mj8m91Dv94=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TWoVxoim6NNp6OOszT+ei/DEY6Rvy554zghlaTs4UpksXTep31g/IWOc4vLSYi8ZE
	 1EaslWKC+Odf7Opuq1Jqq3LJf43BibPsEbaxVC11SFGbI9tN98CzzMBWr9loovTxbG
	 k53aaH1o7rEXQqlPBfa5CAKbbD2ZfA4/dSZfoSOQKHHn1W3JATpKYO8s6rAt1ECY9b
	 NEctmBdbuVut61apvmWjEQktpIvfzetJcdEgmpDNB9poYgZMyus64qAuZ/Wy5oowwt
	 l2sXqoY4JZJTExCkunb4pHPEyAxRBoW53Zaie9STZV7oAuoIrTKhKTruIsrN7n3iGD
	 aZvwLqSOABEuA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org, 
 angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, 
 perex@perex.cz, trevor.wu@mediatek.com, jiaxin.yu@mediatek.com, 
 xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231019100322.25425-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20231019100322.25425-1-xiazhengqiao@huaqin.corp-partner.google.com>
Subject: Re: [v2 0/2] ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: add
 rt5650 support
Message-Id: <169774846545.93224.1171196773910297821.b4-ty@kernel.org>
Date: Thu, 19 Oct 2023 21:47:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_134751_505558_F1ED9325 
X-CRM114-Status: GOOD (  11.17  )
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

On Thu, 19 Oct 2023 18:03:20 +0800, xiazhengqiao wrote:
> To use RT5650 as the codec and the amp, add a new
> sound card named mt8186_rt5650.
> 
> Changes in v2:
> - PATCH 2/2: Modify the code format in line 1058
> - Link to v1: https://lore.kernel.org/all/54ec6435-e69b-444a-a31a-c878a4b3564a@collabora.com/
>               https://lore.kernel.org/all/8de0772b-3145-44e3-8174-702c7dc729bb@collabora.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: mt8186-mt6366-rt1019-rt5682s: add RT5650 support
      commit: 8a79ff9e46beee03dfc2ce9cc80f7090f57d64cb
[2/2] ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: add rt5650 support
      commit: d88c433831015a4ad4597885cef8f048808cd94d

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


