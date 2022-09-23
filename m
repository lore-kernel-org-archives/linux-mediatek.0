Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAEFC6FA82
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 09:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZardqzm0PQ0BwEDikq+bXXk6zHXw5HLd+Zlh682CZg=; b=bAp/ZmcsaC0KdEFbLq6NUO+M8f
	rdGIFEE6FOmqmAlZfwv0L+TupZLsMuDuHlInuaxKi1YouOkS4Cf4uVb53gNS407EUvdPuMuY8I3Vd
	l3Par/iRyIHG8dD39bqdmpXG3Ut0KeAnZgtuGlCMMcQvWRSdcMQ/pqrZN8ntasKFSvtbIQ29RKgjs
	PTsBt72tdo1k8gFV3c636uwS+9B8RNO1V8wmgug32kKEaX9gkj02nudkm2LHX8DGK6aanYxPBcSie
	15Vk9Sw24hV4H+C+TqpVVj8hLcEUfIq8KaHNXr5Vdr0fUdFHhqPZEpRg+b+4J68egLfXqH0XiZjQ+
	+jCYRw9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obf6T-003O7q-L4; Fri, 23 Sep 2022 09:36:13 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obf6Q-003O5J-65
	for linux-mediatek@lists.infradead.org; Fri, 23 Sep 2022 09:36:11 +0000
Received: by mail-lf1-x12e.google.com with SMTP id i26so18845682lfp.11
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Sep 2022 02:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=xZardqzm0PQ0BwEDikq+bXXk6zHXw5HLd+Zlh682CZg=;
        b=mcu3yMDkzkOqWpb72+eQWf/7D7TbI3EkyYNzG9ZhLxD2RlVGikbCjAXG41pQYzvGW6
         g3p/6Q4L18OpBW3VZmBsmaZ4BHf9hdbfvaRj7yrbo3t9Qh8Lt8Hgedh9hMzLKEgknax4
         KLtz9gxXU3l75IlMDkEydAf/SH6ZC2vmqJuJovbwPRTz2I3Ifc1/9Q6t9aV7j7bFiWNn
         YOl4l5l1GbLrP83PSgY/aAq2KiJFlPmIi0Dx70Md/O015nZOQihRtmaA9uQvZfTnIJWO
         eQ/mxgB12wVVeSh8nZpwfI4XOqWKQGXgiQPP01f+GOujqeoHv/92xmFcLrITbM6xe/dh
         TLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=xZardqzm0PQ0BwEDikq+bXXk6zHXw5HLd+Zlh682CZg=;
        b=nRcCdDOzrHmsoZD57joNh0LE4btTb7t9GLXFcqQf6gJtjQ8xUkYWFrjw0/rMbkk+6Y
         I4HorlUPVk3nq2DRfoZRS+qSis3RJ3dCQed6E8ZnDIGuz8EToP1aagsadYH1eVTPzpXy
         AYjYE0sYZqPPLO5lbIiCsoOeJKtPQDskaZ2juVgftW04Esna/PjzZSfryEeLe7k7Jnzg
         DzeaEGL0RDR9d58akAMyQMy79b3Hn/Q2k4IWGtT2b0rhvxAAO/UMoyGuX+kTkFSiHDcw
         4RxvC95L0+gWHjyxmBuMij++bkbgsSGJA0XuZXlreljKqq9nvO64PTCx3U1mTlerZq75
         EfEA==
X-Gm-Message-State: ACrzQf3xMBQriS4BYCN8dTrOlgIL7Y88Ati+XyD5eHpwiJrfIXfGYIFx
	kif8o11+xmdYkG84ktF2TIqDsw==
X-Google-Smtp-Source: AMsMyM4grVVkVaVmdwZUlkTdjVCx4Ne2FBaiAhvziX1K9e4iP+nkA6l/z1NWFoG9xk905NGzqnDc9Q==
X-Received: by 2002:a05:6512:3ca2:b0:497:9db7:ec10 with SMTP id h34-20020a0565123ca200b004979db7ec10mr3134937lfv.350.1663925768687;
        Fri, 23 Sep 2022 02:36:08 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v25-20020a2e9259000000b0026c15d60ad1sm1281456ljg.132.2022.09.23.02.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 02:36:08 -0700 (PDT)
Message-ID: <69111370-d536-eb67-b528-f61a3b81de82@linaro.org>
Date: Fri, 23 Sep 2022 11:36:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] dt-bindings: display: mediatek: dsi: Add compatible for
 MediaTek MT8188
Content-Language: en-US
To: xinlei.lee@mediatek.com, rex-bc.chen@mediatek.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1663912657-28883-1-git-send-email-xinlei.lee@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1663912657-28883-1-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_023610_279268_B25338B7 
X-CRM114-Status: UNSURE (   5.88  )
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

On 23/09/2022 07:57, xinlei.lee@mediatek.com wrote:
> From: xinlei lee <xinlei.lee@mediatek.com>
> 
> Add dt-binding documentation of dpi for MediaTek MT8188 SoC.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


