Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF00C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 10:39:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A58C42065E
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 10:39:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Oo/yGeYr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n0KnHUnF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A58C42065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O4iR9EzMU4yz9SZNkmBOGnOs2vs/04VzgIrH5zhExYU=; b=Oo/yGeYrrkbrNf6kAdYA0CZtU
	SvSd4wUyNe971smV13edP8uk6WLzepqDGPT8BYF2V6VRajQvgfZSwuo7FNJuMYYdP1MuJYfcThx0F
	Httak9QYg1HCJO+G0//iLG3vSrLRVNU6tK9AzMyNKHdEJUdjCrT9Px4fXDU4wZgBvNR1S0WLIqko7
	Bq1k5HGX2vLNb9gM31oMn/HfXk3w7n8EP/IGp/cwmFBOP9ywEqsYmUCDhaS3uzQD6v3dXw9gNo20E
	KFxvxtZ7VXPFEVCTyRfCXZVCAsxON53Uov3sC9FE3Lmb9W7YqxKDf2alk6woCS5DYEseUdlyamsGb
	L6TQKpCJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyC9Q-0008KF-JW; Wed, 22 Jul 2020 10:39:04 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyC9O-0008Ji-B5; Wed, 22 Jul 2020 10:39:03 +0000
Received: by mail-wr1-x441.google.com with SMTP id a14so1405013wra.5;
 Wed, 22 Jul 2020 03:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ITeNa3BddWkWg1sCq5YZx4M2tUONfLIipafvxs1VxQc=;
 b=n0KnHUnFLh8ve9V6D+dpbF/RXarLay2T1FnkRY8aIleKNbJnMeU9NVPDxhDfj++CFw
 OVz/Tceu1VUJJEqJw+lbrIa3A8k8o4c/pa9BQKdxlChPGEJ8YNeEN3ZNOlPLQLFJZ88T
 fdnjBcS/tor9pw19QZI3Yz32IEBj+aMVUo+tJCLTyzXySQds07hGaRcGI2kV/Qn6yJ0O
 w5FFzz050DBXrYURhLbVQzcnMP3n6/a5IkJmivHbTZpYOfMU4AxjKLeDDRmDZyaQq8Uk
 zBiWYk2lzk9ooLw5LH0MAa0oh6lIhmocxUDrFU9XjJcWBRbhNOG14Q1zpWYGMPiEycwS
 yQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ITeNa3BddWkWg1sCq5YZx4M2tUONfLIipafvxs1VxQc=;
 b=LCB3x0aNpVd/a86NVmsw+1sH8+Ihfri3sClApl75d9SE8e8j3OxNT/gcsm4HMsX/VI
 mdOOSPCeotqskLZHooEdACFpm025eUb+9Ol6hUT5a9/CZNpzqrsOk8d9ZUgzsI+FPTfK
 /Upid99JdYLx3S+//1/EUx4QA8irLHk0S+50SOYFPz0QbAVYMgY+26Ok83LZeQa58Mkq
 92BpmMesD4dyCVJmznfFyLbIFMelaXRi7ua9NC4NWmvehksft5kVY//3d23LRcHAdnh9
 MSSEzMKDOwYZdGIV3oQFM1dR90SKLfKsGL7oxi6l9/SqKpFkp4XS2LnxiWeE3O/TuIm+
 DZ8w==
X-Gm-Message-State: AOAM531w/YjVB8eycfTAjoE6KHy6aAum9w/sbmw8oIw4/pNZ0I+Hz9cc
 M9rA8VYRd2LBQIpB6hlC+McwqsRu
X-Google-Smtp-Source: ABdhPJwPB+DNdESb0CiW7c2gGxsBfsnvTy9nDsGNJjwB0czwP+nFniFmLYrTIsBgp7yUsAykIuCI9A==
X-Received: by 2002:adf:80c7:: with SMTP id 65mr31200396wrl.246.1595414341264; 
 Wed, 22 Jul 2020 03:39:01 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id z16sm40020579wrr.35.2020.07.22.03.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2020 03:39:00 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] spi: mediatek: add spi support for mt8192 IC
To: lei liu <leilk.liu@mediatek.com>
References: <20200721122436.31544-1-leilk.liu@mediatek.com>
 <20200721122436.31544-2-leilk.liu@mediatek.com>
 <27e48721-5e54-6947-cd8f-669f4da34c4d@gmail.com>
 <1595407127.31408.3.camel@mhfsdcap03>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <e2736fea-748a-3359-ff04-3669103ec301@gmail.com>
Date: Wed, 22 Jul 2020 12:38:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595407127.31408.3.camel@mhfsdcap03>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_063902_471371_1F542A9B 
X-CRM114-Status: GOOD (  17.27  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 22/07/2020 10:38, lei liu wrote:
> On Wed, 2020-07-22 at 00:44 +0200, Matthias Brugger wrote:
>>
>> On 21/07/2020 14:24, Leilk Liu wrote:
>>> From: "leilk.liu" <leilk.liu@mediatek.com>
>>>
>>> This patch add spi support for mt8192 IC.
>>>
>>> Signed-off-by: leilk.liu <leilk.liu@mediatek.com>
>>> ---
>>>    drivers/spi/spi-mt65xx.c | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
>>> index 6783e12c40c2..3d0d69fe0c69 100644
>>> --- a/drivers/spi/spi-mt65xx.c
>>> +++ b/drivers/spi/spi-mt65xx.c
>>> @@ -170,6 +170,9 @@ static const struct of_device_id mtk_spi_of_match[] = {
>>>    	{ .compatible = "mediatek,mt8183-spi",
>>>    		.data = (void *)&mt8183_compat,
>>>    	},
>>> +	{ .compatible = "mediatek,mt8192-spi",
>>> +		.data = (void *)&mt6765_compat,
>>> +	},
>>
>> That's not needed. We will use the fallback compatible which is
>> "mediatek,mt6765-spi" which will take the correct DT data. If in the future we
>> realize that mt8192 has a difference in the HW we can add the compatible.
>> Otherwise with the binding description we should be fine
>>
> So you mean that only the following binding patch is needed?
> [PATCH v2 1/2] dt-bindings: spi: update bindings for MT8192 SoC
> 

Yes, exactly.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
