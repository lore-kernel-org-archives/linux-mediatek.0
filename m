Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E24C54E67
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Mar 2024 10:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4mj69BhZ6eDKMMFel2KntNw9xpBjcRnl7KL1gHZ/N4=; b=w5SxtceevFk28+rT8LZZSicg5W
	7NFBS2tEdRZR72BYqrrotKlGwh/PGyplRocnMBEFSDX2W67Z12hEyVbzGvTt9GBOhaNIj9nbULq96
	Z1oBgkred6HEA8RM+LjayTCtHQvC/CmaZiYpIwOKHSVrKazRNuZ6vP0XmBRXLfFyT15Ij69dAX3Hh
	OUkvFtQ9HGfXnj79yixotUOi0lhLWHEAEwhPiNboT9qXLQGlE7k2pBXftSikmoJQ2CV0EWt2pFjXZ
	delwDRwj3e3iqSOzXn4jY94/pa9Oompe/xiDuSGhjfvm80nLZRyw8usOvNCGrTfLzOZG4XruIEBRQ
	cxNQdoaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpQls-00000008SaU-2X73;
	Wed, 27 Mar 2024 10:44:40 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpQlp-00000008SYp-0WwS
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Mar 2024 10:44:38 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a470d7f77eeso831881466b.3
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Mar 2024 03:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711536274; x=1712141074; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u4mj69BhZ6eDKMMFel2KntNw9xpBjcRnl7KL1gHZ/N4=;
        b=KH8QwUBAgNOfXNVWzglb8DTMv7JXjXYUeQ5+zDG1Gk8iDduUGjp9sz8l5nMP/cohD2
         col8H76aEugtKWO6tAIuSXOHr6EIN5SqikgYsMNp3u1KKR5VJS8oQt1o3gnOmS54LNQB
         NR2t2FzH9Lf2RlK+eMzTjlYa/BEwQDnNtuunuLKeNH5OijLC/bvoO6h1qyCWw/P1s4QI
         A86kgWM1RLKPU6bG57APqPEz3abak6PS1apFiGpw7K7005odC84IiZK8DUsyiEr+81ei
         Rlfc9bgMlFia3lSn71Trgbx8N7jSN4cXgME0dczoIqhb8Ww28H8tQVV3zhNPrEi/bOjr
         2nhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711536274; x=1712141074;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4mj69BhZ6eDKMMFel2KntNw9xpBjcRnl7KL1gHZ/N4=;
        b=QDZr/AXMYaoCB8yaTx+F/r7mi98AA4nM+l3sJt4rKAd15G43P1UsMsSMw9vOPI0Odc
         GDts8eA7KEClt/4/wuYVt3GEEZqs08OsXbI0tmX6jEK+/FkMWPixHgFimOG5pBpH5Hn3
         rdDsV8/PFZtgUuTGEF5Bd6qeHPOZ0AxSUfoFSGONiqgw0Kn9ZtLZtJDqhARx4+l3ZKpI
         keoiBiaWQAHBLj8Gsice230hRtQrCoWb39JnI2a+4/YE6JE27Wy522k4rMkMznK2yyUj
         E1xsgKP8ZwetnStV2PfICWwTl0AwPo44FofWeUfdk5OllfC9KAoOxzoSF2LdJc2khKvw
         HdrA==
X-Forwarded-Encrypted: i=1; AJvYcCXgyQf3Ie3tlPUz1o9NDWxO0dHg37M2LqmdEhpf97+paD/3PBJPZz3CwHM++0C1zIJW2KbLH4i+oQB/kMVJqiYYErsBhybm4AHEAs7XxkL1wBPE
X-Gm-Message-State: AOJu0YyP/RyD/DZfSgoYdVK08FTPiyfjy+eXEs0D9gFkGZ4Mh77YGyBB
	GG39LnlF4j7A4Amymo6cNgT9FdGGcOvigvxCwPfHC1QhaVNk4NsL7VDDXHeKPKc=
X-Google-Smtp-Source: AGHT+IFO6JFfkspg8ti2j0e7ngpIEz2rM8zLI5A+dEv9D5sMekXe68fKhmmzh+rHvcFCESIfyKES5w==
X-Received: by 2002:a17:906:897:b0:a47:8767:671a with SMTP id n23-20020a170906089700b00a478767671amr723163eje.21.1711536274451;
        Wed, 27 Mar 2024 03:44:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id ws9-20020a170907704900b00a46caa13e67sm5262660ejb.105.2024.03.27.03.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 03:44:33 -0700 (PDT)
Message-ID: <18cbef32-959f-4016-ae8e-d0dc6da62477@linaro.org>
Date: Wed, 27 Mar 2024 11:44:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v6 0/5] spmi: pmic-arb: Add support for multiple
 buses
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
References: <20240326-spmi-multi-master-support-v6-0-1c87d8306c5b@linaro.org>
 <d213f262-ba0e-4cf8-af0e-66745ffea429@linaro.org>
 <ZgP209t7IhdhcZIr@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZgP209t7IhdhcZIr@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_034437_225925_3C33AD20 
X-CRM114-Status: GOOD (  11.49  )
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

On 27/03/2024 11:37, Abel Vesa wrote:
> On 24-03-27 10:23:51, Krzysztof Kozlowski wrote:
>> On 26/03/2024 17:28, Abel Vesa wrote:
>>> This RFC prepares for and adds support for 2 buses, which is supported
>>> in HW starting with version 7. Until now, none of the currently
>>> supported platforms in upstream have used the second bus. The X1E80100
>>> platform, on the other hand, needs the second bus for the USB2.0 to work
>>> as there are 3 SMB2360 PMICs which provide eUSB2 repeaters and they are
>>> all found on the second bus.
>>>
>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>> ---
>>> Changes in v6:
>>> - Changed the compatible to platform specific (X1E80100) along with the
>>>   schema. Fixed the spmi buses unit addresses and added the empty ranges
>>
>> Why resending after few days? And why without reviews?
>>
> 
> If you are referring to the initial v6 patchset, it was sent more than a
> month ago.
> 
> https://lore.kernel.org/all/20240222-spmi-multi-master-support-v6-0-bc34ea9561da@linaro.org/

Ykes, you are right.

Best regards,
Krzysztof


