Return-Path: <SRS0=Vpwr=D2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D7AC433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 14:31:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C00F222C3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 14:31:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fmzkJ+TV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9oWyitn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C00F222C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TdX7H92aiySvzcjKifMRVsXr0twXJZ/j6R3ETc2houY=; b=fmzkJ+TVj6gAq734cn/m/Sxs/
	kckrLyu96ZaVKPhwL8uYBrOEujJIIgEkO/dmw6nbfQNcBNKCjuMJbHMNbnLxWV8V/tVXtFxiFWVls
	tKqLxnPrmHVxPueRs21mCcmiC7fOHOS57SmKrU5jgruYy4HvpRF4BjJ1U3rfxw5oXBcFGaEprN5Mb
	nMd3DQfiPo+tKq5d6a8qiWRBiSulynIuAETeOquKCb4nyzZXWUXNVLYiKxTm2Fuw7NXgKyMokoPbz
	9v/Aiy0e3xGPIn9Li/kD+BKuMTK+B82prIHTwijp80h5LuRRaBulRAdQrwxug9xUcFYgoTQvWjdOH
	QCVGIG3Lg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUWCK-0000zh-On; Mon, 19 Oct 2020 14:31:40 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUWCB-0000wL-G7; Mon, 19 Oct 2020 14:31:33 +0000
Received: by mail-ej1-x643.google.com with SMTP id ce10so14226211ejc.5;
 Mon, 19 Oct 2020 07:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MepAw8QikH8iyL9uAquf5YG3tjzob/KKJdUH1sVOBVk=;
 b=k9oWyitnMt++4zrFpLN8CCED218B+biNowtUEWQ/yHYYk6tbQmhfYUreCjx8Y/BDdg
 mpadDWoTL5XY0u4obiWSO0GvJVGjC08Dp7QBm0WQGzcsu5r1LENTEt+91Ntw2X+BoCyG
 8x0jERqmhwrFQatevK1DilPRa2WpDHEtDDMkjzDNMvdCmCtfHB+vLSxssGFFndGQTw/T
 wIaUaIdl/X6xA9IzBGW7Y7lGOF7TBX/UljA/Ny/xri7uR7+SAuxZKCPApYVDyAtn1Dho
 zEb7NZtvClyHS8maqi9pI+UAInbnhzzl53XTMN3Vj768HY4NQ//Rgt+/dXk8dO+5PgPA
 zMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MepAw8QikH8iyL9uAquf5YG3tjzob/KKJdUH1sVOBVk=;
 b=iTj9Ja0A6LXPaLkt2Zkn17nuMVlCgmpuucBgzd8QZvjnbDliRUgz9ALbtjiza59kQn
 CTLtBzO7FFDSEq7jAqT+h6GY2kQ3S8laQM1jrp5OWtRL2u3Vz12SJbwwy0/oxRbam698
 RYxFftRTdV1NrJQFUqgohFx2tPmONa7ISYF7//2rTfcABXtznFMyL5bB/YlFt7F2wHrA
 q5vNIZfUegLxF/9a6Wqtv44/+SFd8rIbKP0FKTkahG6ganEgQGLsI99krRCqTiPQ6QeX
 NmefSGSOzUlDIGtSBjILltv6cuQC4usUsfcRk9KAUqcD9QKNRujYxQuiF/rDrgWRpeEP
 iOkw==
X-Gm-Message-State: AOAM53290VgkoLG5sJhT6j34hutIHscx6iK3JoCGafq9IWJpQ+QQjf43
 gUTKtFxU77xWuJppfaiYsM0=
X-Google-Smtp-Source: ABdhPJyEYwW4FFKts3BZU6uk4cE13TWT4ciblOSS+iLcXuP/eCaQaDXJIweK/eft7Cpo3P5KX3DWaQ==
X-Received: by 2002:a17:906:1152:: with SMTP id
 i18mr159113eja.101.1603117888789; 
 Mon, 19 Oct 2020 07:31:28 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id k11sm234857eji.72.2020.10.19.07.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 07:31:28 -0700 (PDT)
Subject: Re: [PATCH 1/5] dt-bindings: pwm: pwm-mediatek: Add documentation for
 MT8183 SoC
To: Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pwm@vger.kernel.org
References: <20201019140705.1518822-1-fparent@baylibre.com>
 <20201019140705.1518822-2-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <95cbfef2-ef5e-1743-58d4-545ce7d29227@gmail.com>
Date: Mon, 19 Oct 2020 16:31:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201019140705.1518822-2-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_103132_388057_983F9535 
X-CRM114-Status: GOOD (  19.03  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: thierry.reding@gmail.com, robh+dt@kernel.org, lee.jones@linaro.org,
 u.kleine-koenig@pengutronix.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 19/10/2020 16:07, Fabien Parent wrote:
> Add binding documentation for the MT8183 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   Documentation/devicetree/bindings/pwm/pwm-mediatek.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> index 29adff59c479..25ed214473d7 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> +++ b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> @@ -7,6 +7,7 @@ Required properties:
>      - "mediatek,mt7623-pwm": found on mt7623 SoC.
>      - "mediatek,mt7628-pwm": found on mt7628 SoC.
>      - "mediatek,mt7629-pwm": found on mt7629 SoC.
> +   - "mediatek,mt8183-pwm": found on mt8183 SoC.
>      - "mediatek,mt8516-pwm": found on mt8516 SoC.
>    - reg: physical base address and length of the controller's registers.
>    - #pwm-cells: must be 2. See pwm.yaml in this directory for a description of
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
