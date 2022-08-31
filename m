Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD59CECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Aug 2022 17:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xn7GYDwFNDzgHhSwCbzduxbjEfEdMal/5YqWNsHFvcg=; b=SRQ//PLog8DqRXFv4LByvcHpWr
	5wNC6eoX/iS0jJZ4D5DRYK5+WGeaa1mRkSbzzmJbm9o1HFFDYYcrmSsqtHAy/1dFrxiYKBHi8DCKi
	9CqrgsTClYHv7IWQ6xIqU2iOdCIcNmC5E3d/Lifc1NIvbbBFBokX4wJp7caV88yjbgT1tXWp6I3g3
	0WwoA+fOfD8zoaW3hu9rg6wG4ucz6in09MYIdV0qUL/Tn/fxi5/T5HItrrGzbhX+0Jm86GrdJ89Rz
	lIaGSBvN6d2xX3qBE2pBnDpKOXptB8wAQa2sdjxV5P8fSRCGPG52MKB14fc0eCMCufUVOqn4dvgYI
	YaRy/zuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTRse-007SJb-TZ; Wed, 31 Aug 2022 17:52:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTRsV-007SIu-5w; Wed, 31 Aug 2022 17:51:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 943A2B8221A;
	Wed, 31 Aug 2022 17:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 518A5C433D6;
	Wed, 31 Aug 2022 17:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661968308;
	bh=Xn7GYDwFNDzgHhSwCbzduxbjEfEdMal/5YqWNsHFvcg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=P4HDfxQd1ReFCRADu7ev9vbiQxbWGZcHXPD8aafY7qHuv3gPJKRwW+CtQ/3t1AtQk
	 /MKwgkvH0KJQPIxDCJlRlu0JsyjZ8tqqNgV8f7DaS37IgW2zss2ofMqU0Mrv3jHE7F
	 IsFMeyovqfWPMFLoQdgEJDLvafZfokv4WxqPo2/tOpaPFsFwIY4rtDPeHJa2xqitjA
	 eKjd2mwXq2l8EYNIoHZot+O2St/VnZduMT8w8wgUGgJKxJvfZHxZ5Wb7bU9eFImjpq
	 VBSng+JGZctMCMhS3NcuIsg0WpwJwhjWPlBUBYQc5ba0pHsNmjOYU1r1Tyr9V5pZ70
	 PtaL/hpxcStfA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220816193257.658487-2-nfraprado@collabora.com>
References: <20220816193257.658487-1-nfraprado@collabora.com> <20220816193257.658487-2-nfraprado@collabora.com>
Subject: Re: [RESEND PATCH v3 1/2] clk: mediatek: clk-mt8195-vdo0: Set rate on vdo0_dp_intf0_dp_intf's parent
From: Stephen Boyd <sboyd@kernel.org>
Cc: Bo-Chen Chen <rex-bc.chen@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F . R . A . Prado <nfraprado@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Miles Chen <miles.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
To: Michael Turquette <mturquette@baylibre.com>, =?utf-8?q?N=C3=ADcolas?= F. R. A. Prado <nfraprado@collabora.com>
Date: Wed, 31 Aug 2022 10:51:46 -0700
User-Agent: alot/0.10
Message-Id: <20220831175148.518A5C433D6@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_105151_393930_C715285C 
X-CRM114-Status: UNSURE (   9.20  )
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

Quoting N=C3=ADcolas F. R. A. Prado (2022-08-16 12:32:55)
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>=20
> Add the CLK_SET_RATE_PARENT flag to the CLK_VDO0_DP_INTF0_DP_INTF
> clock: this is required to trigger clock source selection on
> CLK_TOP_EDP, while avoiding to manage the enablement of the former
> separately from the latter in the displayport driver.
>=20
> Fixes: 70282c90d4a2 ("clk: mediatek: Add MT8195 vdosys0 clock support")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>=20
> ---

Applied to clk-next

