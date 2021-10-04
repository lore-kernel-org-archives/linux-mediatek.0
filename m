Return-Path: <SRS0=jwT2=OY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED9AFC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Oct 2021 23:53:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1D6260F5C
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Oct 2021 23:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B1D6260F5C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vl2Vsf5zkya2bK7T7fRk5XKMC8gL1gyH34V5QUL6kXU=; b=aBK7b0MRQh2Yi0
	6HiT2W3p/FOYvDNyEgmNf3PiOL7hy/Y4lmkjML4TQRYLv5yIPOTThNG7oawsn4hMF3GwrLXEnBGRs
	OvVm/nYSomCeLrqnkvuca5yrI1037Vl5Xgs6F4lbRqORfh3oGDuPb6+9wEkxgxybFy5shdEtzDyHr
	+33kYMYLsA3nV+e6yKqY9VGVQDQztG67Tb6OceGCEyqncsUIJe3OMK133JCOp4WBM9M5PK4Tn7SP3
	4wvLtyrac8tA6et1GGvxkwbewhDktzh1afpaL4B0dgE6pf25nATIn9q+4cpc/WGIp1wMEek0CeNLw
	9AiSCu1uEkjhNgc0c2eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXXlx-008PTn-Op; Mon, 04 Oct 2021 23:53:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXXll-008PSL-6d; Mon, 04 Oct 2021 23:53:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A7B97615A3;
 Mon,  4 Oct 2021 23:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633391596;
 bh=KacuFmoUGvcXzM9fllt69Pg7UBDWLYu7j2eBaHhQ04c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=t3GtKPhlMlF01/ThMVlitLmMDrfl19dhlT7zN6/NvKndee70E/iTNLDAh2lokJ62O
 ADwVmTCbHSzMXX1Ns6ReI3hD1Fxkcg9YzGKazko9ndwU841j9O7n3m/whWVjD3smN3
 qa4+wp6n/3Qr3j8ONaFHbCKRCRIX4NcmKcQJtgJsFaaLJTr3hnUOVXpzdZ3zcvQ1rK
 S84jpNZks49oyomLxJ25h3pFfKSUU3cPI+s1pvEayUXePzHyktrIx4LY00WKUAhchF
 SDKZdsgcXmeqC1PkIOAdqHGWqVONA+l6FFsZv0WkZWCuo2fo9Gr1KEy3ZOm7PgP2uO
 iWLsbEXhhN0+w==
Received: by mail-ed1-f46.google.com with SMTP id bm13so21048695edb.8;
 Mon, 04 Oct 2021 16:53:16 -0700 (PDT)
X-Gm-Message-State: AOAM533fnKya8Pj4alnU+V84K+S8cRFl5I8O2RHa9Proh0M3tnF+7VxX
 tI7Bley3A8x/QoJ0bAmZkuOQSaLRH6OAsZ/CnQ==
X-Google-Smtp-Source: ABdhPJwGp2DqpTNo0P4lu0bDreSkPUWiH27/pIjz21Rlva5heOvqliI+Up3iksR2Jw2wostBa8zwm00N0d1+Hs27N/U=
X-Received: by 2002:a17:906:3181:: with SMTP id
 1mr21316647ejy.388.1633391595236; 
 Mon, 04 Oct 2021 16:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210915223117.7857-1-jitao.shi@mediatek.com>
 <20210915223117.7857-2-jitao.shi@mediatek.com>
In-Reply-To: <20210915223117.7857-2-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 5 Oct 2021 07:53:04 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8H=TE8574xB3FFcGVgN_fTb_83+FT8ei1CDuB4k4-Oew@mail.gmail.com>
Message-ID: <CAAOTY_8H=TE8574xB3FFcGVgN_fTb_83+FT8ei1CDuB4k4-Oew@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] drm/dsi: transer dsi hs packet aligned
To: Jitao Shi <jitao.shi@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, CK Hu <ck.hu@mediatek.com>, 
 stonea168@163.com, huijuan.xie@mediatek.com, 
 Rex-BC Chen <rex-bc.chen@mediatek.com>, shuijing.li@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_165317_285041_B2989333 
X-CRM114-Status: GOOD (  15.32  )
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
tDnmnIgxNuaXpSDpgLHlm5sg5LiK5Y2INjozMeWvq+mBk++8mgo+Cj4gU29tZSBEU0kgZGV2aWNl
cyByZXFpcmUgdGhlIGhzIHBhY2tldCBzdGFydGluZyBhbmQgZW5kaW5nCj4gYXQgc2FtZSB0aW1l
IG9uIGFsbCBkc2kgbGFuZXMuIFNvIHVzZSBhIGZsYWcgdG8gdGhvc2UgZGV2aWNlcy4KPgoKUmV2
aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPiBTaWdu
ZWQtb2ZmLWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGlu
Y2x1ZGUvZHJtL2RybV9taXBpX2RzaS5oIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX21pcGlfZHNpLmggYi9p
bmNsdWRlL2RybS9kcm1fbWlwaV9kc2kuaAo+IGluZGV4IGFmN2JhODA3MWViMC4uOGU4NTYzNzky
NjgyIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9taXBpX2RzaS5oCj4gKysrIGIvaW5j
bHVkZS9kcm0vZHJtX21pcGlfZHNpLmgKPiBAQCAtMTc3LDYgKzE3Nyw3IEBAIHN0cnVjdCBtaXBp
X2RzaV9kZXZpY2VfaW5mbyB7Cj4gICAqIEBscF9yYXRlOiBtYXhpbXVtIGxhbmUgZnJlcXVlbmN5
IGZvciBsb3cgcG93ZXIgbW9kZSBpbiBoZXJ0eiwgdGhpcyBzaG91bGQKPiAgICogYmUgc2V0IHRv
IHRoZSByZWFsIGxpbWl0cyBvZiB0aGUgaGFyZHdhcmUsIHplcm8gaXMgb25seSBhY2NlcHRlZCBm
b3IKPiAgICogbGVnYWN5IGRyaXZlcnMKPiArICogQGhzX3BhY2tldF9lbmRfYWxpZ25lZDogdHJh
bnNmZXIgZHNpIGhzIHBhY2tldCBlbmRpbmcgYWxpZ25lZAo+ICAgKi8KPiAgc3RydWN0IG1pcGlf
ZHNpX2RldmljZSB7Cj4gICAgICAgICBzdHJ1Y3QgbWlwaV9kc2lfaG9zdCAqaG9zdDsKPiBAQCAt
MTg5LDYgKzE5MCw3IEBAIHN0cnVjdCBtaXBpX2RzaV9kZXZpY2Ugewo+ICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBtb2RlX2ZsYWdzOwo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBoc19yYXRlOwo+ICAg
ICAgICAgdW5zaWduZWQgbG9uZyBscF9yYXRlOwo+ICsgICAgICAgYm9vbCBoc19wYWNrZXRfZW5k
X2FsaWduZWQ7Cj4gIH07Cj4KPiAgI2RlZmluZSBNSVBJX0RTSV9NT0RVTEVfUFJFRklYICJtaXBp
LWRzaToiCj4gLS0KPiAyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
