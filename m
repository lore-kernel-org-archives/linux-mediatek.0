Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7ACCC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 23:43:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B33D12072E
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 23:43:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NZgjOUM5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jc/vz+UQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B33D12072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YuY3PPbRgkxRFCLQnjdzV9KthXm20sHeE4NFMmXu1j8=; b=NZgjOUM5MSLwi1vaRUlFNAJoQ
	GyyN8hZ3XGj+Q8MvmR8QoTBtmi8tQl53nV19eWrfdU8VyZwpC0nUDygc1SWs45+M0rnFaEyWCxiKI
	cZk3sqISpUC2Fzc4/b6RepYK5SV4BCIjpATF+uLCypxTV+7p1t4iREh3Gnd96/9Qk58VWobAjEt7P
	BcuA+qDxH4Cfiiw9W6+lhUMp1zLpL1FYdxtynYWjbvyELIPzPSBRLc2kmmB+D88IP65zsOO1cgSbQ
	Cj6UbkxI1u3vP0cbC6uCrNdqwNRKIDn4H2vpZVL0clfmJzzonhpNeSaSdDqGw2g4E7oFGIKo8FSGK
	kz8Pxh6qg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7omN-0008O8-Jd; Mon, 17 Aug 2020 23:43:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7omG-0008Ld-Kc; Mon, 17 Aug 2020 23:42:57 +0000
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8A5192078B;
 Mon, 17 Aug 2020 23:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597707775;
 bh=x2x17PXByjmc5GL+cpiiMIiGtoeX2KrAjZvn4MxGmjM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jc/vz+UQzZaY3RWlTnKJ/1TkiZZistwAP8D5Rbr8gGMvQbCioL9ezZGWDCLTThzMQ
 I5yeRps1Ms1E0aACHi+zxzWiY6evzagCBlM0RQAdSbsnhAHBIiYPfeCGeWc7+3eOqs
 dR1K0IcG7QqNsmy+9iOB1VtJ8Sl6Xkug3njoTXFI=
Received: by mail-ej1-f52.google.com with SMTP id c16so19870635ejx.12;
 Mon, 17 Aug 2020 16:42:55 -0700 (PDT)
X-Gm-Message-State: AOAM530wW6Y+zTc9BF+BAY2DgdPKQy8MxbDG7EvWTRzZq1g6dw1OH3wV
 GqJ/zshVqV0g3xMAVlA3gWiOVTVxJm99dAS+mg==
X-Google-Smtp-Source: ABdhPJz1blTGXowp+NNEIdFVKpxsWzYUxZj6C7dOmrD54k7lOK5kU33K3omXAVdbUpjCWHkbhkIeIAutfvc+KMgeqYw=
X-Received: by 2002:a17:906:d92c:: with SMTP id
 rn12mr16958911ejb.187.1597707774145; 
 Mon, 17 Aug 2020 16:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200817130640.18021-1-jitao.shi@mediatek.com>
In-Reply-To: <20200817130640.18021-1-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 18 Aug 2020 07:42:38 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9ggDUdDD9KoOaWBx3XaK+=Q=5qxahG7SJ5uYBQZ4aadw@mail.gmail.com>
Message-ID: <CAAOTY_9ggDUdDD9KoOaWBx3XaK+=Q=5qxahG7SJ5uYBQZ4aadw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: dsi: fix scrolling of panel with small
 hfp or hbp
To: Jitao Shi <jitao.shi@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_194256_914400_8D44AAE5 
X-CRM114-Status: GOOD (  20.72  )
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
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
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

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5
tDjmnIgxN+aXpSDpgLHkuIAg5LiL5Y2IOTowN+Wvq+mBk++8mgo+Cj4gaG9yaXpvbnRhbF9iYWNr
cG9yY2hfYnl0ZSBzaG91bGQgYmUgaGJwICogYnBwIC0gaGJwIGV4dHJhIGJ5dGVzLgo+IFNvIHJl
bW92ZSB0aGUgd3Jvbmcgc3VidHJhY3Rpb24gMTAuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKaXRhbyBT
aGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHNpLmMgfCA5ICsrKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4g
aW5kZXggMjcwYmYyMmM5OGZlLi41ZDAzMWU2MzQ1NzEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHNpLmMKPiBAQCAtNDczLDE0ICs0NzMsMTMgQEAgc3RhdGljIHZvaWQgbXRrX2RzaV9j
b25maWdfdmRvX3RpbWluZyhzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+ICAgICAgICAgaG9yaXpvbnRh
bF9zeW5jX2FjdGl2ZV9ieXRlID0gKHZtLT5oc3luY19sZW4gKiBkc2lfdG1wX2J1Zl9icHAgLSAx
MCk7CgpTbyB0aGlzIHN1YnRyYWN0aW9uIDEwIGlzIGNvcnJlY3Q/CgpSZWdhcmRzLApDaHVuLUt1
YW5nLgoKPgo+ICAgICAgICAgaWYgKGRzaS0+bW9kZV9mbGFncyAmIE1JUElfRFNJX01PREVfVklE
RU9fU1lOQ19QVUxTRSkKPiAtICAgICAgICAgICAgICAgaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0
ZSA9Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgKHZtLT5oYmFja19wb3JjaCAqIGRzaV90bXBf
YnVmX2JwcCAtIDEwKTsKPiArICAgICAgICAgICAgICAgaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0
ZSA9IHZtLT5oYmFja19wb3JjaCAqIGRzaV90bXBfYnVmX2JwcDsKPiAgICAgICAgIGVsc2UKPiAt
ICAgICAgICAgICAgICAgaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0ZSA9ICgodm0tPmhiYWNrX3Bv
cmNoICsgdm0tPmhzeW5jX2xlbikgKgo+IC0gICAgICAgICAgICAgICAgICAgICAgIGRzaV90bXBf
YnVmX2JwcCAtIDEwKTsKPiArICAgICAgICAgICAgICAgaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0
ZSA9ICh2bS0+aGJhY2tfcG9yY2ggKyB2bS0+aHN5bmNfbGVuKSAqCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkc2lfdG1wX2J1Zl9icHA7Cj4KPiAgICAgICAg
IGRhdGFfcGh5X2N5Y2xlcyA9IHRpbWluZy0+bHB4ICsgdGltaW5nLT5kYV9oc19wcmVwYXJlICsK
PiAtICAgICAgICAgICAgICAgICAgICAgICAgIHRpbWluZy0+ZGFfaHNfemVybyArIHRpbWluZy0+
ZGFfaHNfZXhpdCArIDM7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICB0aW1pbmctPmRhX2hz
X3plcm8gKyB0aW1pbmctPmRhX2hzX2V4aXQ7Cj4KPiAgICAgICAgIGlmIChkc2ktPm1vZGVfZmxh
Z3MgJiBNSVBJX0RTSV9NT0RFX1ZJREVPX0JVUlNUKSB7Cj4gICAgICAgICAgICAgICAgIGlmICgo
dm0tPmhmcm9udF9wb3JjaCArIHZtLT5oYmFja19wb3JjaCkgKiBkc2lfdG1wX2J1Zl9icHAgPgo+
IC0tCj4gMi4xMi41Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
