Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840ABC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 14:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xsg+eryaacqBtO5tC0NSOSWAkzfx4otzID6Rwwi9b50=; b=LMKv8N7hzYWzeu
	rY9FwjzsvraM+ajRpuwFEwonpT5nLsREre0kStd8pCkVycKyWyxEq3vTVszdR1/p39hppWSUyY1fR
	bIEIJ0jGsS0xi7t7Rgp+Pd5Dyw35zlsKHigNpylM9BCSguigHlxO56Ebes8hTxa1k22nnWgDwxcNV
	V02ZrXCl0GsrOctCFSIyHtPNkaaiAUiYVME3O3MWZ8rHH1VE1J8gXXJJMaa8kItHwJf0g9eXaSy1j
	v0I2Vl3cl3sULm4CcnN/sjf+Ik5KmngyIWx1gSBLx4Gzf1qJPiXr5UqCL15SNKzN0nBURW/qq+uqA
	D4drUTeL2+Gp6TK9TJ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHoND-000STA-Ds; Wed, 09 Feb 2022 14:55:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHoMz-000SNG-Ob; Wed, 09 Feb 2022 14:54:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 940A361B57;
 Wed,  9 Feb 2022 14:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97CD7C340F6;
 Wed,  9 Feb 2022 14:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644418495;
 bh=x3KYHTnQdcpuPpSms1usX2LA7bATNpiYgyATB3QLAbc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DP8bgKOIhroqVt4vja7HreRX2JRYYft7GhrG1w+t9B6isH/MkkvyTg5+SG1Yush54
 vlluQal/lOUpBfY3ljkUOMQi1GyeS0zQtB4uB4Gwa/AWP4T5SwNJ69D4yAEDD6mYT2
 JXAvDi4PQs7+a+/vxVu/f2QtZivrpKjhdRlYj9zNgXQrI02PhH6fjwWwfxAJFGuh20
 dkeExW4jcOlFPZK7/L9c5bWjS7822u3pMYOmx3/nAQJNX8iPS4rCES+arZNCXdSe2z
 XLv/JVtJHu/woigCybi0kThymkgMkqy7oBHZa7wlsHFOlw2Q8vjEbBGt7HKj32eByY
 xxT1uZ/gweetQ==
Received: by mail-ej1-f43.google.com with SMTP id s21so7968986ejx.12;
 Wed, 09 Feb 2022 06:54:55 -0800 (PST)
X-Gm-Message-State: AOAM530Bew3h/oTQ05yjTyKFGszJW0iEr+H8LzgecqNs0eiRUtVpItrZ
 u3uCqrj2Xh0M9E9p+HLDD/f7wDFAXSSdfyveuQ==
X-Google-Smtp-Source: ABdhPJw1d9C+p2auPNdEqgcaTp3i90UkTDIFvXwjsigycoG7QKqrkkRdCImb6AEMWNRJXL/DDV7TXXvY/uMqwA6Xo28=
X-Received: by 2002:a17:906:c10f:: with SMTP id
 do15mr2266508ejc.638.1644418493696; 
 Wed, 09 Feb 2022 06:54:53 -0800 (PST)
MIME-Version: 1.0
References: <20220110084645.31191-1-nancy.lin@mediatek.com>
 <20220110084645.31191-3-nancy.lin@mediatek.com>
In-Reply-To: <20220110084645.31191-3-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 9 Feb 2022 22:54:42 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-3ekRhHcs0QstWMe9hE7X041zwjQeGcRhDq5gavBhPRw@mail.gmail.com>
Message-ID: <CAAOTY_-3ekRhHcs0QstWMe9hE7X041zwjQeGcRhDq5gavBhPRw@mail.gmail.com>
Subject: Re: [PATCH v11 02/22] dt-bindings: mediatek: add vdosys1 MERGE
 property for mt8195
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, singo.chang@mediatek.com, 
 srv_heupstream <srv_heupstream@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_065457_937779_84391116 
X-CRM114-Status: GOOD (  14.89  )
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

SGksIE5hbmN5OgoKTmFuY3kuTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPiDmlrwgMjAyMuW5
tDHmnIgxMOaXpSDpgLHkuIAg5LiL5Y2INDo0NuWvq+mBk++8mgo+Cj4gTVQ4MTk1IHZkb3N5czEg
bWVyZ2UxIHRvIG1lcmdlNCBoYXZlIEhXIG11dGUgZnVuY3Rpb24uCj4gQWRkIE1FUkdFIGFkZGl0
aW9uYWwgbXV0ZSBwcm9wZXJ0eSBkZXNjcmlwdGlvbi4KCkFwcGxpZWQgdG8gbWVkaWF0ZWstZHJt
LW5leHQgWzFdLCB0aGFua3MuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJt
LW5leHQKClJlZ2FyZHMsCkNodW4tS3VhbmcKCj4KPiBTaWduZWQtb2ZmLWJ5OiBOYW5jeS5MaW4g
PG5hbmN5LmxpbkBtZWRpYXRlay5jb20+Cj4gUmV2aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNo
dW5rdWFuZy5odUBrZXJuZWwub3JnPgo+IEFja2VkLUJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgo+IC0tLQo+ICAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1lcmdlLnlh
bWwgIHwgNCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPgo+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxtZXJnZS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbWVyZ2UueWFtbAo+IGluZGV4IDI4YmU4ZmZlYjQy
OS4uZjViMWU2MzJiY2Q1IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1lcmdlLnlhbWwKPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxt
ZXJnZS55YW1sCj4gQEAgLTYxLDYgKzYxLDEwIEBAIHByb3BlcnRpZXM6Cj4gICAgICAgIGNvbW1h
bmQgdG8gU01JIHRvIHNwZWVkIHVwIHRoZSBkYXRhIHJhdGUuCj4gICAgICB0eXBlOiBib29sZWFu
Cj4KPiArICBtZWRpYXRlayxtZXJnZS1tdXRlOgo+ICsgICAgZGVzY3JpcHRpb246IFN1cHBvcnQg
bXV0ZSBmdW5jdGlvbi4gTXV0ZSB0aGUgY29udGVudCBvZiBtZXJnZSBvdXRwdXQuCj4gKyAgICB0
eXBlOiBib29sZWFuCj4gKwo+ICAgIG1lZGlhdGVrLGdjZS1jbGllbnQtcmVnOgo+ICAgICAgZGVz
Y3JpcHRpb246Cj4gICAgICAgIFRoZSByZWdpc3RlciBvZiBjbGllbnQgZHJpdmVyIGNhbiBiZSBj
b25maWd1cmVkIGJ5IGdjZSB3aXRoIDQgYXJndW1lbnRzCj4gLS0KPiAyLjE4LjAKPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
