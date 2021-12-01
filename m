Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E78C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Dec 2021 12:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RW8HXc9YgTe4QLkKG4FRwVGDq/w/MKZHEUFpOq9wzw0=; b=ZcBRO5TFsczOrV8dtB5jGpZRt4
	u0u9nJO/T/LPA5Mp7Xa0P2ZcP5arOz/uBhh5I3GhZygZrIE64nC0ZgC20PM5c13JV8Sdhwlgn4lGz
	wy2aFtLiHHOBwk/tsiVwXNQRo3f3a5zQkgknnKTbHFhpREgLtMKap6eKMLb7xlDc7wzJLmoirBH3k
	AtbgGZ0nQVH46vQ7+ZGOu1sDi8jvSHUP7ULt+xlyEdWnV36Nq7KqqfSAKYqCZrPC3ZiSBm3lZu+n2
	JQwbpwYlGo7s78UbdvEq5eKLhgEr01skvqKqKBtS4oW/a6dBkFSbOkXigJu71YwB09f85VcSBKAmv
	UjOz/2xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msObC-008Prh-EB; Wed, 01 Dec 2021 12:20:34 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msOQc-008Lck-F4; Wed, 01 Dec 2021 12:09:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 468B31F458EB
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638360577; bh=QeEqEDtOecDK4Kb3DJwm3YYrksMuIw5id0yxMAABmcc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=TtUGI1CXSHdO+nJWaEL4I6OB1+YXXPYU9/3sRSHnDNmiAXWUwfPJOhlV9XkzS5KKM
 LvUscIrrct16pBZWKSHpwFqS7oOU4qMYnyMCYzZVUiqRu5NQScr5JllKBIGu2sjZyW
 W2biuNqoEzzlXWPo9mbnhhPNXQBkwGlU0fia625I6ScYNxgu4oaHv579NoEPfB911E
 IotnIqUX4mXkTHJuSEBFE/Ed54/fpsm4ilHW6K4fJWRv5ImEhG4eeA68rWm2VNqQCr
 bHdj/obI7I4aFYv+97RHeB53eCIM15L7LkUyKegriKywQJB9RwgKeqDAaSR8DD8CVL
 ku97afABjxOzQ==
Subject: Re: [PATCH v11, 05/19] media: mtk-vcodec: Support MT8192
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20211129034201.5767-1-yunfei.dong@mediatek.com>
 <20211129034201.5767-6-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <3fb4e348-295d-9ec4-43b4-0fad06b33010@collabora.com>
Date: Wed, 1 Dec 2021 13:09:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211129034201.5767-6-yunfei.dong@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_040938_700293_52123621 
X-CRM114-Status: UNSURE (   8.99  )
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

Il 29/11/21 04:41, Yunfei Dong ha scritto:
> From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>
> 
> Adds MT8192's compatible "mediatek,mt8192-vcodec-dec".
> Adds MT8192's device private data mtk_lat_sig_core_pdata.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
