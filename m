Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C565C25B47
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 07:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBbMMGXhgW9dj85vLrlAsi/scxI5pUmqL1hVksSIORg=; b=N/euSXUgYhFI5/NogpG5qPKrcu
	plPVVaOZSnuEzTINTNpqvVSykgafZTVJvbyrBNGmnDcHQ8UELSVUuWnyS6ZF07s/B3Wu8lMqPG1pu
	qm83ORpB18Eakb3FKheHuhrdfIneIeCKNgYHbX2MQPTfzQfpU1yCp977b37JEttSmk+IrGjk2rgpQ
	5nSiau6VeLaWRfJgb39CDy1yWTHgJqcuAGism63YPLRp00mCNmqrGcwf6Ta7PxENfX7DiIglBjJp8
	Li47gZoTRBymaBmQqFyLSLh/ybZiOb8iTW67SILf88GFJxGnD9/iQHWTvZhPEAxWj1Vpw60H+Wgnv
	Xe68agYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvYQi-00BatX-0h;
	Wed, 25 Oct 2023 07:35:52 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvYQe-00Bas7-0h
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Oct 2023 07:35:50 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-507adc3381cso7835779e87.3
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Oct 2023 00:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698219345; x=1698824145; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aBbMMGXhgW9dj85vLrlAsi/scxI5pUmqL1hVksSIORg=;
        b=H8B6QUsa2bjYsA1msrRmEk/4RR5tHdL1qfMglz0wffC5WJDSMWBGt2HhVSuzyxp0J7
         IjZfIeBwlg/EKF5ZafycQdl67gLqk0grAEwdn26Kh/XX2H1cxxdTc3hMpKi3mGqYyoXZ
         Jsyze2DaWkJgzEVlw5HXG9qy9Nv5cRn6y/vrhuRPRSBca7thabnKcvK7mEYNWhylq/hz
         spHC1YlgemZXdqnNEMVbrp461B1dYMWSIaxGr7DgrYnMWgBN0WX80O4OsHueVWpa9PZS
         2OKIdv0klWuXx+Ao6smk+BSj/ptNg0HWkSpdce4KQ0u1kLsfk6ucqLeezp1C7JOWnF+I
         rM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698219345; x=1698824145;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aBbMMGXhgW9dj85vLrlAsi/scxI5pUmqL1hVksSIORg=;
        b=XYylFSaj1tgfLCJ9Jc00uuKnkzxpqtQt6z2VmzOZFcOa9jt6wkma73lh5MhvyygT5e
         tHnpPLv0sW1D0hFYnCglpdoRcDlUPCRm8ESJQsSIUKtvXBtX0A/ncAiMrTUwVY0jcva1
         OXIVTV4hcoOZE3XGqrYo+NylMxEJbGrJSguC/CPtEhS9ByLdtb8/lL5gHnUbQEZPQvkr
         grZvqk1xBv4VO8uUSL4vhyqZ6Wdjl0/BJel93gaITgG17C5bnlu8gLmD0rc/y8oDMHIZ
         XVAYYawzNV0ShFUTcLHBRyXsFNm0I1QuNs7M6zFWG9ePOXWk/pXmMsKDXAFzkkilVnzn
         pw4Q==
X-Gm-Message-State: AOJu0YwL4OsAR5h1okSISE8YYploh/qMGQsn83ZtwCU0ad0MkGuRtvnT
	CrgfLDiOtoaqoiSRE0J7VgJw4w==
X-Google-Smtp-Source: AGHT+IGfDcK6b789W6RGHEquV5YMHBAiCzfv/Rctz+XtFqNQN0vhdNvDDXE2hLiVtblka3kNhM2IfQ==
X-Received: by 2002:ac2:5147:0:b0:507:9777:a34a with SMTP id q7-20020ac25147000000b005079777a34amr10168194lfd.39.1698219345170;
        Wed, 25 Oct 2023 00:35:45 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id h15-20020a05600c350f00b003fe1fe56202sm13962243wmq.33.2023.10.25.00.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 00:35:44 -0700 (PDT)
Message-ID: <d7d40b45-ca7c-4f84-bdb3-02555094126b@baylibre.com>
Date: Wed, 25 Oct 2023 09:35:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/18] dt-bindings: display: mediatek: dsi: add binding
 for MT8365 SoC
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
 <20231023-display-support-v1-5-5c860ed5c33b@baylibre.com>
 <20231024203010.GA518520-robh@kernel.org>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20231024203010.GA518520-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_003548_285898_E77F4E52 
X-CRM114-Status: GOOD (  12.82  )
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



On 24/10/2023 22:30, Rob Herring wrote:
> On Mon, Oct 23, 2023 at 04:40:05PM +0200, Alexandre Mergnat wrote:
>> Display Serial Interface for MT8365 is compatible with another SoC.
>> Then, add MT8365 binding along with MT8183 SoC.
>>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>>   Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
>> index 12441b937684..2479b9e4abd2 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
>> @@ -34,6 +34,8 @@ properties:
>>             - enum:
>>                 - mediatek,mt6795-dsi
>>             - const: mediatek,mt8173-dsi
>> +              - mediatek,mt8365-dsi
> 
> Not valid YAML nor json-schema. Please test your series before sending.

The serie has been successfully tested with the 2 following command 
before being sent:

make DT_CHECKER_FLAGS=-m dt_binding_check DT_SCHEMA_FILES=mediatek,dsi.yaml

dt-validate -s Documentation/devicetree/bindings 
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb


I made a rebase error, that will be fixed for the next revision thanks.

> 
>> +          - const: mediatek,mt8183-dsi
>>   
>>     reg:
>>       maxItems: 1
>>
>> -- 
>> 2.25.1
>>

-- 
Regards,
Alexandre

