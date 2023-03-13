Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332D3C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 19:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TFjBcFNs2wVUK0e5AkwuzEEoFxbSyvsgnOxjOKvdklM=; b=z/mNaN44jyTzgFnQxW9wXuxkXw
	SaDqCsTp3yJKHPNZpX6ddHENg8qorQHdJIV0CGkWXKM+MUo2E1Z+nq1+nlQEPE0fZ85+Qpzw/nKNF
	kCMQkDZ5iHhLEmdtlD4WDwnHErsYMaqChGQZKQQ6Nc3NdNhwZZb0QdiUd7XshYHZIKuOmx01FlRBi
	QRTPs9HHzEV+bShXiP4/nCIajJyKrHHl+XI+5Ueqs00NT2g6A6D5ACKmPsje4/+r2AaSxHXMgD2rt
	50lSOIie8Ni8WmFa0XRAwEOamGU9BXKpiExhhdQ/gwVzuH1QuvY+8JDqS3ALMVwoxLa2M5okxd1tF
	J2i1BNtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbnWv-007Rql-8M; Mon, 13 Mar 2023 19:08:21 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbnWe-007Rja-9g; Mon, 13 Mar 2023 19:08:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 7E669CE1126;
	Mon, 13 Mar 2023 19:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4587EC433D2;
	Mon, 13 Mar 2023 19:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678734480;
	bh=5jfl9/hlfxAkBs3SczAn6QYlPXw9oRLcWoCeAZ5s0Zk=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=qy4U8EsWT9qdg/BRniO8wddtjYJExE2O0HT9PPvdGgN9jxC9enNuu0Z2Xtn6G5UV6
	 bC2miBMO0DXSvemVXs/Hszmr1FNrHmFOE7RB+89UH8vKMXUESE5FPnILrYViv7OGND
	 Ujak4aldgjlCMSP3Kxf0WBF7ll03WguZ6QiafKA9bJqTwbXFJst7It72+zJ36tOr7n
	 hA2wnnUlRTAwHVynEBeKhK7Tuze5tkj5aEza8sWAfagHejYDOQsY+FCUOEeFV+sr7h
	 CAeElN01aEgm7N6Dh8pFbIsc3bBpxnphPQlc5Kt83f/PNAjReRabIhaizmmBcarWh7
	 8/KD0VLoPzSAA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Tony Lindgren <tony@atomide.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
References: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 1/9] regulator: lp872x: Mark OF related data
 as maybe unused
Message-Id: <167873447700.106292.3339315429044423313.b4-ty@kernel.org>
Date: Mon, 13 Mar 2023 19:07:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-bd1bf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_120804_530514_A8CB1F28 
X-CRM114-Status: GOOD (  12.75  )
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

On Fri, 10 Mar 2023 22:45:45 +0100, Krzysztof Kozlowski wrote:
> The driver can be compile tested with !CONFIG_OF making certain data
> unused:
> 
>   drivers/regulator/lp872x.c:931:34: error: ‘lp872x_dt_ids’ defined but not used [-Werror=unused-const-variable=]
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/9] regulator: lp872x: Mark OF related data as maybe unused
      commit: 70b26bb55f719e2900404459128d41c8425c8dde
[2/9] regulator: max20086: Mark OF related data as maybe unused
      commit: 4a5850865641d0b83caaad81ca0bbd722ac514fb
[3/9] regulator: mp8859: Mark OF related data as maybe unused
      commit: 334e6b85a348a79bb018003f09e1cc94accd53a2
[4/9] regulator: mt6397-regulator: Mark OF related data as maybe unused
      commit: 38cc873cb1cf27965dacbbc5957a7a8aee89679c

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


