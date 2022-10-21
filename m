Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B96C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 08:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=INgR/3LgqJRaQPIJjhEy1WHez6MV0ff5fuvIJZp0Ck4=; b=bgS5R+Yd8ZviRmPY6vOyTHuxUl
	Wk/Gi/2gMLzTeRcQT357G4pGQ+xcLyZAy5NE1Kwwx8DH0NsZj5MxuD36S/0EpFrUlnvoStg6shjvy
	zjVhtt0Dgx3dDT3q/16F039DSYaiqdL8oLptLDMiRwAx9UNcxACSZCl4GufOxY6cw4jUIbsl/GE3K
	OKr7yIDLLfz5WPoK1MuGNUklCmKt8KRgoekkk3wmSH04Pj1kRQQ8LVk4yBrJUTSKtcMCu9crWOHQd
	sYNb/RxH3qELb6rPFy6gq32Olx1LC4puuMjeIQR/cJCV7QkIRQGx1NI9/y9U01Ctrp/o73uXg40xz
	Nma0+qEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olngh-006VA7-WB; Fri, 21 Oct 2022 08:47:32 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olngf-006V86-7x
	for linux-mediatek@lists.infradead.org; Fri, 21 Oct 2022 08:47:30 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 261DF6602253;
	Fri, 21 Oct 2022 09:47:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666342047;
	bh=3eiZ7szUM3OGxgQJ5CQfnDH0rk8YT6swITKmzLR52I0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mYvD6b4iGePjjlYqWTUkjv03Z2uF4Z06HMzaQSws37T6h4GfMD7/RC4cZHOQpCCQ/
	 gDOmvcEdZlcDTL5Kkzn5wJf0h6g9Yyien7kiONzKR+T/Vj2/HXWQsT5sIgZNs9Y6N5
	 sjzzJTZ5V5Bgqpqn8TuMDVyhU+exACNyS+H98skwKVTV65XhLKYFhxgJA4WRFlegP0
	 PqT9UwHu8IuKkZKPHtAI6qsGoLJdHT8bxWt7caV5MUR3QQfkUC6gwWk1idweWTbKVj
	 leq32C5jEGq8sxU6Q8Xn+rwoVpHlpK53QtoHdAOh4YeJZtFdXUJHIdj9LucWVU9md8
	 LllCcCo8U8ZLg==
Message-ID: <bc4dacea-b4a8-89f5-a9cb-c698b439cc53@collabora.com>
Date: Fri, 21 Oct 2022 10:47:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 3/3] media: platform: mtk-mdp3: fix error handling in
 mdp_probe()
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221020071800.20487-1-moudy.ho@mediatek.com>
 <20221020071800.20487-4-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221020071800.20487-4-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_014729_441872_D873A60A 
X-CRM114-Status: UNSURE (   6.99  )
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

Il 20/10/22 09:18, Moudy Ho ha scritto:
> Adjust label "err_return" order to avoid double freeing, and
> add two labels for easy traceability.
> 
> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



