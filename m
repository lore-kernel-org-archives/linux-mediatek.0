Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FCFEC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 16:40:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6D6D61462
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 16:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6D6D61462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B9jD6spCaeOS1DfLEaBvKv9d4+yoE9jSKA4idfhJyeM=; b=fHQyjQ4/qhZ0SlCz7OPk6PTLI
	t3m4jWriO79fYHiO4hn7KPzf0wNxsV5B1xnNQ1N14tKFY/SJwYtihzJ+04RQV7OsqWtZAXiLx3NOc
	6MhESS8QUqg82iS+HIpfEhXY+2t+SCTFxKteB5KvnoVw6QAVAtojixDaak+wsTjjlZDKMWC/yyGj/
	+/SmtL3UOVtm4MxkM3lT4VKD5gcE/8BW8PSvOvoc6CX/+XtTkgW+1Mg4V0Enhq6p9CdkO6j2KwYxp
	EENwrsjKYmMfq+LbFJBAYa2DeDNfZh6dWEa9lY7QUWkACcQvu1IsLXtArWUYyF6ZTrFcTWuKSUya8
	pAXq3PgKg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZyqJ-001tiQ-SC; Fri, 23 Apr 2021 16:39:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZynr-001sgy-G9; Fri, 23 Apr 2021 16:37:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=OhYbLB0d0o+/kCGTrAG020tqKairinBfKsSECjcvtJc=; b=meubv4yIfKn7FOA6uXSZiDgDD8
 iYLAS7nx4eNo9WPl3dNwzdOoNe2FfLRf8XCgprInwfTM8eLqPVAPzH8tQcDzIGNT0uuqBOp23migE
 t8hfE4ip9EmHNYTqYpXMBSs3aiFA+t/tnDtxh7uROy+cd/j+zZFC4xLEyJYnI4jdGkFsh8vrhUauJ
 zpcPSNip8t7oc+JSe4QFKdhTI1D/x0nS1A4sEnQFHnomi3O4wv4eOjjIu/vL1PSvqv40wJNV5DsSt
 wBdRKDAGKbOe7BJ6sLBGT822RFzkrdsyXfOwLylIpHSsjf1MLOWHDYyccd9kaU6hniIRRL7ai4NOK
 Gv0iGAMw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZyno-00EYRn-CK; Fri, 23 Apr 2021 16:37:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4AC9561477;
 Fri, 23 Apr 2021 16:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619195828;
 bh=9IS9zneuy8LMByWB8zTbcL7UU0JhQG+Ou0Dnf6+9DWI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mVgcggccvzb5Q58UbDiH1LkySMqv79Q0ezFdDHa9YV7pgIsYnxGZqfsUJcRJc6QZV
 ZYSvR6/2IFozhh+DXQhOUmILYWpfvzt4R8iyF0yZhyhulaNj6dFjiKsV8Ndd/qXLmj
 GW/zvOnb7aOdEj2ES9uE7ITO4X3CmF8RvhaVMgBShq8F4kFHln8tWv861rOgmlvt4Z
 D2Oi1UzAr1GrTcH3dR3MSQg43Qcm6PFPXoFkffi3cT9tsvVu3W36tckpvHlMHjL4se
 QV5iCqII5/U1Z/OH7pqiU7b4YNdhJm5Grt1Znz4Y1xKyi4U3GYj+xibZ95aulFox9+
 oJ9bLrvt7by5g==
Received: by mail-ej1-f52.google.com with SMTP id u17so74830080ejk.2;
 Fri, 23 Apr 2021 09:37:08 -0700 (PDT)
X-Gm-Message-State: AOAM5330enFIdDiCo1G3TmpfoFYWDvko/Fd0O5XFC8Nm78C4cSnkmjhJ
 rfZjJPoS6rLfAtMmTnnb1AIFXe0QlYd9eBTLdQ==
X-Google-Smtp-Source: ABdhPJyNr2Rj271SQjBJ1jzoPOY6Dqp88cO1kkQkphXe731CRxVMAIBAK4M/UFgprXi5ElqtV9WjSX3y7vxRK5ErxHg=
X-Received: by 2002:a17:906:2c4a:: with SMTP id
 f10mr5235234ejh.63.1619195826695; 
 Fri, 23 Apr 2021 09:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210420132614.150242-1-jitao.shi@mediatek.com>
 <20210420132614.150242-3-jitao.shi@mediatek.com>
In-Reply-To: <20210420132614.150242-3-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 24 Apr 2021 00:36:55 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-SKcX+4U5hKOgRaip-vk+ofEWe_g4VNUxFjN7LCprq1w@mail.gmail.com>
Message-ID: <CAAOTY_-SKcX+4U5hKOgRaip-vk+ofEWe_g4VNUxFjN7LCprq1w@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/mediatek: fine tune the dsi panel's power sequence
To: Jitao Shi <jitao.shi@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, huijuan.xie@mediatek.com,
 stonea168@163.com, 
 Cawa Cheng <cawa.cheng@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 yingjoe.chen@mediatek.com, 
 eddie.huang@mediatek.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_093712_498415_E34CD4A2 
