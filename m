Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2E7C10F16
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 10:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fDueiugpQGz4yiAY/xg33eOQq7+2iJmuG28whJZLROE=; b=SrIY2UbFb44dLy1QB1BA+hilkJ
	e0+D+7BgotztteNPGl3BTRH43GbS6O+T1kFhtPBeUspAO0REv9cm8iAUWOhQCyIHV4lmIxHA0gVBz
	Mx35gYtuTzKXesUJawc1Zsy+9hOjuw1rzYwczw5BT9i4Uz+t8Da5bh9lXTCJWtPfYRZe9FySrjb7D
	Zim1dFYJ4zuKV41hy+SGr22x5RfszTXq9W9hjMv2UfnCD96KdDHsdNoFa3pmIeRV7i3/y3RWDWgri
	/NkeRkxfV2BPPQjL/MxwhG1WYS039iW1FLxW5ZZXXbQn23qhFKbw3NsKexB8Q+9yWxXyALY3d1q3B
	oH45bSJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3w1q-000000072aa-3jzr;
	Mon, 06 May 2024 10:57:06 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3w1n-000000072Ze-1yfH;
	Mon, 06 May 2024 10:57:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714993020;
	bh=X2NzglRsxYEgR27bOlIO3yydggeqp11lrTPWCFdKpY0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H9zbk/XAZ/2DHUMgiAMu8VSJv0zpRMVlMYmkN+a0gGmvIS1wpR8SVqAOQ+pPu2pbg
	 znIR0b7JnrWRLD2zl7chGIC5Z6Vq6d72sYYuV0XVCrlVz2Two0ojARXYz7uOLElEML
	 kn1sc8EW89SVM1tYxf3Y96BnMyB3XIuEYBpzrpVrnvnWFBswLMorZLCIRI9NWxBpoJ
	 HLdGd/1fiYwUxfoTRi+i0P1ekhKpzpTlHBpcMYbOzEUyWcny755o+W3TziWpNgBv3C
	 NWWSxG8zdTxBrpP+Pl7JSZKnQL9lSxwahltQi5EpNX9oyZExta3bcDjyjgraEmFU97
	 I4iG6AP/yCpcQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0BA97378020D;
	Mon,  6 May 2024 10:56:58 +0000 (UTC)
Message-ID: <50be68dc-b86a-4334-9f83-43c6fda2c271@collabora.com>
Date: Mon, 6 May 2024 12:56:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] drm/mediatek: Add support for OF graphs
To: Michael Walle <mwalle@kernel.org>,
 Alexandre Mergnat <amergnat@baylibre.com>, chunkuang.hu@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com
References: <20240409120211.321153-1-angelogioacchino.delregno@collabora.com>
 <1fc23530-89ba-4e36-9e9a-a1289f56a9bc@baylibre.com>
 <608fdbde-ad06-45ec-9771-18aa9f002f2d@collabora.com>
 <D12H4GDJJEUF.1Y91H9RMUIX20@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <D12H4GDJJEUF.1Y91H9RMUIX20@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_035703_686727_8F6C175E 
X-CRM114-Status: GOOD (  22.06  )
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

Il 06/05/24 12:02, Michael Walle ha scritto:
> Hi Angelo,
> 
> On Tue Apr 30, 2024 at 1:33 PM CEST, AngeloGioacchino Del Regno wrote:
>>>> This series was tested on MT8195 Cherry Tomato and on MT8395 Radxa
>>>> NIO-12L with both hardcoded paths, OF graph support and partially
>>>> hardcoded paths (meaning main display through OF graph and external
>>>> display hardcoded, because of OVL_ADAPTOR).
>>>
>>> Is that make sense for you to add the DTS changes of these boards into this serie ?
>>> I asked because, IMHO, that could help to understand the serie.
>>>
>>
>> Yes and no... but I imagine that you're asking this because you're trying to
>> prepare something with a different SoC+board(s) combination :-)
>>
>> In that case, I'm preventively sorry because what follows here is not 100%
>> perfectly tidy yet as I didn't mean to send the devicetree commits upstream
>> before this series got picked....
>>
>> ... but there you go - I'm sure that you won't mind and that the example will
>> be more than good enough for you.
> 
> I've tested this series with the DSI0 output and it works. Nice! No
> need for my DSI0 patch for the MT8395 anymore.
> 
> But I can't get it to work with the DisplayPort output, that is the
> dp_intf1/dp_tx interface. I don' know how the pipeline have to look
> like. The functional spec seems to be ambiguous on this. The text
> seem to refer to the second vdosys but there is also a diagram where
> you can use the first vdosys and dsc0. If you have any pointers for
> me, I'm all ears :)
> 


The problem with this is that you need DDP_COMPONENT_DRM_OVL_ADAPTOR... which is
a software thing and not HW, so that can't be described in devicetree.

The only thing this series won't deal with is exactly that.

It's relatively easy, though, to add support for the OVL_ADAPTOR... as it would
be just a matter of checking if any of the components in the pipeline contain a
compatible that is in the OVL_ADAPTOR compatible list.

I'll try to add that up today, let's see what I can do.

Cheers,
Angelo

