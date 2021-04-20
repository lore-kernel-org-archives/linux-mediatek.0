Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA68C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 11:01:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3839A6113C
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 11:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3839A6113C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Subject:Cc:To:
	From:Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VxQamy9nc29So4qKq4mwArNW1uQzMaQChlQUr4E7BjQ=; b=AeT2fpipPIktMD3MrRTni8XzO
	+BOyoEdLi4eoqKj3s46I5fhA9e4dYmcGq3nN6NH8MXxPaXausaD41fzZVFztHsyro3vM3PfcPTpFC
	FEnfQoHxzYGBT+zHmg8xUXHTtQSGPZ4+3LBmaOG4eeUhq1MChj/67GAqLJrB2MnmWFl5SC+MKqgkB
	sV269m4qMviJLiw8XD53OFIaqfoUcuZSQILkRp/tFL2Nti79dsvzs2g4R9O6+37OnZGQVFVxoiaEz
	inQLfB5k4gec5IGmoQNZSUT0UqG4f/JaSR2Fk9T/MZ22NJQtJ1yPjTV+5T92BWpaqoKfLtRR1FuE+
	BYXB5yROg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYo8H-00Bvd9-BK; Tue, 20 Apr 2021 11:01:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYo85-00Bvc9-Mi; Tue, 20 Apr 2021 11:01:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:
 Message-ID:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=Hex7IuSfAsYYVXjveLvg9+6w7aJKwmRFVoGTY66XG/Q=; b=man7pWtb1QBDvw9vXfzfZTilTp
 +DDZxMaZLLSKFZgb1J6D78XNGiXEQKsrbCpH+kx3LO1lXv/RQPjg5vgLIC9fovSA4sgugQgqS9sem
 cbrStQfYZnxtoRWQY/DIWlJ/OPTAYm5VLD/29lWqxgGud13I5JTpSDxRoE/YIcGKXS0Cam4g/Ig2h
 DAtJjw8QKjO4pFS/KCY1Jmz8pFnpblWziKoiBubmPrK4kLqVVTSF35bX9vIYxVBxQlx8c4S5E7lsE
 I8zHfkXg4DSNjrHBT4U+cDVitbVvV7uEYiUikcmYM707MmLJ5YWqB66qtagzbR1k/8tBzOJodKAhX
 ksuciiTQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYo82-00C31s-UM; Tue, 20 Apr 2021 11:01:16 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5A44B61026;
 Tue, 20 Apr 2021 11:01:14 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1lYo80-008TZz-2b; Tue, 20 Apr 2021 12:01:12 +0100
Date: Tue, 20 Apr 2021 12:01:10 +0100
Message-ID: <87bla9qky1.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc: Jianjun Wang <jianjun.wang@mediatek.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 youlin.pei@mediatek.com, chuanjia.liu@mediatek.com,
 qizhong.cheng@mediatek.com, sin_jieyang@mediatek.com,
 drinkcat@chromium.org, Rex-BC.Chen@mediatek.com, anson.chuang@mediatek.com,
 Krzysztof Wilczyski <kw@linux.com>
Subject: Re: [PATCH v10 5/7] PCI: mediatek-gen3: Add MSI support
In-Reply-To: <20210420094402.hwdkbspl5wu4rtex@pali>
References: <20210420061723.989-1-jianjun.wang@mediatek.com>
 <20210420061723.989-6-jianjun.wang@mediatek.com>
 <20210420094402.hwdkbspl5wu4rtex@pali>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: pali@kernel.org, jianjun.wang@mediatek.com,
 bhelgaas@google.com, robh+dt@kernel.org, lorenzo.pieralisi@arm.com,
 ryder.lee@mediatek.com, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, youlin.pei@mediatek.com,
 chuanjia.liu@mediatek.com, qizhong.cheng@mediatek.com,
 sin_jieyang@mediatek.com, drinkcat@chromium.org, Rex-BC.Chen@mediatek.com,
 anson.chuang@mediatek.com, kw@linux.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_040115_083113_E7A7BF60 
X-CRM114-Status: GOOD (  25.38  )
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

