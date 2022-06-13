Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF34C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 11:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yq/Hgm/1oi11jGz25Vu0btwVE3MaxNxlXBSpzaLWblc=; b=Uiq3medyBWCyj7
	QoitKPauaWc/li57hMhMWAzePCosaw0FhPSBkvFVnT+hl6y0pa/EUHhSEgLFsM1kot52QyItXIJL7
	LdAw0xqr2Vk0kpczAvR8kowHvkljswd0SCFJIvZhPrK3fMc884dEDymRcgthZdA7qZi+pUIdnFxwg
	wa6eKfCbHSyEmIuU3mNufWKNOcODfEjR1oxd1Gg0P2qzPV+7mTU7HUptowlSzw4+dfeSuxn3iiwRF
	ApuOA7R2XrGaS0UidOKaVl/1CPeNU13uGcc+VEXjONQbMiSu9GXp8mKT5nDMOJhdM53Cz2deYhpWR
	ptsdowbLE3BX+DqbHy6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0hnk-0032Gc-2i; Mon, 13 Jun 2022 11:00:08 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0hnY-00327m-HY; Mon, 13 Jun 2022 10:59:57 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C575A6601668;
	Mon, 13 Jun 2022 11:59:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655117995;
	bh=SL7kBZsKi8cfowZu11mX4C6u+yfbALkOkOrY3sg1/m4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N7lJBxk5oRQl32dnAZL7WlZ349h3f7sVa4Pt0rqM4HPOnbCE1sO2TrxzgpaoCqYP8
	 y1emnx9HTaEcC6nx0gjEotmDvSaW10SpZRjV9MmeSACIeWaHPCl3qVA4UerOQxjIxk
	 G24kUO0wwX57taOva4+sfbb5gJDH0w1M4tnqsmR7hUijxqR0YGlkpc3k7nIyGYREKb
	 v+WlDIY7A0zE39k1+qf8/1OAQipOZblftdsHvpVDkdWtEQ8NMCWOvZHWzAGLlDQ5A8
	 5oNY4HaPvnJ1Dx08bqdIybmpcp80jyX2HWAilXnMWd3tlfNIUkTuaGrLOi0yPDGpFv
	 hznKLqaa4UTXg==
Message-ID: <4fb6af60-9997-2505-7d75-f09b376f027e@collabora.com>
Date: Mon, 13 Jun 2022 12:59:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v18 3/4] dts: arm64: mt8183: add Mediatek MDP3 nodes
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
References: <20220610064504.8302-1-moudy.ho@mediatek.com>
 <20220610064504.8302-4-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220610064504.8302-4-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_035956_741611_DB27ABCC 
X-CRM114-Status: UNSURE (   7.34  )
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

Il 10/06/22 08:45, Moudy Ho ha scritto:
> Add device nodes for Media Data Path 3 (MDP3) modules.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
