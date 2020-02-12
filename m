Return-Path: <SRS0=vX0G=4A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C97C2BA83
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 16:27:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AC3D20714
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 16:27:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FgWL6DMI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AC3D20714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mclink.it
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dZm4i1Kh+/ljipD2RYOg6V4HC0US3wHywbDQWF6Gt/A=; b=FgWL6DMIfPgy4QWK50ra5TUNmr
	GwOIDzBD94LvaDuujUo08+jVWFn64NwLC9d9ij3yB2ibJ8HFwRIq0/F+D0fjwglTKr+WsfW1rWTrC
	n/DKw6EDrj33XoPFjnZfdOn22NsawTR3YM9HXYbGupKEg6twsQPqW/0u01jUobzj9pXxg8OkaR6w4
	woOHM+qd9WslmMEqVA3rHEOTYnnEAYfhLJCfAsF4HM55TRguiQoLufpdSm3Gb+yFQCW0hPVEpOZO0
	li7jD8Lw9a9QEnIpxF/yJI7qJoASjY1bvf5bIWIE5mMVTcXgInrIizhYGjR8/4bJUNe8vOsKg36T+
	XWDo31Ew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1urT-0007zL-37; Wed, 12 Feb 2020 16:27:39 +0000
Received: from relaygw2-1.mclink.it ([213.21.178.136])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1urQ-0007yw-1z
 for linux-mediatek@lists.infradead.org; Wed, 12 Feb 2020 16:27:38 +0000
Received: from smtpoutgw1.mclink.it ([172.24.30.41] verified)
 by relaygw2-1.mclink.it (CommuniGate Pro SMTP 6.0.4)
 with ESMTP id 162396622 for linux-mediatek@lists.infradead.org;
 Wed, 12 Feb 2020 17:27:29 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DCAQD2JkRe/yslA1cNWBwBAQEBAQcBA?=
 =?us-ascii?q?REBBAQBAYF7gxWBMYQUkQUlg26GAoE+ilGFOwkBAQEBAQEBAQEgCwwEAQGEQAK?=
 =?us-ascii?q?CbTgTAhABAQYBAQEBAQUEhiSFcgEBAQECAQEBIQQLATsQCwkCGAICJgICJwEvB?=
 =?us-ascii?q?gEMBgIBAYMiAYJWBS+QA5sEdX8zhUqDQ4E+gQ4qjH2BQYERJwyCYD6BBIFgAQS?=
 =?us-ascii?q?EcoJeBIE/AQEBrjMBBgKBYlqHTYkrhVMGHINCl1OOaIhujjOGHYF6gUCBHoFOC?=
 =?us-ascii?q?UcljikMC4hkhUBzkWEBAQ?=
Received: from host43-37-dynamic.3-87-r.retail.telecomitalia.it (HELO
 [192.168.7.101]) ([87.3.37.43])
 by smtpoutgw1.mclink.it with ESMTP; 12 Feb 2020 17:27:27 +0100
Subject: Re: Enabling MMC on MT7628 SoC
To: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 linux-mips@vger.kernel.org
References: <e6c30f55-5f65-b165-4c5d-1d25a425e744@mclink.it>
 <ae707c5d-3c3c-724d-1eba-adcb1db52eb9@gmail.com>
