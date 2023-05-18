Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1E7C7EE23
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 May 2023 17:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZ5Jh8xjt0gMs+34FAdXCgFopZFo6TG5X7jzIH97TX4=; b=HLlLv/u8yy9Nh1eT26B/zHIAFz
	veogehjRPIw4CBxQ6ud5WykCjnEgyZEYN7lF7BHYZZO8PM9oRgxKSVJxdGU6y3pNOcJmHNtKCOvcs
	lNqNHVT8kbbn0Y6evMuPFTpbb5O7uieJgYha8iOZbvtwPykSB8N7WNXrz5+OVXY0nawwzJs04ZHeF
	XRgltC3sxG4BER7Efz3qC2wBEa6+s0JO+xcaWqzu8urHLzKFuGhTm0+7Cu3hq2/5QzCtjVouIrvUG
	BnVKig8SqXb0rfp/sU0+5nmC0dk/n1bj6NVTp3nMs38ly5y3S9hbT4hg3SB14vbeVmLxtjWf2ay6R
	j6eUMxyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzhVL-00Df0W-2z;
	Thu, 18 May 2023 17:33:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzhVH-00DeyW-2N;
	Thu, 18 May 2023 17:33:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2678B65151;
	Thu, 18 May 2023 17:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE560C433A1;
	Thu, 18 May 2023 17:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684431206;
	bh=8g604RQtGDYqVxRbodA1GNAzcaFUInIXvN/XS2wjnMQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IbQt+C8i2MSKRx23a6Y5VDsVm/DahgJApeFIijPhY0TIs9nIt4MnDfyEQ4gfXVHNC
	 V3tIw0HKx6WN8oeKORJHszstQHcsYej9unu9tcSmbpQsdr3MZoE7dwEDqdnFrjvVtZ
	 sVzN7tqmiAyv0HCbNwas8uTQa6R+0KNjL+2x6waEGifw776DT8BonXMsNdvSAY/N65
	 y70BIPcHMihq5kMVDOgqbhuaM+9kWt7/gcRJFMgp2NI9NTNoYqrk1OkVlIHj3zv6fs
	 AUddRshKbXEf7wyBbOzl4coUOOEahDUh/Pxm7o4DxLZNqDOWwtarY3yEklEfNr9jYY
	 pPxsfezlPBdnA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20230518040646.8730-1-sen.chu@mediatek.com>
References: <20230518040646.8730-1-sen.chu@mediatek.com>
Subject: Re: [PATCH v2] regulator: mt6359: add read check for PMIC MT6359
Message-Id: <168443120482.483131.18246545493507680908.b4-ty@kernel.org>
Date: Fri, 19 May 2023 02:33:24 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_103327_807576_43228F02 
X-CRM114-Status: GOOD (  11.52  )
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

On Thu, 18 May 2023 12:06:46 +0800, Sen Chu wrote:
> Add hardware version read check for PMIC MT6359
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: mt6359: add read check for PMIC MT6359
      commit: a511637502b1caa135046d0f8fdabd55a31af8ef

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


