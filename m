Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B29EC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 23:02:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20E7F20678
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 23:02:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q9DZdGDd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="G52m6VY9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20E7F20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kJOVVcUBjg5J+2+H6XvxXC4k/lOSF4EEir3SynvzuqY=; b=Q9DZdGDdBFi72/76fmmAiQZq5
	BOuAmkJO7ExqmKgXKpXuqBSsjuNXwxC+9tMTznIN9Sbrp8G2jqi79CCTPDD2gwR55sgYcpdR8G/UV
	vWcyyHFu/lpaJ4c4HGtxn9lh7Sd9pqt8DIzNwCXyXhPBxO26creq0vr9002znSljKdYi+RJFM2UFF
	a8Hb6rXaLbHAeFGqIJof5U/wTdViwa5tsPx/a2KKydU206wBsFLGRAhFVC1ALyH4NnHapTt6718Ot
	1W4zuGcJ7FtzJDyoYlpxz0KAhfELYEDiiq3MqCQmTglERZWdTRcjX+MlWXUP1qOSLdbgxnzp05/hd
	ELUfY7nGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kB4Qt-0000zw-AX; Wed, 26 Aug 2020 23:02:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kB4Qo-0000yF-5r; Wed, 26 Aug 2020 23:02:15 +0000
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 80514207BC;
 Wed, 26 Aug 2020 23:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598482929;
 bh=bCjCScApoje+ayni77KRjV1QLUiQwwWxm8yIGtQ7Vaw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=G52m6VY9mQDjn1suTD9wsUR71Zs9dOK8EwRciblQDH2krnAbYoYN9K47Ha1vXoBkR
 bLBr7vyx5GEl5IoDbhLPfCZ2y3qvvrqv4XdXirpr0Fyi1VyVdcRlBdqZz9volySEBh
 HCmpmnOV3XTIw+ZwjNWOhKLv3H1g5R2W911R4tHw=
Received: by mail-ed1-f54.google.com with SMTP id f24so3212797edw.10;
 Wed, 26 Aug 2020 16:02:09 -0700 (PDT)
X-Gm-Message-State: AOAM530qPMBUq8vj2bSd4KfoqnNxmd7FqISieuUn+sri1K0FVRVXU7ZB
 DzeNnqeWR+g05PU1mGWfS2At96qeTGoJAYzB0g==
X-Google-Smtp-Source: ABdhPJzvgIKXOsUB/2JDtGjX6TXHpU+YwBmlx7G7aEdn6AJRmJ2tC3KN8bkUm5p4M73ZSUJ2axruuCmlcgbeN/o/haA=
X-Received: by 2002:a50:d71c:: with SMTP id t28mr6557897edi.148.1598482928003; 
 Wed, 26 Aug 2020 16:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200817130640.18021-1-jitao.shi@mediatek.com>
 <CAAOTY_9ggDUdDD9KoOaWBx3XaK+=Q=5qxahG7SJ5uYBQZ4aadw@mail.gmail.com>
 <1597718492.6381.6.camel@mszsdaap41>
 <CAAOTY_94Bd4PGnn88r_yJC0LYkmcByTY52gwNMALuv9+D0rTXg@mail.gmail.com>
