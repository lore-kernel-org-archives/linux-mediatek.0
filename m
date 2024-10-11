Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB7FD0D7BB
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 15:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4pZwJ+zYyOUZImyfFc9FCXpk5VqyzLa8edO4uO5wVk=; b=l+64OqXXOHhIRUjuv9atOAqFpO
	OyD+aE3zq+ZSz1vrogcVoe9DQ5TE4vyFCAd07E6Kn4mjtQL/uCv36Mpbilr3U+lVT6qYqFk0qgFkG
	vXTRNGR9ZKCrhQZSQDqDmp+tjGVEPNZE2VD4Uk5JhFnMdLeCxSk2f8m6Mq2i6kLdeKBNzIKIsjiQ9
	CmX7xser6pJo1Q9FnnT9jrl2iVBuihI5IQl8BgvfKK6FbYe9wsQOsTH8H88QWyHMUz3GGa7tpcXd6
	q/tm68DeAbXstWdP+uKkeV4uqc5TxloS0f/CDfPamlTWaoO9KGxOdOjqJ4i/7SgkNNImCIfh4gfdo
	Fn6yE9Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szHZM-0000000GnCi-47of;
	Fri, 11 Oct 2024 15:28:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szHU5-0000000Glfk-1iG2;
	Fri, 11 Oct 2024 15:23:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 82A7EA44A41;
	Fri, 11 Oct 2024 15:23:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D08C4CEC3;
	Fri, 11 Oct 2024 15:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728660196;
	bh=VxMYsiMGxFdOggv+A2yXHzsko1My1hLKFoG5O1Jw8Pw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=inwKbYmse/jNerPh8/BxmbXBw54gwkLiN0CX2N3bInMxFomMNQlAz/kcymjXilMgn
	 2kyXa6AbyvtEINqUV2L0FdRbJ/mLNLVoIsuaYaGrD+BxlDXYSZPH613MsFXpq6tWK1
	 um4w7+atyc2auMd1imP4yCzWYVhHIQu+VHV7AU6BBl3p53p3TN5/z3RZ1swfI1cCmV
	 IiCzFbhayPQCdJX79ItcbMXeR5lOkWR7ZnImJi568bfdquZJJepmNbGBy/tFvAf8xw
	 6ybUE/Diry/rJbWaGG2q5UR3nkdiv7Aqn50QfAF9sJY7FQ5t/mmac4rfT9qUF4Gti1
	 wBloIPz5T3O5g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 Tang Bin <tangbin@cmss.chinamobile.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20241010073547.3720-1-tangbin@cmss.chinamobile.com>
References: <20241010073547.3720-1-tangbin@cmss.chinamobile.com>
Subject: Re: (subset) [PATCH 1/2] ASoC: mediatek: mt8188: Remove
 unnecessary variable assignments
Message-Id: <172866019355.3915434.3492314512247747487.b4-ty@kernel.org>
Date: Fri, 11 Oct 2024 16:23:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_082317_550810_EBD2E144 
X-CRM114-Status: GOOD (  10.10  )
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

On Thu, 10 Oct 2024 15:35:47 +0800, Tang Bin wrote:
> In the function mtk_dai_hdmitx_dptx_hw_params, the variable
> 'ret' is redundant, thus remove it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mediatek: mt8188: Remove unnecessary variable assignments
      commit: f5a0ea8936a640d8229d5219515141fc496ec5d8

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


