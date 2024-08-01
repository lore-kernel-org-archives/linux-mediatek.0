Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E33C3DA64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Aug 2024 08:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4wSeHRLvrtx6lIG3XTKfFZOcOlMqDAIxlN48OfcEdo=; b=TSKqPDzS9koZM+80gcrqHsSxi3
	GJniMB9/y6XqkXJ20VBmgRgAlNofBpChSsxzEEIQJyjzy117dfWCWJZxBHpJ1mvv2/Rr8w2WS/zbn
	7w3ly6mc6Awp0FcWQcKvPTDfPTZ/IjbrO0vshddzePZ8Am5GELqQKHmGb9/hsCO9u0bXFBiaQhNqf
	XcLk1VFD92RhkOC2OFYHDsQWs1lyceV2XQk0eLyjfo4a7t4JsloFAIkN0jKnrouzjmF0amWAQy9ao
	oXbmu7Ad8jsPvs2XucfyzhvNtznFjOuTcWigCmz0LSELhrVvZkX1Sx9JjVdSqv7z9mCWmkyURf+fX
	x86iIgFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZQyx-00000004J1w-1sKa;
	Thu, 01 Aug 2024 08:16:19 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZQxR-00000004Ihq-06vu;
	Thu, 01 Aug 2024 08:15:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722500083;
	bh=x784ej56BkVxJ2bKoYiQJDFgu13Aw5tgE7YRjViXbk4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cJBKVRkeOHrH9TpIXhjSk/eCcG+3vxKtY3WmSZn0SnxuE8r7kLpW+ziLwmz6Za9tL
	 VENRc4DApAvevBFW5lWFR1bPTNMhu6bDfHnR1FnxLTvhpu49McuX9GlxG/ifT/jHpt
	 xSnDqkgFNczrs3fdLQYTslwfrxijGkj3S9Dq3Y0UyNc+oroZU/5G0/Kqa3eW+Khggb
	 mBBx2qOeVH5OsmUGVCiKUYQQxtyaKrsC+k4Gl/QAx/LRMMSzuF185tZDkU5xR+EB4F
	 mt/CiJS4+yr+fSDsQhD1YSia4FYP0yqJgxckxBYdUgUbmdRyjsl9fsBgi7pbHuFyUf
	 1tsl41u9m5tNg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1BC2E378220A;
	Thu,  1 Aug 2024 08:14:42 +0000 (UTC)
Message-ID: <6c77758b-1b8f-4333-b62c-44f61f14e27a@collabora.com>
Date: Thu, 1 Aug 2024 10:14:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] media: mediatek: vcodec: fix h264 stateless
 decoder smatch warning
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240613093357.583-1-yunfei.dong@mediatek.com>
 <20240613093357.583-4-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240613093357.583-4-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_011445_244124_B2F97703 
X-CRM114-Status: UNSURE (   5.94  )
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

Il 13/06/24 11:33, Yunfei Dong ha scritto:
> Fix smatch static checker warning for vdec_h264_req_if.c. Leading
> to kernel crash when fb is NULL.
> 
> Fixes: 06fa5f757dc5 ("media: mtk-vcodec: vdec: support stateless H.264 decoding")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



