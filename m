Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E555DC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 17:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QR2Y6MPpjQJ0KYxmGnnQIG0xpMUfqccXgnvrmOwqbGA=; b=ly2SgescA/p8E/
	G4rkmXMymlaGOGQLL54uiqhlr151CDrWXwh1RnGfZuxEXghxfkezPHdnQZfc8KmCxCploli3jWVgg
	z15qK92GQmLaCCC+F+X1+zrE9qTaCGM71waZAkmPm3kf4UlOjj2LLoqub1xqBte2r+qpzuwI4pU84
	hzY/e3hoRaSuxfA+m4l7ptHbkp1MKuYfu6kGau+k51/rLe3Oodm6KC7xIZ+LW+wsAaNuuSJSI5mdp
	csArCY3vHOzE2T1rYals0LR+JlkLHnqGXAXGfVpOhOr8nmGwOgSOGlanow1k3T69HBAa8KgIqZ8Xh
	JYuse4zc4HxaNCN4J+hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhx4l-001lmi-UR; Fri, 22 Apr 2022 17:28:11 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhx0d-001jsc-RM
 for linux-mediatek@lists.infradead.org; Fri, 22 Apr 2022 17:23:57 +0000
Received: by mail-ej1-x629.google.com with SMTP id ks6so17735937ejb.1
 for <linux-mediatek@lists.infradead.org>; Fri, 22 Apr 2022 10:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xyTu4b7ZMRhX6whN7X8zUFA8mpZ14UJCNVpEn8M9ARg=;
 b=NIa/76KBpbPcghoDEkTYGEHbQsh/DvJWClpr17LX22LfUCDZlA8v44kBeEFyZHxhX9
 dGj9bcrXhnLJcjpa+sp0fCzGeiIsd1LcqXrgUryZ4GH9Ti06OoWYQRoFgPVXYpfL3ooe
 s66wJHVJ52frfDlYQLnrn63t4ijca1CnnUSagHs4Knl1WTBwye44ShV5svAu8Su/v5I+
 ODg58bbXoXdN12+yLukNzr33J+hvPWkrjqj1G9EpS0U0VRl6WdxsnagiIZzXQkZ2egSm
 RfJaPMmssnoS3R0VoGZqg3SJ/YWBy6ttx9uicI2bDwGRr7zZWCwWIcMJk3H78ck72pMZ
 qXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xyTu4b7ZMRhX6whN7X8zUFA8mpZ14UJCNVpEn8M9ARg=;
 b=qenHK7KS1gweLF2aYxSbLPpX7CUx0pfDyfsrWQDcj3TOcLrQ8S2wmSh/7FdB+1n77h
 tyJXz5FVnzMt6hBg8axEurlUuQZCCVs+c49FEl3XobomVTzsrPN26aZja4VwBcq/c7Yq
 SoNdy2ndabcBDWO7GM3u4WY2Uf9pVw1z0D0i89LDL/vk74n24yJn9POtBBtppap9CBVz
 l7HDw3zP+9sGdnrGQRyB01zn6YokpW0BRc6upJ2s/+pLXErgMEwstPa1BYfB5OwJFkrZ
 rYwAQPveiJiRFUKrExcf3rV07eJ/LQaftV8uEHuVM/TtQLCsjPH7SIG9ksU/lFA1PNVC
 RJjg==
X-Gm-Message-State: AOAM533MjtxWC7U7C8b1K+91sF5pSQdu/bZ2OXJ6ay6pBQTB8Y91sA+5
 eJeNNmmJHOUxJmMxQIb7FfC5kQ==
X-Google-Smtp-Source: ABdhPJzS3sVONP52JJ41oUXMaywZWInX/T1GsMDEpa4Oo7VNHKVjxy8VUX1OKglrnM+JWmBSNQhpLg==
X-Received: by 2002:a17:907:62a6:b0:6ef:8118:d3e2 with SMTP id
 nd38-20020a17090762a600b006ef8118d3e2mr5004725ejc.605.1650648230694; 
 Fri, 22 Apr 2022 10:23:50 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 fq6-20020a1709069d8600b006e891c0b7e0sm933630ejc.129.2022.04.22.10.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 10:23:50 -0700 (PDT)
Message-ID: <af95f353-c91d-844e-3bc1-e052f7d16e54@linaro.org>
Date: Fri, 22 Apr 2022 19:23:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V4 00/14] cpufreq: mediatek: Cleanup and support MT8183
 and MT8186
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: jia-wei.chang@mediatek.com, roger.lu@mediatek.com, hsinyi@google.com,
 khilman@baylibre.com, angelogioacchino.delregno@collabora.com,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_102355_954140_1A94B3CC 
X-CRM114-Status: UNSURE (   6.76  )
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

On 22/04/2022 09:52, Rex-BC Chen wrote:
> 
> Reference series:
> [1]: V1 of this series is present by Jia-Wei Chang.
>      message-id:20220307122151.11666-1-jia-wei.chang@mediatek.com
> 
> [2]: The MediaTek CCI devfreq driver is introduced in another series.
>      message-id:20220408052150.22536-1-johnson.wang@mediatek.com
> 
> [3]: The MediaTek SVS driver is introduced in another series.
>      message-id:20220221063939.14969-1-roger.lu@mediatek.com

These are not proper links. Please use lore references.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
