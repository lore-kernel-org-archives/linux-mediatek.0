Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213F0C4829E
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 10:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzTfduH6ZsgBAgstO2GjEZSx8vorH5G/25gXF1UqqFM=; b=gfdYZP1RPKnl8bj3jtho0Cehbm
	5Ers39nTY6V3+G/L2kpZp2BWcMNdVI49Kg/2IUXBdD+mSEvHrqt42FAQsxSQW5QWJH1gplhZzAskp
	De+vI7ePqKm4cUdako0FxiqhDKwe4TvTpYplU+zVv5552vYo/N0iS6QlogAd25BcjbYaXuF+TJ+gY
	5/ZSNt4oWN9IVgk161zoBy+IjvHgryYeJIhkhgwr/6bDBfnE1oJ7DMRKBWN2u1poH1BD+oCHyFZv1
	lD9usbaRRmkgcfrYoMCbJhd1LS+7/hTtEBB0GsYD6O8Nj5WM+caY66T+kXQMQlPdQ3idVoh+jnsgQ
	hUXw9kZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZAj-0000000FpFy-313J;
	Thu, 15 Feb 2024 10:40:53 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZAY-0000000Fp6c-0CWi;
	Thu, 15 Feb 2024 10:40:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707993640;
	bh=nlxfPyXyS3DwmGG0BjGsvfTGa8VmVgMDtRQi5cpSk9A=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=lvNejExaB1qI5bWedf8hfgnoRDAu7TxJusVk/z7gT3DXCw2RO85eW9To3JW+1uG/f
	 4CLBzoNrZmESFPRgsA8Zjk0ZlOMULiBYQYH965sijPR7IydFwAhksybhj6s4WRi/19
	 amqFsPUd3Bse7TxQGPv5C6h+zEQzkAeRdReuPnPh6gEXhuSbUy5u+4Dvp1WdVOLpC0
	 InA3ywfYSCayXP3UnuMiprRyVphrBMfbPlJB6r/7Nw9uOagcz7Yo+i2vhYP9vjU8X7
	 rDoUdZkPMcC9LfEqhtQcWPsm2zM+3qnCs6G6RdLmFVbE2YWUtEBbey1RnMmo/Z5Znr
	 t3tXWjJeQn+dQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 50CDF37820B2;
	Thu, 15 Feb 2024 10:40:40 +0000 (UTC)
Message-ID: <602e4364-c65a-4a32-a411-444a40a5c1d7@collabora.com>
Date: Thu, 15 Feb 2024 11:40:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] drm/mediatek: Do not store struct cmdq_client in
 struct cmdq_pkt
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20240215004931.3808-1-chunkuang.hu@kernel.org>
 <20240215004931.3808-9-chunkuang.hu@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240215004931.3808-9-chunkuang.hu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_024042_271483_331C56DF 
X-CRM114-Status: UNSURE (   6.52  )
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

Il 15/02/24 01:49, Chun-Kuang Hu ha scritto:
> MediaTek drm driver has the struct cmdq_client information, so
> it's not necessary to store this information in struct cmdq_pkt.
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

As said in patch [1/9], this should be done in the common function, not in each
copy-pasted function in mtk_drm and mtk-mdp3.

Regards,
Angelo


