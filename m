Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB728C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 09:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Edn7r2TN09K8lgGnpm9mx5tmtH0Hu6j3jnueYn74V0I=; b=4e5NGIb/dFOr9v
	N9pWHxbb0acNvkcvEXj4pS9aEiDUh9nTWoJh93KAG4JkmOtAaL/K6HxyMPcaTvZjxop1bzsYn0dk3
	xKRrHu1a7XFOZXEc1UrsuDofR9zUPBZsOOj6/j4wV0JYvPVazlDE8oHaIF3iC9zm12dXYQgg3fpch
	wgU/7ZikwnUMYHJdJx38fdgkpPgpZvMrbMMh1m06pkqd+GM4BH64SHxCCsqjLhzTycW7mqpyZ8x0L
	xrcsT024B81wAg5Vyl4ZiXqPfHBMvSlmLbNZoLmT5j3cwt5shyap0UT8+kUfhUeR3x89XLwIPsWOm
	cE5eN3kW3fv966IYwSLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU3DN-008SC9-5b; Tue, 15 Mar 2022 09:11:37 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU3D8-008S3f-38; Tue, 15 Mar 2022 09:11:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C27B61F4362D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647335480;
 bh=1TIjYxUIzrUcUtkIzvjK83uWwBmpWowBdk2vT3qrfB4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hc18r/2VhHcLCyT5tOK6K0gMZg2BUIYeWxzPdNXrUDdcry5i2aCoiwzDYI3C/AArt
 qwjpq0lhm34aTRSDxdYbOWGP1/usfC+Xnyl7SKf3rPmdnMIoEtvv19DewnivX2da9R
 p3i+gLqSO4j38aAo0tir7njB9d/JLqkT/tnQhk1B/lKeAgiyAhp55p8ov/gUFB0iHu
 aQjmyc16vrLiwyVgQONEgKFDw8FWzUYSwt5gO72JUOgVN1rnBlaJeIVvi4346YZ1dx
 xDd3biZpumDKjKH2FmAHFmwUp3KSC24CfIornDOy12v6ds////QzXG69H99jMuazxX
 1vdRKXcd8O2tQ==
Message-ID: <13b7e834-ff42-76d4-e82a-563bee23f1aa@collabora.com>
Date: Tue, 15 Mar 2022 10:11:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v13 2/6] soc: mediatek: mutex: add 8183 MUTEX MOD settings
 for MDP
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
 tfiga@chromium.org, drinkcat@chromium.org, pihsun@chromium.org,
 hsinyi@google.com, Maoguang Meng <maoguang.meng@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, menghui.lin@mediatek.com,
 sj.huang@mediatek.com, allen-kh.cheng@mediatek.com, randy.wu@mediatek.com,
 jason-jh.lin@mediatek.com, roy-cw.yeh@mediatek.com,
 river.cheng@mediatek.com, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220315061031.21642-1-moudy.ho@mediatek.com>
 <20220315061031.21642-3-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220315061031.21642-3-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_021122_306402_C3B75DEA 
X-CRM114-Status: UNSURE (   8.76  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 15/03/22 07:10, Moudy Ho ha scritto:
> For the purpose of module independence, related settings should be moved
> from MDP to the corresponding driver.
> This patch adds 8183 MUTEX MOD settings for MDP.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
