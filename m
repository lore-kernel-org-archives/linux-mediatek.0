Return-Path: <SRS0=Wwml=5N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5A2C43331
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Mar 2020 12:07:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2184A206E6
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Mar 2020 12:07:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BAI2U2Cn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=vdorst.com header.i=@vdorst.com header.b="d5KhzrfD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2184A206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=vdorst.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Subject:To:From:Message-ID:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=cCVuu8E+eGH+RpSg8eWSi93OR6POrrHqXj2KkVO+gWI=; b=BAI2U2CnlOF/XIkEb1bYOaZSB
	CJ8LToEAqkIOYCiDk66fqxAVvD6hgaUfc4d/yNRI7TjwXpRpUIdgabB69gBlXUXjZgT/eHvyVbO4w
	Qejqe43l13aQSDtOtD3F4gaw9eoht9Cm+pHiwzvwr+xEII302CBdyhu1/3zipDUCZgrRzbW73/ehN
	BjGFO5HsePCeITGwdLUulbha4cgkRPlhuJ1vB2x05D4TjSIFu5RJm5YG960Boj/2k8DXTlg0g/TUQ
	bL18GHEHJKipiHl9LKw8YAneEd9BWTUTRKL0FHD5OxLqWMQ++QQelzAgkt7kH3vMQjrtXWa9cgxnZ
	fsQssukTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jIAEi-0002rF-6W; Sat, 28 Mar 2020 12:06:48 +0000
Received: from mx.0dd.nl ([2a04:52c0:101:921::25])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIAEV-0002g8-UR; Sat, 28 Mar 2020 12:06:37 +0000
Received: from mail.vdorst.com (mail.vdorst.com [IPv6:fd01::250])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx.0dd.nl (Postfix) with ESMTPS id D991D5FA80;
 Sat, 28 Mar 2020 13:06:32 +0100 (CET)
Authentication-Results: mx.0dd.nl; dkim=pass (2048-bit key;
 secure) header.d=vdorst.com header.i=@vdorst.com header.b="d5KhzrfD"; 
 dkim-atps=neutral
Received: from www (www.vdorst.com [192.168.2.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id 8898B26BF2F;
 Sat, 28 Mar 2020 13:06:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.vdorst.com 8898B26BF2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdorst.com;
 s=default; t=1585397192;
 bh=SkFKJkY8E//tW+Dis4BsAeTtpnp5rok+icUiekyoMqY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=d5KhzrfDV2pYn4v8aUb10YcAM5RgQx4nRdo3rJTCOeAHtq8+6pxf3L4f3HVGG+axo
 87VMnC2QH6MLM8mWm1brykFfcIHKmoCbVhvhZZ4uLXX2q2L0B21VUotG56b6W5tQOm
 snd531SrzZjkzmZtFscmkYbSRTP4tGlJxp4E64sbbAm1mrWJuhQ8ogHP84WvLu+ljr
 dNApJyDYX2qHBUW5acnQkuWfQ6AJohK5YTDs+kPno9UYpbTZrcO9uNMGdFcxgY6HhO
 SmRoSc1JJhadIm+XFXwqHYJEm50RdF1GPRWrdgtueOKGdXRNt8iO5MB7EDqOS67foq
 w65Q3uLdPs25A==
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1]) by
 www.vdorst.com (Horde Framework) with HTTPS; Sat, 28 Mar 2020 12:06:32 +0000
