Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBEF9EB8FDE
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 12:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gT9TYSAc7QtrGO9iOUyhiekSlxm62r9CKrgy0M2maec=; b=jnW13JODrBNcb/HTDeELdxhIs3
	N2Ye+4WFiG3coZYTZXRGZTdRNcuL7iPbxEZpnQamF0E0mV5uD9dBNmaFqo+GXT6ZvcQQS9NjY/ILh
	gm8vF417o9+Z7RuMLmA546IbHUPnRh+c9uFj9961smLP+a98yo5rCIDIpMVVNSfY5S/I2kWM6pUYE
	87J/4ebFbznQp+c3cz8cMwOdHuq7tNTENu+Kpyv1GoCqpnRWkA/Ph4XuAvwR67R5hJK38JxHabYDW
	8pPhiDNbit4zslk8TAvco+sbPtCdI+e8LzL6LAs5ag/PO1JwGeJe2pbJoHVo+dcTDB5RSkdT+uxM8
	9CEnBc4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeDwg-00C4ZB-39;
	Thu, 07 Sep 2023 12:17:14 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeDwd-00C4YR-0m;
	Thu, 07 Sep 2023 12:17:12 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 19389660730D;
	Thu,  7 Sep 2023 13:17:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694089029;
	bh=+ZEmJmzjGb2pOYORx4+WouiDGRIQVqAsgte7HXYYAmA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gv4C6/9p+aSstBoY/hH6uNhgjOjUD6aRAu9+CCIiVJb3XImDtYlssSyLCLXQAj67F
	 lciXdUz1CoNdTvwMr4thfnWhCZEQW0OzOy7IKdo2orRdO7a31s7xm8a+zfy8+vSsf3
	 LkKmTnfHzXSq0TeoUtC8IkvTf8zKwIa0pmdlJcJaVgh+78ppR3QOGpb6DHKvQp+4KX
	 mlGGpU4bCSS27hsIIb6fEw01oGQVQw6DKiSzKzzA0gUxg6tsOqY/NLCX2y/zEPszR0
	 nSW0TmUEV3107uWiS5ZxTQccopa3FaIjkDGTQbJp5FXIDsTIUy8XC6yT2eicGZBrnr
	 U1/GUfDaP4IJQ==
Message-ID: <8f5a5e7e-ca4c-3f3f-08fc-bf9591060cdc@collabora.com>
Date: Thu, 7 Sep 2023 14:17:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 05/15] drm/mediatek: Support alpha blending in display
 driver
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>
References: <20230823151332.28811-1-shawn.sung@mediatek.com>
 <20230823151332.28811-6-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230823151332.28811-6-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_051711_410311_3D8E511F 
X-CRM114-Status: UNSURE (   7.33  )
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

Il 23/08/23 17:13, Hsiao Chien Sung ha scritto:
> Support alpha blending by adding correct blend mode and
> alpha property in plane initialization.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



