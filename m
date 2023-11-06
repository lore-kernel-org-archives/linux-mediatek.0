Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C498C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Nov 2023 12:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J3D2KqWEwuR4iYm35GC41gOLnVYaa9Ob//vKuV3+9DI=; b=sImr0KWZg41mBDYcZz7XYpBtsj
	7+5J8GLL46QPfg6YIu0qmAKO2UxDlFCprUvwKQbHIsGMvNS7zjFSLv6JIB3p2x/1G4VuK6jDb5iGF
	HM67XTjPuFPrQ+818yMp/XatQK2Bls6egW1rMGePLabDtf3wp5TDYV/hFXz17xBwmYo71Usc7WDb4
	9f3Ckq+rDPux3R83oYYgYdhKGjxXhFy/3Hy3I/IZf+zJQVI1ThdlaUuUP9kp8bEZikxStj6vAk8SN
	kW87nE811C+AfyJGf2iETF7UK6g0yHPbhngS0FJ88dCOj80RLbo+rdN04ZgrzsEniBpsgf5FH5kHA
	LCqCreBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzyyW-00GfGj-10;
	Mon, 06 Nov 2023 12:45:04 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzyyR-00GfB8-36;
	Mon, 06 Nov 2023 12:45:01 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 482CD6607483;
	Mon,  6 Nov 2023 12:44:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699274698;
	bh=uhAf/mZ82cApzSh3+dO27vbS+C6yfFCJQj4sXp6ctfk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e0s6R0JWQXwywvKnx9Dd4KUQHtLsUS0p9j53qUXjY2s9mMYmmlUUFy5LRuzvsIsJQ
	 5v1N8Uv7MnTgbNzIEwA7s1KmGdm8nvxzSixCG6qX0xkYH075qIpnETwAu23vA2NtKa
	 e8PQmdhk+aRD08yEjZ4QKk10jBqZimwAYHpuldetLpa9qFEPguohO7G7vCEUUNqyoH
	 dxhcjQaVvmss5bvNrs0BqnQyYs/0/OpO67GKuTQJ6qMFVJGcE9Axqzc/nTcNYvBD4x
	 AWQwj7yfI/XqbRTeofQt3pXEhC8XEGfKpVe0C9VYPvnuh1xYFqzxte2KY7yH8ELVTI
	 keObYxWi1ygmA==
Message-ID: <adc02879-b27c-41be-a496-3c3d9def4b70@collabora.com>
Date: Mon, 6 Nov 2023 13:44:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/12] media: platform: mtk-mdp3: introduce more MDP3
 components
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231030100626.12564-1-moudy.ho@mediatek.com>
 <20231030100626.12564-5-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231030100626.12564-5-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_044500_133916_9DD0AC0D 
X-CRM114-Status: UNSURE (   5.74  )
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

Il 30/10/23 11:06, Moudy Ho ha scritto:
> Add configuration of more components in MT8195 MDP3.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


