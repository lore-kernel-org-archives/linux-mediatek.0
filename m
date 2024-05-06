Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D622AC25B5F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 10:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Cc:Subject:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcun4FHi8g+Dt8Q+5L+loMgKaWMENI5jp4Gw+JI3jMc=; b=AKXBYIdmMvHBvaWROrjanTfKsm
	R61ZMu7oECAVpFYvacyer9X1xkTRJ41YUEez9iiPbzcZjq21ZN+Btj1Jx8+6h5JL1RX4WLiaU0HXI
	SGaVWDy01jLbpVhKLzRi/yG2s3HJ3WxbYTYs9eRW+zj+ZMU51joe+fbvg+W1JekHaVoKX86p1JReN
	vtJ+VdsuvSzp6A9HIVq/XaXKPi0Jrnmf7fjntuoeL1Wv3kXQVCeahCAkU2K4aRgPyLW+LxZRKMi3o
	NfPYm4EbQq4QvKZeEkJvHqDrlLdSJRs2Zd/7NUm5m9HD/s03Zs1SPJRE5BPVH51cdSCde2kmKxPgL
	Bf+5zVWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3vAs-00000006thX-18NK;
	Mon, 06 May 2024 10:02:22 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3vAp-00000006tgg-0F2l;
	Mon, 06 May 2024 10:02:20 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4340:6430:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 9D9976F4;
	Mon,  6 May 2024 12:02:16 +0200 (CEST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 May 2024 12:02:16 +0200
Message-Id: <D12H4GDJJEUF.1Y91H9RMUIX20@kernel.org>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Alexandre Mergnat" <amergnat@baylibre.com>, <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 0/3] drm/mediatek: Add support for OF graphs
Cc: <robh@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <conor+dt@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
 <shawn.sung@mediatek.com>, <yu-chang.lee@mediatek.com>,
 <ck.hu@mediatek.com>, <jitao.shi@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <wenst@chromium.org>,
 <kernel@collabora.com>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <20240409120211.321153-1-angelogioacchino.delregno@collabora.com> <1fc23530-89ba-4e36-9e9a-a1289f56a9bc@baylibre.com> <608fdbde-ad06-45ec-9771-18aa9f002f2d@collabora.com>
In-Reply-To: <608fdbde-ad06-45ec-9771-18aa9f002f2d@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_030219_277563_23F33631 
X-CRM114-Status: GOOD (  17.14  )
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

Hi Angelo,

On Tue Apr 30, 2024 at 1:33 PM CEST, AngeloGioacchino Del Regno wrote:
> >> This series was tested on MT8195 Cherry Tomato and on MT8395 Radxa
> >> NIO-12L with both hardcoded paths, OF graph support and partially
> >> hardcoded paths (meaning main display through OF graph and external
> >> display hardcoded, because of OVL_ADAPTOR).
> >=20
> > Is that make sense for you to add the DTS changes of these boards into =
this serie ?
> > I asked because, IMHO, that could help to understand the serie.
> >=20
>
> Yes and no... but I imagine that you're asking this because you're trying=
 to
> prepare something with a different SoC+board(s) combination :-)
>
> In that case, I'm preventively sorry because what follows here is not 100=
%
> perfectly tidy yet as I didn't mean to send the devicetree commits upstre=
am
> before this series got picked....
>
> ... but there you go - I'm sure that you won't mind and that the example =
will
> be more than good enough for you.

I've tested this series with the DSI0 output and it works. Nice! No
need for my DSI0 patch for the MT8395 anymore.

But I can't get it to work with the DisplayPort output, that is the
dp_intf1/dp_tx interface. I don' know how the pipeline have to look
like. The functional spec seems to be ambiguous on this. The text
seem to refer to the second vdosys but there is also a diagram where
you can use the first vdosys and dsc0. If you have any pointers for
me, I'm all ears :)

-michael

