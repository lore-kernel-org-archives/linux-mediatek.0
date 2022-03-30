Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4528FC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 08:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HqcvY7niMUa9LpQ5twdxW0f5pIzdsgmfyJFalr99msQ=; b=0Zkf5DtrUkmFOB
	mqptmvNZzsTYB1fZzRdmHE0enFYYnW/N2aStODHTr2fWXxJCztz2w/ah1QR5gYP+WLoBMjjSPcezw
	vndVaOpr3XHCW/3AOdjSrBiJyOYziUM3gmlVpcz7U4MHbrCE7j2WIx9vYaReO30qZ++K/Pulf8Qw0
	/qEKfxr10M6nTHr2LnaKeox9+fLgNg2V6KKnHcN5AXvUSkYRh26qAw6bK1K1ErLNeilB4jvzW2Bjl
	tA1izHRlPl8SqLhADwAnMhCVwRz+lYEP5ps05WJEcWevWan6zN5fogZIW9qfUGfIjayYwfGS0H3CN
	6q0wzX6p4GQN0Iet2tcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZTbL-00EnbD-IM; Wed, 30 Mar 2022 08:22:47 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZTZd-00Emef-DL; Wed, 30 Mar 2022 08:21:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3C4931F443F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648628460;
 bh=sD9zda1gQkNv3MUA4bkv/V5WHuwzCfeFynE1ba/36bI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lwqXWCyvUJTMcWkmXB/XryVKNZ3doT0L4in++YJhNLlEumVov1VdrMn6WG2XwP0ks
 blZ4fiFE4Q0hNhTRpBd0ICap0dAq4rUqv6Nx574wrl2C/2wf9fmlKPNu13ak+i9io3
 XuGtTjPq0bybFhxrjyjT8O9tviLy2mV3ijMdf4YmcBenisQ5JUKxTJ1r+sC/KVqf8/
 YDrwtXvpxBbOVALzBJ2KhF0A4Xle3gmzF1YumNtOdnjiLJ0IkLwdWn8R9yyHo3t0Pj
 tVq4OP09GfDsPwVt2n20oWvaZw3i7S6EQpXqzxGxqug2kMu8MrH9mYT6LXort9N/r+
 q6o2+0V72XjlA==
Message-ID: <61c2609c-18d1-fea9-7b71-0b17fb2beaef@collabora.com>
Date: Wed, 30 Mar 2022 10:20:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v12 2/3] dt-bindings: mmc: mtk-sd: increase reg maxItems
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>
Cc: Tinghan Shen <tinghan.shen@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc <linux-mmc@vger.kernel.org>,
 devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Ryder Lee <ryder.lee@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>
References: <20220329114540.17140-1-tinghan.shen@mediatek.com>
 <20220329114540.17140-3-tinghan.shen@mediatek.com>
 <d720a5e9-d078-6c60-f55b-0506c4b4e1fa@collabora.com>
 <CAL_JsqLrgW4GwSZ20x5Gsu-umjtw4x8k=uHeZk9T2+A3K6UT0Q@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAL_JsqLrgW4GwSZ20x5Gsu-umjtw4x8k=uHeZk9T2+A3K6UT0Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_012101_657135_88E919F4 
X-CRM114-Status: GOOD (  13.32  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 29/03/22 21:10, Rob Herring ha scritto:
> On Tue, Mar 29, 2022 at 7:43 AM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 29/03/22 13:45, Tinghan Shen ha scritto:
>>> Add optional host top register base for the reg binding description.
>>>
>>> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
>>> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
>>> ---
>>>    Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
>>> index 7032f7adf3ca..6d41bcec900f 100644
>>> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
>>> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
>>> @@ -40,7 +40,8 @@ properties:
>>>              - const: mediatek,mt8183-mmc
>>>
>>>      reg:
>>> -    maxItems: 1
>>> +    minItems: 1
>>> +    maxItems: 2
>>
>> it's just maxItems... adding minItems: 1 is not required.
> 
> If 1 entry is still valid, then minItems is required. If not, then
> it's an ABI break.
> 
> Rob


Right. Sorry for that and thanks for the explaination, Rob.

Cheers,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
