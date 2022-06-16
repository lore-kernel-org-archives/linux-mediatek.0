Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352A3C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 01:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HiMa+tJvNJGODYWz5WKt+6j0GBah4EbArBxZz+K7pjM=; b=VvRX1aULVAmT9/KR1866MqkKUX
	SB3BpQalasOrwUq1GXVXD2f6yNKLxQSkHAa6nR8XVFlEmKwB+UIHMF8CifRsbkV2spkcMY0q7tqte
	8rDPEoA3rw9HtemF6liP3UvqrvgI7MPuMT7CGvTIYA4TvTBDvOHDmwtazFiXdySu8gYatxzr5+Ruk
	LhCpXRR20Eyb5FHiw9YHcouja1Pjd9+Otzowc2ORQz/tIFAhG2ROCXsFjy51ObdUinZL7fTZx/n2f
	8CYYjjkDrqbQsHt3x9SVpo2Gyr3tMd9ChiRxu8aFu0Ce1nF+ZEUP7DgcRqAxWJ4upSMrWDLJ5IzOX
	WmeyMG8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ekx-00HVar-H3; Thu, 16 Jun 2022 01:57:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ehh-00HTdr-Rl; Thu, 16 Jun 2022 01:53:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6F84EB8216C;
	Thu, 16 Jun 2022 01:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB884C3411A;
	Thu, 16 Jun 2022 01:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655344427;
	bh=HiMa+tJvNJGODYWz5WKt+6j0GBah4EbArBxZz+K7pjM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=oGCVVmvGmbeeNKeo4pIkroVmZEAYKxHL+jhT7JHH4oHijIACesAbid8zK86Kh39Ak
	 tGoJR6I7sgZnN3SpdKmDy0vDYvwzr5mynkaTacoSQRjSiWqzzzDFJf6EKHe+6kRzt9
	 YnPRwAQ/ZAxr52aGxVinagHFtNdctm/rwwY7RBsMEyVMUNJOuB2IRt6Zv7Qd6P4U7i
	 VduVnCpjubYTD6m+sljhXSd/8poolbHHkB2iI5kptEoESMZVeW/JbVEVFGD6mxXXCM
	 XaJUIG53bgpYyyZ+urqCgpMBo7CFp3Ut40mDQSH9kMwAabyBueFDw4KrFe/7RaZwpD
	 px29ESAdg4mZQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220523093346.28493-14-rex-bc.chen@mediatek.com>
References: <20220523093346.28493-1-rex-bc.chen@mediatek.com> <20220523093346.28493-14-rex-bc.chen@mediatek.com>
Subject: Re: [RESEND v8 13/19] dt-bindings: reset: mediatek: Add infra_ao reset index for MT8192/MT8195
From: Stephen Boyd <sboyd@kernel.org>
Cc: p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com, nfraprado@collabora.com, chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, mturquette@baylibre.com, robh+dt@kernel.org
Date: Wed, 15 Jun 2022 18:53:43 -0700
User-Agent: alot/0.10
Message-Id: <20220616015346.EB884C3411A@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_185350_066931_1FA3198B 
X-CRM114-Status: UNSURE (   7.11  )
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

Quoting Rex-BC Chen (2022-05-23 02:33:40)
> To support reset of infra_ao, add the index of infra_ao reset of
> thermal/svs/pcei for MT8192 and thermal/svs for MT8195.
>=20
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> [N=C3=ADcolas: Test for MT8192]
> Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---

Applied to clk-next

