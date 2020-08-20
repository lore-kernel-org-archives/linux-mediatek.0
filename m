Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 259EBC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 21:48:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E52FE21775
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 21:48:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AsDgj3ID";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lwaNkhwh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E52FE21775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Subject:References:In-Reply-To:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0nRlNArm7Ssmxo6QkZDGynTJYiMq+jPtv4xfHK4v4/E=; b=AsDgj3IDMzX9QfRvPW6Y+yCqmg
	WWcJNxL9UXA3ADgwAXyQEMUWYUxs8ixU8q7Y59YaYWpiM2roMpqClD4+/ARiqUAbUWMNSRQTWPxtL
	pw69aVZKHb4MbJB0oUawbvS4rL35VQXNQZqybBo/v7ocCS/USOtF3yJHbjbO6MoDaYJR+qzazyf34
	olsIMqeiPMcUk4y/ibnU8OqEH9WqzYDC6NLfn6OC4u/hADGpBemfPYX163qqziSSVpi0GUXWBYArI
	5Nh4kAMRJbOPY2e+f/E6VUrv/wPgejk378XPmiTjidCsq998yLGP8IfAfYeRqdZsjAHJMRa82Oc5y
	ZT7wX1Uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8sQR-0008OP-ON; Thu, 20 Aug 2020 21:48:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8sQM-0008ND-Nv; Thu, 20 Aug 2020 21:48:43 +0000
Received: from localhost (cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 [82.37.168.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9EB8D2075E;
 Thu, 20 Aug 2020 21:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597960121;
 bh=23yUEfhFOmQ/QJGKJF2s1PtUXf40Zt+kxozKC+ATEgk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=lwaNkhwhgJpbE/zhVTfYZlNlh5BcgLwoBKqVYtgciUf+XphecrM4e40zZWnoPhWLr
 7LR9JTFTO6VfDbLvzPuUiDJm4fBse8n5dQQE45mqwRzNjQb/wxGiAHr1b4b98oZVQp
 gLXN8JhF5q2DsgDXOykirQXl1G7iYuLaKS2mwiRQ=
Date: Thu, 20 Aug 2020 22:48:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, matthias.bgg@gmail.com,
 robh+dt@kernel.org, tiwai@suse.com, linux-kernel@vger.kernel.org
In-Reply-To: <1597913493-10747-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1597913493-10747-1-git-send-email-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v6 0/2] Add mediatek codec mt6359 driver
Message-Id: <159796008815.44152.16317052982855858224.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_174842_860532_D6DAA91C 
X-CRM114-Status: GOOD (  12.35  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, shane.chien@mediatek.com,
 howie.huang@mediatek.com, bicycle.tasi@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 20 Aug 2020 16:51:31 +0800, Jiaxin Yu wrote:
> Add mediatek codec (MT6359) driver
> 
> MT6359 support playback and capture feature.
> 
> On downlink path, it includes three DACs for handset, headset,
> and lineout path. On unlink path, it includeds three ADCs for
> main mic, second mic, 3rd mic, and headset mic.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mediatek: mt6359: add codec driver
      commit: 8061734ab65498f4802578564fc0948ec9aaf933
[2/2] dt-bindings: mediatek: mt6359: add codec document
      commit: 539237d1c609c0fd23389369939b5cc93feb16fb

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
