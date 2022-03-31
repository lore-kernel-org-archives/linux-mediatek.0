Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14115C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 11:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w3/UkhKtlG5Mk2iAoWtyMl1nwZ8xUpn0oXIMwkX6mD0=; b=TP+Rg/no5DTw45
	YIyc+re+QpW1NoMbpWOg0hEq9mMvmlg4W+qkATAZrDrVDPq91HP+xqEf8ErowC/r5Q4I0L0Xw5Itu
	/8TtGfAraebWhtX8Tr1W4bdpjoGQBCHEpv6aj0dAdj0FZ8oeCY3+rlEXszKP8Nrv6StS6Dbof2cl8
	DCzf4cqrsu6o+rw64d64aX1vRL7I+uCI8lB9V9DR1lPEZrcy9qu3rkD1lzEClYk9hkmv03/Y+txvW
	sV8ODxVWyuL2n7bpKLcAH3dE9yc0jXGIZJV3uRItYTQNwaDqNmQ6iC2RklsmzOO4g1fd+bPkYiLMu
	D/+R+md18G+p0htdq7tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZtQ6-0025e2-LI; Thu, 31 Mar 2022 11:56:54 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZtPu-0025bp-LX; Thu, 31 Mar 2022 11:56:44 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 n63-20020a1c2742000000b0038d0c31db6eso1876544wmn.1; 
 Thu, 31 Mar 2022 04:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Wxsj21Het/z6xd9Casvbkn0jKbQnilJIFWcnrumAXSU=;
 b=WSzw5urQAa6H8LwgQkKimPtvog6Ro2Kkq/TwkgFYtOd9znWt4AIRG7kWdLLmWob+jK
 K4hTMeezMcJLSRRal7F5QzVDT5IN0WVXUrx4R6qJVOG7wuJBnZsqf+2enWgwG/GcH8pW
 mRbVqnHZ2zGq9oU84xzD4JyJD/2LZDo9k+trH525wZ/lpa8oHnCYOuY30Rf/cPUn4gIX
 jigHnzOHItV+FG34ytfUoc1IAwGnasVKLZE26X2sIFYVrh2pWT75LN4p8HLVyHJ/BpAP
 1u4ygdEtIQo3jdszaGR5/OI7FrupmeTcXT05JZJt3+NNWMhhAoJizUohPqTXkVr1ldVY
 /mwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Wxsj21Het/z6xd9Casvbkn0jKbQnilJIFWcnrumAXSU=;
 b=XIEu1+vCgmLafPWsdDivAGDXgOLRLuX3pylU3l+jFMuB+uQ7CAlFWDeTVp1S+1jBQC
 2dFXDlnJfxFbFNT2+uPpR4Pj+tAPpgco0MFDuWEd0atve95qokUKUYRIiNU9dnkM5Pxd
 M0q9SweqdCfFzu9F8B/WExr29FnH7X7D9OPcPQFzNI1fasJ8zxwvRTr7YMhIpsylmioW
 lgHNzaggZesxK0OiJRs9wtHheDBcEtJTSklf+5DcFOjHzQLufuNCBcWz3lQVeYF/Jwcs
 mxDwaT104RGrYCvrJuj2Hu7BkqPdgXTsvIIX4VX5T5Y8l7w8M3Vxnn3/rkknz/uvpDWR
 MNQg==
X-Gm-Message-State: AOAM5321RgE2OWhTz/9XzxIqLQJWLyDtPQvjasL6+0ifkdeTX3V5XUID
 piBCLOIVPJls3qGzfl/iWF8=
X-Google-Smtp-Source: ABdhPJwqM0tYJjbGOI3ikLFWCZA1vagqtFyfRDGpTW5JHpsB6utkyOP9RhS1rPj272VgJuGOmu7qKg==
X-Received: by 2002:a05:600c:19ce:b0:38c:dcc1:4cf3 with SMTP id
 u14-20020a05600c19ce00b0038cdcc14cf3mr4419238wmq.126.1648727800764; 
 Thu, 31 Mar 2022 04:56:40 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a056000168b00b002041af9a73fsm23001295wrd.84.2022.03.31.04.56.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 04:56:40 -0700 (PDT)
Message-ID: <06a53ed1-63a8-50c1-7eb0-58ccecce624e@gmail.com>
Date: Thu, 31 Mar 2022 13:56:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 1/4] arm64: dts: mt8192: Add PCIe node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220330133816.30806-1-allen-kh.cheng@mediatek.com>
 <20220330133816.30806-2-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220330133816.30806-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_045642_765127_D309A9BA 
X-CRM114-Status: GOOD (  17.28  )
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

