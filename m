Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD06C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Dec 2021 16:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Chz4YeUBxkS3VHMJ0N8I2QYOCJVdtPLyy06dAAMquoM=; b=qMGpFpTOEXRl5V
	OIytj0ctc+/4khAj9RfTGBVLO8b5PkcrDFDUkrcbQZTFuMajsvE5fiFTQ3YaywQ3+Gs7OcBAOOiQD
	liVp3IWTG+zUGhOUkYTrUDa9N/RB9Z/cY+q5y5UO/6Y9BPFKH/+qHLjkcYAhuyl2ZEY1CFVUr1uFg
	NneFpQrNnndsNDdhvLCdEz4yF+HOmy2/Lx8ZT8b0lUKlcUFEI+a/1B57xwKpreQNZt0a5Y7O6M5nS
	+yWtdsg4TCdcetV3D9XrzrJBRbxJHKlys9Z05lemY/7Z4sYpXFX+Qd2Vy4jvDgCwlpD3AVs/zR7iw
	WMKzPt2YZPE7KSNKRQNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0nGJ-00EJ40-OI; Fri, 24 Dec 2021 16:17:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0nG7-00EJ18-E3; Fri, 24 Dec 2021 16:17:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA16A61E1D;
 Fri, 24 Dec 2021 16:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05F5FC36AE8;
 Fri, 24 Dec 2021 16:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640362649;
 bh=c770Vl0s4K8ne0JvN1d9u+B9NXqvmS0SNJ/Vr5lpXpE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZEHguiC6Sx7jrCAhJzIdc2b9ali2tP+4TU7f9jBubYM0wRTV+5z2WM1d+UdVO+SSM
 4pW7maR7w6UnpSEr5pGdlEcI7kV19acXkdaZ6ur5GPnzaCnsBwQegp5vLvQHOtsezx
 50d8BGJHorLbpnq3Y7QfTbaJBh6een0e4Lf7RQSTZpsb1uBYsf9bJTCGeQ9dqLsVra
 1w+6qTu+nP1SNiNTASOCEP4dyg6JnKwZngEGpDLtacCxpviuFrOk2Ko0k3GpuC8Vxk
 0RkZrccFISvkZh6J+83wizRMFkcpGi0UV4X+FbWDVzSBpeuGIXmQn3BjLB8alJbv6q
 6wjAsYfRYVHhg==
From: Mark Brown <broonie@kernel.org>
To: cgel.zte@gmail.com, lgirdwood@gmail.com
Cc: linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org,
 perex@perex.cz, pulehui@huawei.com, kuninori.morimoto.gx@renesas.com,
 lkp@intel.com, linux-mediatek@lists.infradead.org,
 Zeal Robot <zealci@zte.com.cm>, alsa-devel@alsa-project.org,
 chi.minghao@zte.com.cn, tiwai@suse.com, pierre-louis.bossart@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, srivasam@codeaurora.org,
 matthias.bgg@gmail.com
In-Reply-To: <20211209015707.409870-1-chi.minghao@zte.com.cn>
References: <20211209015707.409870-1-chi.minghao@zte.com.cn>
Subject: Re: [PATCH] sound:soc:remove unneeded variable
Message-Id: <164036264573.3720027.488082222157598597.b4-ty@kernel.org>
Date: Fri, 24 Dec 2021 16:17:25 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_081731_535943_426C075F 
X-CRM114-Status: GOOD (  11.41  )
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

On Thu, 9 Dec 2021 01:57:07 +0000, cgel.zte@gmail.com wrote:
> From: chiminghao <chi.minghao@zte.com.cn>
> 
> return value form directly instead of
> taking this in another redundant variable.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] sound:soc:remove unneeded variable
      commit: b2fde4deff854ca7d49ec735a8252d944418b64d

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
