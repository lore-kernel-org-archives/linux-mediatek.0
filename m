Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2142C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 14:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BL80PvkVMelq0P2ssncxe8d7ZB5AY3wZtTG7fQPQf70=; b=QZKBBQ120c/6AA
	xDuCYySZiYokyz65EBtvFWZl5PFlA7x3UiUizK8t28ByCmW0lbKzjLuQpgkfOpYFiiBNckiAJicAq
	DCcw6HyryGqdi+4dY/0otGytkz7/aYdR9uZjKIC0fsFwCSv/uszItk9aRSnVNWEB+1TYF6rDhgLLa
	Q24nFODSkp3ST/KltwH5XZ+rxIvnIOcFb24k950voSU8CM/myiYs6mCfZxCXClty4PjRv2Oha57qw
	lrvlNw7NqWUdVhcvGHsG6VUOLZXf9io+1eqrMfCHgugZWuIbEhwUnsRV7HbwvoyhKiryz1J0Kj9tt
	+9vmZ6+GxE6zTeL6dHUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngoUd-0047bq-D2; Tue, 19 Apr 2022 14:06:11 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngo1R-003tsW-7N; Tue, 19 Apr 2022 13:36:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 04A051F4189B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650375358;
 bh=CLJk3c9oJ2tisq5+0Tred5vvArQwwllO49JGhi/m3Sc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=e3vTQeFNEXXBsciJkPie7VuCezMNfw/AJ+iFMyOV2osU2gRMKb3YXHi7YV0XqzV1+
 nVf7ocCj96E0VysaDA/xQVg6h4415Ut8uiKevzlPhGlYzjjQnmRl6ZJcWgkffPzXI6
 BY/2hJReqN4qT6sAp8SflPrGAB3a7h4mEdTjeSokqshfKRqCEA9iUb76/mwLbe2coF
 e8nq0w4siVmhC0MiHWU6RpkRDft9bpKKoCRp6YmSaZbmzt+seUpio3HNu2kWEuVsek
 RfImnL28rFCk7szFsk21Fr3CREhjSdNG0SHlUoVMfVGiGgg+/Civ1BrFttyPovrns2
 8CLBxs0gyF3Lw==
Message-ID: <d821a326-7586-62eb-aba3-1df4d0ad20a5@collabora.com>
Date: Tue, 19 Apr 2022 15:35:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v16 5/6] dts: arm64: mt8183: add GCE client property for
 Mediatek MUTEX
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
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
References: <20220418083018.1907-1-moudy.ho@mediatek.com>
 <20220418083018.1907-6-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220418083018.1907-6-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_063601_542958_3E5FAF7D 
X-CRM114-Status: UNSURE (   7.00  )
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

Il 18/04/22 10:30, Moudy Ho ha scritto:
> In order to allow modules with latency requirements such as MDP3
> to set registers through CMDQ, add the relevant dts property.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
