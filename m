Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB55CD13D1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 09:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aq6Gpe/o2M0tJkTqufF2V6FLfwEzXWHuokiQ+rFA21U=; b=dUxDYWeeRQLhtVKEQHlZjuhTS/
	um3VImh+EtSo/ClH2MwWNY10obGiXjUCaKkKoIs7vD03fo89unF/Hzl9rDN+IQEt01GelXYO4T2qh
	vNEih1CoZsEVworJkIcgys4VxLmMLgfmHDfy9JQnXcEJfe6J1pUWY8qjt8Isx4ZGeKghKpxokObyo
	oWqfPuPoi5lyAYP6uUGeIIYudeGDh7s6e0Hi2JcgXv2k7K9GsfXH+RX+fCSVcgTVoMDnp4fyho+3i
	hZaOCJM4WwkR6BBwuXM31a89g+0F8qqnuZHQZQjEi2ZovtdavhtM+sSGqOdj4gHwRyuPjTq1/i6+X
	55qPB2lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiAD6-00EuLA-2O;
	Mon, 18 Sep 2023 09:06:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiAD3-00EuJt-25;
	Mon, 18 Sep 2023 09:06:26 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7C1106607038;
	Mon, 18 Sep 2023 10:06:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695027984;
	bh=oof1nHN9tACZ947GQ2VLhaMIPFEc3JBhMrlsL+95qgg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U1vLZxQ3EcYiAWrB8+o60kkPxM97CglJ+EQd37dILEc0/AzOfm6wypcZrRrlt5YUo
	 ilRMcrPjveo4nygcDiR1xXg+hjneKx7zXYkIFHhdlIZi7anpFq6MFRof8xI45YAiri
	 QxXRESlGO0G2ncft8/IRDKM9be5NKd9bCbWSpxu3M+6P+e23W+B4hqhZ5hnq86iZ9E
	 bkwHeC+ac6JtKmCMrfvc2SRCpDVZu4x5KdUTTTbIqA7Xm1NggQcn7RGQiFp1DlKDjt
	 /f/nA/IvnOwrtUT0xEZGqJTyBWW5kvprNEvXbp4C+GqXNIP85hXeh0CS4XVVLwoZb/
	 v2/BvcIvIzcOA==
Message-ID: <f2d33884-ca33-9255-5d88-64ad4c6d117b@collabora.com>
Date: Mon, 18 Sep 2023 11:06:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 03/11] soc: mediatek: Disable 9-bit alpha in ETHDR
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Chen-Yu Tsai <wenst@chromium.org>,
 CK Hu <ck.hu@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230918084207.23604-1-shawn.sung@mediatek.com>
 <20230918084207.23604-4-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230918084207.23604-4-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_020625_826257_2D8957C2 
X-CRM114-Status: UNSURE (   7.42  )
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

Il 18/09/23 10:41, Hsiao Chien Sung ha scritto:
> ETHDR 9-bit alpha should be disabled by default,
> otherwise alpha blending will not work.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


