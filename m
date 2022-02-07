Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73775C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Feb 2022 23:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ayhu37UmJhY12/i7XLt477Zv9j4N5LFnfVC1gr6w8qU=; b=hW1KbPxK82j0ig
	8yq5KS7ZmF5D8rAXHCtciVKC8zjPVrhCL/iMB1xtJJjsFQwI42SWzvLF8fAt5a4YY4Nz9JPk8LvvX
	mITSSaC+0l/TIw/yaQcxkTQR0Pqs1LWDwxOxH5AG+JVDS3L3m8vcLfAyl5JLlLaBJ7ez5Xoopq45X
	Z+TTPI5W7m36B3jqTrRy89PYElKjIgXDWcmOKZGsIshA7UtLjr+BKzxoqYlHycehSg/jeZ/SNidnP
	uAbgaLDw78GqjeTZGqCB7n6jaKG8ghq4Q0pD75leQUzkgOYx3epmy4nRAl2bCrhHNmyhO77JA+SMV
	ddDYh7Jjd+p/LSuP6HMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHD8o-00Bvx5-Ey; Mon, 07 Feb 2022 23:09:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHD8c-00Bvv4-2j; Mon, 07 Feb 2022 23:09:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 039CC60C81;
 Mon,  7 Feb 2022 23:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6888CC340F1;
 Mon,  7 Feb 2022 23:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644275376;
 bh=fy67XNlfUJrOzDkN7wHfeOhocEh0q0yDRq3ETbbXHtg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EXKH2ArpThS7H8A8/Q2zoSm8hsUAitDcof6/lrVcHzfavkafpqgf9loCL0QYWi3CX
 XEUJ1DNiKMpoJKgWRLHkFWFJiOHQgG2Q0pK10jcne7gGNuTuYcKq+fpUAvJzEwpa99
 k262CWquj8chiseoGmptlMZNo5NnSJkPscUXcjjGidKDENTGqOQc4nBQKZvGMjPi+k
 qIwbQANtHigpXr+qAvDUKAEQzv2RcTlM9GIr4aB4LMITqp/bwxrk70Vu/ULyA3Hjxn
 kkeLEoRoGx9OFMHJ7JCveFHAkibxWBvQ/zOj49ONPiEmukM3mxRQtjg2rFLWVAVt7B
 DKXQFoaVsDymA==
Received: by mail-ed1-f42.google.com with SMTP id b13so33499985edn.0;
 Mon, 07 Feb 2022 15:09:36 -0800 (PST)
X-Gm-Message-State: AOAM532j9h6CWfG/F9aUYoVBn6Yf9HLCAXRpAA/ONA3q78DcA/DTDTfq
 vRUvjv+KHQ9UDTaRUPK926gekm8ruakvyDowpw==
X-Google-Smtp-Source: ABdhPJyizGp1sBtLlSMdCLxQdjqEzCe7yhHi6Gz9O8lrHqMrtd/akuCjMrAOXiWfaEPJ+hbTrb2OCazxb+9h9qbXHiU=
X-Received: by 2002:aa7:c04e:: with SMTP id k14mr1716800edo.131.1644275374664; 
 Mon, 07 Feb 2022 15:09:34 -0800 (PST)
MIME-Version: 1.0
References: <20220126071932.32615-1-jason-jh.lin@mediatek.com>
 <20220126071932.32615-5-jason-jh.lin@mediatek.com>
In-Reply-To: <20220126071932.32615-5-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 8 Feb 2022 07:09:22 +0800
X-Gmail-Original-Message-ID: <CAAOTY__SLgV_Bd-uMg8+ebbUWdpkq6SyyqfwEGguXVR9afXRJQ@mail.gmail.com>
Message-ID: <CAAOTY__SLgV_Bd-uMg8+ebbUWdpkq6SyyqfwEGguXVR9afXRJQ@mail.gmail.com>
Subject: Re: [PATCH v15 04/12] dt-bindings: display: mediatek: dsc: add yaml
 for mt8195 SoC binding
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_150938_224308_90ED9FE8 
X-CRM114-Status: GOOD (  21.98  )
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
Cc: David Airlie <airlied@linux.ie>, singo.chang@mediatek.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabien Parent <fparent@baylibre.com>, DTML <devicetree@vger.kernel.org>,
 Nancy Lin <nancy.lin@mediatek.com>, linux-stm32@st-md-mailman.stormreply.com,
 roy-cw.yeh@mediatek.com, CK Hu <ck.hu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Moudy Ho <moudy.ho@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

