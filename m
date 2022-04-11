Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE97C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 13:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ul3sfm9ijFy94AkSRe+D4q0ASqiquyb86w8ySHsfBfg=; b=h+kWgJWdGbzpmy
	Smx3OrRaoJV9MyyFOwq/fAYHIZ6Y91gdNiCG1vVK6khpQ4LBwqBdsjVo8uXFerxRrH6ouULPDDDR7
	bjEOyJGNuA2Vutlu6ORYy/2n8e1UxBzadQe23j5Uy5X6KaiaTo8I61Q45imL+y56tuErD4UcesCKb
	mMVl5EJ+PkCDQS0USygi/R6IR3iV3mgl0OHABTDRfICx0SboJfeePPaFgoylrCGX6H2cAbv0ssn7p
	AJi7gGc9zR92l4I2HJH+82tUGr21vxQ3BogaE7ndZG51mid4+H110Z2UKpb8iljnm4D+UDKXXARkv
	ROQ4GckoUzqjVSGI39Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nduR5-009DZ0-Vv; Mon, 11 Apr 2022 13:50:32 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nduQs-009DXU-WD
 for linux-mediatek@lists.infradead.org; Mon, 11 Apr 2022 13:50:22 +0000
Received: by mail-qk1-x72e.google.com with SMTP id g11so9534758qke.1
 for <linux-mediatek@lists.infradead.org>; Mon, 11 Apr 2022 06:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :content-transfer-encoding:user-agent:mime-version;
 bh=Ee9cHL3O4lr4TWLTa3s8ofVsmmXbJuEmkg2vJR97Q5M=;
 b=geFfMqZanAauvixw04TDDWB3pMYfZF9YMaeCNuqqMuK6YkEaHIg4N1WFuR4NOYrm81
 Pnib5t96sONoKMMf4N2OqlROMFFoiaxYbCYq9KUk8X8jYh0bKYEEf1ICMCVk2Lk8FqCZ
 our+s6P0g2iNTgCFt4oOnsN5lCEbmpTor8e88Q/R7VFbajcUFp0qRQpP8PDJeeNeKSEJ
 xG7PiCjQxlk31z+0y3byT95S9aQMc63CjYB2et+CwkcHyz71p9OP9B46ysKxDT4uVMLO
 qx7c9aVlQGJZqNabQWdONLPve3Qyk/SnHsB3Y9Ss3uFaQ7M4665lJcaTjUuG/MNrw0ln
 myXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=Ee9cHL3O4lr4TWLTa3s8ofVsmmXbJuEmkg2vJR97Q5M=;
 b=UfoSk6ASrJQlkKLAFdSltPihiaViCxQUF4E1kc0ZSHuk2IzFaCcwY8jhk3w35zuQlM
 ceMJt7iTU1graSWEpqhuEI8/aFdQLf8cFAMsSr++ojpxQ6cuuMPjrx4/u2sF026iwnIS
 Rcj3SLCJBpWzMZfjYorVEGHot6AVdH8MAofuav2sXncUz5A7zFY2P3A9TYJMdyLTvfNR
 zI33MbM2kRnZCY6l0L5KRYhURJ+U0yoqTFRNa/MA7x9OmZr4wVyTU01F2N44eLo7o8Gn
 fPUd0EQDZ1JuQHMpBjryYBobhXQRp4qdkx24zV5/ykZmTysnuFyhO4OLm0w+BlQMyt/9
 ZpzQ==
X-Gm-Message-State: AOAM531DNtVybJ0yOrry9+8Ta1pMYw5Mw7KN+7CyrGEP/K06ALaqfo0h
 guSAs0oJP6sMMkerMgYC3wu/DQ==
X-Google-Smtp-Source: ABdhPJzTPsAEpa9EYwweA9WGhebfnIttjIU58Yz6eHg0zov/iI3h1PCXca6xczQJyN45UetI2l6wKg==
X-Received: by 2002:a05:620a:121c:b0:67d:da02:19e3 with SMTP id
 u28-20020a05620a121c00b0067dda0219e3mr21500316qkj.173.1649685016543; 
 Mon, 11 Apr 2022 06:50:16 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net.
 [173.246.12.168]) by smtp.gmail.com with ESMTPSA id
 p8-20020a05620a15e800b0069c1006a883sm3162930qkm.2.2022.04.11.06.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 06:50:16 -0700 (PDT)
Message-ID: <854cc6172735360f73d5a93ddadbb3030cc1a57b.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/2] media: v4l: Add H265 pixel format
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: James_Lin <Ping-lei.Lin@mediatek.com>, linux-kernel@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Arnd Bergmann <arnd@arndb.de>, Ricardo
 Ribalda <ribalda@chromium.org>, Ming Qian <ming.qian@nxp.com>, Andrzej
 Pietrasiewicz <andrzej.p@collabora.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 lecopzer.chen@mediatek.com, max.yan@mediatek.com,
 sherlock.chang@mediatek.com,  tm.wu@mediatek.com
