Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA60AC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 06:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q/OF0sE/foHVAxzrHQi8UgAxiVidlcsrALc7btnyrj8=; b=m+f91EKrP249De
	aPBewEHND7bezQGjC1c2bKgzupa+WcOcBeIZ3KSgLbS++7ZIKS0v435P/U70d9+6ASFF2A6o61B6d
	+G9egClnTABrsbkjyErC4nn4xV+KHd0v0LahhYRcfObs8TbpUiI3RUtmrfID5iN8arsCma8DjcMdZ
	YHadZ4d16Omh+/Lk0eiKFBNc0VkUJPwflOPgMsdy8RmTV6taLGVvgkZyI8tw7th4pbjMR3PFcB00B
	AaP/r2mB8PcikBoi6LSR6wyJrvtVdPB4BAwV6vWUk7aJMluTrsK9FugwezEOa2OIlfMaik2Xj/nEU
	ISx0DDSU/6cvbl8Fj2Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nirn3-008RSH-HG; Mon, 25 Apr 2022 06:01:41 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nirmr-008RQl-KQ; Mon, 25 Apr 2022 06:01:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2BFFEB8115E;
 Mon, 25 Apr 2022 06:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C0C6C385A7;
 Mon, 25 Apr 2022 06:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650866483;
 bh=jJSzwEMcRNQclSonKLXvhl6er2akDymhmWYinGpo/W8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=lSWzbJpMsUcGjsZldMreaAWEEO9jJDWy+f/3W96Q2SJDLVq06bKQd5Q1Yax9gvhU2
 V5tdlQC28gXmulRhky1zUjcXZoMNs+l0agLzfh9piHO6Tet4ytXfWqWTBdGU3MUcKm
 lRyrM4Sf72QILzk5qgzPNl4/HfTpanxn4x6Fqa01gtRZC1na+FqBqVYclazzIhckhQ
 ymMfezjxoVWv0f4iSVDXalh/LV0pfOnuE73KosBv95qY2aAxFjggYFsdVzKZFYfioL
 k6nf/wql32x6PRkGgcbg5ZZhL82T1OO08PU3L2OdCeqqdRKLGQbS3d/zUelZwjJXNh
 moqM24yUKrR0w==
From: Kalle Valo <kvalo@kernel.org>
To: z <zhaojunkui2008@126.com>
Cc: "Jakub Kicinski" <kubakici@wp.pl>, "David S. Miller" <davem@davemloft.net>,
 "Paolo Abeni" <pabeni@redhat.com>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, bernard@vivo.com
Subject: Re: [PATCH v2] mediatek/mt7601u: add debugfs exit function
In-Reply-To: <15b4f.2aad.1805ece06a1.Coremail.zhaojunkui2008@126.com> (z.'s
 message of "Mon, 25 Apr 2022 11:40:02 +0800 (CST)")
References: <20220422080854.490379-1-zhaojunkui2008@126.com>
 <20220422124704.259244e7@kicinski-fedora-PC1C0HJN>
 <15b4f.2aad.1805ece06a1.Coremail.zhaojunkui2008@126.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Mon, 25 Apr 2022 09:01:18 +0300
Message-ID: <87h76hk8gh.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_230129_850091_601AF046 
X-CRM114-Status: GOOD (  18.02  )
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

