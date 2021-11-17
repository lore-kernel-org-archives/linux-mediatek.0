Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ACD6C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 23:54:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C462C619BB
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 23:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C462C619BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qFjoa0SmXVZMAAOqlrmD0OAYF0zUm0i0NX/FkNOiYvY=; b=MIHPK6WXFNJ5mo
	21PBjwJxh57jmzvsIgfmPG8nKTkiIhCwRV1+dBfo5Kgu60tM0Jjjo0om4m+enu4GuMqnRLx92SeKS
	jQ5KTZ9ssN0r+OjcCvSQd2mzRugu6Si6ZW+zlQG60yMzWmdVxgXvncRDcoR2z7JY7guaAAQlw9ZYk
	f7+wYJTeLwn583Jxylhu8v4g6VjNa6/sMwBZyd9MUcxzCincgl7aDxL0UQwvObC88yYiMbaoz2Sef
	587oj27I/anSnm6G9MwKw5uTBZwQ4XSaNke7P7zTGy9FD4EyrfI+jWdOEq+25qcc8zjfQ1F3AjcPG
	te52mZ+j3eSJwuCkna8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnUlA-006bZe-Uv; Wed, 17 Nov 2021 23:54:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnUkx-006bWg-Jv; Wed, 17 Nov 2021 23:54:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EF8061AF0;
 Wed, 17 Nov 2021 23:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637193263;
 bh=J1GPu/7DId0gFFkAF/P1ZlWlsNgfqyTW7Xxtk5MAF78=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eglD8/Ff5UExZHvtAFulo93AlGR43TOwdfXGjlTXeh6JfTwcn4YQkqkcchR7fPxJB
 aoqrwRBeUbGzum0m3nLLSoyn5kXZhD25QcjZlxiTcRijP/DvTdofvA0cr3YglS5jhc
 mmlBqRys0LBvZfYYJrMbZ9ouFRLM7xF90zzWpy6dAnLaisMP6vswM/F/Sgguxp3Rr5
 LI6S+ntLyY96hMIphcQSpg0wqHjgjvGAMfQUml9oCwcAbDXpBY1EoamjfA1mgBBmgN
 JxkqlRJK+SmWafGVDHo9lqO+mFuo8OYK157544WRjNQneSPsBEY3Sueglp8fABMgPl
 w/Rucl0ER6DYg==
Received: by mail-ed1-f54.google.com with SMTP id z5so18610757edd.3;
 Wed, 17 Nov 2021 15:54:23 -0800 (PST)
X-Gm-Message-State: AOAM530wpliHxq+xIUu2ODXoT7/ouuDx3n1GQ/9ODHuiw22q6ntekxFd
 XjQ/O3jSTQcajAKbomKDZOabnWyecwl7SxCKDA==
X-Google-Smtp-Source: ABdhPJwDL01kt5145UOy/pd+bJ15+XrqohhADaSRLR5cZZfZhmsCH9yL9NqWbY7R0W20QsYKqPS3G6fDF3LYKeGoFVI=
X-Received: by 2002:a17:906:7955:: with SMTP id
 l21mr28765790ejo.6.1637193261641; 
 Wed, 17 Nov 2021 15:54:21 -0800 (PST)
MIME-Version: 1.0
References: <20211028101912.4624-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20211028101912.4624-1-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 18 Nov 2021 07:54:10 +0800
X-Gmail-Original-Message-ID: <CAAOTY__ZbHGef_nVA9N0cXNN5xNwdVGE9DCSo04KZvDiowbgww@mail.gmail.com>
Message-ID: <CAAOTY__ZbHGef_nVA9N0cXNN5xNwdVGE9DCSo04KZvDiowbgww@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] CMDQ refinement of Mediatek DRM driver
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Fei Shao <fshao@chromium.org>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_155423_707993_D3C7634E 
X-CRM114-Status: GOOD (  13.71  )
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

