Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B948CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 12:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LClcvq2oT9fNMbKoPXmceM3fqYpSEauJAC0oMzofTKY=; b=lQ9/J6/G8kVSpb
	VVZV4c6CSFOaXxcq6F9bslCXCQ8Noreq9Br0NM2/5fQSFVUzdovUid34XXyE3nD/Jp5DjSCFXi24n
	TZi0U6y8J2Rtc9/ieCaFZE5A6q0hNuJGoh8tZ6SBTdAyWHaFgyPYAueQY9l0RYxpXD6aqZJ7GOkuM
	OcU8ogHHpG7kRw5zgAIEUXGcrPgDVN/d/CMtCsoPIf0YViyIB3vIxQbNt5oU0aGmCeL4eoK7D+aXR
	qdMWdaWVShrEZh2Korw5GJI99YOUU0tgZOGX7YCMBR402sIvq+7MWIDgv23JAWEaO1C6uNQOdDMAs
	bs0Xb0U1WWxqDH67bByw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwjXU-00363a-GO; Thu, 02 Jun 2022 12:02:56 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwjXJ-0035y1-5y
	for linux-mediatek@lists.infradead.org; Thu, 02 Jun 2022 12:02:47 +0000
Received: by mail-ed1-x531.google.com with SMTP id o10so5974773edi.1
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Jun 2022 05:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=U+8T6fn4T3vaS0Pi2aB2h1k72+HYKHqTINehwyE+Qxw=;
        b=WgJo3UOrlWF/xukiH2Ku/H4mdceQ13UjCa+NEb9eL5GFxciQb2m/H0biH39C8/iyoC
         UiorpjyI/JVwc5x53o5eiy8NCi3h6nJmU8Rk9KIT8GaOKNKLmN3LegL1M9r+RA9cnJLX
         0DJtMJfNukuJqKElDBGjAkXwePDty6ctIvt+5JhABmGuOTBy23VV8UeP7SEl2/bHl96G
         qy4eTw7224jmjab9pUBps6c0AQd+dXl3i0VGUN8h/6JgRErzSyA58TmBAsJuVvOzjlZd
         Hxl6dDWlth12mYKgJ/B9bJYwO0pSLB4e1NXvXKd4av+jDkIZf18lh0UHkcX+TqvmV6PI
         dTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=U+8T6fn4T3vaS0Pi2aB2h1k72+HYKHqTINehwyE+Qxw=;
        b=tns4CwQKdocyaMLp52QRfcYmwUffae/pyby4PEwICfGz0L//nuPQ9vuk3HYiez5vMy
         I8n1zJ5meZT41stihz05xz9p5sZXC3PStWM0g0sfcJmey/GIEKrCacRxKP6478tEMbjR
         hQHfmCF4XneWQvxmtI02+9ykQNHBMflVcF9P1E1sOpO9T8hFewiVZyl4M3nopBQVaarB
         oOQgO7boGDvzmDrs2FJ2SoOHcDeE8culyzrFJ6i7VjdSq7FnC5koTnE3m8QVHDRBpPvI
         itSTksBBRXqhvxDGYCAEwx5bvkRIFJmeTsPyFiMP5HZgdC5+ZLJUpMA/+yVqDbBHxkX9
         Z5Mw==
X-Gm-Message-State: AOAM530iXS/Z3mcEn9l5GzoIRDifKuDzNkcpwc1YH4QymkP3+S/xs4L+
	i0VI1zDs3nUo+t9rN4UuL6pUqg==
X-Google-Smtp-Source: ABdhPJx4oO7YkUav5hDFlqrl3kvMLXszr+upvgPvjdffSEadzOq3Ofn3+ntG6LnID8A7MNz5hB5ENQ==
X-Received: by 2002:a05:6402:1f0e:b0:42d:e38a:51f7 with SMTP id b14-20020a0564021f0e00b0042de38a51f7mr5117059edb.68.1654171361576;
        Thu, 02 Jun 2022 05:02:41 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b8-20020aa7c6c8000000b0042617ba637bsm2480855eds.5.2022.06.02.05.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 05:02:41 -0700 (PDT)
Message-ID: <e084e508-d886-3e6c-53ab-1f0b22706964@linaro.org>
Date: Thu, 2 Jun 2022 14:02:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 01/15] dt-binding: remoteproc: mediatek: Support
 dual-core SCP
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Daisuke Nojiri <dnojiri@chromium.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 "Dustin L. Howett" <dustin@howett.net>, Tzung-Bi Shih <tzungbi@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Prashant Malani <pmalani@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Brian Norris <briannorris@chromium.org>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 Project_Global_Chrome_Upstream_Group@mediatek.com, weishunc@google.com
References: <20220601112201.15510-1-tinghan.shen@mediatek.com>
 <20220601112201.15510-2-tinghan.shen@mediatek.com>
 <dd3ea397-fa21-abe5-85ad-b8a4818dc011@linaro.org>
 <3c837acfbefa5b7e23e1121678b5b878f08e4ef2.camel@mediatek.com>
 <476baef8-0255-45ed-85f4-2b9d877c4af1@linaro.org>
 <287d88a62fd13cd762b20faa3e9df826632fe1eb.camel@mediatek.com>
 <45c8050e-16d3-80d6-0799-8b067a38d956@linaro.org>
 <5c614dc0947aba6ce2eb0cdc3055a390da723d08.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5c614dc0947aba6ce2eb0cdc3055a390da723d08.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_050245_252088_379D7D5E 
X-CRM114-Status: GOOD (  10.10  )
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

On 02/06/2022 13:29, Tinghan Shen wrote:
>> Maybe the hardware property is that one core has its sibling and you
>> provide here that sibling?
> 
> Yes, exactly. I'm sorry for misreading your argument.
> 
> How about this one,
>    
>   Reference to the sibling SCP core. This is required when 
>   dual-core SCP support is enabled.

Yes, sounds good. Thank you.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
