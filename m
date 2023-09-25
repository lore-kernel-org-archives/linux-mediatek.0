Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C86CE7A9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 16:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+h+9eoc9QpFrggshxZPzpWIlcTRc2B1nJG96s1pqY80=; b=4gyWHPewjRl0bx2famxBAHRGcg
	GuQrJKQuEwZFazRRpDWUWqIUw0k3mbtHJM0dT4QE65Hzs665ldmBtcmBw1nFd31+H5VXOxlWuxG62
	GqIEs5yatfQGCknOytvPFivmvgpnl0VWpA1Pv2wAFaFdbuUq17GRUTFINZQ/3gqij7Qr2oIqV50J7
	VLcTfIN3wLu1l5GTtIhgd2khGTQ8eLbqzsRVEDwA8No0dPlNbZ5GLXsXyJ4t5+oujDBJrYhYszjzA
	VhboYjigDrYBLHkY/ZkumZ5AqMq3L6bvjs9AmhsX16v6Y+1Hw0CQT2OG/ioNIVdyB7KoBIPcK56uh
	bGcCCuXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkoh3-00EgtI-3A;
	Mon, 25 Sep 2023 16:44:21 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkoh1-00Egsk-2D
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Sep 2023 16:44:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 62B72B80DE9;
	Mon, 25 Sep 2023 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D5BC433C8;
	Mon, 25 Sep 2023 16:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695660257;
	bh=OSniNe/SEUwj5JtrJjV3mo40KgZweC+EN5DVdS+32V8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tx2vsX3+bmbaJmQavOlsuRE97YZs+Tfad0mvFjzqoghAnsr99IgCTELCcGsFXK/tF
	 5SE21DNJRy/kCAsDACFgx5S5YPFRSvwdvNRNtSPv0drdZxHy4/z8B+wcJThmOYDwvq
	 4rpGU+KzSew2sBj8H99H3HB+rQc2ivg1u6rthJ5IVb1gXPPkWvjIICH/G3Dax1HDCq
	 7FXAcBWCH/dTXk7+tAUHt4m3Kck/EuSkhoDjFapTm4y+m3KqzuypPEIL84djKjXKyw
	 zd9nVFjM/sJFifaVSxjPYfA2Ttw4b77Lv4H/60eUCIWEk3/s7qu2EmtRUwxTZOqOpa
	 4U7CojDULiHwg==
Received: (nullmailer pid 1490675 invoked by uid 1000);
	Mon, 25 Sep 2023 16:44:15 -0000
Date: Mon, 25 Sep 2023 11:44:15 -0500
From: Rob Herring <robh@kernel.org>
To: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, lgirdwood@gmail.com, broonie@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com, perex@perex.cz, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [v1 1/2] ASoC: dt-bindings: mediatek,mt8188-mt6359: add RT5682S
 support
Message-ID: <169566025430.1490621.9358539140957587506.robh@kernel.org>
References: <20230925083847.1496-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20230925083847.1496-2-xiazhengqiao@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925083847.1496-2-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_094419_863761_8FE9AE11 
X-CRM114-Status: UNSURE (   8.81  )
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


On Mon, 25 Sep 2023 16:38:46 +0800, xiazhengqiao wrote:
> Add compatible string "mediatek,mt8188-rt5682" to support new board
> with rt5682s codec.
> ---
>  .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