SGksIEphc29uOgoKRm9yIHRoaXMgc2VyaWVzIGV4Y2VwdCBbdjYsMy82XSBkcm0vbWVkaWF0ZWs6
IERldGVjdCBDTURRIGV4ZWN1dGlvbgp0aW1lb3V0IChJIHBpY2sgdjUpLCBhcHBsaWVkIHRvIG1l
ZGlhdGVrLWRybS1uZXh0IFsxXSwgdGhhbmtzLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLz9oPW1l
ZGlhdGVrLWRybS1uZXh0CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKamFzb24tamgubGluIDxqYXNv
bi1qaC5saW5AbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5tDEw5pyIMjjml6Ug6YCx5ZubIOS4i+WN
iDY6MTnlr6vpgZPvvJoKPgo+IENoYW5nZSBpbiB2NjoKPiAxLiBEcm9wIHRoZSByZWR1bmRhbnQg
Y2hlY2tpbmcgb2YgY21kcV92YmxhbmtfY250IC4KPiAyLiBmaXggdGhlIGluZGVudC4KPgo+IENo
YW5nZSBpbiB2NToKPiAxLiBNb3ZlIG1ib3hfZnJlZV9jaGFubmVsIHRvIGEgaW5kZXBlbmRlbnQg
cGF0Y2guCj4KPiBDaGFuZ2UgaW4gdjQ6Cj4gMS4gQWRkIGNtZHFfdmJsYW5rX2NudCBpbml0aWFs
IHZhbHVlIHRvIDMuCj4gMi4gTW92ZSBtdGtfZHJtX2NtZHFfcGt0X2NyZWF0ZSB0byB0aGUgc2Ft
ZSBkZWZpbmUgc2NvcGUgd2l0aAo+ICAgIG10a19kcm1fY21kcV9wa3RfZGVzdHJveS4KPgo+IENo
YW5nZSBpbiB2MzoKPiAxLiBSZXZlcnQgImRybS9tZWRpYXRlazogY2xlYXIgcGVuZGluZyBmbGFn
IHdoZW4gY21kcSBwYWNrZXQgaXMgZG9uZSIKPiAgICBhbmQgYWRkIGl0IGFmdGVyIHRoZSBDTURR
IHJlZmluZW1lbnQgcGF0Y2hlcy4KPiAyLiBDaGFuZ2UgdGhlIHJlbW92ZSBvZiBzdHJ1Y3QgY21k
cV9jbGllbnQgdG8gcmVtb3ZlIHRoZSBwb2ludGVyIG9mCj4gICAgc3RydWN0IGNtZHFfY2xpZW50
Lgo+IDMuIEZpeCBwa3QgYnVmIGFsbG9jIG9uY2UgYnV0IGZyZWUgbWFueSB0aW1lcy4KPgo+IENo
YW5nZXMgaW4gdjI6Cj4gMS4gRGVmaW5lIG10a19kcm1fY21kcV9wa3RfY3JlYXRlKCkgYW5kIG10
a19kcm1fY21kcV9wa3RfZGVzdHJveSgpCj4gICAgd2hlbiBDT05GSUdfTVRLX0NNRFEgaXMgcmVh
Y2hhYmxlLgo+Cj4gQ2h1bi1LdWFuZyBIdSAoNCk6Cj4gICBkcm0vbWVkaWF0ZWs6IFVzZSBtYWls
Ym94IHJ4X2NhbGxiYWNrIGluc3RlYWQgb2YgY21kcV90YXNrX2NiCj4gICBkcm0vbWVkaWF0ZWs6
IFJlbW92ZSB0aGUgcG9pbnRlciBvZiBzdHJ1Y3QgY21kcV9jbGllbnQKPiAgIGRybS9tZWRpYXRl
azogRGV0ZWN0IENNRFEgZXhlY3V0aW9uIHRpbWVvdXQKPiAgIGRybS9tZWRpYXRlazogQWRkIGNt
ZHFfaGFuZGxlIGluIG10a19jcnRjCj4KPiBZb25ncWlhbmcgTml1ICgxKToKPiAgIGRybS9tZWRp
YXRlazogQ2xlYXIgcGVuZGluZyBmbGFnIHdoZW4gY21kcSBwYWNrZXQgaXMgZG9uZQo+Cj4gamFz
b24tamgubGluICgxKToKPiAgIGRybS9tZWRpYXRlazogQWRkIG1ib3hfZnJlZV9jaGFubmVsIGlu
IG10a19kcm1fY3J0Y19kZXN0cm95Cj4KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fY3J0Yy5jIHwgMTc1ICsrKysrKysrKysrKysrKysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMTUxIGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAyLjE4LjAKPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
