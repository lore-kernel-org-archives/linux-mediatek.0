Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC017C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 00:50:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 788CA61179
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 00:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 788CA61179
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gbf92n+n5kL9aDPI0jONMDhhGkJm8vQSsiNC3nBiEG4=; b=YIOuFzNAfk7CZj
	re1Pb9o9Oqoicfp9H5tWnLe8X6bk0OldvV2Y4la21m88H5q7jiZwrgqKxZd/EksF+PiFvVEHWpjyU
	et64mht1i9onHHujPi54MdvnUP6QapJWjYc29Cj1Hqe3eL/4LGCHpOPusw17f27CHLYtkfy5Q6DsI
	MyFytuEhxY7Yy8x/0EHHxkbR/A7kjPsf5kGwQvQCGPVakWV4KxiGeMFL+UIZR0scOq++OVKgX6ui/
	sfVW+c1ZaupQTIZRiJA6jPLYWFZIHItxCeZ8VxwDH0/+HYkhSPmGbp5opIgiAdQAalcfq6yPnb1l4
	M+LClXR7pdIpEnbaGVHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBo3h-00BB4w-FW; Fri, 06 Aug 2021 00:49:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBo27-00BAOQ-KR; Fri, 06 Aug 2021 00:48:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A89EF60F14;
 Fri,  6 Aug 2021 00:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628210899;
 bh=TwXuMV875p6zjhqmaCTkfv94OzqOszN/pY3u1piXC/g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W/ioGjgHMJOan4ghUNw+kqGWFNB1604iPhjPrZBQBW41RtWix85SKHVl0RTJpALMk
 /5fz4xkKdJ4Z+JCNAFpQLP88dC9zpME/uoxHYohQ3XNqZ02Yo1ol39fOze0aMW/xgP
 OnBjYHpnEclzjGNozDnJseEhtSwD35UfrAJy7CjjWvHHIF/3mlddwNohceG7SHfnpC
 9hWzptLHYpPaJTmhjEjw9VjIIEc2pXYcCKR6zdjZmaxuaEqaY4abivxQqsMgxkRhmC
 Q+oCCxUOd3hBRgnn1phR72zVwsb9ZDqTXD34RgnmbF/comVaEd/qLcP/Tn7R//8SzP
 x+F0oSFmvBxQA==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Mason Zhang <Mason.Zhang@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/2] spi: move cs spi_delay to spi_device
Date: Fri,  6 Aug 2021 01:47:47 +0100
Message-Id: <162821082762.19049.10460753888752180575.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210804133716.32040-1-Mason.Zhang@mediatek.com>
References: <20210804133716.32040-1-Mason.Zhang@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_174819_740360_2C7396EA 
X-CRM114-Status: GOOD (  12.07  )
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

On Wed, 4 Aug 2021 21:37:17 +0800, Mason Zhang wrote:
> As we know, spi core layer has removed spi_set_cs_timing() API.
> So this patch moved spi_delay for cs_timing from spi_controller
> to spi_device, because cs timing should be set by spi_device but
> not controller.
> 
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: move cs spi_delay to spi_device
      commit: 8c33ebfeeb597ea953df93f84ea25482d29c664f

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
