Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED543CCF2C7
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Oct 2026 23:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NIfxed9xRh6p4p/w17T6098/U45mW63EwJ8GFmqGUTs=; b=g/BP8voROQoE7iYy5dYWPVFeYm
	BoC5JNH3qCqgrlzWOgE1CtsTheK1ERSx8dH8YHovHcmxfrgOZQBD8iQN1cqlybS7Hlxx2hGBr1SPC
	SgekP3FP9F0bk+igxzS3d/El/iUp+/DPmZWz5M+weg9bB0PSlEPzJVY/liQrpIHB6/lGHOTrE8/VS
	R3uhf1zporQXmiuuZ9PDkrXJ+FcLZ+ZZCZWrSryslZJ5SbeG27e3OIQyg/4aLz6gxFiew7tC3Z5aa
	Gi2hYGNySsO5VdVSlNfm+Vx4PTaBqUnHXVhtRjPu7yzJ2VbHYgyA86isdFI5lOJhgtu92ErejXIGR
	MEx+V5Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIDQy-00000005JBo-29lu;
	Sat, 17 Oct 2026 23:03:24 +0000
Received: from mail-oo2-x06.google.com ([2607:f8b0:4864:31::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIDQu-00000005JBC-3NUA
	for linux-mediatek@lists.infradead.org;
	Sat, 17 Oct 2026 23:03:22 +0000
Received: by mail-oo2-x06.google.com with SMTP id 46e09a7af769-8217177c5daso203528a34.0
        for <linux-mediatek@lists.infradead.org>; Sat, 17 Oct 2026 16:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792278199; x=1792882999; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NIfxed9xRh6p4p/w17T6098/U45mW63EwJ8GFmqGUTs=;
        b=B4KNK1OJ2UyTP8ABqfHDW6od9bI/mvVtVjJsH4uUVQPPo5BtIXd8xfoxzMpCCagUAQ
         H8uS907UKQ5LpnjPPscO+WdA3T7vKOZAPY5rrwFxuaJQPvF3otEh4Mj9WNxE/GnWNg7t
         ASdUmpy08snjkXUEtuSPfJOI2KwDSQFLRY/YRPj88nSqIGtC0r8dS0pOlHlWu+07j2YD
         upULgCbKhodwD9IZvx/u1iuRnizvsKufC/utGCNduo4+TTsJ5kOYXGly+w/8TP/nVNp1
         qCs1jfmOciiyanePZlL7ak1KvjruXrMeZoW2WuVxo6oxW4VjlGx2Zm69aSj+8mMoY5VL
         jP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792278199; x=1792882999;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NIfxed9xRh6p4p/w17T6098/U45mW63EwJ8GFmqGUTs=;
        b=kYkRWV01Xko2gJPzsFYzTUj88faigdZNuZGvQAT+pKrAYJqXAaMkwP+CIppp+yxjfX
         GtIQ33w8w2n75CR/UJxOdOfFOztSv/xzsnPfmgAblbEKZa4vMJlNVN466/WR091uuLpK
         gMgZvACcvKTUCD/FjHMgYccCEdcuq6JbYdui5zCZzVhThUva1bkw1TnJgmnteQRMFpHA
         p2rnzJ/qNpn1+RLEulglDnGcV8Gf2qMpjCrGpmNDiwmlfN7K7T3X00XyrpWqALbvvyPZ
         h4E7OWwtRYoW8lPsJrsk8F7PZBDYjgzn5uc6UBGDawYN8dLhNMJyXgvkIr3JFPGG46IV
         UWnA==
X-Forwarded-Encrypted: i=1; AKwUvBwSeOIJ7rfO5lOuLrjxBF4rnqkUmebGxkkRFA1BrlG4DAOE5Ib+cr3vPTTmiHdYbJEiCT4C6gqCgIrXZJfFcQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKXsk4OIRjLSTbI+4EPppaPltO5db1GMrd8iiKzw5ErN41moKB3
	5mNeRBdznexyBtpLO/j9LS6Bd+QOsgcYqmnRCsEHmhO4ChW0eUkBK3mM
X-Gm-Gg: AYBFou2rQMYaesCqIgrm/bAQxwujz1H2TXwxnRN0Bxsyfa9yGt+2t499iUM1A9SFM0K
	xEwdeaJHDJBob+8CTEEtyA0pZNh9WT0ZpX/i7/lpJMe6rYSyhY1YiHDMIXgKJdghQXOQm4F/te+
	OHU0rFYDaoDs3IGgpgzytkSaHBzsPjMuhIaUz2P9L+ecciswTgpRw4YSHGJ2J52teQJ26tyNnpy
	MhIIWb9P1rIriN2klsxQ7zCnkyTqLk8ID8jtDwsYEuM3DxAaUXW1SePxN7GQZjrBJXkPA4hJrsR
	LsjYikQZSirpGXIHKbccEfTJvc8n6pnawcwbpLNtj8vo3WvaXdz5ITD1taTYC1KXL4hY9pTQK73
	a91wzwMExjZ1QSp3ZQclW9F4u6aM6t/SGHhborNAvQxdbySLh3S97WwzeXW1vjLgmLnfgyPBOc5
	IuSTc63RsC1wcJbqo7ueNLT4fhFux1tn84lDMzzk3XOqRSnjjCv4kyUHIIZOVuyrQnWbU17Bhdh
	SHWZA9MJvYUcN0=
X-Received: by 2002:a05:6820:1529:b0:6cd:3ffc:64d7 with SMTP id 006d021491bc7-70357a97e02mr2235388eaf.82.1792278198975;
        Sat, 17 Oct 2026 16:03:18 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::2620? ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70190c1c106sm4927968eaf.12.2026.10.17.16.03.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 16:03:17 -0700 (PDT)
Message-ID: <e8389c1c-e858-4171-adff-5bd94909120c@gmail.com>
Date: Sat, 17 Oct 2026 18:03:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: mediatek: mt6795: fix the FHCTL DDS mask width
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
 <20260912-mt8173-fix-dds-mask-width-v1-2-3d0c0292c85c@gmail.com>
 <88272aca-2a9e-4a75-b7f2-4f7aac8b6d18@collabora.com>
 <1j33ux8of7.fsf@starbuckisacylon.baylibre.com>
 <12e0953c-5181-45f2-b409-05163ab2a031@collabora.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <12e0953c-5181-45f2-b409-05163ab2a031@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_160320_854645_D0F28F09 
X-CRM114-Status: UNSURE (   8.82  )
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

On 9/28/26 7:22 AM, AngeloGioacchino Del Regno wrote:
>
> Please collect the changes that I've reviewed for this cycle... I'll 
> start
> sending PRs from the next one.
>
> Thanks!
>
> Cheers,
> Angelo

Hi Brian, Jerome, and Stephen,

Gentle ping, in case these slipped through the collection Angelo asked 
for above: this two-patch series (FHCTL DDS mask width, mt8173 and 
mt6795) and the related mt8173-mfgtop fix [1], both reviewed by Angelo 
on 14 Sep. Neither is in clk-next yet, and both still apply cleanly to 
it. If it's too late for this cycle, just let me know, and I'll ask 
Angelo to take them in his PR for the next one.

[1] 
https://lore.kernel.org/all/20260913-mfgtop-no-clk-api-power-on-v2-1-b84771a3d5bd@gmail.com/


Best regards,
Ryan Brue

