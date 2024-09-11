Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30A3EE57C0
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 15:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cjrvYaOKlSR5bbBeaM/aZ0sXBzuxccxBZHoS0yCU7+Y=; b=v3d/OOVXv1mmjNJbE4w2gmRtk1
	7l1+0Hs7Ivexr30QPDm1SWtT3EhAl2JXcspj9/acbR6Q+HXD1+PYms0ZYU+Zr8WxSbxCmo7rV/Mkc
	C7ybw8Teq90Psup2qDaPF0RLAe0RN2Ll1SdJn1QdKeHobo+UwYr4o14xN54cHvpl9gqAxmEFySJ+P
	31k/MSZvml2qNloNTXQu2pTNPVndn8v+ENiqDl+WpkCZRGNgeJnAG/YEUQtIuuFaUjFqx2mDE2xBo
	m3r9MytvQ8RrUCHnn1mTx+qBpYJwJzVYCvUHPAPtp7F2RpPFevDDKE8YdQLyPRB0EBkQAtjj1lwO6
	Ds5uToNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soP9y-0000000A7GT-16CL;
	Wed, 11 Sep 2024 15:21:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soOj9-0000000A1fV-3xdd;
	Wed, 11 Sep 2024 14:53:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 72F63A44D90;
	Wed, 11 Sep 2024 14:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D250C4CEC0;
	Wed, 11 Sep 2024 14:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726066430;
	bh=7RDEy6UcPUI2lIh8YWVdPWHQFVty7qu6W3Bb5hVMBMQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iQOjXIaWD5f5+aUoneGJwYOVvaM2Dbkd7hCXqAfhjSGOP6Z6jyUiJ/UU/mjMw5fF+
	 xEllrvDgOIbWkgd9QYvRci0QHLLKZ4Q7m62StDrDqlBRNPlh3pa34VRRRynIyl4Rrw
	 m4vkRRIOWBDVvdGeTXU/ujw+NSIC2fyyZLu0lcoNvBgUtq+WP8cVCB5cwScU67kHRo
	 YheXuGksQk2rcMXjGV8bcQuTQlNR2khchJ3pXuq3fkXFRPJfdhFHExnfm3kaL9WdKj
	 CJkCmRMWQjAwiANKHSTfFvKvrLKqXlO4gFU8O2vhICnlULdD67S/DkyD+AVZTCTqj1
	 cth2V+352kidQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20240911111317.4072349-1-usama.anjum@collabora.com>
References: <20240911111317.4072349-1-usama.anjum@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8365: check validity before usage of
 i2s_data
Message-Id: <172606642824.81433.11338479643338212337.b4-ty@kernel.org>
Date: Wed, 11 Sep 2024 15:53:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_075352_093945_FF9F6593 
X-CRM114-Status: GOOD (  12.88  )
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

On Wed, 11 Sep 2024 16:13:07 +0500, Muhammad Usama Anjum wrote:
> There may be a case where i2s_data may not get initialized by the for
> loop which will cause the kernel crash. Initialize the i2s_data to NULL
> and abort execute if it isn't found.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8365: check validity before usage of i2s_data
      commit: 5c4e15e63216e7268bb2f1132ee8fad0ec46bbb7

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


