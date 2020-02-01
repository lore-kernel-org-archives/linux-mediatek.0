Return-Path: <SRS0=uvF2=3V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47241C33CB3
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Feb 2020 16:06:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E3B6206E3
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Feb 2020 16:06:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uo1PshDT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E3B6206E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mclink.it
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:To:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m4IpH3mWig94uT+qv+jsjNvanBhth8wJIrDM7QxcV+A=; b=uo1PshDToPU5yL
	8PCSyQWOt3X4P5Hk5Axg2vNdkNm3qM+dA/+Uw7Ni7lj+YQ122t+ST0ZPgV7hEt+8uNy/8hvDewXX6
	XTpnzteQjsYlMHjzEIwSHai6HfC1NaUcB0lXaR/OwUYfwFDmLzz/uZMm8O4s4VH9pRtcCcXgTLo48
	8/OGJ1kK4UbvogCzxYv2iXycYZoKyGinE2NojpmLgI4wuqmEeH02ZopT8t2BpX2Rj6tOMzs2CB+Ec
	vfXX/9lnk7xTfYU8cGDPRXa0qfGmZYgg9MkB7nRJ6AbRNBRsdFzsNHTPbvkKpuWhRjOhpwA5qdjYv
	xKOuhEQAV+TJPtzXXftA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixvIB-0007tr-1v; Sat, 01 Feb 2020 16:06:43 +0000
Received: from relaygw4-1.mclink.it ([213.21.178.144])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixvI7-0007tJ-LL
 for linux-mediatek@lists.infradead.org; Sat, 01 Feb 2020 16:06:41 +0000
Received: from [172.24.30.42] (HELO smtpoutgw2.mclink.it)
 by relaygw4-1.mclink.it (CommuniGate Pro SMTP 6.0.6)
 with ESMTP id 167725209 for linux-mediatek@lists.infradead.org;
 Sat, 01 Feb 2020 17:06:22 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2CGAgCfoDVe/6vbFVcNWB4BCxyKVZUMh?=
 =?us-ascii?q?gGBPZAMCQEBAQEBAQEBATcBAYcXOBMCEAEBBQEBAQEBBQSMQAQLAV8cAiYCbAg?=
 =?us-ascii?q?BAYMigleRCJsDdX8zhUqDQoE+gQ4qjHmBQYERJ4QuhBSCQ4JeBIE/AQEBrh8BB?=
 =?us-ascii?q?gKBY1qWOgYbmwilcoYagXqCXoFPTyWOKQwLjiSQEwEB?=
Received: from host171-219-dynamic.21-87-r.retail.telecomitalia.it (HELO
 [192.168.7.101]) ([87.21.219.171])
 by smtpoutgw2.mclink.it with ESMTP; 01 Feb 2020 17:06:08 +0100
To: linux-mediatek@lists.infradead.org
From: Mauro Condarelli <mc5686@mclink.it>
Subject: Enabling MMC on MT7628 SoC
Message-ID: <e6c30f55-5f65-b165-4c5d-1d25a425e744@mclink.it>
Date: Sat, 1 Feb 2020 17:06:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200201_080640_020859_6D3FF667 
X-CRM114-Status: UNSURE (   7.97  )
X-CRM114-Notice: Please train this message.
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

