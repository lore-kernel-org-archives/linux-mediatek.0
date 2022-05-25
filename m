Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98364C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 May 2022 20:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2sHuUMqqaAcXWz+BrlbWfsMHjumYTUaWqWKZZjW2KL0=; b=pZXLmdhPUITKh6
	fduB0TohdIutfv6eh/ep6pllidxfUwQ65EqXK9PiuoCEtCrWbeiXhaGh3zliyEmEcRdp3pir8cuFT
	jcsPb9ESuZzRdonjlfNLuJTmiWWDoZE+QXws9MQyZmNflMy2TqLBut4s+vEG6ofP2tgEhdCpYMbAQ
	UkvEmV5BSm5gr9dUIqBeToNa+b1kL8LIVcxB1dI+NZVGFZfJqs2ErIKCMLFFN9VmdnzzxfPMVqviA
	W0jYG6WxESe94ro/MToai/9KPCCuhfoLYxQSZVa/w2FFSF4u47ypRVYYbcticz1Ystp2o0dk/HV/6
	L0EHF15/WG4sZS1KZKbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nty1B-00Chc5-8G; Wed, 25 May 2022 20:54:09 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nty0y-00ChaX-Bn; Wed, 25 May 2022 20:53:59 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: nfraprado)
	with ESMTPSA id 841561F4268A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1653512032;
	bh=JayclhC6KF2KjXxwe9UBTJau5WIH16YxRj272sxRyX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ECuo2A5BML0Z5RO9YZdLhFbyvNvnUVwNVOyHg+CvMtoF/sCu8w2tvmgQSxaMXYNq6
	 ZGz/CqMZ7nR48ovPBo2M6Tios2gZJ+M1ey3WbNkCLGyhidE7jpFTNMKY5MuY+eFXRD
	 mjyK9h4+UAm0Mmo5ki9DLv8EjE48UjMr6y8Nx2Sn7dKGt/BFFny9xpciqkcIZQFOLd
	 /uqm/Y/LSF9Zt0ju9E6yTlgWBdZYPA+Q8X8CdD2wSHdR0C6TLD3L7eXrAhNMt+tdie
	 JFL0AEJYHcpu75Fadb+8WGX7WaY3YRCHrF7HFJ86OPYdlG1hKhF6ZNwHIvkVq/yWk3
	 fMz/Lp2SS8m6Q==
Date: Wed, 25 May 2022 16:53:46 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Shane Chien <shane.chien@mediatek.com>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: mediatek: mt8192: Add i2s-share
 properties
Message-ID: <20220525205346.6ik67nduv3zexl4p@notapiano>
References: <20220509205847.607076-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220509205847.607076-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_135356_654322_3542C08F 
X-CRM114-Status: GOOD (  15.53  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 09, 2022 at 04:58:47PM -0400, N=EDcolas F. R. A. Prado wrote:
> The Mediatek AFE PCM controller for MT8192 allows two I2S interfaces to
> share the same clock and act as a single interface with both input and
> output. Add patterns for these properties in the dt-binding. The
> property is split into two patterns in order to allow all valid
> interface pairings.
> =

> Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> =

> ---
> The series from v1 of this patch was merged although some changes were
> still needed in this patch, so the v1 of this patch was reverted [1] and
> this standalone commit addresses the feedback from v1 and readds the
> property.
> =

> [1] https://lore.kernel.org/all/20220509185625.580811-1-nfraprado@collabo=
ra.com
> =

> v1: https://lore.kernel.org/all/20220429203039.2207848-2-nfraprado@collab=
ora.com/
> =

> Changes in v2:
> - Added "mediatek," prefix to property
> - Rewrote and added more information to property description
> - Split into two patterns to validate that output-input pairings are
>   done
> =

>  .../bindings/sound/mt8192-afe-pcm.yaml           | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Gentle ping on this one. Any feedback for v2?

Thanks,
N=EDcolas

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
