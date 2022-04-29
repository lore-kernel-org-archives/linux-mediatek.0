Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34AB0C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 13:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pOCtw4zO/UuVJllW2tT+eG72cVB5QX/xG2EAUFO4ySg=; b=t61qmWHkZbEWVI
	nCgeYQbBKS5MSxfn3WvQRuB/cJ4U2x+KIK2Pb60JIzrta1eGcWmN/JY6aZ/oAAHjg+kTArQvU7ABa
	zZFUUdlU0b9fvGFCYLfRTuuiBU/Uc+96D68OCxm1RJK7N+id5h3eT+HhdTAJM1P5pODwNHRJ9GkuI
	+M42OM2tsrvJ1uPeHgtaHDZdqWZaNF2VreXMOvWZyjfHU6uhiSKEWFvbgQXsu3rpnBT4rHC00Mw3F
	AJDNUzZUuOG964OhYC9oCEGUBeq9maPZ0nqty4Xs3tYnVX7VM0Vioe3F2iIM2xHEKICrkFpZaY2RM
	Un/EHI+1PHQEetxfrF5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkQem-00BMfr-6l; Fri, 29 Apr 2022 13:27:36 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkQea-00BMb2-Bh; Fri, 29 Apr 2022 13:27:25 +0000
Received: by mail-io1-xd2a.google.com with SMTP id g21so9681723iom.13;
 Fri, 29 Apr 2022 06:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LUkIerDD9yFWiQ4XjK59IaNhq21fsN5VuxYrogYKEo0=;
 b=c5HmS9fg/usITYA5aQsq+UT5PKinstTEHXzxuJp+WNbF7kHb07BNF5dCSWubg+XvpS
 RbW/eU9mLwyx1r3Wrto3Bg1hCFsZX6mogDTCLXHeSo1clWNbu0mIc7mXZP42z328iYD1
 81X2iFcf4av/Rhop7TW7zb7gSKWzGCI3mxmEJLkap/lxDRO2unIAIlrjCE2eCjdcsBQi
 8EQNmm5rP0baNIVXgqZIbXmV7ej+C6f9yLcYd42sxjN8stadWOxA6l3K69GcoineDPLR
 LJDLq8UMD3q7tKFwnqeRXssNJWyp/obgVve15VQ//yH48gZPOLWyYAvT9qcfBjDlg6db
 8H6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LUkIerDD9yFWiQ4XjK59IaNhq21fsN5VuxYrogYKEo0=;
 b=xY98sN57FuTitIGEeGhLFs+u7tRJH6cynrhU+K66Tz9/0hjZvxR+1UQOdMDTb/vhfU
 m64whkcfDruJe37+c9YlXztp2AaR3/Dd4GfuzPcKQkh9Gj+wf4xxv4N8xIYp0XEnYiat
 Cc4TDQ6tb7kOzOuKipISeXXuM2o9jhvSgd4E1rPLLC0fct2+qiE7zHql1BvtpvLdlZTl
 QBzVZfqxeGlQ4LiblOWNP3rjCN/V/9f6Ovi4qlHGWal58J8yHfuCUx8I0wKPFHUkyhy9
 fnGMcTp2DCdfNA1OCTXHK1wqMNRaAdDaKZCIt9xEnGr5VfmHmavaMtNTF8OsfLHhDt/d
 6ExA==
X-Gm-Message-State: AOAM530mjUL0BXeoLQuR78xOY+ItcUZrl6Xa8NXm2TltX2mj9NSvTWhJ
 i125pgHta8dOtORDRGRv2j9FTSpE7a+DwA==
X-Google-Smtp-Source: ABdhPJwJ77CkMkxkuzo6DHghxnW2F1yf3HeMQeDTYShK7oHLdqIgO4ebwcCDZRrGdkz+i5odFyUPrQ==
X-Received: by 2002:a05:6638:2610:b0:32a:fed1:a4c7 with SMTP id
 m16-20020a056638261000b0032afed1a4c7mr9099242jat.1.1651238832526; 
 Fri, 29 Apr 2022 06:27:12 -0700 (PDT)
Received: from [192.168.0.43] (static-35-180-85-188.ipcom.comunitel.net.
 [188.85.180.35]) by smtp.gmail.com with ESMTPSA id
 u14-20020a056638304e00b0032b3a7817cfsm572163jak.147.2022.04.29.06.27.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 06:27:11 -0700 (PDT)
Message-ID: <a3e566a5-bff7-10c5-724a-dde52e574c5e@gmail.com>
Date: Fri, 29 Apr 2022 15:27:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183-pumpkin: fix bad thermistor
 node name
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220426164755.435372-1-fparent@baylibre.com>
 <3ae5b1ea-4721-3e61-9b5f-505ab2d5f037@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <3ae5b1ea-4721-3e61-9b5f-505ab2d5f037@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_062724_427174_68DDFFFD 
X-CRM114-Status: UNSURE (   8.02  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiAyOC8wNC8yMDIyIDE1OjUwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToK
PiBJbCAyNi8wNC8yMiAxODo0NywgRmFiaWVuIFBhcmVudCBoYSBzY3JpdHRvOgo+PiBGaXggdGhl
IGZvbGxvd2luZyBkdGJzX2NoZWNrIGVycm9yIGJ5IHVzaW5nIHRoZSBjb3JyZWN0IG5vZGUgbmFt
ZToKPj4gL2hvbWUvZmFiby9idWlsZC9saW51eC9tdDgxODMtcHVtcGtpbi9hcmNoL2FybTY0L2Jv
b3QvZHRzL21lZGlhdGVrL210ODE4My1wdW1wa2luLmR0YjogCj4+IG50YzogJG5vZGVuYW1lOjA6
ICdudGMnIGRvZXMgbm90IG1hdGNoICdedGhlcm1pc3RvciguKik/JCcKPj4gwqDCoMKgwqBGcm9t
IHNjaGVtYTogCj4+IC9ob21lL2ZhYm8vZGV2ZWwvYmF5bGlicmUvbGludXgtbWFpbmxpbmUvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2h3bW9uL250Yy10aGVybWlzdG9yLnlhbWwg
Cj4+Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUu
Y29tPgo+PiBSZXZpZXdlZC1ieTogTWF0dGlqcyBLb3JwZXJzaG9layA8bWtvcnBlcnNob2VrQGJh
eWxpYnJlLmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8g
PGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KPiAKCkFwcGxpZWQsIHRo
YW5rcyEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVk
aWF0ZWsK
