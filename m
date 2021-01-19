Return-Path: <SRS0=YRwc=GW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3285BC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 23:43:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40F4022E01
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 23:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40F4022E01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nDnDBc7FJBny1RGp4cE0JKdE+LlITliO5LpG7GO3WW4=; b=1Z+dXQ4KtIin4lftWBne+//sg
	fwouXXKSX8Xooh/MRKLWd2rxK6RF5CzV50qvmagBx//GKA9Zw018fWU6odawb84fF/Arkg9tLORuk
	FTIPf34rXtFenaTm/IHXQLCIgloIXdYbCBsbJfVUqefBJFTrZDNyrk+JDbFKUi0zWOsSU445uVi6n
	7wkoKcprxI4hY7szcX0Zi3WCJlyutmt8B3rYQoC7XBI7h81kKXcu/9LTBBmGja1hhot7/fNDstSde
	54quxrU8PSWCzIxsvphKZAaKgLplawybO2/JafY4IFe3nhDYDQt3ZLoNbh5jE+PRfRNCYJPgonHXM
	vjCja6THQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l20eB-0005ke-Hj; Tue, 19 Jan 2021 23:42:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l20e7-0005it-9Q; Tue, 19 Jan 2021 23:42:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 658FA2310B;
 Tue, 19 Jan 2021 23:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611099764;
 bh=vfWq8ORmisMymcb7jEgSy/+PLX1UbYJNGh+DIqiVZ3c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cYz2SiA7iMr/9YcqooJQXawqQMzYzYTU3o97XUGd//h1JT+reDI5GVwdi8mDqCnB9
 871S2NE8UrbERiInElunFQYPil6LVsNZEatFEYXrLZWRH6OtHMVUpq9r86iX3PIIoG
 Q0Fq7sExupofbMKTPeBCpLwHGhalDrNDVv2iiWMP/IcIgCqalcet3yh5YmX/X1b2Qy
 IeIKEADLH+L5ezQuqMyVlJ/BxVXNTVLTb7XmbVnSxX39Y1xYfN41ThRbZbYUbRnMb6
 9vdfg4G9kPSGeJbLpfycTgh8ox85Tc2msxKaVD4OLuNxQL+t8rsquKQc309aYB183N
 /6V8hKOsw50qQ==
Received: by mail-ej1-f48.google.com with SMTP id gx5so11747931ejb.7;
 Tue, 19 Jan 2021 15:42:44 -0800 (PST)
X-Gm-Message-State: AOAM530DpReAm91Bpvmsv3Tr+MkQU755+85pnLCwtobmFmyBireplgbY
 fMnhbU0rZHTho6NyezvOpJKfmPKQLSpMO/g7jw==
X-Google-Smtp-Source: ABdhPJy5pH3VJgW9xcAFQp76ROjf3pDBkBxpmVLZMF92SXietZmMe2rKOGmeI13Kif0jfu6KtXkSobYRfIp0pn/TCb8=
X-Received: by 2002:a17:907:d8b:: with SMTP id
 go11mr4451807ejc.303.1611099762927; 
 Tue, 19 Jan 2021 15:42:42 -0800 (PST)
MIME-Version: 1.0
References: <20210106231729.17173-1-chunkuang.hu@kernel.org>
In-Reply-To: <20210106231729.17173-1-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 20 Jan 2021 07:42:31 +0800
X-Gmail-Original-Message-ID: <CAAOTY__OmMnXL5gvso4meUfQS-xnKA6EErhM3bL3HE4zh6JMcQ@mail.gmail.com>
Message-ID: <CAAOTY__OmMnXL5gvso4meUfQS-xnKA6EErhM3bL3HE4zh6JMcQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Share mtk mutex driver for both DRM and MDP
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_184247_391976_58D42A5A 
X-CRM114-Status: GOOD (  15.17  )
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAyMDIx5bm0MeaciDfm
l6Ug6YCx5ZubIOS4iuWNiDc6MTflr6vpgZPvvJoKPgo+IG10ayBtdXRleCBpcyBhIGRyaXZlciB1
c2VkIGJ5IERSTSBhbmQgTURQIFsxXSwgc28gdGhpcyBzZXJpZXMgbW92ZQo+IG10ayBtdXRleCBk
cml2ZXIgZnJvbSBEUk0gZm9sZGVyIHRvIHNvYyBmb2xkZXIsIHNvIGl0IGNvdWxkIGJlIHVzZWQK
PiBieSBEUk0gYW5kIE1EUC4KCkFwcGxpZWQgWzEvNV0gfiBbNC81XSB0byBtZWRpYXRlay1kcm0t
bmV4dCBbMV0uCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLW5leHQKClJl
Z2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4gQ2hhbmdlcyBpbiB2MjoKPiAxLiBSZWJhc2Ugb250byBt
ZWRpYXRlay1kcm0tbmV4dCBbMl0uCj4gMi4gRXhwb3J0IHN5bWJvbCBmb3IgbXRrLW11dGV4IEFQ
SS4KPgo+IFsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMTQwNzUxLwo+
IFsyXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVu
a3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tbmV4dAo+Cj4gQ0sgSHUgKDUp
Ogo+ICAgZHJtL21lZGlhdGVrOiBSZW1vdmUgcmVkdW5kYW50IGZpbGUgaW5jbHVkaW5nCj4gICBk
cm0vbWVkaWF0ZWs6IFJlbmFtZSBmaWxlIG10a19kcm1fZGRwIHRvIG10a19tdXRleAo+ICAgZHJt
L21lZGlhdGVrOiBDaGFuZ2UgZGlzcC9kZHAgdGVybSB0byBtdXRleCBpbiBtdGsgbXV0ZXggZHJp
dmVyCj4gICBkcm0vbWVkaWF0ZWs6IEF1dG9tYXRpY2FsbHkgc2VhcmNoIHVuY2xhaW1lZCBtdGsg
bXV0ZXggaW4KPiAgICAgbXRrX211dGV4X2dldCgpCj4gICBzb2MgLyBkcm06IG1lZGlhdGVrOiBN
b3ZlIG10ayBtdXRleCBkcml2ZXIgdG8gc29jIGZvbGRlcgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9NYWtlZmlsZSAgICAgICAgICAgICB8ICAgMSAtCj4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2NydGMuYyAgICAgICB8ICAzMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kZHAuaCAgICAgICAgfCAgMjggLS0KPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZHJ2LmMgICAgICAgIHwgICAzIC0KPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZHJ2LmggICAgICAgIHwgICAxIC0KPiAgZHJpdmVycy9zb2MvbWVk
aWF0ZWsvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgICAxICsKPiAgLi4uL21lZGlhdGVrL210
ay1tdXRleC5jfSAgICAgICAgICAgICAgICAgICAgIHwgMzI4ICsrKysrKysrKy0tLS0tLS0tLQo+
ICBpbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbXV0ZXguaCAgICAgICAgfCAgMjYgKysK
PiAgOCBmaWxlcyBjaGFuZ2VkLCAyMTIgaW5zZXJ0aW9ucygrKSwgMjA4IGRlbGV0aW9ucygtKQo+
ICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRw
LmgKPiAgcmVuYW1lIGRyaXZlcnMve2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyA9PiBz
b2MvbWVkaWF0ZWsvbXRrLW11dGV4LmN9ICg1MyUpCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNs
dWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbXV0ZXguaAo+Cj4gLS0KPiAyLjE3LjEKPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
