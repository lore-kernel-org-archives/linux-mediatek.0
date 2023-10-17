Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA58FCDB474
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 10:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=57aA+Yevu0Vkusk3HwtOIAHNCUG0o9JbSlAB2n8pFx0=; b=hQAkHRnZAAZHQj0vy8ULdR5SKi
	BbjgCGK109XIvjheVQQnbmyxV7zFubrxodRpplCOhHd83udogMXTW6UUKHrpLm6F2UkKOCz5K+PIk
	/B43bdCT1mW7Ui/AsHCvS3u2qs45XvdqLUI6GXyhzvoM+2Ia2lnNS+6N7n1q8Q7S4l7YRucLQWNvh
	lVNPF+MGuRWqr834WDfA6IynUz5op4PMt+GUW5UZyB6DutJzMIh/VGbTnn/I8BQwJuOVM94TagWsr
	tuoKsXUBjS9IIi5vekb9XJdxqapTv4WQ4ky+H9MpfnSM3PnrA6QL+gJ/Y09hVlBlzfKCwPkZzZe1W
	wk7eu3jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qshbI-00C7JE-1b;
	Tue, 17 Oct 2023 10:47:00 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qshbE-00C7Hx-2y;
	Tue, 17 Oct 2023 10:46:58 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1E1FF66072ED;
	Tue, 17 Oct 2023 11:46:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697539613;
	bh=43RqoOrp7C9YDJYiZ/6Y2gmR3yeEBUCIjOC3q2aGqy0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VYYkhGiy37nSyJaxRJT4IxzWUww80wgKI0eXZKU7PLdK461OI7knxjxDYuTQwl729
	 XLk3IFqwJ9wQcoFcoYAxLtACTj3RVfrSZhHMt64oiL0YmaNdxFQfbTpBR7zciqGlyn
	 HUOyD1N/5OF3b/S3D+O4uOCcTOLvPQe1WWDsIRLp1HZ4s13cgfl66xA9fdLuerIOgS
	 00bDFsopHT2dR35lDFx6ivP3NDg6Zn2pSNm4Jjbd4ljBZzPZrWyodJNLq0x//MVnRc
	 IYmE1lLsbnw1TNHNzmEMMlvGxAVr9r+xNjP26ZUyNyipPxd6ZKxaBwo9jQ+3HFWg7h
	 DkUuqsYgYzWWA==
Message-ID: <f9c9f496-3da4-4780-b4e3-742f24e18765@collabora.com>
Date: Tue, 17 Oct 2023 12:46:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 15/16] dt-bindings: display: mediatek: split: add
 compatible for MT8195
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20231012084037.19376-1-moudy.ho@mediatek.com>
 <20231012084037.19376-16-moudy.ho@mediatek.com>
 <a05a7fb0-2de8-4d59-af8b-41b5a19de927@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <a05a7fb0-2de8-4d59-af8b-41b5a19de927@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_034657_096881_8ED06465 
X-CRM114-Status: UNSURE (   8.41  )
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

Il 16/10/23 18:21, Krzysztof Kozlowski ha scritto:
> On 12/10/2023 10:40, Moudy Ho wrote:
>> Add compatible string and GCE property for MT8195 SPLIT, of
>> which is operated by MDP3.
>>
>> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
>> ---
> 
> After feedback from Angelo:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


