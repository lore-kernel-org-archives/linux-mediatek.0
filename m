Return-Path: <SRS0=Dmy6=IF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0697FC433DB
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Mar 2021 00:29:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A3A4650AD
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Mar 2021 00:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A3A4650AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Mvnc/K27a01ODpcHxoXtF4suV5WfccFnNPTpO1168Wg=; b=ItsLrpEkIzsKvxTdYmwcBSnHc
	Wt7sNvPmu+LeNEyktKwXLfOUrPTA/mRiQeqtfbbY1sNANYViTN3EABXybkZqCas4FXj0VN9OVmt2N
	LQNeftcjNeKfzav97GuAO6AVz192tm7p8VMyRs9Muy6+/StWCjAkov5Crej2V5pfWHK9TziSuEubq
	wIXEbD4J+UqQbFEvFOFF6C9xpxLC9/+e/AwuykwPHQfxuTTV5KNxXK08VBnywK2i4n7z5dQdL6aa6
	sCSTzEy27YecYKTxBT0oS6WLZhn8bbBppoEtekqkls5M2rdiqrZUK03BNPPMEaH+4LI3zEDsBHy0P
	cXHjXxfqA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIhIU-006LBZ-PN; Sun, 07 Mar 2021 00:29:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIhIJ-006L6Q-Gm; Sun, 07 Mar 2021 00:29:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 186DD650D7;
 Sun,  7 Mar 2021 00:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615076952;
 bh=Qm+1G7d1VFcN2FM2tw3fh8YNKthWT/QzzdjeOnpB8Gg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fYMeKBDefy8adzWFmPEVaCn9JjNP53bOH8lHJtoCNmiKoEiooKcRTceDmFXuwjs1H
 f1YukAC8x1Rt14Om2H8zVYovJtx0BCrz6K6phb2GVda1KqSLxforFLIKHW+yvK/DOZ
 4G9rrhLHxzxMUgHaVURus2sn8WS4GdLN9eQaM5L+iXdIMUElIJlKbLCWlNkOTPXDvo
 5s6gdqfNmTg4KSMs9G/MmI1Z3pvAiFSqnp1QmcVz+pDrLwq3qYCvo6u3v9Q34UHoqN
 t63GfZXovqK7rhmkuLCuxJFHg1YbO6AwHdauu+eRCuILFKW2giOIzdf8WV4C9bOrQ1
 HhOzh8lUyb+bA==
Received: by mail-ej1-f42.google.com with SMTP id mj10so12375095ejb.5;
 Sat, 06 Mar 2021 16:29:12 -0800 (PST)
X-Gm-Message-State: AOAM533Pmb02OAXpYRUSRSXGGL1GkvqnE2LjlVVkRaaJV2mhoWZz9qlw
 aaTMdAx3Xizbm/ChXdE6u9S2KcJis3j5ZJATiw==
X-Google-Smtp-Source: ABdhPJx86dxHMYU804TmHhrl6hB/nQz8DTF31DqqLkgoli8x+pMuP9LbNuzOW5+hFr6RSCcgkkx4FdK+v0a/8wRS+bw=
X-Received: by 2002:a17:906:b102:: with SMTP id
 u2mr8671789ejy.303.1615076950598; 
 Sat, 06 Mar 2021 16:29:10 -0800 (PST)
MIME-Version: 1.0
References: <20210201033603.12616-1-jitao.shi@mediatek.com>
 <20210201033603.12616-2-jitao.shi@mediatek.com>
In-Reply-To: <20210201033603.12616-2-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 7 Mar 2021 08:28:59 +0800
X-Gmail-Original-Message-ID: <CAAOTY_99y=wqdspKbcx_kyRRQhzDtPvjrAdn4jzeyhADjnhZgw@mail.gmail.com>
Message-ID: <CAAOTY_99y=wqdspKbcx_kyRRQhzDtPvjrAdn4jzeyhADjnhZgw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/mediatek: dsi: Fix EoTp flag
To: Jitao Shi <jitao.shi@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, huijuan.xie@mediatek.com,
 stonea168@163.com, cawa.cheng@mediatek.com, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 yingjoe.chen@mediatek.com, 
 eddie.huang@mediatek.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210307_002916_609145_AA2B3159 
X-CRM114-Status: GOOD (  16.55  )
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
tDLmnIgx5pelIOmAseS4gCDkuIrljYgxMTozNuWvq+mBk++8mgo+Cj4gU29DIHdpbGwgdHJhbnNt
aXQgdGhlIEVvVHAgKEVuZCBvZiBUcmFuc21pc3Npb24gcGFja2V0KSB3aGVuCj4gTUlQSV9EU0lf
TU9ERV9FT1RfUEFDS0VUIGZsYWcgaXMgc2V0LgoKSSd2ZSBtb2RpZmllZCB0aGUgdGl0bGUgYW5k
IG1lc3NhZ2UgYXM6Cgpkcm0vbWVkaWF0ZWs6IGRzaTogVXNlIHN5bWJvbGl6ZWQgcmVnaXN0ZXIg
ZGVmaW5pdGlvbgoKRm9yIEhTVFhfQ0tMUF9FTiBhbmQgRElTX0VPVCwgdXNlIHN5bWJvbGl6ZWQg
cmVnaXN0ZXIKZGVmaW5pdGlvbiBpbnN0ZWFkIG9mIG1hZ2ljIG51bWJlci4KCgpBbmQgYXBwbGll
ZCB0byBtZWRpYXRlay1kcm0tbmV4dCBbMV0sIHRoYW5rcy4KCmh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLz9o
PW1lZGlhdGVrLWRybS1uZXh0CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKCj4KPiBTaWduZWQtb2Zm
LWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCA3ICsrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kc2kuYwo+IGluZGV4IDY1ZmQ5OWM1MjhhZi4uMmJjNDZmMjM1MGYxIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gQEAgLTQwMSw4ICs0MDEsMTEgQEAgc3RhdGljIHZvaWQg
bXRrX2RzaV9yeHR4X2NvbnRyb2woc3RydWN0IG10a19kc2kgKmRzaSkKPiAgICAgICAgICAgICAg
ICAgYnJlYWs7Cj4gICAgICAgICB9Cj4KPiAtICAgICAgIHRtcF9yZWcgfD0gKGRzaS0+bW9kZV9m
bGFncyAmIE1JUElfRFNJX0NMT0NLX05PTl9DT05USU5VT1VTKSA8PCA2Owo+IC0gICAgICAgdG1w
X3JlZyB8PSAoZHNpLT5tb2RlX2ZsYWdzICYgTUlQSV9EU0lfTU9ERV9FT1RfUEFDS0VUKSA+PiAz
Owo+ICsgICAgICAgaWYgKGRzaS0+bW9kZV9mbGFncyAmIE1JUElfRFNJX0NMT0NLX05PTl9DT05U
SU5VT1VTKQo+ICsgICAgICAgICAgICAgICB0bXBfcmVnIHw9IEhTVFhfQ0tMUF9FTjsKPiArCj4g
KyAgICAgICBpZiAoIShkc2ktPm1vZGVfZmxhZ3MgJiBNSVBJX0RTSV9NT0RFX0VPVF9QQUNLRVQp
KQo+ICsgICAgICAgICAgICAgICB0bXBfcmVnIHw9IERJU19FT1Q7Cj4KPiAgICAgICAgIHdyaXRl
bCh0bXBfcmVnLCBkc2ktPnJlZ3MgKyBEU0lfVFhSWF9DVFJMKTsKPiAgfQo+IC0tCj4gMi4xMi41
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
