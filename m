Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD282C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 21:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G3BlTl6Rb/nQ0AYPhhCMMjys6j7FnlOLQvIqBuekQZ8=; b=tTtvpzuSewj8FE
	CCSxiB/dF+7cIzsXG1HkH9iHwKXr1MyMgkxsx4N7j9gPTlv2fORJJKsGADDo0pEM5YnXUosQi+k/9
	nQlJnElNhIrA+stJAnZzTKpyuIr0D9isOEKsvLAQzmt0of8JMrY9oWhVuIaXYAyg44m7GZSXHtSnC
	6oP0sWDIVzaKpHKxaVqBMWkHeO160jzUDIQdSfP0z+eCrzHD2Cdt+VZwDEwy1dW13QDO7y/tFDTN0
	wzYpafb4hBnwi0OoIrIMW3DJ2ZxqV1yZgyFcFerYboBCMqoDJBFuYmElaC7jIF6Qt2kVr1vigctYo
	WzBbx4dRMLNFISp0oIzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJjAE-00H7XR-Ac; Mon, 14 Feb 2022 21:45:42 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJixB-00H2LH-Aa
 for linux-mediatek@lists.infradead.org; Mon, 14 Feb 2022 21:32:15 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E44DE3F1D1
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Feb 2022 21:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644874331;
 bh=Vpk09spyV9imDGj1kfUzd1GTJIyfhaN7DgNwXJd/bD0=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=XpgLHZAMvvSPvKAt/hJsv1aOLP3eJJNfAt4SPnyyB5QIt1W8nj4w12M6rUB/4ezx0
 uT7ZB/lo8xentmhdrNNfZCLWNdubZUg3yG9FXMpnuIbAlEC63ONHyf415Gl5ZN3Q1v
 WHYoGqZTFuQZ0krBmljsh3JzVbmzZ4DW6zDo2qGghJhk1N39EL3gZZwufh6/yspEQe
 XAKjcg3PiRtmg8Yczd4n5mybkr9VZXoSB9AhJ4rP8ec9TsisPR6vWhV9oY8SOwveV+
 WcU0Zi5JQP52UVMD8L0e+KJXkCek4io21a3bXbsutABZ7rm4XXf9bJp9XHeTii6exM
 ARlvp+UF5sk+Q==
Received: by mail-ed1-f70.google.com with SMTP id
 r11-20020a508d8b000000b00410a4fa4768so3790048edh.9
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Feb 2022 13:32:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Vpk09spyV9imDGj1kfUzd1GTJIyfhaN7DgNwXJd/bD0=;
 b=hNGc9Da15q4mlDmSMtLfO9LVV475ZDI+2bdrkDeupJEAmEB1XELCGfDR/8sL7CzjvY
 5YlrU9qCRYwoEgRK9YkKSpSd+mc7GHLJyWaxkAiK/bq9PxovBjeYW+BwxMhNY0mysvSJ
 zE5xrAKV8mR19NSUNNZzoZ88VnOLldRxe/pUo2lG+KUgG5J76uMNHHLWZK9NuceyK1PF
 pwgkkgQspK/RUwLFycBZEEKRgqDk6vKQQfo2w5PReoPVbG2mqusB5IZn94ghbAkFjArV
 bTrdAsonNMji+dXWqP2X1z0aGEudv7KTTGkbwcFFOresnWpHHFfJzN/q28ObTSLFnRbI
 JPyA==
X-Gm-Message-State: AOAM531gFa8oWa28MPLZL2krB40HjmFjM8hs2fSMxaUTeTCGl3qVbMkX
 SkZ57ahlFeDARzP4gflaRZpjEZuqUcKyycNH2A+rJMfjAeLlBWrwiByNeeUNgq+1Ew9gu5KRodB
 uIuvcj1/jWpE2Giw6jpAz3EaU9J2S/Nbwt3WaGErIxOHwU0LMag==
X-Received: by 2002:a17:907:9687:: with SMTP id
 hd7mr561414ejc.715.1644874331561; 
 Mon, 14 Feb 2022 13:32:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqnjThzRbcUFM+c4bi7NwvMvdAFVVUVTZmoKvJUlbWhdI51H+3uTCCB+/iNFrzs2cm1lQjfg==
