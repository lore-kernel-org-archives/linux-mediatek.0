Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B1EC38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 11:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7T2E7YGZUxnQitNuZE0hLv5dl+y4GpbNZv5kH0Kb700=; b=AhwaSndWCSG7Mojy9CnuXrm8tp
	lOXFJ7mxByvwJFD5x8YFYwsJC8HO7ypyXdFoL2yKmWmaZkRPIKWcOEdIHCvC7XQ3ldOp6mDmZwOqT
	tfmCJbmo4K2Fd8N/1M9F6gQrwJUwFQ12lXL5lHAjwsgzBXqF8u8ZT8DHnVSqybO3yB50PDrYwO9fK
	lPTlaGXU9vgcwObboDLsZCyxeLEilEyBYlRuf+1blTPEXTkHTCGkIxWhneFS0PNzC1T+XkvBgGskk
	rP360ugZVg6J9UH4SRlg5UARPm8XgTSwlBD9h8gbcQFu4esDpkKsdGiWcIiqB1ukmO45+P9ouvzVi
	4/iVnTmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMpEX-007n2V-Do; Tue, 31 Jan 2023 11:55:29 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMpEL-007myJ-RU; Tue, 31 Jan 2023 11:55:19 +0000
Received: by mail-wm1-x32f.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso7570085wms.4;
        Tue, 31 Jan 2023 03:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7T2E7YGZUxnQitNuZE0hLv5dl+y4GpbNZv5kH0Kb700=;
        b=QCtUdV+nxVMdpJAnGPdQSvt5DtG9XwOeCRtncRoCxjAXUus2HMQc1Ao+U8Vnzo2xJZ
         TfQIEx5H2H0Aga7AXpeStNtqBRad+adVwfggxMC1VO9I8saFhOhw8Gr9R97ijwYK8UFz
         1pFUd+WzT66AAlg+M2/xQJh9mHu1TwJGhqR3/TVDO5wOV27DC2mF9BswtlUAzzD9x4aF
         oeyCM2CctTa4BGNAUD0+TZms15Suu/QtaBqB1NgaZGBUQt4oii63RG894XaJXcjU1042
         sibft0fM0CHnHPhHXK6HH282KEPa8Dx6zjDvoa8DLURhUe6rgNR4dh4odk8yQmIu0Vad
         4NCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7T2E7YGZUxnQitNuZE0hLv5dl+y4GpbNZv5kH0Kb700=;
        b=qOUhgFDk9E0NBoqityZetnvlz1ETw8DaljQWdpFATTeQPAhn4Y8g8ZTAl+2HciZ6jS
         SUN9N+cX3ECsDKl6ybi3p0hJN9KasP/eZd30zvMbgfuYr1pnxQXlYIRRCXF5mMYW3pv9
         7rJpnie34bj7FUSFiZ7Lk1Ycgmg2sY7kmebTkAzNqIA4wRNsRRZZNwdVoJ6F/tvNWYCW
         rPqwwmJ7GkfnO9ynLeWvJxRVh07IEOsbB42382nIIobwY9LjwI95Wkrg7PUtvylVpFKJ
         U1Fk2WjrPxmSPrqlVgGR4gwt1GRmd5ZnIMBgEd5NdxACKQemzQTtl/S0TjN6o1ZVd3Fd
         IW0A==
X-Gm-Message-State: AFqh2kps0oxdipvamxszJjSXqKgz4nWJGXgc/+GZyd5adMCh+SUZuo7z
	3Nc+pVOgsCUrBSWOvrX10zk=
X-Google-Smtp-Source: AMrXdXvQTDWtQ2BfIU2sS6xGo/Q/5VUOHWqRtF42ZHbBXU1Lw+xJrn6/r0acAJZllhbPgT+JbH/Uww==
X-Received: by 2002:a05:600c:a4c:b0:3dc:d5b:5f6a with SMTP id c12-20020a05600c0a4c00b003dc0d5b5f6amr28617250wmq.30.1675166116306;
        Tue, 31 Jan 2023 03:55:16 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c468c00b003dc22ee5a2bsm17949467wmo.39.2023.01.31.03.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 03:55:15 -0800 (PST)
Message-ID: <c78e2725-0be7-caa8-40db-2f355cc2cdec@gmail.com>
Date: Tue, 31 Jan 2023 12:55:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 4/5] arm: dts: mt7623: mux phy0 on Bananapi BPI-R2
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 frank-w@public-files.de, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 erkin.bozoglu@xeront.com, Sean Wang <sean.wang@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>
References: <20230120205318.519493-1-arinc.unal@arinc9.com>
 <20230120205318.519493-5-arinc.unal@arinc9.com>
 <9A7BD95A-F026-4EAB-96E1-12B1B0C6AAA4@public-files.de>
 <cf7d3247-4d21-98f0-819b-7653153ee4c0@arinc9.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <cf7d3247-4d21-98f0-819b-7653153ee4c0@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_035517_908042_24B1D157 
X-CRM114-Status: GOOD (  11.56  )
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



On 25/01/2023 17:54, Arınç ÜNAL wrote:
> On 25.01.2023 19:41, Frank Wunderlich wrote:
>> Am 20. Januar 2023 21:53:17 MEZ schrieb "Arınç ÜNAL" <arinc.unal@arinc9.com>:
>>
>>>         switch@1f {
>>>             compatible = "mediatek,mt7530";
>>>             reg = <0x1f>;
>>> @@ -199,11 +208,6 @@ ports {
>>>                 #address-cells = <1>;
>>>                 #size-cells = <0>;
>>>
>>> -                port@0 {
>>> -                    reg = <0>;
>>> -                    label = "wan";
>>> -                };
>>> -
>>
>> This will break existing userspace setups using wan as interface name.
> 
> Yup. The OS being used will have to either rename the interface or adapt to the 
> new name, eth1.
> 

In that case please explain in the commit message why this is needed. We are 
trying really hard to not break userspace by a device-tree update.

Regards,
Matthias

