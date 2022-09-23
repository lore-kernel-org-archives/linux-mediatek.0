Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F63FECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 11:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WVY444sgVZKK+vY4euROZT7RCJrRWYm0QFkYeu7q07A=; b=k2PRe/CzSBnD25PQnvGnJl832P
	B6B02rIwmgofq54EK8x5O6TA1YJQWnEheNNiK+mqTQb6GUNiYStz+MBP3yOX1idbaT6QSLP3l26/t
	GYrDkPAJCyv+o21eCWWuufIntfAiyjK/1fq9/Qy+PyBISvY9M24yhm6mbCWkE35+OWfntScKaApK1
	yX/duZepIweT9W2npiNkdqwy/o1V8usVo4NacL6i8+mxGQqnx2XBR6wKepaalr2JjzTNHRZ4HFLOc
	NlAhUTLp4ch9v12sUf8OsehCLgSGjzWoK7LAGH9E4iAKH1XFv/orV+GX1qRDuTtXDRoO7E2OioCzh
	yKirTNSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obgfk-003t28-Nr; Fri, 23 Sep 2022 11:16:44 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obgfd-003syT-J2
	for linux-mediatek@lists.infradead.org; Fri, 23 Sep 2022 11:16:38 +0000
Received: by mail-lf1-x136.google.com with SMTP id f9so19280344lfr.3
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Sep 2022 04:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=WVY444sgVZKK+vY4euROZT7RCJrRWYm0QFkYeu7q07A=;
        b=GKMyIrG6A6lX/rlrp3TOcU57GiknL+XUxrwfFH/f1akM2DMNy87i4OzM4NX7/XMkx6
         YED9kf6T+9gIhaeTEvZV+unwNBINlTjTsSqf2qWUseD54NmeKDo0INP/1Keu+uqeLBde
         7HicySAx8BM4kdf9ajk0c3LTUdsD6KOhzZW5aUW8Gev6L2UsDUsVcGiOYquJNPz5viII
         kElCm//hSG38MLMDhotwtKhqhhQY5O35ZU45cuzNbI25thZnSm5XBk5JPw7AmCLeHiGH
         OduCbQp04LfBpS0Vetf0LjQoeLTXfjh3hCbVovgepaPCOoCmBjut3+go3MlEosTHYK//
         c7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=WVY444sgVZKK+vY4euROZT7RCJrRWYm0QFkYeu7q07A=;
        b=vX0+ry+GtILsAjKUyHmVIzVSC921FBmOGsTepT6HtB9FD6GMRzoa2tf+ucWRm2OK3F
         ElC7ol8bNcQgYRoAcOSRlSDLTSVJ4wF+OvS13tCUgPkHf6ilzCxVhcMMdTVud9E9Chhz
         AZO4Hp/1jR3piIEorzW8h1rNwlH29+Eg1ZuI51rt+WhKShnnN8grTKm/7ctlbuLWhLWm
         GS6WeJu/tiuT1hMbgol3KPbCr7vxxMZBCF5YjqIKRMAqwwiHCGmAS28epLtYsprEeZ8Q
         AjF1DsjGETtKh3KmUgw/5+8rITJgeuDgC1Q+PRojxuZwUbzlrzNfEHx/K0gG9lWJuBXP
         9eZQ==
X-Gm-Message-State: ACrzQf1s6SK/HY99R76MJW42GxCZ7wKKpgxpm/cG6mfUJZtqJMyWhhLw
	JtjBJsqnJ5h9WCdTgAj87iVkPQ==
X-Google-Smtp-Source: AMsMyM6ZqgtGE6YGi5NHqU38FwIKEP5Y636y2wBc6bsb7FGrQUA/VEzL6pvHiLgIjd3Bhg+MjURUzg==
X-Received: by 2002:a05:6512:3c92:b0:499:a1ff:d6f3 with SMTP id h18-20020a0565123c9200b00499a1ffd6f3mr3099204lfv.153.1663931796319;
        Fri, 23 Sep 2022 04:16:36 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id du12-20020a056512298c00b004946a1e045fsm1399245lfb.197.2022.09.23.04.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 04:16:35 -0700 (PDT)
Message-ID: <f6e669dd-f2cf-6e3f-18bb-25b21e5eab0c@linaro.org>
Date: Fri, 23 Sep 2022 13:16:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] dt-bindings: display: mediatek: dp: Add compatible for
 MediaTek MT8188
Content-Language: en-US
To: liangxu.xu@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220923013953.5043-1-liangxu.xu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220923013953.5043-1-liangxu.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_041637_665277_235FD104 
X-CRM114-Status: UNSURE (   7.06  )
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

On 23/09/2022 03:39, liangxu.xu@mediatek.com wrote:
> From: liangxu xu <liangxu.xu@mediatek.com>
> 
> Add dt-binding documentation of dp for MediaTek MT8188 SoC.
> 
> Signed-off-by: liangxu xu <liangxu.xu@mediatek.com>
> ---

Where is the DTS? Where are driver changes?

Best regards,
Krzysztof


