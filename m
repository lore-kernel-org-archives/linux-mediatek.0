Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02ED6C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 14:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HR/UL3nWiP9+BlLkPMo0LigVRcJUQrxKrp6OBPo5edI=; b=ZaGi9lZk4NkM+2
	rKT3PcQjWlKeoQU7mPaXBxZKqygc2makmSNrI7u+u69l566jfTTECvl5E8MYTo9mnL2Hc9cEEujxz
	BfVSRAMJ4iMSRD83ZBfWZobduV/MBBnpaWssgTNyNL7y6BTq3f0C9nr/OcOSBg7dFURfyHUijfReV
	4KF/tVnSuGQQNpkfcqfvtBuahWLJfRFHFL/N65311fACHfo6cq3lV6J0pnZSZzhBmi7zcLZNZ/tBQ
	R0FMJRws8832i9i+0uogycpAxv3ZXuX6gZJxCF3UQpuWWVqeK7RR3gSgSYgX2dagfjf02TFslsqBw
	eaNjDv+2a6WQf7lojecA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nltlI-006JTm-8L; Tue, 03 May 2022 14:44:24 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nltlF-006JSY-I5
 for linux-mediatek@lists.infradead.org; Tue, 03 May 2022 14:44:22 +0000
Received: by mail-ed1-x536.google.com with SMTP id a1so20131438edt.3
 for <linux-mediatek@lists.infradead.org>; Tue, 03 May 2022 07:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=aY4s82XwSrqXdVrj1Gg/ZPd4J9t1Ccsavp0PTdRcSPw=;
 b=etVEBmTj3fnk5cOi9G+OhkVYOhQUkUlnSMAJFU4KyxOD0KIU41vOb98UqDOZuQ3E9E
 oZC8hEg0hnEhxDxjjvDrcwQqS5/ZFuwz1ewdeRmHJpG20jN5D4MZJsAKGR+hnsFenmjj
 MVRJD6cfM+TF0oCgDJhEXCbVmTqTnQNALopxxnQt1fD+1ieXzBeLiMsPcW38cf8T/alh
 Q8jsNkwqVL+20us+HSrr0+LuUTftNoNMoXcByfYbqGOXgcNe25Q83B8Fa+YYNQmcJ8Cr
 Y5qPow+KWvn4Y6D+NXrRRoFCa+djW6rMcybwXjP11sNwEUhM80xeqJAkEXgZd5/SzJyf
 rqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aY4s82XwSrqXdVrj1Gg/ZPd4J9t1Ccsavp0PTdRcSPw=;
 b=xp4atXRDH2gE0wWHWSrfIwT2w0UfKyod6x9BUQ4RlmLf9GSjRMtdDLh79rSxPJdQ4d
 Exvb8Or2C04hJOaCg+SZlfcqHLtUvgbB5loIxQpGR3P6imJeBd3cd1oR/oIYoAupllMn
 ln3c/s0SJBGEvjXJpDLPNaYHSkC4Fc3wWZTPt3G5Am1yPUekA7icTAjdOBVGqji1W3ex
 /MDhYglk9rC/0EsPwtyf9mWcadxQ4Rjnx+uN2Y5IeqE5vYMBpUXBt4he0Unrm/XvLL3H
 NQOX22H91RkwRPUWROs5totuE0QSoIXSLvNKSaZBg5P7twMK6oHB/8GrlKDoQs91dy6+
 UanA==
X-Gm-Message-State: AOAM531WbBavPpMo+GZgF0zcDq1VauMToNHew3bpBh1VWwoZ0CNb1bBr
 RR0mPe2dPAAkpBu+cykozWhz2g==
X-Google-Smtp-Source: ABdhPJxpfh0y/LqVlOfJQR1BB3AT0qQiNxhOj7CgucuGZhv207wHkqq8MYHox38zzpF8jJTWjtV2mQ==
X-Received: by 2002:aa7:d9d6:0:b0:425:dafc:2fc6 with SMTP id
 v22-20020aa7d9d6000000b00425dafc2fc6mr17994605eds.340.1651589059417; 
 Tue, 03 May 2022 07:44:19 -0700 (PDT)
Received: from [192.168.0.203] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 gv26-20020a1709072bda00b006f3a8b81ff7sm4682592ejc.3.2022.05.03.07.44.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 07:44:17 -0700 (PDT)
Message-ID: <d91eaef9-562b-27ff-9164-518b0666d7a5@linaro.org>
Date: Tue, 3 May 2022 16:44:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: power: Add MediaTek Helio X10 MT6795
 power domains
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com, mbrugger@suse.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, nfraprado@collabora.com
References: <20220503141441.125852-1-angelogioacchino.delregno@collabora.com>
 <20220503141441.125852-2-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220503141441.125852-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_074421_647450_B70084DC 
X-CRM114-Status: UNSURE (   9.50  )
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

On 03/05/2022 16:14, AngeloGioacchino Del Regno wrote:
> Add power domains dt-bindings for MediaTek Helio X10 (MT6795).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../power/mediatek,power-controller.yaml         |  2 ++
>  include/dt-bindings/power/mt6795-power.h         | 16 ++++++++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 include/dt-bindings/power/mt6795-power.h

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
