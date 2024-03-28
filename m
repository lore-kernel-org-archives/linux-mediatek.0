Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B676C54E64
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 09:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKXwHmc4cXcL+3XlaHJcygoE0sPqn2G65Y8JY5URJDs=; b=1M0k9PuFKp8/3X+RXgMbjCHkNe
	hPZ1lSrFc7GJdLBpp4nqiOZMK6r+0hRfHsdva97Dt8TZ4pMxZ7shR7nb0DKhMo88m3srME9hcRFnp
	HkqrycuO/ScMsUgWfaZtZAWgB6XGpEpw5IxVlDBIrsxZxeeFPPhudy9HkAudmnNzPODQ13Kl5u7vD
	zpH6MX7WdyZvnGvgf5MzMVwO2o4otqmhiFb44b/rki2PAxaVRyV5zOg1J+0LcbliOivys9PJFuLZR
	CCogrjYLJPI+9rYejX3UxVTRlP8DPAMPU4pohc4ToaluESwIsrE2EkyiZw57sPZtVcTlNO6v71Exj
	Up9xkyhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rplkA-0000000DEeX-1Cz4;
	Thu, 28 Mar 2024 09:08:18 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rplk1-0000000DEVq-3pL8
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Mar 2024 09:08:15 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2d46dd8b0b8so7786681fa.2
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Mar 2024 02:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711616873; x=1712221673; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yKXwHmc4cXcL+3XlaHJcygoE0sPqn2G65Y8JY5URJDs=;
        b=EUigLkvjxDd/Xq1caqKl5X3xn3zGUeL9RyXn42bemNPDxMdob22MWxhWYII9pWrnWl
         mQga+DmoEudLaEEAO1O+CuOjdFAGJmzBBZXvGJvU5rUWSSnnqVgHfU2Ch/dHvi5UyW5W
         a0NA78ayS7jhHU4bzwGMSYQJOztn0F7w5a/L4wEbtsGXM8bB7Nb+ccT/Jt/ZoUcorOcH
         cx8ff6XgBm3nAZ638sIZHkGual94ccB033bfpWq6bX01atqN6qN9uRFlKnMhsaReiBow
         evbQsuFA3EjK8Bzsg0YTpZ4SBujRK64oakZz3r4XVcg5BkVvipPmwc4f5wmbRfoVNguE
         0Jeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711616873; x=1712221673;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yKXwHmc4cXcL+3XlaHJcygoE0sPqn2G65Y8JY5URJDs=;
        b=cRIDIZ/riRnn5MJOjXE+SqBtwKf1+HYDYKt4De87mBGtlceJh13CYTvj3EzV8CaCo6
         mBvWItzB9iiu+1x2vYF9CHNKLugm0mOrt5U33268xYB24RatHu1accp45YR7T4OYGHqS
         FSjfa7zmiyWfk2uRvkoYI072hPdvieWehROpyPiVI9xIWnnt5O6XEHgHs5UdL7lX+JaE
         yMJ5zr3JGJB5o6dtW8WpX/5aWR5kP32kU9nfY2TArkghXijpdLtL8aWIN5nKVqtMjVlt
         jooVuEfoXSLyvE7cCTFBka6ChigrK1DbI1zvMCpB1NQkJcb5hnwDUfLcqBDoyqh1hUgk
         WRIg==
X-Forwarded-Encrypted: i=1; AJvYcCUtLb0LcrVRuLX0kut/VheOyuf/fFCiOJ+lLW4wSqjCG3rsBDx+SizGMGtEkQLeLfV0bisbha1/li5l6cRdIR9iURyJcx6q4I+2nDYDAwg/FxlN
X-Gm-Message-State: AOJu0YzJtf50hm4g326cVKM4/ePx/g98jL806znlPW1OMddQmJ1I10Yb
	uy0RvJjjfSghqK7+s0BM8ZSTc8lC38lkWteceH6XfoJaeW3iQr//sKFROKvZ/Tg=
X-Google-Smtp-Source: AGHT+IFan8kG+r3iVU6A8LgXX5xHcdF5eGLJCwQMzUJRaJjaVzQi8QQwkp8heq/oAlpdTtpsfmu/wg==
X-Received: by 2002:a2e:a40e:0:b0:2d6:ec7b:b69b with SMTP id p14-20020a2ea40e000000b002d6ec7bb69bmr1228173ljn.7.1711616873130;
        Thu, 28 Mar 2024 02:07:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:6306:1c7a:72c2:892a? ([2a01:e0a:982:cbb0:6306:1c7a:72c2:892a])
        by smtp.gmail.com with ESMTPSA id hg6-20020a05600c538600b004148ff6ef54sm1622433wmb.29.2024.03.28.02.07.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 02:07:52 -0700 (PDT)
Message-ID: <ab749f2d-269f-40bb-b6ab-b19fd7243eed@linaro.org>
Date: Thu, 28 Mar 2024 10:07:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RESEND v6 0/5] spmi: pmic-arb: Add support for multiple
 buses
