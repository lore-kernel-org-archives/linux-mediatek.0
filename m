Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27E0C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Jan 2022 17:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZamphJCQwiNvzGhyTxcDn4mDhNK5IFVl/ZbLViJZQI4=; b=A3O8ZBno7SenYR
	dkC1YRqUsqDTb1akN6AHfMZABjMT9bzdluVrwOPgcrz/ggc1iYDEP5gXk/gE86cArtZNedmGoja5A
	j2noIeKElsTHZ7E6R+SobcN3oZMKeK4/n/AxLdzs2slQEOVcd/c8ZgzQXcLgQMq3BlRXryK6lqWA6
	w+FHTLN9omkCu/fXvYvPzk6w7ZktUYQfTriEoJg4RhyLlEn8Uc3neI4hfjNh0m2Eot2z11eTnp+qp
	+gwSONHXFToqP0D9AmQFTxnEL95OrEp7NB4olirJplahR9E8VUiXVeuUNSTVL16cZAVKw9rKCPdg5
	fUB+iVIyvHQPumPxwtqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBgyy-001VwO-6Q; Sun, 23 Jan 2022 17:48:52 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBgyv-001Vvh-2a
 for linux-mediatek@lists.infradead.org; Sun, 23 Jan 2022 17:48:50 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1642960109; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=j7uqZ3uwvuF1I9hP9HaHYPcidRWKSpOholKukqUGDxC7YaE9m9KLBgEPmm62mY9bJSNrEVMYyn3SvB9TU4w/Jv0u1MHg6q8lYR0vkkfAps9ttCIXp3onboe9F1LPJjIcHoqFvTfZeE8UhIgzg9TxWkWQDunbdHo2uj3NWKuA26I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1642960109;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=+eH2PmYS7tvCH6Q20kS59btHpbfUOjKupc/umJyNmOY=; 
 b=Hzn5Fhcd8KR5rfQx2ckUioTp7S/zlexQVZVclmDdrMbQVb9BUiSjwrDDF4YiiF6TqZDIR9e037yW972CuUi1ZwQlr8R1gO1j9Jr+XPCCo+l6EH+u9Ze+rlvIlh8Oo/jWigQWyKNyHrB9YthSLUYsKByi72UZ6xFnJqPEd/TfgCA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1642960109; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=+eH2PmYS7tvCH6Q20kS59btHpbfUOjKupc/umJyNmOY=;
 b=hjkOGn2PGskaRzUpQ7Arz55/nwl3+xOkgttcy31Y7bkaoc0MFll1eeXXB6L7TrbP
 rct/XRxi9uFAW5MAtXB0RGlUEQNyY4RqFqqXYZ8j5/A9gZEIeQi1drWk2DHQ6pGH7EU
 jHSK9EMOkqVOBH0AEHON15vkvSpSfZPkizY6ssEM=