Date: Mon, 11 Apr 2022 09:50:14 -0400
In-Reply-To: <20220411080120.26008-3-Ping-lei.Lin@mediatek.com>
References: <20220411080120.26008-1-Ping-lei.Lin@mediatek.com>
 <20220411080120.26008-3-Ping-lei.Lin@mediatek.com>
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_065019_277675_189EF366 
X-CRM114-Status: GOOD (  16.56  )
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

TGUgbHVuZGkgMTEgYXZyaWwgMjAyMiDDoCAxNjowMSArMDgwMCwgSmFtZXNfTGluIGEgw6ljcml0
wqA6Cj4gQWRkIEgyNjUgcGl4ZWwgZm9ybWF0Lgo+IFNvIGRyaXZlciBjYW4gcmVjb2duaXplIGV4
dGVybmFsIGNhbWVyYSBkZXZpY2VzIAo+IHdob20gdXNlIGgyNjUgdG8gZGVzY3JpYmUgSGlnaCBF
ZmZpY2llbmN5IFZpZGVvIENvZGluZyBtZXRob2QuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFtZXNf
TGluIDxQaW5nLWxlaS5MaW5AbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICAuLi4vdXNlcnNwYWNlLWFw
aS9tZWRpYS92NGwvcGl4Zm10LWNvbXByZXNzZWQucnN0ICAgICAgfCAxMCArKysrKysrKysrCj4g
IGRyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItaW9jdGwuYyAgICAgICAgICAgICAgICAgICB8
ICAxICsKPiAgaW5jbHVkZS91YXBpL2xpbnV4L3ZpZGVvZGV2Mi5oICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDEgKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL21lZGlhL3Y0bC9waXhmbXQt
Y29tcHJlc3NlZC5yc3QgYi9Eb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvbWVkaWEvdjRsL3Bp
eGZtdC1jb21wcmVzc2VkLnJzdAo+IGluZGV4IDk2N2ZjODAzZWY5NC4uNzUyOTJhYWZlMmViIDEw
MDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9tZWRpYS92NGwvcGl4Zm10
LWNvbXByZXNzZWQucnN0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL21lZGlh
L3Y0bC9waXhmbXQtY29tcHJlc3NlZC5yc3QKPiBAQCAtMzYsNiArMzYsMTYgQEAgQ29tcHJlc3Nl
ZCBGb3JtYXRzCj4gICAgICAgIC0gTVBFRyBtdWx0aXBsZXhlZCBzdHJlYW0uIFRoZSBhY3R1YWwg
Zm9ybWF0IGlzIGRldGVybWluZWQgYnkKPiAgCWV4dGVuZGVkIGNvbnRyb2wgYGBWNEwyX0NJRF9N
UEVHX1NUUkVBTV9UWVBFYGAsIHNlZQo+ICAJOnJlZjpgbXBlZy1jb250cm9sLWlkYC4KPiArICAg
ICogLi4gX1Y0TDItUElYLUZNVC1IMjY1Ogo+ICsKPiArICAgICAgLSBgYFY0TDJfUElYX0ZNVF9I
MjY1YGAKClBsZWFzZSBuYW1lIHRoaXMgVjRMMl9QSVhfRk1UX0hFVkMuIFRoaXMgaGFzIGJlZW4g
ZGlzY3Vzc2VkIGZldyB5ZWFycyBhZ28sCnJlbGF0ZWQgdG8gdGhlIHN0YWdpbmcgVjRMMl9QSVhf
Rk1UX0hFVkNfU0xJQ0UgZm9ybWF0ICh3aGljaCBpcyBiZWluZyB3b3JrZWQgb24KdG8gYmUgdGFr
ZW4gb3V0IG9mIHN0YWdpbmcpLiBIRVZDIHdhcyBwcmVmZXJyZWQgb3ZlciBILjI2NSwgc28gbGV0
cyBiZQpjb25zaXN0ZW50IG5vdyB0aGF0IGRlY2lzaW9uIGhhcyBiZWVuIG1hZGUuCgo+ICsgICAg
ICAtICdIMjY1Jwo+ICsgICAgICAtIEguMjY1IEFjY2VzcyBVbml0Lgo+ICsJVGhlIGRlY29kZXIg
ZXhwZWN0cyBvbmUgQWNjZXNzIFVuaXQgcGVyIGJ1ZmZlci4KPiArCVRoZSBlbmNvZGVyIGdlbmVy
YXRlcyBvbmUgQWNjZXNzIFVuaXQgcGVyIGJ1ZmZlci4KPiArCUlmIDpyZWY6YFZJRElPQ19FTlVN
X0ZNVGAgcmVwb3J0cyBgYFY0TDJfRk1UX0ZMQUdfQ09OVElOVU9VU19CWVRFU1RSRUFNYGAKPiAr
CXRoZW4gdGhlIGRlY29kZXIgaGFzIG5vCXJlcXVpcmVtZW50cyBzaW5jZSBpdCBjYW4gcGFyc2Ug
YWxsIHRoZQo+ICsJaW5mb3JtYXRpb24gZnJvbSB0aGUgcmF3IGJ5dGVzdHJlYW0uCj4gICAgICAq
IC4uIF9WNEwyLVBJWC1GTVQtSDI2NDoKPiAgCj4gICAgICAgIC0gYGBWNEwyX1BJWF9GTVRfSDI2
NGBgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItaW9jdGwuYyBi
L2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItaW9jdGwuYwo+IGluZGV4IDk2ZTMwN2ZlM2Fh
Yi4uYWVhZWIyOTMwN2E0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0
bDItaW9jdGwuYwo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItaW9jdGwuYwo+
IEBAIC0xNDAyLDYgKzE0MDIsNyBAQCBzdGF0aWMgdm9pZCB2NGxfZmlsbF9mbXRkZXNjKHN0cnVj
dCB2NGwyX2ZtdGRlc2MgKmZtdCkKPiAgCQljYXNlIFY0TDJfUElYX0ZNVF9KUEVHOgkJZGVzY3Ig
PSAiSkZJRiBKUEVHIjsgYnJlYWs7Cj4gIAkJY2FzZSBWNEwyX1BJWF9GTVRfRFY6CQlkZXNjciA9
ICIxMzk0IjsgYnJlYWs7Cj4gIAkJY2FzZSBWNEwyX1BJWF9GTVRfTVBFRzoJCWRlc2NyID0gIk1Q
RUctMS8yLzQiOyBicmVhazsKPiArCQljYXNlIFY0TDJfUElYX0ZNVF9IMjY1OgkJZGVzY3IgPSAi
SC4yNjUiOyBicmVhazsKPiAgCQljYXNlIFY0TDJfUElYX0ZNVF9IMjY0OgkJZGVzY3IgPSAiSC4y
NjQiOyBicmVhazsKPiAgCQljYXNlIFY0TDJfUElYX0ZNVF9IMjY0X05PX1NDOglkZXNjciA9ICJI
LjI2NCAoTm8gU3RhcnQgQ29kZXMpIjsgYnJlYWs7Cj4gIAkJY2FzZSBWNEwyX1BJWF9GTVRfSDI2
NF9NVkM6CWRlc2NyID0gIkguMjY0IE1WQyI7IGJyZWFrOwo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L3VhcGkvbGludXgvdmlkZW9kZXYyLmggYi9pbmNsdWRlL3VhcGkvbGludXgvdmlkZW9kZXYyLmgK
PiBpbmRleCAzNzY4YTBhODA4MzAuLjYzNmU0MjM2YmZiOCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRl
L3VhcGkvbGludXgvdmlkZW9kZXYyLmgKPiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgvdmlkZW9k
ZXYyLmgKPiBAQCAtNjkxLDYgKzY5MSw3IEBAIHN0cnVjdCB2NGwyX3BpeF9mb3JtYXQgewo+ICAj
ZGVmaW5lIFY0TDJfUElYX0ZNVF9KUEVHICAgICB2NGwyX2ZvdXJjYygnSicsICdQJywgJ0UnLCAn
RycpIC8qIEpGSUYgSlBFRyAgICAgKi8KPiAgI2RlZmluZSBWNEwyX1BJWF9GTVRfRFYgICAgICAg
djRsMl9mb3VyY2MoJ2QnLCAndicsICdzJywgJ2QnKSAvKiAxMzk0ICAgICAgICAgICovCj4gICNk
ZWZpbmUgVjRMMl9QSVhfRk1UX01QRUcgICAgIHY0bDJfZm91cmNjKCdNJywgJ1AnLCAnRScsICdH
JykgLyogTVBFRy0xLzIvNCBNdWx0aXBsZXhlZCAqLwo+ICsjZGVmaW5lIFY0TDJfUElYX0ZNVF9I
MjY1ICAgICB2NGwyX2ZvdXJjYygnSCcsICcyJywgJzYnLCAnNScpIC8qIEgyNjUgd2l0aCBzdGFy
dCBjb2RlcyAqLwo+ICAjZGVmaW5lIFY0TDJfUElYX0ZNVF9IMjY0ICAgICB2NGwyX2ZvdXJjYygn
SCcsICcyJywgJzYnLCAnNCcpIC8qIEgyNjQgd2l0aCBzdGFydCBjb2RlcyAqLwo+ICAjZGVmaW5l
IFY0TDJfUElYX0ZNVF9IMjY0X05PX1NDIHY0bDJfZm91cmNjKCdBJywgJ1YnLCAnQycsICcxJykg
LyogSDI2NCB3aXRob3V0IHN0YXJ0IGNvZGVzICovCj4gICNkZWZpbmUgVjRMMl9QSVhfRk1UX0gy
NjRfTVZDIHY0bDJfZm91cmNjKCdNJywgJzInLCAnNicsICc0JykgLyogSDI2NCBNVkMgKi8KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