From: Mauro Condarelli <mc5686@mclink.it>
Message-ID: <38cf727e-4694-ab09-ab10-04d48660c838@mclink.it>
Date: Wed, 12 Feb 2020 17:27:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <ae707c5d-3c3c-724d-1eba-adcb1db52eb9@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_082736_424307_E3434677 
X-CRM114-Status: GOOD (  16.31  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

VGhhbmtzIE1hdHRoaWFzLAoKT24gMi8xMS8yMCA1OjE1IFBNLCBNYXR0aGlhcyBCcnVnZ2VyIHdy
b3RlOgo+IFtBZGRpbmcgTUlQUyBwZW9wbGUgdG8gdGhlIGxvb3BdCj4KPiBPbiAwMS8wMi8yMDIw
IDE3OjA2LCBNYXVybyBDb25kYXJlbGxpIHdyb3RlOgo+PiBIaSwKPj4gSSdtIHRyeWluZyB0byBl
bmFibGUgTU1DL1NEIGFjY2VzcyBvbiBhIFZvQ29yZTIgU09NIChiYXNlZCBvbiBNVDc2MjgpCj4+
IHVzaW5nIG10a19zZCBkcml2ZXIuCj4+Cj4+IEp1c3QgZW5hYmxpbmcgbXRrX3NkIHdpbGwgYm9t
YiB3aXQgdW5kZWZpbmVkIGZ1bmN0aW9uIGBjbGtfZ2V0X3BhcmVudGA7Cj4+IHRoaXMgY2FuIGJl
IHRyaXZpYWxseSBjdXJlZCB3aXRoOgo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL3JhbGlu
ay9jbGsuYyBiL2FyY2gvbWlwcy9yYWxpbmsvY2xrLmMKPj4gaW5kZXggMmY5ZDVhY2IzOGVhLi45
MzBjMjc3NmY2ZmQgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvbWlwcy9yYWxpbmsvY2xrLmMKPj4gKysr
IGIvYXJjaC9taXBzL3JhbGluay9jbGsuYwo+PiBAQCAtODUsMyArODUsOSBAQCB2b2lkIF9faW5p
dCBwbGF0X3RpbWVfaW5pdCh2b2lkKQo+PiDCoMKgwqDCoMKgwqDCoCBjbGtfcHV0KGNsayk7Cj4+
IMKgwqDCoMKgwqDCoMKgIHRpbWVyX3Byb2JlKCk7Cj4+IMKgfQo+PiArCj4+ICtzdHJ1Y3QgY2xr
ICpjbGtfZ2V0X3BhcmVudChzdHJ1Y3QgY2xrICpjbGspCj4+ICt7Cj4+ICvCoMKgwqDCoMKgwqAg
cmV0dXJuIE5VTEw7Cj4+ICt9Cj4+ICtFWFBPUlRfU1lNQk9MX0dQTChjbGtfZ2V0X3BhcmVudCk7
Cj4+Cj4+Cj4+IE5haXZlIGltcGxlbWVudGF0aW9uIGZhaWxzIHJ1bnRpbWUgd2l0aCBFTk9FTlQg
aW4KPj4gZGV2bV9jbGtfZ2V0KCIxMDEzMDAwMC5tbWMiLCAic291cmNlIikgaW4gc3BpdGUgb2Yg
Y2xvY2sgZGVmaW5pdGlvbiBpbiAuZHRzLgo+Pgo+PiBJIHRyYWNlZCB0aGUgcHJvYmxlbSB0byBD
T05GSUdfQ09NTU9OX0NMSyBub3QgYmVpbmcgZGVmaW5lZCBmb3IgUkFMSU5LLgo+PiBJdCBjYW5u
b3QgYmUgZW5hYmxlZCBiZWNhdXNlIGl0IHdpbGwgbGVhZCB0byBtdWx0aXBsZSBkZWZpbml0aW9u
IG9mCj4+IHNldmVyYWwgY2xvY2stcmVsYXRlZCBmdW5jdGlvbnMgKGUuZy46IGBjbGtfZ2V0X3Jh
dGVgKS4KPj4gSSBmb3VuZCBjb21wbGV0ZWx5IGRpc2FibGluZyBjbG9jayBoYW5kbGluZyBpbiBt
dGtfc2QuYyBsZWFkcyB0byBhIChmb3IKPj4gbWUpIGZ1bGx5IHdvcmtpbmcgU0QgY2FyZC4KPiBU
aGF0J3MgcHJvYmFibHkgYmVjYXVzZSB0aGUgYm9vdCBGVyBhbHJlYWR5IGVuYWJsZXMgdGhlIGNs
b2NrcyBhcyBuZWVkZWQuLi4KPgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9zdC9tdGst
c2QuYyBiL2RyaXZlcnMvbW1jL2hvc3QvbXRrLXNkLmMKPj4gaW5kZXggNzcyNmRjZjQ4ZjJjLi40
NjRmNjRiZWE3YzYgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3QvbXRrLXNkLmMKPj4g
KysrIGIvZHJpdmVycy9tbWMvaG9zdC9tdGstc2QuYwo+PiBAQCAtNzMwLDE4ICs3MzAsMjIgQEAg
c3RhdGljIHZvaWQgbXNkY19zZXRfdGltZW91dChzdHJ1Y3QgbXNkY19ob3N0Cj4+ICpob3N0LCB1
MzIgbnMsIHUzMiBjbGtzKQo+PiDCoAo+PiDCoHN0YXRpYyB2b2lkIG1zZGNfZ2F0ZV9jbG9jayhz
dHJ1Y3QgbXNkY19ob3N0ICpob3N0KQo+PiDCoHsKPj4gKyNpZmRlZiBDT05GSUdfQ09NTU9OX0NM
Swo+PiDCoMKgwqDCoCBjbGtfZGlzYWJsZV91bnByZXBhcmUoaG9zdC0+c3JjX2Nsa19jZyk7Cj4+
IMKgwqDCoMKgIGNsa19kaXNhYmxlX3VucHJlcGFyZShob3N0LT5zcmNfY2xrKTsKPj4gwqDCoMKg
wqAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGhvc3QtPmJ1c19jbGspOwo+PiDCoMKgwqDCoCBjbGtf
ZGlzYWJsZV91bnByZXBhcmUoaG9zdC0+aF9jbGspOwo+PiArI2VuZGlmCj4+IMKgfQo+PiDCoAo+
PiDCoHN0YXRpYyB2b2lkIG1zZGNfdW5nYXRlX2Nsb2NrKHN0cnVjdCBtc2RjX2hvc3QgKmhvc3Qp
Cj4+IMKgewo+PiArI2lmZGVmIENPTkZJR19DT01NT05fQ0xLCj4+IMKgwqDCoMKgIGNsa19wcmVw
YXJlX2VuYWJsZShob3N0LT5oX2Nsayk7Cj4+IMKgwqDCoMKgIGNsa19wcmVwYXJlX2VuYWJsZSho
b3N0LT5idXNfY2xrKTsKPj4gwqDCoMKgwqAgY2xrX3ByZXBhcmVfZW5hYmxlKGhvc3QtPnNyY19j
bGspOwo+PiDCoMKgwqDCoCBjbGtfcHJlcGFyZV9lbmFibGUoaG9zdC0+c3JjX2Nsa19jZyk7Cj4+
ICsjZW5kaWYKPj4gwqDCoMKgwqAgd2hpbGUgKCEocmVhZGwoaG9zdC0+YmFzZSArIE1TRENfQ0ZH
KSAmIE1TRENfQ0ZHX0NLU1RCKSkKPj4gwqDCoMKgwqAgwqDCoMKgIGNwdV9yZWxheCgpOwo+PiDC
oH0KPj4gQEAgLTIyMTEsNiArMjIxNSw3IEBAIHN0YXRpYyBpbnQgbXNkY19kcnZfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZQo+PiAqcGRldikKPj4gwqDCoMKgwqAgaWYgKHJldCkKPj4gwqDC
oMKgwqAgwqDCoMKgIGdvdG8gaG9zdF9mcmVlOwo+PiDCoAo+PiArI2lmZGVmIENPTkZJR19DT01N
T05fQ0xLCj4+IMKgwqDCoMKgIGhvc3QtPnNyY19jbGsgPSBkZXZtX2Nsa19nZXQoJnBkZXYtPmRl
diwgInNvdXJjZSIpOwo+PiDCoMKgwqDCoCBpZiAoSVNfRVJSKGhvc3QtPnNyY19jbGspKSB7Cj4+
IMKgwqDCoMKgIMKgwqDCoCByZXQgPSBQVFJfRVJSKGhvc3QtPnNyY19jbGspOwo+PiBAQCAtMjIz
MCw2ICsyMjM1LDEyIEBAIHN0YXRpYyBpbnQgbXNkY19kcnZfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZQo+PiAqcGRldikKPj4gwqDCoMKgwqAgaG9zdC0+c3JjX2Nsa19jZyA9IGRldm1fY2xr
X2dldCgmcGRldi0+ZGV2LCAic291cmNlX2NnIik7Cj4+IMKgwqDCoMKgIGlmIChJU19FUlIoaG9z
dC0+c3JjX2Nsa19jZykpCj4+IMKgwqDCoMKgIMKgwqDCoCBob3N0LT5zcmNfY2xrX2NnID0gTlVM
TDsKPj4gKyNlbHNlCj4+ICvCoMKgwqAgaG9zdC0+c3JjX2NsayA9IE5VTEw7Cj4+ICvCoMKgwqAg
aG9zdC0+aF9jbGsgPSBOVUxMOwo+PiArwqDCoMKgIGhvc3QtPmJ1c19jbGsgPSBOVUxMOwo+PiAr
wqDCoMKgIGhvc3QtPnNyY19jbGtfY2cgPSBOVUxMOwo+PiArI2VuZGlmCj4+IMKgCj4+IMKgwqDC
oMKgIGhvc3QtPmlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7Cj4+IMKgwqDCoMKgIGlm
IChob3N0LT5pcnEgPCAwKSB7Cj4+Cj4+Cj4+IC4uLiBidXQgSSdtIHVuc3VyZSB0aGlzIGhhY2st
YW5kLXNsYXNoIGFwcHJvYWNoIGlzIHRoZSBSaWdodCBUaGluZyB0byBkbyA7KQo+Pgo+IEkgdGhp
bmsgdGhlIGNvcnJlY3QgYXBwcm9hY2ggd291bGQgYmUgdG8gd3JpdGUgYSBjbG9jayBkcml2ZXIg
d2hpY2ggc3VwcG9ydHMgdGhlCj4gY29tbW9uIGNsb2NrIGZyYW1ld29yay4KSSdtIGFmcmFpZCB3
cml0aW5nIHN1Y2ggYSBkcml2ZXIgZnJvbSBzY3JhdGNoIGlzIG92ZXIgbXkgdGltZQphbGxvd2Fu
Y2UgKGFuZCwgbW9zdCBsaWtlbHksIGFsc28gYWJvdmUgbXkgdGVjaG5pY2FsIHNraWxscykuCkkg
Y2FuJ3QsIHRodXMsIHZvbHVudGVlciBmb3IgdGhlIHRhc2ssIGJ1dCBJJ20gc3VyZWx5IGF2YWls
YWJsZSB0byBoZWxwLApib3RoIHdpdGggY29kaW5nLCByZXZpZXdpbmcgYW5kIHRlc3RpbmcsIGlm
IGRlZW1lZCB1c2VmdWwuCkxldCBtZSBrbm93IGlmIEkgY2FuIGhlbHAgc29tZWhvdy4KCj4gVGhl
IGFyY2gvbWlwcy9yYWxpbmsvY2xrLmMgYmFzaWNhbGx5IG92ZXJ3cml0ZXMgYW55IGNhbGxzIHRv
IHRoaXMgc28gdGhhdCB0aGluZ3MKPiBzb21laG93IHdvcmsuCkkndmUgc2VlbiB0aGlzIGlzIGFu
IGFsbW9zdC1lbXB0eSBzaGVsbCwgYnV0IEkgaGF2ZSBvbmx5IHZhZ3VlCmlkZWEgYWJvdXQgd2hh
dCBzaG91bGQgYWN0dWFsbHkgYmUgbmVlZGVkLCBzb3JyeS4KCj4gUmVnYXJkcywKPiBNYXR0aGlh
cwo+Cj4+IEFzIHNhaWQ6IHRoaXMgd29ya3MgZm9yIG1lLCBidXQgSSB3b3VsZCBsaWtlIHRvIGZp
eCBpdCBwcm9wZXJseSBhbmQgaGF2ZQo+PiB0aGUgZml4IHNlbnQgdXBzdHJlYW0gdG9nZXRoZXIg
d2l0aCBteSBTb00gZGVmY29uZmlnLgpJIGFtIGNvb3BlcmF0aW5nIHdpdGggVS1Cb290IGZvbGtz
IHRvIHBvcnQgaXQgdG8gdGhpcyBib2FyZCAoYW5kLAphcHBhcmVudGx5LCB3aXRoIHNvbWUgc3Vj
Y2Vzcyk7IEkgd2lsbCBjaGVjayBpZiBzb21lIGNvZGUgY2FuCmJlIHBvcnRlZCBmcm9tIHRoZXJl
IGFzIE1NQy9TRCBzZWVtcyB0byBiZSB3b3JraW5nLgoKPj4gQW55IGhpbnQgd2VsY29tZQo+PiBS
ZWdhcmRzCj4+IE1hdXJvIENvbmRhcmVsbGkKPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4+
IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawpCZXN0IFJlZ2FyZHMKTWF1
cm8gQ29uZGFyZWxsaQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
