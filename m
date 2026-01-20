Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193EFCA5FA0
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 16:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDF4hEQ49oVuoE1o1FuTuulQQD1AKtsuCPOT8o0CxOI=; b=yXiaF2YfEQUouwFMpUK1chdT+f
	BcDPfl0USOUwroA28dvnswXAjjR6/q/fQj66uRQv+M4hg14c+G1l25lLZmlU853Qhp3W3LbM3RGry
	uJ1JYW+WM6Pv8392mgZu+cyEjMd2opvsDHp2iNeGoHUex+w5phNr/w4j7UdLzrtReIIpR2OZ1pY55
	y6p7GXwpj0b2tiVZLJ/s3Itpj61DfZSXy/Je48InFWRnY3rJVFUTwowspFIKwux8AB3q9XSe0iLT3
	ldpZDLHK3garTHSB2IY/Kb/lSGzy2v5lUZBdK8h+5aQgwW2wbydXgvhOEia66hJMCkkmDb8O9oAxO
	ZYxPEDUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEKf-000000048UU-1TBG;
	Tue, 20 Jan 2026 16:11:53 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEKb-000000048SR-3sgc
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 16:11:51 +0000
Received: by mail-wr1-x442.google.com with SMTP id ffacd0b85a97d-43246af170aso3236402f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Jan 2026 08:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768925507; x=1769530307; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eDF4hEQ49oVuoE1o1FuTuulQQD1AKtsuCPOT8o0CxOI=;
        b=jhm6GEpsVnNwij78L40Sya5qikFcE9WN6255ENYcsmNW8ft9mS/C8SMAn13a03O5Bz
         Mmzx+famXuyQ9QP/rYu7hPfENJkrl/LOVyPdWU2p9USAjwiepf1JGDE3OrcSAJBzloZI
         I2nf7wWTALf8kzxsaYQM0adQka9LzRpQGtHSnhu4zEyIWVZJpIzDnRG0jwf8Fnh5QIJM
         9w+AMZ6XSOtq06WDEoUGSm8UyZFrVx2z/XMYRFjtG/rV4tvwgff5iW5HVYujd9EF0MQo
         h6wZ1Obe89N6UtzHMIQiV6WA8eBgSWEA1LNtODpdAqMhQNUq006wf2TRL92CXMPFIgjB
         LvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768925507; x=1769530307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eDF4hEQ49oVuoE1o1FuTuulQQD1AKtsuCPOT8o0CxOI=;
        b=no2s/rB2rzXCpkTTHB5Hdw/vfUYfKqvXoZ4NKyc7WpTNJsV7/SMaaz3V5x+Jtossf2
         3GCLoUJ6tvYqvTJdCJ9O/ymP50+TDKsF8F1nSZAfvqXXQ5Ipd115b4T1wtTUptyIpYES
         1mCZ+UGLAIAzef2gpFpwyu0nzmrocI8Tp+N9EiW3T1T6RwqIF6pmBz6QvHfTaisNIXmf
         MeOurXgGUTPRH8mIdoUl2gQBIbHTdzDcI26lXM8cwq+Knm7/SikVo7ILt/udqv9lBCpp
         AXCd55c6wXl+eXlkPOdSIR0Sa4O6j0/PsbV0mkzIVAq2pEsnSYvj5GCYZQ8TJxl9RE/b
         x8iw==
X-Forwarded-Encrypted: i=1; AJvYcCUp4+VjEduxoj+ZK/2gIkU6RnIYi3ewmEZVHgnI+ZT2TOwRWqCZjf6AwU6QZC+qruq6x40OOpcjjSszmeTmRA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxnsrkx7eMk8D2Q9HOj/oLt5TmtyY0hgqmH0bxVClI95KizbsN9
	VZOJvkMAnci/2c2HxwkNxuSjJKHkf6tgCbI9NzlCSr3XFYsUCxdMx4e0EgfTIdYB00Q=
X-Gm-Gg: AZuq6aIwmDeyZ5egmZql0Knl+0Mw8Tk9yfypshGSgcflYU4u7CLtFIa7EqSEp4DQT2/
	P5sTCt1etE+syh+oO5TU8XdlHCh/o436EdJA61FRZHgwWbBo8sNapvnEWm/JWO7KvAt3JdKOGg2
	TBnfYK1m4q+yDnbQ/2gVFFrDO27uh3KjiaDUAws3vpnphksKoegCt8K6Vmum6CRUw7NYv0el5on
	cne3KiXRbOuP6u5c5TjnW73dRV6qtSGQYPTSwtAuAIsQk87GnGIljn3TBMG9Z2jPzvjaZuNjWJB
	Lq/NBnUQUVfZldTyVEHV+sghGX1KtnB+oUPQENNojJS+Q9p1yfAJB4UoVpInCcJuscpKOl3hvR3
	1Wki+Y9B5pRRR5e/j1/Tr4LdnfTci2X+HAMc03Z92oLMItHOzY8jtHqnUz5wutavFEKN4rxRAKk
	dZYTxoGw0VtIZIvlexq/RA328O64F/Pv3ii1mhY7438M4W2j9bYpFvGrRea0fEO5rY4A==
X-Received: by 2002:a05:6000:400e:b0:432:c17c:3094 with SMTP id ffacd0b85a97d-434cc99cd37mr25319021f8f.3.1768925507512;
        Tue, 20 Jan 2026 08:11:47 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:73c1:f0e1:c420:e523? ([2a05:6e02:1041:c10:73c1:f0e1:c420:e523])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4356996cf42sm30553088f8f.20.2026.01.20.08.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 08:11:47 -0800 (PST)
Message-ID: <dedf467f-594a-4039-8baa-f43744463b1a@linaro.org>
Date: Tue, 20 Jan 2026 17:11:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] clocksource/drivers/imx-tpm: Support building
 imx-tpm driver as module
To: Daniel Baluta <daniel.baluta@gmail.com>,
 Zhipeng Wang <zhipeng.wang_1@nxp.com>
Cc: tglx@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com,
 walter.chang@mediatek.com, jstultz@google.com, amergnat@baylibre.com,
 aisheng.dong@nxp.com, jindong.yue@nxp.com, xuegang.liu@nxp.com
References: <20260119095511.3030739-1-zhipeng.wang_1@nxp.com>
 <20260119095511.3030739-5-zhipeng.wang_1@nxp.com>
 <CAEnQRZBf6ymmrHUVXPdvQ3pQWwhON-dCqJ2v8FZPRBEo-X=zPQ@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CAEnQRZBf6ymmrHUVXPdvQ3pQWwhON-dCqJ2v8FZPRBEo-X=zPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_081149_976225_92B0FF17 
X-CRM114-Status: GOOD (  12.78  )
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

On 1/19/26 11:38, Daniel Baluta wrote:
> On Mon, Jan 19, 2026 at 11:56 AM Zhipeng Wang <zhipeng.wang_1@nxp.com> wrote:
>>
>> From: Jindong Yue <jindong.yue@nxp.com>
>>
>> Change defconfig as tristate type and add platform driver
>> to support building it as a module.
>>
>> Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
>> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> 
> So you can now select the driver Y/M/n even if no COMPILE_TEST present.
> 
> I wonder why we needed the `if COMPILE_TEST` in the first place. But anyhow,
> this change looks good.

The logic is to keep the timer option silent and let the platform's 
Kconfig to select the timer driver when enabling the platform.

Then we wanted to be able to compile-test those drivers even if the 
platform is not selected.

Now we want to choose between module or compiled-in.

I'm not sure if we really want to manually select the timer driver or 
switch to module.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