X-CRM114-Status: GOOD (  18.93  )
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

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5
tDTmnIgyMOaXpSDpgLHkuowg5LiL5Y2IOToyNuWvq+mBk++8mgo+Cj4gQWRkIHRoZSBkcm1fcGFu
ZWxfcHJlcGFyZV9wb3dlciBhbmQgZHJtX3BhbmVsX3VucHJlcGFyZV9wb3dlciBjb250cm9sLgo+
IFR1cm4gb24gcGFuZWwgcG93ZXIoZHJtX3BhbmVsX3ByZXBhcmVfcG93ZXIpIGFuZCBjb250cm9s
IGJlZm9yZSBkc2kKPiBlbmFibGUuIEFuZCB0aGVuIGRzaSBlbmFibGUsIHNlbmQgZGNzIGNtZCBp
biBkcm1fcGFuZWxfcHJlcGFyZSwgbGFzdAo+IHR1cm4gb24gYmFja2xpZ2h0LgoKUGxlYXNlIGRl
c2NyaWJlIFdIWSBkbyB5b3UgbmVlZCB0aGlzIHBhdGNoPyBGaXggYW55IGJ1Zz8KCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCAxMiArKysrKysrKysrLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHNpLmMKPiBpbmRleCBhMWZmMTUyZWY0NjguLjQ1NWZlNTgyYzZiNSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+IEBAIC02MTUsMTAgKzYxNSwxMyBA
QCBzdGF0aWMgaW50IG10a19kc2lfcG93ZXJvbihzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+ICAgICAg
ICAgZHNpLT5kYXRhX3JhdGUgPSBESVZfUk9VTkRfVVBfVUxMKGRzaS0+dm0ucGl4ZWxjbG9jayAq
IGJpdF9wZXJfcGl4ZWwsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZHNpLT5sYW5lcyk7Cj4KPiArICAgICAgIGlmIChwYW5lbF9icmlkZ2VfcHJlcGFyZV9wb3dl
cihkc2ktPm5leHRfYnJpZGdlKSkKCnJldCA9IHBhbmVsX2JyaWRnZV9wcmVwYXJlX3Bvd2VyKGRz
aS0+bmV4dF9icmlkZ2UpOwppZiAocmV0KQoKPiArICAgICAgICAgICAgICAgRFJNX0lORk8oImNh
bid0IHByZXBhcmUgcG93ZXIgdGhlIHBhbmVsXG4iKTsKCkkgdGhpbmsgeW91IHNob3VsZCBnb3Rv
IGVycl9yZWZjb3VudDsKCj4gKwo+ICAgICAgICAgcmV0ID0gY2xrX3NldF9yYXRlKGRzaS0+aHNf
Y2xrLCBkc2ktPmRhdGFfcmF0ZSk7Cj4gICAgICAgICBpZiAocmV0IDwgMCkgewo+ICAgICAgICAg
ICAgICAgICBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBzZXQgZGF0YSByYXRlOiAlZFxuIiwgcmV0
KTsKPiAtICAgICAgICAgICAgICAgZ290byBlcnJfcmVmY291bnQ7Cj4gKyAgICAgICAgICAgICAg
IGdvdG8gZXJyX3ByZXBhcmVfcG93ZXI7Cj4gICAgICAgICB9Cj4KPiAgICAgICAgIHBoeV9wb3dl
cl9vbihkc2ktPnBoeSk7Cj4gQEAgLTY2MSw3ICs2NjQsOSBAQCBzdGF0aWMgaW50IG10a19kc2lf
cG93ZXJvbihzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+ICAgICAgICAgY2xrX2Rpc2FibGVfdW5wcmVw
YXJlKGRzaS0+ZW5naW5lX2Nsayk7Cj4gIGVycl9waHlfcG93ZXJfb2ZmOgo+ICAgICAgICAgcGh5
X3Bvd2VyX29mZihkc2ktPnBoeSk7Cj4gLWVycl9yZWZjb3VudDoKPiArZXJyX3ByZXBhcmVfcG93
ZXI6Cj4gKyAgICAgICBpZiAocGFuZWxfYnJpZGdlX3VucHJlcGFyZV9wb3dlcihkc2ktPm5leHRf
YnJpZGdlKSkKCnJldCA9IHBhbmVsX2JyaWRnZV91bnByZXBhcmVfcG93ZXIoZHNpLT5uZXh0X2Jy
aWRnZSk7Cgo+ICsgICAgICAgICAgICAgICBEUk1fSU5GTygiQ2FuJ3QgdW5wcmVwYXJlIHBvd2Vy
IHRoZSBwYW5lbFxuIik7Cj4gICAgICAgICBkc2ktPnJlZmNvdW50LS07Cj4gICAgICAgICByZXR1
cm4gcmV0Owo+ICB9Cj4gQEAgLTY5NCw2ICs2OTksOSBAQCBzdGF0aWMgdm9pZCBtdGtfZHNpX3Bv
d2Vyb2ZmKHN0cnVjdCBtdGtfZHNpICpkc2kpCj4gICAgICAgICBjbGtfZGlzYWJsZV91bnByZXBh
cmUoZHNpLT5kaWdpdGFsX2Nsayk7Cj4KPiAgICAgICAgIHBoeV9wb3dlcl9vZmYoZHNpLT5waHkp
Owo+ICsKPiArICAgICAgIGlmIChwYW5lbF9icmlkZ2VfdW5wcmVwYXJlX3Bvd2VyKGRzaS0+bmV4
dF9icmlkZ2UpKQoKcmV0ID0gcGFuZWxfYnJpZGdlX3VucHJlcGFyZV9wb3dlcihkc2ktPm5leHRf
YnJpZGdlKTsKCj4gKyAgICAgICAgICAgICAgIERSTV9JTkZPKCJDYW4ndCB1bnByZXBhcmUgcG93
ZXIgdGhlIHBhbmVsXG4iKTsKPiAgfQo+Cj4gIHN0YXRpYyB2b2lkIG10a19vdXRwdXRfZHNpX2Vu
YWJsZShzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+IC0tCj4gMi4yNS4xCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
