Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D7BCCA47A
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 21:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VtmK4PlOvwmg8uG2yB4Iza9UeAeTmHfNh0gkImG1Z7Y=; b=aQHd4/audFbJJTUa/3Nq4/Wsx8
	CdDyFYVdPBDiWOe6dfjTsDeMf7kjfpUjwH3Pavc7VK2uBmOFR6b8aHwT4XR6t6KNHaYH4POTI51Et
	GfAWxxa1bXJ6S/rxymDTj26MSJMHUPV5bc2V2sSLS0qGXHMQMR9CAtrw560T78BDDsSP7X7d9smrm
	htFdpdcWeGsybN91y8dD91rHPLxGAmsp6EqjqcyivIDo+K+KCEfYKHLXl2V4fI+/2Nrhhw8YTMRso
	CF5yUgCGDvq4Wm6daJEcIZ7d93UZEgiAQxSAKAk2avpE7XWe9/PlVl3WMAO5FxOwhXtvmoiAnlpRn
	7dZXxT4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1wi5-004M7z-UA; Thu, 16 Jun 2022 21:07:25 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1whQ-004LrW-UO
	for linux-mediatek@lists.infradead.org; Thu, 16 Jun 2022 21:06:48 +0000
Received: by mail-pl1-x635.google.com with SMTP id g8so2223499plt.8
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jun 2022 14:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VtmK4PlOvwmg8uG2yB4Iza9UeAeTmHfNh0gkImG1Z7Y=;
        b=AfSPntI6oxl4+O84tcbZn9AlYby5A4XPDEpOw3VBVXQfEnkB5Zd+1/AnjwHEhI6tAW
         2kpzxagrIGyEC5orssmUh3dmYlI2dcfJ3CddYCnZLFn5wPwvhC3TISHn1bu80xrXK6Dw
         FAwg0Sz6bbeINYT2pNrE2zKzi7iItDE66Nb46/s5r3YaBXnFNhj0TmN0DKo/blsATQ4K
         /+V34zlE/Gr9gawoF7DRfk3FnxT6iZf0CKNLBRwDI4SQLtlVUbqLmqsCOyIT8Fno+L/8
         qvGNeJRjC9HmsTfE2nxHsmE1cDKUgQNg34dN8SQkqtgc818mkFNcRn0SJtBSVE+uZzE4
         65gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VtmK4PlOvwmg8uG2yB4Iza9UeAeTmHfNh0gkImG1Z7Y=;
        b=dCjjg3HFVC9jVDdbx7HwirUnUYKNN7VyEl2H373UQiyUcQbHbt2ATPG2FFKoaWAQq0
         TdOlhzsFXqWyillAbao2RBOlPyGJx654t0HDf0YdcgDvZUBRFZvRyEXqhHWpo9HwTZEX
         44ej0karUSG4JJ0ABD0y3tJh5TKnp5I2A02LHaIfYXSMpDducXNI3dS3QN1+cI4O8H5q
         F+tpUIpnik056ht0uB1PpKPjMmmN9tidKONNrlsNA8TWmwPpvoF9Jk8TJfePlTHBCPNm
         CCbxA+DtHgb+eVuvn7H20BZHlipnEGTAyQIfDwMNzYdvGo3dEy55zJHIw3/NRmtI/K0/
         naGQ==
X-Gm-Message-State: AJIora/Ls9fVgQhCsySc7/3lPI2Oi4DTcb4Pv7ixVACLMjxHPbqsjwrS
	Dz8pwAYKkWok6SJ0WxrIRR29FA==
X-Google-Smtp-Source: AGRyM1uoWZHt0T98ywktREBlYQc26uVL0feT2aArCGGme4dAjDJxMF+QrxIhVpQEzb94h1kNG0iEnw==
X-Received: by 2002:a17:902:cec2:b0:166:4277:e0c0 with SMTP id d2-20020a170902cec200b001664277e0c0mr6288631plg.107.1655413603366;
        Thu, 16 Jun 2022 14:06:43 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id c9-20020a62f849000000b00522d32a6a38sm2165252pfm.121.2022.06.16.14.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 14:06:43 -0700 (PDT)
Message-ID: <f6ad5cef-22d8-307b-5c9b-acfd3e784093@linaro.org>
Date: Thu, 16 Jun 2022 14:06:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 01/15] dt-bindings: usb: Add Mediatek MT6370 TCPC
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, jic23@kernel.org, lars@metafoo.de,
 matthias.bgg@gmail.com, lee.jones@linaro.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, szunichen@gmail.com,
 ChiYuan Huang <cy_huang@richtek.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-2-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220613111146.25221-2-peterwu.pub@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_140645_071244_743AE4C4 
X-CRM114-Status: UNSURE (   6.64  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 13/06/2022 04:11, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add Mediatek MT6370 TCPC binding documentation.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

