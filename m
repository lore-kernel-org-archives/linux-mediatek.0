Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A26C04FFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 11:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GnACuVzDP4Oyv0nSMiTACsNp/+0tNas+HeZfoD7dLh0=; b=ZuW776PISTfrTmoY9OQqd7/wn9
	5EKGAYjYyGNqU5lo2/ONA99pe/aDv0vSzg5zoxj8ZfbAT8c96y3k5l1Fi+elqHtNXg1AeA8XFla90
	GkZcBFgaq01y4Kfaq7G6S94J1S7CaroeDHXgy4tbLaq5wjppbjCAhJYrm+jdGx1QQRLb7xAUrOT8E
	C5bI8hj2i73MO7NKUQ8/gFH+txS5MeCoB+gz/e5UheOqlifbuyoi+BZNGjKqbFQJ+MlhzlgmV1VVI
	Ac89fmOZJMbZmufC+0DbUETykI1JunK9xPYcR5NRU+aabyWb6AuehgozXPTtJBs/vNNl/KLKliaN3
	wLk/XQGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s91cZ-0000000ENsh-0XKv;
	Mon, 20 May 2024 11:56:03 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s91cV-0000000ENrX-2e30;
	Mon, 20 May 2024 11:56:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716206157;
	bh=HVdVs5WsRae2+1QNnkZk8b+8Vke7zSeq7GNWP4iLtE0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pz57cOLcladhmdo5+/6Yy/Ks3GaYaTeKHcKTulsGnX7erKkpYOuVfk9HZAMKqnUy3
	 t5SxNsaK0MHnaYCs7Iofizh3vsfHicUMyp1YOWul5M/ED7vFcj8y4QSU0I5E4WLFpb
	 l/RqSzWiOq83+TlinnXWNfxJ7xVLRus4h5vUcgMU1HR8myXFmQYOmihk1hgLIbDbAc
	 otfrAnUpt8A0LM43u4m3Fbf0Vf0+FIoZtEGN1Xc5aEYoTHgj2YrDshVMA5bRORqpWk
	 Qq3s8hMeFveAo193c4XDBnxSuy1hSsZlehIycchb46jTXjThyfZ0QN6snIYwlGXveL
	 JdseYdQ8dOAmA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6141C3780BFE;
	Mon, 20 May 2024 11:55:56 +0000 (UTC)
Message-ID: <df152312-a8ab-40d8-a361-fe5100e11dd9@collabora.com>
Date: Mon, 20 May 2024 13:55:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
To: Alexandre Mergnat <amergnat@baylibre.com>, chunkuang.hu@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com
References: <20240516081104.83458-1-angelogioacchino.delregno@collabora.com>
 <20240516081104.83458-3-angelogioacchino.delregno@collabora.com>
 <ce1de395-3f60-4f7f-9424-bf036134de94@baylibre.com>
 <7dbe08cf-47a1-4da6-9035-6b0932cf8426@collabora.com>
 <67f13b3c-18b2-4042-9908-b4d41c24cdb0@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <67f13b3c-18b2-4042-9908-b4d41c24cdb0@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_045559_840774_E9CAE193 
X-CRM114-Status: UNSURE (   7.54  )
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

Il 20/05/24 13:49, Alexandre Mergnat ha scritto:
> 
> 
> On 20/05/2024 12:53, AngeloGioacchino Del Regno wrote:
>>> So, I don't know how you want to manage multiple display, but IMHO there are 2 
>>> ways:
>>> - removing the current "oneOf".
>>
>> ...eh I think this should be anyOf instead :-)
>>
>> I'll check later and send a v5.
> 
> "anyOf" behavior works as expected on my side, dt-validate pass ;)
> 

Hey, thanks for the test, buys me some important time.

Cheers!
Angelo

