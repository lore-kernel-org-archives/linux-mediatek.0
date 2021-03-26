Return-Path: <SRS0=QnWu=IY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81110C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 16:19:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2916B619CB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 16:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2916B619CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ou9o73+5h1lkO80W38EtRqlgigf2oQ3Kcu5G9Z2IfXg=; b=cCGTT/agARqSOl8xExDMK6uFB
	2JcSvBaHOdDUn7qKh1QUKfViVlfkMtcv8VALkTZh4rsUpuARcGcthdHr/1LD9+5fl3Gj//a/wKwDK
	CZxDaf3IoUn4PN+QbOJUhKAhIANtCbx7B4o1ijUQ/+WyaE1ZgPjWLzEGwKEf4lSb4d/jBVLa1XZbU
	LjPOe0b7NeSTJxsZZpC2H+TdbWPJLZBklxRHVR1PGPZXmSXIncMunyE34iZW47J3verxchmZm6uYH
	yAiJbfRQNqf6jkElqb6uELI4GYTLgrw/y9Q6ZPczo0IZfoHPyebVTofr5XSfLvOeh1VTzCrQuFJT0
	ZzaiMOyfA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPpBF-003yWO-PW; Fri, 26 Mar 2021 16:19:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPpB5-003yUw-CX; Fri, 26 Mar 2021 16:19:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 04D83619CB;
 Fri, 26 Mar 2021 16:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616775552;
 bh=y5D7LKMF6UcIhdpmaKfS0zgbiEVj4Y3JfqsnPyf/1Ak=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bC7tP8fqqvJksjeOZA/bvpau2ORDnVm6T+Ghgnq/d+84oyv9q7UzVbjFzjKDv31Hp
 nFRoxI4Hs+A1N9qOsRmKFAk2tEZRRNsubvtEEykhlNjjldI4ZN+sbWm1a4JVefBr5S
 RxsTUtIl37qdealoEl1QpqL8ABEgPqzDODqgFEShgxyzo7ccWdyeTOyU9tJFVRCqJO
 wEW8gvx1j4Dran84g591ebOpuyz+hVoJ2rO2RMHEyH+sKNr2IkQueFEr7iKnAxJiQt
 YUD0h5Zl1VOkR2A1BQL2Q5TgYM07DgQEjOYOgWktesZO/v7spNDmISNDmL//k9H7Q5
 ER3D62ZqWbSfQ==
Received: by mail-ed1-f46.google.com with SMTP id z1so6947834edb.8;
 Fri, 26 Mar 2021 09:19:11 -0700 (PDT)
X-Gm-Message-State: AOAM532Y9FuZhjzs9cb1cSdqNhJWiungPIUYB2wmAmXseE0gfCdQKXSw
 NH0FaAIaOXgw1vPXVbXpdBTDr6uolQXadz8Xbw==
X-Google-Smtp-Source: ABdhPJyRlcrMf7ezc1JD8+sAHdHx3wKfXOkh3fjCTx6BHGW8HdVAalI+CmlcwqgEDX3fwzOq2Y1wHWP2P1V7HPPThH0=
X-Received: by 2002:aa7:c7d5:: with SMTP id o21mr16022265eds.166.1616775550443; 
 Fri, 26 Mar 2021 09:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <1616743871-8087-1-git-send-email-nina-cm.wu@mediatek.com>
In-Reply-To: <1616743871-8087-1-git-send-email-nina-cm.wu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 27 Mar 2021 00:18:59 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-8W57Pid9N9kJO0iBNkmRh_sSf_E3hzewxojZ3GAnG2w@mail.gmail.com>
Message-ID: <CAAOTY_-8W57Pid9N9kJO0iBNkmRh_sSf_E3hzewxojZ3GAnG2w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: devapc: Update bindings
To: Nina Wu <nina-cm.wu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Zhen Lei <thunder.leizhen@huawei.com>, Neal Liu <neal.liu@mediatek.com>, 
 DTML <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, Jackson-kt.Chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_161915_795698_B66142B4 
X-CRM114-Status: GOOD (  20.23  )
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

