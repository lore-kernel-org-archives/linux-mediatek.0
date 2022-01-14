Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BA0C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 12:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cebNxigbEIhSIJUb6mDTZVXy/Rn1J0T2cjMQXVT+ews=; b=H3TY+jXmWBZPSn
	1oqjecsKB6YvZtznZ+aqW2nW3PHu9xuNOhB+bgcyTbou9vKxwawnIhz7cJoYvnoL0lc7P1O/Su+SR
	5w+wovZq0IId0baprHFJvIjmU7Gyre4a1lY9tZ0NtLg7kvARHE0aA+Crey0JzLVn7dKhcNz1eoH/L
	effgs223brwsR0pzopZ+9mabKF3uWOnn3tONk43EYwHTyHsYjICBk5JAt+q1NbOxUSWLtQsIyXzTe
	hOHmtl3xKQi27HI+PrKI0kxCItbqqSPf8vrs2eaXUChHPezi8h/ntkzKqipcBK7tBZOBgJg/OzLZ8
	dhs49mDrt+QsIL2YWypA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8M84-00988k-43; Fri, 14 Jan 2022 12:56:28 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8M7r-00985p-5y; Fri, 14 Jan 2022 12:56:16 +0000
Received: by mail-wr1-x433.google.com with SMTP id x4so15466282wru.7;
 Fri, 14 Jan 2022 04:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=d3ibwPAPVt4HA/SbrQ1xEvUJPH+rbcSyYMnJxKURgvY=;
 b=fb5npDbIVbXCAmGa3aSg1k8zmuohBbb7KypbIegherNH93fveoZq8HcfrgdsuNvXz8
 CDw9aC3OJl/FCnBGvwgMykySe9jqF3hjX6uVUTPOGTork74gr4LptbeOXg08D4FANiN4
 m8uPEJXzq0ezfHyXFI8iPMWd6idfe7hf+JY5QpD66LC7d0MXsfE9Ghd81R/poIn9XgZa
 aZ+6o7lhptWt3VmwrOFdjmES0DdKYFnKYEFl7Y2Pbve5Qp/2x9SlYO4Y1AM7Ejq6Mgvg
 hzG7CLkkWKgGMP6j+arp8RUt0N9V2cVDdsz3waJaB/vNQgiuNQ/ZWDdROzQuPi0Ykuxa
 0+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d3ibwPAPVt4HA/SbrQ1xEvUJPH+rbcSyYMnJxKURgvY=;
 b=g6UhX5VjXoNzSfJOVsHGcM3F2EzGUe/Z5HYdnuZJhWjBsCSUmV4S8+KxYTma/n3lNT
 xfmhZiBfshSUc+kDCJRNeOIO/9Macaf6EPyG4mJAe2PtX5MCIcgv55QWXRWDPw6/oAQk
 n8IcaPzErEKZqs6q397HSiXPCkQrBPJ7U/VktZizAxu1KTN5VqqTRsUw0FYjObEzenM1
 o6gtiwUG/HG0gXNIAPdfMkEcWK3TsyZ6A0VYTtSeipJrixrgyxRdtnJbNtXY9kAO621I
 o2bO1F9A6Z7HQDYvylgMG4kXvQNolf9WvwURfArwe9prbZcKJS+U5FFbnwub7jBksVoX
 dXCw==
X-Gm-Message-State: AOAM533CR6s2eIzW1khXuzGc/hVrge0JiW3O6/dt3UXWDfuzDWGqqTRE
 buB5H6opI9K39r4odn2UL3sUX1yfIro=
X-Google-Smtp-Source: ABdhPJxo8QEjs5Q0X+ZWAwcHSYac8AQTrcqIp/pFDeME41NkNSzQHoy2PCkOg4lwKdONf8ZqSIFXjA==
X-Received: by 2002:a5d:6dd1:: with SMTP id d17mr8741857wrz.520.1642164973553; 
 Fri, 14 Jan 2022 04:56:13 -0800 (PST)
Received: from [192.168.0.22] ([37.223.145.74])
 by smtp.gmail.com with ESMTPSA id g15sm5358083wrm.2.2022.01.14.04.56.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 04:56:13 -0800 (PST)
Message-ID: <68895a40-559b-13ce-d433-f9b32c648323@gmail.com>
Date: Fri, 14 Jan 2022 13:56:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4] dt-bindings: dsp: mediatek: add mt8195 dsp document
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, YC Hung <yc.hung@mediatek.com>
Cc: robh+dt@kernel.org, broonie@kernel.org, daniel.baluta@nxp.com,
 trevor.wu@mediatek.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, cezary.rojewski@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, allen-kh.cheng@mediatek.com
References: <20220106064847.15588-1-yc.hung@mediatek.com>
 <Yd4yNkeGlzdULNlv@robh.at.kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <Yd4yNkeGlzdULNlv@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_045615_265008_7FBF23C5 
X-CRM114-Status: GOOD (  10.80  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 12/01/2022 02:43, Rob Herring wrote:
> On Thu, 06 Jan 2022 14:48:48 +0800, YC Hung wrote:
>> From: "YC Hung" <yc.hung@mediatek.com>
>>
>> This patch adds mt8195 dsp document. The dsp is used for Sound Open
>> Firmware driver node. It includes registers,  clocks, memory regions,
>> and mailbox for dsp.
>>
>> Signed-off-by: yc.hung <yc.hung@mediatek.com>
>> ---
>> Changes since v3:
>>    Fix patch v3 error : v3 only provide difference between v3 and v2.
>>
>> Changes since v2:
>>    Remove useless watchdog interrupt.
>>    Add commit message more detail description.
>>
>> Changes since v1:
>>    Rename yaml file name as mediatek,mt8195-dsp.yaml
>>    Refine descriptions for mailbox, memory-region and drop unused labels
>>    in examples.
>> ---
>>   .../bindings/dsp/mediatek,mt8195-dsp.yaml     | 105 ++++++++++++++++++
>>   1 file changed, 105 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
>>
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 

Rob, it seems we don't have a maintainer for this bindings. Shall I as MediaTek 
SoC maintainer take them through my branch?

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