Received: from [10.10.10.216] (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1642960108103128.06493738732195;
 Sun, 23 Jan 2022 09:48:28 -0800 (PST)
Message-ID: <1c100b5b-1ea2-cb66-96e0-d0127b50f1a2@arinc9.com>
Date: Sun, 23 Jan 2022 20:48:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: MT7621 SoC Traffic Won't Flow on RGMII2 Bus/2nd GMAC
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: DENG Qingfang <dqfext@gmail.com>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Siddhant Gupta <siddhantgupta416@gmail.com>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>,
 =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, netdev <netdev@vger.kernel.org>,
 linux-mips@vger.kernel.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, openwrt-devel@lists.openwrt.org,
 erkin.bozoglu@xeront.com
References: <83a35aa3-6cb8-2bc4-2ff4-64278bbcd8c8@arinc9.com>
 <CALW65jZ4N_YRJd8F-uaETWm1Hs3rNcy95csf++rz7vTk8G8oOg@mail.gmail.com>
 <02ecce91-7aad-4392-c9d7-f45ca1b31e0b@arinc9.com> <Ye1zwIFUa5LPQbQm@lunn.ch>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <Ye1zwIFUa5LPQbQm@lunn.ch>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_094849_189484_AAB3D34C 
X-CRM114-Status: GOOD (  13.05  )
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

T24gMjMvMDEvMjAyMiAxODoyNiwgQW5kcmV3IEx1bm4gd3JvdGU6Cj4gT24gU3VuLCBKYW4gMjMs
IDIwMjIgYXQgMTE6MzM6MDRBTSArMDMwMCwgQXLEsW7DpyDDnE5BTCB3cm90ZToKPj4gSGV5IERl
bmcsCj4+Cj4+IE9uIDIzLzAxLzIwMjIgMDk6NTEsIERFTkcgUWluZ2Zhbmcgd3JvdGU6Cj4+PiBI
aSwKPj4+Cj4+PiBEbyB5b3Ugc2V0IHRoZSBldGhlcm5ldCBwaW5tdXggY29ycmVjdGx5Pwo+Pj4K
Pj4+ICZldGhlcm5ldCB7Cj4+PiAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+Pj4g
ICAgICAgcGluY3RybC0wID0gPCZyZ21paTFfcGlucyAmcmdtaWkyX3BpbnMgJm1kaW9fcGlucz47
Cj4+PiB9Owo+Pgo+PiBUaGlzIGZpeGVkIGl0ISBXZSBkaWQgaGF2ZSAmcmdtaWkyX3BpbnMgb24g
dGhlIGdtYWMxIG5vZGUgKGl0IHdhcyBvcmlnaW5hbGx5Cj4+IG9uIGV4dGVybmFsX3BoeSkgc28g
d2UgbmV2ZXIgdGhvdWdodCB0byBpbnZlc3RpZ2F0ZSB0aGUgcGluY3RybAo+PiBjb25maWd1cmF0
aW9uIGZ1cnRoZXIhIFR1cm5zIG91dCAmcmdtaWkyX3BpbnMgbmVlZHMgdG8gYmUgZGVmaW5lZCBv
biB0aGUKPj4gZXRoZXJuZXQgbm9kZSBpbnN0ZWFkLgo+IAo+IFBIWXMgYXJlIGdlbmVyYWxseSBl
eHRlcm5hbCwgc28gcGlubXV4IG9uIHRoZW0gbWFrZXMgbm8gc2Vuc2UuIFBIWXMgaW4KPiBEVCBh
cmUgbm90IGRldmljZXMgaW4gdGhlIHVzdWFsIHNlbnNlLCBzbyBpIGRvbid0IHRoaW5rIHRoZSBk
cml2ZXIKPiBjb3JlIHdpbGwgaGFuZGxlIHBpbm11eCBmb3IgdGhlbSwgZXZlbiBpZiB5b3UgZGlk
IGxpc3QgdGhlbS4KPiAKPiBUaGlzIGNvdWxkIGJlIGludGVyZXN0aW5nIGZvciB0aGUgRFQgY29t
cGxpYW5jZSBjaGVja2VyLiBJZGVhbGx5IHdlCj4gd2FudCBpdCB0byB3YXJuIGlmIGl0IGZpbmRz
IGEgcGlubXV4IGNvbmZpZ3VyYXRpb24gaW4gYSBQSFkgbm9kZS4KCkkgZG9uJ3Qgc2VlIGFueSB3
YXJuaW5ncyBhYm91dCBpdDoKCiQgY3BwIC1ub3N0ZGluYyAtSSBpbmNsdWRlIC1JIGFyY2ggLXVu
ZGVmIC14IGFzc2VtYmxlci13aXRoLWNwcCAKZHJpdmVycy9zdGFnaW5nL210NzYyMS1kdHMvbXQ3
NjIxLmR0c2kgbXQ3NjIxLmR0c2kucHJlcHJvY2Vzc2VkCiQgZHRjIC1JIGR0cyAtTyBkdGIgLXAg
MHgxMDAwIG10NzYyMS5kdHNpLnByZXByb2Nlc3NlZCAtbyBtdDc2MjEuZHRiCmRyaXZlcnMvc3Rh
Z2luZy9tdDc2MjEtZHRzL210NzYyMS5kdHNpOjI4LjIxLTMzLjQ6IFdhcm5pbmcgCih1bml0X2Fk
ZHJlc3NfdnNfcmVnKTogL2NwdWludGNAMDogbm9kZSBoYXMgYSB1bml0IG5hbWUsIGJ1dCBubyBy
ZWcgcHJvcGVydHkKZHJpdmVycy9zdGFnaW5nL210NzYyMS1kdHMvbXQ3NjIxLmR0c2k6NDAuMzQt
NDcuNjogV2FybmluZyAKKHVuaXRfYWRkcmVzc192c19yZWcpOiAvZml4ZWRyZWd1bGF0b3JAMDog
bm9kZSBoYXMgYSB1bml0IG5hbWUsIGJ1dCBubyAKcmVnIHByb3BlcnR5CmRyaXZlcnMvc3RhZ2lu
Zy9tdDc2MjEtZHRzL210NzYyMS5kdHNpOjQ5LjM5LTU2LjQ6IFdhcm5pbmcgCih1bml0X2FkZHJl
c3NfdnNfcmVnKTogL2ZpeGVkcmVndWxhdG9yQDE6IG5vZGUgaGFzIGEgdW5pdCBuYW1lLCBidXQg
bm8gCnJlZyBwcm9wZXJ0eQpkcml2ZXJzL3N0YWdpbmcvbXQ3NjIxLWR0cy9tdDc2MjEuZHRzaTo0
MTAuMTEtNDQ5Ljc6IFdhcm5pbmcgCih1bml0X2FkZHJlc3NfdnNfcmVnKTogL2V0aGVybmV0QDFl
MTAwMDAwL21kaW8tYnVzL3N3aXRjaDBAMC9wb3J0czogbm9kZSAKaGFzIGEgcmVnIG9yIHJhbmdl
cyBwcm9wZXJ0eSwgYnV0IG5vIHVuaXQgbmFtZQpkcml2ZXJzL3N0YWdpbmcvbXQ3NjIxLWR0cy9t
dDc2MjEuZHRzaToyOC4yMS0zMy40OiBXYXJuaW5nIAoodW5pcXVlX3VuaXRfYWRkcmVzcyk6IC9j
cHVpbnRjQDA6IGR1cGxpY2F0ZSB1bml0LWFkZHJlc3MgKGFsc28gdXNlZCBpbiAKbm9kZSAvZml4
ZWRyZWd1bGF0b3JAMCkKCj4gCj4gSXQgYWxzbyBzb3VuZHMgbGlrZSB5b3UgaGFkIHRoZW0gc29t
ZXdoZXJlIGVsc2Ugd3Jvbmc/CgpZZXMsIGl0IHdhcyB1bmRlciB0aGUgcGh5X2V4dGVybmFsIG5v
ZGU6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZh
bGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvc3RhZ2luZy9tdDc2MjEtZHRzL210NzYyMS5kdHNp
I24zNTAKCkkgaGFkIHB1dCBpdCB1bmRlciBnbWFjMSBub2RlIGluc3RlYWQgc2luY2Ugd2UgZGlk
bid0IGVuYWJsZSB0aGUgCnBoeV9leHRlcm5hbCBub2RlLgoKQXLEsW7DpwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
