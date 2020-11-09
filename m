Return-Path: <SRS0=FEjz=EP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FD5C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 19:49:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0D1A206A4
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 19:49:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gVFOtXPR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MoGeK0ci"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0D1A206A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Subject:References:
	In-Reply-To:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y0grsX/Dt2NEmpQXqI4HBgembYBN44yUkBbg+VFOLu8=; b=gVFOtXPRtm5nR04EWP+3wcOS8
	G2sKbkUXcUKnIl7r7QRbQ2RYQ+d/1lzF4Pd3JsmfCMXhieQIenwsBFvKh/VGCWRHg6+SgHlVAbShb
	niR2/ynnarEctwohGyoJdIGMrVNXKm63Cu/P0oAg2dJXF85N55QqIK3nQhJJDxxTuW5BPddytItoG
	QXGyD9HftG+llYnanYzk8Nj7PpmeDwF5K9lrKxZjzi9r6FMWdn8mna4YI/C8FP/Tj6nU65zWW8WKs
	JjfO/WXQKwSmoAltwnn1anGLQBfWV5LzIw5IUpwv8jsmBAuVPS0QoELv219mjeAI4SBnKbKfFNDDG
	WWadJJ16Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcDA4-00077O-RH; Mon, 09 Nov 2020 19:49:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcDA0-00075N-6Z; Mon, 09 Nov 2020 19:49:05 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DB2BC206D8;
 Mon,  9 Nov 2020 19:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604951343;
 bh=3Ok4/Pbb99zI/ObDxFnKakiL6dk8E4Cn5TISbUMUryM=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=MoGeK0ciCUCEeHvA+U/Ls1OKBDdZVso3UvHacXGXb1Su333bztdpPXpcp0QNCW8ib
 6Br8MjjdDPd1vXvznjLpipWaMEMcT3BmRg8yKMlNzqTo7EKl+Ch6JsdjXFbIr+u0vr
 owHtY7HuykR1ULIEeklnX8AXRyLXZI2pTsbr0u0o=
Date: Mon, 09 Nov 2020 19:48:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Qinglang Miao <miaoqinglang@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20201103074912.195576-1-miaoqinglang@huawei.com>
References: <20201103074912.195576-1-miaoqinglang@huawei.com>
Subject: Re: [PATCH v2] spi: mt7621: fix missing clk_disable_unprepare() on
 error in mt7621_spi_probe
Message-Id: <160495129749.49337.6551797928136426498.b4-ty@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_144904_356869_244958D1 
X-CRM114-Status: GOOD (  12.81  )
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
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 3 Nov 2020 15:49:12 +0800, Qinglang Miao wrote:
> Fix the missing clk_disable_unprepare() before return
> from mt7621_spi_probe in the error handling case.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: mt7621: fix missing clk_disable_unprepare() on error in mt7621_spi_probe
      commit: 702b15cb97123cedcec56a39d9a21c5288eb9ae1

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
