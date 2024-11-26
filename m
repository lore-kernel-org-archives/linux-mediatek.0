Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64FED5A6FD
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2024 08:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IP+lnPk+Vn6/2IBq2ri1RuPomxRvMrq4mOKKS17DAek=; b=BzuUzDSQM5LxPBenuAtyfDNPQC
	YCIlkibCH6+Gh9r+AfkobF8dWbHw03SI1lk0Jxx/ztrgZ53cV9SS+e89ZOYurlnVy60JAkM2vojt6
	NuKlDT6YokKmbxSnZHH+mE5AV7/ThTI6/oRcqPq9VRdoojzTcLDyASt1O4F4oHGXEHpetC0aWuDI9
	jxxZhL8SZy3tZBAmjxlGkRp5vDh/sC9WXeNGIcpA7P6hvUkQyQGgKTL7qBTbs/wbhdyl9GrTGy0Kd
	Qnjf+kvhlQ8h4rtVnhuScuF/cZqjJRnulKaWxgBpFpjm7TXeZPqmix0BV/QoTq+7l2QNDIyHhjXxG
	FAszADWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrP1-0000000A1Po-0ImU;
	Tue, 26 Nov 2024 08:58:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrO1-0000000A17L-1O1Z;
	Tue, 26 Nov 2024 08:57:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732611451;
	bh=xu1mpesbXHDe4ZbnZl7wZhH0nVldF/t4bC46HVCJJ9s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JateNvsEkisnZPfVx1ad1SH0szm2p5O7MLcKnO5dLra6JY2iGU0RPj/SD2ZypXTT5
	 lzcCSqNTo4uC7y10Hww/cEmRE58Cm2ooWTTjpM6Hn2pJukx4I7mLWEXlK3my3R8hMI
	 n/JdCMknyt7P0yQrVX793J4zQA46DEwRxhiVnjtoZpN4/zeV0LCsltxxBwc1LVD0ho
	 u2AcoRO5zcwyQAh3ABRGwOyPP6pIZ+X8oW9TorOo55BLO9X/v4l1UWMGWRQVmLEnRZ
	 PTUInkonFgJivtMqLLqEYUaxJ/XEH9/dUN/PaHAOpp9LoOtviCFou1gVfLRe8uA+iX
	 Px1lyoEC+a6LQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A4EB717E137D;
	Tue, 26 Nov 2024 09:57:30 +0100 (CET)
Message-ID: <4143b793-c5b1-4b6d-8547-26a9dc526957@collabora.com>
Date: Tue, 26 Nov 2024 09:57:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/7] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, "kernel@collabora.com" <kernel@collabora.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>
References: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
 <20241120124512.134278-8-angelogioacchino.delregno@collabora.com>
 <133167aa2a3fab40547f5dc6602adf2c3d9e01e5.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <133167aa2a3fab40547f5dc6602adf2c3d9e01e5.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_005733_520421_CA58A959 
X-CRM114-Status: GOOD (  16.76  )
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

Il 26/11/24 08:42, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Wed, 2024-11-20 at 13:45 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> Add support for the newer HDMI-TX (Encoder) v2 and DDC v2 IPs
>> found in MediaTek's MT8195, MT8188 SoC and their variants, and
>> including support for display modes up to 4k60 and for HDMI
>> Audio, as per the HDMI 2.0 spec.
>>
>> HDCP and CEC functionalities are also supported by this hardware,
>> but are not included in this commit.
> 
> Both MT8173 HDMI and MT8173 CEC has hot plug detection interrupt.
> I don't know why but MT8173 choose CEC to detect hot plug.
> 
> Does MT8195 CEC has hot plug detection interrupt?
> If it has, may we align the hot plug detection flow with MT8173?
> 

The CEC on MT8195 does have an hotplug detection interrupt, but that *must* be
used exclusively for CEC for one important reason.

While on MT8188 we only have the HDMI (TX) Encoder, MT8195 features both HDMI TX
and HDMI RX and in the specific case of this SoCs, the CEC block is shared between
the two controllers.

If we use the CEC hotplug detection for HDMI-TX, we wouldn't be able to share the
block with the HDMI-RX without hacks.

This is why we need to use the HTPLG/PORD provided by the HDMI-TX block instead of
the CEC one.

> This is not a strong suggestion because I don't know why MT8173 choose CEC to detect.
> I just want more function to be common.

Yeah, I got the point and I would've asked the same question, but for the reasons
that I explained, that's unfortunately not possible :-)

Cheers,
Angelo

> 
> Regards,
> CK
> 
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
> 
>>




