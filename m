Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4A1C04AA5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 06:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ummFVBGk0kSJ29azYUV4PMm88NyQ23LzzWJDNGG28Ko=; b=X1DPSWtIBvcLuYD8JzeiTfaQRR
	P345Vds6rJXgcq0Q9wCtNtIMqEAivVBovv9ZAOuuNwhMV/i5+583t+yallKbLxJ9V9VermBeqgs3R
	QURREWHSv16AptuObuyBXhKsKVWahl5YhBfezqNLV+GwenD4WHhu02J5f7lnejvj5SMMAnJT4GPWs
	rA/2V1QnCYiMvWLxn/8ftNZ662zzhXs2+10dUXgdSWC4LWr3gP1T1RtMNG2e/7VhhP2t3zoD2GusZ
	ac1yGQ+fkRQ2p9glgQhHpU50v4XNlQ45/k958rH+Dj+UJOAv1Ep5D/B8SDzeJ9OoFF+PBE2ZGnQ6e
	vYk13RAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR67G-007mKL-O7; Thu, 25 Aug 2022 06:13:22 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR65a-007lsT-VY
	for linux-mediatek@lists.infradead.org; Thu, 25 Aug 2022 06:11:40 +0000
Received: by mail-lf1-x134.google.com with SMTP id bt10so13904167lfb.1
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Aug 2022 23:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ummFVBGk0kSJ29azYUV4PMm88NyQ23LzzWJDNGG28Ko=;
        b=OFtTB6mVUJ7bt1R90wBtz2Y6zQCVFUpiOuFR6YC6KJ3Y15humtnaF40mxEMcSq4Fj3
         IeH6p4VgBaGRevW24zfAkORoqg6d9zBGd5onw0wtuYYPkQHJQpswVnr9XfDncaoaTd1p
         ZK2EXKpA3/xUw6k0OJmc5V7raAnoKDI02lHDche9JSt9hLHI0mUD2+QjMezZtQIwVU/V
         vqyuT8OcjcO+wXnsvv8i7QvZRwTkspGofiAtPDY4AXFeftS1ZNh3UKQ09+/7rp89BaR2
         su15G0IEwNyOs9QPcqpJs8W5d7Vb6KjH4Oj72OaOfYFKNcVNOvf21ELAEMX/URcT2Fow
         sYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ummFVBGk0kSJ29azYUV4PMm88NyQ23LzzWJDNGG28Ko=;
        b=IoRU5kL2WZp8gfA6OqkXlnrZeh9QnoEZWCT01o1mA9Q1aCiRki/rwV0o8Jgz0Tt76E
         ruPgM98w0gjwBqSY084RRI0eJsSi1zcfsvYC8xn7qJ8lOKPaPGOnsMGp5WOLxf4TRxhS
         BhrQppltqL6WLOt3HNB+prB2HI/eWzUQVJP4y+53d4/p4IOjOUCfhgMe2NVCeN30WfAY
         39JDtwezmMV5YxfGOqdCSh6pz8Br+Unyc7Hvz+VQ2r1Tr6MsIT2Cky1aj7qKJimVEpHG
         pIr4K5beYA7Mw/pX457NOwZY8Ds1iuEghOMva8VwZsjNg/wSg55nP1PJNgUPR1vYl4KD
         npaA==
X-Gm-Message-State: ACgBeo22nlB0aZRvEdKb7OC1h9iv996jyk8Lssegy5kKCOZSybDpw2MO
	iuvOV7E+WA8pW10zcz/MnHxBMA==
X-Google-Smtp-Source: AA6agR4niBBOUXc8ecge5sCF13gIkJ6mIJGsa30laM0Wak9E8xVD2qZSPleZA9pDzcn970EDeqF0YQ==
X-Received: by 2002:a05:6512:220e:b0:492:db7f:e0b3 with SMTP id h14-20020a056512220e00b00492db7fe0b3mr618143lfu.142.1661407895137;
        Wed, 24 Aug 2022 23:11:35 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id t19-20020a195f13000000b004896ed8dce3sm325213lfb.2.2022.08.24.23.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 23:11:34 -0700 (PDT)
Message-ID: <3ff08ae9-a4b6-2b74-23cb-69ea1d7e1033@linaro.org>
Date: Thu, 25 Aug 2022 09:11:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] dt-bindings: arm: mediatek: mmsys: change compatible for
 MT8195
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: jason-jh.lin@mediatek.com, nancy.lin@mediatek.com, ck.hu@mediatek.com,
 chunkuang.hu@kernel.org, angelogioacchino.delregno@collabora.com,
 hsinyi@google.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220825055658.12429-1-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220825055658.12429-1-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_231139_093748_3CD392C6 
X-CRM114-Status: GOOD (  10.26  )
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

On 25/08/2022 08:56, Bo-Chen Chen wrote:
> From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
> 
> For previous MediaTek SoCs, such as MT8173, there are 2 display HW
> pipelines binding to 1 mmsys with the same power domain, the same
> clock driver and the same mediatek-drm driver.
> 
> For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding to
> 2 different power domains, different clock drivers and different
> mediatek-drm drivers.

I don't see binding to different clock drivers and anyway that's not
really an argument here. Please focus in description on hardware
properties, IOW, are devices compatible or different. What is the
incompatible difference between VDOSYS0 and 1?

Best regards,
Krzysztof

