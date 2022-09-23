Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A52EC04A95
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 17:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTABx256oUVL2ZjGMhd78CKU5j+mrB0x+bRv7WFKIZU=; b=nvQw30pinK9eaPmsanSVBKFrA8
	9JLAGE37cETSdP2eK/wtmzA91c7YtQgdYkFTkuI87NkTmAw+s2NCFBLK6/NqbHS/fsKbs9Cd2sRzg
	1NQr1npo7n+8SwxfjeP4UHr8Pn471GTFAXsOqVATbyFugJXlBTpfrEKMHar6SZS9+4rDxUsWebxEd
	dQD775Rs4f4yMphDIUWbLH08/5ta6PkT5TyJSFO0JSaEUhycnUeCVRtxmwVqCPvhMTTAEtZ9d87Na
	xmrVjPFRHuedq5N2hjYwvp3Owjz/KhUWZHogkag8DLac4JX7KpoHhBd5FDwxVq59lMBaMnqpbC+N8
	CXcqGxow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obmms-005E21-BH; Fri, 23 Sep 2022 17:48:30 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obmm1-005Dl3-HW
	for linux-mediatek@lists.infradead.org; Fri, 23 Sep 2022 17:47:38 +0000
Received: by mail-lf1-x132.google.com with SMTP id 10so1419339lfy.5
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Sep 2022 10:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=lTABx256oUVL2ZjGMhd78CKU5j+mrB0x+bRv7WFKIZU=;
        b=qTmbTfYZhgY6+DtMDeoFqIZg5SZ2wyaich993fmuHwFT+rTtNa3JrlTUbGg2FBzh+E
         ybgHELHGIO51fo33F4uQcD+j0t1wVoowdc8vB9W3S6jpxxRHstokrmsHtaLpRyYV3rEO
         EfMvCKH4L4TM99v+D6EONY8qpp53fhaWR6Bjlwge4JYDozZU+bhh3nENITvBQGlcP9za
         wGIlhhDDK+rCuH1HFFDi2shLvRryKs7OQqoV7S/JsrAEhJD3fzOOp/fXz1X10Xx1BD2+
         Hexgk40cIzxWc5nMmNM7cE9UqfT139u7bgx6wUeY1hzyWGlfEihzak3KR01CkbolEOPN
         JvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=lTABx256oUVL2ZjGMhd78CKU5j+mrB0x+bRv7WFKIZU=;
        b=qt5u2Sl8E8ifWiA1IThcQQDSxZSBc5P9c0mwNA7OhY1oDoQBDqAbRMBkYh876zvepu
         yaPF8Z8LGCuokvymIa+rwfB8YMwINlSAE5QAAHrpSeZKC/x0GLS+ysDZ+rOPVHZHhGmY
         fWcEtRjv1ytBIsAcxdR/83RCw18imQ65I/vZH7Tj0iONMA8tSZ3/6LRo2c0imrEYpEJg
         F9ucyuSNldyEhLB5QK+eRhJnh7mevFM73/8Z4uUhR6wuqVGhyubXZfZokln+sMiNEUDp
         T0Nb/3pCHH5NRqIYngw4TdTkre6jazMYM3XyTljVnupdv/ODfNFGyMjI7grWPF0jo9gX
         t7Ug==
X-Gm-Message-State: ACrzQf2Em9OpxyVXXP1O2U+D56N2UMcZ/+CKp0XAkIOB1w26DLOzVpHR
	nmsWwMkvnmxOnUnozSHUs9lq7A==
X-Google-Smtp-Source: AMsMyM5dUbxsRMLwGgP1lNhkXKk3RrdWfbDCEqz5EvgWqieOxKXjhYSM2MNqJCYEUQuXVxTabxPXQQ==
X-Received: by 2002:a05:6512:1291:b0:499:f9a0:fb5a with SMTP id u17-20020a056512129100b00499f9a0fb5amr3589935lfs.129.1663955252728;
        Fri, 23 Sep 2022 10:47:32 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f12-20020ac251ac000000b00497b198987bsm1545671lfk.26.2022.09.23.10.47.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 10:47:32 -0700 (PDT)
Message-ID: <c86948df-1069-26e3-b4d0-725a804cf88b@linaro.org>
Date: Fri, 23 Sep 2022 19:47:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/5] dt-bindings: mfd: mediatek: Add scpsys compatible for
 mt8186
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>, Lee Jones <lee@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org
References: <20220923131148.6678-1-allen-kh.cheng@mediatek.com>
 <20220923131148.6678-2-allen-kh.cheng@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220923131148.6678-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_104737_625630_F46E5A7E 
X-CRM114-Status: UNSURE (   7.47  )
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

On 23/09/2022 15:11, Allen-KH Cheng wrote:
> Add a new scpsys compatible for mt8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


