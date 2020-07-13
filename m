Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB500C433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 10:48:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 956EF2072D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 10:48:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1ndn8MNB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AL08sAvz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 956EF2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9kTXcdc8Hf20iOOZzivb7RBs5ZeQtluIjzYAQgxj3Ik=; b=1ndn8MNBJx54vigolUH9Fuhj+
	82Mt6b2RblaeDBf2Q7Mc9KGyFmMUMULG0asGswhsZDP8Z+0OIFY4BSeJPFSvoxeaBiV2AgFZ7lvUw
	WiuiTP0V3E2HksoxsDmbSIh0QL0AEuZWMqBiwdk/VGuSW8Rcb0Kw2+mc5xmOLTZb56CUyC5amIAsK
	edH6kid87McsF7RW62ozyTERRMzF6OFXztuhUKsNUpdhvHyjTYzyZXKA3hHuay+zkGg6OQ4Dhu6Iy
	03eVbdylwR9FgdUgjwRQgNoPUEVWZDd+kA71uP7ulq5MSQOgzbdg0Ron5lFqlnLkqQKTU5T2IAOv+
	YDuXjijZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juw0U-0002Aa-94; Mon, 13 Jul 2020 10:48:22 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juw0S-00029l-2y
 for linux-mediatek@lists.infradead.org; Mon, 13 Jul 2020 10:48:21 +0000
Received: by mail-wr1-x442.google.com with SMTP id k6so15783823wrn.3
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Jul 2020 03:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=5bHtRaUlLsvF5kQSlI5SGY+rxlkl09WZX0Y9N5VT6eY=;
 b=AL08sAvz5D7mQ0jO2w9ZYfbGWktviB95wSp9dceUKhEiOhZPwmB3Wm1KinN4RzvUcl
 +SSr0cuJLYYFC1AlMNiO+zu+jWHEORACYoo9z6PbKsHgc8XcEjzpdQBieU2RnAyMyeeA
 SRkFEj1wnrJDZHWRVllm7Y3UMhxeTDIjGyRpaJX943uib6YOSf+/ihOnoFul7xJuGwI8
 ZJ5f7U0cCv38lsHdK0337tc1pXUy5d6Wy/79xoHFdrTA8tr4DXchBo6XkYppQe9aTp2F
 8+/lWDY2jwo/6qHN3Ss3voHvKBq8Fl5qYGKaSOpu9K7l9y+e3BNO/Oi1S+Lpde2e/JRf
 dDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=5bHtRaUlLsvF5kQSlI5SGY+rxlkl09WZX0Y9N5VT6eY=;
 b=cwM2mKhCFJs/TMKbKwjA01XWA1dCYLy3qd80k5rbQmgIPL8a31txaXKrZGDs648e4e
 xVo1CVvdeGfoC6XF7N8GVqpY3BppehzfRdjAi9zvc2Mrbc5AZjpOu7cLcVHoKo3fDLgJ
 zaYqmWzMewcUnbmYH5hgQHpYw5f7b78uHjDPS7Pc0SlGvwE2l4/raR7W6yAMFxJE+JWM
 RsoQWs3tyFwiiNH4etVA36/55NFwZvkrryX96TAFACUXH//IvAoterx90dwonR++x9j7
 6p2nSTtn+Wy7lysoe1H1Gk0frebClGIGWF+5xhTJ3q11JfaDVaWzGitLxgKJUhhkw2wz
 hgiQ==
X-Gm-Message-State: AOAM532XNHz1bQfAWBkZ3btIHW5fGnzq5ykRFmNfGOI/sFno4AU797UX
 LpZMWmntYOiU0o1NIFvDJSDNhQ==
X-Google-Smtp-Source: ABdhPJx7pyReXo1pStdRlzwAyeGpLPJW8L0Gp4kWOkffUi9qRF+WHeffZ0olYz7X7slJzdrvAfkakg==
X-Received: by 2002:a5d:56c7:: with SMTP id m7mr78292690wrw.223.1594637298900; 
 Mon, 13 Jul 2020 03:48:18 -0700 (PDT)
Received: from dell ([2.31.163.6])
 by smtp.gmail.com with ESMTPSA id l1sm23647155wrb.12.2020.07.13.03.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 03:48:18 -0700 (PDT)
Date: Mon, 13 Jul 2020 11:48:16 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH 1/4] mfd: mt6360: Refactor and fix code style
Message-ID: <20200713104816.GD3500@dell>
References: <1594117856-14343-1-git-send-email-gene.chen.richtek@gmail.com>
 <1594117856-14343-2-git-send-email-gene.chen.richtek@gmail.com>
 <b9540dc6-4d43-45e4-8878-15d2df24a268@gmail.com>
 <20200713065110.GB3500@dell>
 <CAE+NS36uRRqHetQE5QVJ94WX4g7CdQzvD-0VOnLfKAbqdHs3Sg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAE+NS36uRRqHetQE5QVJ94WX4g7CdQzvD-0VOnLfKAbqdHs3Sg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_064820_265224_F81F46C4 
X-CRM114-Status: GOOD (  17.20  )
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
Cc: Gene Chen <gene_chen@richtek.com>, linux-kernel@vger.kernel.org,
 cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAxMyBKdWwgMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgoKPiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPiDmlrwgMjAyMOW5tDfmnIgxM+aXpSDpgLHkuIAg5LiL5Y2IMjo1MeWv
