Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A29C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 02:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cmn9Qs4S5xB8Dc9eJVr9KNNDJY4P8CuibZYJMPmTGnw=; b=wDpstrPvfIjrkR1DIV45HPvgP8
	E3joxn0YvIdSmUW/C5PeQ42jkRXhSCDCG/cHbSZyRQWbTwb+Sqw5tme5ZNE2Y3RFWpQ1bAmqpdsqE
	b5Z/rdY9SKkQ7GFA+y7CifGGXOuxHbEiEt4Yqc4LR5N7wMN24xKCE95okzPHHXFAgKD4INPuHutSE
	+dSVbowZR+jk03qGX22ifh75ic4GcBNOE050qxOU+I+Clg0VliqgMimijfe1hOP/hoe5gEwQKEigp
	wOdG7Yzf+Eb8K0udaNw2baLRsqkITRfHcEq7I8Tpu/J7GUMcBWLhbJlNS4tzO18eTpQp024wbgAMg
	fEmaNsuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1eq2-00HYMI-6i; Thu, 16 Jun 2022 02:02:26 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1elB-00HVlo-SA; Thu, 16 Jun 2022 01:57:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4A0ECB82268;
	Thu, 16 Jun 2022 01:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C18C3411A;
	Thu, 16 Jun 2022 01:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655344642;
	bh=cmn9Qs4S5xB8Dc9eJVr9KNNDJY4P8CuibZYJMPmTGnw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GmqIKHQcyD60oBmidK2q7gFaWhZIlHuvG1iwv3Hd8pbBitarzwuVmjkfnoW3L+rpw
	 7EQHlRE/MTVDnIYPZH0ddxN7uBCw/JeRZfp61hMgmGaYy4j/c88p21PTMU/H+RLA3+
	 74Ed0qtQc4TKGtlijb79rhMrPXLZXbVgvJ3O90OpQO40atbI9SysJyKtyeRBJkJlfq
	 R0/+n6e+/0Gql/L1SFJJuMau7niq2xFgmnnqg4zU4WCIoUEcYU6hO9XOelvVwdfwxU
	 l8ZQRW6yYqskuH2lICVR4VyPFlyUlYvQ6HQjVVjN55eAdYAYnhG6pfGzTK1/e1MzSP
	 MiBb4T659tlpg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5e557269561d62972f8e44490bf7a6f97088f56b.camel@mediatek.com>
References: <20220523093346.28493-1-rex-bc.chen@mediatek.com> <5e557269561d62972f8e44490bf7a6f97088f56b.camel@mediatek.com>
Subject: Re: [RESEND v8 00/19] Cleanup MediaTek clk reset drivers and support SoCs
From: Stephen Boyd <sboyd@kernel.org>
Cc: p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com, nfraprado@collabora.com, chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, mturquette@baylibre.com, robh+dt@kernel.org
Date: Wed, 15 Jun 2022 18:57:19 -0700
User-Agent: alot/0.10
Message-Id: <20220616015722.C8C18C3411A@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_185726_085948_224EC5AB 
X-CRM114-Status: UNSURE (   9.25  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Rex-BC Chen (2022-06-12 22:26:52)
> I also pushed another series to move these drivers to drivers/reset
> folder[1], but I think we still can let this series merged.

Sure. I merged everything except the DTS patches.

>=20
> If you have any comments for [1], please let me know.

I'll take a look. Thanks.

