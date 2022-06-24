Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8336C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 10:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/A5QT4kdhtrKJG3hMyI+I9Uzs+XTOqX0qMqaJ2neM8o=; b=E7KUzo7R36dvhyaVjq0EyXlC7g
	7ExSiyFc3KNQOvR9pSpZ5ElZi4vCi5oZUepQkjz9b7AFtM4D4isG58cGujwmNhjLufmuiq0FomhH0
	nYJPUObI/aMXv+629ei0PM4lnbfXDd786aM056qwYdiSALHe21aD/mYzvBBwDUjPxYyNmshoJGUGH
	1OiLkqxOltbuoDOR+XdYispD5TDQUX81S890IBs2BQyRRaPshfA0feTJc1ew/YgoF1/HGXrWBbcou
	6nQT/nqAQ9K7n4m1plMX091SLiobmdxT95gwmV2j684yOEdqq7fi7VLZBDJ26LN4uevO0PZ7Jl3OY
	uZdDfSQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4gZq-001m7z-FZ; Fri, 24 Jun 2022 10:30:14 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4gZd-001m28-FZ; Fri, 24 Jun 2022 10:30:02 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 86A1F66017FE;
	Fri, 24 Jun 2022 11:29:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656066599;
	bh=SVkicnIFIqfjKCBb/ZVvLtK5Me40EK4u1MWUbzwiT7A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kViqkR7iC1Wp/5s4I82zUkb3ZSL5j/ZXPllVjTqXfaoZgzpbARUo44bVpE8dUmf+F
	 HhvVGqPvdkxs0jVyxFnCkfm7Mjm3ACrUDhKrRTyWAISOBsIPryGt4I1HLEx0cyrJcU
	 7XHE/NHd4gbEVrOR/Hgvs6GDrEjba1OBgEv5F+6OzHmvMIVzvoajaAC/WcfnFdsL31
	 43TkeqwUd7VzMNjLGJqfr6E3Zv6hmBcpiKyTa9wU5a206RrRCnNZeKEh6GLt5ldxXM
	 heB7c2yLTYuIqMgoWislASCK5/WsRYPCi/ws6nCR0JfeJBVDUABMU8h8a9npw7i5zx
	 T/Ms8a+QgTmVw==
Message-ID: <c7f76e77-6fed-9876-e0b6-8471c0024a82@collabora.com>
Date: Fri, 24 Jun 2022 12:29:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v19 1/4] dt-binding: mediatek: add bindings for MediaTek
 MDP3 components
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alexandre Courbot
 <acourbot@chromium.org>, tfiga@chromium.org, drinkcat@chromium.org,
 pihsun@chromium.org, hsinyi@google.com,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, allen-kh.cheng@mediatek.com,
 xiandong.wang@mediatek.com, randy.wu@mediatek.com,
 jason-jh.lin@mediatek.com, roy-cw.yeh@mediatek.com,
 river.cheng@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 cellopoint.kai@gmail.com
References: <20220624092359.11908-1-moudy.ho@mediatek.com>
 <20220624092359.11908-2-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220624092359.11908-2-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_033001_724341_89927580 
X-CRM114-Status: UNSURE (   8.34  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 24/06/22 11:23, Moudy Ho ha scritto:
> This patch adds DT binding documents for Media Data Path 3 (MDP3)
> a unit in multimedia system combined with several components and
> used for scaling and color format convert.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


