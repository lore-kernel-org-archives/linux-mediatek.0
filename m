Return-Path: <SRS0=B6WE=Z2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D770C43603
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Dec 2019 11:25:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E21820637
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Dec 2019 11:25:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XibSUcE6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E21820637
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zod13PnUvS5CJ4WYXM54vG44LLTJbLk3pCLGaC2xEG0=; b=XibSUcE6L9oAHm
	Xs4SB++VcIvOssMSab8wx0oHo3LVfQAyzODUCuaq/Q5pWKavklsdn9RwUak0m/EFZWCTNKn+GvRs7
	sf1HB9KRp+qn86G3wilUnzQsKNWMz8ksIoL0lmyeuOpaIo9OtyyFvT2PADMt1Xs0oFSvJ90ntuSM7
	3j4OO2hsG2X+b+V9O/Fu0QMWT/8OzsIISIAOPmLgTJVhkP74wNkibFg/m3rWn+cu7IlTQgGuAEhBG
	/DTwiHbzaqoZbnLXE+bctZvckQsuKU8WC6JuyY0IbTfXqLAGiPLhKxzVc8urf04nX3eCHwN/MLQfL
	VemhuSV3XNbHP8GO3qrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icSmS-0003kT-O3; Wed, 04 Dec 2019 11:25:16 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icSmJ-0002Y3-FT; Wed, 04 Dec 2019 11:25:09 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D53B0B1C0;
 Wed,  4 Dec 2019 11:25:02 +0000 (UTC)
Subject: Re: [PATCH 1/6] dt-bindings: clock: add bindings for RTD1619 clocks
To: James Tai <james.tai@realtek.com>
References: <20191203074513.9416-1-james.tai@realtek.com>
 <20191203074513.9416-2-james.tai@realtek.com>
 <f069747b-7f10-f47c-684d-11138b8fd129@suse.de>
 <1130d9316ffb49c8a99b9b2c2d8fa90f@realtek.com>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <da35686d-2584-a13f-b56e-ba3ff9768113@suse.de>
