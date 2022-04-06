Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB292C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 14:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pk6PDrwytlsu3l05pAmtHSdVc5d0PGfhVA8JeoAcMyE=; b=kfIBuaoxfzCCfj
	yWQxQBkiS6yP+B2fQYVAjBHvwxU5mZZbS0YmyJGwxeUz9Pa0nuWq8F7ABKoBp0qEmpLEV6jK0BMQj
	lcd08pAtuPMYGj8NiOnEkFwU1PN79l9f+LzDaLqtn7FA6RmUdxNPMAr8C+6sh0hsjCtCxjoL7e7mK
	+1D0F2uhIBz9+HZoj1psnozWLirF1Kp7mSm7oZbgV/GfCI0JGzpaFDy8uXm6gqPRtVHLI+EnMhUZZ
	P8YhCE7/nOekqRp8kgMlCRnk2KdmVe2ByZvTGWk/6ElGHHO2xJOuQXitRN8CA51euZhRgJMLs16rL
	er1do6iLq5z7FD+4LYPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc6vS-006d9K-3N; Wed, 06 Apr 2022 14:46:26 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc6vA-006d0I-D6
 for linux-mediatek@lists.infradead.org; Wed, 06 Apr 2022 14:46:11 +0000
Received: by mail-ej1-x633.google.com with SMTP id qh7so4705125ejb.11
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Apr 2022 07:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xDSVxXfePuzg5H9akSGpqrt3EQAyFHRkATzzbCmNu4Q=;
 b=oc7fYa5LKG8ufWeEnZcEwfzJ5lpIHj9hFl2tWq7M6SBzlHKjff+4zqdYGau4afQ26F
 VJFIPUlzbtvqtStHIl7vAupTJduZuMrIsJj5WFVX4t80pT+CgEQTb4aFQB4K0LZQK+oT
 AQ4TlPPJLxK6pu+alTOr5MjlbijZ3I9iNnIEibjRn8AF9McXK56gvy6w4igQZbA7SlKN
 WQGYLfPg2A9mHkoqM/+Mg770Lid0eOx9+FqqS2uTdj1D1np0eBXZ4RZnxHuQMLlBt+v+
 Zp2doRxa3UpevU/5tcKXAvy0PamPFu6QEyUhrfRlC5l4/RwCKGfFiHr/9/pIs9/+WxTD
 9QAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xDSVxXfePuzg5H9akSGpqrt3EQAyFHRkATzzbCmNu4Q=;
 b=ZEQzi8b7xmxiOsI+foBDzgFrMCAYFglx7Vq0y544lS9R6Py4qkQk0+wQG+Ss9fx01B
 XtagEJxOQ+J4N3XaOg4H/CjVwPXrNo20pwGg2PjXSKsZpo0zf18yk7DFDRVIznluSeCO
 P39jMgwTc1NHwxCFlaNtI79TUtUJAVNn0gYvWN5KiZ3pyCc2n8uCb7Dbnb0uX+Q3atQg
 esTGWo1nLJULi6OBcvbh2+kFIomyqHtvgbA1TQ7ppWNQ4sMUVfm7A9smFN3ow1aX4Aw/
 tlvz3CjRZNpOQJfnwUlnN1HNBeE1hyUyIR0EKCTamcn54DwUVSnkuF2QA6WZR/ktiR+x
 kHmg==
X-Gm-Message-State: AOAM530Uslur5E3omBn336yuN8krFvTgG/KwPSLYJT4rmS+FZYKr8aE+
 Zi2xztymPmP5Ckjeiz2+nmvtG5/go/2xoBDg
X-Google-Smtp-Source: ABdhPJw4gXYqy583VI6CGvVJfLyOfsByKyXlBbza+dyYyC5ApRWjpBZCtEODLtt59+/ES2G6ddhfaQ==
X-Received: by 2002:a17:906:7945:b0:6e0:19:5f7c with SMTP id
 l5-20020a170906794500b006e000195f7cmr8956964ejo.458.1649256366005; 
 Wed, 06 Apr 2022 07:46:06 -0700 (PDT)
Received: from [192.168.0.185] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 lb4-20020a170907784400b006e0d13f65e5sm6606684ejc.167.2022.04.06.07.46.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 07:46:05 -0700 (PDT)
Message-ID: <e7face88-5069-c560-ad2b-a0a658fb8cef@linaro.org>
Date: Wed, 6 Apr 2022 16:46:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] dt-bindings: display: mediatek: Correct disp_aal
 binding for MT8192
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, p.zabel@pengutronix.de, airlied@linux.ie,
 yongqiang.niu@mediatek.com, jason-jh.lin@mediatek.com,
 nancy.lin@mediatek.com, allen-kh.cheng@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220406094654.29722-1-rex-bc.chen@mediatek.com>
 <20220406094654.29722-4-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220406094654.29722-4-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_074608_509274_908DB1AC 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 06/04/2022 11:46, Rex-BC Chen wrote:
> The driver data for MT8192 is the same with MT8183. Therefore, we
> correct it.

Driver data is Linux implementation specific so does not really matter
for bindings. Probably you want to say here that devices are fully
compatible? If so, please rephrase it. Also remove the wording "correct
it" in subject and here because there is no mistake here (at least you
did not describe it) and otherwise AUTOSEL might pick it up...

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
