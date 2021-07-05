Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 739E0C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 15:45:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 376EE61278
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 15:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 376EE61278
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3inWhwDZpvDeH8irwJ6nmZL8ZjK97Ul1oXmwUZhP/DY=; b=31ULVu9RzsAClh+IlUpsG1kOw6
	XVo82zRf/LtOut4jHabntS8VyJQuQFofaafHwj852qCm/ykiEvOMbn23Qn1bwwcEHRT7K224j5yZ5
	EGCWbzMY2FD6w8jTNC2FzjmB+OEUo7/aW1QL8Ujf5c0y/Gr1cQqmScgCoSfZoJiZCGplKzGzWNVGv
	YiG3MBflyaCaHAU92OpR5eDblTArk5D2ZbPuvHtuUmiS2KkWlshU9BSC8HP0nCET8sSdK8Cp01Ni4
	63O+Ap3YF/z3BKvy00NOPgLUK3HkIdVoPsimmtSoPo0Gk0PbBN9feYoDkQ1j1d48wWJvf0cnaXAUf
	8rTf+pgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0QmY-009PfD-VF; Mon, 05 Jul 2021 15:45:14 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0QmV-009Pe9-Sx; Mon, 05 Jul 2021 15:45:13 +0000
Received: by mail-wr1-x429.google.com with SMTP id a8so10911650wrp.5;
 Mon, 05 Jul 2021 08:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iRm7ng62vz94LNteI1Cih0zeAdgyP1p1V+2xJCFvsqg=;
 b=VKCvWgx307Vniav5+5GwJdAoX+BqLeBProcFBWAg1Db+3j859JQYDj247SVBafkYz6
 tp3+x3bLx5Wq9bbY3k5uQWCBDyVRH6A8ILbuys1nMGOFw44HHEteT6ZLYgzVqj4WYhhd
 h7RMf1Z+1W/z6H+JYAK+u9jv/TkqCFSRWe9o69Nhv1sfaFpsiKtbZvjJ89VHwU90ujhW
 4axxUUHR2NVjRciPhafM1vWaObcE3qqgdp4o/nPV1bdtbdn6acDXtJa/UHrF61BBSJ4M
 mHpT7TTEhMn8Jq6729O34Yhk8jZiSX5cT+QYsciOIOgPJjQa8f5oS0ASk5/rM1kMWTax
 Pf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iRm7ng62vz94LNteI1Cih0zeAdgyP1p1V+2xJCFvsqg=;
 b=jXs/XDVe8o0iGgrPxJ8qjBeswPdsrk9H4J5WoTxvItJYE2w12wKkFXFtPsAFfPz2fY
 DeHQidemJmafAZoSrrhOy1AErseZ03DZBM3hEJZyKG8xhhtJXjTckFmD+eL4BX3EEhbI
 W6gzgqGniFV/Edzk6Dkq4dALEjzsHqdbelBRpP8vSFfjmHXuHNVRcTolDgdE+Ni2IcYL
 anyjSXL34Ig+DxtUB2Hy+GyIVpJJWhICzZQkzibWd1bn/wNk2GVcWzkqm4N3p5dUv1S3
 5Pu1JegNlIC3f31Tlm6Llu+CMOUeGGn22Sftb0QeAB6jXs8u3MUIaylaqWR/8OqZpAWa
 g2aA==
X-Gm-Message-State: AOAM531QM0nykMhZMUSNp+ItZDg33Rm69VtlDfqonE+0DuxTBA2eu2RR
 kHq02b3EGB37QljKHzSNieo=
X-Google-Smtp-Source: ABdhPJzc63RLP0dLTZRU0oPe/Q+B3XBpkwNbTucwsbP8b4phCD5U2diRKEdWeN26wMIkt907FvnvNg==
X-Received: by 2002:a05:6000:118d:: with SMTP id
 g13mr16362365wrx.191.1625499910517; 
 Mon, 05 Jul 2021 08:45:10 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id v25sm13917133wrd.65.2021.07.05.08.45.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 08:45:10 -0700 (PDT)
Subject: Re: [v12 02/20] dt-bindings: ARM: Mediatek: Add mmsys document
 binding for MT8192
From: Matthias Brugger <matthias.bgg@gmail.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20210705033824.1934-1-chun-jie.chen@mediatek.com>
 <20210705033824.1934-3-chun-jie.chen@mediatek.com>
 <564fa3c8-1d85-5e98-f3f9-f83cb17e905a@gmail.com>
Message-ID: <15d27282-54b2-2cfe-7f44-2df3be11dd40@gmail.com>
Date: Mon, 5 Jul 2021 17:45:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <564fa3c8-1d85-5e98-f3f9-f83cb17e905a@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_084512_011071_A63A6F89 
X-CRM114-Status: GOOD (  13.69  )
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

On 05/07/2021 17:40, Matthias Brugger wrote:
> 
> 
> On 05/07/2021 05:38, Chun-Jie Chen wrote:
>> This patch adds the mmsys document binding for MT8192 SoC.
>>
>> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> 
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> 

Of course, that's not what we need here...

Now pushed to v5.14-tmp/dts64 until v5.14-rc1 is released.

Thanks!
Matthias

>> ---
>>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.txt          | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
>> index 78c50733985c..9712a6831fab 100644
>> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
>> @@ -16,6 +16,7 @@ Required Properties:
>>  	- "mediatek,mt8167-mmsys", "syscon"
>>  	- "mediatek,mt8173-mmsys", "syscon"
>>  	- "mediatek,mt8183-mmsys", "syscon"
>> +	- "mediatek,mt8192-mmsys", "syscon"
>>  - #clock-cells: Must be 1
>>  
>>  For the clock control, the mmsys controller uses the common clk binding from
>>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
