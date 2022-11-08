Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8290EC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 16:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lzu8o9GG+rQV95TQcHmCItfsXISynxSuosbBYQlCmt8=; b=tU1xwEBTj9E6/AfsBw+twcm7K+
	c3aoOhpQJMnYapWcR6RZe9V1SahzjVtaXSRRWP7j8mHNw4jczAvOm+S/MZ9VzmVfE1l4Hn5VW/4JU
	wgeijL3Uao6ShdNiEraLa2wtBrgu83Pa7NqXyf3/QOd28ump21Y7f26FLW3+lktaAOvzB70/5YYZ8
	ovANvNOlWlj6Ee1PpzpRv+pJBZL6xpg1yhZs8yESqNb2vf0/0OVaLnE+PA9NhfGSIzPhTYCm0tCHL
	tU8bJpWT5djgHZObKyA0dg74LMtitg4ZVEPIwX07pvsS7tiqy6tIGFctO9QAjzwRG7f0ztwiq3TbL
	ux2vNHFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osRnf-006k89-53; Tue, 08 Nov 2022 16:50:11 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osRnd-006k75-0R; Tue, 08 Nov 2022 16:50:10 +0000
Received: by mail-wr1-x42c.google.com with SMTP id l14so21937390wrw.2;
        Tue, 08 Nov 2022 08:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lzu8o9GG+rQV95TQcHmCItfsXISynxSuosbBYQlCmt8=;
        b=SocYvczHroVp4XHkMPIp7gSKsqd8xgbGlvXi6yx0ZnEsRTpc++d1845nkZ8B3q4ksI
         3JueTDqPardWkafPpYSdIC7Hv3HVTv1xXtizytQMqzC3aou+N2EurrBv/sg9cvKYm8+p
         YEBagF9gfNE6GWScWusf4ee0BwQKbSwF4orAOzvow0FPH/4Xe8G2RWxc3WYHFNZv2g5t
         dVbAmFLNH4/7ED4Jz2eww5MpqUrM8Pt30OA1qM0Qz0eKf9OC+Ruo6ehAB5PPQ4WP7JU7
         bjzKsPnT3gjs3hFQJIw4GrgAJf9+rycMeL/i5s2EjKuzbC9R6eVgXICy/QWwd7XG1GW7
         vMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lzu8o9GG+rQV95TQcHmCItfsXISynxSuosbBYQlCmt8=;
        b=2aXEydHvz/Lc41iVew9V/nrF44dM4GHI1EKD0XfPc8lQ8Yi/IX3AipOvPemyVPX6aW
         4YD5VIG74Mf/q6Vpp8J2reUE39z+LT8wEk4IojYOrvhIX+aVX0pR9zU8fcbzH9A7J1eI
         dos1+OgbzPi3JbhbSu3Za4pqoD5Y/HBYY2hNJM38nprRo50EVPNxp9L0SCQnVFVIX146
         dlSjrGSfJ4ZPcP110OKBpt4ySM0hyVlodmKliQwD4XhYvSjGi5W/QPUSUk4O1Z4k+hjr
         B8t4j/LlaqUp/lgcF9aoCtlTwrWev2uiUMbbxME4KLXa46Ngzn3iSMrqSVu2nP+UbbV6
         OlNw==
X-Gm-Message-State: ACrzQf12s5vr+PcPGSZHsLAy2QuIrZrN3ZUE035AdMLpDMoVdsoWSVKt
	xFYALdLqe30pGmeE61cvMIc=
X-Google-Smtp-Source: AMsMyM7PeyIbqxOVDwCt3DMl8SeeLMT1BoIW3zIboH7LXzL+d3ylaG9gT1A3k7WMgfTd+2c53cgLZQ==
X-Received: by 2002:a05:6000:a11:b0:236:7685:e7 with SMTP id co17-20020a0560000a1100b00236768500e7mr37639616wrb.359.1667926204501;
        Tue, 08 Nov 2022 08:50:04 -0800 (PST)
Received: from [192.168.0.25] ([37.222.251.204])
        by smtp.gmail.com with ESMTPSA id k186-20020a1ca1c3000000b003cf4d99fd2asm11701116wme.6.2022.11.08.08.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 08:50:03 -0800 (PST)
Message-ID: <e6cb428b-bfa6-d7f0-e648-668dcd93eeb8@gmail.com>
Date: Tue, 8 Nov 2022 17:50:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v4 01/13] arm64: dts: mediatek: mt6779: Remove syscon
 compatible from pin controller
To: Linus Walleij <linus.walleij@linaro.org>,
 Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Wang <sean.wang@kernel.org>, Andy Teng <andy.teng@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <20221028153505.23741-1-y.oudjana@protonmail.com>
 <20221028153505.23741-2-y.oudjana@protonmail.com>
 <CACRpkdYtJze2ziz+XBzNnsi_7r0jzujW0o=2P5Brgsi5QCZBuw@mail.gmail.com>
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CACRpkdYtJze2ziz+XBzNnsi_7r0jzujW0o=2P5Brgsi5QCZBuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_085009_082936_0E406B40 
X-CRM114-Status: GOOD (  12.57  )
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



On 08/11/2022 13:18, Linus Walleij wrote:
> On Fri, Oct 28, 2022 at 5:35 PM Yassine Oudjana
> <yassine.oudjana@gmail.com> wrote:
> 
>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>>
>> Remove syscon compatible string from pin controller to follow
>> DT bindings and pass checks. Adding the syscon compatible to
>> the DT bindings documentation instead causes a different check
>> error due to the syscon document specifying a maximum of 1 item
>> in the reg property, while this has 9. This pin controller has
>> never been, and will never be, used as a syscon, hence it is
>> safe to drop this compatible.
>>
>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 

Applied, thanks.

