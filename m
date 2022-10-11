Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0F7C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 12:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xdgKVcoruOsRI1gFQDV7XWiemaEJpElOt29w8YNp/Nc=; b=fom/6mU6/b2YnjXHtHi+faFbDD
	RAZcJi4L/XVIbs68YxRMFpkebt1/tvTfQ2LOcW4OJT+29bhk0ADyD50KygFRXPt/z3DBDY2Fw7sNp
	Ii5D1DaZx0bYCxEbn/M+/V3j38ePuWKIbz4wniIoJ59kRoClW6io2jpvgHm0J/Fd6/irZxEPGI+f0
	GOYqcUWsFw7ZzYdrehtjCfOQBKsfZgwqcEy75IkCyz8mIS1KWWHTmcNIlX+GeydzZib+UQpj9us+Y
	Y0DM9rWx9K3TKsnvxZ2+Lw3BpeV0xYBSpIh6qWxVSv0j/cHUjPmn30vx/ZATo89h/KFrW5bGiHrU1
	qI53oAPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiEGy-004Chs-BP; Tue, 11 Oct 2022 12:22:12 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiEGw-004ChJ-2W
	for linux-mediatek@lists.infradead.org; Tue, 11 Oct 2022 12:22:11 +0000
Received: by mail-qk1-x72f.google.com with SMTP id 8so852086qka.1
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Oct 2022 05:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xdgKVcoruOsRI1gFQDV7XWiemaEJpElOt29w8YNp/Nc=;
        b=y7Ve5W6HIEwm38hukIED5K6i5gpPSmtxTMyBbepdqdk8UqLxqRcPy/0rh/YIqI0vO5
         hxGfWrODjkTjoXnPyKULFUUxe2J73iDRYhDP6NdP2sW92U59eRsinDsqZ1GqD2RLchK4
         bhWolJ0qyAQ2PRery/1MmoYtInO7+pir24FWFWhI3TcB7CsioRd3wp4CmT4gN9JE+R43
         dk46jcrXMw32B9pNqSdzjk6udVoxjsy1vH7KQ/TeO8bybA23glWzWeHMyqo+cwKPcTrP
         /XVquPJI7jj7pDpqGasihag+LvPRBdVErOFZyR6hHg3qAQ+dGRSmlVoR45JosE9KfkAc
         I/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xdgKVcoruOsRI1gFQDV7XWiemaEJpElOt29w8YNp/Nc=;
        b=oAmJW5nnYmlQxnRYQc+2T4bmnVNNIeRMnwd/u30CincDG4JYL7gWzCZH21ggCCwpDS
         HUwmLkNDuRvddYjokjGjDCdkzxvLPZowIyZzXSqKclY9DPrHGe9iSI5SkqKUsG5/UZDv
         QCxWlj3tRWawaQGwjrY/Tu2IHhDQbpEETiEj+8bKTTf/fg5bTQ94O3zptPnUardbLG7p
         jDaWfS6Jou3xYQBjk7IzNBFglTQ3ALucnMLwcrCmrhWtzqM3nKI3pzfO17zzn14sUaJl
         HYaGxJLAesra6iV2W8R0qRdgaxx6bsD1qo+KVwOqp9uRF03qG+4UbrSmv8qhY2uOnJ8C
         FaFg==
X-Gm-Message-State: ACrzQf0zc9DJZuxNvD3E+UT5+zsN+hYF1qzLTDNSKbEcuMGcoxptGQMn
	QBD9De4OIugDQHPC7Hoxq7jRQg==
X-Google-Smtp-Source: AMsMyM41xqpDQ5in9l8801A7p7/zmkHU8JUE3v76Ofg1mojAArmpRMuqq/6uStoW8ppkc1uqM0prug==
X-Received: by 2002:a05:620a:1b89:b0:6ce:8b2b:7f0e with SMTP id dv9-20020a05620a1b8900b006ce8b2b7f0emr16345274qkb.15.1665490929135;
        Tue, 11 Oct 2022 05:22:09 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id ff13-20020a05622a4d8d00b0035d420c4ba7sm10597119qtb.54.2022.10.11.05.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 05:22:08 -0700 (PDT)
Message-ID: <15a251de-d78f-b3d3-936a-32ace29671be@linaro.org>
Date: Tue, 11 Oct 2022 08:22:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 2/7] dt-bindings: soc: mediatek: Add support for MT8195
 VPPSYS
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
References: <20221011070356.682-1-moudy.ho@mediatek.com>
 <20221011070356.682-3-moudy.ho@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221011070356.682-3-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_052210_138908_7310F9CA 
X-CRM114-Status: UNSURE (   8.06  )
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

On 11/10/2022 03:03, Moudy Ho wrote:
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> Add compatible for MT8195 VPPSYS on MUTEX.
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


