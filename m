Return-Path: <SRS0=jwT2=OY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4209C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Oct 2021 23:42:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 853BC61131
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Oct 2021 23:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 853BC61131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IuY/6X6xTtaN269Z5WzKqsG/HqrY4TwjiqIz1oY5Fas=; b=pBTioV4oCG8SP+
	nscE+e4ept5FBZog9vv1z6LLWfTxRl8An/o/oAj8iTbf0dqP6j3nqdpn6L0ieC9B63liq5Act7aaI
	F6sk8TxQjj5lMa8EYVR3qMYdyTuSKFlyXMyT5T7dBZBbMvGEr2U4v90jF1UhqWNuT+WbqnCxBdyqb
	56X//HQVJtDMeTWfoMcdpEabbJTmDNuSfHOr91IY0kYafklTQHw1oLB3KJa4SFC4UN4NECflPPhEX
	azoxpVDr8Kgpox7C/WK0cDxkCwR/4wQ0nWSiBFC3DHZK/yORUeZULMGwSw0lPGJSvVJbyySOCimQ4
	UiAxfmjLIVneK+rJzPQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXXax-008OYh-In; Mon, 04 Oct 2021 23:42:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXXak-008OXC-SY; Mon, 04 Oct 2021 23:41:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3179F61465;
 Mon,  4 Oct 2021 23:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633390914;
 bh=WnectnZlCpcN61u4P637Y4VP+/XeYfu9evNmOwRjGE8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PedMieptOH3QAu5hrQRBKb2vz5y9jLhG0XoC4awDbq5B2EUhQnt+Xr54GzaMAXzvC
 BB5MLnDCBBjRq5C1+RG9OM1CuGM6AiRxLsJC2yfvxq1A1COlDf7YJ6s/nTC1Sjv3Ul
 jKBcydao/10vr1Ubv+vKMcgqObFE74d00M0AJoiAxAw2toVHbFNy52CHC+wTCQbWP0
 2TsG//vFGyem/A1+MY/CuhtK9JJMvic+C6dN88k0JvBGz3qt7DutxVBiOkK8doUolU
 jpcv7Fb5mwQnFNv18BRgtpfXCFRmeXyVM2iPzJJmZJ6r/+TfKhfojpAf+fp8b8Aaul
 4CBT38HD2VlzA==
Received: by mail-ed1-f45.google.com with SMTP id r18so71055126edv.12;
 Mon, 04 Oct 2021 16:41:54 -0700 (PDT)
X-Gm-Message-State: AOAM532u5ZsgZgck7N9o7+BjXNKYDfZvCw42Fw3uVHZTBvnIIwJwZHly
 Psw2xeSI1iFZYNU9wGGtHzblL2WLdA0TEpn31w==
X-Google-Smtp-Source: ABdhPJytlz/j7z7RIkYICVtGXnlO4ZRu804S/63zkgVzKSKfZfB7OF+ECsWzuO7+wkBDJPSdAg9zzWDwhLAyYGrsbyY=
X-Received: by 2002:a50:bf0f:: with SMTP id f15mr21400916edk.43.1633390912636; 
 Mon, 04 Oct 2021 16:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210930131850.21202-1-yongqiang.niu@mediatek.com>
 <20210930131850.21202-2-yongqiang.niu@mediatek.com>
