Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED66C47420
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 11:49:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3E69221EB
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 11:49:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LP+luM0H";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q0kzW0fq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3E69221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Subject:References:In-Reply-To:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jqVtj1PXwdNM5MJnMVuCfQdftbnL1O8qJZTG/trYQAk=; b=LP+luM0HM/UXb7UjLKiC//cq6y
	QlEG+LY5Z/addkpnrc6EZK0CPO+BKLo5TYLG7oIUQq961g/ipczzZpv4WfA7Eg4xmH+iwjsjBzVFq
	3Tqe5WwAcQk8e10kr4Xb7U0Zj+1/M/fP5lWnnjx0/1gsD7XL6TZfp2KhSvYo60JGh38LZeSx5uaZe
	wIWKuWJJ4cFA1sF6wMLXnN80FuB1/TVx4W/etXsxlM1VeYoGByVpZOXof+7YFuSg8LQrm+AQs9aY2
	ZSlNYshd8dikPTjkMCNx4H0Yi6OODtMAi5F33PYfLRWdXCp81y8zVjQa7p9GsB0XMBq70sE2sYDiD
	M+a4+rpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKgnp-0000Vp-AG; Tue, 22 Sep 2020 11:49:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKgni-0000UF-Af; Tue, 22 Sep 2020 11:49:40 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC07A221EB;
 Tue, 22 Sep 2020 11:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600775377;
 bh=Q4KDNQJE+iH1DnDYsmw0dPu90gd1omWDNMB3ZeVjjGg=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Q0kzW0fqgH/ZynkmIIsZ+Sk3TIZn1d1t5vPwcPmXgKloPcyO+FEfgbJPD2ON45Hz8
 OOhutiHnFCkdlS2Oq5dnBkZlt3W7mf2vS5wJL9kS7AQvzZ8+wJETBuTKgGLs+1yuJc
 NnwNw6eHuWv6vW9+hMhEnlq2sqh22UhUiTpgzLzI=
Date: Tue, 22 Sep 2020 12:48:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Cheng-Yi Chiang <cychiang@chromium.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20200922062316.1172935-1-cychiang@chromium.org>
References: <20200922062316.1172935-1-cychiang@chromium.org>
Subject: Re: [PATCH] ASoC: hdmi-codec: Use set_jack ops to set jack
Message-Id: <160077532459.10007.8996932486569302078.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_074939_927063_E1D13E08 
X-CRM114-Status: GOOD (  11.78  )
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
Cc: dianders@chromium.org, alsa-devel@alsa-project.org, tzungbi@chromium.org,
 Srinivasa Rao <srivasam@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-rockchip@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Rob Herring <robh+dt@kernel.org>, Rohit kumar <rohitkr@codeaurora.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 dgreid@chromium.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 22 Sep 2020 14:23:16 +0800, Cheng-Yi Chiang wrote:
> Use set_jack ops to set jack so machine drivers do not need to include
> hdmi-codec.h explicitly.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdmi-codec: Use set_jack ops to set jack
      commit: 55c5cc63ab3277aa20637dc20f6528987ac23743

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
