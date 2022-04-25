Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699EAC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 17:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LtGQPtEqftYqiYNUUxmF80NlRrQYBEGGq2ROZa2fhN0=; b=fLTIALTiYSCsDf
	VK3cLqcNOOSwwbgLIQLdZLPZBtpfmDIiRp4OzhRS30wbGp4N2mNrrGSod15E8gpNNnDb5mDrOhyZY
	iwEEye0aWyr7GWSjg6UxZpxIZJuoCjNJGH3oUnKY8Hn+MyIaaRWUTVxwtDpnSkw485ilA0x9gqsQE
	m0/7pCF4uxlyrbgj2Tm5V+8Ee92hdIKapOxDj/CCR+F5PVrLhDqu1w2oE7PmPttXKGhfIrk6y/MoX
	yuZgyC/YAwAz+zdRllXpSMFYMZ/T2aJpsYJ3LP7iwv9TqsPGnuDWWoOuhEyOJ6xIcPg7TdPQMpVzC
	jDduUBJ8BSeNVo7fO6Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj2x7-00Akgn-VX; Mon, 25 Apr 2022 17:56:50 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj2wv-00AkbT-Ig
 for linux-mediatek@lists.infradead.org; Mon, 25 Apr 2022 17:56:38 +0000
Received: by mail-ed1-x52b.google.com with SMTP id a1so13737020edt.3
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Apr 2022 10:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sT4j0q1vLr51aWTToi5FZXFo29u90yrMt1lgbnaE55U=;
 b=VWYndqMka37ODd2Z+6EPDLCWFHOh+JBfXGMFv0tlmI6I0zURWmSUV+QYGeS1GVLsIC
 izqG0XxFk0GtMaCvttsEpE0rlz4Qn/HaKfK33nKczyAXsJXgmk95IxVpfmTrGLPOmxj2
 AWiwFLmg75m7AcO+d4i4sPaN0IY7/88fHy0K64UsruSVUTCloYYczRjHpIq1x1M7WiHY
 catwC1DV4jZVQJlNy0SNhecw9o5xLXoZb+n5LwSR74DMUUTTdMNDp2CS2yxT17vMv46R
 REoMrmy7HCVRo9BLjfh48syWXkpce6BSCiDGF44CQ+9a2pUrDn69OZdsS8q2lrEbALKt
 qYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sT4j0q1vLr51aWTToi5FZXFo29u90yrMt1lgbnaE55U=;
 b=3UgAuJkVF847jBDiLFrP9Z/a0wncvlvM8ICa0yAvDn8zvJW8s2sTyg2o+IvQgh6nAZ
 kkBTAEU1oZAOUGrThAUg97DF8KRYCiy1IvbBr9CUM07Eal8bXMAzIfmRR/V2xjqh3Q6O
 4cz+3Jh3bd2AOhZlQWIc927ErpibeI1Kyjc21W6cn6s+9dKZ9dcsddrhNkHZYzKMcOvc
 8WNwO260RX6SgHkhG7J0gtNX0qBE0inP2/0IfFU4VW1BqpRDmdiEai8JvosdIZb58MbF
 gA3lTLE1QbSYLt8DQGLvIpvVopTRV6YtBql8YJ5V837L6qZ4la/BOwh1xwpg84PYqdhg
 2qxg==
X-Gm-Message-State: AOAM530AZ80tKLom/3FY8mIyevCke6P7cRID3fEr6hyp0jsAF6WRrJxK
 tTl4DPphHFjUhe6eaGg1QEryxA==
X-Google-Smtp-Source: ABdhPJy7J6uxmFaswWnX4MmStBpfUrGJh+eXMijIPGJs+cFqkbxi6OumPEYZxX7uD3Q+fEDHdhvCfw==
X-Received: by 2002:aa7:de0c:0:b0:425:d510:8f40 with SMTP id
 h12-20020aa7de0c000000b00425d5108f40mr12290047edv.4.1650909392260; 
 Mon, 25 Apr 2022 10:56:32 -0700 (PDT)
Received: from [192.168.0.244] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 j8-20020a170906410800b006f39ffef37fsm800442ejk.205.2022.04.25.10.56.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 10:56:31 -0700 (PDT)
Message-ID: <9eddb317-e835-04a1-0875-995c6648acc1@linaro.org>
Date: Mon, 25 Apr 2022 19:56:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 1/2] dt-bindings: interconnect: Add MediaTek CCI
 dt-bindings
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, cw00.choi@samsung.com,
 krzk+dt@kernel.org, robh+dt@kernel.org, kyungmin.park@samsung.com
Cc: khilman@kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 jia-wei.chang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220425125546.4129-1-johnson.wang@mediatek.com>
 <20220425125546.4129-2-johnson.wang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220425125546.4129-2-johnson.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_105637_622649_48DA1FE9 
X-CRM114-Status: UNSURE (   6.60  )
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

On 25/04/2022 14:55, Johnson Wang wrote:
> Add devicetree binding of MediaTek CCI on MT8183 and MT8186.
> 
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
