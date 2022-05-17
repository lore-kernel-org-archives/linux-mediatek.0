Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C83C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 13:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hLNniTLsVjVFe51xTeEVPpQMx3+vlhhL7bOFV/xbsIw=; b=jHnsW1TjVK3w0d
	XBSzy8BAu+39wNem+KkBC4wUPyDzJBnJeV/VMuD20pokgIoDHmm0XQ/29dH+DRzP6LtdwCaGTxGfk
	Pk+7v0TV5w0EMpQ5tsT4Tx2D1PC2rb20INlQ31RuOooBmMkWacaz6sjM+7BaxDYpOMKBAq+Bcg1hg
	rOkha8EXVVDuqlo6BXSqiQkizGaedkljar5HSxBA5bEMjgCCzsfC0N3dg+RfaoiLg3zlR6uX9mykC
	nvGsbhcfFJhReR7vwkQY7XkS1TxkJ57snqKMrCWTUYRQjyEENNlkYLKgwXbNmHeqWDPFLa8q6aad+
	8hPT5879fI3H6fTAYdrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqxbE-00E4pw-Cx; Tue, 17 May 2022 13:50:56 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqxUL-00E18B-7m; Tue, 17 May 2022 13:43:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 003711F444FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652795027;
 bh=+vxAUI6qKyUQAmObp8ZvzIBwGFIgr6ojIgBi09Xt4YM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aAhhin3zWwGwST2l5CGT5EBMXYau3h/7LjM8C7QMtUBkMoSQmLPDrlI8TM4gNUkhx
 95LdjA07hdX49lW/mb9NQWTPNX2sCDNmVGnd7WBpvr8pMqlZfpiDSwkg2ODpwPhGdi
 fg6d/IW5XbbzLEo2AJTYk8H8Zvor7jSPviWugyVEdUMWRP6Mdi3/VOSE+eXAQtcfxl
 RSu7P1Oh3VTL/oHBmTIJnpvUOBunvX1aDn0itF6moexJ6tIVzBXnb5jBZzQITyq92s
 akuTAxQ0KDTfHbbnm0Mce0Rt5RTxvZLdI5MXW+yUD5vhOlcR1ecD+d6QKER1FwISoF
 5BEwdKulF4KzQ==
Message-ID: <7f1660f4-63bd-8f24-4c7a-4b92f0d38e16@collabora.com>
Date: Tue, 17 May 2022 15:43:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 0/6] dt-bindings: arm: MediaTek: Fix clock bindings
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>, robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, sboyd@kernel.org,
 chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com, wenst@chromium.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220517101514.21639-1-angelogioacchino.delregno@collabora.com>
 <21581440-a65c-ee8c-95e4-0e179c2838dd@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <21581440-a65c-ee8c-95e4-0e179c2838dd@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_064349_448356_4430C7EE 
X-CRM114-Status: GOOD (  13.94  )
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

