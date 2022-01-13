Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D07C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 16:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVNB1JmljnXGhmc5jZEUxdrjrUUiDHsKrI8yHrs2TJI=; b=DQDooWFg3qhq6hACUul0SSqUnV
	a5bEz3ZYF11v8nuTX5ysS0Gn36ghxZDyIQA6LPwD9hKIHhjFcNvR8qAQK12btLuqK6OOIcYYtBHq5
	xuC9Q6R7SaM3ExXR9N2kZb3orK+ATewa1wyfZxzYFEtNbUAWOvRi65+UtPyD2UV+gHtZfJij9h3jf
	YrT8XVNBQwU14YHjzeTCXYf4z6jI+4fv1P/5QE5nom/2dCAP1WChS9hr5qBok9A/Sb4VSsN6xLyIJ
	NH/6nIT4EMSUONPG1fXzfcGPxw0xjEGHMddeh8SQAUtw+x7cloEkoDV0HXvy5Vu3z0M8w0xPGMJNC
	y0xmPAmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n82f8-006Tza-Cf; Thu, 13 Jan 2022 16:09:18 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n82e1-006TN9-Fp; Thu, 13 Jan 2022 16:08:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6FD951F45F4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642090088;
 bh=CX5BVrZGpnMjtmnkkGDBUrKDbK+wnrQ4jlu0suFe+d0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ClpxEEt4qs9QScYID5xGreji+sSRuBNpKzpbKOHLFD9gzfnhZ6nktAue31R/ETqEV
 YlU7aRquOn4DONf+lTAezOsbYJQcX33XRKyzGP9D7l+eqEc8MJXX/Q85eXPG5oOswH
 kIYvrHt7D5B/0tMC5dWKbAWXt3TNunpv/dUcEicLB5wEOott5RqMf3O61GhvJ5Iq6R
 BohwOBDago+2BQtAvsYjCGbD/NuJJ0o19eyBXlpJ0HFDUK6YgIml4NcUz4qTTrA82i
 pg22z+b61uCIK0jZA2PeIA1v+WiwRIv/4A/PHLc5Fq718HUAFi7mBlNPiaz0SiYPuA
 AvqaPrqT319hQ==
Subject: Re: [PATCH v11 09/22] soc: mediatek: change the mutex defines and the
 mutex_mod type
To: "Nancy.Lin" <nancy.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 singo.chang@mediatek.com, srv_heupstream@mediatek.com
References: <20220110084645.31191-1-nancy.lin@mediatek.com>
 <20220110084645.31191-10-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <c8f94e10-1830-6da9-f3eb-ca973b74b330@collabora.com>
Date: Thu, 13 Jan 2022 17:08:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220110084645.31191-10-nancy.lin@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_080809_714856_F8217FD8 
X-CRM114-Status: GOOD (  10.32  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 10/01/22 09:46, Nancy.Lin ha scritto:
> This is a preparation for adding support for mt8195 vdosys1 mutex.
> The vdosys1 path component contains ovl_adaptor, merge5,
> and dp_intf1. Ovl_adaptor is composed of several sub-elements,
> so change it to support multi-bit control.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
