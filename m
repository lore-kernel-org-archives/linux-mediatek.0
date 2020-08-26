Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C077C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 12:56:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 297542080C
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 12:56:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xMOPjF+q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BRNO5cOW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 297542080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Subject:References:In-Reply-To:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xgNH/d1K/dHG3qSp4aalAZLcBNHd/5mQCukG1XMSIBo=; b=xMOPjF+qHkOEK5aGcJrd356swf
	gqAlJjNWX7XSeUVgGkCG6lsgZwkzbnoteO2GJCwzXV3HQyG2Ma3CrsDk3tRx14qbxscZ9f1SHRX5F
	Rwg3qSVb2eZuCmlljPIcSUZ4Biw9d7FhVg91JSxgsShHX5GsqjRx1BzeJSY/a3x8rcl6s0lQwY8BS
	ylrNypuQcNYI9ojSdD4ky1sS1maKEHgf+JnvNDox4s1DeK1bNxrWn4OxJboV7tYVgr4jV8MC//sGz
	dEznf/YdUDbgVjmlLCoXVYrJHSRpckUoAGJhRueM3tQUBA9jyQbr5Htb5zHBiK4EF16WMUlhsS43z
	56W668QA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAuym-0000CM-Tj; Wed, 26 Aug 2020 12:56:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAuyi-0000Am-Mc; Wed, 26 Aug 2020 12:56:37 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 738AB20B1F;
 Wed, 26 Aug 2020 12:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598446596;
 bh=lof5WMJd2SD3b9kftLog8IIHEfylBdQfeE4ha9mqSAo=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=BRNO5cOWHM0Njv6O9w51yVtTEFZvsoEl3ZjZXW9pxDChZ6/+NvTVq0O5vsD0KTdz0
 1NfT1accHfptuB3CFsUuJATPeoupIfYmHfOMqwfeeYxJ1rGmsOe4BfLJQ+EYPA8Ayf
 4lEXoIIOiQKKBnS5cIg73MSh3KwlfEsW8zp0SBRU=
Date: Wed, 26 Aug 2020 13:55:59 +0100
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, Gene Chen <gene.chen.richtek@gmail.com>,
 matthias.bgg@gmail.com
In-Reply-To: <1597910022-22617-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1597910022-22617-1-git-send-email-gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v3 0/2] regulator: mt6360: Add support for MT6360 regulator
Message-Id: <159844655479.37260.15995868190523968540.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_085636_891886_80DA006E 
X-CRM114-Status: GOOD (  15.07  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 lgirdwood@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 20 Aug 2020 15:53:40 +0800, Gene Chen wrote:
> This patch series add MT6360 regulator support contains driver and binding document
> 
> Gene Chen (2)
>   regulator: mt6360: Add support for MT6360 regulator
>   regulator: mt6360: Add DT binding documentation
> 
>  Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml |  109 ++
>  drivers/regulator/Kconfig                                         |    9
>  drivers/regulator/Makefile                                        |    1
>  drivers/regulator/mt6360-regulator.c                              |  458 ++++++++++
>  include/dt-bindings/regulator/mediatek,mt6360-regulator.h         |   16
>  5 files changed, 593 insertions(+)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] regulator: mt6360: Add support for MT6360 regulator
      commit: d321571d5e4c2d5511b75e6cf1a910e0a0c2a2e9
[2/2] regulator: mt6360: Add DT binding documentation
      (no commit info)

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
