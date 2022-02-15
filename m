Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8BAC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 09:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Ajgk86A0IElNXP+H+JBwTjlAZWAq+D2859ExbmOhMA=; b=YtesjNPz6HQhpT
	8tNlODZrbjppRm+y0qarCjnY+qW2q/Q9+g7C9NhtrEsxHleZJBj0PzR1FxJj4SvHoss81pj9rhccH
	Wne5PXIF41cu8GtMbJFmTwJXo2kf7SfpFc2ZweWdFEeKscy+Lx/rN2LODSjxL87FCNFLLmDhBNasK
	FeXF5WxVKKKfE9mIkM17+Narbs3jCvxOsMblXGcdUNdF1Cz2IaGnqhOiQK5+XkxohfPSv5rFNu22O
	cndiruoeV17FVv56xVGyjEw7ejVpvDXJOu94O5Q2Mv9Y8PlyPBJqgznsfAbW4Bg0gL6BJK3V0G1pG
	jvH+P5+d6UfhHOjKkPaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJu13-0020Ub-Aa; Tue, 15 Feb 2022 09:20:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJtzD-001zfW-0G; Tue, 15 Feb 2022 09:19:04 +0000
X-UUID: 1c231fbbc4b4456bbdb132ff3f68bbc9-20220215
X-UUID: 1c231fbbc4b4456bbdb132ff3f68bbc9-20220215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 694702074; Tue, 15 Feb 2022 02:18:55 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 01:08:53 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 15 Feb 2022 17:08:45 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 17:08:45 +0800
Message-ID: <eb4a903b90020e8220768e9bb674b9de477006e3.camel@mediatek.com>
Subject: Re: [PATCH v22 5/7] soc: mediatek: SVS: add debug commands
From: Roger Lu <roger.lu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
 <eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>, Charles Yang
 <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, Mark Rutland
 <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Guenter Roeck
 <linux@roeck-us.net>
Date: Tue, 15 Feb 2022 17:08:45 +0800
In-Reply-To: <0846872b-03da-ee5d-6a9d-e6c9fa754191@collabora.com>
References: <20220127033956.24585-1-roger.lu@mediatek.com>
 <20220127033956.24585-6-roger.lu@mediatek.com>
 <0846872b-03da-ee5d-6a9d-e6c9fa754191@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_011903_079927_0E9381D4 
X-CRM114-Status: GOOD (  25.60  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi AngeloGioacchino,

Excuse me for the late reply.

On Mon, 2022-01-31 at 12:11 +0100, AngeloGioacchino Del Regno wrote:
> Il 27/01/22 04:39, Roger Lu ha scritto:
> > The purpose of SVS is to help find the suitable voltages
> > for DVFS. Therefore, if SVS bank voltages are concerned
> > to be wrong, we can adjust SVS bank voltages by this patch.
> > 
> > Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> 
> 
> Hello Roger,
> I was thinking about what this patch is adding... and I have a few
> considerations.
> 
> It's nice to have a debugging mechanism to read the status and dump registers,
> as
> that's very helpful when doing heavy debugging of the IP... but adding the
> possibility to write a voltage offset may be very dangerous: think about the
> case
> in which, either for misconfiguration, or for any other reason, the debugfs
> entry
> that allows writing voffset becomes user-writable, or a user writes an
> impossibly
> high voffset.
> In case a very low (negative) voffset is entered, the platform would crash
> (denial
> of service); if a very high voffset is entered, hardware damage may occur.
> 
> For this reason, there are two proposals:
> 1. If you want to keep the debugfs voffset write, please constrain the
> permissible
>     voffset to an acceptable range that at least makes it unlikely to damage
> the HW;
>     Moreover, since voffset write is a feature that would be used in very
> limited
>     debugging cases, I think that this should be implemented over a build-time
>     configuration barrier... something like CONFIG_MTK_SVS_DEBUG_ALLOW_WRITE,
> or
>     similar;
> 2. Since it's very unlikely for someone to really play that much with a
> voltage
>     offset during runtime, and since this looks like something very machine
> specific
>     (perhaps addressing board-specific quirks?), I would suggest to add this
> as a
>     device-tree parameter instead, such as "mediatek,svs-voffset", as it is
> indeed
>     possible to specify both positive or negative values in DT.
> 
> I would prefer proposal 2, as it looks generally cleaner and way less risky.

Thanks for raising the considerations and give these great suggestions for us to
think about. Since these voffset read/write commands are used seldomly, we
decide to remove them for better system security.

> 
> Regards,
> Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
