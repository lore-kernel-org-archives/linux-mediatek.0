Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D577EC02180
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2025 12:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFKwmVwiS7IFaxPoXvsho9KfAcIhxJ1ZRpPv8inn8w8=; b=DeVSF0csVwCCSfie+V4tHY38Rq
	sx+4JJ8sXCDMExkUi3PLZpxKhTWRvCjwcOsGr6CbUZWKGA/5yRGM9wxX/mhvE4DM7MC2cVUBqnOeC
	lIu4pKqirJYq3PW9nv9OM7iMjfnR5OkWoQOZ8qJ3YOJ71SMjklb7rAbuWvgKlePAQ88OOyVmy3N3t
	yJnEEsyU6vH06lrSRA+866R7tcAbrE2fPzJ/GY1gd16q5CmQVgWiaZugksX8mAKuppiDlGmjGv3OF
	nF7TuyK8f6ITQ5MQBZX6bLRWEHMY4cBnYzlUEOmovYIjoR+BhDmOnD1OjcGVd0PFzkV8Nl3OyWEkj
	AvjkQ0Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY2Hd-0000000BoQy-4AYA;
	Wed, 15 Jan 2025 12:14:05 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY2G8-0000000BoBT-3kB7
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jan 2025 12:12:35 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3862ca8e0bbso5069134f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jan 2025 04:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736943151; x=1737547951; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cFKwmVwiS7IFaxPoXvsho9KfAcIhxJ1ZRpPv8inn8w8=;
        b=g/9CcHD83KbzonczWCpRB4i4AWH8MqF8SrXFmfaSwKG13CoE4Otz1FuDGtifVlMd7K
         hk7QAXQg3mH7ObP0Z3bk0HjyJH0k3yNyLUU6C73a46/8U1VaNCsVQkVbLqvnWotTAKjR
         0SnvsHukJPoscEFyeHJ7X8vTWbFI+kRkEbZ/ytfp6AbhSuMDkztUzcPGAsQ8dJt4rDi/
         Aq9ME29DHushH37n1nDAjPQfLSHUEuxCSgP3PselU+5CU6pWf/4bLMyLr5ybVzXNCyMI
         aXpafcsefttGYRgWLfdar6nml6utUWABmfl+9cyVsHsuQTNLe+o+TuM6tkpx4TzuzEMZ
         qexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736943151; x=1737547951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cFKwmVwiS7IFaxPoXvsho9KfAcIhxJ1ZRpPv8inn8w8=;
        b=rlUyQUEuepJPQa1jr4B6/2lvvebyGohh5C/kIEsUhPqxQ6DbCLJJwap9JnZVd34bzd
         8VDOiBMDQuAaoLFW+612wMZTGIpiN50JL+ZI7uQrMHCT3ZkJkGREcj9v4R6IJEP9D67J
         KuVGOnDjn7/+a2LutJPut8JdzfBLqQ1JX2+Myea0y/DvD+RGSIj3Gl7YOOyEqBbD+y1T
         R1tVDBb08MzdqC4h4mZw1dedSWF2RpeoBYKHidmAGQZp2So0phWh064eG+hmxfu8ruok
         a/PoZWYvRlbW+LlRjxJwo78rYrL58YlN/sLJT0UJi6Pqs4axVI7Uo+vvog1O8kErar3r
         37lg==
X-Forwarded-Encrypted: i=1; AJvYcCU8dtO1p+ja5t5NxTKWZ19a60kRMPlL9PS/CF4R/58+Pz/+f8WeSW+97kf4DQugV7AbcqBpDHsjDdXXCEMXlA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEsQXGGsywCj9Cp9qyfxlUuR8wvFklYLq/HmNlp3VRU+/TsOcI
	NOHlzlCjD0VFlokImAmqwFvJ1u2Vdc1LHP71q08+6DI9IBC9xqmVRNZz5Gp5ZdY=
X-Gm-Gg: ASbGncsGGY3g6yEOb8vmzzLBx9eWE6o7P9ydsKmUtQFQ9ZJsI/+nXQUWdaakzeXVwV4
	HEDvM342iC0z5KvxxVRriC8/E4FtEiEqJeEm6FOZt9H9zFnF4owApvtGqTfB56uCxAQLIEdgZOz
	X2hsrgpQi709TczbgRddEGCqc5eWg13+/Ru6B59ZpiqbyIH6Oam2D3F9j4SEf+gKCf6U6fsHtK6
	Idexof/MVH1S/u1KtrLlU7UwpDPk35z8ujyunHBrq+YPjW+dat3GM3GsXTyCXn3w68D7SMS2Glm
	7Vq7u+Y5gdEcGJxejXbooaaVIpX5
X-Google-Smtp-Source: AGHT+IEnq6vo1E5LSI2Qrhm/y3n3Xe++W2QNQ6RQqz61y+rXMn7THrldWxmRVHgfkDHSnoXO9oEzlg==
X-Received: by 2002:a05:6000:4802:b0:385:e877:c037 with SMTP id ffacd0b85a97d-38a87338d79mr24645826f8f.42.1736943150788;
        Wed, 15 Jan 2025 04:12:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:cf13:bc18:6c34:e11a? ([2a01:e0a:5ee:79d0:cf13:bc18:6c34:e11a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1c01sm17722217f8f.97.2025.01.15.04.12.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 04:12:30 -0800 (PST)
Message-ID: <fda131d9-50bf-4049-9e6a-f9cea61846c9@baylibre.com>
Date: Wed, 15 Jan 2025 13:12:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: add mmc2 support for mt8365-evk
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 macpaul.Lin@mediatek.com
Cc: vsatoes@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20250109-mmc2-support-v1-1-9b9d1b1ae35d@baylibre.com>
 <91ac34bf-e184-486d-9af7-f9ddaf8f26ed@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <91ac34bf-e184-486d-9af7-f9ddaf8f26ed@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_041233_063115_D89E0D48 
X-CRM114-Status: UNSURE (   8.64  )
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



On 14/01/2025 11:38, AngeloGioacchino Del Regno wrote:
>> +&mmc2 {
>> +    assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL>;
>> +    assigned-clocks = <&topckgen CLK_TOP_MSDC50_2_SEL>;
>> +    bus-width = <4>;
>> +    cap-sd-highspeed;
>> +    cap-sdio-irq;
>> +    hs400-ds-delay = <0x12012>;
>> +    keep-power-in-suspend;
> 
> Why keep-power-in-suspend?

This slot is mainly used for WiFi / BT / GPS chip, which need to keep powered on.
I guess this is to avoid to do full re-init, re-load firmware, lose context, wake-up from it...
TBH, I didn't work on it, all I know is MTK need it.

-- 
Regards,
Alexandre

