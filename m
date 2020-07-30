Return-Path: <SRS0=dQnm=BJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B389AC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 09:02:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8247B2075F
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 09:02:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PssGJRqF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Isjp6sJO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8247B2075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WhUbTB2VVNY0VTBCAnm8kcRPl/UBECIKsfZp/CO8oXk=; b=PssGJRqFNqaDrlciPW5rbMMbi
	PWvyFObJqmDfH6+QvDzE8mvlcu7M6TFwva96al2BgVSlVKuJ0weqfkHF2hAePXcCHBEPYD8x4/Su0
	phHMO6umC0Uw3/fB1QRAaHM06OHaFf0/AiclL1uun2rLD6BSGcYscYSep72ieNQnlAX6Kr2GEYQpJ
	Cjetw0aYrgBb3N1vRKNl33CqkuK/MjMTFlDO6u5uJCL8VEKdB4vlbL/QAr3PG9v9y+QMuBE3/QJoX
	maxLQLxJf5TJovxZwMRfxEB0RcfD4iDcwZBO6QsBG7C+4UIB8tkduAlMRjmQ8Yid7zcPySlYtTvzR
	p29McI1JA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k14SQ-0001Or-EK; Thu, 30 Jul 2020 09:02:34 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k14SK-0001NO-SQ; Thu, 30 Jul 2020 09:02:29 +0000
Received: by mail-wr1-x444.google.com with SMTP id f18so24146746wrs.0;
 Thu, 30 Jul 2020 02:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6AdvSzH8Ud3oWLaS+qrTxwwZZQDqRX8Mvzyvl4juDeM=;
 b=Isjp6sJOCLivxUv00q7fZSH+/0xUw2/Fz4Kyb1h+QlTNcVydr7vre/wbrI+E1Od6zM
 dOBga5snkHQxgj+j7idiktj7U4baNVv84g5l1v95skr9FA+rp1Ur9VE1G3Zw206gj3Fs
 1Txs3/d+fkTlY4Jxr1JA1bKwhhEQS36mizitqovJZ9YR77gPCiFGxRFCe6vcFCuapP9f
 feay/4KoLVBbPCSN8Q/yUxqFugkeViyWPSAKmmLbcfdWQfLpQLbdVYAtcB66971H3kpw
 VdzDoPThqaiVuB+lZ/hSkNKLRoet3eMcbmLNzOYP4AothWWOEPTnPmzjoq+a2kkxYTW8
 rRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6AdvSzH8Ud3oWLaS+qrTxwwZZQDqRX8Mvzyvl4juDeM=;
 b=eUpJCazJsSMoKyRscWjYhbG1LmbGz+bL1n8v+zD64hPrCJEkDa2MH95QiYUbEnBtmF
 fDL+Z4UxxEjw0jmgbogDWN5eGd6alAlsk5cOAShxyuju2PimeoY2fhD0bo4opZWL9bWb
 KBeqyj04utdA17sfjM3KsdCcVCXwxAGt5lNrJlies8j6/a6Oxwo/t0kIFCwFsNjyhyau
 Ehz4VUiRiHKJkMT5/hfI/g9LSR5YFe9YNX1kDlnRxjthb3yNvg9uuzHcAzJRvoAEuxbj
 /psN2YwbUYIqrDGLb30yAjmmBjKdu5JGJ8RP2xf1xXGh3P1Cspm4RMLkhVFiRYxcp4Eu
 GzRQ==
X-Gm-Message-State: AOAM533bmsAFbIY2EkihOdgUp5R3O8yzmY+LlFkWdhbJ2xUoExFcA8fH
 PQVp/BBCPH9d4Y+FmzXgloANf4A/67E=
X-Google-Smtp-Source: ABdhPJyf7RFP56DLxmpIyOGANhgyPuiolEwtFsmlL7gEqELMH0knJsUDmjdz1zG9fOpI5LqQbHF5jQ==
X-Received: by 2002:a5d:414e:: with SMTP id c14mr1991900wrq.57.1596099746227; 
 Thu, 30 Jul 2020 02:02:26 -0700 (PDT)
Received: from ziggy.stardust (81.172.57.81.dyn.user.ono.com. [81.172.57.81])
 by smtp.gmail.com with ESMTPSA id
 g25sm7619605wmh.35.2020.07.30.02.02.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 02:02:25 -0700 (PDT)
Subject: Re: [v2,1/3] dt-binding: mediatek: mt8192: update mtk-wdt document
To: Crystal Guo <crystal.guo@mediatek.com>
References: <1596016922-13184-1-git-send-email-crystal.guo@mediatek.com>
 <1596016922-13184-2-git-send-email-crystal.guo@mediatek.com>
 <c6ea8852-0381-0924-185e-083ea167f8fa@gmail.com>
 <1596072913.11360.12.camel@mhfsdcap03>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <47a351dd-7b67-6280-a80f-c5299a4f260a@gmail.com>
Date: Thu, 30 Jul 2020 11:02:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596072913.11360.12.camel@mhfsdcap03>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_050228_933786_87A236D5 
X-CRM114-Status: GOOD (  19.35  )
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
Cc: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 =?UTF-8?B?U2VpeWEgV2FuZyAo546L6L+65ZCbKQ==?= <seiya.wang@mediatek.com>,
 =?UTF-8?B?RXJpbiBMbyAo576F6ZuF6b2hKQ==?= <erin.lo@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 30/07/2020 03:35, Crystal Guo wrote:
> On Wed, 2020-07-29 at 18:18 +0800, Matthias Brugger wrote:
>>
>> On 29/07/2020 12:02, Crystal Guo wrote:
>>> update mtk-wdt document for MT8192 platform
>>
>>
>> should be two patches. one fixing the compatibles and second adding new board.
>>
>>>
>>> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
>>> ---
>>>    Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 5 +++--
>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
>>> index 4dd36bd..e36ba60 100644
>>> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
>>> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
>>> @@ -4,14 +4,15 @@ Required properties:
>>>    
>>>    - compatible should contain:
>>>    	"mediatek,mt2701-wdt", "mediatek,mt6589-wdt": for MT2701
>>> -	"mediatek,mt2712-wdt", "mediatek,mt6589-wdt": for MT2712
>>> +	"mediatek,mt2712-wdt": for MT2712
>>>    	"mediatek,mt6589-wdt": for MT6589
>>>    	"mediatek,mt6797-wdt", "mediatek,mt6589-wdt": for MT6797
>>>    	"mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
>>>    	"mediatek,mt7623-wdt", "mediatek,mt6589-wdt": for MT7623
>>>    	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
>>> -	"mediatek,mt8183-wdt", "mediatek,mt6589-wdt": for MT8183
>>> +	"mediatek,mt8183-wdt": for MT8183
>>
>> We will need to update the DTSI in a seperate patch as well.
> 
> Yes, this patch is based on
> https://patchwork.kernel.org/patch/11690401/ , which modify description
> for mt2712 and mt8183.
> 

I don't understand your comment. This patch modifies the binding. The link you 
provide is from an older version of the series (which is called v2 as well...)

So repeating myself: if you are updating the binding descritpion you will have 
to update the dtsi as well as otherwise the binding and the dtsi are out of sync.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
