Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE730D3C533
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 22:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TnsVYd6XDAgYD0/0QCh/SR9ZVIC3BBlRFGt1j4T+HLk=; b=u3Kn+9hmP9E8x+btYW9ZeRmjGK
	Kkn+F8XfUt2sMdnE73l/7H3t3iDxygVTiRMqVhNkh1KjC4RZi5mbgeH0gDlrA6GxjkKxd4GSHfYpf
	xVlU3Z4ik//zghhGK7IIy2e07b7SF3KAnMMCBReU5JSuPHAw3/48eM+rclQwqX95k+RDAo/bZNDSh
	iceKbJfE/ndT0AaloeZFFcc6UtG2mwCbU50XpB/N1JMsYd7NSkoLGXiKMOqWShJCNyOjilr9SThSu
	xshchArCEAwCVg0gBuF1O5FTHxZzWoyORZLJLOVLKEUYdAAlN+Sy30DY94aRoVaKRPBOf30uxBr20
	omcReHiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Yx1-0000000GKvA-24qu;
	Thu, 17 Oct 2024 22:26:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1YvX-0000000GKcE-167E;
	Thu, 17 Oct 2024 22:25:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4023EA441BE;
	Thu, 17 Oct 2024 22:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1DEEC4CEC3;
	Thu, 17 Oct 2024 22:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729203901;
	bh=UxsMeMKqTAaNxfn5AaD4HqHVdbM0GZp5OXnjQx+h7c0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=p6NkfUH2iEdRK5kmbrFK6ylq+jIY9PF/KQoxiEzFAZdC25O/mvcI8MI/+/JFmWE96
	 CAO/Eb0hdbFhw3nXzoxHQwSfpYM2PERo46auNDpL8bw9rnpzSA5JzcMaHCMaryAQJu
	 z0FnhRaLpT3lW2a1MIH9le27Lad+PjekUlX682DGrHQtI1DcrjEkI6D6fkV5ht7PPC
	 MFSE3J3HMbIkwdM9Ehh4ehQW0sCf5yNhub27rJVjn9jTR9NfHUn/pMxCRVijLwrqQA
	 bUKJnC3yHLbx6GJ3uILBoCuU4CfrZ6IZIzKp2wtPvxOB1uh56WgDxCpajU0nxSuurc
	 KlPFmlOsexNVw==
Message-ID: <45f562afc56223014bde8defc132023b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240927103005.17605-3-pablo.sun@mediatek.com>
References: <20240927103005.17605-1-pablo.sun@mediatek.com> <20240927103005.17605-3-pablo.sun@mediatek.com>
Subject: Re: [PATCH v2 2/6] clk: mediatek: clk-mt8188-topckgen: Remove univpll from parents of mfg_core_tmp
From: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, Pablo Sun <pablo.sun@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Pablo Sun <pablo.sun@mediatek.com>, Rob Herring <robh@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Thu, 17 Oct 2024 15:25:00 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_152503_393948_19D8226F 
X-CRM114-Status: UNSURE (   9.66  )
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

Quoting Pablo Sun (2024-09-27 03:30:01)
> Same as MT8195, MT8188 GPU clock is primarly supplied by the dedicated
> mfgpll. The clock "mfg_core_tmp" is only used as an alt clock when
> setting mfgpll clock rate.
>=20
> If we keep the univpll parents from mfg_core_tmp, when setting
> GPU frequency to 390000000, the common clock framework would switch
> the parent to univpll, instead of setting mfgpll to 390000000:
>=20
>     mfgpll                            0        0        0   949999756
>     univpll                           2        2        0  2340000000
>        univpll_d6                     1        1        0   390000000
>           top_mfg_core_tmp            1        1        0   390000000
>              mfg_ck_fast_ref          1        1        0   390000000
>                 mfgcfg_bg3d           1        1        0   390000000
>=20
> This results in failures when subsequent devfreq operations need to
> switch to other frequencies. So remove univpll from the parent list.
>=20
> This solution is taken from commit 72d38ed720e9 ("clk: mediatek:
> clk-mt8195-topckgen: Drop univplls from mfg mux parents")
>=20
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

