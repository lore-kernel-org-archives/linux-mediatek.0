Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27DBC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 09:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qE9mdmsyJQtGKBgpNM3ZhupdifZiCFOxfnATGnOvuoQ=; b=Lyn3s3piRdw38H
	HPfrKUVX+Y0FczAhwzBNyJpvzF1BniJ3MpzFSnaPgC4VWFsLS21cLcakqNwmGyoYK3/DbPe+C3HDm
	sTO4RJf7Fe7ThcbnHipsDmK58Ve/DO+pPxuTewK/DL0fMoAja0oH8S2i1lxNBwtOwxaGFSX0VX7R6
	krdGEO/6LxX7cBpV80x5hOFm+vwpmA45MV4byHQav8p9OI5LTcwjC7Glpmr2/SGBvio2GLPr6N7eJ
	umDl+9dJoOr1/mIRPzwWdLbQMR7ZPSzhpFkeQKCHgE6OU8sgEmwxDReba6NHHVBvXAMhV+hVl9F+t
	x+AG0ISsixzd9vrXEOFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npRJc-00FFC8-Ng; Fri, 13 May 2022 09:10:28 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npRJZ-00FFAr-U9
 for linux-mediatek@lists.infradead.org; Fri, 13 May 2022 09:10:27 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 l38-20020a05600c1d2600b00395b809dfbaso4113261wms.2
 for <linux-mediatek@lists.infradead.org>; Fri, 13 May 2022 02:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BrOxhRUoooC0kH9tEPV399N3JU8sJpv2KsNk4UVb2w4=;
 b=UGSwCrkguUB5SuYsjxnvBojDwnjb2CltVr/L7IlZZ0ptUmLxjMOidyA6cfuhQyO2xE
 B3DzWfJyXnrOEiI6PRDwFreXQIAMcoHx52owWqjvRpcc0PYMcxqGY2T5n9I1XBGXWRs+
 o4fPluGHc3/YD2+QKJ8XrdNr9TD+Gj46NJRBxmjAJ8zM8BXd2BMQ/6R6xiE3lJ2FNjTO
 Sxb3/Tp56b07Sk/Lze/zS8Vl7NgmsekqmMQH0FhH+Lm5ZXsl3UWYXVtNAqJ1c8ns1XJa
 IR9ErR3Sjgs2cyAgnBgANv8+mrch+slFAMTzA/ZkulK/DipcfhTsCRtcMwigTFbjsODn
 fVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BrOxhRUoooC0kH9tEPV399N3JU8sJpv2KsNk4UVb2w4=;
 b=Gpne6pNXZiXw0UQjhBuITYgQTvfnzt5iuV3Z0Ana9muL17OFYcfFvrSGaNxe/hm+4z
 tx1y9y7eQEFL+Tl2SjWcB6lSIuOoRmX1be39YKGf+I6uGWNOmmFIGyiS/zGHg/JWuvts
 R8elWzof3MKp84aqTxcl2tvZunrbwng4MGBEZcON5pAYPS/qXeeK8LdEEkhXgtD7bLPu
 Mj0obz8sIHeuV7joCvVj5VoWK/gXxyoPZ2bI+eqm+aBIMABYjxodOSIbvEAi6MOCyVyM
 Ox7Zo/ndxsi8zWUQZLh2nHqOt0qU8hxnB19Vglrmu3zxtQO6oD4AyJJqoL4ar3VyGBTh
 sTlA==
X-Gm-Message-State: AOAM531TmMhATab4//Jev8mBWQryRu+iVgcMrKmLxiqGaKDiGrH1gRVq
 5i4wfmsY5pDYA+y8v4ZpM+5WbA==
X-Google-Smtp-Source: ABdhPJzhMGwirlKWbw2hEK5KLaTvopEtq9k6u9Y/vd9AS6/zhw1siqA75kPP7+4s1kJQP8T3LgB9Gw==
X-Received: by 2002:a05:600c:19c8:b0:394:7cb0:717b with SMTP id
 u8-20020a05600c19c800b003947cb0717bmr3679904wmq.136.1652433023780; 
 Fri, 13 May 2022 02:10:23 -0700 (PDT)
Received: from [192.168.0.169] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 x14-20020a1c7c0e000000b003942a244f3fsm4694210wmc.24.2022.05.13.02.10.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 02:10:23 -0700 (PDT)
Message-ID: <69c4df5e-6a6f-f74d-349c-bb16e523208c@linaro.org>
Date: Fri, 13 May 2022 11:10:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 05/16] arm64: dts: mediatek: asurada: Add system-wide
 power supplies
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220512205602.158273-1-nfraprado@collabora.com>
 <20220512205602.158273-6-nfraprado@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220512205602.158273-6-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_021026_010967_5A7CFA3A 
X-CRM114-Status: UNSURE (   7.21  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMTIvMDUvMjAyMiAyMjo1NSwgTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gd3JvdGU6Cj4gQWRk
IHN5c3RlbS13aWRlIHBvd2VyIHN1cHBsaWVzIHByZXNlbnQgb24gYWxsIG9mIHRoZSBib2FyZHMg
aW4gdGhlCj4gQXN1cmFkYSBmYW1pbHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4g
Ui4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgo+IFJldmlld2VkLWJ5OiBBbmdl
bG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJv
cmEuY29tPgo+IFRlc3RlZC1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zdEBjaHJvbWl1bS5vcmc+CgoK
QWNrZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJv
Lm9yZz4KCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
