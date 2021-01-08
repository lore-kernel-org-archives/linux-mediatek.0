Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B0E7C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 12:32:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A69523975
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 12:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A69523975
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9QgUSoGV8EsiPl32kJMJscmOhPTnhePd2edlul7Sy9Y=; b=XDIHfUUugY3GXqLPh7JWy4bBQ
	77Zbwf5UObRR/aOtldrj+al3GEmJueLjGMRpoj8Ex7AxCjGYjZb1OAKyYUe7kg4g/DSdE0T6lGzWx
	7yMYSxfYBVMliz0QgXZhd0ibuFZrYJz9BbY3kQj3MLzhrzXXZAxkcxVijFbqZQfn4iFXjDQa9+5yk
	/DVtV5pj0VUG2n3SQwFWuGgLnIgkDHhlkvMLEwWFc/PeoTp2sI5/kiuoLsncvxKTUtL5cL9E5SwSy
	DaP7OhN+VThZhrMbSXAz+E4l9aL1uiR/B2DjRcCuq2741OnpEsT2dS3+R8/dfJzVCvVZwMCWz83sx
	te3YUPUoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxqvf-0005l3-67; Fri, 08 Jan 2021 12:31:43 +0000
Received: from mail.toke.dk ([45.145.95.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxqrp-0003p9-EH
 for linux-mediatek@lists.infradead.org; Fri, 08 Jan 2021 12:27:49 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1610108850; bh=XrbMDAa3p/Vtl/GFCNGFI/BX1TzGSrmhTacLKUkj8Ak=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=i9LXKNH473wIxrKg1IhZ9ZPexv3Nv6TlUnndvsCjjuV4nCZX0KwNChYYf7dGbbUiw
 D+g/KG5/21hxtipROXxaN/XxDuEWskg9ogBeM0Qzj6jCcZ975tf3oxRO3Xo7qsvTix
 UnePKUi6LeV9+ANJQ5EOusFi2XxwHLYC6tt7cx0j5mm1jmyTKolii7VQnY3/leQ6sn
 dTpK6yRBCesg7lsFLjRHSJO4hYWjdE9LdWZ8udmTsEbqB14skvtBhA+c7hfqbKrWwB
 tBWuHv+aQccSHH2LQyY4bomdEQ+8+NEzzy6NhYj5DnlvQaZRIl+eRRI8EMLRKtEHD3
 hMXtcEoFQ0gZg==
To: Shayne Chen <shayne.chen@mediatek.com>, linux-wireless
 <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] mac80211: fix incorrect strlen of .write in debugfs
In-Reply-To: <20210108105643.10834-1-shayne.chen@mediatek.com>
References: <20210108105643.10834-1-shayne.chen@mediatek.com>
Date: Fri, 08 Jan 2021 13:27:30 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <8735zbipfx.fsf@toke.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_072745_625412_0540D00E 
X-CRM114-Status: UNSURE (   7.44  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Sujuan Chen <sujuan.chen@mediatek.com>,
 Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

U2hheW5lIENoZW4gPHNoYXluZS5jaGVuQG1lZGlhdGVrLmNvbT4gd3JpdGVzOgoKPiBUaGlzIGZp
eGVzIHN0cmxlbiBtaXNtYXRjaCBwcm9ibGVtcyBoYXBwZW5pbmcgaW4gc29tZSAud3JpdGUgY2Fs
bGJhY2tzCj4gb2YgZGVidWdmcy4KPgo+IFdoZW4gdHJ5aW5nIHRvIGNvbmZpZ3VyZSBhaXJ0aW1l
X2ZsYWdzIGluIGRlYnVnZnMsIGFuIGVycm9yIGFwcGVhcmVkOgo+ICMgZWNobyAwID4gL3N5cy9r
ZXJuZWwvZGVidWcvaWVlZTgwMjExL3BoeTAvYWlydGltZV9mbGFncwo+IGFzaDogd3JpdGUgZXJy
b3I6IEludmFsaWQgYXJndW1lbnQKPgo+IFRoZSBlcnJvciBpcyByZXR1cm5lZCBmcm9tIGtzdHJ0
b3UxNigpIHNpbmNlIGEgd3JvbmcgbGVuZ3RoIG1ha2VzIGl0Cj4gbWlzcyB0aGUgcmVhbCBlbmQg
b2YgaW5wdXQgc3RyaW5nLiAgVG8gZml4IHRoaXMsIHVzZSBjb3VudCBhcyB0aGUgc3RyaW5nCj4g
bGVuZ3RoLCBhbmQgc2V0IHByb3BlciBlbmQgb2Ygc3RyaW5nIGZvciBhIGNoYXIgYnVmZmVyLgo+
Cj4gVGhlIGRlYnVnIHByaW50IGlzIHNob3duIC0gYWlydGltZV9mbGFnc193cml0ZTogY291bnQg
PSAyLCBsZW4gPSA4LAo+IHdoZXJlIHRoZSBhY3R1YWwgbGVuZ3RoIGlzIDIsIGJ1dCAibGVuID0g
c3RybGVuKGJ1ZikiIGdldHMgOC4KPgo+IEFsc28gY2xlYW51cCB0aGUgb3RoZXIgc2ltaWxhciBj
YXNlcyBmb3IgdGhlIHNha2Ugb2YgY29uc2lzdGVuY3kuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTdWp1
YW4gQ2hlbiA8c3VqdWFuLmNoZW5AbWVkaWF0ZWsuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFJ5ZGVy
IExlZSA8cnlkZXIubGVlQG1lZGlhdGVrLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBTaGF5bmUgQ2hl
biA8c2hheW5lLmNoZW5AbWVkaWF0ZWsuY29tPgoKQWNrZWQtYnk6IFRva2UgSMO4aWxhbmQtSsO4
cmdlbnNlbiA8dG9rZUB0b2tlLmRrPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
