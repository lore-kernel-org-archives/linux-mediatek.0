Return-Path: <SRS0=+cmX=FW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B6DCC4361B
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 10:19:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7AF223A51
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 10:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7AF223A51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L8EClUsJ2jTn1Auo2EPok09x8JLIvJWZA/NoOk2mnM4=; b=wGOMIJeaTLaOfpF2aVCnM8QbO
	R7GKpz/qghbniUQY47hYJYoy3ENYJunFXbPtSBolJusdfhfUXf5PbMuVgmD1mBcyELgdTbweND918
	uHOZJdIWfzX5Jd7ua6lYBg5N587UkXh+hsButY2otnnQQboy/hF62gcOEebjZ3Q+SvGUZ13uxXtHq
	dpPOSMt1BbXZEJXeKmWSt2hLXNdosPN4Pb97M1SRLo+gTmavJZWTcv4cHT0ZPUwfJa3eREY8rKPzl
	VlHbeOjy5O+WICiC7JdF/8SpQ7//CoMkwXbWUH8VA52DNJtbQfb54j2ESliAqTWgJwnf9MPW8KRfH
	hgulooeVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqCrN-0004bs-NK; Fri, 18 Dec 2020 10:19:41 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqCrI-0004bT-1t
 for linux-mediatek@lists.infradead.org; Fri, 18 Dec 2020 10:19:39 +0000
Received: by mail-wr1-x435.google.com with SMTP id m5so1532102wrx.9
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Dec 2020 02:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DIxCQpzn5k+G2PehMR9egdBIXBLmFw+GOEs1pTdyM0M=;
 b=kxvD9EoLTmWyoJWkqZPtfanZ15cyFwsCaz9xPcj8SSO2ZngV5CnlgLQielCSpg/VdH
 w5Q9DQNY0kCyvZgCZlx4ZleP2mKzmcEsrV7IIEZbH/7S81yWT7sFJe5gUDz5wR6HqqZ1
 /UMuIxN09o05akssAyN47tLN0qMQGS/mbPMh5+/KU9liN+xenlc9ouQqPfS1FfbuhxFG
 0xgUtM1jxxTjHH9ePKGqQkoCbclzuexGkqKbuOz7SK8kcANZeUfMblg5+iqlq3LfshXD
 HLKIgvi6BIcZ4dUFoHV4roA0OEGmEw8twPs9U+Oh6lKsWeMszQt5YUAa3RLkTmi9ib0J
 67GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DIxCQpzn5k+G2PehMR9egdBIXBLmFw+GOEs1pTdyM0M=;
 b=hMi6d+0VA0qhn1NS3bbIZZS3JGyar1JuhPrQX2lPoQ9Xs91/9c2TF8b/DWYohM0wE+
 DbaGUDJhKzF7FUb4j2d+7P7tC7x049HuU3UN/oTcITEmrELHZMctVcc+ThBg4ls7GW5F
 eUlBuN2suy5ieMfnSyp8urcCCAK8/gdIIr5NtHIuV5Jrwp0EkzCwsIKbdongIwR0hCQJ
 QjtpnF4lqOerATH1oSazZW06BvdwFBtpC6C1gBEMxeqjyebtm94co4uGi8Vk2Sw856zL
 do1/ptoLqYGQe5CPV1OoJaYdky2TGWjhxNLBW/qPKPg/C+2v7CTXVKLGNxn7nI7YiNOp
 ebjw==
X-Gm-Message-State: AOAM5307Q4MZV1jJZvZGzIzb/FWJYBCmeWjxI5nenYmqckVyHsnsEeP/
 3BJV6lqFzawCaPBI9P2nHi+N53F1U7qfyA==
X-Google-Smtp-Source: ABdhPJxvi/PwaiuyzVQfz6nt3vAThbvvX2l0Vgu/XhCFmXmzYLYdqsIWpdrTmk8m9fBY2teK3xWvcw==
X-Received: by 2002:a5d:4a06:: with SMTP id m6mr3636252wrq.189.1608286772775; 
 Fri, 18 Dec 2020 02:19:32 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id m17sm14376708wrn.0.2020.12.18.02.19.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Dec 2020 02:19:32 -0800 (PST)
Subject: Re: [PATCH 1/1] mfd: Standardise MFD_CELL_* helper names
To: Lee Jones <lee.jones@linaro.org>
References: <20201217083420.411569-1-lee.jones@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <fac3c0ff-3179-94b4-4c6e-57e100a9f9fb@gmail.com>
Date: Fri, 18 Dec 2020 11:19:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201217083420.411569-1-lee.jones@linaro.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_051936_207152_68D18BB1 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Gene Chen <gene_chen@richtek.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 17/12/2020 09:34, Lee Jones wrote:
> Start all helpers with "MFD_CELL_".
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Gene Chen <gene_chen@richtek.com>
> Cc: linux-mediatek@lists.infradead.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
