Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF711C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 15:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=25PwxIH+CB97dQc4eYwSt0zvL+9wdm4R+OmiPZ9+hOg=; b=xXFT+BQBgo+AMl
	I7YlOhfk32OMtbUQ8w/MU2za1JfOThwJWUcY66Uw+9AxIcrxUcvtHFebdL6jn0Ig3V4BBiZ01AqYz
	1p251F9sZRYXUbhKs8U6+g8UFQRMgSsRfRavwxx7Iz2ET0OlXM/Mqrbk280lUFLEYHYgehtc+QnOc
	moVuYqU2G7LcxUU5OnRQq0BShTajP9qbBcitZU7IMCtI/9Mvx/mPhLuNY/Nm7e5qglgjdUp2lRl/l
	7/0I/22WEsRCZAl/a6S3fhLpmC5K7fz8mJj3Z4CA8X+eqmZz6etGvjIWRISMPZ28d1IJIB0PakhYi
	SUhTTrjVZG/d4/yiyd7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okodU-007lKi-GE; Tue, 18 Oct 2022 15:36:08 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okobj-007jdZ-1N
	for linux-mediatek@lists.infradead.org; Tue, 18 Oct 2022 15:34:21 +0000
Received: by mail-qk1-x734.google.com with SMTP id f8so8867818qkg.3
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Oct 2022 08:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=25PwxIH+CB97dQc4eYwSt0zvL+9wdm4R+OmiPZ9+hOg=;
        b=vLCXOO3oU0ZfQ0dydfle8XZIw6pQRu1gYVIIAwm5/C5Z9kElQDG4Wdw7FaKtDb/3vH
         6L3EFRNJ48E/8Su58KBIoQr6x1ISfg+pc15iKh36ehQnTy3aor+3MtJ9YNbnUm5WFamG
         T8QGI1FR8d2Q/8wtOZxUvXvmnf7eInEJaBVOcp3Z7FerGEdhHUySCLv2GSMsDd7s3Wpq
         +cmnBhNNF9wluRo/mIXqtr2X4DASPofO+zmW43gG3RyFcGKGEes+fgCY/sMfSIGkFqmR
         Csdx4fhuGtfacVm0h+Ko4XPK68GPevIlWBMRCPRfjdwL28FZSlk/f2HqjIw6EMEfT86f
         eU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=25PwxIH+CB97dQc4eYwSt0zvL+9wdm4R+OmiPZ9+hOg=;
        b=46N2MEEyqRU+Aju5djhGhz9J8wYtYiOlArMQvOohYaygni1KgAX9z2evMEz2kI8u95
         2s/xgN/osezYeEm5oIXsYL0vxVFSw5u5xFxh/FnAEJ1mJipFBwC9s7ICCSJXgpay9f+H
         64Kjhb/KEHSRspBMhP/iYnmFdHDMr+zV50q9BLJYr56cH4oYEuL4p6D0oQnrUwLadnp8
         Ovy4nblvrI3DwROkxv4GbirISJV6GTD7Gcdp5m6b+zmoPLHEB0LhQIFqpEZ7TcPHjfTg
         snadtwfU2gZFYcjjFNpUESRDOSDYnoawwUay7vLeXQrc8a5oIxZuavoUiZ5KM8U2HC+e
         v6eQ==
X-Gm-Message-State: ACrzQf14yOAsApcfaQRQEJNXq+6gZ18XSlvvkQwSxBGh4Gncxk0etJUZ
	Onug93SDrpGjw049lD3iVfvHKw==
X-Google-Smtp-Source: AMsMyM4onaH5hp02rLlllBdKdj8sdj3xKkov6Gukv4sG8mr4QrOTttP/uDoCR+/g5eDLB7qKAf2uZQ==
X-Received: by 2002:a05:620a:131b:b0:6ec:bce7:99a9 with SMTP id o27-20020a05620a131b00b006ecbce799a9mr2259247qkj.84.1666107255022;
        Tue, 18 Oct 2022 08:34:15 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id t12-20020ac8530c000000b0039a55f78792sm2031844qtn.89.2022.10.18.08.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 08:34:14 -0700 (PDT)
Message-ID: <58883c51-d72e-31c8-0632-211b532c584e@linaro.org>
Date: Tue, 18 Oct 2022 11:34:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [RFC v1 01/12] dt-bindings: phy: mediatek,tphy: add support for
 mt7986
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221017104141.7338-1-linux@fw-web.de>
 <20221017104141.7338-2-linux@fw-web.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221017104141.7338-2-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_083419_104040_1F003005 
X-CRM114-Status: UNSURE (   7.56  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 17/10/2022 06:41, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible string for mt7986.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