To: Abel Vesa <abel.vesa@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
References: <20240326-spmi-multi-master-support-v6-0-1c87d8306c5b@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240326-spmi-multi-master-support-v6-0-1c87d8306c5b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_020809_991332_21B2EADE 
X-CRM114-Status: GOOD (  22.36  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Abel,

On 26/03/2024 17:28, Abel Vesa wrote:
> This RFC prepares for and adds support for 2 buses, which is supported
> in HW starting with version 7. Until now, none of the currently
> supported platforms in upstream have used the second bus. The X1E80100
> platform, on the other hand, needs the second bus for the USB2.0 to work
> as there are 3 SMB2360 PMICs which provide eUSB2 repeaters and they are
> all found on the second bus.

@Dmitry, @Konrad, @Bjorn, could you apply those patches and test an devices
you have to make sure there's no regression ?

> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Changes in v6:
> - Changed the compatible to platform specific (X1E80100) along with the
>    schema. Fixed the spmi buses unit addresses and added the empty ranges
>    property. Added missing properties to the spmi buses and the
>    "unevaluatedProperties: false".
> - Deprecated the "qcom,bus-id" in the legacy schema.
> - Changed the driver to check for legacy compatible first
> - Link to v5: https://lore.kernel.org/r/20240221-spmi-multi-master-support-v5-0-3255ca413a0b@linaro.org
> 
> Changes in v5:
> - Dropped the RFC as there aren't any concerns about the approach anymore
> - Dropped the unused dev and res variables from pmic_arb_get_obsrvr_chnls_v2
> - Link to v4: https://lore.kernel.org/r/20240220-spmi-multi-master-support-v4-0-dc813c878ba8@linaro.org
> 
> Changes in v4:
> - Fixed comment above pmic_arb_init_apid_v7 by dropping the extra "bus" word
> - Swicthed to devm_platform_ioremap_resource_byname for obsrvr and chnls.
>    The core remains with platform_get_resource_byname as we need the core size.
> - Dropped comment from probe related to the need of platform_get_resource_byname
>    as it not true anymore.
> - Dropped the qcom,bus-id optional property.
> - Link to v3: https://lore.kernel.org/r/20240214-spmi-multi-master-support-v3-0-0bae0ef04faf@linaro.org
> 
> Changes in v3:
> - Split the change into 3 separate patches. First 2 patches are moving
>    apid init and core resources into version specific ops. Third one is
>    adding the support for 2 buses and dedicated compatible.
> - Added separate bindings patch
> - Link to v2: https://lore.kernel.org/r/20240213-spmi-multi-master-support-v2-1-b3b102326906@linaro.org
> 
> Changes in v2:
> - Reworked it so that it registers a spmi controller for each bus
>    rather than relying on the generic framework to pass on the bus
>    (master) id.
> - Link to v1: https://lore.kernel.org/r/20240207-spmi-multi-master-support-v1-0-ce57f301c7fd@linaro.org
> 
> ---
> Abel Vesa (5):
>        dt-bindings: spmi: Add X1E80100 SPMI PMIC ARB schema
>        dt-bindings: spmi: Deprecate qcom,bus-id

Forgot to add, but please fix this in a v7:

>        spmi: pmic-arb: Make the APID init a version operation

drivers/spmi/spmi-pmic-arb.c:180: warning: Function parameter or struct member 'core' not described in 'spmi_pmic_arb'
drivers/spmi/spmi-pmic-arb.c:180: warning: Function parameter or struct member 'core_size' not described in 'spmi_pmic_arb'
drivers/spmi/spmi-pmic-arb.c:180: warning: Function parameter or struct member 'mapping_table_valid' not described in 'spmi_pmic_arb'
drivers/spmi/spmi-pmic-arb.c:243: warning: Function parameter or struct member 'pmic_arb' not described in 'pmic_arb_read_data'
drivers/spmi/spmi-pmic-arb.c:257: warning: Function parameter or struct member 'pmic_arb' not described in 'pmic_arb_write_data'

>        spmi: pmic-arb: Make core resources acquiring a version operation

drivers/spmi/spmi-pmic-arb.c:180: warning: Function parameter or struct member 'core' not described in 'spmi_pmic_arb'
drivers/spmi/spmi-pmic-arb.c:180: warning: Function parameter or struct member 'core_size' not described in 'spmi_pmic_arb'
drivers/spmi/spmi-pmic-arb.c:180: warning: Function parameter or struct member 'mapping_table_valid' not described in 'spmi_pmic_arb'
drivers/spmi/spmi-pmic-arb.c:222: warning: Function parameter or struct member 'get_core_resources' not described in 'pmic_arb_ver_ops'
drivers/spmi/spmi-pmic-arb.c:244: warning: Function parameter or struct member 'pmic_arb' not described in 'pmic_arb_read_data'
drivers/spmi/spmi-pmic-arb.c:258: warning: Function parameter or struct member 'pmic_arb' not described in 'pmic_arb_write_data'

>        spmi: pmic-arb: Add multi bus support
> 
>   .../bindings/spmi/qcom,spmi-pmic-arb.yaml          |   1 +
>   .../bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml | 136 +++
>   drivers/spmi/spmi-pmic-arb.c                       | 948 +++++++++++++--------
>   3 files changed, 715 insertions(+), 370 deletions(-)
> ---
> base-commit: 4893c639cc3659cefaa675bf1e59f4e7571afb5c
> change-id: 20240207-spmi-multi-master-support-832a704b779b
> 
> Best regards,

Thanks,
Neil


