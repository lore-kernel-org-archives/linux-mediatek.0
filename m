Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC703C001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 08:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+zDRrf5fn+Sc34JAY+ENyKkE76Qgh1NP/fHFByKu2Mc=; b=x5sfnf1rBRV7Z6sNAXSlBYhdiu
	A9zovRJBVmcfqILn8+qTas8ifn/9gCNHLxvxQxkBKwUJPxYnExVEw3+qYUHogyp7VmxLi2+KqGIJW
	/54KsPNx2GMxip4BSYu/NmvCrK3I9nzKCdl7uxeeb49mXOXaS5FpVRpT0TRUZhVb/eLMnVOrlvVR4
	+lL1Y5CsiC5CL+zNC/ba2l3weBkjaeINQ6NdCtymsoDRsDDYRx9q7QEBRrMZk90bUEQU/kcUbwkMq
	CRx/UPXo5Z3A/wv11AUqbKsBrD/gTfwfPxi5XVnMyh88NTu04lUn1CnHhnr9I8MS5g7+JN+TLuEmq
	iMDqHA/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quqkN-006pYD-1m;
	Mon, 23 Oct 2023 08:57:15 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quqk2-006pNh-0w;
	Mon, 23 Oct 2023 08:56:56 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 496E866072A7;
	Mon, 23 Oct 2023 09:56:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698051413;
	bh=IJb+TCZh/kfGnk0oqJJZC2x/pdX+EuXkd62kRgrc6wo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QQY8v5K6pizejh8QHjCjw/woIF9HrNfwBsIxUnf20R6D5fHWS91/y9N2S/z0lqXGJ
	 3XLzydIvRJakWpUaPzNinx+FC1p5oGC1oTKSXkRSWoU8znwbpeNCHBimv7n55AjUYp
	 OiWE0XPxf7HVRrE5zt4/LzAp9jl8Ld2VsZVBuq55o6yWfOWgOgKEC0MZZEPAJNaBlC
	 0cXIacZvvO1InZMKdxBwpP0VC6Ftta3kZjAiUDdLYbts9yTqpBwCyqOyKaOCEOsYkP
	 Ds9bn6KAI67YOG/qFfAUbGGS4PREiyPjASfOWfjHsyLesHFzWeJgdJ8VgE4oE724E1
	 apSNOGvCPTS7g==
Message-ID: <b64c5ffe-1ec8-4213-a914-3f7349985275@collabora.com>
Date: Mon, 23 Oct 2023 10:56:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2,4/7] media: mediatek: vcodec: Set the supported h264
 profile for each platform
Content-Language: en-US
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
 <20231023030640.16393-5-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231023030640.16393-5-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_015654_458375_0CDFCE39 
X-CRM114-Status: UNSURE (   6.19  )
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
> Set the maximum H264 codec profile for each platform.
> The various mediatek platforms support different profiles for decoding,
> the profile of the codec limits the capabilities for decoding.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


