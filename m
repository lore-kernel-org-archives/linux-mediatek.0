Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6BAC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 01:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mF0NndCR6m2d49GRqn5l9HYgTOrCNWb0rl8SH0KCYY4=; b=HCwgm3h0NlI+vDprXE3cOYhG+4
	v7lM0EbrcqIGx2vbj9sO189dupVbYbp35M3Y9xZJ4wvqPAg4ZKIg+nh7jACiyi4uiB/BRtDQPa/FW
	cmA3rUdGeTkRoDfvSkwfIsBrx4dqcxeNEltlIGmPwPS70EQucMHbxyFHMnC/vyBtfQrKpnXrWrQ+s
	nQZEWchZ30PUtBfw4NMidskxfJL72eBM3AM9wWTGDZ4pjdZm8JQjk4iPzhfUODqHLdITAaFjnsqtv
	IDJpMe6ds0f0OOkNX+WrtKy2vMSSlWCcW9/877vcZb0zoBJKbAfrud6v7UBMj9Z0UYv+RzGkALTdY
	dqyn6WCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ef4-00HS34-D8; Thu, 16 Jun 2022 01:51:06 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1eeY-00HRmm-Hx; Thu, 16 Jun 2022 01:50:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E8F1FB821FA;
	Thu, 16 Jun 2022 01:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CC31C3411E;
	Thu, 16 Jun 2022 01:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655344231;
	bh=mF0NndCR6m2d49GRqn5l9HYgTOrCNWb0rl8SH0KCYY4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=opLJdMyu8LUgCovtfIzecb3R3SgxjUiw3Rv1gfluPdDdXn1T+IVznD78Vg1Jq/O7h
	 v5MKxaYs96WBoPOLxfwEmZgPmb2X2dSmCeh79wkVLGWvNBy5GYe8e2j0ivltoCNlZm
	 iBAJmRdSGtO4tg4BmQ5gOpTBhOUsBFx/7hpXhj8f+HO0Kc2HORVRvIh4ycwklkVpp2
	 DWECHtysvSumzPdhLruMeOYXYo4DDcfbQoDARgW8YVnAPNCPpWGTV1D7Z+0WMyntD2
	 FImowNT/ADNvC2zdFJg8sq4Qtva9qfQVPtHLW2YLhqFNcWVJVHtBOANargIEElDbzh
	 I+BS2zylGFcQg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220523093346.28493-3-rex-bc.chen@mediatek.com>
References: <20220523093346.28493-1-rex-bc.chen@mediatek.com> <20220523093346.28493-3-rex-bc.chen@mediatek.com>
Subject: Re: [RESEND v8 02/19] clk: mediatek: reset: Fix written reset bit offset
From: Stephen Boyd <sboyd@kernel.org>
Cc: p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com, nfraprado@collabora.com, chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, mturquette@baylibre.com, robh+dt@kernel.org
Date: Wed, 15 Jun 2022 18:50:28 -0700
User-Agent: alot/0.10
Message-Id: <20220616015031.4CC31C3411E@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_185034_792294_48A27DCE 
X-CRM114-Status: UNSURE (   9.38  )
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

Quoting Rex-BC Chen (2022-05-23 02:33:29)
> Original assert/deassert bit is BIT(0), but it's more resonable to modify
> them to BIT(id % 32) which is based on id.
>=20
> This patch will not influence any previous driver because the reset is
> only used for thermal. The id (MT8183_INFRACFG_AO_THERM_SW_RST) is 0.
>=20
> Fixes: 64ebb57a3df6 ("clk: reset: Modify reset-controller driver")
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---

Applied to clk-next

