Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 915FFC77B7E
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 15:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O8qIJ0ij1C4Q3TxzXpM/XXaP/yFC83JB8WzGzsTCF7o=; b=Wy3EKIfutCwnPRkD06XC5bujxM
	+f/N7eByWt+tOy0YeoooOl24n4Kzzikt/UkJccagc53hHSsW94ohvBj2t65nUtvFz4IglMFC1EcJ9
	8Gss/7rB1SornTpsKeg+Xk7sQ3XBOA/c1n9TpUt8SkyseQJdw02IN5aY6oMWainvs9/VRqnQtcuLq
	0jDhkK2PnkNw1lEI4QCad7pjY1Y5RdAkRWIDYUl80VuexnkGE1UYCKKZLGvhAHk0NBw+fnqQ4JrS2
	/Qf1Q51NWJzaa7y/+MEXWW09JNElCQR/lwy09N7cNkCRhERYH945pkios9maQk1eFfuwuCQJl9Mbn
	UkkAJBOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2DAR-00H0Es-1P;
	Thu, 25 May 2023 15:46:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2DAN-00H0E4-2y;
	Thu, 25 May 2023 15:46:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 01403645C2;
	Thu, 25 May 2023 15:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80648C433D2;
	Thu, 25 May 2023 15:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685029574;
	bh=HAMXQ7eYyMpNN5eFdaxJ+MXRIlrr5kTcFjDxNo3yGV0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Fi/gsGTWmhOeHLKZcwFtc50qZBywJ6IeWY8ltkbnKWY8SjiwIdXXMiwnj6fZfncW3
	 upLfFvmPmrepSo3SfUMEa7pYQ/ZAePqldIIWi4UZoOk4SMCBtDJe6atGLvCwpclcO9
	 lbWgE7/EImZVKWKpkWVFKq5vz0LLZLW2iFu8lvTkVlgWcHNkAL6t4kkHFS0OLtLmAe
	 NgEzGpw+XbubiIDiXetRVGe2/Bw4VSVQwIyfvSUdLk6qvRytHKm5a126+oD+H/ymxR
	 bHwlgTmEAIo78b3mwg1QM8PhlfwQt+lJAGtzyeId90jgU8EouXDxeHvpmWC2I9UJtR
	 pKUTI63bJTGTg==
From: Mark Brown <broonie@kernel.org>
To: qii.wang@mediatek.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com, 
 "Tim . Kuo" <Tim.kuo@mediatek.com>
In-Reply-To: <20230523112608.10298-1-qii.wang@mediatek.com>
References: <20230523112608.10298-1-qii.wang@mediatek.com>
Subject: Re: [PATCH] spi: mediatek: advertise the availability of Dual and
 Quad mode
Message-Id: <168502957225.307668.278901745390078945.b4-ty@kernel.org>
Date: Thu, 25 May 2023 16:46:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_084616_023478_5C857883 
X-CRM114-Status: GOOD (  12.17  )
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

On Tue, 23 May 2023 19:26:08 +0800, qii.wang@mediatek.com wrote:
> this patch advertise the availability of Dual and Quad SPI mode
> for ipm design.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: mediatek: advertise the availability of Dual and Quad mode
      commit: dcb2d27444baeba91701bcab38d60c219cb47463

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