CgpPbiAzMC8wMy8yMDIyIDE1OjM4LCBBbGxlbi1LSCBDaGVuZyB3cm90ZToKPiBBZGQgUENJZSBu
b2RlIGZvciBtdDgxOTIgU29DLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsbGVuLUtIIENoZW5nIDxh
bGxlbi1raC5jaGVuZ0BtZWRpYXRlay5jb20+Cj4gUmV2aWV3ZWQtYnk6IE7DrWNvbGFzIEYuIFIu
IEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KCkkgd29uZGVyIHdoeSB5b3UgbGVm
dCBOaWNvbGFzIFJldmlld2VkLWJ5IGJ1dCBub3QgdGhlIG9uZSBmcm9tIEFuZ2Vsby4gQW55d2F5
IAp3aGVuIHNlbmRpbmcgYSBuZXcgdmVyc2lvbiwgYmUgc3VyZSB0byBkcm9wIHRoZSByZXZpZXdl
ZC1ieSB0YWdzIGlmIHRoZXJlIGFyZSAKc3Vic3RhbnRpYWwgY2hhbmdlcyBpbiB0aGUgcGF0Y2gu
IFdlIGNhbiBhcmd1ZSBpZiBjaGFuZ2luZyB0aGUgY2xvY2sgbmFtZXMgaXMgYSAKc3Vic3RhbnRp
YWwgY2hhbmdlIG9yIG5vdC4gTWF5YmUgdGhhdCdzIHdoeSB5b3UgbGVmdCBqdXN0IG9uZSByZXZp
ZXdlZC1ieSB0YWcgOykKSSdtIGp1c3Qgam9raW5nLCBJJ2xsIGFkZCB0aGUgb3RoZXIgdGFnIG15
c2VsZi4KCkFwcGxpZWQgdGhhbmtzLgoKPiAtLS0KPiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVk
aWF0ZWsvbXQ4MTkyLmR0c2kgfCAzNSArKysrKysrKysrKysrKysrKysrKysrKysKPiAgIDEgZmls
ZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlh
dGVrL210ODE5Mi5kdHNpCj4gaW5kZXggNTc5YWJiZjQ0ODhlLi42OWU4ZDE5MzRkNTMgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaQo+ICsrKyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kKPiBAQCAtNzE2LDYgKzcx
Niw0MSBAQAo+ICAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPiAgIAkJfTsKPiAgIAo+ICsJCXBj
aWU6IHBjaWVAMTEyMzAwMDAgewo+ICsJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi1w
Y2llIjsKPiArCQkJZGV2aWNlX3R5cGUgPSAicGNpIjsKPiArCQkJcmVnID0gPDAgMHgxMTIzMDAw
MCAwIDB4MjAwMD47Cj4gKwkJCXJlZy1uYW1lcyA9ICJwY2llLW1hYyI7Cj4gKwkJCSNhZGRyZXNz
LWNlbGxzID0gPDM+Owo+ICsJCQkjc2l6ZS1jZWxscyA9IDwyPjsKPiArCQkJY2xvY2tzID0gPCZp
bmZyYWNmZyBDTEtfSU5GUkFfUENJRV9QTF9QXzI1ME0+LAo+ICsJCQkJIDwmaW5mcmFjZmcgQ0xL
X0lORlJBX1BDSUVfVExfMjZNPiwKPiArCQkJCSA8JmluZnJhY2ZnIENMS19JTkZSQV9QQ0lFX1RM
Xzk2TT4sCj4gKwkJCQkgPCZpbmZyYWNmZyBDTEtfSU5GUkFfUENJRV9UTF8zMks+LAo+ICsJCQkJ
IDwmaW5mcmFjZmcgQ0xLX0lORlJBX1BDSUVfUEVSSV8yNk0+LAo+ICsJCQkJIDwmaW5mcmFjZmcg
Q0xLX0lORlJBX1BDSUVfVE9QX0hfMTMzTT47Cj4gKwkJCWNsb2NrLW5hbWVzID0gInBsXzI1MG0i
LCAidGxfMjZtIiwgInRsXzk2bSIsCj4gKwkJCQkgICAgICAidGxfMzJrIiwgInBlcmlfMjZtIiwg
InRvcF8xMzNtIjsKPiArCQkJYXNzaWduZWQtY2xvY2tzID0gPCZ0b3Bja2dlbiBDTEtfVE9QX1RM
X1NFTD47Cj4gKwkJCWFzc2lnbmVkLWNsb2NrLXBhcmVudHMgPSA8JnRvcGNrZ2VuIENMS19UT1Bf
TUFJTlBMTF9ENl9END47Cj4gKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAyNTEgSVJRX1RZUEVf
TEVWRUxfSElHSCAwPjsKPiArCQkJYnVzLXJhbmdlID0gPDB4MDAgMHhmZj47Cj4gKwkJCXJhbmdl
cyA9IDwweDgyMDAwMDAwIDAgMHgxMjAwMDAwMCAweDAgMHgxMjAwMDAwMCAwIDB4MDgwMDAwMD4s
Cj4gKwkJCQkgPDB4ODEwMDAwMDAgMCAweDEyODAwMDAwIDB4MCAweDEyODAwMDAwIDAgMHgwODAw
MDAwPjsKPiArCQkJI2ludGVycnVwdC1jZWxscyA9IDwxPjsKPiArCQkJaW50ZXJydXB0LW1hcC1t
YXNrID0gPDAgMCAwIDc+Owo+ICsJCQlpbnRlcnJ1cHQtbWFwID0gPDAgMCAwIDEgJnBjaWVfaW50
YzAgMD4sCj4gKwkJCQkJPDAgMCAwIDIgJnBjaWVfaW50YzAgMT4sCj4gKwkJCQkJPDAgMCAwIDMg
JnBjaWVfaW50YzAgMj4sCj4gKwkJCQkJPDAgMCAwIDQgJnBjaWVfaW50YzAgMz47Cj4gKwo+ICsJ
CQlwY2llX2ludGMwOiBpbnRlcnJ1cHQtY29udHJvbGxlciB7Cj4gKwkJCQlpbnRlcnJ1cHQtY29u
dHJvbGxlcjsKPiArCQkJCSNhZGRyZXNzLWNlbGxzID0gPDA+Owo+ICsJCQkJI2ludGVycnVwdC1j
ZWxscyA9IDwxPjsKPiArCQkJfTsKPiArCQl9Owo+ICsKPiAgIAkJbm9yX2ZsYXNoOiBzcGlAMTEy
MzQwMDAgewo+ICAgCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItbm9yIjsKPiAgIAkJ
CXJlZyA9IDwwIDB4MTEyMzQwMDAgMCAweGUwPjsKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
