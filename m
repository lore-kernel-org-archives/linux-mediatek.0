Return-Path: <SRS0=oIsV=74=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C95C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 08:28:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16AF72068E
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 08:28:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E7AoxDW8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16AF72068E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a70R4MkS3qiC4vwhlD+JzxuFqT9xkZMivcnWSW1Frn0=; b=E7AoxDW8kSPCwl
	3x2iMvHdeC5Oi66F+hMf6nGlIcldZAaU6sfrTnpEOxSY80XHPpsSq+WZ3gdCTMCQY4PbLcZMHZ5KK
	AbbuLQBPCbGl9EbXslFYORRKvcJF3l43qcN4xo5XrIaXmgFsQBVk7Z5E1FBF5BC49HuynvyoKar4O
	hUKQTYIii03RgsoUVcTcSZN7kLbvk7Y1ZGKAN9ns5w6Cj0+1xyaMq/OQ7ZHkhTlhrf5qHWEGk389C
	3BE23EuO/5dSqvTlDs4F8dixmmZyjOXfPazDKxfyLc/Kw7wF/8nBb9B5maZCGgSMvkHdtRRAQphnz
	z4iZOSsNdMHwu9vMHUZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkkTK-0000Pb-On; Mon, 15 Jun 2020 08:28:02 +0000
Received: from elvis.franken.de ([193.175.24.41])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkkTF-0000OC-Vu; Mon, 15 Jun 2020 08:28:00 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1jkkSm-0004iN-00; Mon, 15 Jun 2020 10:27:28 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 4D970C0687; Mon, 15 Jun 2020 10:13:46 +0200 (CEST)
Date: Mon, 15 Jun 2020 10:13:46 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 13/29] dt: fix broken links due to txt->yaml renames
Message-ID: <20200615081346.GA5592@alpha.franken.de>
References: <cover.1592203542.git.mchehab+huawei@kernel.org>
 <0e4a7f0b7efcc8109c8a41a2e13c8adde4d9c6b9.1592203542.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0e4a7f0b7efcc8109c8a41a2e13c8adde4d9c6b9.1592203542.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_012758_593555_90905C44 
X-CRM114-Status: GOOD (  12.78  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-rockchip@lists.infradead.org, Sandy Huang <hjc@rock-chips.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-bluetooth@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jun 15, 2020 at 08:46:52AM +0200, Mauro Carvalho Chehab wrote:
> There are some new broken doc links due to yaml renames
> at DT. Developers should really run:
> 
> 	./scripts/documentation-file-ref-check
> 
> in order to solve those issues while submitting patches.
> This tool can even fix most of the issues with:
> 
> 	./scripts/documentation-file-ref-check --fix
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/bridge/sii902x.txt  | 2 +-
>  .../devicetree/bindings/display/rockchip/rockchip-drm.yaml    | 2 +-
>  Documentation/devicetree/bindings/net/mediatek-bluetooth.txt  | 2 +-
>  Documentation/devicetree/bindings/sound/audio-graph-card.txt  | 2 +-
>  Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt  | 2 +-
>  Documentation/mips/ingenic-tcu.rst                            | 2 +-
>  MAINTAINERS                                                   | 4 ++--
>  7 files changed, 8 insertions(+), 8 deletions(-)

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