T24gVHVlLCAyMCBBcHIgMjAyMSAxMDo0NDowMiArMDEwMCwKUGFsaSBSb2jDoXIgPHBhbGlAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4gCj4gSGVsbG8hCj4gCj4gT24gVHVlc2RheSAyMCBBcHJpbCAyMDIx
IDE0OjE3OjIxIEppYW5qdW4gV2FuZyB3cm90ZToKPiA+ICtzdGF0aWMgdm9pZCBtdGtfcGNpZV9l
bmFibGVfbXNpKHN0cnVjdCBtdGtfcGNpZV9wb3J0ICpwb3J0KQo+ID4gK3sKPiA+ICsJaW50IGk7
Cj4gPiArCXUzMiB2YWw7Cj4gPiArCj4gPiArCWZvciAoaSA9IDA7IGkgPCBQQ0lFX01TSV9TRVRf
TlVNOyBpKyspIHsKPiA+ICsJCXN0cnVjdCBtdGtfbXNpX3NldCAqbXNpX3NldCA9ICZwb3J0LT5t
c2lfc2V0c1tpXTsKPiA+ICsKPiA+ICsJCW1zaV9zZXQtPmJhc2UgPSBwb3J0LT5iYXNlICsgUENJ
RV9NU0lfU0VUX0JBU0VfUkVHICsKPiA+ICsJCQkJaSAqIFBDSUVfTVNJX1NFVF9PRkZTRVQ7Cj4g
PiArCQltc2lfc2V0LT5tc2dfYWRkciA9IHBvcnQtPnJlZ19iYXNlICsgUENJRV9NU0lfU0VUX0JB
U0VfUkVHICsKPiA+ICsJCQkJICAgIGkgKiBQQ0lFX01TSV9TRVRfT0ZGU0VUOwo+ID4gKwo+ID4g
KwkJLyogQ29uZmlndXJlIHRoZSBNU0kgY2FwdHVyZSBhZGRyZXNzICovCj4gPiArCQl3cml0ZWxf
cmVsYXhlZChsb3dlcl8zMl9iaXRzKG1zaV9zZXQtPm1zZ19hZGRyKSwgbXNpX3NldC0+YmFzZSk7
Cj4gPiArCQl3cml0ZWxfcmVsYXhlZCh1cHBlcl8zMl9iaXRzKG1zaV9zZXQtPm1zZ19hZGRyKSwK
PiA+ICsJCQkgICAgICAgcG9ydC0+YmFzZSArIFBDSUVfTVNJX1NFVF9BRERSX0hJX0JBU0UgKwo+
ID4gKwkJCSAgICAgICBpICogUENJRV9NU0lfU0VUX0FERFJfSElfT0ZGU0VUKTsKPiAKPiBUaGlz
IGxvb2tzIGxpa2UgYXMgc2V0dGluZyBNU0kgZG9vcmJlbGwgYWRkcmVzcyB0byBNU0kgZG9vcmJl
bGwgYWRkcmVzcy4KPiAKPiA+ICtzdGF0aWMgdm9pZCBtdGtfY29tcG9zZV9tc2lfbXNnKHN0cnVj
dCBpcnFfZGF0YSAqZGF0YSwgc3RydWN0IG1zaV9tc2cgKm1zZykKPiA+ICt7Cj4gPiArCXN0cnVj
dCBtdGtfbXNpX3NldCAqbXNpX3NldCA9IGlycV9kYXRhX2dldF9pcnFfY2hpcF9kYXRhKGRhdGEp
Owo+ID4gKwlzdHJ1Y3QgbXRrX3BjaWVfcG9ydCAqcG9ydCA9IGRhdGEtPmRvbWFpbi0+aG9zdF9k
YXRhOwo+ID4gKwl1bnNpZ25lZCBsb25nIGh3aXJxOwo+ID4gKwo+ID4gKwlod2lycSA9CWRhdGEt
Pmh3aXJxICUgUENJRV9NU0lfSVJRU19QRVJfU0VUOwo+ID4gKwo+ID4gKwltc2ctPmFkZHJlc3Nf
aGkgPSB1cHBlcl8zMl9iaXRzKG1zaV9zZXQtPm1zZ19hZGRyKTsKPiA+ICsJbXNnLT5hZGRyZXNz
X2xvID0gbG93ZXJfMzJfYml0cyhtc2lfc2V0LT5tc2dfYWRkcik7Cj4gPiArCW1zZy0+ZGF0YSA9
IGh3aXJxOwo+ID4gKwlkZXZfZGJnKHBvcnQtPmRldiwgIm1zaSMlI2x4IGFkZHJlc3NfaGkgJSN4
IGFkZHJlc3NfbG8gJSN4IGRhdGEgJWRcbiIsCj4gPiArCQlod2lycSwgbXNnLT5hZGRyZXNzX2hp
LCBtc2ctPmFkZHJlc3NfbG8sIG1zZy0+ZGF0YSk7Cj4gCj4gLi4uIHdoaWNoIGlzIGxhdGVyIHVz
ZWQgaW4gY29tcG9zZV9tc2lfbXNnKCkuCj4gCj4gTWFyYyBpbiBzb21lIG90aGVyIHBhdGNoZXMg
Zm9yIG90aGVyIHBjaSBjb250cm9sbGVyIGRyaXZlcnMgY2hhbmdlZCB0aGlzCj4gYWRkcmVzcyB0
byBqdXN0IG1haW4gInBvcnQiIHN0cnVjdHVyZS4gSXQgc2ltcGxpZmllZCBpbXBsZW1lbnRhdGlv
bnMgYW5kCj4gYWxzbyBhdm9pZGVkIG5lZWQgdG8gZGVjbGFyZSBhZGRpdGlvbmFsIG1lbWJlciAi
bXNnX2FkZHIiLgo+IAo+IE1hcmMsIHdvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIHNpbXBsaWZ5IGl0
IGFsc28gZm9yIHRoaXMgZHJpdmVyIGFuZCBqdXN0Cj4gc2V0IG1zZ19hZGRyIHRvIHZpcnRfdG9f
cGh5cyhwb3J0KT8KCk1heWJlLiBJdCByZWFsbHkgZGVwZW5kcyBvbiB3aGF0IHJhbmdlIHRoZSBI
VyBhY2NlcHRzLCBhbmQgdGhlIHNvbGUKcmVxdWlyZW1lbnQgaXMgdG8gdXNlIGFuIGFkZHJlc3Mg
dGhhdCB0aGUgZW5kcG9pbnQgY2Fubm90IERNQQp0by4gSGVyZSwgdGhlIGRyaXZlciBzZWVtcyB0
byBiZSB1c2luZyBzb21ldGhpbmcgYmFzZWQgb24gdGhlIHBvcnQKYmFzZSBhZGRyZXNzLCB3aGlj
aCBpcyBnb29kIGVub3VnaCBhcyBmYXIgYXMgSSBhbSBjb25jZXJuZWQgKHRoZSB0aGluZwpJIHVz
dWFsbHkgb2JqZWN0IHRvIGlzIHRoZSBhbGxvY2F0aW9uIG9mIG1lbW9yeSBqdXN0IGZvciB0aGUg
c2FrZSBvZgpnZXR0aW5nIGEgY2FwdHVyZSBhZGRyZXNzKS4KCklmIHlvdSB3YW50IHRvIGZ1cnRo
ZXIgc2ltcGxpZnkgaXQsIHlvdSBjb3VsZCBzaW1wbHkgdXNlIHBvcnQucmVnX2Jhc2UKYXMgdGhl
IE1TSSBhZGRyZXNzIGZvciBhbGwgc2V0cywgYXMgSSBkb24ndCB0aGluayB0aGV5IGhhdmUgdG8g
YmUKZGlzdGluY3QuIEJ1dCBzb21lb25lIHdpdGggYWNjZXNzIHRvIHRoZSBUUk0gZm9yIHRoaXMg
c2hvdWxkIGdvIGFuZApjaGVjayBpdC4KCkkgZG9uJ3QgYmVsaWV2ZSB0aGlzIHNob3VsZCBnYXRl
IHRoZSBtZXJnaW5nIG9kIHRoaXMgZHJpdmVyIHRob3VnaC4KCglNLgoKLS0gCldpdGhvdXQgZGV2
aWF0aW9uIGZyb20gdGhlIG5vcm0sIHByb2dyZXNzIGlzIG5vdCBwb3NzaWJsZS4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