q+mBk++8mgo+ID4KPiA+IE9uIEZyaSwgMTAgSnVsIDIwMjAsIE1hdHRoaWFzIEJydWdnZXIgd3Jv
dGU6Cj4gPgo+ID4gPgo+ID4gPgo+ID4gPiBPbiAwNy8wNy8yMDIwIDEyOjMwLCBHZW5lIENoZW4g
d3JvdGU6Cj4gPiA+ID4gRnJvbTogR2VuZSBDaGVuIDxnZW5lX2NoZW5AcmljaHRlay5jb20+Cj4g
PiA+ID4KPiA+ID4gPiBSZWFycmFuZ2UgaW5jbHVkZSBmaWxlLgo+ID4gPiA+IFJlbW92ZSBicmFj
a2V0cyBhcm91bmQgcmF3IG51bWJlcnMuCj4gPiA+ID4gSW5kaWNhdGUgc3ViLWRldiBjb21wYXRp
YmxlIG5hbWUgYnkgdXNpbmcgIi0iCj4gPiA+ID4gQ29tYmluZSBtdDYzNjAgcG1pYy9sZG8gcmVz
b3VjZXMgaW50byBtdDYzNjAgcmVndWxhdG9yIHJlc291cmNlcy4KPiA+ID4gPiBSZW5hbWUgbXQ2
MzYwX3BtdV9kYXRhIGJ5IG10NjM2MF9kYXRhLgo+ID4gPiA+IFJlbmFtZSBtdDYzNjBfcG11IGJ5
IG10NjM2MC4KPiA+ID4KPiA+ID4gVGhhdCBzZWVtcyBsaWtlIGEgbG90IG9mIGNvc21ldGljcy4g
V2h5IGlzIHRoaXMgbmVlZGVkPwo+ID4gPiBJZiB5b3UgdGhpbmsgdGhhdCdzIG5lZWRlZCBpdCBz
aG91bGQgYmUgc3BsaXQgdXAgaW4gZGlmZmVyZW50IGNvbW1pdHMsIGVhY2gKPiA+ID4gZXhwbGFp
bmluZyBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ugd2h5IHlvdSBkbyB0aGF0Lgo+ID4KPiA+IEFncmVl
ZC4gIFRoaXMgc2V0IGlzIHN0aWxsIG5vdCBicm9rZW4gdXAgZW5vdWdoLgo+ID4KPiA+IFBsZWFz
ZSBwbGFjZSBlYWNoIGxvZ2ljYWwgY2hhbmdlIGludG8gaXRzIG93biBwYXRjaCBmb3IgcmV2aWV3
Lgo+ID4KPiAKPiAxLiBSZWFycmFuZ2UgaW5jbHVkZSBmaWxlLgo+IEFmdGVyIGNoZWNrIHNlcnZl
cmFsIGZpbGUgYWJvdXQgY29kaW5nIHN0eWxlLCBpbmNsdWRlIGZpbGUgc2VlbXMgc29ydAo+IGJ5
IGFyY2hpdGVjdHVyZSwgbm90IGJ5IGFscGhhYmV0Cj4gMi4gUmVtb3ZlIGJyYWNrZXRzIGFyb3Vu
ZCByYXcgbnVtYmVycy4KPiBEdWUgdG8gcmVkdW5kYW50IGJyYWNrZXRzLCBhbm90aGVyIHJldmll
d2VyIHJlY29tbWVuZGVkIHRvIGRlbGV0ZSB0aGVtLgo+IDMuIEluZGljYXRlIHN1Yi1kZXYgY29t
cGF0aWJsZSBuYW1lIGJ5IHVzaW5nICItIgo+IFN1Z2dlc3Rpb24gYnkgTGVlcyB3aGVuIHJldmll
dyBtZmQgYmluZGluZyBkb2N1bWVudC4KPiA0LiBDb21iaW5lIG10NjM2MCBwbWljL2xkbyByZXNv
dWNlcyBpbnRvIG10NjM2MCByZWd1bGF0b3IgcmVzb3VyY2VzLgo+IFNpbXBsaWZ5IHRoZSBzaW1p
bGFyIHJlc291cmNlcyBvYmplY3QuCj4gNS4gUmVuYW1lIG10NjM2MF9wbXVfZGF0YSBieSBtdDYz
NjBfZGF0YS4KPiBOb3Qgb25seSBpbmNsdWRlIHBtdSBwYXJ0LCBidXQgYWxzbyBlbnRpcmUgTVQ2
MzYwIElDLgo+IDYuIFJlbmFtZSBtdDYzNjBfcG11IGJ5IG10NjM2MC4KPiBTYW1lIHJlYXNvbiBh
cyBhYm92ZS4KPiAKPiBXZSB0cnkgdG8gbWFrZSBjb2RlIG1vcmUgc2ltcGxlciBhbmQgZWFzaWVy
IHRvIHVuZGVyc3RhbmQKPiBXZSBjYW4gYWxzbyBkaXNjYXJkIGNoYW5nZXMgaWYgcGF0Y2ggMSwy
LDQsNSw2IGRvZXNuJ3QgbWFrZSBhbnkgZGlmZmVyZW5jZS4KCkknbSBub3Qgc3VyZSB3aGF0IHlv
dSdyZSB0cnlpbmcgdG8gc2F5LgoKUGxlYXNlIHBsYWNlIGVhY2ggb24gb2YgdGhlc2UgY2hhbmdl
cyBpbnRvIHRoZWlyIG93biBwYXRjaC4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9y
IFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4g
c291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3
aXR0ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
