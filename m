Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D165DC76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 10:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vFG50WRg6TSYZLbPU6VURtL4QTslWUkc9E2u7XffhHw=; b=TV+TxXmznKZc3b7APOiBv2OJ4x
	6wP+z9KCAl1OGVEFILN5d6aFVC0TPAyDZomUhm36nhWyiAw7ByMhYzLK2oQ/i3Lh6CV4WcP/x5E58
	9m8FJ/zjbx2ojW2ksnrQV2KqXdf/szqxWujYUx4BCGDivsJb79B6sbImR+o178pKtov8/KzpgO/i8
	yfI+ovFBiEV6OMjnaTBqUFX9FobwPtGUOr8Sl5widIdogWs/JFhwZH1HrXWnLq5hm4+qntRXcWOIf
	4jDGEEhD+YNvFIHyG9bSGjD/6GZGrGqU+jeJH0diS/dXp5BUbncR7iXNSc7rayHyQyZSQ/SgLIir3
	7Y5UcCJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piCGY-006zGn-0X;
	Fri, 31 Mar 2023 10:45:54 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piCGT-006zEl-1z;
	Fri, 31 Mar 2023 10:45:50 +0000
Received: by mail-wm1-x334.google.com with SMTP id i5-20020a05600c354500b003edd24054e0so15037452wmq.4;
        Fri, 31 Mar 2023 03:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680259548;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vFG50WRg6TSYZLbPU6VURtL4QTslWUkc9E2u7XffhHw=;
        b=ebVOy1D91/lypLEASvIfFCCjQPxepj6yXQhVOmf6weRMM5icXLf3friwMda5FfC8RH
         a1Pdj22qiKZYdLU/xczr4d1nSGeEsD9s5pX5YQvfJBVO19k89KRZa9x5qWzbYVhbp2Zv
         YxFovem6dOLggU8dErsjuyIRnc7335xctRJOuk00wjj+5wTmjUjkbwO0icEBS1iCLSFO
         /85Y2siNCESdwYgdI52Pd9dWDM2oDFlDqQUjLt6dRqLjFTtqyQf9+jB1N1N5cJwHRdoa
         EpSvwnQYxeLR4spZynFSeybTCKkMBUIZgQYDpFVWAgh30ly/GUhzqrabf7p5ni2MMNgT
         LnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680259548;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vFG50WRg6TSYZLbPU6VURtL4QTslWUkc9E2u7XffhHw=;
        b=Abq5AoTHF0W3wdd8kfiZRpAAuxBxhc3O7BUOgE9m7JboIUXWV+94Fnv6kgtFCFT7BZ
         jKKDMUtnTl/AAVUT8brhgvjRilZiUp8d3xjHRFkYfReoiME4tVZLjV893ErnsYX03SIt
         n/tpr39fsGQR61iPMow+YXRxgjCEaV/+7/3xswlPvyqGToL0fcnpK/VYtQYNCWOqUXBi
         olqD23DcVl4hG0IjGfa1YamD38abHKuL+FjTCbCMtbGixkzSixF47SP68Moydw7v8BR+
         0rBA88o4vOJ1rcRqV2sj5JIIAA72X0l+kmR0/cPgNNk7c5Qy//znQ/Br1W3RNQLABIuJ
         B0/A==
X-Gm-Message-State: AAQBX9ech88/BCoVeI3pl5bslWQiQ5j3ibp/OaH7FReRrDrVgjno+ry0
	Z0HN7A3OoWnpwECgAjB8sUg=
X-Google-Smtp-Source: AKy350ZzIbqgsPxbenHIVxySZF3wlNwF7uniuuHQNYNE9Vjs92UzxssJUrRef7rvNSSrb/rLXndW7w==
X-Received: by 2002:a1c:7c12:0:b0:3f0:3368:5f7f with SMTP id x18-20020a1c7c12000000b003f033685f7fmr4663596wmc.31.1680259547957;
        Fri, 31 Mar 2023 03:45:47 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id s7-20020a05600c45c700b003ee2a0d49dbsm9391820wmo.25.2023.03.31.03.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 03:45:46 -0700 (PDT)
Message-ID: <c95c2ab1-e57e-8e77-4db3-04a2a4cfc16f@gmail.com>
Date: Fri, 31 Mar 2023 12:45:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 4/4] arm64: dts: mediatek: cherry: Add configuration
 for display backlight
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230223145426.193590-1-angelogioacchino.delregno@collabora.com>
 <20230223145426.193590-5-angelogioacchino.delregno@collabora.com>
 <CAGXv+5H7ADKUu1bsGrF5F-EgJBM6WW0N+AFw=m+hH_00QGHDew@mail.gmail.com>
 <CAGXv+5GnbP+hEy_J+vNsQgwr6qK5oQpDCaszqOkWmrcKfupAgw@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAGXv+5GnbP+hEy_J+vNsQgwr6qK5oQpDCaszqOkWmrcKfupAgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_034549_651266_C8FFEA73 
X-CRM114-Status: GOOD (  12.16  )
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



On 31/03/2023 08:44, Chen-Yu Tsai wrote:
> On Fri, Feb 24, 2023 at 4:52 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>>
>> On Thu, Feb 23, 2023 at 10:56 PM AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@collabora.com> wrote:
>>>
>>> Configure the hardware PWM for the integrated display's backlight:
>>> all Cherry devices enable the backlight with GPIO82 and manage the
>>> PWM via MediaTek disp-pwm on GPIO97.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
>>
>> with some additional patches to enable the internal display.
> 
> Matthias, could you pick up patches 3 and 4 from this series? They are
> independent of the other two patches. Having them picked up would reduce
> the number of patches that have to get carried for testing and resent.
> 

Applied, thanks!

