Return-Path: <SRS0=qC7P=KG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F53C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 12:15:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B92961480
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 12:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B92961480
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q5VAEfqV4FjmGsCcY7WQuYRvfG4oFfmGayyjgjKre5w=; b=KO39DZv0EirGwoyGYOQQcGcvm
	snx3lY4Ep/NayhCdABEXVEF+sfGqLTQB43kLrD/OlMXrwk3S1n3KohTUIccWAlVk0jI2MKcngcdQL
	bjPktV0Esbhf6uXig/xfRjafVmF/Vz5pZaPhtAxwwUFbO/yv9DTZ1Fnjhzx5zCTspEyLsvL//idFh
	2NTDuX2fVWJJ2UxFYtLsWzsuQyxjUQDda7sMBDj+T0CIhcW176bZXiHuVVkfgIUT71TM4KasCUGrS
	U9cWXfZYQM6NCrKEPzWLkuGHb4LY0i+Mc+8nb4tFDt9U2MykriLXEF4uKc6IDHfOHt0vSGFtZCDQR
	5QXavQb0A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgRIV-00HKKr-2E; Tue, 11 May 2021 12:15:35 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgNjV-00GbB6-07; Tue, 11 May 2021 08:27:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=WED4fy02NdRbF+WeHCopW+Z//yaYCHNWyy/uD8UlUp8=; b=ZPYWhVE5vzbXi1nS2CVgt1L0r0
 vrOq1D/vZd056LH+eDQCXxbcvZs2qrnLY1AJOQ2psUnyau2A1fuQuqixJju3MBla9D7ND2dIWDvfj
 glRL1ZWnKJotODFG6eZ0jrKRiNjH7Lir0iYeWdw/IIGcXonUdfntH4Q20CVkjm6P6YaVOty1LxrtS
 67nHi5uZeTdMYNk9+llb9zoS9F9y02AbclWCVn3CQLl+dg8Q0OOTf41Od1sj2teMPCccmxl30wNmm
 //UdeVSwjiuauYjE5pAeFRKkGnSCi+NwApH2akmPN+9JQcCCwARVplksDAmez1H+u2l0/tfq1c5Gv
 LFs3b05w==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgNjR-009OSt-EK; Tue, 11 May 2021 08:27:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D85061432;
 Tue, 11 May 2021 08:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620721628;
 bh=Av6ODrArdaRyklq5h81aFEAyRwi1Zqxxq8VsieTEPwc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rnqD5y5awUoCzDztVqE7CeesfCzLk6Gz3oinRh2ZmUDKeQraocy8gnv0LYOqtwFpP
 6xn1jv62HDunW9Bg4kVolb6XSnxxifD+R4heNr0YmkQvpmwXX1WnRjfXz2ma5iBa0h
 kKESGJBZyMTFU1z4H9+ym1I/P0RKYP/hIPS42qVwyLko2lU7y2nMG1FaAnIB6Y/OIb
 ZqVBgkJQEQl1CjQAwfddwNoxcVfyGRdM1VmVv1a/kTI6IZlr4eXRn5NczC0CSi2OUh
 rFmzXuYcrJzydmqXJji1WZvQG1yZkInhlc/Lk1ENo9t7M/HoUoIVrv/lY3rIQSh3RM
 sCSB8jdpKozpA==
From: Mark Brown <broonie@kernel.org>
To: Leilk Liu <leilk.liu@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH] spi: take the SPI IO-mutex in the spi_set_cs_timing method
Date: Tue, 11 May 2021 09:25:38 +0100
Message-Id: <162072071982.33404.18025194443786909424.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210508060214.1485-1-leilk.liu@mediatek.com>
References: <20210508060214.1485-1-leilk.liu@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_012709_519823_2EC5F9CA 
X-CRM114-Status: GOOD (  11.66  )
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_012709_519823_2EC5F9CA 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
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

On Sat, 8 May 2021 14:02:14 +0800, Leilk Liu wrote:
> this patch takes the io_mutex to prevent an unprotected HW
> register modification in the set_cs_timing callback.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: take the SPI IO-mutex in the spi_set_cs_timing method
      commit: dc5fa590273890a8541ce6e999d606bfb2d73797

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