Date: Wed, 4 Dec 2019 12:25:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <1130d9316ffb49c8a99b9b2c2d8fa90f@realtek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191204_032507_680302_37F7D4CD 
X-CRM114-Status: GOOD (  12.93  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
 "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgSmFtZXMsCgpbZml4aW5nIFBhbG1lcl0KCkFtIDA0LjEyLjE5IHVtIDA1OjExIHNjaHJpZWIg
SmFtZXMgVGFpOgo+PiBBbSAwMy4xMi4xOSB1bSAwODo0NSBzY2hyaWViIEphbWVzIFRhaToKPj4+
IEZyb206IGN5bGVlMTIgPGN5bGVlMTJAcmVhbHRlay5jb20+Cj4+Cj4+IFBsZWFzZSBmaXggdGhl
IGF1dGhvciAoZ2l0IGNvbW1pdCAtLWFtZW5kIC0tYXV0aG9yPSIuLi4iKSBhbmQgdXNlIGFuCj4+
IGFwcHJvcHJpYXRlIGdpdCBjb25maWcgc2V0dGluZyAoYW5kIGNvbW11bmljYXRpb24gdG8geW91
ciB0ZWFtKSB0byBhdm9pZCB0aGlzCj4+IHJlb2NjdXJyaW5nIGZvciBuZXcgY29tbWl0cyAtIGFs
cmVhZHkgcG9pbnRlZCBvdXQgdG8gSmFtZXMuCj4+Cj4+IEJUVyBJIHdvbmRlciB3aHkgd2UgaGF2
ZSBzbyBtYW55IHNlZW1pbmdseSB1bnJlbGF0ZWQgcGVvcGxlIGluIENDCj4+IChNZWRpYXRlaywg
UklTQy1WKSB0aGF0IHRoZSBwYXRjaGVzIGFuZCByZXNwb25zZXMga2VlcCBoYW5naW5nIGluIG1h
aWxpbmcgbGlzdAo+PiBtb2RlcmF0aW9uPwo+IAo+IEkgdXNlZCB0aGUgImdldF9tYWludGFpbmVy
LnBsIiB0byBmaW5kIHRoZSBlbWFpbCBhZGRyZXNzIG9mIG1haW50YWluZXJzLiBIb3dldmVyLCAK
PiBJJ20gc28gc29ycnkgZm9yIG1pc3Rha2VubHkgYWRkaW5nIHNvbWUgdW5yZWxhdGVkIHBlb3Bs
ZSB0byB0aGlzIG1haWwuCgpIZXJlJ3MgbXkgZ2l0LXNlbmQtZW1haWwgY2NjbWQgY29uZmlnIHRo
YXQgSSByZWNvbW1lbmQ6CgokIGdpdCBjb25maWcgc2VuZGVtYWlsLmNjY21kCnNjcmlwdHMvZ2V0
X21haW50YWluZXIucGwgLS1ub2dpdC1mYWxsYmFjayAtLW5vcm9sZXN0YXRzCgotLW5vZ2l0LWZh
bGxiYWNrIHN1cHByZXNzZXMgR2l0IGhpc3RvcnkgdG8gYmUgY2hlY2tlZCBmb3IgcHJldmlvdXMK
Y29udHJpYnV0b3JzLCBzYXZpbmcgdGltZSBhbmQgYXZvaWRpbmcgdW5yZWxhdGVkIG9yIG91dGRh
dGVkIHBlb3BsZS4KCi0tbm9yb2xlc3RhdHMgc3VwcHJlc3NlcyBleHRlbnNpdmUgIiguLi4pIiBj
b21tZW50cyBmb3IgdGhlIGVtYWlsCmFkZHJlc3Nlcywgd2hpY2ggbWlnaHQgd3JhcCBhbmQgYnJl
YWsgZHVyaW5nIHRyYW5zbWlzc2lvbiBvciB3aGVuIHBlb3BsZQpyZXBseS4KCkluIGFkZGl0aW9u
IHlvdSBvYnZpb3VzbHkgbmVlZCB0byBjb25maWd1cmUgc2VuZGVtYWlsLnRvLCBhbmQgeW91IG1h
eQp3YW50IHRvIGFkZCBtdWx0aXBsZSBjYyBsaW5lcyB0byBbc2VuZGVtYWlsXSBpbiB5b3VyIC5n
aXQvY29uZmlnIHRvCmVuc3VyZSBhbGwgbWFpbHMgaW5jbHVkaW5nIGNvdmVyIGxldHRlcnMgcmVh
Y2ggTEtNTCBhbmQgTEFLTUwsIHRvbzoKCiQgZ2l0IGNvbmZpZyAtLWdldC1hbGwgc2VuZGVtYWls
LnRvCmxpbnV4LXJlYWx0ZWstc29jQGxpc3RzLmluZnJhZGVhZC5vcmcKJCBnaXQgY29uZmlnIC0t
Z2V0LWFsbCBzZW5kZW1haWwuY2MKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
CmxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKCkZ1cnRoZXIsIHlvdSBuZWVkIHRvIGVuc3Vy
ZSB0aGF0IHlvdSBhcmUgc2VuZGluZyBmcm9tIHRoZSByaWdodCBicmFuY2gsCnNvIHRoYXQgdGhl
IGxhdGVzdCBNQUlOVEFJTkVSUyBmaWxlIGFuZCBzY3JpcHRzIGdldCB1c2VkLiBBcyBQYXVsCnBv
aW50ZWQgb3V0LCBQYWxtZXIncyBhZGRyZXNzIGlzIGZpeGVkIGluIGJvdGggbGludXgtbmV4dCBh
bmQgbGludXgsIHNvCml0IGlzIHJlYWxseSBwdXp6bGluZyB3aGVyZSB5b3UgZ290IHRoYXQgb2xk
IGFkZHJlc3MgZnJvbS4uLgoKTm90IHVuZGVyc3RhbmRpbmcgeW91ciBzZXR1cCwgeW91J2xsIGhh
dmUgdG8gZGVidWcgb24geW91ciBvd24gd2hlcmUKdGhvc2UgYWRkcmVzc2VzIGNhbWUgZnJvbS4g
VHJ5IGdpdCBzZW5kLWVtYWlsIC0tZHJ5LXJ1biB0byByZXZpZXcgdGhlIENDCmFkZHJlc3NlcyBi
ZWZvcmUgeW91IHNlbmQuIFlvdSBjb3VsZCBhbHNvIHRlbXBvcmFyaWx5IHVzZSAtLXJvbGVzdGF0
cyB0bwpzZWUgdGhlIE1BSU5UQUlORVJTIHNlY3Rpb24gdGhleSBjYW1lIGZyb20uCgpPbiB0aGUg
YnJpZ2h0IHNpZGUsIHRoaXMgdGltZSB5b3VyIHBhdGNoZXMgYXJyaXZlZCB0aHJlYWRlZCBjb3Jy
ZWN0bHkuCgpSZWdhcmRzLApBbmRyZWFzCgotLSAKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJICk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQpHRjogRmVs
aXggSW1lbmTDtnJmZmVyCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJnKQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
