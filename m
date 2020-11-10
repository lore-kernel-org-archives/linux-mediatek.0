Return-Path: <SRS0=XLXJ=EQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13BD9C55ABD
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 16:03:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84DD6206E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 16:03:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DUAW1K90";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ztGWDagn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84DD6206E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Subject:References:
	In-Reply-To:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JXedM+1iadi94GidVavNqL2G6H/wcfo8CZeLMpyl8WM=; b=DUAW1K90h8SSB4SwgYvVCyLzH
	GQj8OThXyNj3/rXrisdxL6mwcB+b5PC49GOYtv5RilkUAqS5pSQICrc4+pEmU/zf8/bRkrcFqY7Nq
	RsSDU80avYSpMMjjMNRwdmoNp7XD0KkLGJT2QcU/1CyUsR4ZrYPRVLTAJsIg+4NJpncInsYzXtqAv
	vAn2IeuWG9s+JZ7gR2/em5DYCTGrW3k3CCm/JEwJYtksTWMtbQuQR3k0Mco+prWbs0LyEkTmDJFIh
	XDntkRPqHB27Ob88+T8hoLmePR6uK1SXOgtVsCV+8UCUcxab/2By4a8lkzviUCLScAM5ifF0+DOlt
	w0+PcEHeg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcW6m-0001tW-Kp; Tue, 10 Nov 2020 16:03:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcW6k-0001s4-Ji
 for linux-mediatek@lists.infradead.org; Tue, 10 Nov 2020 16:02:59 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 42076206E3;
 Tue, 10 Nov 2020 16:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605024177;
 bh=WJXkq/qLfyFh+DckIEnAcIep+CU9DCKkiyIv2h4DaAQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ztGWDagnj0CVj5lK0DWRoyRfrfi34z17w/bnM1KqBFCDhDMXCDVLyrEQH/sjEJW0C
 6etHtbnkrQPb+OXt7ADwznVBjbDH+iUZj8riUog3l+4y3wzBg6n4Cxm0npMIuIFXml
 mltGcr0THDT1vpNd3OC2LgRWPFHg0e2styF5GdaQ=
Date: Tue, 10 Nov 2020 16:02:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Shane Chien <shane.chien@mediatek.com>
In-Reply-To: <1604975492-6142-1-git-send-email-shane.chien@mediatek.com>
References: <1604975492-6142-1-git-send-email-shane.chien@mediatek.com>
Subject: Re: [PATCH v3 0/2] Fix vaud18 power leakage of mt6359
Message-Id: <160502414080.45830.9030480275474005075.b4-ty@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_110258_789212_D657E886 
X-CRM114-Status: GOOD (  13.59  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 chipeng.chang@mediatek.com, linux-kernel@vger.kernel.org,
 jiaxin.yu@mediatek.com, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 10 Nov 2020 10:31:30 +0800, Shane Chien wrote:
> This series of patches is to fix vaud18 power leakage problem.
> vaud18 will be enable only when mt6359 audio path is turned on.
> 
> Change since v2:
>  - fix dt-binnding syntex error
> 
> Change since v1:
>  - use dapm regulator supply widget for vaud18 control.
>  - add vaud18 regulator property in mt6359 dt-binding.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Fix vaud18 power leakage of mt6359
      commit: 64a70744b77898a15d7a5b2b4dc0fa9523a75cde
[2/2] dt-bindings: mediatek: mt6359: Add new property for mt6359
      commit: 08651373808e16b01d3b12207f52504c17b6774c

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
