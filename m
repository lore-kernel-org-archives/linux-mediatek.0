Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3786AC32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 08:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F+5yVrf2toWobmjjbMycRUMUYr1HibosAX8wZbYW6I8=; b=CF6tgxWF4lbwyrnKTOsgl0wjHW
	f8IqvEJsTDoIdKio6NOSWN0Xf2k3HbxP/DymMaCe4UaCrjoR+YHFXB2EH5MVAmFCYh3u1mNbkQLVR
	eXN7QK7M6UARU/0rYHwkGk+1Mz7XPlDrl9ltlMydliBMW5V588WfcvfoqKKACWLs+akpXFIw3IB3F
	MFl9sEYfSId89ZvJAqU4g1R7gXMu67pZZkbswi97i3+LscaqSbzmBQvXeBJVs7crXPK9Cusv6PdVX
	YNmMWeI4hqaAlUHALcXqfrBZwye38i5A8qWX0SwoIo+izEEibe8EDVrJ6sNITxlroHeXEer5Z5ZJp
	GVKpHFYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQPL1-0041qg-BV; Tue, 23 Aug 2022 08:32:43 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQPKk-0041cb-RH
	for linux-mediatek@lists.infradead.org; Tue, 23 Aug 2022 08:32:28 +0000
Received: by mail-lf1-x130.google.com with SMTP id bt10so5702359lfb.1
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Aug 2022 01:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=F+5yVrf2toWobmjjbMycRUMUYr1HibosAX8wZbYW6I8=;
        b=ME5pga0xqukFaQ68m0vfi01ZcbRzB6yRE0fmlS7+txX0bQzWcwtEDRVyRioYOwi0MK
         78InqOKpEzQjwwoKp2jLetMmVf+U5kGfjAGpCioYESzh0Nn7R6NnQEhEpy83phb2wUBE
         vONvAXl1ssbqNdhWgsw2pgINK15PKwGEugYDYXQ0DvtuYmJnc+kHLoqrcq/t9TBGW18o
         dZU7d/N5EaKR+aOL8epf9dLFNAFMKp9E+bD7gskVr4SPbXoi96eOAvH4hzX2GgWwnC3o
         g1IWqumSlGK5va3jXsEv35nL23bMbFlCDl0w5NvXP0nYtKGxRoJwWq/DNhDBDzGG9reA
         nMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=F+5yVrf2toWobmjjbMycRUMUYr1HibosAX8wZbYW6I8=;
        b=1WeVG1NLpUrPar+HhKNWtBzSFEA+rW6o/7nhpcgZv+NfVDfhUvrEgbFY7t9fvtqzDi
         YuoXvoCvCfrv+ITBHy8nCPupT1IfFPtGEL5jfwg1TW2QMEGV/6t2dg1g48WsOB5sBd9X
         /SW1QkA96uQVhog3Pk3HCHGQ3pm3AckdbCK61B6AUwbRI51/jJp/gOZQAo1SUYAuB6GY
         GqBfQOe9sElNvWVtNHUYnhTnrMr9/DP6VKh0z4Uuk+AgI7q8DKC8W3K9FG2nSlmltiGL
         /uRwJ6Rpa5bkiY8pkUeRBHm+1xljPYhODpmFBMo4y0YyR16rZ2mg88pFG4JfFmP61sJj
         pv4g==
X-Gm-Message-State: ACgBeo0lgeGvAJnhvkc+KGbVNX/KDR5vJhr01Ntvru4sTMJrnTzfjsUO
	Hb7HVH2nAf/0k/O/qopNC64BHQ==
X-Google-Smtp-Source: AA6agR5US57wd92jMkSXVjf68U7K8XzRGHmQSa/B4s1jL0IZJ4zZqecKAkNJuoKOArqf5pabIV5IRQ==
X-Received: by 2002:a05:6512:3d08:b0:48b:123e:fcf3 with SMTP id d8-20020a0565123d0800b0048b123efcf3mr8057965lfv.418.1661243543099;
        Tue, 23 Aug 2022 01:32:23 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id v20-20020a05651203b400b0048a83ab2d32sm1193907lfp.0.2022.08.23.01.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 01:32:22 -0700 (PDT)
Message-ID: <f621a841-593f-cfed-9560-64c011a00bdd@linaro.org>
Date: Tue, 23 Aug 2022 11:32:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH,2/2] pwm: mtk-disp: Fix the parameters calculated by the
 enabled flag of disp_pwm.
Content-Language: en-US
To: xinlei.lee@mediatek.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1661239875-19841-1-git-send-email-xinlei.lee@mediatek.com>
 <1661239875-19841-3-git-send-email-xinlei.lee@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1661239875-19841-3-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_013226_909728_CAE05E59 
X-CRM114-Status: GOOD (  10.14  )
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

On 23/08/2022 10:31, xinlei.lee@mediatek.com wrote:
> From: xinlei lee <xinlei.lee@mediatek.com>
> 
> In the original mtk_disp_pwm_get_state() function, the result of reading
> con0 & BIT(0) is enabled as disp_pwm. 
> In order to conform to the register table, we should use the disp_pwm 
> base address as the enabled judgment.
> 
> Fixes: 3f2b16734914 ("pwm: mtk-disp: Implement atomic API .get_state()")
> Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>

This is a fix so not really related with the change adding new device.
Send them separately in the future.

Best regards,
Krzysztof

