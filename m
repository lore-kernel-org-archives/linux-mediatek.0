Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2C5C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 16:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dRlZTdjQUM9V12cikEszTrH3qhiRAkK77PB+YfZVbp4=; b=eIWUUpUu0/efbE
	d8nSXKy1duZ4fl6zGanqTA6WWKRtiqJUGlrMLc4gaEKbJaip7++pFg6hMigCtxtdFVEfjMcK3SCJo
	pFYDHBCWjnzsctsMpBuhJ+I1U3hJ5KwP8U0nAiDBm8768cgQzojAJ4gcBdW6j3ijdEOkXme1VTZpz
	mgHIr8neATQV6hzfj1A+ydHsP9jILSsBKwhIS7vBDmPQ+zX/1qw1PtyVHQ59VlOXRIyxnJ24LCJdw
	vkMHWSE1CO3up+fclbaANf9HrGaJLq+/M3/0OQ4NPV+Qo5vw5t6i4NpUVX5v5hM3+rpwScxbc/SUu
	0RbLYTergp3hbzs6nKVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4mQl-00CDUr-Ko; Tue, 04 Jan 2022 16:12:59 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4mGS-00C8bB-6R; Tue, 04 Jan 2022 16:02:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A9E9BB81730;
 Tue,  4 Jan 2022 16:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D43AEC36AED;
 Tue,  4 Jan 2022 16:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641312137;
 bh=bQKZ3qioIULVMm21JOCcr8tIMugI86yzGzaKSnpPJ0Y=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Ez19Phz8Wp7n1zoIPtLHW/HXKm7rwk1U6VwBaK5bmfBE6RDOZJJNs01B+yrh03x21
 K0QuquhsHpAWzJLDubct8umRsLMwhKWM1nYH06jHvXDs8aQGVpqn/e7M16EYGFqQBJ
 hfOZNnUYcRgZ7K3au713ECOmxph1DpdF7kGiXOtDLx1PHHUou2QNh/wUXx7D3TP/E/
 m8XTmic4+kH8zJRWuiAcrywiOeVmsMDVre5R+oIF3+jXD24LUyCiM8SnX9iSAqKHwT
 aflL00x90aNvhz3L/shBxGXq4fP4KkAkqYjtLCKBmljxNu7yoRDPFyXdL7GwS9nlc0
 raT80vJ6Uot8w==
From: Mark Brown <broonie@kernel.org>
To: cgel.zte@gmail.com, lgirdwood@gmail.com
Cc: matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Zeal Robot <zealci@zte.com.cn>, Minghao Chi <chi.minghao@zte.com.cn>
In-Reply-To: <20220104104139.601031-1-chi.minghao@zte.com.cn>
References: <20220104104139.601031-1-chi.minghao@zte.com.cn>
Subject: Re: [PATCH] drivers/regulator: remove redundant ret variable
Message-Id: <164131213558.2665148.2101695497540419615.b4-ty@kernel.org>
Date: Tue, 04 Jan 2022 16:02:15 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_080220_437149_7E842EEC 
X-CRM114-Status: GOOD (  12.31  )
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

On Tue, 4 Jan 2022 10:41:39 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Return value from regmap_update_bits() directly instead
> of taking this in another redundant variable.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] drivers/regulator: remove redundant ret variable
      commit: 1f156b4285865dc2eb66e7a78c7ba80c17bb2b0a

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
