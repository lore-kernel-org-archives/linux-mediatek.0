Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116E0C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 15:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:To:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7oXek54+JYm7v46sAbbWTIuulQKfy2k5TyocBWFIyk=; b=yDWe3/xSP1fiZmSlLxfCwADNgW
	JnBIIt3yenLT2lE/VJ8i+0rQUXDov3XUm1uV4W9fafo4hJaP1R5Zj2TeO8FPLjLDkpbBXKCd/aWWA
	ZcwwSxETqTIW3+yParYxkH+SBXp2fZYOmiMCDIfH68h30oXbVFd12U1I/0CXFy4/aOC6dwmxoc9B0
	luj+tutQYRYj0RRXYi0ovkQLN947NJu37mMpU51n8SP6y2a9mCajp7QD0Kf3onXdUPLFZh1yuulcR
	qsvQmauAFB+fNKgrypVRnC9j6sMkLXqu1ScO9fxOVruRmzyeh/N+jJJlvZA2ljCtifIQ8kf+tP0Jr
	Y7zE3cEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngpgC-004c1v-Ig; Tue, 19 Apr 2022 15:22:12 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngoti-004I9w-Mx; Tue, 19 Apr 2022 14:32:08 +0000
Received: by mail-io1-xd33.google.com with SMTP id i196so12396841ioa.1;
 Tue, 19 Apr 2022 07:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=iPD1iR5qd5xmFxqoNP+9ShsEquOYqKS33gFTSRsPZro=;
 b=Z7LxYAUbZnVFiFy71HCGAnsd0qRNreWPi93Lf3JHld6XjimOV92Fr8+6ProAPK2UtX
 NEWGht0ORsquv+fNRKONaJYbpqKKBW8d22vmuMjdiSZxC0gM7rvMBeaGzboazwzAxXGA
 mDvxXALWBzew3j1hguficgc8qmUB/vYIsCquZFmJFBFN92Q41mrqxax8L4Q7VHS9BI3v
 sxaERl9GP3TP7D696rUbdqBfFfB3KegF1lkwklp6Wj4tWxdqH1r3RNRx+ipoHoEDpmde
 O+AMs+j7ocD2qKdCVl024eKgvYt8P1F6AGr7MqzcUZmG1JiwUJxfmbZqC/T+KKrBmD8O
 HYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=iPD1iR5qd5xmFxqoNP+9ShsEquOYqKS33gFTSRsPZro=;
 b=AgwacdF94fZ5ohVOHOZ16nWVA8ORiJXd3Vv4l6FNlNAj17B+c9q09TL44/wqe7tUhM
 8QykdQ8nNCpnw2eCXcu0uN0dKjZDbNCx7r6LqXmSwBjUosLCI1oF8Qww5kLNO25bB2yZ
 vSY1B5j0Z3uY90XVCWtZTTwOeB3DNQDM63Y+0+kEd74vZlFiHip3r9PYaBSrRYxakvGj
 VICyB97028ZgUdqnEXJmmDYBE7cAA5tkk9uUoFMRnJy1dgTppC5re5PZ6gYiHZAx+RT9
 mPaQ7js/d+vih0YiWEUFHI0Oeq65IGGKlS3xYKBZkvxGMcUu+DrkvXryeK0QZPWMU0Ll
 VabQ==
X-Gm-Message-State: AOAM532AWAEfZ3OV/37KOBdANo8hC2V7oMyygmeklmtaJsYE/1LUPd6A
 2tHQm9ceh+2e9j0EaGTWoWrnXuGhJcQ=
X-Google-Smtp-Source: ABdhPJzL2cpCI4DDYEF14wIz+iVDK+70GBOSOBRKi+gYopggEMfFhTfSw6J23ZbocFRaz59bj9/WaQ==
X-Received: by 2002:a6b:ce01:0:b0:64c:ad0b:9a65 with SMTP id
 p1-20020a6bce01000000b0064cad0b9a65mr6527353iob.147.1650378722931; 
 Tue, 19 Apr 2022 07:32:02 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a92ac0e000000b002ca8eb05174sm8934717ilh.57.2022.04.19.07.32.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 07:32:02 -0700 (PDT)
Message-ID: <448093df-288f-3c49-270e-5d830a986b27@gmail.com>
Date: Tue, 19 Apr 2022 16:31:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org
References: <20210820081616.83674-1-krzysztof.kozlowski@canonical.com>
 <165036314214.180327.9860190048104061653.b4-ty@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: align operating-points table
 name with dtschema
In-Reply-To: <165036314214.180327.9860190048104061653.b4-ty@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_073206_832063_DE215F5E 
X-CRM114-Status: GOOD (  10.64  )
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



On 19/04/2022 12:12, Krzysztof Kozlowski wrote:
> On Fri, 20 Aug 2021 10:16:15 +0200, Krzysztof Kozlowski wrote:
>> Align the name of operating-points node to dtschema to fix warnings like:
>>
>>    arch/arm64/boot/dts/mediatek/mt8173-elm.dt.yaml:
>>      opp_table0: $nodename:0: 'opp_table0' does not match '^opp-table(-[a-z0-9]+)?$'
>>
>>
> 
> Applied, thanks!

Could you please provide a stable branch for this patches? So that I can pull 
that into my branch. This will help to reduce merge conflicts later on.

Thanks,
Matthias

> 
> [1/2] arm64: dts: mediatek: align operating-points table name with dtschema
>        commit: c743bb394d35b782ae9d9ab815d6053500914533
> [2/2] arm64: dts: mediatek: align thermal zone node names with dtschema
>        commit: 54ff423f837db59db0626a00d091e45dcc46787e
> 
> Best regards,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
