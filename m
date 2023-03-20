Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E610DC7618D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 09:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2a2Fpk0Bfc/lkPeCBPQWaM5vxZTMb/MAmiH6M4qsB4=; b=rqJMJ5bGeZc3RvrkDu1Q17NXJ9
	9YDDhyiZMP6nCb9UC4WmDF19sH3/hfmnVift+NnCT5lKmaCTJGYZ/EeERf1vTZmwgEeTSbxmakMwz
	xNO7jCqRU9U9xooLqmp3E/ScIrAaHfyEzfoO6i9svYdHHobhLloq06AhzrBOzLupC5KvD6kF4hTj4
	S6zupE8tLOzNBH7iUchkqMGIiW0rnojq5jHXihRaLWcA6rD0SQSB/PA1xtLXn672CXDSpqxk1S3Iz
	kiD0/23yvrsIPph6SbcKPAGdvOKAS5ULIMzJcFTAc5BDavvvvVPBuenPGDh2pXLzVzrCRM86YoJqf
	P3MZ5kXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peBjy-008TPI-2J;
	Mon, 20 Mar 2023 09:23:42 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peBju-008TNM-1N;
	Mon, 20 Mar 2023 09:23:39 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DAECC66015F1;
	Mon, 20 Mar 2023 09:23:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679304216;
	bh=kLvg39Gaq3ED8iaOlpcmqwM+ANaZdEUpeHZ6xeDIhuU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BM3SozDIU+HOpZ4vQEVxgOpyG3uXs4uOSCEw/s3e5vIlqAogkS0jXUEQcTW8oFysn
	 rfD7/qrIwRvJ9qge9FuEvzVcCG3/ebS3Iaw4S377uU0leeDvlecpJUoM2sqX6zwKGo
	 p+Q+T6eRn4M96IQunabLTIGGaR59+pMlE0yz8syY9jqbf/R1dtT2HpOpg3VrbsRRCD
	 9MLqJ8mcMNcBTZjnxrYg/TY55hEmLSmrP9YhA8hSTT8rhBR1tJvclYQs4GTiuuDmVQ
	 FHsc3qTrgdNOP9ZPkgm4A9Zq1he+gpnEeOql80mmuPijVi497gA732e5YEFE2PteTU
	 NpV293LM8BMxw==
Message-ID: <7a651e39-aab6-1723-c28f-756756ae74e3@collabora.com>
Date: Mon, 20 Mar 2023 10:23:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v3, PATCH] drm/mediatek: add dma buffer control for drm plane
 disable
Content-Language: en-US
To: Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Hsin-Yi Wang <hsinyi@chromium.org>
References: <20230320030449.5397-1-yongqiang.niu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230320030449.5397-1-yongqiang.niu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_022338_591298_D47B1C44 
X-CRM114-Status: UNSURE (   6.88  )
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

Il 20/03/23 04:04, Yongqiang Niu ha scritto:
> Fixes: 41016fe1028e4 (drm: Rename plane->state variables in atomic update and disable)
> dma buffer release before overlay disable, that will cause
> m4u translation fault warning.
> 
> add dma buffer control flow in mediatek driver:
> get dma buffer when drm plane disable
> put dma buffer when overlay really disable
> 

The Fixes tag currently has wrong format, and it goes here, not at the beginning;
Please fix.

P.S. The right format is:
Fixes: commitid ("commit title")

> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>


Regards,
Angelo


