Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964ACC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 11:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqYm1IVj/hx668IkxbgsImIe/ae+16c/OLdfAZMd70U=; b=R3gzfFN/t+YNPsPWVgdPKcUCxf
	fzoKVG3V3wdYrgGCtOZJaXA3CLJLUcn0WpeFHVQgxjrXhJAfriGYMu8+zjJFzB9yzeECKGsd6hiaq
	5q2UF4mbmfJu/8ttzcZ9HqefHlhM/JPSX3mgLpWNI6LADG3ECN7CXnOFTsLxR3ZmGLbQax6ycl8PH
	prvRN0UHLu4OEVMz50fXrJd60XgH1XKjzD2Da7NPnn4TobUgq8pNJV4ZAg7a6adgl3PC65OxKhYHB
	G3N/4beRoKMLzEQH/WOhLevoAlAQsyv/rn56Y3ohDhKqWYkf8munI79qmVGp9Dt+H+6MrIWveFCEX
	M3QiYHFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Evh-00Fvsy-Al; Tue, 11 Jan 2022 11:03:05 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Eqg-00Fsaa-Io; Tue, 11 Jan 2022 10:58:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 7DDD31F43A1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641898673;
 bh=6wNTz84+3ppqtpBY400+qokq8ilHyLriAqhO1jTt7WY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=bOyZnJYRSG1IeiFNEA1vdrZDcq7HUWAO8NfRIzfYIFpbLpIKMPMW38bsUA+mxKY5A
 QZdold2V3e+xjNZzQ89/JA9zUkTrWm/7WEQiTrOtFLJZs5S80zJFFWe1gkOjGwOP85
 trid1U1bzWobWVbpW2icMcUqleBgHF2/TYKHCRXDZuerudNGz0d+SSUROkbNN8/P7A
 aZfiAuAzsu8X+hBZUdyC8/CwZkEBBfCJlpmVcxarA0cZ3ZEc/gmZ2GxbFl9aeo1z8j
 k7S6lm7xjWCJIgOQ271z35CkkS4wILbKJvaXd97s1xIgGwnvAZHdGw6H6/U2KzUJnY
 MltG58gR/jPyg==
Subject: Re: [PATCH v9 03/15] iommu/mediatek: Return ENODEV if the device is
 NULL
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, yf.wang@mediatek.com,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Evan Green <evgreen@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org,
 mingyuan.ma@mediatek.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 libo.kang@mediatek.com, yi.kuo@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, anan.sun@mediatek.com,
 srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 Robin Murphy <robin.murphy@arm.com>
References: <20211112105509.12010-1-yong.wu@mediatek.com>
 <20211112105509.12010-4-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <a6a8bb2b-8538-a27c-8e6b-21eb33ecfacd@collabora.com>
Date: Tue, 11 Jan 2022 11:57:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211112105509.12010-4-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_025754_849378_FE562BCF 
X-CRM114-Status: GOOD (  12.42  )
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

Il 12/11/21 11:54, Yong Wu ha scritto:
> The platform device is created at:
> of_platform_default_populate_init:  arch_initcall_sync
>    ->of_platform_populate
>          ->of_platform_device_create_pdata
> 
> When entering our probe, all the devices should be already created.
> if it is null, means NODEV. Currently we don't get the fail case.
> It's a minor fix, no need add fixes tags.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
