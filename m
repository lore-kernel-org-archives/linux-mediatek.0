Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAEEC25B77
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 May 2024 11:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xu2xbDFrIisqkiFW+9svNW96My0Yr4/xbGQerzlTu/U=; b=d8Dfb7YZ8mxSc8SPMmOy8UIPYP
	bjCYGrkWZf6ZFG8eYlyqrwmeG51VcCw/ZdsHKPFzXP/IYSspfmqbpAu/nGSqTgqZ0V5qg9eWILioe
	11O56f/b8OtYthRU2Yf7ROdrWkirKKVEneZRo1ffp0eEXB740eahT3j1U8vG5oK6wYxnOiKJDfRsp
	42yR2hc5pVIF4PuzlZPOJLqE0AmghiEFFzBsOvW4LwUTi8PNFOFnZUkyl9hvHLnBfza2Mm1w5UxjT
	LvPuGREZlAgPHWj1ZFQw0zaB2HRwNphVbONXhf2BJy3RunwjHf3f2gzocZAItZJAbJMhXcCVf+Xx0
	WhbcuODQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9kVo-00000002qCG-3PIC;
	Wed, 22 May 2024 11:52:04 +0000
Received: from out-185.mta1.migadu.com ([2001:41d0:203:375::b9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9kVl-00000002q9e-2Yj7
	for linux-mediatek@lists.infradead.org;
	Wed, 22 May 2024 11:52:03 +0000
X-Envelope-To: angelogioacchino.delregno@collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1716378718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xu2xbDFrIisqkiFW+9svNW96My0Yr4/xbGQerzlTu/U=;
	b=SmY6yPwzE1VAz/Bf2rxlkNXmbYgzZCsOCxh1eF1Ici1b576SEdtnwRLopD6pHZR+8ZKUfC
	gIdfycBn+QmiBKg+WzeU1GmxKC84jgBZ4bq5xn65qhEUvcxynL6vWVlym9j9NHmjm8labV
	I35/hMSeG1Ia8SHP7HCJBq1Q98JYdEs=
X-Envelope-To: chunkuang.hu@kernel.org
X-Envelope-To: robh@kernel.org
X-Envelope-To: krzysztof.kozlowski+dt@linaro.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: p.zabel@pengutronix.de
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: mripard@kernel.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: matthias.bgg@gmail.com
X-Envelope-To: shawn.sung@mediatek.com
X-Envelope-To: yu-chang.lee@mediatek.com
X-Envelope-To: ck.hu@mediatek.com
X-Envelope-To: jitao.shi@mediatek.com
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-mediatek@lists.infradead.org
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: wenst@chromium.org
X-Envelope-To: kernel@collabora.com
X-Envelope-To: amergnat@baylibre.com
Message-ID: <6026a614-adea-4a92-8732-07dadb93d530@linux.dev>
Date: Wed, 22 May 2024 19:51:49 +0800
MIME-Version: 1.0
Subject: Re: [v5,3/3] drm/mediatek: Implement OF graphs support for display
 paths
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com,
 Alexandre Mergnat <amergnat@baylibre.com>
References: <20240521075717.50330-4-angelogioacchino.delregno@collabora.com>
 <d0c9a2e4-1d6c-49ca-9639-3037fde0869d@linux.dev>
Content-Language: en-US, en-AU
In-Reply-To: <d0c9a2e4-1d6c-49ca-9639-3037fde0869d@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_045201_829680_5EF7C45F 
X-CRM114-Status: UNSURE (   3.10  )
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

Hi,


On 5/22/24 19:48, Sui Jingfeng wrote:
> if the not bridge is not ready


'not' -> 'next'

