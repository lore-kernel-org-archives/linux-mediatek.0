Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B15C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 07:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FzZnL9ZcZnXJsgmDsVa5+EcoPtYEdDWWZHIQ+kHEbKk=; b=svI6XniEf/xFu5
	hlMBqFWtENTp2I0JtXX8dPeErAPZwMB0lzI1CKPItHAGVnVofMoctBNxHluBKwJgyiOHBFs8/EUE1
	81RyBxCWx32xvJjPPTByNcWnrXk2GqGHTVrbtJjLgvCtYBZhZSP+lVtt48cNZb/NWwBZfCcdZBRdY
	K1mUD6A5dQjbCfAWscpJJKZI/uAvNZ5K6XkEgAdFQqpeAv4Nfw9zGHhIDtgi0eoFw0mlUSoDziQOC
	BlO1ByFZQijcqNhNGVOTouYcQT1q5N1EkiMxMD033AWoJjn+jlUayex53581CvecFhpGo2BIsPKu5
	YppVBX/0bn/axyUgR7yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwItd-00EO5R-6Y; Wed, 01 Jun 2022 07:36:01 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwIta-00EO3k-BN
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 07:35:59 +0000
Received: by mail-ed1-x52e.google.com with SMTP id o10so992164edi.1
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 00:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TYSMvua2Chy4ew3jbVU8f9W6/MITfKjqjvefw+FJfeM=;
        b=nc1h4qmu96bEFYDvTfzmKUX9pDAjB3hcWg/OC4S+sCk7LHLLhu9JHXMOEZHqJ0Uvuo
         +lBFi7hz1SBU8PWQOONP+WohujLkZBTaddDHVw9kFzhwL5HfjrFN+sluVEMXCDWjiQGM
         NuSMxDdYldUID5yJOA/6vnJ5t/OVGkUV7Sb8Q7kIQlVe41QhYuvhLxwuYDmn/Sm7mAZ/
         ByCE+Y1whybcr+F040ZbAUw11x/50k2pVfZigCcisT7jxCY5o3YSUbYztGx7kivO3E9f
         vzh77uFu2YldfbdKeZ6KspEudt4QnDeNnXEStOwr30yElL4eJIX9azl+lEDFd7eAKmj0
         xZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TYSMvua2Chy4ew3jbVU8f9W6/MITfKjqjvefw+FJfeM=;
        b=Qr0UYi0F9HvNAgzLzZ0OpbHy242AV6Vwu4M6qYjGrkC0KAh1GATgERI/USSY5YmyaA
         vtED+oV+MB0K6BfXg6A6zrUKKi1O3r3g112AFJM0zTNqNHx1pJ2eysx5YNJEGIYueMa/
         ukWVOpqp1M+HOJz6QGSsYyPQRijQK+G0FgMOKDBWJgWMGF/ztPxSI+PfNXQ5J06AeNzu
         6T5Tg89oB869GoKD5aL5H+XMCsADUMvxhsEgZgExiTHTj6Tc3djsEZJvVgqNnw1ZrHK9
         VEjmmxaLPJGOkHD2LMgmtVAcPKNYjK2sxyd8wFdEdxQkQL36avsMRxz9NrOsBtiYQjL/
         WS1g==
X-Gm-Message-State: AOAM530l1jUdicuZ+7ceBot8OlMatpMCs1YxlS1eturCMtX4uuI1hIWZ
	LEAEodJyp6TVEQHkzO8YhxJe7Q==
X-Google-Smtp-Source: ABdhPJwNhLbz14jAv7K27z89V2NzlDT0rykgRpsBI1i5lKTIDRrGGa174iGN2HxuUfd9lKCcF1gBpQ==
X-Received: by 2002:a05:6402:2211:b0:42d:cb9e:cbf with SMTP id cq17-20020a056402221100b0042dcb9e0cbfmr18371093edb.76.1654068956833;
        Wed, 01 Jun 2022 00:35:56 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c12-20020aa7d60c000000b0042be14040c1sm502925edr.86.2022.06.01.00.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 00:35:56 -0700 (PDT)
Message-ID: <a02dbc8a-7d7d-5939-1c30-bfe8c7480f1c@linaro.org>
Date: Wed, 1 Jun 2022 09:35:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RESEND 00/14] Add Mediatek MT6370 PMIC support
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Cc: cy_huang@richtek.com, alice_chen@richtek.com, chiaen_wu@richtek.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531111900.19422-1-peterwu.pub@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_003558_447830_725BBE1D 
X-CRM114-Status: UNSURE (   9.23  )
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

On 31/05/2022 13:18, ChiaEn Wu wrote:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> Sorry, for the patch dependency, we resend this patch series and we're
> sorry for any inconvenience that we may have caused. 

What is the reason of resend? I just finished reviewing v1, so shall it
is confusing to see a new one...


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