IEhpLCBKYXNvbjoKCmphc29uLWpoLmxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4g5pa8
IDIwMjLlubQx5pyIMjbml6Ug6YCx5LiJIOS4i+WNiDM6MTnlr6vpgZPvvJoKPgo+IDEuIEFkZCBt
ZWRpYXRlayxkc2MueWFtbCB0byBkZXNjcmliZSBEU0MgbW9kdWxlIGluIGRldGFpbHMuCj4gMi4g
QWRkIG10ODE5NSBTb0MgYmluZGluZyB0byBtZWRpYXRlayxkc2MueWFtbC4KCkFwcGxpZWQgdG8g
bWVkaWF0ZWstZHJtLW5leHQgWzFdLCB0aGFua3MuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9
bWVkaWF0ZWstZHJtLW5leHQKClJlZ2FyZHMsCkNodW4tS3VhbmcKCj4KPiBTaWduZWQtb2ZmLWJ5
OiBqYXNvbi1qaC5saW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+Cj4gUmV2aWV3ZWQtYnk6
IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+IC0tLQo+ICAuLi4vZGlz
cGxheS9tZWRpYXRlay9tZWRpYXRlayxkc2MueWFtbCAgICAgICAgfCA3MSArKysrKysrKysrKysr
KysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA3MSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxkc2MueWFtbAo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzYy55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNj
LnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uMWVjMDgz
ZWZmODI0Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzYy55YW1sCj4gQEAgLTAsMCArMSw3
MSBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0y
LUNsYXVzZSkKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9zY2hlbWFzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNjLnlhbWwjCj4gKyRzY2hlbWE6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ICsKPiArdGl0
bGU6IG1lZGlhdGVrIGRpc3BsYXkgRFNDIGNvbnRyb2xsZXIKPiArCj4gK21haW50YWluZXJzOgo+
ICsgIC0gQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gKyAgLSBQaGls
aXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgo+ICsKPiArZGVzY3JpcHRpb246IHwK
PiArICBUaGUgRFNDIHN0YW5kYXJkIGlzIGEgc3BlY2lmaWNhdGlvbiBvZiB0aGUgYWxnb3JpdGht
cyB1c2VkIGZvcgo+ICsgIGNvbXByZXNzaW5nIGFuZCBkZWNvbXByZXNzaW5nIGltYWdlIGRpc3Bs
YXkgc3RyZWFtcywgaW5jbHVkaW5nCj4gKyAgdGhlIHNwZWNpZmljYXRpb24gb2YgdGhlIHN5bnRh
eCBhbmQgc2VtYW50aWNzIG9mIHRoZSBjb21wcmVzc2VkCj4gKyAgdmlkZW8gYml0IHN0cmVhbS4g
RFNDIGlzIGRlc2lnbmVkIGZvciByZWFsLXRpbWUgc3lzdGVtcyB3aXRoCj4gKyAgcmVhbC10aW1l
IGNvbXByZXNzaW9uLCB0cmFuc21pc3Npb24sIGRlY29tcHJlc3Npb24gYW5kIERpc3BsYXkuCj4g
Kwo+ICtwcm9wZXJ0aWVzOgo+ICsgIGNvbXBhdGlibGU6Cj4gKyAgICBvbmVPZjoKPiArICAgICAg
LSBpdGVtczoKPiArICAgICAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE5NS1kaXNwLWRzYwo+
ICsKPiArICByZWc6Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiArICBpbnRlcnJ1cHRzOgo+ICsg
ICAgbWF4SXRlbXM6IDEKPiArCj4gKyAgY2xvY2tzOgo+ICsgICAgaXRlbXM6Cj4gKyAgICAgIC0g
ZGVzY3JpcHRpb246IERTQyBXcmFwcGVyIENsb2NrCj4gKwo+ICsgIHBvd2VyLWRvbWFpbnM6Cj4g
KyAgICBkZXNjcmlwdGlvbjogQSBwaGFuZGxlIGFuZCBQTSBkb21haW4gc3BlY2lmaWVyIGFzIGRl
ZmluZWQgYnkgYmluZGluZ3Mgb2YKPiArICAgICAgdGhlIHBvd2VyIGNvbnRyb2xsZXIgc3BlY2lm
aWVkIGJ5IHBoYW5kbGUuIFNlZQo+ICsgICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcG93ZXIvcG93ZXItZG9tYWluLnlhbWwgZm9yIGRldGFpbHMuCj4gKwo+ICsgIG1lZGlh
dGVrLGdjZS1jbGllbnQtcmVnOgo+ICsgICAgZGVzY3JpcHRpb246Cj4gKyAgICAgIFRoZSByZWdp
c3RlciBvZiBjbGllbnQgZHJpdmVyIGNhbiBiZSBjb25maWd1cmVkIGJ5IGdjZSB3aXRoIDQgYXJn
dW1lbnRzCj4gKyAgICAgIGRlZmluZWQgaW4gdGhpcyBwcm9wZXJ0eSwgc3VjaCBhcyBwaGFuZGxl
IG9mIGdjZSwgc3Vic3lzIGlkLAo+ICsgICAgICByZWdpc3RlciBvZmZzZXQgYW5kIHNpemUuCj4g
KyAgICAgIEVhY2ggc3Vic3lzIGlkIGlzIG1hcHBpbmcgdG8gYSBiYXNlIGFkZHJlc3Mgb2YgZGlz
cGxheSBmdW5jdGlvbiBibG9ja3MKPiArICAgICAgcmVnaXN0ZXIgd2hpY2ggaXMgZGVmaW5lZCBp
biB0aGUgZ2NlIGhlYWRlcgo+ICsgICAgICBpbmNsdWRlL2R0LWJpbmRpbmdzL2djZS88Y2hpcD4t
Z2NlLmguCj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFu
ZGxlLWFycmF5Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiArcmVxdWlyZWQ6Cj4gKyAgLSBjb21w
YXRpYmxlCj4gKyAgLSByZWcKPiArICAtIGludGVycnVwdHMKPiArICAtIHBvd2VyLWRvbWFpbnMK
PiArICAtIGNsb2Nrcwo+ICsKPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4gKwo+ICtl
eGFtcGxlczoKPiArICAtIHwKPiArCj4gKyAgICBkc2MwOiBkaXNwX2RzY193cmFwQDFjMDA5MDAw
IHsKPiArICAgICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5NS1kaXNwLWRzYyI7Cj4g
KyAgICAgICAgcmVnID0gPDAgMHgxYzAwOTAwMCAwIDB4MTAwMD47Cj4gKyAgICAgICAgaW50ZXJy
dXB0cyA9IDxHSUNfU1BJIDY0NSBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+Owo+ICsgICAgICAgIHBv
d2VyLWRvbWFpbnMgPSA8JnNwbSBNVDgxOTVfUE9XRVJfRE9NQUlOX1ZET1NZUzA+Owo+ICsgICAg
ICAgIGNsb2NrcyA9IDwmdmRvc3lzMCBDTEtfVkRPMF9EU0NfV1JBUDA+Owo+ICsgICAgICAgIG1l
ZGlhdGVrLGdjZS1jbGllbnQtcmVnID0gPCZnY2UxIFNVQlNZU18xYzAwWFhYWCAweDkwMDAgMHgx
MDAwPjsKPiArICAgIH07Cj4gLS0KPiAyLjE4LjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
