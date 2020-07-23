Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E4BEC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 08:22:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A2E620714
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 08:22:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pwXrE5FW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Os/0wGVh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A2E620714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=75aNKvyWw5LnaESMdYFjxsxkmPOiqXCadFPU3bhNr/4=; b=pwXrE5FWqu8dcPA+JV8tl0bY5
	xxBbDtopYhoSF0ycFRNXLWq55Y0yXQFEQCHG4CzRfZtHw5/5rTRqUOxADGm4DdqZ0ORbw6L3b8DkB
	2HYHunZTjU4jFQKJbZNUqtLUTHJS1VjaP+bc+mJk+ebIAVooEKUBI4D5HbeUZu4aoKXvXFuT+dSl6
	Y3wzE3TOAWRzwjdl0DYmmxDtLphWFRjob86nME9pdjud0b28ce8Rwh7CEPP6geFotVn5ODU6/0KFs
	YJb/f25R4ZCBdMalBydDC8wY4cDGPqIo5B6mlHHZgg55hnBRYGvRRxprSOwBVewAx0EqJpwfMPquH
	Y/PVc0DHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyWV0-0002QP-0K; Thu, 23 Jul 2020 08:22:42 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyWUx-0002PR-IB; Thu, 23 Jul 2020 08:22:40 +0000
Received: by mail-wm1-x344.google.com with SMTP id g10so5975502wmc.1;
 Thu, 23 Jul 2020 01:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QE10UDZQ3r5KctDFG038ZVtepXURxKEMA8qw8LlWSEY=;
 b=Os/0wGVhINaT50kNjojm42n5UockuOvesYAtUK3exVVbKcF5f/N0XQJlTarczwHRKU
 uy4WrGbGX1HgDZMJHOdn3+fUrZAGtEXkfou9SSW+pVYhvrjkV2mNzquCZEHE3xVGY5bX
 yb8pittSkp1e5A7ZkSg9Y0HFp6327SPU3I6nl0kxxOUfWE3jePiiSvpBvwpvjKVJKel/
 kTZsuoKzZsMGOPRrf49CbzEGxqQbmm04QK+emJHbt/jYHbzENz/h8MGC9vyIFLZOOhFJ
 S5/Oh3RUNtI9ver6zN0JtaKBYLBePUSrdcKiCcOCRTMnMZ/BIC8k+OZ6URKGLL3aY+NT
 ERrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QE10UDZQ3r5KctDFG038ZVtepXURxKEMA8qw8LlWSEY=;
 b=M4wXEV/F6WB56OdFv6BwpkCXjGLjAU5IxqQGuOfQBVYDrTvBkEnxTY7unfCLgk2siI
 57PSBwij9PKn4vK/I7venKGTbPOAKU1fEz0DJB6n0sIXzFS8HaRVxsh6WDecfLgF0S6w
 8FpdF0+MCifdjKoFbRJeczLt+qPQ6CZHm+ruuKJA1ap/kKcHJyzX3KS5dYjQRsRlFsA8
 iYJ/5v6BREwI61oaMWq3h9/NQRFve8CYw7ovIXiuaqH2IrmymYi5+8mxAj/APrwu/tv0
 0mg5o4syiC4T16vN9hhF1Ahhx9Ste7qo85N2QYDJzESMIGs7BKoefbE2MnR7G5RXJ3xw
 EHQg==
X-Gm-Message-State: AOAM531XwstnnYI4BRm41U4LPcRGsKcPN197D88fe6q2s2z4D2vChV0s
 O8JR0fQugYWZye4NC7TaYVRNogz0pIY=
X-Google-Smtp-Source: ABdhPJzRo2CpLckZ5BybV2p2mZPEKIPpKjjoDDNVlus8LUvOzoTI2kUV/qOMer0ffg8TPEA8+n5kqQ==
X-Received: by 2002:a1c:df02:: with SMTP id w2mr436740wmg.137.1595492556305;
 Thu, 23 Jul 2020 01:22:36 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id f12sm2805882wrj.48.2020.07.23.01.22.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2020 01:22:35 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: spi: update bindings for MT8192 SoC
To: Mark Brown <broonie@kernel.org>, Leilk Liu <leilk.liu@mediatek.com>
References: <20200721024819.7150-1-leilk.liu@mediatek.com>
 <20200721094859.GB4845@sirena.org.uk>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <2a1cfaf2-0c58-e0c9-7c70-20a2f84321f9@gmail.com>
Date: Thu, 23 Jul 2020 10:22:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200721094859.GB4845@sirena.org.uk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_042239_690137_AEFB9751 
X-CRM114-Status: GOOD (  13.49  )
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
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 21/07/2020 11:48, Mark Brown wrote:
> On Tue, Jul 21, 2020 at 10:48:19AM +0800, Leilk Liu wrote:
>> From: "leilk.liu" <leilk.liu@mediatek.com>
>>
>> Add a DT binding documentation for the MT8192 soc.
> 
> I'd expect to see a matching driver patch.
> 

Well for now the device would match against the "mediatek,mt6765-spi" as it is 
the same chip. We just want to define the binding so that we could add a special 
case for mt8192 in the future, if needed.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
