Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED146C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 07:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U35Tuh3fsXNId1IsdC0vmSFqQYeyPZ+kGx2SQzpFjfM=; b=gS5UwpIwzfz6hL
	M88Z7VJiXn4/U0Z2ujTDvj8pDLng6ka8yNmMsOmbpLP8jMIMIC+YolCoZtjMDvMacPN4KTkoCGuSG
	TSQigMLTn0aol/6V0BnqGQT8OZnMUjSifRhYdKbrpzgMrmmBUdglMGPY3wSZXaFEF3n3yMwyIXaXh
	TVc3etomwR1CzggLzIP4qzZFTM4KbddkNCOMhxKBTDS5g7KcMXIwOMIsGm0dxPoDPgp8VdspyJyF7
	HlxSLZM+KbEe0nCkUlH1KxITFodfR0Mq4Pogn0OZyct/6rOdYtttKmsx4pSS0IKGc1C2gO2zh83Um
	J+TKfEJOWScZMkb5ptrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMlmj-00D4kO-Eu; Wed, 23 Feb 2022 07:10:01 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMlmX-00D4hQ-2T
 for linux-mediatek@lists.infradead.org; Wed, 23 Feb 2022 07:09:50 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3FFC9402DD
 for <linux-mediatek@lists.infradead.org>; Wed, 23 Feb 2022 07:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645600182;
 bh=nimhNkIt7mdxahM9C8qO53ZAeN7FCRJYbKKsVkt4SHg=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=pWNgBR86IA0p/Davm1YfHEs71H25V07UDz7SAKnXauSQGFqQltoAgYo9Aiwc9eSc1
 hr8EKqOLsx3WrT/5d3ue+M8L9K/9XRrjl9LuRm7wBAVJduPGSjDd5VR9p6wJpCjmZp
 UY6WY0PFsbAOk/9WZf0Er6mfQGa09P05Ak8Z9TDcj2btsVZ9/Jv8Tui59rieH++Vmv
 +WHdshe4iNfle0iYtozepgMZV4Px2vYz+QLGGkj6M71Xq0SDdAlWpWEmol2EaVK7DI
 eBhx7D9LipuQ67eVGxAK/skaDl2e9Dz5CHHmwT9iM9Dmt9jq83IdrKjwUrPh9u6cSD
 PFNya+ZupS38Q==
Received: by mail-ed1-f71.google.com with SMTP id
 d11-20020a50c88b000000b00410ba7a14acso13155980edh.6
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 23:09:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nimhNkIt7mdxahM9C8qO53ZAeN7FCRJYbKKsVkt4SHg=;
 b=m863jG/kBEj+oNYNs2z023VNis4aXoRgRmRY0vnxh8d8nPbnnC0WyP78YAZn8RhodX
 JvWDhyeY3xnWEIHWDQ41kXtA2WBukG39EMKfqsZzO9wDIIGbzQZejaHL9uaEaL7C6WOQ
 DYCnaxc5HfBxW/IbjPLsXsN0FW9q3d6vIB1yjTVA0Z+XO0g76E7ViOSkK+kFXobFAXRG
 6I9vTQ9ZFxCM0J2PQvlnt/vO1u3olcuG60MnJPeO8skeZYZCg477IsrAq7hsSslIiAvl
 KUZaPnjqq/MwdOkbsDA4+Q6VDp9v/Agy41v9OWJtx2otaNoEpju7/kYqQLg7IJbz2cmw
 /f2Q==
X-Gm-Message-State: AOAM532+iaNfF4pgIzvcAZWZhZ3G9xJM91DE7m2D00ek7cj3ytioGefM
 lakgfqt/NzPWTSw2lYx+qhjLTTEZFB+bm1jv46TXfuSFe65K9qEGLKcb1KKTvpYRAQpsDfXU91U
 3Vj1ovS4S1zmTzmdMAm/bv2T/fmTs0Wkelb/yIjxgu5apCoAeww==
X-Received: by 2002:aa7:dd9a:0:b0:410:b875:ab95 with SMTP id
 g26-20020aa7dd9a000000b00410b875ab95mr29494458edv.248.1645600181713; 
 Tue, 22 Feb 2022 23:09:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzCfvOZRfs9gbRYzkE2QJAiHsybZmRR4vAzmtPrnH3egKFJYppepwp/EaGxvawIkcSpK6J/A==
X-Received: by 2002:aa7:dd9a:0:b0:410:b875:ab95 with SMTP id
 g26-20020aa7dd9a000000b00410b875ab95mr29494428edv.248.1645600181505; 
 Tue, 22 Feb 2022 23:09:41 -0800 (PST)
