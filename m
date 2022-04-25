Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80952C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 03:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ovh3iSp/gvvgvMEFV1NRW4u7nY6sW864lgSOyxCgeQ=; b=D9ATjRObsE38JL
	bI2hGVMEXCB+CeYoV6F9aOUBY10UJFwaehmHks7LurZ13zuZFYzOmLPWdHs3C4DZxxSIYuPvI5+80
	ZNrbAeu1pxkXD4MYmIoGUurDaxqzAaRjuecYZgGrwixGlUZHgsOU0zk4wALJWkbCRuTgn/exfZQ79
	fp2exXybJ4BVSt/l88WkOx/Q6AbdS0OsZZwU8G0TZjQquXdrrvreDP1Gu2SMpkH2jSJ1pYNHBfXuF
	zAPFO8XSu7e/z+bg6qAhr0nQjh4fnPTz62PBMJxnkE/XpCBnPg012fSsWM2CUYmxZwrnHCyEOJqQM
	vUeibwaUXPjMVV0mJ5bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nipaa-0080MD-Ve; Mon, 25 Apr 2022 03:40:41 +0000
Received: from m1541.mail.126.com ([220.181.15.41])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nipaM-0080C3-0K; Mon, 25 Apr 2022 03:40:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=Xb2jU
 I68L4ingevBNbIwSF+oSRTmjSydhDTtvsIxWcs=; b=pFYM06IGpHTkeYdf0zJK8
 +GSBQZCR2VR6HNUh6tNvRFpRpwCXpr7bY9XUlgBFkn2vjdilIyecsrQSVdy9lRd9
 bpKLnWsW46UYad2Yv2T7a0Tl6uAk846LQizehMhZytT7oOvoYiNQnQXECBDZskko
 /wBb7WgdTAp6yJc+RnfCNA=
Received: from zhaojunkui2008$126.com ( [112.80.34.205] ) by
 ajax-webmail-wmsvr41 (Coremail) ; Mon, 25 Apr 2022 11:40:02 +0800 (CST)
X-Originating-IP: [112.80.34.205]
Date: Mon, 25 Apr 2022 11:40:02 +0800 (CST)
From: z  <zhaojunkui2008@126.com>
To: "Jakub Kicinski" <kubakici@wp.pl>
Cc: "Kalle Valo" <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 "Paolo Abeni" <pabeni@redhat.com>, 
 "Matthias Brugger" <matthias.bgg@gmail.com>, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 bernard@vivo.com
Subject: Re:Re: [PATCH v2] mediatek/mt7601u: add debugfs exit function
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210622(1d4788a8)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <20220422124704.259244e7@kicinski-fedora-PC1C0HJN>
References: <20220422080854.490379-1-zhaojunkui2008@126.com>
 <20220422124704.259244e7@kicinski-fedora-PC1C0HJN>
MIME-Version: 1.0
Message-ID: <15b4f.2aad.1805ece06a1.Coremail.zhaojunkui2008@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: KcqowABHV98TGGZi9k4TAA--.52204W
X-CM-SenderInfo: p2kd0y5xqn3xasqqmqqrswhudrp/1tbiqBPtqlpD9keacgAAs8
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_204026_428162_EEE8C9B7 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CkF0IDIwMjItMDQtMjMgMDM6NDc6MDQsICJKYWt1YiBLaWNpbnNraSIgPGt1YmFraWNpQHdwLnBs
PiB3cm90ZToKPk9uIEZyaSwgMjIgQXByIDIwMjIgMDE6MDg6NTQgLTA3MDAgQmVybmFyZCBaaGFv
IHdyb3RlOgo+PiBXaGVuIG10NzYwMXUgbG9hZGVkLCB0aGVyZSBhcmUgdHdvIGNhc2VzOgo+PiBG
aXJzdCB3aGVuIG10NzYwMXUgaXMgbG9hZGVkLCBpbiBmdW5jdGlvbiBtdDc2MDF1X3Byb2JlLCBp
Zgo+PiBmdW5jdGlvbiBtdDc2MDF1X3Byb2JlIHJ1biBpbnRvIGVycm9yIGxhYmxlIGVycl9odywK
Pj4gbXQ3NjAxdV9jbGVhbnVwIGRpZG5gdCBjbGVhbnVwIHRoZSBkZWJ1Z2ZzIG5vZGUuCj4+IFNl
Y29uZCB3aGVuIHRoZSBtb2R1bGUgZGlzY29ubmVjdCwgaW4gZnVuY3Rpb24gbXQ3NjAxdV9kaXNj
b25uZWN0LAo+PiBtdDc2MDF1X2NsZWFudXAgZGlkbmB0IGNsZWFudXAgdGhlIGRlYnVnZnMgbm9k
ZS4KPj4gVGhpcyBwYXRjaCBhZGQgZGVidWdmcyBleGl0IGZ1bmN0aW9uIGFuZCB0cnkgdG8gY2xl
YW51cCBkZWJ1Z2ZzCj4+IG5vZGUgd2hlbiBtdDc2MDF1IGxvYWRlZCBmYWlsIG9yIHVubG9hZGVk
Lgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogQmVybmFyZCBaaGFvIDx6aGFvanVua3VpMjAwOEAxMjYu
Y29tPgo+Cj5BaCwgbWlzc2VkIHRoYXQgdGhlcmUgd2FzIGEgdjIuIE15IHBvaW50IHN0YW5kcywg
d2lwaHkgZGVidWdmcyBkaXIKPnNob3VsZCBkbyB0aGUgY2xlYW51cC4KPgo+RG8geW91IGVuY291
bnRlciBwcm9ibGVtcyBpbiBwcmFjdGljZSBvciBhcmUgeW91IHNlbmRpbmcgdGhpcyBwYXRjaGVz
Cj5iYXNlZCBvbiByZWFkaW5nIC8gc3RhdGljIGFuYWx5c2lzIG9mIHRoZSBjb2RlIG9ubHkuCgpI
aSBKYWt1YiBLaWNpbnNraToKClRoZSBpc3N1ZSBoZXJlIGlzIGZvdW5kIGJ5IHJlYWRpbmcgY29k
ZS4KSSByZWFkIHRoZSBkcml2ZXJzL25ldC93aXJlbGVzcyBjb2RlIGFuZCBmb3VuZCB0aGF0IG1h
bnkgbW9kdWxlcyBhcmUgbm90IGNsZWFudXAgdGhlIGRlYnVnZnMuIApJIHNvcnRlZCBvdXQgdGhl
IG1vZHVsZXMgdGhhdCB3ZXJlIG5vdCBjbGVhbmVkIHVwIHRoZSBkZWJ1Z2ZzOgouL3RpL3dsMTh4
eAouL3RpL3dsMTJ4eAouL2ludGVsL2l3bHdpZmkKLi9pbnRlbC9pd2x3aWZpCi4vbWVkaWF0ZWsv
bXQ3NgpJIGFtIG5vdCBzdXJlIHdoZXRoZXIgdGhpcyBwYXJ0IGlzIHdlbGNvbWUgdG8ga2VybmVs
IHNvIEkgc3VibWl0dGVkIGEgcGF0Y2guCklmIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9ucywgd2Vs
Y29tZSB0byBwdXQgZm9yd2FyZCBmb3IgZGlzY3Vzc2lvbiwgdGhhbmsgeW91o6EKCkJSLy9CZXJu
YXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
