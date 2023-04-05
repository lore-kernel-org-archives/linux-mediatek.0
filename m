Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C17EC7619A
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 13:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DNwzqllpOhIXJDrmKgEGVXZ9A1+oCPDYJpWJknDn8gw=; b=guj9NilD6pU5OIm7WninsDiO9j
	iaAXbrZ/c41ifS3epGGZqGJNEYyKFHBGtzgrFhUZQuJoDc+MpKhKUrApuM7TphYJBcG75MLIP6HYt
	iyt+SjTuZ9BFSMG7Ms8CSplvNpA7tVIcJEfkXEsUGLVm8FCfw/r8MNRd4vC42JZ2zzMHCwTbnDPD2
	RjiHST5LXi24eIQgWtCAxd1G+WwwZZV2d0iIUbNm5B9XSpJNCy6i49hHRWDLxol1OCAYi7cBjQyxy
	/nEeH9dW6VCJjo5bwMgeb0cH8gF4/fPLqcwaNimSEbZVnd2iqLA51Dlxl/6TtQNZzGYgjBobhsbzs
	8cqL659g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk3bK-004aMj-12;
	Wed, 05 Apr 2023 13:55:02 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk3bI-004aKr-0V
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Apr 2023 13:55:01 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-942e6555947so46263866b.2
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Apr 2023 06:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680702897;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DNwzqllpOhIXJDrmKgEGVXZ9A1+oCPDYJpWJknDn8gw=;
        b=D5v3TP5V2tZMZbEaoAxg/HlME9pRWlPhc5t26ZANYrhu67A2c738rEFUYvZGbQpWHf
         HH1jgThtqjaU7H79/uMTiWUtin5uLai0lqR0dOy86PeCgugjB5ybE8pAP+fucmzPeMB2
         4Fc+3XD7pif4zTmxVxnBPLIQAmjsGKiXStAciBPbC5giiC8Hgakq+wsOwMVsJQ0UEaSo
         c32ADPZidtH0er7rmu9GL3cOFd+zozPf1LHOq7yMIfpl6Lc1vbe79s9jHs+Om3Hjvik4
         2USheGmcD0nKU7G4W5COQ6sX/VsB9J0ZpxYYXLVxA/j4lgW6ZQoOln8Umt8U2UE55sNR
         pZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680702897;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DNwzqllpOhIXJDrmKgEGVXZ9A1+oCPDYJpWJknDn8gw=;
        b=Cb1aOczIZhi5ngNKCgm2Hn4MkmTx3lZYNR73SOCm/iHfXS4P+a3ztW0j0cPk7O1tKx
         2kLtdJSryvvz/AOWBIF6x+eNbhsV2twnouvH6Ca9E45VuZAR05CqDoWPYg5fOhiJ8QpD
         Ny7jImp7MLDg+rAKwhk0OND+bq/k/8aW4w8gLnJ3aAK00lxNOEWKJbQD1BmoSkTch5Vb
         5F2WvFXs5XuZKe5Atocp3HJ9Y8mD3We8jfWzgIuQBoA0TpXM+mihaJTbXhdcX272LcSg
         NNsnf3HpADvv4r95TmZEFzug4D+SvD1IMouP8Psykda5Gjorw3PkjUNsVC9LzdikHjEW
         Xjrw==
X-Gm-Message-State: AAQBX9chAVocCu//cKbe3LSszXBMkitSTfFI/5qi0WhUVbnZSihpUfgD
	GoghLiInbf3323GIASaTiFfm1w==
X-Google-Smtp-Source: AKy350ZJkw4cGGvlpzYnTrs6V+agNr6QqkmZAlOlP84F9g3Cgs6g5fHR3ftYghWJukJy6rU+ITl7xg==
X-Received: by 2002:a05:6402:496:b0:502:3ff4:4d76 with SMTP id k22-20020a056402049600b005023ff44d76mr1858152edv.27.1680702897006;
        Wed, 05 Apr 2023 06:54:57 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:3f:6b2:54cd:498e? ([2a02:810d:15c0:828:3f:6b2:54cd:498e])
        by smtp.gmail.com with ESMTPSA id e14-20020a50d4ce000000b004fadc041e13sm437798edj.42.2023.04.05.06.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 06:54:56 -0700 (PDT)
Message-ID: <e38658be-1a2a-bccb-3f30-18f1b031f71d@linaro.org>
Date: Wed, 5 Apr 2023 15:54:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 10/10] memory: mtk-smi: mt8365: Add SMI Support
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
 <20230207-iommu-support-v2-10-60d5fa00e4e5@baylibre.com>
 <9847bc48-c96c-3599-e876-bcf9ebf1522e@linaro.org>
 <CAFGrd9pBdaHLGUZHkaz2_XKafyX=dxu9UckQxrphg52EG=A1SQ@mail.gmail.com>
 <8fc3dd22-79df-32cb-c219-896eda8fa986@linaro.org>
 <fd24877a-5fae-5434-dc56-61ab35ccd820@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <fd24877a-5fae-5434-dc56-61ab35ccd820@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_065500_196441_682D9A74 
X-CRM114-Status: GOOD (  10.49  )
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

On 05/04/2023 15:06, Alexandre Mergnat wrote:
> 
> On 05/04/2023 13:45, Krzysztof Kozlowski wrote:
>> On 05/04/2023 11:53, Alexandre Mergnat wrote:
>>> Ok, I will move the driver patch before the DTS patches in the next version.
>>>
>> Or do not send it together at all, which might solve your dependency
>> problem. According to your cover letter I cannot take the memory
>> controller bits, so I am waiting for dependencies to hit the mainline.
>> Alternatively I will need pull request with stable tag.
>>
> Ok, I prefer send the driver patch in another serie. That will solve the 
> dependency with the DTS a least.

What dependency? Why do you have dependencies between drivers and DTS?
That's a no-go.

Best regards,
Krzysztof