In-Reply-To: <CAAOTY_94Bd4PGnn88r_yJC0LYkmcByTY52gwNMALuv9+D0rTXg@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 27 Aug 2020 07:01:56 +0800
X-Gmail-Original-Message-ID: <CAAOTY__OfwCN4_GyyvyYRHfFh_7iRYVKtiR1ieV_Q9ijhEJw+g@mail.gmail.com>
Message-ID: <CAAOTY__OfwCN4_GyyvyYRHfFh_7iRYVKtiR1ieV_Q9ijhEJw+g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: dsi: fix scrolling of panel with small
 hfp or hbp
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_190214_389598_BC28CEA8 
X-CRM114-Status: GOOD (  25.23  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jitao Shi <jitao.shi@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, cawa.cheng@mediatek.com,
 CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEppdGFvOgoKQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAy
MDIw5bm0OOaciDE45pelIOmAseS6jCDkuIvljYgxMDo0NeWvq+mBk++8mgo+Cj4gSGksIEppdGFv
Ogo+Cj4gSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5tDjmnIgx
OOaXpSDpgLHkuowg5LiK5Y2IMTA6NDHlr6vpgZPvvJoKPiA+Cj4gPiBPbiBUdWUsIDIwMjAtMDgt
MTggYXQgMDc6NDIgKzA4MDAsIENodW4tS3VhbmcgSHUgd3JvdGU6Cj4gPiA+IEhpLCBKaXRhbzoK
PiA+ID4KPiA+ID4gSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5
tDjmnIgxN+aXpSDpgLHkuIAg5LiL5Y2IOTowN+Wvq+mBk++8mgo+ID4gPiA+Cj4gPiA+ID4gaG9y
aXpvbnRhbF9iYWNrcG9yY2hfYnl0ZSBzaG91bGQgYmUgaGJwICogYnBwIC0gaGJwIGV4dHJhIGJ5
dGVzLgo+ID4gPiA+IFNvIHJlbW92ZSB0aGUgd3Jvbmcgc3VidHJhY3Rpb24gMTAuCj4gPiA+ID4K
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+
Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMg
fCA5ICsrKystLS0tLQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5j
Cj4gPiA+ID4gaW5kZXggMjcwYmYyMmM5OGZlLi41ZDAzMWU2MzQ1NzEgMTAwNjQ0Cj4gPiA+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+ID4gPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiA+ID4gPiBAQCAtNDczLDE0ICs0NzMs
MTMgQEAgc3RhdGljIHZvaWQgbXRrX2RzaV9jb25maWdfdmRvX3RpbWluZyhzdHJ1Y3QgbXRrX2Rz
aSAqZHNpKQo+ID4gPiA+ICAgICAgICAgaG9yaXpvbnRhbF9zeW5jX2FjdGl2ZV9ieXRlID0gKHZt
LT5oc3luY19sZW4gKiBkc2lfdG1wX2J1Zl9icHAgLSAxMCk7Cj4gPiA+Cj4gPiA+IFNvIHRoaXMg
c3VidHJhY3Rpb24gMTAgaXMgY29ycmVjdD8KPiA+ID4KPiA+ID4gUmVnYXJkcywKPiA+ID4gQ2h1
bi1LdWFuZy4KPiA+ID4KPiA+Cj4gPiBZZXMsIEl0IGlzIHJpZ2h0Lgo+ID4KPiA+IEluIHRoZSBj
ZWE4NjEgYW5kIGRtdCBzcGVjIHRoZSBtaW5pIGhzeW5jIGlzIDQwIHBpeGVscy4KPiA+IFNvIHRo
ZSB2bS0+aHN5bmNfbGVuICogZHNpX3RtcF9idWZfYnBwID49IDEyMCA+IDEwCj4gPgo+Cj4gT0ss
IHNvCj4KPiBSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5v
cmc+Cj4KCkFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLWZpeGVzIFsxXSwgdGhhbmtzLgoKWzFdIGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5o
dS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRybS1maXhlcwoKUmVnYXJkcywKQ2h1bi1LdWFu
Zy4KCj4gPiBCZXN0IFJlZ2FyZHMKPiA+IGppdGFvCj4gPiA+ID4KPiA+ID4gPiAgICAgICAgIGlm
IChkc2ktPm1vZGVfZmxhZ3MgJiBNSVBJX0RTSV9NT0RFX1ZJREVPX1NZTkNfUFVMU0UpCj4gPiA+
ID4gLSAgICAgICAgICAgICAgIGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUgPQo+ID4gPiA+IC0g
ICAgICAgICAgICAgICAgICAgICAgICh2bS0+aGJhY2tfcG9yY2ggKiBkc2lfdG1wX2J1Zl9icHAg
LSAxMCk7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUg
PSB2bS0+aGJhY2tfcG9yY2ggKiBkc2lfdG1wX2J1Zl9icHA7Cj4gPiA+ID4gICAgICAgICBlbHNl
Cj4gPiA+ID4gLSAgICAgICAgICAgICAgIGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUgPSAoKHZt
LT5oYmFja19wb3JjaCArIHZtLT5oc3luY19sZW4pICoKPiA+ID4gPiAtICAgICAgICAgICAgICAg
ICAgICAgICBkc2lfdG1wX2J1Zl9icHAgLSAxMCk7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIGhv
cml6b250YWxfYmFja3BvcmNoX2J5dGUgPSAodm0tPmhiYWNrX3BvcmNoICsgdm0tPmhzeW5jX2xl
bikgKgo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZHNpX3RtcF9idWZfYnBwOwo+ID4gPiA+Cj4gPiA+ID4gICAgICAgICBkYXRhX3BoeV9jeWNsZXMg
PSB0aW1pbmctPmxweCArIHRpbWluZy0+ZGFfaHNfcHJlcGFyZSArCj4gPiA+ID4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICB0aW1pbmctPmRhX2hzX3plcm8gKyB0aW1pbmctPmRhX2hzX2V4aXQg
KyAzOwo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgdGltaW5nLT5kYV9oc196ZXJv
ICsgdGltaW5nLT5kYV9oc19leGl0Owo+ID4gPiA+Cj4gPiA+ID4gICAgICAgICBpZiAoZHNpLT5t
b2RlX2ZsYWdzICYgTUlQSV9EU0lfTU9ERV9WSURFT19CVVJTVCkgewo+ID4gPiA+ICAgICAgICAg
ICAgICAgICBpZiAoKHZtLT5oZnJvbnRfcG9yY2ggKyB2bS0+aGJhY2tfcG9yY2gpICogZHNpX3Rt
cF9idWZfYnBwID4KPiA+ID4gPiAtLQo+ID4gPiA+IDIuMTIuNQo+ID4gPiA+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+ID4gTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0Cj4gPiA+ID4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+ID4gPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsKPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
