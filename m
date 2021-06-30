Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 019A6C11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 10:54:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4FF061C99
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 10:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4FF061C99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bV6a3OHoixxg+oKCp+SFF0MwYZimWaRz8fGwF9BwshU=; b=SumrSElx4BLzoFWOz3bgPOGEkR
	q0uejsd4zI9tJ9NKRJCTuy6mGKwZ2LNJvA4M9srapzhwa8i1QeHHPn1p9zdkQqJQw5kWwRG1e+fuL
	z6QAf+mjIrxXt3/DytRb7uBrH5gfR77IrH6tqOVG2YAhVltGWO3yzK6WOScAJConLHxQDViO1V+ft
	zEnxOfFfEUJj/oF+UPOHv5rVaTYYu4x7VhJE1goVCGeeFIcX9v3LOAdMujSD93BJlZp7RxfY3/ReL
	EB6nkLRHT7sEoXaDWAXT7vro4OqsM9Kp/pkyvq3D4pIgWc8gEs65HdcmT64dxBYnAssph7vHmRtuq
	r0+7xKAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyXqo-00Desi-G3; Wed, 30 Jun 2021 10:53:50 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyXql-00DesJ-L0; Wed, 30 Jun 2021 10:53:48 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 j11-20020a05600c1c0bb02901e23d4c0977so4122081wms.0; 
 Wed, 30 Jun 2021 03:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PZFzBqSOdUpz5FT+hQMzB/lYUpMOqyWwY2MXqol8E/c=;
 b=CCPqh2dcRpmJ1iA0K0EdwI1Ea1pkAN3Urdc8lYQcKza9hBZhxgi9f+enAwppX9BEAG
 h3UxWGct/W2ghCmFDRvEhjUpZ4DNY2G6i66Uj4grL564A9n9adn5HEFTJJ9j4cRLGoB2
 03LivvjUwnOFYuasEXYxoDluU9F/CVUU8ePE5wU3SYcOmuDfVqrmUILMPbgVVsEIsNw3
 1Tw9iUpxQRxnPDHDrg7WceI2ALjRx3SDqF8JGKXxKBqeztxwx8RPHkMzfNIWyzsfMnHW
 MIYfRchmkE3JLd9uJDRT2g6/NOr00y0y+syiuAC8YsjxFpdz7W200Z2XqVLsXSqKRgab
 dOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PZFzBqSOdUpz5FT+hQMzB/lYUpMOqyWwY2MXqol8E/c=;
 b=K1wlLA1sfPuXapzrhzQZllqB56OLLUu2xEbaV+8566DkeOk4i8jl3Cmc68d5k+vF2i
 QWRqjpRpU08AI8XBFbfCiN+6RocVUmaRyZFO3auufUeGtwad82xtgb7YQ/2jvecGq/7/
 NxgrgOODR3xawPXPWeKoUwkpO1V2u98V2AtzwnXfmO5OPKsrTnOURShdkSYJI9HHkgaz
 bMCC4HqXChU1FxAjLL4/LeM37D5FeduyUlt3xttVGaZaQ8uva4Nh0B7hMqmNxnIrRtjs
 J9f4Iy0ZGgcVAVsMQxUAcIIkDH8MFExkYcV8kQjWx0AGcnf4Hb4/Z5Nr0o5R2lwcchXd
 X1Og==
X-Gm-Message-State: AOAM530LjXIre4FUfMrr1SWlc05aVV2K+88AV1OjFm3KJCgCuSe7CSVy
 /RdaFk2HhGBVGNeVPv+Pg9g=
X-Google-Smtp-Source: ABdhPJxKwjKHQVMFn0QeH9g983FURvqrIYYL21hZCZYr1rBktxqZ/45EQfXuMwY8xvPQjOWp3FOceQ==
X-Received: by 2002:a05:600c:358e:: with SMTP id
 p14mr23666369wmq.136.1625050424146; 
 Wed, 30 Jun 2021 03:53:44 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id h10sm5930905wmb.40.2021.06.30.03.53.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 03:53:43 -0700 (PDT)
Subject: Re: [PATCH 03/22] clk: mediatek: Fix corner case of tuner_en_reg
To: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, 
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
 <20210616224743.5109-4-chun-jie.chen@mediatek.com>
 <CAGXv+5F2zTcqnjH2ud38vUD149KJtgxhPQME2Mk6-vGtQv+2YQ@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <ff6179e8-06f9-fbba-c704-a74381c2149a@gmail.com>
Date: Wed, 30 Jun 2021 12:53:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAGXv+5F2zTcqnjH2ud38vUD149KJtgxhPQME2Mk6-vGtQv+2YQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_035347_741378_8014DDD9 
X-CRM114-Status: GOOD (  14.98  )
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



On 30/06/2021 09:31, Chen-Yu Tsai wrote:
> On Thu, Jun 17, 2021 at 7:01 AM Chun-Jie Chen
> <chun-jie.chen@mediatek.com> wrote:
>>
>> On MT8195, tuner_en_reg is moved to register offest 0x0.
>> If we only judge by tuner_en_reg, it may lead to wrong address.
>> Add tuner_en_bit to the check condition. And it has been confirmed,
>> on all the MediaTek SoCs, bit0 of offset 0x0 is always occupied by
>> clock square control.
>>
>> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> Though you might want to consider converting these types of checks into feature
> flags.
> 

Yes I think adding a feature flag is the way to go. Luckily there are only a few
SoCs that will need updates at the same time.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
