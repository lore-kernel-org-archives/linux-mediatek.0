Return-Path: <SRS0=ivGG=LP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26EFAC4743C
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 15:32:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E95E66113E
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 15:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E95E66113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=EE76fbtEqoh0IkNUXFFIaIenzwYx6s9kTqc29kGwWQ4=; b=LHNjBXro8alYmzgEQ6JJ5Qf69x
	D7+ys5eQU2Nid6TUPPAFSIj5PdIV5pJizgudGXxLV8K6ixeLgjaByYXRS7CVU/VHSg+xn37r8wOg1
	3NwSU9F3u8muic4UVUVN4yGlLdqUxte0GbJ3PAk6C9GtYYOr85nXdN1qAGj1vLfnpRd9vvdhe9VGJ
	GRJl0h2b+6IrWlnbEdCdZoYBFzAM1ecbdVXsUbwGgG9w/lwX5wPDd3VoC2IVdaWoarhX8VxX+Kqrw
	0/9IKQ78SkpZ2EhP3nXMCAY8cGeRN2asscPayJpNU2q6efg4IftSUUN0qXCP9SKJMy3EVLW4DRKyC
	lIgpDiUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvLuF-003w32-He; Mon, 21 Jun 2021 15:32:11 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvLto-003vwu-It; Mon, 21 Jun 2021 15:31:46 +0000
Received: by mail-wr1-x42f.google.com with SMTP id r9so20163895wrz.10;
 Mon, 21 Jun 2021 08:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5Avdk1cUnyC3+7ojOpNcEOTf+b0zh4pnCSxeUUKvMgU=;
 b=pb7zUMh4jKMQrXlWGF+7NuVNDCPEG6tfXli5PjjwPOJ6HZl6kEKtEt31V353GSH8N9
 azwWA9imwKfh5CyHXlWxxZBRs0P0k3+3BnlbFbjrBWqaFJJ0CclGEblfvKg+SDGE8oRf
 y94s2Ixn2moENrpLEj/jHRig8K260Bft0Q34xERqDtL4hFYOj0GujA/2FIfC+jFoTI1x
 WF3KUpkLkdCgn5OGezzuRkZ0oFfywS1Bggv9Ux0hseaBKLSZZ9MAdNzkWmfYrrdEwtBf
 QCcojUWBn1A567DX5L7JjLnC1o81ffrGqH2MG8blB7i7fWalU/5Kd1jgpybsAnlJLRmY
 ByiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5Avdk1cUnyC3+7ojOpNcEOTf+b0zh4pnCSxeUUKvMgU=;
 b=GH8xDUyHMnGavKMb4LqmdIn0PaMX8VcVgNoe5pc1nkx131K/mn7NE4FVXoYt/QiDuu
 WxtH+ZGQWqNd2xc4dM0Z0UJz4EvyFtsC2GyNpCQ/aWC4prmD6TtY2XdmTaPMeTa6PJ/G
 rHW65qDK0CTFJvEkX3LcVeqYWHfmMCdK8EC0cDyz0vzUjTeQD66X1PwcSyQonQYBgluH
 d5xAigcQCcxOEQfaTDJuu5dCp4zxYu95MSoCy7FFbvC6K5RRPn5/GWc4UI7zyJmeSdJO
 ksYCSvoAeqK1vw7OMHxomMLSs7V+BYg2sHH3fOCVclhePrMYfPrr3rJlhF14F67nsxmp
 NPVA==
X-Gm-Message-State: AOAM533SR086cKJ9LR3UXXEeqB1vJ/s7Xo/0o+ojW9UmPITVqSjMAH02
 mMPXWkNSZ0Duc+a17ijK+vQAc+k3XKihDw==
X-Google-Smtp-Source: ABdhPJwsdPv8YPaJiJ+psK8OYI/7K0cxWXu8s9IqZypjDJJHlYTbHy6awnRQ23P4LyPYJmXCXSph3A==
X-Received: by 2002:a5d:5401:: with SMTP id g1mr29225427wrv.373.1624289503156; 
 Mon, 21 Jun 2021 08:31:43 -0700 (PDT)
Received: from ziggy.stardust (81.172.61.185.dyn.user.ono.com. [81.172.61.185])
 by smtp.gmail.com with ESMTPSA id k13sm4506181wrp.73.2021.06.21.08.31.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 08:31:42 -0700 (PDT)
Subject: Re: [PATCH 2/2] dt-binding: mediatek: mt6779: update spi document
To: Mark Brown <broonie@kernel.org>, Mason Zhang <mason.zhang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 wsd_upstream@mediatek.com, hanks.chen@mediatek.com,
 linux-kernel@vger.kernel.org,
 "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <1623721803.24597.9.camel@mbjsdccf07>
 <20210615111426.GC5149@sirena.org.uk>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <732a8061-e8be-5c8a-ea75-6da87947db02@gmail.com>
Date: Mon, 21 Jun 2021 17:31:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210615111426.GC5149@sirena.org.uk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_083144_678695_C9FC4DBB 
X-CRM114-Status: GOOD (  13.29  )
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



On 15/06/2021 13:14, Mark Brown wrote:
> On Tue, Jun 15, 2021 at 09:50:03AM +0800, Mason Zhang wrote:
>>
>> this patch update spi document for MT6779 SOC.
> 
> I don't have either patch 1 or a cover letter, what's the story with
> dependencies here?
> 

No dependency. The dt-bindings was just send a second patch in the series. First
one can be found here:
https://patchwork.kernel.org/project/linux-mediatek/patch/20210613055458.6073-1-mason.zhang@mediatek.com/

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
