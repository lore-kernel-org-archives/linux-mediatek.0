Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 390D4C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 10:35:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6D506121E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 10:35:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E6D506121E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kc1uHo+UvG1g4aTKBTvESThFEAZzkuBEWRDEwPW+bQA=; b=Z5hqRmw3TW+yE8
	bQEEI4kMMaBCW9cI8rfvrbUdQ1/P0JjQk9tp/emXhuv9DTi2fcyukf2Mcp3SEvESeJ97uq3MAMwPY
	oRReCHABvbsWDI1ov0/xrdkZkEN/XaAHsa1sgZYh6Dr/pSGG3BbYonyZ0mIdtkMv/51OcGJVbf+nx
	Y0fUVNesVI962R6H2jsz3KYYUZ4BUjaKsC4sv+k5eoQYhbjA6mfvE/EQmnbx50mSAlVmUFh6/o+X2
	zfj8B94dp/no50G/LhC2DiF41wymtSwqXlluC/bbpXy43/o0pU9izGbTCcxhVYzEx/K1tXErAODRp
	Dq2RvsdyQi0cwQK3AmCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIqFJ-006XZq-VW; Wed, 25 Aug 2021 10:35:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIq3w-006SC3-UK; Wed, 25 Aug 2021 10:23:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 988186120A;
 Wed, 25 Aug 2021 10:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629886996;
 bh=aSw0cYg8pm1YpmSlIfShp0oFUe+o66pjQZD/ue8nx7U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a6pCHwq+W37Vca+6PO7MFagSCJAHN1FyCXp2CbRoMMSY2CFXOwiPxIPsXTiPXKXpC
 9qTnfQ6cknl3Sn4UfcAeMTCwEvzkwrWMDQ/QKCCUzoc56NIzdJghGyfUzxSXEy5NMv
 JZ1G/81gDBZfh5MKewFvY82vbD1on2dOeBfAxwawW3GbpI68GRUCPhgi2WRqaCo4O9
 XUpOkT+rFAOKA1ja7mMji9/vtQQsT8WvkbPI1Jk5yFzCfLpeyXmOPbcl9AH+sny/pH
 WdvjU1HHWi/loFwSoxwPZGaxdd3oTCr4ErPGsKeR08YxfEt7jb8REj7Kw0pBPjnEct
 sqFBCsg7K6i1g==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, matthias.bgg@gmail.com, Trevor Wu <trevor.wu@mediatek.com>,
 robh+dt@kernel.org, lgirdwood@gmail.com
Cc: Mark Brown <broonie@kernel.org>, jiaxin.yu@mediatek.com,
 linux-mediatek@lists.infradead.org, bicycle.tsai@mediatek.com,
 aaronyu@google.com, alsa-devel@alsa-project.org, cychiang@google.com,
 wenst@chromium.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 00/11] ASoC: mediatek: Add support for MT8195 SoC
Date: Wed, 25 Aug 2021 11:22:39 +0100
Message-Id: <162988521424.7213.9083414971201440076.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210819084144.18483-1-trevor.wu@mediatek.com>
References: <20210819084144.18483-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_032317_073894_ECF1DDCD 
X-CRM114-Status: GOOD (  15.37  )
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

On Thu, 19 Aug 2021 16:41:33 +0800, Trevor Wu wrote:
> This series of patches adds support for Mediatek AFE of MT8195 SoC.
> Patches are based on broonie tree "for-next" branch.
> 
> Changes since v4:
>   - removed sof related code
> 
> Changes since v3:
>   - fixed warnings found by kernel test robot
>   - removed unused critical section
>   - corrected the lock protected sections on etdm driver
>   - added DPTX and HDMITX audio support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: mediatek: mt8195: update mediatek common driver
        commit: cab2b9e5fc0e868ed8453ef4f433c795bda8bf84
[02/11] ASoC: mediatek: mt8195: support audsys clock control
        commit: d62ad762f67585acfb5e03f71b28a52dc4604cf2
[03/11] ASoC: mediatek: mt8195: support etdm in platform driver
        commit: 1de9a54acafba2f0e3ea2856ad0b22556d59ec45
[04/11] ASoC: mediatek: mt8195: support adda in platform driver
        commit: 3de3eba588bb7f6c39bf12de5761ff75c53b9961
[05/11] ASoC: mediatek: mt8195: support pcm in platform driver
        commit: 1f95c019115cc503c4c47fd7108675a56cdb29b4
[06/11] ASoC: mediatek: mt8195: add platform driver
        commit: 6746cc858259985a945a07075a19ec4d24352407
[07/11] dt-bindings: mediatek: mt8195: add audio afe document
        commit: b5bac34fcfb444e33f532e291ad1394ca05887e8
[08/11] ASoC: mediatek: mt8195: add machine driver with mt6359, rt1019 and rt5682
        commit: 40d605df0a7bf7723ed690f502f364c5320de440
[09/11] ASoC: mediatek: mt8195: add DPTX audio support
        commit: e581e3014cc4acee9025aa5704cf85a36a572b95
[10/11] ASoC: mediatek: mt8195: add HDMITX audio support
        commit: ef46cd42ecf00f0468df3ad1bf0f30db9634a04a
[11/11] dt-bindings: mediatek: mt8195: add mt8195-mt6359-rt1019-rt5682 document
        commit: 5f8c991e8950971cd1f81b61f79c83a511ad9fc8

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
