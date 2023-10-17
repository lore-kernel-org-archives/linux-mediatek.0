Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C31BCDB482
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 09:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=++CJ7QxLtaHeBuA9TRIlF+Gy5JqJ4WRktMBp4loDimQ=; b=XYgLhKsHWjoCHy
	iX9TdXV1M/jj6CvMe7NJXL5F+kGC3TVTco5KZPumjef+owkpjbOZV5jpfqHD/HSj7kb3EVTrYynL7
	+yEgfrFHq3xPFinTBPFxUZu54uig8HK49rDfnRC+Ft4wbZCAuoGdwm3+BKoa921NWsuomlmdp/WCx
	N6va7pFz832QwhmpC4gKvwqnl0NzdA6vVW97X0LfEm46RpABa8LATfGM8iMcpPWBB28YaxlyurwCb
	HHRprRpQIEPuvWhrxfE6tYyR+I0efd6hm+VegZZaSCIiy/6lNAJyuGT1S16ZJCy6jN+wS2SmozKeO
	HrXHONExGjZiWTjmG8vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsgZf-00BrMP-1N;
	Tue, 17 Oct 2023 09:41:15 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsgZc-00BrKL-0f;
	Tue, 17 Oct 2023 09:41:13 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DB11166072E4;
	Tue, 17 Oct 2023 10:41:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697535671;
	bh=uWopz2l4ztZi8CjWSNtPqJmsfX3SAwxisTyb3uW4K9Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YnAkHri1PFq3SlqsU5RkPFJFbj5O5ZbLnTuXp9y3BAkedLQu2JUqQ5UQe9e9dPnwE
	 Qm1J/IE68xyiWtFpuvbIdj+GDINugnH/JwVjRhbTuXgLzs9qQ8TF8rVMMtrv+Km7q4
	 id5zWDCqUbXvPRUoiDZ+AnVuph74xvMAZ5RvjODk244QzcHWsRRVNnce8gEQHB3ytZ
	 uRKJyp4TIv/eOX9+cx358V3RWZMudce6RS44c94kDDKwnq/g96ojrEPH5l/OL9elnn
	 +3xz0oVAToJ1JzgjQ2dcB2KRd5BdSSSMjT2CFnGSidMvCNAANtuwl6RsIzQwRgyInQ
	 ssONO8WMuGNrw==
Message-ID: <3aa34fa5-1dea-4cbf-8a31-a405581edbe8@collabora.com>
Date: Tue, 17 Oct 2023 11:41:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 15/23] drm/mediatek: Manage component's clock with
 function pointers
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20231016104010.3270-1-shawn.sung@mediatek.com>
 <20231016104010.3270-16-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231016104010.3270-16-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_024112_371474_66DA7D3D 
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>, Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 16/10/23 12:40, Hsiao Chien Sung ha scritto:
> By registering component related functions to the pointers,
> we can easily manage them within a for-loop and simplify the
> logic of clock control significantly.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