SGksCkknbSB0cnlpbmcgdG8gZW5hYmxlIE1NQy9TRCBhY2Nlc3Mgb24gYSBWb0NvcmUyIFNPTSAo
YmFzZWQgb24gTVQ3NjI4KQp1c2luZyBtdGtfc2QgZHJpdmVyLgoKSnVzdCBlbmFibGluZyBtdGtf
c2Qgd2lsbCBib21iIHdpdCB1bmRlZmluZWQgZnVuY3Rpb24gYGNsa19nZXRfcGFyZW50YDsKdGhp
cyBjYW4gYmUgdHJpdmlhbGx5IGN1cmVkIHdpdGg6CgpkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL3Jh
bGluay9jbGsuYyBiL2FyY2gvbWlwcy9yYWxpbmsvY2xrLmMKaW5kZXggMmY5ZDVhY2IzOGVhLi45
MzBjMjc3NmY2ZmQgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlwcy9yYWxpbmsvY2xrLmMKKysrIGIvYXJj
aC9taXBzL3JhbGluay9jbGsuYwpAQCAtODUsMyArODUsOSBAQCB2b2lkIF9faW5pdCBwbGF0X3Rp
bWVfaW5pdCh2b2lkKQrCoMKgwqDCoMKgwqDCoCBjbGtfcHV0KGNsayk7CsKgwqDCoMKgwqDCoMKg
IHRpbWVyX3Byb2JlKCk7CsKgfQorCitzdHJ1Y3QgY2xrICpjbGtfZ2V0X3BhcmVudChzdHJ1Y3Qg
Y2xrICpjbGspCit7CivCoMKgwqDCoMKgwqAgcmV0dXJuIE5VTEw7Cit9CitFWFBPUlRfU1lNQk9M
X0dQTChjbGtfZ2V0X3BhcmVudCk7CgoKTmFpdmUgaW1wbGVtZW50YXRpb24gZmFpbHMgcnVudGlt
ZSB3aXRoIEVOT0VOVCBpbgpkZXZtX2Nsa19nZXQoIjEwMTMwMDAwLm1tYyIsICJzb3VyY2UiKSBp
biBzcGl0ZSBvZiBjbG9jayBkZWZpbml0aW9uIGluIC5kdHMuCgpJIHRyYWNlZCB0aGUgcHJvYmxl
bSB0byBDT05GSUdfQ09NTU9OX0NMSyBub3QgYmVpbmcgZGVmaW5lZCBmb3IgUkFMSU5LLgpJdCBj
YW5ub3QgYmUgZW5hYmxlZCBiZWNhdXNlIGl0IHdpbGwgbGVhZCB0byBtdWx0aXBsZSBkZWZpbml0
aW9uIG9mCnNldmVyYWwgY2xvY2stcmVsYXRlZCBmdW5jdGlvbnMgKGUuZy46IGBjbGtfZ2V0X3Jh
dGVgKS4KSSBmb3VuZCBjb21wbGV0ZWx5IGRpc2FibGluZyBjbG9jayBoYW5kbGluZyBpbiBtdGtf
c2QuYyBsZWFkcyB0byBhIChmb3IKbWUpIGZ1bGx5IHdvcmtpbmcgU0QgY2FyZC4KCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL21tYy9ob3N0L210ay1zZC5jIGIvZHJpdmVycy9tbWMvaG9zdC9tdGstc2Qu
YwppbmRleCA3NzI2ZGNmNDhmMmMuLjQ2NGY2NGJlYTdjNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9t
bWMvaG9zdC9tdGstc2QuYworKysgYi9kcml2ZXJzL21tYy9ob3N0L210ay1zZC5jCkBAIC03MzAs
MTggKzczMCwyMiBAQCBzdGF0aWMgdm9pZCBtc2RjX3NldF90aW1lb3V0KHN0cnVjdCBtc2RjX2hv
c3QKKmhvc3QsIHUzMiBucywgdTMyIGNsa3MpCsKgCsKgc3RhdGljIHZvaWQgbXNkY19nYXRlX2Ns
b2NrKHN0cnVjdCBtc2RjX2hvc3QgKmhvc3QpCsKgeworI2lmZGVmIENPTkZJR19DT01NT05fQ0xL
CsKgwqDCoMKgIGNsa19kaXNhYmxlX3VucHJlcGFyZShob3N0LT5zcmNfY2xrX2NnKTsKwqDCoMKg
wqAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGhvc3QtPnNyY19jbGspOwrCoMKgwqDCoCBjbGtfZGlz
YWJsZV91bnByZXBhcmUoaG9zdC0+YnVzX2Nsayk7CsKgwqDCoMKgIGNsa19kaXNhYmxlX3VucHJl
cGFyZShob3N0LT5oX2Nsayk7CisjZW5kaWYKwqB9CsKgCsKgc3RhdGljIHZvaWQgbXNkY191bmdh
dGVfY2xvY2soc3RydWN0IG1zZGNfaG9zdCAqaG9zdCkKwqB7CisjaWZkZWYgQ09ORklHX0NPTU1P
Tl9DTEsKwqDCoMKgwqAgY2xrX3ByZXBhcmVfZW5hYmxlKGhvc3QtPmhfY2xrKTsKwqDCoMKgwqAg
Y2xrX3ByZXBhcmVfZW5hYmxlKGhvc3QtPmJ1c19jbGspOwrCoMKgwqDCoCBjbGtfcHJlcGFyZV9l
bmFibGUoaG9zdC0+c3JjX2Nsayk7CsKgwqDCoMKgIGNsa19wcmVwYXJlX2VuYWJsZShob3N0LT5z
cmNfY2xrX2NnKTsKKyNlbmRpZgrCoMKgwqDCoCB3aGlsZSAoIShyZWFkbChob3N0LT5iYXNlICsg
TVNEQ19DRkcpICYgTVNEQ19DRkdfQ0tTVEIpKQrCoMKgwqDCoCDCoMKgwqAgY3B1X3JlbGF4KCk7
CsKgfQpAQCAtMjIxMSw2ICsyMjE1LDcgQEAgc3RhdGljIGludCBtc2RjX2Rydl9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlCipwZGV2KQrCoMKgwqDCoCBpZiAocmV0KQrCoMKgwqDCoCDCoMKg
wqAgZ290byBob3N0X2ZyZWU7CsKgCisjaWZkZWYgQ09ORklHX0NPTU1PTl9DTEsKwqDCoMKgwqAg
aG9zdC0+c3JjX2NsayA9IGRldm1fY2xrX2dldCgmcGRldi0+ZGV2LCAic291cmNlIik7CsKgwqDC
oMKgIGlmIChJU19FUlIoaG9zdC0+c3JjX2NsaykpIHsKwqDCoMKgwqAgwqDCoMKgIHJldCA9IFBU
Ul9FUlIoaG9zdC0+c3JjX2Nsayk7CkBAIC0yMjMwLDYgKzIyMzUsMTIgQEAgc3RhdGljIGludCBt
c2RjX2Rydl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlCipwZGV2KQrCoMKgwqDCoCBob3N0
LT5zcmNfY2xrX2NnID0gZGV2bV9jbGtfZ2V0KCZwZGV2LT5kZXYsICJzb3VyY2VfY2ciKTsKwqDC
oMKgwqAgaWYgKElTX0VSUihob3N0LT5zcmNfY2xrX2NnKSkKwqDCoMKgwqAgwqDCoMKgIGhvc3Qt
PnNyY19jbGtfY2cgPSBOVUxMOworI2Vsc2UKK8KgwqDCoCBob3N0LT5zcmNfY2xrID0gTlVMTDsK
K8KgwqDCoCBob3N0LT5oX2NsayA9IE5VTEw7CivCoMKgwqAgaG9zdC0+YnVzX2NsayA9IE5VTEw7
CivCoMKgwqAgaG9zdC0+c3JjX2Nsa19jZyA9IE5VTEw7CisjZW5kaWYKwqAKwqDCoMKgwqAgaG9z
dC0+aXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKwqDCoMKgwqAgaWYgKGhvc3QtPmly
cSA8IDApIHsKCgouLi4gYnV0IEknbSB1bnN1cmUgdGhpcyBoYWNrLWFuZC1zbGFzaCBhcHByb2Fj
aCBpcyB0aGUgUmlnaHQgVGhpbmcgdG8gZG8gOykKCkFzIHNhaWQ6IHRoaXMgd29ya3MgZm9yIG1l
LCBidXQgSSB3b3VsZCBsaWtlIHRvIGZpeCBpdCBwcm9wZXJseSBhbmQgaGF2ZQp0aGUgZml4IHNl
bnQgdXBzdHJlYW0gdG9nZXRoZXIgd2l0aCBteSBTb00gZGVmY29uZmlnLgoKQW55IGhpbnQgd2Vs
Y29tZQpSZWdhcmRzCk1hdXJvIENvbmRhcmVsbGkKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
