Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85E8C19F2C
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 09:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YrQ0ygNs6n3PQpJrGJiaYep32hB555hM8rG5Cb8o2YU=; b=sV2gVYGEDHd2fnCM+/5whk3+FV
	RZ4Cim8qf+0IhUbBKqq9w8mPlLb3/mh3OT0jbL0+DGMfYnbRMj3RtCoLgLKUgMjTZ3RRWs5SLVS1A
	OhbVQagKj/I1zeHUqdsR+3BkccOKVkZlJcsvaSaPkUZV57xUP+xYc4o+OTdnvncHXrWwyUQqpAXoF
	SjZRos27PricDMAEHcP9Gwh38hBSJC//ZRa5Yt6QP5op8p9q7mpdUl9MzVoLvU646PBcvmqbFpu5C
	n9nAQPYPqf/HVkFaB+jny4UGA2bx6UEOvCE0vmQpvMScDNmfu/ldvNWTMsqmTuuVjO1Dd9E8EArri
	0DXnR3LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGdSF-00Bpzj-G9; Wed, 27 Jul 2022 09:35:47 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGdRv-00Bplu-VI; Wed, 27 Jul 2022 09:35:29 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 329356601B24;
	Wed, 27 Jul 2022 10:35:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658914526;
	bh=tInxg3UBVvu6TuW4H5I/jhEdHs4D2SGfyBq65EqJZwQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bNprFWkGm1Z9AhAai0N1DHKm/NH+2mFmsCVDemBDhhZ6Q8//sW9nLiToEbBt2336x
	 m6O9P/haG14FVpv6JNnfA59It28VKISS/8uZZRqE0LB5mF2ULxqK/2jlsYMctZ1HCJ
	 Twa7W6SiPDTrFw63pvgDQuKEH5RlzCVYr/mmvxVkozaMk6cJJ6SJtYwZlZF/AJkHLZ
	 luMWHcmVkzamWI5mXjPd2jMiqvM81yquso5a4yB6GbrUP6v602rKem6RXR1AZrItjF
	 NMBm2iE7WzR6uhxwCVb8YtpeSfRCYeJsCpAOzNQ9Ym/jdVeAlZxKg9SvWZYRqkvPZp
	 GHGcq+nhrRopQ==
Message-ID: <4990e4c4-1158-feff-089c-918c890d35d3@collabora.com>
Date: Wed, 27 Jul 2022 11:35:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v15 04/11] video/hdmi: Add audio_infoframe packing for DP
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, deller@gmx.de, airlied@linux.ie
Cc: msp@baylibre.com, granquet@baylibre.com, jitao.shi@mediatek.com,
 wenst@chromium.org, ck.hu@mediatek.com, liangxu.xu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220727045035.32225-1-rex-bc.chen@mediatek.com>
 <20220727045035.32225-5-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220727045035.32225-5-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_023528_183593_AC7C4774 
X-CRM114-Status: GOOD (  12.02  )
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

Il 27/07/22 06:50, Bo-Chen Chen ha scritto:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> Similar to HDMI, DP uses audio infoframes as well which are structured
> very similar to the HDMI ones.
> 
> This patch adds a helper function to pack the HDMI audio infoframe for
> DP, called hdmi_audio_infoframe_pack_for_dp().
> hdmi_audio_infoframe_pack_only() is split into two parts. One of them
> packs the payload only and can be used for HDMI and DP.
> 
> Also constify the frame parameter in hdmi_audio_infoframe_check() as
> it is passed to hdmi_audio_infoframe_check_only() which expects a const.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