Received: from [192.168.0.124] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id kw5sm7198688ejc.140.2022.02.22.23.09.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 23:09:40 -0800 (PST)
Message-ID: <18bdf4ae-c445-ad10-b344-324436cbe445@canonical.com>
Date: Wed, 23 Feb 2022 08:09:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: (subset) [PATCH 0/4] mfd/pwm: dt-bindings: google, cros-ec:
 include generic pwm schema
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-mediatek@lists.infradead.org,
 Douglas Anderson <dianders@chromium.org>, Lee Jones <lee.jones@linaro.org>,
 linux-pwm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Benson Leung <bleung@chromium.org>,
 linux-arm-msm@vger.kernel.org, chrome-platform@lists.linux.dev,
 devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
 <164557235424.1264579.14486504733557463529.b4-ty@sntech.de>
 <20220223062233.4m2xejozz4d47gmo@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220223062233.4m2xejozz4d47gmo@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_230949_410318_00FDC2AC 
X-CRM114-Status: GOOD (  15.12  )
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

T24gMjMvMDIvMjAyMiAwNzoyMiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGVsbG8sCj4g
Cj4gT24gV2VkLCBGZWIgMjMsIDIwMjIgYXQgMTI6Mjc6MDhBTSArMDEwMCwgSGVpa28gU3R1ZWJu
ZXIgd3JvdGU6Cj4+IE9uIE1vbiwgMTQgRmViIDIwMjIgMDk6MTk6MTIgKzAxMDAsIEtyenlzenRv
ZiBLb3psb3dza2kgd3JvdGU6Cj4+PiBEVFMgcGF0Y2hlcyBhcmUgaW5kZXBlbmRlbnQuIE5vdCB0
ZXN0ZWQsIGJ1dCBJIHJlYWxseSBob3BlIG5vIGRvd25zdHJlYW0ga2VybmVsCj4+PiBkZXBlbmRz
IG9uIHB3bSBub2RlIG5hbWluZy4uLiBJZiBpdCBkb2VzLCBwbGVhc2UgY2hhbmdlIGl0IHRvIGNv
bXBhdGlibGUuIDopCj4+Pgo+Pj4gQmVzdCByZWdhcmRzLAo+Pj4gS3J6eXN6dG9mCj4+Pgo+Pj4g
S3J6eXN6dG9mIEtvemxvd3NraSAoNCk6Cj4+PiAgIGR0LWJpbmRpbmdzOiBwd206IGdvb2dsZSxj
cm9zLWVjOiBpbmNsdWRlIGdlbmVyaWMgcHdtIHNjaGVtYQo+Pj4gICBhcm02NDogZHRzOiBtdDgx
ODM6IGFsaWduIEdvb2dsZSBDUk9TIEVDIFBXTSBub2RlIG5hbWUgd2l0aCBkdHNjaGVtYQo+Pj4g
ICBhcm02NDogZHRzOiBxY29tOiBhbGlnbiBHb29nbGUgQ1JPUyBFQyBQV00gbm9kZSBuYW1lIHdp
dGggZHRzY2hlbWEKPj4+ICAgYXJtNjQ6IGR0czogcmszMzk5OiBhbGlnbiBHb29nbGUgQ1JPUyBF
QyBQV00gbm9kZSBuYW1lIHdpdGggZHRzY2hlbWEKPj4+Cj4+PiBbLi4uXQo+Pgo+PiBBcHBsaWVk
LCB0aGFua3MhCj4+Cj4+IFs0LzRdIGFybTY0OiBkdHM6IHJrMzM5OTogYWxpZ24gR29vZ2xlIENS
T1MgRUMgUFdNIG5vZGUgbmFtZSB3aXRoIGR0c2NoZW1hCj4+ICAgICAgIGNvbW1pdDogNDc0YTg0
YmU2OTJkODkzZjQ1YTU0YjQwNWRjYmMxMzdjYmY3Nzk0OQo+IAo+IEkgZXhwZWN0ZWQgdGhhdCBh
bGwgcGF0Y2hlcyBpbiB0aGlzIHNlcmllcyBnbyBpbiB0b2dldGhlciB2aWEgYW4gQVJNCj4gdHJl
ZS4gT3IgYXJlIHRoZXJlIGV4cGVjdGF0aW9ucyB0aGF0IHRoaXMgZ29lcyB2aWEgUFdNPwoKSSB3
b3VsZCBwcm9wb3NlIHRvIHBpY2sgaW5kaXZpZHVhbCBwYXRjaGVzIGJ5IGVhY2ggbWFpbnRhaW5l
ci4gYmluZGluZ3MKYnkgUFdNIHRyZWUgKFJvYiBhY2tlZCBpdCkgYW5kIERUUyB2aWEgZWFjaCBT
b0MgdHJlZS4KClN1Y2ggYXBwcm9hY2ggZ2l2ZXMgZmxleGliaWxpdHksIGFsdGhvdWdoIGBtYWtl
IGR0YnNfY2hlY2tgIHdpbGwgc3BvdAp0aGUgbmV3IGVycm9ycyB3aGVuIHJ1biBpbiBQV00gdHJl
ZS4gTmV4dCB3aWxsIGJlIGZpbmUsIHRob3VnaC4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
