Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD7CDC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 10:56:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4882861154
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 10:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4882861154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XYVDuMvmsQb+qUuhCc2syTO4Q+6ygjrEUXQnP51eewU=; b=Gy5QxFWn+jyWFlawa6qUGadX7
	c3BAL+W3WjyTEtgu0kDQj/BeW8zqItNCQE2ivXORLKRlV1rF4q2S1X7DPk6jnAe0oB3Ewt3rctHJF
	A9UTui0JAVu5jjECJkTSiplbHnpbpaoeXjqPuZv4LjFQPeMZEb0QdtTOouQfMrT+qbqv1hj8RZR8M
	hUUbQ00eHxSrk5sZCRl/HevuIUIh6qeuhCOEK7xr9GwKNZeWQGvt2zn5VQDOpyOsFzndVPpFFWPdn
	oyPRIUH224KlZfQB09T7xoQQHEtCa4oWV6b76aaLoX8OnwJypea19i3rNyIjZHGC5Yev1rRT7QiDr
	Bgd9uot7A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTjNr-002F8q-9R; Tue, 06 Apr 2021 10:56:35 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTjNf-002F6y-Sw; Tue, 06 Apr 2021 10:56:25 +0000
Received: by mail-pg1-x533.google.com with SMTP id l76so10057736pga.6;
 Tue, 06 Apr 2021 03:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HQT74NVA73GGCdAvd6/1h7+SlTTe9RmIrgBWclsq6k8=;
 b=oQu/WXmQyuX44ohLqifUNcGDI81yV2/0YSelnio0a819gMpS/5aJVrckQkKHXWooFX
 ZgvnEp9I6qG9kvZ8AWTfgiPFA6PPdFkEaUkKrLHYuivbQs5w8k1O0Jqgyys+Hxtc4RKK
 tcJE+Y2QH3n3dDZdlMH0LlxaWeE18lg8pLAOiKlVGvb8WGzx8UdWASp4T2dnVS9bgufv
 xI14ejB0mrfBwySjM97Zvb6BOewCCRKA320H4oeIaUGCsklWbIOH9yYvCTedcRq0jw2i
 Pkb6vbQ4ttfKk/Vm676oWazkf1KRR50sGV8vr201pn5wNLeoC9tX4NfcAswhAEVJLVdj
 nUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HQT74NVA73GGCdAvd6/1h7+SlTTe9RmIrgBWclsq6k8=;
 b=R1BPmt7m7bI4SeOG0q7rq/XwbHhzuZXkyeUu1Buc2qA27vvLPB45DyEcZ1Q+5TlR3b
 ikTdCl+n69M6bHwO9MX/L/RQhzfDwGF+hqy1seX8R+rtlfjlp4ooOstzeIeWEGq3iPNm
 zgjFdxpxudr9TctjPlUN2SUYcOOIpt/work90rCV7PIC769u5USqIRAIbonq6In9uCW7
 IPj/KE1RmAiAkUNxprimvHji5EjfDN88lKyicBHQJhiSlFj0uQoiGLvhyZ6l+RwYl5XD
 CsB0NVuqAl9L4aHOiLCIvfsaYMXNnLBKrSHqS2aHBOh7ug4YvjsRGbewui65qtJjZ6c8
 0M6w==
X-Gm-Message-State: AOAM530o6SOOz0RhX5Ulpy3k30ERtLv9a5hsO47/lQCu6mXhExAu9UAC
 /rfFrkeAycRcRNZbDjDuJEs=
X-Google-Smtp-Source: ABdhPJysFojs7JX3hmvyUz5j1+7J5Z7YRyi0ZSnMOYLcJ2bsm0VfP6FBMz+dTpF3ob+Xk1uWQIx/pA==
X-Received: by 2002:a62:ce4e:0:b029:225:bcc4:4ee with SMTP id
 y75-20020a62ce4e0000b0290225bcc404eemr26569506pfg.13.1617706582373; 
 Tue, 06 Apr 2021 03:56:22 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id r1sm20326351pfh.153.2021.04.06.03.56.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 03:56:21 -0700 (PDT)
Subject: Re: [PATCH v2 3/8] dt-bindings: watchdog: Add compatible for Mediatek
 MT8195
To: Rob Herring <robh@kernel.org>, Seiya Wang <seiya.wang@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Chaotian Jing <chaotian.jing@mediatek.com>, linux-watchdog@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Wenbin Mei <wenbin.mei@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-iio@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-kernel@vger.kernel.org,
 Stanley Chu <stanley.chu@mediatek.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, devicetree@vger.kernel.org,
 linux-mmc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vinod Koul <vkoul@kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 linux-serial@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
References: <20210319023427.16711-1-seiya.wang@mediatek.com>
 <20210319023427.16711-5-seiya.wang@mediatek.com>
 <20210326014037.GA2144901@robh.at.kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <32dd4d40-2dd3-fc58-ae2b-642b877085b4@gmail.com>
Date: Tue, 6 Apr 2021 12:56:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210326014037.GA2144901@robh.at.kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_115624_179131_CDFAA4A3 
X-CRM114-Status: GOOD (  14.32  )
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

Hi Wim,

On 26/03/2021 02:40, Rob Herring wrote:
> On Fri, 19 Mar 2021 10:34:22 +0800, Seiya Wang wrote:
>> This commit adds dt-binding documentation of watchdog for Mediatek MT8195 SoC
>> Platform.
>>
>> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
>>  1 file changed, 1 insertion(+)
>>
> 
> Acked-by: Rob Herring <robh@kernel.org>
> 

I suppose you will take this patch through your tree. If you want me to take it
through the MediaTek SoC tree, please let me know.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
