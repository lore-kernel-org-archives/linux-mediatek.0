Return-Path: <SRS0=FzvZ=IZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E14C433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 20:29:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C99FE61942
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 20:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C99FE61942
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C7JjmUyJgu9CKceOynB8obaSxAVn4IvSfh1FHUIBfAI=; b=efZlnAfdQHhpDJwxEd8mJuukx
	4XFlDnEnG81apjR//o6AHiZrP42N30SzzKBUWcEAUZ75Rd39I2dikz6P8vlylo1mR2KS0w4HnH0wq
	dskp6E7pXfwAAmcQ0rB4/tnw/VebfY732JN9Lgkoe5+L0khUfmk1ig8kL5UpOO0Yuo23TD5Dm03O4
	d2u94esLWXdTIN3KSVLnniym6C8b7hFn6QzdrfG/xpY51oUAasFJ2WO9CX7dDgbeubCbeF+vHcyua
	umYiSb659yzOWhMWXpKqFmSG2YQVpLsmK+FvbJqpg6UtRt9ZtD8dftzDJZ4ryuu0xY2bDFYc/j7PT
	ufyBtCi4w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQFYk-005VSC-Go; Sat, 27 Mar 2021 20:29:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQFYX-005VRW-Sk; Sat, 27 Mar 2021 20:29:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 714E361934;
 Sat, 27 Mar 2021 20:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616876947;
 bh=t3YCJEd2YPJjPW/VVlG0IFWi7wn9Hjx67R3VG5hzcl0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OVgsxOpRvQIxqPE+tVlAfHUdu4Ht9oWDHCLAsjOE+vmFKOWwLTVll1/pMalxxguzz
 2ABiCxzQfFjMsFbKs2dU1YJOawTUQHpaZ4upIfCNQyEdjgxPdF4BJGNrBSRdLmzubC
 MrIO4ZKx6Zwh+dcpDQPtcptA5fgGib+YCGrJbfpR+O5i7Qivb1uDlQdJ5vV8dqLpbI
 p6Sc1hHEyjZFotDKbVpYjg+CT5IffrUtBP88CF1gWk6yteub0wDpelOOuv47JyeJo1
 O0UK0jSAQSrvNT3blPK/jMLrwouakf5paB4o//qwQmiJrbGHv+QsiV3eRlqictBVn1
 j1cI2jkt4CQKQ==
Received: by pali.im (Postfix)
 id F180A95D; Sat, 27 Mar 2021 21:29:04 +0100 (CET)
Date: Sat, 27 Mar 2021 21:29:04 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Jianjun Wang <jianjun.wang@mediatek.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, youlin.pei@mediatek.com,
 chuanjia.liu@mediatek.com, qizhong.cheng@mediatek.com,
 sin_jieyang@mediatek.com, drinkcat@chromium.org,
 Rex-BC.Chen@mediatek.com, anson.chuang@mediatek.com,
 Krzysztof Wilczyski <kw@linux.com>
Subject: Re: [v9,5/7] PCI: mediatek-gen3: Add MSI support
Message-ID: <20210327202904.nvn7tfodmc2xw23l@pali>
References: <20210324030510.29177-1-jianjun.wang@mediatek.com>
 <20210324030510.29177-6-jianjun.wang@mediatek.com>
 <20210327192837.4rr46oeiuokritlc@pali>
 <87o8f4fkkh.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o8f4fkkh.wl-maz@kernel.org>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_202914_296801_B3C9F424 
X-CRM114-Status: GOOD (  29.18  )
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

T24gU2F0dXJkYXkgMjcgTWFyY2ggMjAyMSAxOTo0NDozMCBNYXJjIFp5bmdpZXIgd3JvdGU6Cj4g
T24gU2F0LCAyNyBNYXIgMjAyMSAxOToyODozNyArMDAwMCwKPiBQYWxpIFJvaMOhciA8cGFsaUBr
ZXJuZWwub3JnPiB3cm90ZToKPiA+IAo+ID4gT24gV2VkbmVzZGF5IDI0IE1hcmNoIDIwMjEgMTE6
MDU6MDggSmlhbmp1biBXYW5nIHdyb3RlOgo+ID4gPiArc3RhdGljIHZvaWQgbXRrX3BjaWVfbXNp
X2hhbmRsZXIoc3RydWN0IG10a19wY2llX3BvcnQgKnBvcnQsIGludCBzZXRfaWR4KQo+ID4gPiAr
ewo+ID4gPiArCXN0cnVjdCBtdGtfbXNpX3NldCAqbXNpX3NldCA9ICZwb3J0LT5tc2lfc2V0c1tz
ZXRfaWR4XTsKPiA+ID4gKwl1bnNpZ25lZCBsb25nIG1zaV9lbmFibGUsIG1zaV9zdGF0dXM7Cj4g
PiA+ICsJdW5zaWduZWQgaW50IHZpcnE7Cj4gPiA+ICsJaXJxX2h3X251bWJlcl90IGJpdCwgaHdp
cnE7Cj4gPiA+ICsKPiA+ID4gKwltc2lfZW5hYmxlID0gcmVhZGxfcmVsYXhlZChtc2lfc2V0LT5i
YXNlICsgUENJRV9NU0lfU0VUX0VOQUJMRV9PRkZTRVQpOwo+ID4gPiArCj4gPiA+ICsJZG8gewo+
ID4gPiArCQltc2lfc3RhdHVzID0gcmVhZGxfcmVsYXhlZChtc2lfc2V0LT5iYXNlICsKPiA+ID4g
KwkJCQkJICAgUENJRV9NU0lfU0VUX1NUQVRVU19PRkZTRVQpOwo+ID4gPiArCQltc2lfc3RhdHVz
ICY9IG1zaV9lbmFibGU7Cj4gPiA+ICsJCWlmICghbXNpX3N0YXR1cykKPiA+ID4gKwkJCWJyZWFr
Owo+ID4gPiArCj4gPiA+ICsJCWZvcl9lYWNoX3NldF9iaXQoYml0LCAmbXNpX3N0YXR1cywgUENJ
RV9NU0lfSVJRU19QRVJfU0VUKSB7Cj4gPiA+ICsJCQlod2lycSA9IGJpdCArIHNldF9pZHggKiBQ
Q0lFX01TSV9JUlFTX1BFUl9TRVQ7Cj4gPiA+ICsJCQl2aXJxID0gaXJxX2ZpbmRfbWFwcGluZyhw
b3J0LT5tc2lfYm90dG9tX2RvbWFpbiwgaHdpcnEpOwo+ID4gPiArCQkJZ2VuZXJpY19oYW5kbGVf
aXJxKHZpcnEpOwo+ID4gPiArCQl9Cj4gPiA+ICsJfSB3aGlsZSAodHJ1ZSk7Cj4gPiAKPiA+IEhl
bGxvIQo+ID4gCj4gPiBKdXN0IGEgcXVlc3Rpb24sIGNhbm5vdCB0aGlzIHdoaWxlLWxvb3AgY2F1
c2UgYmxvY2sgb2YgcHJvY2Vzc2luZyBvdGhlcgo+ID4gaW50ZXJydXB0cz8KPiAKPiBUaGlzIGlz
IGEgbGV2ZWwgaW50ZXJydXB0LiBZb3UgZG9uJ3QgaGF2ZSBtdWNoIGNob2ljZSBidXQgdG8gaGFu
ZGxlIGl0Cj4gaW1tZWRpYXRlbHksIGFsdGhvdWdoIGFuIGFsdGVybmF0aXZlIHdvdWxkIGJlIHRv
IG1hc2sgaXQgYW5kIGRlYWwgd2l0aAo+IGl0IGluIGEgdGhyZWFkLiBBbmQgc2luY2UgTGludXgg
ZG9lc24ndCBkZWFsIHdpdGggaW50ZXJydXB0IHByaW9yaXR5LAo+IGEgc2NyZWFtaW5nIGludGVy
cnVwdCBpcyBuZXZlciBhIGdvb2QgdGhpbmcuCgpJIHNlZS4gU29tZXRoaW5nIGxpa2UgImludGVy
cnVwdCBwcmlvcml0eSIgKHdoaWNoIGRvZXMgbm90IGV4aXN0Pykgd291bGQKYmUgbmVlZGVkIHRv
IGhhbmRsZSBpdC4KCj4gPiBJIGhhdmUgZG9uZSB0ZXN0cyB3aXRoIGRpZmZlcmVudCBIVyAoYWFy
ZHZhcmspIGJ1dCB3aXRoIHNhbWUgd2hpbGUodHJ1ZSkKPiA+IGxvb3AgbG9naWMuIE9uZSBYSENJ
IFBDSWUgY29udHJvbGxlciB3YXMgc2VuZGluZyBNU0kgaW50ZXJydXB0cyB0b28gZmFzdAo+ID4g
YW5kIGludGVycnVwdCBoYW5kbGVyIHdpdGggdGhpcyB3aGlsZSh0cnVlKSBsb2dpYyB3YXMgaW4g
aW5maW5pdGUgbG9vcC4KPiA+IER1cmluZyBvbmUgSVJRIGl0IHdhcyBjYWxsaW5nIGluZmluaXRl
IG1hbnkgdGltZXMgZ2VuZXJpY19oYW5kbGVfaXJxKCkKPiA+IGFzIEhXIHdhcyBmZWVkaW5nIG5l
dyBhbmQgbmV3IE1TSSBod2lycSBpbnRvIHN0YXR1cyByZWdpc3Rlci4KPiAKPiBEZWZpbmUgInRv
byBmYXN0Ii4KCkZhc3QgLSBuZXh0IGludGVycnVwdCBjb21lcyBwcmlvciBjaGVja2luZyBpZiB3
aGlsZSh0cnVlKS1sb29wIHNob3VsZCBzdG9wLgoKPiBJZiBzb21ldGhpbmcgaW4gdGhlIHN5c3Rl
bSBpcyBhYmxlIHRvIHByb2dyYW0gdGhlCj4gWEhDSSBkZXZpY2UgaW4gc3VjaCBhIHdheSB0aGF0
IGl0IGNhdXNlcyBhIHNjcmVhbWluZyBpbnRlcnJ1cHQsIHRoYXQncwo+IHRoZSBwbGFjZSB0byBs
b29rIGZvciBwcm9ibGVtcywgYW5kIHByb2JhYmx5IG5vdCBpbiB0aGUgaW50ZXJydXB0Cj4gaGFu
ZGxpbmcgaXRzZWxmLCB3aGljaCBkb2VzIHdoYXQgaXQgaXMgc3VwcG9zZWQgdG8gZG8uCj4gCj4g
PiBCdXQgdGhpcyBpcyBkaWZmZXJlbnQgSFcsIHNvIGl0IGNhbiBoYXZlIGRpZmZlcmVudCBiZWhh
dmlvciBhbmQgZG9lcyBub3QKPiA+IGhhdmUgdG8gY2F1c2UgYWJvdmUgaXNzdWUuCj4gPiAKPiA+
IEkgaGF2ZSBqdXN0IHNwb3R0ZWQgc2FtZSBjb2RlIHBhdHRlcm4gZm9yIHByb2Nlc3NpbmcgTVNJ
IGludGVycnVwdHMuLi4KPiAKPiBUaGlzIGlzIGEgY29tbW9uIHBhdHRlcm4gdGhhdCB5b3Ugd2ls
bCBmaW5kIGluIHByZXR0eSBtdWNoIGFueQo+IGludGVycnVwdCBoYW5kbGluZy9kZW11eGluZywg
YW5kIGlzIGRvbmUgdGhpcyB3YXkgd2hlbiB0aGUgY29zdCBvZgo+IHRha2luZyB0aGUgZXhjZXB0
aW9uIGlzIGhpZ2ggY29tcGFyZWQgdG8gdGhhdCBvZiBoYW5kbGluZyBpdC4KCkFuZCB3b3VsZCBu
b3QgaGVscCBpZiB3aGlsZSh0cnVlKS1sb29wIGlzIHJlcGxhY2VkIGJ5IGxvb3Agd2l0aCB1cHBl
cgpsaW1pdCBvZiBpdGVyYXRpb25zPyBPciBqdXN0IGNhbGwgb25seSBvbmUgaXRlcmF0aW9uPwoK
PiBXaGljaCBpcyBwcmV0dHkgbXVjaCBhbnkgb2YgdGhlIGJhZGx5IGRlc2lnbmVkLCBsZXZlbC1k
cml2aW5nLAo+IERXLWluc3BpcmVkLCBzb3JyeSBleGN1c2UgZm9yIE1TSSBpbXBsZW1lbnRhdGlv
bnMgdGhhdCBhcmUgcG9wdWxhciBvbgo+IGxvdy1lbmQgQVJNIFNvQ3MuCgpPay4gU28gdGhhbmsg
eW91IGZvciBpbmZvcm1hdGlvbiEKCj4gVGhhbmtzLAo+IAo+IAlNLgo+IAo+IC0tIAo+IFdpdGhv
dXQgZGV2aWF0aW9uIGZyb20gdGhlIG5vcm0sIHByb2dyZXNzIGlzIG5vdCBwb3NzaWJsZS4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
