Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AE2ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Aug 2022 17:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4/Lh/z5DKMQLdQdrQD1yNoq4V81hKIpVm5Dc0mJxvo=; b=3FHeLNV47ES/vAVDjEZ+wBcS7P
	qhLOzLfjj6qVZS3Sb+6/I/m2iFU3p58yX9dlbkLF5eykNppcpOa+g6MpMNCRA3XjWmsrApevQ2/ST
	iEgesn6Lld5yr9ukc2AeAm0EJ3RIHAmIaS2a1vSZSt7In1VV3HeBegAUlYFCIq6lzBwCEgzh8KVXu
	h5ukxIPQpKlg4ck2Dhd6aOH8F7c0qtUyuoeVfHx1UQtuv9St84ZPP2TTcYnVdDaWTM0rY5M3VlLU/
	FE+xO2IeRkiNOWHSeFwGtIp+QoOsUgGcq73OY1VoaHLN1XBb7O/tWUlpZCbNgNbtdEVcxUAir9KZ9
	xP9/XUsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTRsu-007SMI-Ni; Wed, 31 Aug 2022 17:52:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTRsf-007SJZ-Bf; Wed, 31 Aug 2022 17:52:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 953D461B54;
	Wed, 31 Aug 2022 17:52:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6CFEC433C1;
	Wed, 31 Aug 2022 17:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661968320;
	bh=HibFnHiEHireM6Wz2swr+uKNOlydCkfiuNU12obEQis=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=OzNnkkzjxbzUuWJnSSfAXE4ue1alYDhPa9bZ0ezsmG8fEaYBlueIaPb1z9J5yUfZO
	 oYr+0Xkc+HopNx8FCy3jwEBAlhtQhErC2ouTb8RqBPQ350yBDeuRhZtQ74hflb1Sb4
	 OF3DNXWJEF3nDXZ1+rbRcgv1D+DyvVSJYGws0/MK5crqGPlhD+KFizKZtJADxin0fS
	 xb2UP/mjRIGvE3nXr1ErOvMqlWFXzcOT6PdYOTJa4/4PqA0Ad/6ud9Im6xdYO8YHzs
	 dPmi1Av0beClw6gMTcRqo780novJCAnWhL9wKl24LGzfUHmyiElgWWfbCI7MfaHTX0
	 J4usflqF7FFUw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220816193257.658487-3-nfraprado@collabora.com>
References: <20220816193257.658487-1-nfraprado@collabora.com> <20220816193257.658487-3-nfraprado@collabora.com>
Subject: Re: [RESEND PATCH v3 2/2] clk: mediatek: clk-mt8195-vdo1: Reparent and set rate on vdo1_dpintf's parent
From: Stephen Boyd <sboyd@kernel.org>
Cc: Bo-Chen Chen <rex-bc.chen@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F . R . A . Prado <nfraprado@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Miles Chen <miles.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
To: Michael Turquette <mturquette@baylibre.com>, =?utf-8?q?N=C3=ADcolas?= F. R. A. Prado <nfraprado@collabora.com>
Date: Wed, 31 Aug 2022 10:51:58 -0700
User-Agent: alot/0.10
Message-Id: <20220831175159.E6CFEC433C1@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_105201_467309_E8A00252 
X-CRM114-Status: GOOD (  10.64  )
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

Quoting N=C3=ADcolas F. R. A. Prado (2022-08-16 12:32:56)
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>=20
> Like it was done for the vdo0_dp_intf0_dp_intf clock (used for eDP),
> add the CLK_SET_RATE_PARENT flag to CLK_VDO1_DPINTF (used for DP)
> and also fix its parent clock name as it has to be "top_dp" for two
> reasons:
>  - This is its real parent!
>  - Likewise to eDP/VDO0 counterpart, we need clock source
>    selection on CLK_TOP_DP.
>=20
> Fixes: 269987505ba9 ("clk: mediatek: Add MT8195 vdosys1 clock support")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---

Applied to clk-next

