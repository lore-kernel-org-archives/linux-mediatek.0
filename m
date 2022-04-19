Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A1EC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 15:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nBqm+0Dz2+G0oCTsGqxsrBgBeJpCTmfZjdnhjXLkM1M=; b=dlGZAGY80X3B03
	hz0XqEOCO52A4HiEv8fL4G958imDalaewjdV9qcVwmUCaG36J+Wp1Kcd6Zq4aYK28YMuxuO0fyi/h
	AE9gHx7sIbX/QPoOXklUBoFrkLUKSx1pvEBCFgHD0EdpmYMtEaIQyJaKveKe3NAg7fP906C7eSxtF
	n7/KQE8zGQQt9Xoy7WpLoj3bifxa5yFLObFSTYgPRyIro+BpR6lzc6ga3zq1DHKTUEVU2IoIaJV9+
	t4TUJjz4CVadrBWPcwkngtvrI9j0LvyB7a9HNeojLLhgA7JvC78CO74MrM10lgghjvc3CVdv1e2g/
	Eof+EtgHE4FZcEoZIhkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngphd-004ca3-LL; Tue, 19 Apr 2022 15:23:41 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngowR-004JFY-IV
 for linux-mediatek@lists.infradead.org; Tue, 19 Apr 2022 14:34:57 +0000
Received: by mail-ed1-x52d.google.com with SMTP id b15so21531634edn.4
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Apr 2022 07:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=hYhWpkA0GOl3mzzjcNkkxBFtmx6tG2/CLP4HzjXsxi0=;
 b=gDYmERjvy8NgZ4/EJ2aP6RqYgTmUNylM5SgiVH/2eNAi8INO2ld3IEptSWM9PAWAk+
 Bx26xGaHvAUml6pJJueSotMR2y17ZQWYPv2o8zfreJmGqxfdcZg0tJOhJAbcLYRjHwlq
 +sjEWMhRgFtvwsUMN46ss5URCREuQkrYLw331Lu+Ma8/Rga5h6r4pMZGNiSR3W8K464Q
 DV09vqOGXHhoZrWCPRivl2kCGixrGwQGk8Ehr8eSrxBPiz6NDdfFPOpOvMTq9GEvu6f4
 LLGOA9z62W13/R6Kr368SuDhKoU9Vt/a/Ahf8+SfUMeJcSzDNUA51YuawokAJsllTXlC
 cQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hYhWpkA0GOl3mzzjcNkkxBFtmx6tG2/CLP4HzjXsxi0=;
 b=2xSlTGqLQ1aIczvwL+hSJXnNIEi9oq+I1+p0mH8sXGWfrP4qWceqQtLxm7e46S8LMP
 plL1dd+sj6/muQBVwgk4W4SzEpCXwmCXJkugFRqXt6iTI+9M8gppcLzh5GJzv1VyTF2n
 gIczOYXjZmxNcHr4+lE2lEZh1v9qxFf+kxvlBUQIYLcnOiJ86ovkFiGoVTY8tEpY3GL2
 iqfRq+DVT7Kd0uPcQ6KWq4L9tboPwgenXKkZbrrlj9vLl3zp4X+pa5hdJwzrgyl4TskB
 SklvR9nQw/fox8HtJ0yz88pCz02N2cuEejwc15sDHKU5Pl90v/AW1i9Wlt0dwNl8dEBM
 QyZw==
X-Gm-Message-State: AOAM531R8VDChYn11S3vmQlY+S9DgN3p4VPIe23w+Rd2E2DkQrNHXZ0j
 Br/iENrzfqADjg2aP+k093C4Pw==
X-Google-Smtp-Source: ABdhPJwMtbhOhCW5Bk7zHhutByyPSIKIwImCItxB2gjTzWPQrENBnkq6YnlbZzC4034cf1T3PHE+ig==
X-Received: by 2002:a50:ba8a:0:b0:423:bdf5:41d6 with SMTP id
 x10-20020a50ba8a000000b00423bdf541d6mr16366082ede.204.1650378892871; 
 Tue, 19 Apr 2022 07:34:52 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 mp8-20020a1709071b0800b006efc915e1ccsm1513203ejc.118.2022.04.19.07.34.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 07:34:52 -0700 (PDT)
Message-ID: <83037bd9-d4f0-7116-0b7f-26f64170a5ad@linaro.org>
Date: Tue, 19 Apr 2022 16:34:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: align operating-points table
 name with dtschema
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org
References: <20210820081616.83674-1-krzysztof.kozlowski@canonical.com>
 <165036314214.180327.9860190048104061653.b4-ty@linaro.org>
 <448093df-288f-3c49-270e-5d830a986b27@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <448093df-288f-3c49-270e-5d830a986b27@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_073455_701171_3487DC00 
X-CRM114-Status: GOOD (  11.45  )
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

On 19/04/2022 16:31, Matthias Brugger wrote:
> On 19/04/2022 12:12, Krzysztof Kozlowski wrote:
>> On Fri, 20 Aug 2021 10:16:15 +0200, Krzysztof Kozlowski wrote:
>>> Align the name of operating-points node to dtschema to fix warnings like:
>>>
>>>    arch/arm64/boot/dts/mediatek/mt8173-elm.dt.yaml:
>>>      opp_table0: $nodename:0: 'opp_table0' does not match '^opp-table(-[a-z0-9]+)?$'
>>>
>>>
>>
>> Applied, thanks!
> 
> Could you please provide a stable branch for this patches? So that I can pull 
> that into my branch. This will help to reduce merge conflicts later on.

Then maybe better take them directly? These patches were waiting on
lists for long time, I resent them and pinged. I took them only because
there seems to be little interest but we want to fix all dtbs_check
warnings.

There are three for Mediatek:

https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/log/?h=for-v5.19/arm-dts64-cleanups

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