Date: Sat, 28 Mar 2020 12:06:32 +0000
Message-ID: <20200328120632.Horde.u68iv-GbxRgnXZTYfkNn0hr@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH] MIPS: ralink: mt7621: Fix soc_device introduction
In-Reply-To: <20200328102715.8309-1-tsbogend@alpha.franken.de>
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200328_050636_255910_259EA618 
X-CRM114-Status: GOOD (  13.31  )
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
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="Yes"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgVGhvbWFzLAoKVGhhbmtzIGZvciBmaXhpbmcgdGhlIGNvbXBpbGUgaXNzdWUgZm9yIG1lLgpO
b3cgSSBjYW4gbWFrZSBhIGtlcm5lbCBhZ2Fpbi4KClRlc3RlZC1ieTogUmVuw6kgdmFuIERvcnN0
IDxvcGVuc291cmNlQHZkb3JzdC5jb20+CgpHcmVhdHMsCgpSZW7DqQoKUXVvdGluZyBUaG9tYXMg
Qm9nZW5kb2VyZmVyIDx0c2JvZ2VuZEBhbHBoYS5mcmFua2VuLmRlPjoKCj4gRGVwZW5kaW5nIG9u
IHNlbGVjdGVkIFNNUCBjb25maWcgb3B0aW9ucyBzb2NfZGV2aWNlIGRpZG4ndCBnZXQKPiBpbml0
aWFsaXNlZCBhdCBhbGwuIFdpdGggVVAgY29uZmlnIHZtbGludXggZGlkbid0IGxpbmsgYmVjYXVz
ZQo+IG9mIG1pc3Npbmcgc29jIGJ1cy4KPgo+IEZpeGVzOiA3MWI5YjVlMDEzMGQgKCJNSVBTOiBy
YWxpbms6IG10NzYyMTogaW50cm9kdWNlICdzb2NfZGV2aWNlJyAgCj4gaW5pdGlhbGl6YXRpb24i
KQo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBCb2dlbmRvZXJmZXIgPHRzYm9nZW5kQGFscGhhLmZy
YW5rZW4uZGU+Cj4gLS0tCj4gIGFyY2gvbWlwcy9yYWxpbmsvS2NvbmZpZyAgfCAxICsKPiAgYXJj
aC9taXBzL3JhbGluay9tdDc2MjEuYyB8IDQgKystLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL21pcHMvcmFs
aW5rL0tjb25maWcgYi9hcmNoL21pcHMvcmFsaW5rL0tjb25maWcKPiBpbmRleCA5NGU5Y2U5OTQ0
OTQuLjM1YzJlYmQ4ZjA5NCAxMDA2NDQKPiAtLS0gYS9hcmNoL21pcHMvcmFsaW5rL0tjb25maWcK
PiArKysgYi9hcmNoL21pcHMvcmFsaW5rL0tjb25maWcKPiBAQCAtNTIsNiArNTIsNyBAQCBjaG9p
Y2UKPiAgCQlzZWxlY3QgQ09NTU9OX0NMSwo+ICAJCXNlbGVjdCBDTEtTUkNfTUlQU19HSUMKPiAg
CQlzZWxlY3QgSEFWRV9QQ0kgaWYgUENJX01UNzYyMQo+ICsJCXNlbGVjdCBTT0NfQlVTCj4gIGVu
ZGNob2ljZQo+Cj4gIGNob2ljZQo+IGRpZmYgLS1naXQgYS9hcmNoL21pcHMvcmFsaW5rL210NzYy
MS5jIGIvYXJjaC9taXBzL3JhbGluay9tdDc2MjEuYwo+IGluZGV4IDkwNTQ2MGFlZWIxZi4uMGFj
Y2I4MGRiNzA5IDEwMDY0NAo+IC0tLSBhL2FyY2gvbWlwcy9yYWxpbmsvbXQ3NjIxLmMKPiArKysg
Yi9hcmNoL21pcHMvcmFsaW5rL210NzYyMS5jCj4gQEAgLTI0MywxMiArMjQzLDEyIEBAIHZvaWQg
cHJvbV9zb2NfaW5pdChzdHJ1Y3QgcmFsaW5rX3NvY19pbmZvICpzb2NfaW5mbykKPgo+ICAJcnQy
ODgwX3Bpbm11eF9kYXRhID0gbXQ3NjIxX3Bpbm11eF9kYXRhOwo+Cj4gKwlzb2NfZGV2X2luaXQo
c29jX2luZm8sIHJldik7Cj4gKwo+ICAJaWYgKCFyZWdpc3Rlcl9jcHNfc21wX29wcygpKQo+ICAJ
CXJldHVybjsKPiAgCWlmICghcmVnaXN0ZXJfY21wX3NtcF9vcHMoKSkKPiAgCQlyZXR1cm47Cj4g
IAlpZiAoIXJlZ2lzdGVyX3ZzbXBfc21wX29wcygpKQo+ICAJCXJldHVybjsKPiAtCj4gLQlzb2Nf
ZGV2X2luaXQoc29jX2luZm8sIHJldik7Cj4gIH0KPiAtLQo+IDIuMTYuNAoKCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFp
bGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
