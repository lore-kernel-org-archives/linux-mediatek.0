Return-Path: <SRS0=QBiq=PI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D4E8C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 11:29:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFCE661354
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 11:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EFCE661354
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YtjcRNq0R583Hs08TyVTKncr8H1GifhkqxSqengj6eU=; b=2PF1lFHi3zDTXa
	AvWuNMJNuF80jnRJpjD17zc00IsClvddKS/5vprKP2Zb0u1CeOmPfZksSepwY2dqc9q58r72odMXO
	uzTmdDAvu08FjNtvV2Ei3REz4HkJcj5b6ah5F4Gfit4q69R+hspizUIjnnMYcngeAdifttklfAYnw
	2ZANIMrtYMHWQkyBwYZAxf8AcTGNVkuUjhc12OXk2H/rW8nWvhBNFVm1XdVWcnQYiichs7vDJ/FgF
	1Nfl3Fg0CenKh2Yoox6F38WWbnOuyjCUXw9uEu4+ABybSFOlwwHqAnYby6pCbEYA8ncyrg7BtB5CD
	nTFHlj8xuBWWPJbQpVMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md9mi-004Ict-QN; Wed, 20 Oct 2021 11:29:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md9mF-004IUA-TT
 for linux-mediatek@lists.infradead.org; Wed, 20 Oct 2021 11:29:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1750C6136A;
 Wed, 20 Oct 2021 11:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634729339;
 bh=FfhgtDYVyNHCcHSEhOy5i16MCYOtKPZkE4GgwNgqH4I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V18vCLG8eYUjC6wP+1kve4j0OvK7oPHCXlPTcEFbt0TwJUXxOx2ttRODk8SkSCmU+
 ev9FLt86+pmC+Wmn4bQCUfWimiALBfslgerkEGvzVHQxKY/lGVFmTrPmuU0eOBjzwH
 UB+KwyxqrF0okF1bk2gB6EH+xLOboGU9/LaoMRho4hI/TwO1IC46Aq+qzX1e9xqqwJ
 lx8IF48Io9Fv47cpasakx6tqAIb++4lARZzrXHtT0riYwEhZrtWrUjUYlsfi8/jqcd
 8gnMCwapd7T5jt11EffJDjMZDn91igwWGBNYBBuK0l9C8RIp3dq6sBTsstY8T8NjD2
 bdaV/9siMlIdA==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, Tzung-Bi Shih <tzungbi@google.com>,
 matthias.bgg@gmail.com
Cc: Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 alsa-devel@alsa-project.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, enric.balletbo@collabora.com
Subject: Re: [PATCH] ASoC: dt-bindings: mediatek: rename reset controller
 headers in DT example
Date: Wed, 20 Oct 2021 12:28:39 +0100
Message-Id: <163472931364.2896549.9580992240702562423.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211018101608.3818840-1-tzungbi@google.com>
References: <20211018101608.3818840-1-tzungbi@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_042900_013505_DB483426 
X-CRM114-Status: GOOD (  10.57  )
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

On Mon, 18 Oct 2021 18:16:08 +0800, Tzung-Bi Shih wrote:
> Commit f07c776f6d7e ("arm64: dts: mediatek: Move reset controller
> constants into common location") moves the reset controller headers.
> However, it forgot to rename the DT example in mt8192-afe-pcm.yaml.
> 
> Renames the DT example to pass dt_binding_check.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: mediatek: rename reset controller headers in DT example
      commit: a2b5c48abd485b289d3502466a9e8e1785f5adf3

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