In-Reply-To: <20210930131850.21202-2-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 5 Oct 2021 07:41:41 +0800
X-Gmail-Original-Message-ID: <CAAOTY_82OaLAz0o6BUcogQ=xgYTsFJSov=J72UzMwwq3YtkPdg@mail.gmail.com>
Message-ID: <CAAOTY_82OaLAz0o6BUcogQ=xgYTsFJSov=J72UzMwwq3YtkPdg@mail.gmail.com>
Subject: Re: [PATCH v2,
 1/1] mailbox: cmdq: add instruction time-out interrupt support
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>, 
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_164154_993499_F718BF88 
X-CRM114-Status: GOOD (  16.88  )
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

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMeW5tDnmnIgzMOaXpSDpgLHlm5sg5LiL5Y2IOToxOOWvq+mBk++8mgo+Cj4gYWRk
IHRpbWUtb3V0IGN5Y2xlIHNldHRpbmcgdG8gbWFrZSBzdXJlIHRpbWUtb3V0IGludGVycnVwdCBp
cnEKPiB3aWxsIGhhcHBlbmVkIHdoZW4gaW5zdHJ1Y3Rpb24gdGltZS1vdXQgZm9yIHdhaXQgYW5k
IHBvbGwKPgo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVk
aWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jIHwg
MTEgKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jIGIvZHJpdmVycy9t
YWlsYm94L210ay1jbWRxLW1haWxib3guYwo+IGluZGV4IDY0MTc1YTg5MzMxMi4uMTk3YjAzMjIy
Zjk0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMKPiAr
KysgYi9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jCj4gQEAgLTM2LDYgKzM2LDcg
QEAKPiAgI2RlZmluZSBDTURRX1RIUl9FTkRfQUREUiAgICAgICAgICAgICAgMHgyNAo+ICAjZGVm
aW5lIENNRFFfVEhSX1dBSVRfVE9LRU4gICAgICAgICAgICAweDMwCj4gICNkZWZpbmUgQ01EUV9U
SFJfUFJJT1JJVFkgICAgICAgICAgICAgIDB4NDAKPiArI2RlZmluZSBDTURRX1RIUl9JTlNUTl9U
SU1FT1VUX0NZQ0xFUyAgMHg1MAo+Cj4gICNkZWZpbmUgR0NFX0dDVExfVkFMVUUgICAgICAgICAg
ICAgICAgIDB4NDgKPgo+IEBAIC01NCw2ICs1NSwxNSBAQAo+ICAjZGVmaW5lIENNRFFfSlVNUF9C
WV9PRkZTRVQgICAgICAgICAgICAweDEwMDAwMDAwCj4gICNkZWZpbmUgQ01EUV9KVU1QX0JZX1BB
ICAgICAgICAgICAgICAgICAgICAgICAgMHgxMDAwMDAwMQo+Cj4gKy8qCj4gKyAqIGluc3RydWN0
aW9uIHRpbWUtb3V0Cj4gKyAqIGN5Y2xlcyB0byBpc3N1ZSBpbnN0cnVjdGlvbiB0aW1lLW91dCBp
bnRlcnJ1cHQgZm9yIHdhaXQgYW5kIHBvbGwgaW5zdHJ1Y3Rpb25zCj4gKyAqIEdDRSBheGlfY2xv
Y2sgMTU2TUh6Cj4gKyAqIDEgY3ljbGUgPSA2LjQxbnMKPiArICogaW5zdHJ1Y3Rpb24gdGltZSBv
dXQgMl4yMioyKjYuNDFucyA9IDUzbXMKCkZvciBkaWZmZXJlbnQgY2xpZW50cywgdGhlIHRpbWVv
dXQgdmFsdWUgd291bGQgYmUgZGlmZmVyZW50LCBhbmQgZWFjaApjbGllbnQgY291bGQgdXNlIHRp
bWVyIHRvIGRldGVjdCB0aW1lb3V0LCBzbyBpdCdzIG5vdCBuZWNlc3NhcnkgdG8KZW5hYmxlIHRp
bWVvdXQgaW4gY21kcSBkcml2ZXIuCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPiArICovCj4gKyNk
ZWZpbmUgQ01EUV9JTlNUTl9USU1FT1VUX0NZQ0xFUyAgICAgIDIyCj4gKwo+ICBzdHJ1Y3QgY21k
cV90aHJlYWQgewo+ICAgICAgICAgc3RydWN0IG1ib3hfY2hhbiAgICAgICAgKmNoYW47Cj4gICAg
ICAgICB2b2lkIF9faW9tZW0gICAgICAgICAgICAqYmFzZTsKPiBAQCAtMzc2LDYgKzM4Niw3IEBA
IHN0YXRpYyBpbnQgY21kcV9tYm94X3NlbmRfZGF0YShzdHJ1Y3QgbWJveF9jaGFuICpjaGFuLCB2
b2lkICpkYXRhKQo+ICAgICAgICAgICAgICAgICB3cml0ZWwoKHRhc2stPnBhX2Jhc2UgKyBwa3Qt
PmNtZF9idWZfc2l6ZSkgPj4gY21kcS0+c2hpZnRfcGEsCj4gICAgICAgICAgICAgICAgICAgICAg
ICB0aHJlYWQtPmJhc2UgKyBDTURRX1RIUl9FTkRfQUREUik7Cj4KPiArICAgICAgICAgICAgICAg
d3JpdGVsKENNRFFfSU5TVE5fVElNRU9VVF9DWUNMRVMsIHRocmVhZC0+YmFzZSArIENNRFFfVEhS
X0lOU1ROX1RJTUVPVVRfQ1lDTEVTKTsKPiAgICAgICAgICAgICAgICAgd3JpdGVsKHRocmVhZC0+
cHJpb3JpdHksIHRocmVhZC0+YmFzZSArIENNRFFfVEhSX1BSSU9SSVRZKTsKPiAgICAgICAgICAg
ICAgICAgd3JpdGVsKENNRFFfVEhSX0lSUV9FTiwgdGhyZWFkLT5iYXNlICsgQ01EUV9USFJfSVJR
X0VOQUJMRSk7Cj4gICAgICAgICAgICAgICAgIHdyaXRlbChDTURRX1RIUl9FTkFCTEVELCB0aHJl
YWQtPmJhc2UgKyBDTURRX1RIUl9FTkFCTEVfVEFTSyk7Cj4gLS0KPiAyLjI1LjEKPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
