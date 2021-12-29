Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A921C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Dec 2021 15:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P+URSqFTLjh0Jl2hWhj+XFdQ7K5PYlEhJxDH63lkF4A=; b=U9OlPmHJ6sGF6O
	LU7npuNqmirgaVmmk6lHv2HOH5Jd0XEb35O/j/jZk/L9KAup7zOce+x6UkvikdKTOx6B8BB1hBRAm
	2JM6RoY2fjUd/P0jVwt7JNGJRB5ar9ascN54Z3nSi7FxPyvuawG1qOMcZaaq60BRFAlkDFoz20WQs
	kDczLIc3jSiJNJsukxzAdnr/PpPxVhH4tCSvyS8JrIXZFDuN4Po/MSSStwXyqceS2XsgNkBCSLGqg
	svPMeI5lWJxOHJYxpnVyMGcM/RzeBnuY198tny7CtQEDzKIH9hq1YVtL68+NhIvPGeqpJegFrzhLz
	pmtB0UokBW4q6dW8VlAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2aya-0031ub-Cc; Wed, 29 Dec 2021 15:34:52 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2ayX-0031tc-Le; Wed, 29 Dec 2021 15:34:50 +0000
Received: by mail-wr1-x433.google.com with SMTP id v7so45056990wrv.12;
 Wed, 29 Dec 2021 07:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WYr35naI3hcDek70Q9WmEYk39oeQb3bTtyy8jRSZRMg=;
 b=CsUCt033ScNlqI8qnWMAo032e43J/hYsrt5/Dr5cMalmTKyaaVzE9RdxURfnmH9Xwl
 0FAZ4KPXBbbwtG2hkNvXZGqa2GncCNOfRd6e4u8u2j2JDpuCpQ2z1HCLhQdD/+RIKRcK
 5fuEGlR8BIPNtwg2IgxHrPTUVVTUpPdKWzMkYQoPduuSBKTeFPKK28Y5sPHSUYlTGBCi
 MggLztuJviQnYGVUd2BPgIOQzzDvwHXjukmOvUUBwQ7tE8wxomXHtIz1UhIUYH+/8Ds5
 unJ886dvqKNEncURnoxGO1P/qfxNW294uheELPlvMOzfjvIpOlvBJbVUVmLA4s3aMlIF
 Faiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WYr35naI3hcDek70Q9WmEYk39oeQb3bTtyy8jRSZRMg=;
 b=fLAnsGggkTiQftlQMbJ1HEQVHMoY6HEOO7kZabxqccqLswjCtPjTKYB6GO5cpNbOWn
 YWePSJ+QTkMEjY/8FyhRa/hzgIyrbWaXy3KIPQR4/+MU4cgjz6fzhfH9zrn/b2Kn9lA3
 qw2P9npSiD3sKGqxSsbZeghSv0lTX+q7QAsrYcswFYOVe9OIrL4YFcgGO3Gs28YH6Qj1
 bqZ6/HTgp1AziWnqedBd/mfmlbEFxzNmLRqPkRxA6X2usM8k1hupopjmeWPmkwgRX90L
 mMvBjwS6lO58we6lidLKi0kGZbu67wkwyt1r3gwnCFdJRQhY7oIQghWmQ2X7e1440D5r
 oOpQ==
X-Gm-Message-State: AOAM530PGXaafw6epfhgkdElKYlFonW9AYkDAOf3B8kcFD0zhDT4MD8N
 egHNnBNdVTYqNOwOS9kkuUs=
X-Google-Smtp-Source: ABdhPJzR7W1Kcy+/Au2+qJS9Ipa/1Z1BmQh+8UXdbyDF0Tq8MQhNpDDVMosskN43on2rB0JNm0gQ6Q==
X-Received: by 2002:a05:6000:18ae:: with SMTP id
 b14mr20303107wri.358.1640792088063; 
 Wed, 29 Dec 2021 07:34:48 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.251])
 by smtp.gmail.com with ESMTPSA id s10sm22047103wmr.30.2021.12.29.07.34.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Dec 2021 07:34:47 -0800 (PST)
Message-ID: <9b16c1c9-7fcb-b717-7dcb-b911dd39a5a2@gmail.com>
Date: Wed, 29 Dec 2021 16:29:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [GIT PULL] arm64: dts: updates for v5.17
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Matthias Brugger <mbrugger@suse.com>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ben Tseng <ben.tseng@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Prashant Malani <pmalani@chromium.org>,
 Sam Shih <sam.shih@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>
References: <0d05e8b6-c56f-bad7-00c1-44682cedb38f@suse.com>
 <CAK8P3a1DaHnf0QOMjuvTYGeUttUNkBLhFu0b-43jBAa0bHtLFw@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAK8P3a1DaHnf0QOMjuvTYGeUttUNkBLhFu0b-43jBAa0bHtLFw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_073449_747579_6EA5EDC7 
X-CRM114-Status: GOOD (  21.84  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Arnd,

On 20/12/2021 17:18, Arnd Bergmann wrote:
> On Sat, Dec 18, 2021 at 9:42 AM Matthias Brugger <mbrugger@suse.com> wrote:
>>
>> Hi Arnd and Olof,
>>
>> Please take a look on the below patches for aarch64 based MediaTek boards.
>> In this round we add support for the mt8183 based Acer Crhomebook 314, as well
>> as we add support to several SKUs for mt8183 based Chromebooks.
>> Apart from that we add basic support to the mt7986 in both variants (mt7986a,
>> mt7986b). The difference between the both SoCs are the pin-controller capabilities.
>>
>> Hope you are fine with this pull request.
> 
> I've pulled both tags, but I have two minor comments:
> 
> - please put "mediatek" into the subject, that helps when looking at
> the pull requests
>    with pwclient, which does not show the author by default
> 

I did this pull request with a lot of time pressure and forgot about it. My 
apologies, I'll try to not forget next time.

> - I was expecting you to send a branch for the new EN7523 SoC as well. Did that
>    end up not making it in time?
> 

As I have seen, in the meantime you reviewed some parts yourself. I took the 
first two patches in my tree, but we should coordinate for the rest. If  you 
want to take it through the SOC tree or if I should take it through the mediatek 
tree. As Airoha is a subsidiary of MediaTek, I suppose in the long run, you want 
it do be part of the Mediatek tree, correct?

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
