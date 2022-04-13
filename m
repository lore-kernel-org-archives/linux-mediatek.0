Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D3DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 08:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Iz2Zg1IDS1Vl3S7lRW4wIiu7Qp44ZKq56uwT7/Zfnk=; b=c77d97VwznhhfJ
	F0TpCca4n+wHDQ+GyY4sy3sX21KyMd42DrFoEMwcLLCtR2V19KG8CN8PZ/TQFOH6+kQyD3cOVF0rC
	W9mP8HaC76c37aUVivXa+hOQlP4G1/kc3b98n+GwLUOZvJCCYmY5QZXRl8n5PGxAqQY+jXT81iBYq
	nb0rKfYiOclbFTxVwasCgSYlakbghCE8UbO3sI0QXrE16ZogTvCchLkNmT41SUvvSvsFcdJdQ7X9q
	MQLbWtX7VV6KBvYrCjlgJxsuxf8SjoElWi69IfEyHqF0bW43CJDH6su3QG78XMqyGJ4HXWxiy3hOV
	+8jqv/4qIxkS5XBmwBJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neYN1-0003rU-Qg; Wed, 13 Apr 2022 08:28:59 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neYMp-0003l3-5H; Wed, 13 Apr 2022 08:28:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0A4221F4026D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649838524;
 bh=N54+8i5GUyHSDn86OtM+MFFxhEgsk+oZTT3Swq47gYo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TtN3ilS8e9E2b8QG9QL3kpeSfFSwoY6ox6+4eryA/KxxCTqFN5hSdKPSIYfIEXOd3
 K6YnceetuB9KQ+nREL3U9E5bzwGxk6eoQiQ9OIeW/LtqUm+gh9vZI4SbWirnupLA8B
 wcrIFf4fZp0WZSUVadqb2p0wrzsjHiZxCMWxiPe/aRn7a3uG1zJQHUNHqLRBTFPZT6
 5O7Pmj5SUmxZtaOjdQR+iNAUivMfaklEESNx19n9CssTCH5kCSeECTk7NXnbyChshD
 g8G3YVvJzUyNPAAO8LAQ8Zon6IyqyCBBI6eX3YbG0FM/I+BKSmdwLnw+A5ct95U4z1
 sx3Y8l7MPrqyQ==
Message-ID: <58e91911-1521-2353-342c-5de0d86ac9ae@collabora.com>
Date: Wed, 13 Apr 2022 10:28:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v14 3/6] dt-bindings: soc: mediatek: move out common
 module from display folder
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
 hsinyi@google.com, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, allen-kh.cheng@mediatek.com,
 xiandong.wang@mediatek.com, randy.wu@mediatek.com,
 jason-jh.lin@mediatek.com, roy-cw.yeh@mediatek.com,
 river.cheng@mediatek.com, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220411072403.24016-1-moudy.ho@mediatek.com>
 <20220411072403.24016-4-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220411072403.24016-4-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_012847_380373_D0CC7743 
X-CRM114-Status: UNSURE (   6.74  )
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

Il 11/04/22 09:24, Moudy Ho ha scritto:
> In order to share the same hardware information with MDP3,
> change the MUTEX dt-binding to the path "soc/mediatek".
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
