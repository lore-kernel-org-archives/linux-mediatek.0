Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F233C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 11:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lerehnpu/CEVztO9T9kjPKMdkET+6rnkoDtzTyl9qYs=; b=V0bsUvojiLFRT/zpM7feDHswGg
	NE3aTIZwvuPSOjOTymOmTIZa0C+ixE8rwDPPu67AMU1swKB2MWldcERcvZHc7FeqdHHAlS5/qv70+
	D8Ss8UkR3rTkQVM/lVxfmLiTB7cHVJu8NTneZXa4ugz8vFrReQ0/60jXSc20mbRuLyVxXOXknf63T
	HzCK9s6ZEZHfL3drF84J6gETgerviUU2EeCaRr5IOJhinUr2yxUYPr/HzuxiiDPJ4G4/h75mI2iGK
	lspIrVHLU1mxbOFBtpY8n4stJMEdtffDH6q2TqKxosqz52dh5z9j0YDCE4qPr1JF0Emr4Wx977Pqf
	fvJ8jhCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXRL-000H6U-5U; Mon, 14 Nov 2022 11:15:47 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXR8-000H16-Hm; Mon, 14 Nov 2022 11:15:35 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EFB4B660231A;
	Mon, 14 Nov 2022 11:15:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668424532;
	bh=yY/YRATm0Q3oV5sdHDnUziPQTMU6rAOaaPCbRF/cZoU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eVNxyhrj+kwldNcRgpie15yV/5vTkKIkqlAsDbdWFCo4+LxeobgaKyCpcakevSO8a
	 akqx/S3ViUV+h7YKq/sBdg9dHiextX/Pee2JXDmLLabEx2R9jQT1XfCHLP7Lu0S1mY
	 V+0+gxRiuD7djrLH0caMoGvOdKZh7kcSXldgUsNVPHezsDf50qJVJR7LUDbh1I3mx7
	 E7EUZiBqKVBUWIRMcYpqRFlcIK2OG4YCrGnMQIIxYN9kFqwkmFd2Ti8EHkst03EclX
	 JcDcvw0oLGfoTU7XFnpMoDgmG26UsKgqk2jlf4XKxxJP8GykG/q/Gz+uZqB8+h5E56
	 1MygFgxgzgy1g==
Message-ID: <f8b13cd9-c018-e52a-7c93-a8776f5f9ce6@collabora.com>
Date: Mon, 14 Nov 2022 12:15:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 1/5] media: mediatek: vcodec: Fix getting NULL pointer for
 dst buffer
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
References: <20221112094144.4256-1-yunfei.dong@mediatek.com>
 <20221112094144.4256-2-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221112094144.4256-2-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_031534_749110_6A1AFFAC 
X-CRM114-Status: UNSURE (   8.08  )
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

Il 12/11/22 10:41, Yunfei Dong ha scritto:
> The driver may can't get v4l2 buffer when lat or core decode timeout,
> will lead to crash when call v4l2_m2m_buf_done to set dst buffer
> (NULL pointer) done.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

This commit needs a Fixes tag.

Regards,
Angelo