X-Received: by 2002:a17:907:9687:: with SMTP id
 hd7mr561405ejc.715.1644874331369; 
 Mon, 14 Feb 2022 13:32:11 -0800 (PST)
Received: from [192.168.0.106] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id h11sm3910302edb.68.2022.02.14.13.32.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 13:32:10 -0800 (PST)
Message-ID: <af2405be-5af5-1e5b-66f2-93842eb8cde5@canonical.com>
Date: Mon, 14 Feb 2022 22:32:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [1/1] dt-bindings: pwm:Convert pwm-mtk-disp.txt format file to
 pwm-mtk-disp.yaml format file
Content-Language: en-US
To: xinlei.lee@mediatek.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1644847276-27622-1-git-send-email-xinlei.lee@mediatek.com>
 <1644847276-27622-2-git-send-email-xinlei.lee@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <1644847276-27622-2-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_133213_626743_E283D1B5 
X-CRM114-Status: GOOD (  18.52  )
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

T24gMTQvMDIvMjAyMiAxNTowMSwgeGlubGVpLmxlZUBtZWRpYXRlay5jb20gd3JvdGU6Cj4gRnJv
bTogeGlubGVpIGxlZSA8eGlubGVpLmxlZUBtZWRpYXRlay5jb20+CgpDb21taXQgbXNnIGlzIG5l
ZWRlZC4KClN1YmplY3QgLSBtaXNzaW5nIHNwYWNlIGFmdGVyICc6JyBhbmQgaXQgaXMgdG9vIGxv
bmcuIE5vIG5lZWQgdG8gc2F5CiJmb3JtYXQgZmlsZSIgdHdpY2UuCgpZb3UgbWlzcyAiUEFUQ0gi
IGluIHN1YmplY3QuIFVzaW5nIGBnaXQgZm9ybWF0LXBhdGNoYCBpcyB0aGUgZWFzaWVzdCB3YXkK
dG8gY3JlYXRlIHByb3BlciBwYXRjaGVzLgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiB4aW5sZWkgbGVl
IDx4aW5sZWkubGVlQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGlu
Z3MvcHdtL3B3bS1tdGstZGlzcC55YW1sICAgICAgfCA2MCArKysrKysrKysrKysrKysrKysrKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA2MCBpbnNlcnRpb25zKCspCgpJIGRvIG5vdCBzZWUgdGhlIGNv
bnZlcnNpb24gaGVyZS4uLiBZb3Ugb25seSBhZGQgb25lIGZpbGUuIFdoZXJlIGlzIHRoZQpyZW1v
dmFsPwoKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9wd20vcHdtLW10ay1kaXNwLnlhbWwKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9wd20tbXRrLWRpc3AueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vcHdtLW10ay1kaXNwLnlhbWwKPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAuLjJmMTE4M2UKPiAtLS0gL2Rldi9udWxsCj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9wd20tbXRrLWRpc3AueWFt
bAoKTGV0J3MgbmFtZSB0aGUgZmlsZSBhcyB3aXRoIG1vc3QgYmluZGluZ3MsIHNvIHdpdGggdmVu
ZG9yOgoibWVkaWF0ZWsscHdtLWRpc3AueWFtbCIKCj4gQEAgLTAsMCArMSw2MCBAQAo+ICsjIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiAr
JVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3B3
bS9wd20tbXRrLWRpc3AueWFtbCMKPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21l
dGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gKwo+ICt0aXRsZTogbWVkaWF0ZWsgUFdNIENvbnRyb2xs
ZXIgRGV2aWNlIFRyZWUgQmluZGluZ3MKPiArCj4gK21haW50YWluZXJzOgo+ICsgIC0gVGhpZXJy
eSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KPiArICAtIFV3ZSBLbGVpbmUtS8O2
bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4gKyAgLSBMZWUgSm9uZXMgPGxl
ZS5qb25lc0BsaW5hcm8ub3JnPgo+ICsgIC0gUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9y
Zz4KPiArCgphbGxPZiByZWZlcmVuY2luZyBwd20ueWFtbAoKPiArcHJvcGVydGllczoKPiArICBj
b21wYXRpYmxlOgo+ICsgICAgZW51bToKPiArICAgICAgLSBtZWRpYXRlayxtdDI3MDEtZGlzcC1w
d20KPiArICAgICAgLSBtZWRpYXRlayxtdDY1OTUtZGlzcC1wd20KPiArICAgICAgLSBtZWRpYXRl
ayxtdDgxNzMtZGlzcC1wd20KPiArICAgICAgLSBtZWRpYXRlayxtdDgxODMtZGlzcC1wd20KPiAr
ICAgICAgLSBtZWRpYXRlayxtdDgxODYtZGlzcC1wd20KPiArCj4gKyAgcmVnOgo+ICsgICAgbWF4
SXRlbXM6IDEKPiArCj4gKyAgaW50ZXJydXB0czoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICsg
IGNsb2NrczoKPiArICAgIGl0ZW1zOgo+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBNYWluIENsb2Nr
Cj4gKyAgICAgIC0gZGVzY3JpcHRpb246IE1tIENsb2NrCj4gKwoKClRoaXMgc2NoZW1hIHdhcyBu
b3QgdGVzdGVkLiBQbGVhc2UgcnVuIGl0IGFnYWluc3QgeW91ciBEVFMgZmlsZXMgKG1ha2UKZHRi
c19jaGVjaykuIFlvdSBuZWVkIHB3bS1jZWxscyBhbmQgcG93ZXItZG9tYWlucy4gTWF5YmUgbW9y
ZS4uLgoKPiArICBjbG9jay1uYW1lczoKPiArICAgIGl0ZW1zOgo+ICsgICAgICAtIGNvbnN0OiBt
YWluCj4gKyAgICAgIC0gY29uc3Q6IG1tCgpCbGFuayBsaW5lLgoKPiArcmVxdWlyZWQ6CgoiY29t
cGF0aWJsZSIgaXMgcmVxdWlyZWQsIHB1dCBpdCBmaXJzdCBpbiB0aGUgbGlzdC4KCj4gKyAgLSBy
ZWcKPiArICAtIGludGVycnVwdHMKPiArICAtIGNsb2Nrcwo+ICsgIC0gY2xvY2stbmFtZXM+ICsK
PiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4gKwo+ICtleGFtcGxlczoKPiArICAtIHwK
PiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2lj
Lmg+Cj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svbXQ4MTg2LWNsay5oPgo+ICsg
ICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oPgoKQmxh
bmsgbGluZS4KCj4gKyAgICBkaXNwX3B3bTogZGlzcF9wd20wQDExMDBlMDAwIHsKCm5vZGUgbmFt
ZTogInB3bSIgKGdlbmVyaWMgYXMgc2NoZW1hIGFuZCBkZXZpY2V0cmVlIHNwZWNpZmljYXRpb24g
YXNrIGZvcikuCgo+ICsgICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTgzLWRpc3At
cHdtIjsKPiArICAgICAgICByZWcgPSA8MHgxMTAwZTAwMCAweDEwMDA+Owo+ICsgICAgICAgIGlu
dGVycnVwdHMgPSA8R0lDX1NQSSAxNDMgSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4gKyAgICAgICAg
Y2xvY2tzID0gPCZ0b3Bja2dlbiBDTEtfVE9QX0RJU1BfUFdNPiwKPiArICAgICAgICAgICAgICAg
ICA8JmluZnJhY2ZnX2FvIENMS19JTkZSQV9BT19ESVNQX1BXTT47Cj4gKyAgICAgICAgY2xvY2st
bmFtZXMgPSAibWFpbiIsICJtbSI7Cj4gKyAgICAgICAgc3RhdHVzID0gIm9rYXkiOwoKTm8gbmVl
ZCBmb3Igc3RhdHVzLgoKPiArICAgIH07Cj4gXCBObyBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlCgoK
QmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
