Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C86C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 10:53:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 981026124B
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 10:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 981026124B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v4CPxA1ARTI0kBD2rtr0r4A8W6hGrhPtKYhIkkb/qgM=; b=nV6i1XfO2pG7KZs55dXypTQV6
	AFWoFifIbr5wdRCmxLj74WdAMo6WjwnnbBP4MoNu32h/vQop5GoYPk1P67UHayPO724JW4d9aBU1t
	EldveD6aaQQ+2PhfR+gUc4kFiMW6pBSTusPzr+xIjObVRfCIXxCCEonzT50xZc+r9/1MY9Zw3Vbg2
	G1h659IGEQnX+ZsJ2TJxzkndRmgr8d6zyrclsjJBFP/Iw8drWNKvpaJJQDDPZFxnyobWpy5dG1ohL
	5rU39AEbDDEXxfrjAGf0ZlBhUMVC/RpxWh447/od0eSJ1TSktjEdsKE06v4O8PvqklcnTVO86gOKs
	5bRnNt+kQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTjKg-002EV3-Mi; Tue, 06 Apr 2021 10:53:18 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTjKa-002ETW-Tu; Tue, 06 Apr 2021 10:53:16 +0000
Received: by mail-wr1-x433.google.com with SMTP id a12so3936501wrq.13;
 Tue, 06 Apr 2021 03:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UW4SBvk4siFv9zFuBrGL9HNGyyN/dS4WBxMX1QWTZM8=;
 b=RqwwVIngnJInbW616xuEiRHUTETVRR42D4lHIX03HdrtnCcD1V8G5J302yq0IzkTAQ
 aAsAeCOQ1XZNfbbtNsxHvfJ0QH1Lla/valtxl62ZjozBrnHRzC5NOyItOuyB4djHff4u
 mfBcnWNpe97n1JBA5p1W0pSY+0To407VG5rUC5MPA3ZmLtzQ8T4+uGJWGD3nRsvxW9R2
 vaj71h2BZZuAid7IhY00fiNk0xPhaGgC0lBHjQRFq9hG8eNU4+cPWRcQ0ThDzGIxaoeX
 X7d1uJRz+t7Rl+L/pSamR4V7udhSn0Mgo1ZIuB/EFIvh/0qw39NRO8Qk0YujTCTvByrB
 PMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UW4SBvk4siFv9zFuBrGL9HNGyyN/dS4WBxMX1QWTZM8=;
 b=Z9VGWB/jf9+4Dehvcuh6DtgT9LXA2OJmxy4IT6XC2hs6PI0XzaatcMu+wVij6Q4Sb+
 IWMdhSIu+FinIK/2uh+CRxRRn9UdhCiS7/ohDvUjWeetJP6rNWbIz/OWMo8QfIV0YZBI
 Qo21YhzAbFSE3bO+0hleVaOugD2PuwiUSHdFjSHM+47LW/LNUUwrm6Bow8+Dq55RXR5s
 aYan7Hcrvn8LOGljPaP2geehW5JzWRWAXt+UYAD8aJbs8WgVrggIAcZ4HcR2tlBxhEnp
 tohyGAGp7doUAD8lTUtH+ypZ/AbPy3zAwGMZiJ5gbql0SmWtP/8BW50cO0GJ489INoEE
 KNDg==
X-Gm-Message-State: AOAM533/PxUuH8KJPy2epMzGC7bB/3pO6MDZlMu6DO5R8K8qDLIjZ0Dk
 oMGhVtiHiC8ga1JZEGCFl8E=
X-Google-Smtp-Source: ABdhPJyEcWxQjakzL4UBY/hSPfKVA9z+I4/Fts1uNiYoCieQ/sPpv7fJrL0XRGTcNHoTn2bhWLT6MA==
X-Received: by 2002:a5d:47c4:: with SMTP id o4mr33792030wrc.138.1617706392307; 
 Tue, 06 Apr 2021 03:53:12 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id c131sm2416442wma.37.2021.04.06.03.53.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 03:53:11 -0700 (PDT)
Subject: Re: [PATCH v2 1/8] dt-bindings: timer: Add compatible for Mediatek
 MT8195
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Seiya Wang <seiya.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fabien Parent <fparent@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>, Stanley Chu
 <stanley.chu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com
References: <20210319023427.16711-1-seiya.wang@mediatek.com>
 <20210319023427.16711-3-seiya.wang@mediatek.com>
 <bf7ad31e-974a-3e0a-12bd-32973c7c3cbd@gmail.com>
 <11bf6761-8902-bfa5-8577-d397846e7638@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <251f6d99-a7f6-ddbe-096a-95998b86dbed@gmail.com>
Date: Tue, 6 Apr 2021 12:53:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <11bf6761-8902-bfa5-8577-d397846e7638@linaro.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_115313_141764_721C7BD1 
X-CRM114-Status: GOOD (  12.34  )
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

Hi Daniel,

On 04/04/2021 22:33, Daniel Lezcano wrote:
> On 29/03/2021 13:52, Matthias Brugger wrote:
>>
>>
>> On 19/03/2021 03:34, Seiya Wang wrote:
>>> This commit adds dt-binding documentation of timer for Mediatek MT8195 SoC
>>> Platform.
>>>
>>> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
>>
>> Applied to v5.12-next/dts64
> 
> Usually bindings go through the subsystem maintainer.
> 

Yes I know, although not all maintainers are taking them. I'll coordinate with
you the next time, sorry for any inconvenience caused by this.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