SWwgMTcvMDUvMjIgMTU6MzksIE1hdHRoaWFzIEJydWdnZXIgaGEgc2NyaXR0bzoKPiAKPiAKPiBP
biAxNy8wNS8yMDIyIDEyOjE1LCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToKPj4g
QXMgcGVyIFJvYiBIZXJyaW5nJ3MgcmV2aWV3IFsxXSBvbiBteSBtdDY3OTUgY2xvY2tzIGJpbmRp
bmdzIHBhdGNoZXMsIGZvcgo+PiB3aGljaCBJJ3ZlIHVzZWQgdGhlIGFscmVhZHkgdXBzdHJlYW1l
ZCBvbmVzIGFzIGEgYmFzZSwgaXQgd2FzIGZvdW5kIHRoYXQKPj4gdGhlc2UgYmluZGluZ3MgaGF2
ZSBzb21lIGlzc3Vlcy4KPj4gVGhpcyBzZXJpZXMgaXMgYWRkcmVzc2luZyB0aGUgaXNzdWVzIHRo
YXQgd2VyZSBmb3VuZCBieSBSb2Igb24gbXkgc2VyaWVzLAo+PiB3aGljaCBhcmUgcHJlc2VudCBv
biBhbGwgb2YgdGhlIGFscmVhZHkgbWVyZ2VkIGJpbmRpbmdzLgo+Pgo+PiBbMV06IAo+PiBodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAy
MjA1MTMxNjUwNTAuNTAwODMxLTUtYW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEu
Y29tLyMyNDg1OTk1MyAKPj4KPiAKPiBJIHdvdWxkIHNheSB3ZSBjb3VsZCBzcXVhc2ggcGF0Y2hl
cyBoZXJlIGFuZCBtYWtlIGl0IDMgaW5zdGVhZCBvZiA2Lgo+IEluIGFueSBjYXNlIGZvciB0aGUg
d2hvbGUgc2VyaWVzOgo+IAo+IFJldmlld2VkLWJ5OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlh
cy5iZ2dAZ21haWwuY29tPgo+IAoKSSBoYWQgdGhlIHNhbWUgaW5pdGlhbCBpZGVhLCBidXQgY2hv
c2UgdG8gZG8gaXQgaW4gNiBwYXRjaGVzIGJlY2F1c2Ugb3RoZXJ3aXNlCnRoZSB0aXRsZXMgd291
bGQgYmUgdG9vIGdlbmVyaWMgYW5kIG5vdCByZWFsbHkgZWZmZWN0dWFsIGluIHRoZSBlbmQuLi4K
CklmIGFueW9uZSB3YW50cyB0aGVtIHNxdWFzaGVkLCBub3cgeW91IGtub3cgd2hhdCB3YXMgbXkg
ZGlmZmljdWx0eSBhbmQgbXkKcmVhc29ucyA6LSkKCkJ5IHRoZSB3YXksIHRoYW5rIHlvdSEKCj4+
Cj4+IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vICg2KToKPj4gwqDCoCBkdC1iaW5kaW5nczog
YXJtOiBtdDgxODYtY2xvY2s6IFJlbW92ZSB1bm5lY2Vzc2FyeSAnaXRlbXMnIGFuZCBmaXgKPj4g
wqDCoMKgwqAgZm9ybWF0dGluZwo+PiDCoMKgIGR0LWJpbmRpbmdzOiBhcm06IG10ODE4NjogU2V0
ICNjbG9jay1jZWxscyBhcyByZXF1aXJlZCBwcm9wZXJ0eQo+PiDCoMKgIGR0LWJpbmRpbmdzOiBh
cm06IG10ODE5NS1jbG9jazogUmVtb3ZlIHVubmVjZXNzYXJ5ICdpdGVtcycgYW5kIGZpeAo+PiDC
oMKgwqDCoCBmb3JtYXR0aW5nCj4+IMKgwqAgZHQtYmluZGluZ3M6IGFybTogbXQ4MTk1OiBTZXQg
I2Nsb2NrLWNlbGxzIGFzIHJlcXVpcmVkIHByb3BlcnR5Cj4+IMKgwqAgZHQtYmluZGluZ3M6IGFy
bTogbXQ4MTkyLWNsb2NrOiBSZW1vdmUgdW5uZWNlc3NhcnkgJ2l0ZW1zJwo+PiDCoMKgIGR0LWJp
bmRpbmdzOiBhcm06IG10ODE5MjogU2V0ICNjbG9jay1jZWxscyBhcyByZXF1aXJlZCBwcm9wZXJ0
eQo+Pgo+PiDCoCAuLi4vYXJtL21lZGlhdGVrL21lZGlhdGVrLG10ODE4Ni1jbG9jay55YW1swqDC
oCB8IDI5ICsrKystLS0tLQo+PiDCoCAuLi4vbWVkaWF0ZWsvbWVkaWF0ZWssbXQ4MTg2LXN5cy1j
bG9jay55YW1swqDCoCB8wqAgMSArCj4+IMKgIC4uLi9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssbXQ4
MTkyLWNsb2NrLnlhbWzCoMKgIHwgNDYgKysrKysrKy0tLS0tLS0tCj4+IMKgIC4uLi9tZWRpYXRl
ay9tZWRpYXRlayxtdDgxOTItc3lzLWNsb2NrLnlhbWzCoMKgIHzCoCAxICsKPj4gwqAgLi4uL2Fy
bS9tZWRpYXRlay9tZWRpYXRlayxtdDgxOTUtY2xvY2sueWFtbMKgwqAgfCA1OSArKysrKysrKysr
LS0tLS0tLS0tCj4+IMKgIC4uLi9tZWRpYXRlay9tZWRpYXRlayxtdDgxOTUtc3lzLWNsb2NrLnlh
bWzCoMKgIHzCoCAxICsKPj4gwqAgNiBmaWxlcyBjaGFuZ2VkLCA3MSBpbnNlcnRpb25zKCspLCA2
NiBkZWxldGlvbnMoLSkKPj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