eiAgPHpoYW9qdW5rdWkyMDA4QDEyNi5jb20+IHdyaXRlczoKCj4gQXQgMjAyMi0wNC0yMyAwMzo0
NzowNCwgIkpha3ViIEtpY2luc2tpIiA8a3ViYWtpY2lAd3AucGw+IHdyb3RlOgo+Pk9uIEZyaSwg
MjIgQXByIDIwMjIgMDE6MDg6NTQgLTA3MDAgQmVybmFyZCBaaGFvIHdyb3RlOgo+Pj4gV2hlbiBt
dDc2MDF1IGxvYWRlZCwgdGhlcmUgYXJlIHR3byBjYXNlczoKPj4+IEZpcnN0IHdoZW4gbXQ3NjAx
dSBpcyBsb2FkZWQsIGluIGZ1bmN0aW9uIG10NzYwMXVfcHJvYmUsIGlmCj4+PiBmdW5jdGlvbiBt
dDc2MDF1X3Byb2JlIHJ1biBpbnRvIGVycm9yIGxhYmxlIGVycl9odywKPj4+IG10NzYwMXVfY2xl
YW51cCBkaWRuYHQgY2xlYW51cCB0aGUgZGVidWdmcyBub2RlLgo+Pj4gU2Vjb25kIHdoZW4gdGhl
IG1vZHVsZSBkaXNjb25uZWN0LCBpbiBmdW5jdGlvbiBtdDc2MDF1X2Rpc2Nvbm5lY3QsCj4+PiBt
dDc2MDF1X2NsZWFudXAgZGlkbmB0IGNsZWFudXAgdGhlIGRlYnVnZnMgbm9kZS4KPj4+IFRoaXMg
cGF0Y2ggYWRkIGRlYnVnZnMgZXhpdCBmdW5jdGlvbiBhbmQgdHJ5IHRvIGNsZWFudXAgZGVidWdm
cwo+Pj4gbm9kZSB3aGVuIG10NzYwMXUgbG9hZGVkIGZhaWwgb3IgdW5sb2FkZWQuCj4+PiAKPj4+
IFNpZ25lZC1vZmYtYnk6IEJlcm5hcmQgWmhhbyA8emhhb2p1bmt1aTIwMDhAMTI2LmNvbT4KPj4K
Pj5BaCwgbWlzc2VkIHRoYXQgdGhlcmUgd2FzIGEgdjIuIE15IHBvaW50IHN0YW5kcywgd2lwaHkg
ZGVidWdmcyBkaXIKPj5zaG91bGQgZG8gdGhlIGNsZWFudXAuCj4+Cj4+RG8geW91IGVuY291bnRl
ciBwcm9ibGVtcyBpbiBwcmFjdGljZSBvciBhcmUgeW91IHNlbmRpbmcgdGhpcyBwYXRjaGVzCj4+
YmFzZWQgb24gcmVhZGluZyAvIHN0YXRpYyBhbmFseXNpcyBvZiB0aGUgY29kZSBvbmx5Lgo+Cj4g
SGkgSmFrdWIgS2ljaW5za2k6Cj4KPiBUaGUgaXNzdWUgaGVyZSBpcyBmb3VuZCBieSByZWFkaW5n
IGNvZGUuCj4gSSByZWFkIHRoZSBkcml2ZXJzL25ldC93aXJlbGVzcyBjb2RlIGFuZCBmb3VuZCB0
aGF0IG1hbnkgbW9kdWxlcyBhcmUKPiBub3QgY2xlYW51cCB0aGUgZGVidWdmcy4KPiBJIHNvcnRl
ZCBvdXQgdGhlIG1vZHVsZXMgdGhhdCB3ZXJlIG5vdCBjbGVhbmVkIHVwIHRoZSBkZWJ1Z2ZzOgo+
IC4vdGkvd2wxOHh4Cj4gLi90aS93bDEyeHgKPiAuL2ludGVsL2l3bHdpZmkKPiAuL2ludGVsL2l3
bHdpZmkKPiAuL21lZGlhdGVrL210NzYKPiBJIGFtIG5vdCBzdXJlIHdoZXRoZXIgdGhpcyBwYXJ0
IGlzIHdlbGNvbWUgdG8ga2VybmVsIHNvIEkgc3VibWl0dGVkIGEgcGF0Y2guCj4gSWYgeW91IGhh
dmUgYW55IHN1Z2dlc3Rpb25zLCB3ZWxjb21lIHRvIHB1dCBmb3J3YXJkIGZvciBkaXNjdXNzaW9u
LCB0aGFuayB5b3XvvIEKCkpha3ViIGlzIHNheWluZyB0aGF0IHdpcGh5X3VucmVnaXN0ZXIoKSBy
ZWN1cnNpdmVseSByZW1vdmVzIHRoZSBkZWJ1Z2ZzCmRpcmVjdG9yaWVzOgoKCS8qCgkgKiBGaXJz
dCByZW1vdmUgdGhlIGhhcmR3YXJlIGZyb20gZXZlcnl3aGVyZSwgdGhpcyBtYWtlcwoJICogaXQg
aW1wb3NzaWJsZSB0byBmaW5kIGZyb20gdXNlcnNwYWNlLgoJICovCglkZWJ1Z2ZzX3JlbW92ZV9y
ZWN1cnNpdmUocmRldi0+d2lwaHkuZGVidWdmc2Rpcik7CgpTbyBBRkFJQ1MgdGhlcmUgaXMgbm8g
YnVnLiBCdXQgaWYgeW91IGFyZSB0ZXN0aW5nIHRoaXMgb24gYSByZWFsCmhhcmR3YXJlIGFuZCBz
b21ldGhpbmcgaXMgd3JvbmcsIHBsZWFzZSBwcm92aWRlIG1vcmUgaW5mby4KCi0tIApodHRwczov
L3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3MvbGlzdC8KCmh0dHBz
Oi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9z
dWJtaXR0aW5ncGF0Y2hlcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