SGksIE5pbmE6CgpOaW5hIFd1IDxuaW5hLWNtLnd1QG1lZGlhdGVrLmNvbT4g5pa8IDIwMjHlubQz
5pyIMjbml6Ug6YCx5LqUIOS4i+WNiDM6MzTlr6vpgZPvvJoKPgo+IEZyb206IE5pbmEgV3UgPE5p
bmEtQ00uV3VAbWVkaWF0ZWsuY29tPgo+Cj4gVG8gc3VwcG9ydCBuZXdlciBoYXJkd2FyZSBhcmNo
aXRlY3R1cmUgb2YgZGV2YXBjLAo+IHVwZGF0ZSBkZXZpY2UgdHJlZSBiaW5kaW5ncy4KPgo+IFNp
Z25lZC1vZmYtYnk6IE5pbmEgV3UgPE5pbmEtQ00uV3VAbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvbWVkaWF0ZWsvZGV2YXBjLnlhbWwgICB8IDQxICsr
KysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKykK
Pgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL21l
ZGlhdGVrL2RldmFwYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Nv
Yy9tZWRpYXRlay9kZXZhcGMueWFtbAo+IGluZGV4IDMxZTRkM2MuLjQ4OWY2YTkgMTAwNjQ0Cj4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9tZWRpYXRlay9kZXZh
cGMueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvbWVk
aWF0ZWsvZGV2YXBjLnlhbWwKPiBAQCAtMjAsOSArMjAsMjcgQEAgcHJvcGVydGllczoKPiAgICBj
b21wYXRpYmxlOgo+ICAgICAgZW51bToKPiAgICAgICAgLSBtZWRpYXRlayxtdDY3NzktZGV2YXBj
Cj4gKyAgICAgIC0gbWVkaWF0ZWssbXQ4MTkyLWRldmFwYwo+ICsKPiArICB2ZXJzaW9uOgo+ICsg
ICAgZGVzY3JpcHRpb246IFRoZSB2ZXJzaW9uIG9mIHRoZSBoYXJkd2FyZSBhcmNoaXRlY3R1cmUK
PiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgo+ICsg
ICAgZW51bTogWzEsIDJdCj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiArICBzbGF2ZV90eXBlX251
bToKPiArICAgIGRlc2NyaXB0aW9uOiBUaGUgbnVtYmVyIG9mIHRoZSBkZXZhcGMgc2V0Cj4gKyAg
ICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKPiArICAgIGVu
dW06IFsxLCA0XQo+ICsgICAgbWF4SXRlbXM6IDEKPgo+ICAgIHJlZzoKPiAgICAgIGRlc2NyaXB0
aW9uOiBUaGUgYmFzZSBhZGRyZXNzIG9mIGRldmFwYyByZWdpc3RlciBiYW5rCj4gKyAgICBtYXhJ
dGVtczogNAo+ICsKPiArICB2aW9faWR4X251bToKPiArICAgIGRlc2NyaXB0aW9uOiBUaGUgbnVt
YmVyIG9mIHRoZSBkZXZpY2VzIGNvbnRyb2xsZWQgYnkgZGV2YXBjCj4gKyAgICAkcmVmOiAvc2No
ZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzItYXJyYXkKPiAgICAgIG1heEl0ZW1z
OiAxCj4KPiAgICBpbnRlcnJ1cHRzOgo+IEBAIC0zOSw3ICs1NywxMCBAQCBwcm9wZXJ0aWVzOgo+
Cj4gIHJlcXVpcmVkOgo+ICAgIC0gY29tcGF0aWJsZQo+ICsgIC0gdmVyc2lvbgo+ICsgIC0gc2xh
dmVfdHlwZV9udW0KPiAgICAtIHJlZwo+ICsgIC0gdmlvX2lkeF9udW0KPiAgICAtIGludGVycnVw
dHMKPiAgICAtIGNsb2Nrcwo+ICAgIC0gY2xvY2stbmFtZXMKPiBAQCAtNTMsOCArNzQsMjggQEAg
ZXhhbXBsZXM6Cj4KPiAgICAgIGRldmFwYzogZGV2YXBjQDEwMjA3MDAwIHsKPiAgICAgICAgY29t
cGF0aWJsZSA9ICJtZWRpYXRlayxtdDY3NzktZGV2YXBjIjsKPiArICAgICAgdmVyc2lvbiA9IDwx
PjsKCkkgdGhpbmsgdmVyc2lvbiBpcyByZWR1bmRhbnQuIEZvciBleGFtcGxlLCBpZiBtdDAwMDEt
ZGV2YXBjIGlzCmlkZW50aWNhbCB0byBtdDY3NzktZGV2YXBjLCBpdHMgY29tcGF0aWJsZSBzaG91
bGQgYmUKCmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQwMDAxLWRldmFwYyIsICJtZWRpYXRlayxt
dDY3NzktZGV2YXBjIjsKCkluIGRyaXZlciwgb25seSBrZWVwIGNvbXBhdGlibGUgZm9yIG10Njc3
OSBhbmQgbm8gbXQwMDAxIGJlY2F1c2UKbXQwMDAxIGlzIGlkZW50aWNhbCB0byBtdDY3NzkuCklu
IHByb2JlIHNlcXVlbmNlLCB0cnkgZmlyc3QgY29tcGF0aWJsZSBzdHJpbmcKIm1lZGlhdGVrLG10
MDAwMS1kZXZhcGMiLCBidXQgaXQgZG9lcyBub3QgZXhpc3QgaW4gZHJpdmVyLCBzbyB0cnkgbmV4
dApjb21wYXRpYmxlIHN0cmluZyAibWVkaWF0ZWssbXQ2Nzc5LWRldmFwYyIgYW5kIG1hdGNoLgpT
byBtdDAwMDEtZGV2YXBjIHdvdWxkIHdvcmsgYXMgbXQ2Nzc5LWRldmFwYy4KCj4gKyAgICAgIHNs
YXZlX3R5cGVfbnVtID0gPDE+Owo+ICAgICAgICByZWcgPSA8MHgxMDIwNzAwMCAweDEwMDA+Owo+
ICsgICAgICB2aW9faWR4X251bSA9IDw1MTE+Owo+ICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19T
UEkgMTY4IElSUV9UWVBFX0xFVkVMX0xPVz47Cj4gICAgICAgIGNsb2NrcyA9IDwmaW5mcmFjZmdf
YW8gQ0xLX0lORlJBX0RFVklDRV9BUEM+Owo+ICAgICAgICBjbG9jay1uYW1lcyA9ICJkZXZhcGMt
aW5mcmEtY2xvY2siOwo+ICAgICAgfTsKPiArICAtIHwKPiArICAgICNpbmNsdWRlIDxkdC1iaW5k
aW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2ljLmg+Cj4gKyAgICAjaW5jbHVkZSA8ZHQt
YmluZGluZ3MvY2xvY2svbXQ4MTkyLWNsay5oPgo+ICsKPiArICAgIGRldmFwYzogZGV2YXBjQDEw
MjA3MDAwIHsKPiArICAgICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi1kZXZhcGMi
Owo+ICsgICAgICAgIHZlcnNpb24gPSA8Mj47Cj4gKyAgICAgICAgc2xhdmVfdHlwZV9udW0gPSA8
ND47Cj4gKyAgICAgICAgcmVnID0gPDAgMHgxMDIwNzAwMCAwIDB4MTAwMD4sCj4gKyAgICAgICAg
ICAgIDwwIDB4MTAyNzQwMDAgMCAweDEwMDA+LAo+ICsgICAgICAgICAgICA8MCAweDEwMjc1MDAw
IDAgMHgxMDAwPiwKPiArICAgICAgICAgICAgPDAgMHgxMTAyMDAwMCAwIDB4MTAwMD47Cj4gKyAg
ICAgICAgdmlvX2lkeF9udW0gPSA8MzY3IDI5MiAyNDIgNTg+Owo+ICsgICAgICAgIGludGVycnVw
dHMgPSA8R0lDX1NQSSAxODcgSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4gKyAgICAgICAgY2xvY2tz
ID0gPCZpbmZyYWNmZ19hbyBDTEtfSU5GUkFfREVWSUNFX0FQQz47Cj4gKyAgICAgICAgY2xvY2st
bmFtZXMgPSAiZGV2YXBjLWluZnJhLWNsb2NrIjsKPiArICAgIH07CgpJdCBsb29rcyBsaWtlIHRo
YXQgdGhlcmUgYXJlIDQgZGV2YXBjIGRldmljZSBpbiBtdDgxOTIuClRoZXNlIDQgZGV2aWNlIHdv
cmsgaW5kZXBlbmRlbnRseSwgc28gSSB3b3VsZCBsaWtlIHRvIGRlY291cGxlIHRoZW0KcmF0aGVy
IHRoYW4gY291cGxlIHRoZW0uCgpkZXZhcGMwOiBkZXZhcGNAMTAyMDcwMDAgewogICAgY29tcGF0
aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItZGV2YXBjIjsKICAgIHJlZyA9IDwwIDB4MTAyMDcwMDAg
MCAweDEwMDA+OwogICAgdmlvX2lkeF9udW0gPSA8MzY3PjsKICAgIC4uLgp9OwoKZGV2YXBjMTog
ZGV2YXBjQDEwMjc0MDAwIHsKICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTkyLWRldmFw
YyI7CiAgICByZWcgPSA8MCAweDEwMjc0MDAwIDAgMHgxMDAwPjsKICAgIHZpb19pZHhfbnVtID0g
PDI5Mj47CiAgICAuLi4KfTsKCmRldmFwYzI6IGRldmFwY0AxMDI3NTAwMCB7CiAgICBjb21wYXRp
YmxlID0gIm1lZGlhdGVrLG10ODE5Mi1kZXZhcGMiOwogICAgcmVnID0gPDAgMHgxMDI3NTAwMCAw
IDB4MTAwMD47CiAgICB2aW9faWR4X251bSA9IDwyNDI+OwogICAgLi4uCn07CgpkZXZhcGMzOiBk
ZXZhcGNAMTEwMjAwMDAgewogICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItZGV2YXBj
IjsKICAgIHJlZyA9IDwwIDB4MTEwMjAwMDAgMCAweDEwMDA+OwogICAgdmlvX2lkeF9udW0gPSA8
NTg+OwogICAgLi4uCn07CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPiAtLQo+IDIuNi40Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4g
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
