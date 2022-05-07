Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD6BC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 May 2022 15:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pxCgSVpepQNhnxPVRh9kJvhKwSu7ek6LUrGU12Skjy0=; b=1u57iguYOaudpQ
	fxfxK5PCXfweNS9sh4tFBgsy0YVfiOFNedlXZG6Y5dwGRckTnmPfZDkHu+rbcsN21qEjbZ+w+AXSy
	QXZkqzg8513hm/UGg3XYyiiqhZWC1vaeLDDzojfKA8BIO4jSepF/2zNSw82mWns4FJJ7VP6+14Gwn
	XTwu10CuBRmEzfsScpwskwKgkfbgBGyFjg7Z1usYFIiVZBN3/I8ABT9q1R9FUol+NRs63fNZGiFWJ
	y3wYh1us2sMjFduYMpaivbsk0BPkz5xN1lV+SB0kKsbZ7AQoIxRfaorWzrjc9yFk+V8gzF1gkuh/h
	7kbbxHujwx2277l+xrEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnMgP-007bIu-KB; Sat, 07 May 2022 15:49:25 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnMgE-007bG8-Kv
 for linux-mediatek@lists.infradead.org; Sat, 07 May 2022 15:49:15 +0000
Received: by mail-ej1-x62d.google.com with SMTP id g6so19464987ejw.1
 for <linux-mediatek@lists.infradead.org>; Sat, 07 May 2022 08:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wQNlbBSnCGuXV/datAdDc/iLjhkXcPGRCGM9OyDI6Qs=;
 b=LnU74xen1fqtuwMfRKvPcwdHMwYCLrdLz5kRQusxol4JUF268MCt2KUk+ZyygvB/LC
 OJTrtjt2CYTq0mkxUYeCh1BvwrqN4KGJa8PI6D3D/nCLdcz9RyAeplZ+UhMAJX6c3opK
 ImgmlhJ6v0QRyzqhgfbKLysm/V8DeSV2srYqXjKUgrwo5eMPvb5P31X5bz8oXY3rEshV
 V7ytloxR+hvbK/aYIq+yQyugHbo5OG/UG59GLa0XD5WCkXpb/6vdIDfyUe7lC3+DAwp/
 9DTBW8uUJXp0spYRxrr16M3IlWDSn1+GWO0WMtTdPSx91Og2UoT6oBcGHesvAmxxWUGe
 Wcrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wQNlbBSnCGuXV/datAdDc/iLjhkXcPGRCGM9OyDI6Qs=;
 b=glFfyhztn2NloCt5Eh+HWv1UOGe1d8oEfaZoDWA1P6MELoautdIs2JKV9qcAxf1Wn+
 boD1bPB+m+xn5oGLboFs8C9DMjFnoKLCikVE+2+t5CZKuHKYAQEztATVV5OG/lFnZs4r
 VHnUYZm8Fw5Qg0Fl6pkbp7wwuxhNzdWXwYdKrwqMuB0+y2W6Sr+pusF7Uw5lT5ByiW/6
 75GRpGymhG6G57E/coopQaDgYHkHe8zzuoSDN2wOYP67ISQX5pEvpL3/kzQIj9cAPWmD
 Gv4t7qsUnoUOh+1U0fOycBnKImYfuE5DE5KiS5fiq2/+Aldyhxrrq+UQ0Sn5umvZOPyd
 FQiQ==
X-Gm-Message-State: AOAM532DxY428aE/gDAbWpOsqzvbTIcO3BLLB//FT7genQBe9XY3SszY
 O++debWF8ds77SB9RVkiKk9B5A==
X-Google-Smtp-Source: ABdhPJyXhwDuCCedPga35pewNG9zUQ8z3RpGmNnelHI+hcibXqKVkpzJ5d43tBc5tCS/VDUgROR2UQ==
X-Received: by 2002:a17:907:3da4:b0:6f4:ff2b:8299 with SMTP id
 he36-20020a1709073da400b006f4ff2b8299mr8184708ejc.109.1651938552405; 
 Sat, 07 May 2022 08:49:12 -0700 (PDT)
Received: from [192.168.0.232] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 yl26-20020a17090693fa00b006f3ef214de1sm3121877ejb.71.2022.05.07.08.49.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 08:49:12 -0700 (PDT)
Message-ID: <08383669-c56e-7956-d724-668e16ea2c98@linaro.org>
Date: Sat, 7 May 2022 17:49:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 05/16] arm64: dts: mediatek: asurada: Add system-wide
 power supplies
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20220505194550.3094656-1-nfraprado@collabora.com>
 <20220505194550.3094656-6-nfraprado@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220505194550.3094656-6-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220507_084914_711299_B4203514 
X-CRM114-Status: GOOD (  12.45  )
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

T24gMDUvMDUvMjAyMiAyMTo0NSwgTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gd3JvdGU6Cj4gQWRk
IHN5c3RlbS13aWRlIHBvd2VyIHN1cHBsaWVzIHByZXNlbnQgb24gYWxsIG9mIHRoZSBib2FyZHMg
aW4gdGhlCj4gQXN1cmFkYSBmYW1pbHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4g
Ui4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgo+IFJldmlld2VkLWJ5OiBBbmdl
bG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJv
cmEuY29tPgo+IC0tLQo+IAo+IChubyBjaGFuZ2VzIHNpbmNlIHYxKQo+IAo+ICAuLi4vYm9vdC9k
dHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaSAgICAgfCA2NCArKysrKysrKysrKysrKysr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2NCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaSBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaQo+IGluZGV4IGUxMDYz
NjI5ODYzOS4uNWNiNzU4MGExM2NmIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
bWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
bWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaQo+IEBAIC0xOSw2ICsxOSw3MCBAQCBtZW1vcnlA
NDAwMDAwMDAgewo+ICAJCWRldmljZV90eXBlID0gIm1lbW9yeSI7Cj4gIAkJcmVnID0gPDAgMHg0
MDAwMDAwMCAwIDB4ODAwMDAwMDA+Owo+ICAJfTsKPiArCj4gKwkvKiBzeXN0ZW0gd2lkZSBMRE8g
MS44ViBwb3dlciByYWlsICovCgpHZW5lcmljIG5vZGUgbmFtZXMsIHNvIHJlZ3VsYXRvci1bMC05
XSwgb3IgcmVndWxhdG9yLXN1ZmZpeC4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
