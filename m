Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134F6C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 10:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mysm+qTVyD0BglvhjenjXy58bLV5qsrHmjbdcwJlic4=; b=Hgjt/DH6cZYTvl4b1SjJKLJxy8
	S+77y+fwCYjEuXbf+kbo22hXkUuUh6QBZDTcIsr0VyFyv1i1vx9ctDZnIdAJKXJemi79C58PZQ/Nj
	9cFQEBNCPKEerMfHOyju4vu5zSWfre44b07obbIkTFuy9DNeLtxNuXea1t/Pohtu19K1gfpNeBTHE
	cmOpbph0/HE3oTClWSfRbo93J0DSM/rHG7uGbsu+lpceSh5HmQEqVSLSBLQ4sXF3zaY+n2NuscPjg
	9g2WmwRK67IEn2Nx7OVBCyz+h7Idytv4C69YPXlk4xPOgSIp/hiX53uiYkYr9MDTNT9fHbbRntp7N
	GpuGx58Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovyKZ-003Jhl-Om; Fri, 18 Nov 2022 10:10:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovyKL-003JbS-53; Fri, 18 Nov 2022 10:10:30 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F1DD36602AA7;
	Fri, 18 Nov 2022 10:10:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668766227;
	bh=36XHqXHW9/4pThD2dF/5JFo7f13qGtp3LHEod+p8KXQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GnB3VAJyaDI54TY0WKGzD12xkMUnqgE1NeVQZNzB0IdnmQfjabbST7saZMjqNShtu
	 MAeFO1+tfRr2nchORINd5e1PzClkQgrD4Lusa8NuQszuRWaUGXE7VCbO4CemhgHBoO
	 k7AYWhyB8ItQXbeLxUKUSKZ1CgSbUuB3XOcrdD0eG5zRU7imUkb2SGpvwz1OeC+Aku
	 AnKR0ZIkTcFRZGTVS9ZiT2Ys5pYHDkKNFe04KFhhnGHHoStCriNNR96BahtyAGaPvp
	 +tpsfrT7sWAvd0yIviDiySTotR+RVM5YYFGvdCK8Lu5fbHcnMo8XkuF/YvFsUHGAEz
	 XsQ3Br4H2ocWA==
Message-ID: <b09a64fb-262b-6ed3-0399-de0c9f438385@collabora.com>
Date: Fri, 18 Nov 2022 11:10:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2,4/5] media: mediatek: vcodec: Setting lat buf to
 lat_list when lat decode error
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221117092453.31366-1-yunfei.dong@mediatek.com>
 <20221117092453.31366-5-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221117092453.31366-5-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_021029_376670_44FC3912 
X-CRM114-Status: UNSURE (   7.67  )
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

Il 17/11/22 10:24, Yunfei Dong ha scritto:
> Need to set lat buf to lat_list when lat decode error, or lat buffer will lost.
> 
> Fixes: 5d418351ca8f ("media: mediatek: vcodec: support stateless VP9 decoding")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



