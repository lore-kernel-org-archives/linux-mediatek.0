Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C07C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 12:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZPaMP3NS+aG29yEIXQBJU1PSsBR12KX/WLHE5hgBhg=; b=2q/TcbBfxuaAPa3OZiiNXtMqRh
	tshcDxHQhyI/8qMEuwMRjVclpv0Q7GTCiVJ0XGDV4TZ+ZrKXAeZaYtCB1tmM5wETZs4zR0gJ+wbAc
	t3xO6+1v7VQFPozAjM6rNhvnAMDgiHlmh/H7aJUf/h6QIjWTtkFHws64a7ZByoCa6q7R3qw/UvDrc
	KmlMXPmw7L3s0hEFgWfZLbW1cnWAcYGu/bSjqmtR+7SxggcD+psCa0fnuLtx8DPtvqWb0A828vlM3
	QGrEj01SwjAb3UZVPfgwQ1VbgmY23YYjPKDAcPwsKCc+uWLMa1KbOGTNdZJOOG0zghRX2iP8Psja2
	29FTgd9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p69oD-00EtWz-QX; Fri, 16 Dec 2022 12:27:25 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p69o1-00EtS1-5v; Fri, 16 Dec 2022 12:27:14 +0000
Received: by mail-wm1-x32b.google.com with SMTP id ja17so1740043wmb.3;
        Fri, 16 Dec 2022 04:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lZPaMP3NS+aG29yEIXQBJU1PSsBR12KX/WLHE5hgBhg=;
        b=EwFoobbGkq3kdjSSddn4dP2DlSB7v/6ahM91tKSIieGgu+t2VBP+wiUReEbfdbUGJK
         1nzxnBgzE9dJDL8sJpgAwbbITAg4hMet8YEVncMfCCQptz4Uba1E7CgXT/MtOeiecOn/
         u6R0pgxgQUp9TMpJuPy/nWddVXSqx7ybynW5OIiUOnTON1l0hdR2W40LxB+pVZUB+8q3
         cEffdmakFndWYmWpy4pm1rSjuGUUSKtEPI36OaBC4qhe+timSCbiqEcL0TZxSDaTlRXb
         E7mH2irkhjMd+vhj/wQ/Wtw2r3a/OHgo6pbgYtAIfhaCO/J76X+xhbQKw2jwQstGC72o
         4wkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lZPaMP3NS+aG29yEIXQBJU1PSsBR12KX/WLHE5hgBhg=;
        b=NL6l/feG1m4i4lVeAnUtgBaX/uaxc0vR3zaHuYj7IymF9EEZ8WNry/0RgB9WtGCE5U
         euaNu8B9qTnqU/z4YVOM57B9pKJMpgAWT3z5NBHHC2onnNheLi8jwtqxoq7ABhJw2oCF
         Ogghyd9cFUtWMI9FSKKbZxi9UZsb5c/3fuum2+hZxDZkTNvpOCcQM5mm46nXdGJOYXc8
         4DMkqGnNwea2dbGOGS0mNUPzyahezMpplpMjWaavQjyQJiBwTRSQeOr5rgHZISejGAEe
         Ookoh44+n1l6ek3cGWJJegomJ6mNxWVVzFADvnhjIqzVDeA95ONMb/9pPA7tb+a1umB0
         kcYA==
X-Gm-Message-State: ANoB5pnf3In541H7/aKahKfvQEXYno6gyfOLUAErW3BhV9RtCMPDglZh
	OGtEjD5vmftvTyPtqkgdLYY=
X-Google-Smtp-Source: AA0mqf7bKZceTCnbTeFmQTOex7vWRPHqCRpJCrTYtkC7Fo4tgMc3BDdfxaa/jW+75d5ACMzJnmPTDg==
X-Received: by 2002:a05:600c:35cd:b0:3cf:973e:c874 with SMTP id r13-20020a05600c35cd00b003cf973ec874mr24892024wmq.14.1671193626213;
        Fri, 16 Dec 2022 04:27:06 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id i26-20020a1c541a000000b003c6c182bef9sm11464603wmb.36.2022.12.16.04.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 04:27:05 -0800 (PST)
Message-ID: <23f30de6-8122-2ab1-e519-1ade6650d8c0@gmail.com>
Date: Fri, 16 Dec 2022 13:27:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/3] soc: mediatek: mutex: Drop empty platform remove
 function
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de
References: <20221212222549.3779846-1-u.kleine-koenig@pengutronix.de>
 <20221212222549.3779846-3-u.kleine-koenig@pengutronix.de>
 <0670a966-2449-977d-a791-4b1c4478524b@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <0670a966-2449-977d-a791-4b1c4478524b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_042713_261147_36ECCD58 
X-CRM114-Status: UNSURE (   7.54  )
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



On 13/12/2022 10:50, AngeloGioacchino Del Regno wrote:
> Il 12/12/22 23:25, Uwe Kleine-König ha scritto:
>> A remove callback just returning 0 is equivalent to no remove callback
>> at all. So drop the useless function.
>>
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> Totally agree.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 

Applied thanks

