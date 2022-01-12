Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98234C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 10:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JF0NAsJNA3SVjgdM1JgzdFEtv41SyhvxNuZUAxwrLlc=; b=zx3rL40p8U+8B+
	34HAZ/h62Z73YFM3mPKnbT5S8Lvad3y0nWWiDQQHbDfhGpCW6G4OYgqUZZaAJfG/W4ez2tY2NFtOP
	BwqkjdzeS9cdadR3eP8xO+rCDqHsncQNEUNMRiGiqcs2HrYfu+OlRKprFEAWJlbKY+ouYwO3fxLTE
	t2din5gSKiJYPf6m1fiqe5SL2+WcZSkXtXGEPaOGQOADDkbTD3lT17l7TDEOcYDvAF79xtGoh4c7k
	UzGtnB/nYzKZEeg+lPic7DWXpdm4htgeYoXtGzGt4RplwJ4H1h/qRsrfqpIiVEoJZIdFJkQ0H21pq
	ydOYGJCWwYkKtAhtwH9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7ahL-0022Uz-V8; Wed, 12 Jan 2022 10:17:44 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7ab1-001zYi-FZ
 for linux-mediatek@lists.infradead.org; Wed, 12 Jan 2022 10:11:13 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9332F3F1E4
 for <linux-mediatek@lists.infradead.org>; Wed, 12 Jan 2022 10:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1641982269;
 bh=hFTGw3RKSwc/q5rISEyTidCT2dMSfG1tgduzWghD4aY=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=jFEJe7hEmSE9lZwlAcn3eurFShVIHucioQDnCZ+vItBeYbbOjFk1eiFRg+Ls+Y6Af
 gYwD8zJ9unK8Jw5iRWcg7uKALOV67ER/Fwl/4hABO7zwBvakGLPt4EvSHToB28eH1b
 RjvxOdeLRaq6oebK3iKzo/KKJVsVFxcYf2JQMslegi9o3ewE7Yn8J8vWoJBABXlphG
 MsHUtMKAmyXEP331ihzZBdrPEbMPwXsPD9BVDUQYnkmdDEU6evATDWKy2hwO3VU7+a
 LQeG8l4FBRFAOYBZYh9r4rKtSq039FZYUP1ZUEb1TDHDJkyVwxvKGgF0zxfXbDw+DT
 LIuupLvpvTBuA==
Received: by mail-ed1-f70.google.com with SMTP id
 q15-20020a056402518f00b003f87abf9c37so1812142edd.15
 for <linux-mediatek@lists.infradead.org>; Wed, 12 Jan 2022 02:11:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hFTGw3RKSwc/q5rISEyTidCT2dMSfG1tgduzWghD4aY=;
 b=k3wkxzb18bXyDDGGrInNhqs7UZpDP+HI3yhNlrhhtXDA8ccBjaxcWbLlj5XXlRpdtY
 3poXWKfONHW+dv7bPoz1ok0sg4CAaDR+UGVqDWuBe6mmRaSzZttmuKti9ZkPUnNYUoId
 mGa1z9C2VfH92AlhG0462IqXpauWc1A6bdJsa0rA0mWW2QmwPz0kfdYoRiu6/v9UwdS/
 lkx7YHYsvhSgW1UDInVZM8Rv6itT3U6b7K4F+ZeEKxwL1tjLmvwZFUk6wg01HaHcGJ3d
 apxMPDWGN1pATzO98e+P8m4sZOqNI0i+mdRoTmj9vPSHKmjb3jnyDFSh6FgtpS6tFuhU
 p7GA==
X-Gm-Message-State: AOAM530guDZmZwiWxqi8e0wSUq12gcMWawK4//4e74MaWInoAM0M4Erl
 uklx8JrkU18rgdezzd0H69MGbb9d9ZeB25UfQWT2JZzCYr/ZAfzyxU0pPiFv8hNnaHG1LTNQWAv
 7a52Rc6fG20I023qjEwSFyBetCnr0SEuZtBHa/MC4MOAdQShOkA==
X-Received: by 2002:aa7:d60f:: with SMTP id c15mr8344903edr.197.1641982269281; 
 Wed, 12 Jan 2022 02:11:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzAkZIIY2ouEWvjM2UFpm4JbXirsTAwA2NAyMnQsItvL764zEjLqhJIHuRjBZytND7lxY0dyA==
X-Received: by 2002:aa7:d60f:: with SMTP id c15mr8344880edr.197.1641982269143; 
 Wed, 12 Jan 2022 02:11:09 -0800 (PST)
Received: from [192.168.0.29] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id 21sm4338800ejx.83.2022.01.12.02.11.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 02:11:08 -0800 (PST)
Message-ID: <82e235d9-4e57-a4e4-66af-84277f9b9da6@canonical.com>
Date: Wed, 12 Jan 2022 11:11:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 1/6] dt-bindings: memory: mtk-smi: Fix larb-id
 dtbs_check warning
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, youlin.pei@mediatek.com,
 anan.sun@mediatek.com, lc.kan@mediatek.com, yi.kuo@mediatek.com,
 anthony.huang@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220111063904.7583-1-yong.wu@mediatek.com>
 <20220111063904.7583-2-yong.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220111063904.7583-2-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_021111_717449_0B4A0706 
X-CRM114-Status: GOOD (  14.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 11/01/2022 07:38, Yong Wu wrote:
> Mute the warning from "make dtbs_check":
> 
> larb@14016000: 'mediatek,larb-id' is a required property
> 	arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dt.yaml
> larb@15001000: 'mediatek,larb-id' is a required property
> 	arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dt.yaml
> larb@16010000: 'mediatek,larb-id' is a required property
> 	arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dt.yaml

Please explain why larb-id is not necessary on mediatek,mt8167-smi-larb.
IOW, what logical error was there (except the dtschema pointed out issue).

> 
> Fixes: 27bb0e42855a ("dt-bindings: memory: mediatek: Convert SMI to DT schema")
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  .../bindings/memory-controllers/mediatek,smi-larb.yaml           | 1 -
>  1 file changed, 1 deletion(-)
> 


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
