Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B020DC0018C
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Nov 2023 12:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBKn7OXuLpElzqeOxiFef3m/W5QJRrsacQJVb0Fh1Ao=; b=BTIGCYLPeZJdmM10F9DTBE6cSH
	hvDd7x1xKLKke2rJT0PUtMh6qhQFabKv/O4LYB+xYZ9WI73zlay1Bvpp/qY/IujGrlY0OgDA4eaj1
	6xVvqP5XAVMP4/0tx0hUKtqO+HIqMQKRbO4QQPB1rJpL7E9Nd1FkqFJjir0z98OC9UrYf3EJt6hdJ
	GwVLqeiQJr7RF1+/R5NeKxGg1k/ou+eqHxSf3mtWmDyfQH79rjmt0RaKewoxhYLijMO2ALsq09y/G
	kuYFM/gP5dYUYx4SDZ6N+SWVPfvcRVHn3d9oKoXKOSe8EU3veA+j/RRzgRZ9IQWeP8GQJ55wTU6pZ
	g2acTBqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzyyJ-00Gf3g-21;
	Mon, 06 Nov 2023 12:44:51 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzyyF-00Geyr-1L;
	Mon, 06 Nov 2023 12:44:48 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9D5566607483;
	Mon,  6 Nov 2023 12:44:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699274685;
	bh=Ri0yYh82tmpSsPL/9GQYnHY9qIfhLuzQCQdFwyp4wiI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hGjMpE3kxfzVhiNwWFTeHuo9VQ82iwCYaOek19o3z/NGsWjAfSrXXbqUUJY1s45na
	 m9CaJo9GUf96DvULrlqiB9lAHasgQWudwC159hkmi29OEBia5ygshsrtqGDMGP5MAx
	 MKAFmg+Pagpr5VLgWuGxqqguL7R6f157Zz8GhVf1LVAN91LlYgHOK1oM2swR8gQMfn
	 DORCoIs1SolaprzLUrVfTOB8i8i35kL+3pAYzLV4kEvSoQtK+3WKzvaNLAh5Xt6NF7
	 eUgLGIDW6wDFPzHMYck2cE9e8Jxd4ZUXnF0BIOMFlbAukMdGYj5dG/72fT05iwZ4hF
	 VqN7NbqjxOmQQ==
Message-ID: <5445c24a-3bd4-4fb2-9cf0-ec9fd61da6e1@collabora.com>
Date: Mon, 6 Nov 2023 13:44:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/12] media: platform: mtk-mdp3: add mt8195 shared
 memory configurations
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231030100626.12564-1-moudy.ho@mediatek.com>
 <20231030100626.12564-11-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231030100626.12564-11-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_044447_582171_D3E19E74 
X-CRM114-Status: UNSURE (   6.81  )
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
> The configuration of the MT8195 components in the shared memory
> is defined in the header file "mdp_sm_mt8195.h".
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



