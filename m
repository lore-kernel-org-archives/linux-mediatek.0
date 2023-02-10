Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A73BC05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 06:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMd8zrjo8o2xkfWSu/tAGCytSiDkDCaLT/oxKSVCWik=; b=bLgQZOaXnRFz+dXcIgB0uRESmL
	FoXRw54powK+9iHdz/QgQvsV1kPnrw+cpdqkC/b4VCYuY+uTRGI06/N4SSyGY2GQEwhDq8DGNOSSu
	ZvW1rKRn0m5cEiXsXMyiAwp9zVzUY0qUngr4NzrNAuP8P4tUesnRzpsxG/UKamaFsiKCM+oCE0wZW
	IxJpd8x0CE7chK0v2KASUdNAVm8TRCPcqVXjPvlDXSys+YNUquw7yxINHSrzGTN7JLbfFhWwPaIKV
	eUq88E6HBwmjqEtont2BT1zrmj3bAk2uy0TfNxAq3FHuw7xORK8Sh73TNNrfccxraKYGT6ql8kdrw
	TE2GkPaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQN9j-004VIJ-QA; Fri, 10 Feb 2023 06:45:11 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQN9Y-004VEs-Pn
	for linux-mediatek@lists.infradead.org; Fri, 10 Feb 2023 06:45:03 +0000
Received: by mail-wr1-x433.google.com with SMTP id r2so4040816wrv.7
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Feb 2023 22:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QMd8zrjo8o2xkfWSu/tAGCytSiDkDCaLT/oxKSVCWik=;
        b=VHi8pkvLswSSTqhgg6j25ca2gZJkWx0OMQ2WgDithqO21aSOgvkv5d/bwSb6pFNp9w
         jJtt0JHOu36VK/XhOBV9Kll7/wC5C5Alw40AM8/zkFvZQeWLuQf3gxaxxvqZ95TF6i65
         teRnURGdRwSsbF0srlRnmkQCXLb4xFXGRJXXYSmG1mFXJQwQUviIF/EHVAusmpfGojRe
         ePfTTbFSwFgN1rIir0LGruU8Ho2fo8CA2voJkx8Cs0061zwrJVP6CQtpbuGRFM0imaUK
         /5vxJdUDxc6Au2WUF4mPfbpX1EZjdh6ZTdqxBPB5u9DNhFLF15sno/T+WTktBu+AncbK
         WnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QMd8zrjo8o2xkfWSu/tAGCytSiDkDCaLT/oxKSVCWik=;
        b=u4KrAaFaD6zL6w2xgvea7CzHa05TipwVQyfE7cwYxj12by6Dh6Tqey7T5oxaTVDT49
         l1evnt3VxpaLRGjh/Pxgu9dPSqeyZUpss2bLHU1vTdePec8bReRYx+NccCOEvmJTl1D7
         iy4l/W4u3/alXdwVf3hK+l8KH8PsXXeZPa5uiQ5Xrvg3LF8ndTsiLwhW4nVpo8BZN4GG
         LcaaV8JUeXEf/MqtwcLHeLRJzlpG1F+T/qWDtKiPIMY0demTQrT/g6UcGfyuJgbru4p4
         e1YZsh517dL6si9S/zf0vMMD1P7HvQKu8HDtc+0ipdu0cApqwf6PVL/6FWrApn3l8tXr
         nD9Q==
X-Gm-Message-State: AO0yUKWBCEMO4k3VIHMtL9kkvih5K8yl/AxH5fokpXVT9h7DtW88EJ1n
	X2xGj86NXNoU+AyEQ3zAPOYRiA==
X-Google-Smtp-Source: AK7set/ZLHNwvWdizk6P8QdKUHDk0+Dh3idhFbBpHn4LBD1uQR3gkwqJhQJ4PJKV0hvTZbL5Tu7VIg==
X-Received: by 2002:a5d:46c8:0:b0:2c5:4a20:120f with SMTP id g8-20020a5d46c8000000b002c54a20120fmr863924wrs.43.1676011498492;
        Thu, 09 Feb 2023 22:44:58 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id i3-20020adffc03000000b002c53d69a8easm2326411wrr.92.2023.02.09.22.44.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 22:44:58 -0800 (PST)
Message-ID: <b41930f9-89d9-1b12-b024-05fb12700769@linaro.org>
Date: Fri, 10 Feb 2023 07:44:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v14 0/6] Add LVTS Thermal Architecture
To: bchihi@baylibre.com, angelogioacchino.delregno@collabora.com,
 rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
 matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org,
 ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230209105628.50294-1-bchihi@baylibre.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230209105628.50294-1-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_224500_924375_9D4D2A3C 
X-CRM114-Status: GOOD (  18.30  )
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

On 09/02/2023 11:56, bchihi@baylibre.com wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> The LVTS (Low Voltage Thermal Sensor) driver is capable of monitoring
> multiple hot points. For that, it contains 7 thermal control blocks
> dedicated to specific devices on the die. Each control block can handle
> up to 4 sensors.
> 
> The thermal controller supports several interrupts. One for the cold
> trip point, the hot trip point, the return to the normal trip point,
> and a specific programmable trip point to monitor the temperature
> dynamically.
> 
> The temperature measurement can be done in two ways, the immediate mode
> where the temperature read is instantaneous and the filtered mode where
> the controller uses, by configuration, an average of a set of values
> removing the minimum and the maximum.
> 
> Finally, it is composed of 2 finite-state machines responsible for
> the state of the temperature (cold, hot, hot 2 normal, hot hot),
> the triggering of the interrupts, and the monitoring of the temperature.
> 
> As requested, the thermal driver has been reworked to reduce
> the complexity of the code. At this time, the 4 little CPUs and
> the 4 big CPUs are supported by the thermal driver.They are described
> in a data structure and more devices can be added later.
> The calibration routine has been simplified also.
> 
> The series provide the following changes:
>   - Move the Mediatek drivers inside a dedicated folder as their number
>     is increasing
>   - Add the DT bindings for the controller
>   - Add the efuse node for the mt8195
>   - The LVTS driver
>   - The thermal zones description in the DT

Applied patch 1,2 and 4 for v6.3

Patches 5 and 6 should go through the Mediatek tree.

Thanks!

   -- Daniel


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


