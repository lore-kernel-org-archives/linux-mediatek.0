Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BF2C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 09:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5ymJ3fw0fv1V9p0VTDFDOtHXr8KzREKrs2F+r+ez6k=; b=EiMNLkq9zdzqhjod5T94rRYj7c
	LteGtNwzRZxHWaJvPRgFLiJzO6ELJb6GwT/TvLU0oLI5xUzYRWEvgENHmA+teD+GHv04nBG2nsjIL
	BhpxfRgRDacq/BQJ8fShf+pwZGjHARq1Gi0yEH7+CqJTWKiUSYqzz9E1CP/fXnnMWp/AXwU+I3cj7
	+4HEAK7cliCN6XO91IiooJRFov+WQXNEW63h2NijHrsnxgvH84lH7HJvh3h3HiNQCNhRfKEONH1l9
	S1PXSMQrMYBoJvulUosbTI0vIPwbL7720XHS43TFBLRbUAiVthn6bt+fxBXn6T12JW2J4XcSIJmbW
	UWkuvJ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiBba-003qo9-Q7; Tue, 11 Oct 2022 09:31:18 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiBbM-003qlJ-1h
	for linux-mediatek@lists.infradead.org; Tue, 11 Oct 2022 09:31:09 +0000
Received: by mail-wr1-x429.google.com with SMTP id bu30so20651346wrb.8
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Oct 2022 02:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5ymJ3fw0fv1V9p0VTDFDOtHXr8KzREKrs2F+r+ez6k=;
        b=dBXChz0+CbfhV4rRHl/Psu/i3ZCFZFSNicjw08/5xLYflUCIR9xG47+wVLeGC3w7Cq
         LYoB64ncsMp6YivMLmEwwNOHYhrAVSgJXvDqBDuBnnlgxWLbuBIvVyUIdwwn+m0NFY3N
         VCAIgjReMIMoubH1QWli7ODAc76uaPCe6EDnU+GRgTdWjw0WPSWXnvsAiptOFo/8ol3v
         u3it42e9IzTBO1IMRg3uAn73LcQlZVv5L2lIRIdxqZKQYlqqhkLGDS4GQZj1fwQkA2X7
         7eFr5j8T4k/Q1iwHDGGKlvdXwIWy9OOC7MJcTUMAcmeARYSCLhXYf0RK28lSkylZVi8h
         lgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v5ymJ3fw0fv1V9p0VTDFDOtHXr8KzREKrs2F+r+ez6k=;
        b=sFaS94Rp+XtUUHxw4kX/yZtdwNbJFOYKnc1sbwlgYCWWot+xvEWa8EwdLYK79WulHd
         l0H+M2Kh2TxINR22VjSz4DKt71BSBd4tjmf5Jxf89JbOLba3VgEGDqRayodKnXQHCdlt
         L2kYrwH9mdfSNderss0Fjw6kTIc+jdRRC4FE9iEUh+jYr9tlEXCzw4TMxtELdNTQ0CQa
         TDh+KdfVxBLgzCgJZuupe+wH9uU6L43aKZ9rCnDW/TROFRI8cMWEr/b7UA7vp8bssdgo
         x4WvEMGe8pbGFVEMYijlWwqpjGPI2a6jeUNWeD6oMXbtLJPdZtYpE/JCd3X979BbsGpK
         Y09A==
X-Gm-Message-State: ACrzQf2H5HcaZxtXr9VbXA7T+5l8QUC3a39/ZgbjcqqjmZnoL+VZcJUl
	PLamo72LNsS9H6QPnISG4AguJw==
X-Google-Smtp-Source: AMsMyM7EhdgMIUJ+Lnz1ixYjljGlwW0w51lXQIMByy+9RG0YV/WE9uusWVlxHHuorrU1+egDfdI99w==
X-Received: by 2002:a5d:5950:0:b0:22d:d0b5:a9b2 with SMTP id e16-20020a5d5950000000b0022dd0b5a9b2mr14645205wri.452.1665480660520;
        Tue, 11 Oct 2022 02:31:00 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id w9-20020a1cf609000000b003b332a7b898sm12000596wmc.45.2022.10.11.02.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 02:30:59 -0700 (PDT)
Message-ID: <972ba839-2fd3-2b45-3477-0c7e3d32f149@baylibre.com>
Date: Tue, 11 Oct 2022 11:30:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
To: krzysztof.kozlowski@linaro.org
Cc: amergnat@baylibre.com, broonie@kernel.org, chen.zhong@mediatek.com,
 devicetree@vger.kernel.org, dmitry.torokhov@gmail.com, fparent@baylibre.com,
 krzysztof.kozlowski+dt@linaro.org, lee@kernel.org, lgirdwood@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, robh+dt@kernel.org, robh@kernel.org
References: <cdb4e9f7-c7b3-3a1f-bf61-e42bdb021570@linaro.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: regulator: Add binding schema for
 mt6357 regulators
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <cdb4e9f7-c7b3-3a1f-bf61-e42bdb021570@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_023104_327177_4AE4A314 
X-CRM114-Status: UNSURE (   7.30  )
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

Hi Krzysztof,

Thanks for your review !

 >> +
 >> +    properties:
 >> +      regulator-name:
 >> +        pattern: "^v(core|modem|pa|proc|s1)$"
 >
 > Why enforcing particular name of the regulator?

The regulator names are forced to match with the datasheet names.

I think it's a good practice to increase visibility between HW & SW.

Also, that keep consistency with other Mediatek PMIC schema.


Best regards,

Alexandre


