Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0394BC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 10:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YNuT1COef9ZCrDeklO43UL0EE4CwW3So6ce9roiU4ss=; b=gi1gR5PkIvNQ81
	CxlmZWlABtXJJDDzzGYsyZV4DLgTOsDUG4gC1oQ/N0E8JV3vyJjAKMbCX8Sjp2bE4FKQBTnjqJo2B
	xL3TSHdYijXZEmh3sfDuyIxQsSHvjPJ51M4jiKZR7hggd4M6QKYQxj7HAFxLJ7tU6D1NAU6fLYSEp
	WojZQrTLW3DXMOAzNSWKVSOWryoiCc9cSJ0g08yR6gUrrFVS6NRhXT+sfEaqMA1oegY5t3z5u2GXo
	oFNOnD20O3VXi++9YhAC65TT0Ggv/DOHVGOviogGLZ03qVrf8dhwNuELoK4jLmJ0wBKsoi+LWGmjd
	WgljCg4mP0l+HLWhmqbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKHUu-006WHJ-Ef; Wed, 16 Feb 2022 10:25:20 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKHUS-006W31-Bp
 for linux-mediatek@lists.infradead.org; Wed, 16 Feb 2022 10:24:55 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F290A40806
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Feb 2022 10:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645007090;
 bh=rqHY5+dH47bdmvTAOE4I27WoThPEsLrYxKjIJ+9uRPc=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=iUZkXTb4Tb7AAO/+lIOblf97iPvpPhRPa3j3Y2cSuyZW1gQrepI7o1Qdq+w71Td3J
 uVsDDGdEm+oTHqqnTZ1emqfg2yeaj/+FMCESYQJrlHt9pm4ZtvCt02FszNNhjO0EZy
 M3QUoKMGOhuG8tt7hmmbnhUXjCmL58t246ZDhhab2863ppzKFUHOKX1wEtwmHdvZ+z
 euFLcdYfkT0DdjABNB2FEeQsDDjfQRgr3Xox/K0c/gPW2iquSsmASrIqzB320uwV7s
 4XUPqXHXZ+YAlojctbUVgGAy9PKv3YdzPcpU2UEFbJBWIVzoXzWSM4zksQ+zUU4Hb1
 8P00+l51D3StA==
Received: by mail-ed1-f72.google.com with SMTP id
 f9-20020a056402354900b0040fb9c35a02so1261063edd.18
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Feb 2022 02:24:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rqHY5+dH47bdmvTAOE4I27WoThPEsLrYxKjIJ+9uRPc=;
 b=gKYEmc3P8GOBvfXQsIV3/iD+V4FFvLqYBRqmiyHtNYoOZLIBvPZq+ZVrdsbsRVVkYj
 a8wDNg3WGl/aOgd52euY+rMjYo2O71bRQRGA1sEDWxdQbKH1hFTswSZ3K4hFFxyXU1YP
 KfQew6Fe+1iZJ+ykx6RyqxJulW7cSjnXYC8CHe9aG8q76mRFu995HThOWk7NHG+MUJTp
 wbnHseMh7AlCu9okkLQe9qaH0bgWVWYjumHi1ujA4AldHb1UI69dQnjAwhPvuQ2kL+36
 dCHggIADJ4XycIi1LuFhCNGJgIPP7lVvEDiMEBLZZOlmPCBOoMoZakZ/f0fTC4r6CSWT
 Gh2Q==
X-Gm-Message-State: AOAM5303lztmxcPC+Xnrr2UHz8Fkjugxkxc3KEUTcXINnOvjGrx91cE4
 JNTmjqWJQob9AttW0Dn5jPVlsaW5folihzxeD6imyDxXptI2fdtOkP4vNg2gOnYYkcnrmKvX/tI
 lMsIiHAyZyvxlhKEK7fWEA7ICTLReDFouF1NejBOH3XsG+KKASw==
X-Received: by 2002:a17:906:4698:b0:6ce:470:b423 with SMTP id
 a24-20020a170906469800b006ce0470b423mr1645425ejr.103.1645007090698; 
 Wed, 16 Feb 2022 02:24:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjS3anZMmuOoVB1rPmpKsUJ3j2HrcgXBDQgzSEahKYbh2GBNoejxW3vRXYop71p/5TLP3Aug==
X-Received: by 2002:a17:906:4698:b0:6ce:470:b423 with SMTP id
 a24-20020a170906469800b006ce0470b423mr1645414ejr.103.1645007090555; 
 Wed, 16 Feb 2022 02:24:50 -0800 (PST)
Received: from [192.168.0.110] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id m28sm5054733ejn.50.2022.02.16.02.24.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 02:24:50 -0800 (PST)
Message-ID: <d229d163-223d-7481-cfdc-c83bcc2a2eb6@canonical.com>
Date: Wed, 16 Feb 2022 11:24:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [v2,2/4] dt-bindings: pwm: Add compatible for MediaTek MT8192
Content-Language: en-US
To: xinlei.lee@mediatek.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com
Cc: allen-kh.cheng@mediatek.com, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
References: <1645003971-16908-1-git-send-email-xinlei.lee@mediatek.com>
 <1645003971-16908-3-git-send-email-xinlei.lee@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <1645003971-16908-3-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_022452_588377_24EB629F 
X-CRM114-Status: UNSURE (   9.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 16/02/2022 10:32, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
> 
> Add dt-binding documentation of pwm for MediaTek MT8192 SoC.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
> ---
>  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
