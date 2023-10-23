Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE74EC001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 08:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jpHSfgZVoVkOR3bemAQosAc/TVf4E6Udeyz70CVKkng=; b=b5Kv1xuTSNK8Ew+WX9WUHjJqBF
	qGm+cGc135kvgVWMUo+SdJSx9necalB4cyT6oWA+iB0LoVU8SKdXCZRaNQB5o78APxnE5aalPlFrS
	Msf7w4Ge0lzK/ENYiCi5dwLVvqH5ndUl72MEqMXB4N1ocG/UornySxsfWG7oM3m3xAg1r9WzckfYK
	gucKGuk884twHMGTIQKtHa+bfdDo7E96PQa/vh6D5cuaYgOptv8bpsOohFnt+g2f3kWxf5h5iXKAE
	neb1MHk0+WdgONRk1ADTnw+Ck16/g24S/SeOyk/ckABMg8pn/KyErCEXTYdGA/JI6iCEWVPbfPuSM
	dn0be64A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quqke-006pf4-1I;
	Mon, 23 Oct 2023 08:57:32 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quqk6-006pPq-2D;
	Mon, 23 Oct 2023 08:56:59 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B23A166072BA;
	Mon, 23 Oct 2023 09:56:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698051417;
	bh=m5sOlf88JxQVdhvZ4QyqxnIoJAF349n07cMPgYm2oSY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kGGO//Drvr8wOzvYw4iefUlX/JbppAwnndURbwQDEKL6wFewruL+35PX7SB/b20Kd
	 eSWHTjp4t08IP7eQDATPHI0XYHk6/+2S6KN4ksgh0x2UCiFn8xG6UbCDRfG1u2vSRp
	 PLzvpGFXhJjRaxYEcZDc+qvo9ZVD0bGLJtcvjLOfprCd8AYy8rnKs2W6W/nvNvvbKg
	 4YQkcpa9wdtQQiPBcKmJPWFnELltzU/jz7JFgrp0Ds9xjPM/YI1Fn4tZcei6MwK0WC
	 hMy9EjrvKleLulJQ3qsbAJr36Vle6zzOtBXgD1X9YWr2Dt0Dc9sjqEvnRG6eabsOKD
	 07tOtBJznwovg==
Message-ID: <cf2de621-5853-4647-a4fa-f9e92d601ad0@collabora.com>
Date: Mon, 23 Oct 2023 10:56:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2,2/7] media: mediatek: vcodec: Set the supported h264
 level for each platform
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20231023030640.16393-1-yunfei.dong@mediatek.com>
 <20231023030640.16393-3-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231023030640.16393-3-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_015658_850687_866B93D6 
X-CRM114-Status: UNSURE (   6.86  )
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

Il 23/10/23 05:06, Yunfei Dong ha scritto:
> Set the maximum H264 codec level for each platform.
> The various mediatek platforms support different levels for decoding, the
> level of the codec limits among others the maximum resolution, bit rate
> and frame rate for the decoder.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


