Return-Path: <SRS0=NHOn=6A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA640C2BA2B
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Apr 2020 06:10:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 960AB20771
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Apr 2020 06:10:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AwDTzSLS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=vdorst.com header.i=@vdorst.com header.b="kD6sh925"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 960AB20771
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=vdorst.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Subject:To:From:Message-ID:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=kNmr8WPjNdKQAVLg3BXREpI4ir4R2ZBn7zOQoiKzkVw=; b=AwDTzSLSbEvesDox6aMc7AY8N
	bEZj5r00ei7I80h3GPYq9N69Gp/SrJ2x259j6FSRYqXb1wivUIOcMWWWjCUMRu+ZShpqPx6nVgqi5
	XKdrLeBDQ2cRnQwjoEdTgLHcVbi9iW4zBDU/s8VP7IrPJw7QaaWCnbARMdCxUpV4xuPlpRoppsz10
	OyUsIatyFzwRXLLlyXYuBIk5G6vtZB9RQ8T72SHM6Ji+BoMNMVlBOps3DCg0D1f4GIHM73229xpyR
	YGVql8DMbdDCAiaveV4qwoadQadM08FIWWLL4yERfghqNuxIgd+BRK/kFOlGUV5ZhKTP8CHnxIaRa
	wwXaPKffA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOxjL-0003yt-8D; Thu, 16 Apr 2020 06:10:31 +0000
Received: from mx.0dd.nl ([5.2.79.48])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOxjH-0003xv-AQ
 for linux-mediatek@lists.infradead.org; Thu, 16 Apr 2020 06:10:29 +0000
Received: from mail.vdorst.com (mail.vdorst.com [IPv6:fd01::250])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx.0dd.nl (Postfix) with ESMTPS id 276A05FBB5;
 Thu, 16 Apr 2020 08:10:14 +0200 (CEST)
Authentication-Results: mx.0dd.nl; dkim=pass (2048-bit key;
 secure) header.d=vdorst.com header.i=@vdorst.com header.b="kD6sh925"; 
 dkim-atps=neutral
Received: from www (www.vdorst.com [192.168.2.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id D97992A03EA;
 Thu, 16 Apr 2020 08:10:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.vdorst.com D97992A03EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdorst.com;
 s=default; t=1587017413;
 bh=nsUoDdbxuJyBFOL3kaUcgefxmeJY9720rZIwMxaY2EM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=kD6sh9255OsEt+FUrF98MDpi27Q11sfgqbaMLr4boQ/r+/y/KzsSRP0mSAGoVxPid
 BfdWlVhJjAkOnL8XlTQNL3/6So9hqWsiHaTJ68WdPIV39fF0K7yl6jTFXgc2pXBghQ
 cHDzPFw0VbOsvZ6+c9NSYfCvVMFAzO3LI9Owpdspidqh+JdXYnFz5iBafVJPisenuv
 hRKiyM8Xm2LI4Nl9f98nNLH6lJqcknntpEwC7LiSESx9l4+1mzNHD3PMR5CobEJDoY
 kYSfEC9OzXMSOlXksfQHgq39c04m424PDaNdT6WHNIZU+PUgBluqBt5kfggZP0o0Dg
 aJHj7SQOxurtw==
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1]) by
 www.vdorst.com (Horde Framework) with HTTPS; Thu, 16 Apr 2020 06:10:13 +0000
Date: Thu, 16 Apr 2020 06:10:13 +0000
Message-ID: <20200416061013.Horde.Np5evwFOb2fNckWIEDCbhBI@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: DENG Qingfang <dqfext@gmail.com>
Subject: Re: [PATCH net-next v2] net: dsa: mt7530: fix tagged frames
 pass-through in VLAN-unaware mode
In-Reply-To: <20200414063408.4026-1-dqfext@gmail.com>
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_231027_917700_2535AF69 
X-CRM114-Status: GOOD (  15.70  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Paul Fertser <fercerpav@gmail.com>,
 netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 riddlariddla@hotmail.com, linux-mediatek@lists.infradead.org,
 Stijn Segers <foss@volatilesystems.org>, CHEN Minqiang <ptpt52@gmail.com>,
 John Crispin <john@phrozen.org>, Szabolcs Hubai <szab.hu@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="Yes"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgUWluZ2ZhbmcsCgoKUXVvdGluZyBERU5HIFFpbmdmYW5nIDxkcWZleHRAZ21haWwuY29tPjoK
Cj4gSW4gVkxBTi11bmF3YXJlIG1vZGUsIHRoZSBFZ3Jlc3MgVGFnIChFR19UQUcpIGZpZWxkIGlu
IFBvcnQgVkxBTgo+IENvbnRyb2wgcmVnaXN0ZXIgbXVzdCBiZSBzZXQgdG8gQ29uc2lzdGVudCB0
byBsZXQgdGFnZ2VkIGZyYW1lcyBwYXNzCj4gdGhyb3VnaCBhcyBpcywgb3RoZXJ3aXNlIHRoZWly
IHRhZ3Mgd2lsbCBiZSBzdHJpcHBlZC4KClRoYW5rcyBmb3IgZml4aW5nIHRoZSB2bGFuIGlzc3Vl
cyEKClRlc3RlZC1ieTogUmVuw6kgdmFuIERvcnN0IDxvcGVuc291cmNlQHZkb3JzdC5jb20+CgpH
cmVhdHMsCgpSZW7DqQo+Cj4gRml4ZXM6IDgzMTYzZjdkY2E1NiAoIm5ldDogZHNhOiBtZWRpYXRl
azogYWRkIFZMQU4gc3VwcG9ydCBmb3IgTVQ3NTMwIikKPiBTaWduZWQtb2ZmLWJ5OiBERU5HIFFp
bmdmYW5nIDxkcWZleHRAZ21haWwuY29tPgo+IC0tLQo+IENoYW5nZXMgc2luY2UgdjE6Cj4gLSBG
aXggYnVpbGQgZXJyb3IKPgo+IC0tLQo+ICBkcml2ZXJzL25ldC9kc2EvbXQ3NTMwLmMgfCAxOCAr
KysrKysrKysrKystLS0tLS0KPiAgZHJpdmVycy9uZXQvZHNhL210NzUzMC5oIHwgIDcgKysrKysr
Kwo+ICAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZHNhL210NzUzMC5jIGIvZHJpdmVycy9uZXQvZHNh
L210NzUzMC5jCj4gaW5kZXggMmQwZDkxZGIwZGRiLi45NTFhNjVhYzdmNzMgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9uZXQvZHNhL210NzUzMC5jCj4gKysrIGIvZHJpdmVycy9uZXQvZHNhL210NzUz
MC5jCj4gQEAgLTg0Niw4ICs4NDYsOSBAQCBtdDc1MzBfcG9ydF9zZXRfdmxhbl91bmF3YXJlKHN0
cnVjdCBkc2Ffc3dpdGNoICAKPiAqZHMsIGludCBwb3J0KQo+ICAJICovCj4gIAltdDc1MzBfcm13
KHByaXYsIE1UNzUzMF9QQ1JfUChwb3J0KSwgUENSX1BPUlRfVkxBTl9NQVNLLAo+ICAJCSAgIE1U
NzUzMF9QT1JUX01BVFJJWF9NT0RFKTsKPiAtCW10NzUzMF9ybXcocHJpdiwgTVQ3NTMwX1BWQ19Q
KHBvcnQpLCBWTEFOX0FUVFJfTUFTSywKPiAtCQkgICBWTEFOX0FUVFIoTVQ3NTMwX1ZMQU5fVFJB
TlNQQVJFTlQpKTsKPiArCW10NzUzMF9ybXcocHJpdiwgTVQ3NTMwX1BWQ19QKHBvcnQpLCBWTEFO
X0FUVFJfTUFTSyB8IFBWQ19FR19UQUdfTUFTSywKPiArCQkgICBWTEFOX0FUVFIoTVQ3NTMwX1ZM
QU5fVFJBTlNQQVJFTlQpIHwKPiArCQkgICBQVkNfRUdfVEFHKE1UNzUzMF9WTEFOX0VHX0NPTlNJ
U1RFTlQpKTsKPgo+ICAJZm9yIChpID0gMDsgaSA8IE1UNzUzMF9OVU1fUE9SVFM7IGkrKykgewo+
ICAJCWlmIChkc2FfaXNfdXNlcl9wb3J0KGRzLCBpKSAmJgo+IEBAIC04NjMsOCArODY0LDggQEAg
bXQ3NTMwX3BvcnRfc2V0X3ZsYW5fdW5hd2FyZShzdHJ1Y3QgZHNhX3N3aXRjaCAgCj4gKmRzLCBp
bnQgcG9ydCkKPiAgCWlmIChhbGxfdXNlcl9wb3J0c19yZW1vdmVkKSB7Cj4gIAkJbXQ3NTMwX3dy
aXRlKHByaXYsIE1UNzUzMF9QQ1JfUChNVDc1MzBfQ1BVX1BPUlQpLAo+ICAJCQkgICAgIFBDUl9N
QVRSSVgoZHNhX3VzZXJfcG9ydHMocHJpdi0+ZHMpKSk7Cj4gLQkJbXQ3NTMwX3dyaXRlKHByaXYs
IE1UNzUzMF9QVkNfUChNVDc1MzBfQ1BVX1BPUlQpLAo+IC0JCQkgICAgIFBPUlRfU1BFQ19UQUcp
Owo+ICsJCW10NzUzMF93cml0ZShwcml2LCBNVDc1MzBfUFZDX1AoTVQ3NTMwX0NQVV9QT1JUKSwg
UE9SVF9TUEVDX1RBRwo+ICsJCQkgICAgIHwgUFZDX0VHX1RBRyhNVDc1MzBfVkxBTl9FR19DT05T
SVNURU5UKSk7Cj4gIAl9Cj4gIH0KPgo+IEBAIC04OTAsOCArODkxLDkgQEAgbXQ3NTMwX3BvcnRf
c2V0X3ZsYW5fYXdhcmUoc3RydWN0IGRzYV9zd2l0Y2ggIAo+ICpkcywgaW50IHBvcnQpCj4gIAkv
KiBTZXQgdGhlIHBvcnQgYXMgYSB1c2VyIHBvcnQgd2hpY2ggaXMgdG8gYmUgYWJsZSB0byByZWNv
Z25pemUgVklECj4gIAkgKiBmcm9tIGluY29taW5nIHBhY2tldHMgYmVmb3JlIGZldGNoaW5nIGVu
dHJ5IHdpdGhpbiB0aGUgVkxBTiB0YWJsZS4KPiAgCSAqLwo+IC0JbXQ3NTMwX3Jtdyhwcml2LCBN
VDc1MzBfUFZDX1AocG9ydCksIFZMQU5fQVRUUl9NQVNLLAo+IC0JCSAgIFZMQU5fQVRUUihNVDc1
MzBfVkxBTl9VU0VSKSk7Cj4gKwltdDc1MzBfcm13KHByaXYsIE1UNzUzMF9QVkNfUChwb3J0KSwg
VkxBTl9BVFRSX01BU0sgfCBQVkNfRUdfVEFHX01BU0ssCj4gKwkJICAgVkxBTl9BVFRSKE1UNzUz
MF9WTEFOX1VTRVIpIHwKPiArCQkgICBQVkNfRUdfVEFHKE1UNzUzMF9WTEFOX0VHX0RJU0FCTEVE
KSk7Cj4gIH0KPgo+ICBzdGF0aWMgdm9pZAo+IEBAIC0xMzgwLDYgKzEzODIsMTAgQEAgbXQ3NTMw
X3NldHVwKHN0cnVjdCBkc2Ffc3dpdGNoICpkcykKPiAgCQkJbXQ3NTMwX2NwdV9wb3J0X2VuYWJs
ZShwcml2LCBpKTsKPiAgCQllbHNlCj4gIAkJCW10NzUzMF9wb3J0X2Rpc2FibGUoZHMsIGkpOwo+
ICsKPiArCQkvKiBFbmFibGUgY29uc2lzdGVudCBlZ3Jlc3MgdGFnICovCj4gKwkJbXQ3NTMwX3Jt
dyhwcml2LCBNVDc1MzBfUFZDX1AoaSksIFBWQ19FR19UQUdfTUFTSywKPiArCQkJICAgUFZDX0VH
X1RBRyhNVDc1MzBfVkxBTl9FR19DT05TSVNURU5UKSk7Cj4gIAl9Cj4KPiAgCS8qIFNldHVwIHBv
cnQgNSAqLwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9kc2EvbXQ3NTMwLmggYi9kcml2ZXJz
L25ldC9kc2EvbXQ3NTMwLmgKPiBpbmRleCBlZjliNTJmMzE1MmIuLjI1MjgyMzJkMzMyNSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9kc2EvbXQ3NTMwLmgKPiArKysgYi9kcml2ZXJzL25ldC9k
c2EvbXQ3NTMwLmgKPiBAQCAtMTcyLDkgKzE3MiwxNiBAQCBlbnVtIG10NzUzMF9wb3J0X21vZGUg
ewo+ICAvKiBSZWdpc3RlciBmb3IgcG9ydCB2bGFuIGNvbnRyb2wgKi8KPiAgI2RlZmluZSBNVDc1
MzBfUFZDX1AoeCkJCQkoMHgyMDEwICsgKCh4KSAqIDB4MTAwKSkKPiAgI2RlZmluZSAgUE9SVF9T
UEVDX1RBRwkJCUJJVCg1KQo+ICsjZGVmaW5lICBQVkNfRUdfVEFHKHgpCQkJKCgoeCkgJiAweDcp
IDw8IDgpCj4gKyNkZWZpbmUgIFBWQ19FR19UQUdfTUFTSwkJUFZDX0VHX1RBRyg3KQo+ICAjZGVm
aW5lICBWTEFOX0FUVFIoeCkJCQkoKCh4KSAmIDB4MykgPDwgNikKPiAgI2RlZmluZSAgVkxBTl9B
VFRSX01BU0sJCQlWTEFOX0FUVFIoMykKPgo+ICtlbnVtIG10NzUzMF92bGFuX3BvcnRfZWdfdGFn
IHsKPiArCU1UNzUzMF9WTEFOX0VHX0RJU0FCTEVEID0gMCwKPiArCU1UNzUzMF9WTEFOX0VHX0NP
TlNJU1RFTlQgPSAxLAo+ICt9Owo+ICsKPiAgZW51bSBtdDc1MzBfdmxhbl9wb3J0X2F0dHIgewo+
ICAJTVQ3NTMwX1ZMQU5fVVNFUiA9IDAsCj4gIAlNVDc1MzBfVkxBTl9UUkFOU1BBUkVOVCA9IDMs
Cj4gLS0KPiAyLjI2LjAKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsK
