Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE3DC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 15:44:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AB8B20738
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 15:44:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IwXGPCU7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="02f2nq1T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AB8B20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xRU43KZWwhzgNodbL4s89SPvz3qonIcHhgmVZhh6TKY=; b=IwXGPCU7BJwQk5tEWnpfL6iMU
	SOObxOebzVFKSE1wn1YWWY1Qkykv/zpasS1VPnmOu+avVa3PYjWsOloSb7/nLwidkX8lUXV6nphMO
	Oo1+tzfKQaN8orL2sMq4pfDsVrh9FYiCTaAiRlXm/A4hemHFRBX2Jo0VnS37llm8h7cQLDs9HS6aa
	Kp35OsoBvpUEo6J39SVtQZlucAG+fqHM3QjDFGt3XJAytPN26TmDa2RlSntg8QsE7qB4o9+Vun175
	sptFtmoy/Ua5qBdxObgQQ6N26Q7kWPv2xcgvmER5hd/CUCbR13zDDVEBPOrX6CkA1rPXgZ/FAHGw/
	PhLrHGBJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsplK-0001xM-1l; Tue, 07 Jul 2020 15:44:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsplH-0001wf-Ca
 for linux-mediatek@lists.infradead.org; Tue, 07 Jul 2020 15:44:00 +0000
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8165A207DF
 for <linux-mediatek@lists.infradead.org>; Tue,  7 Jul 2020 15:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594136638;
 bh=tkn4NlQVOLAk5KZbJigJqGpfKJwjOJ8SNc8IkCbR+Dk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=02f2nq1TD02EjCllQACMbAYlzzCl2AEEgLDm6S8QwvzzTyZFlD1MH/32n4ll78mnX
 2MicAVcqjCwzpbMND4tyQ58JtyKF9l6YRQaZlvQ6MfnUbBsUIhywPLupP5zxaDRiwI
 +fu75lxR932kl8ESezuRN21efUJE8z5ub0T4P024=
Received: by mail-ej1-f53.google.com with SMTP id o18so42616732eje.7
 for <linux-mediatek@lists.infradead.org>; Tue, 07 Jul 2020 08:43:58 -0700 (PDT)
X-Gm-Message-State: AOAM530amL9Etmpr2e2XfYp5lCI4QXSNbZgUDLmRqT2eugz+zzPWQvzB
 m294m7z8U5hl24DOraAOaW5qk+dFOa2dJ3NynA==
X-Google-Smtp-Source: ABdhPJy0vJeuoK0xQfh+uPUTYL0crelToPxcOJUKuQQy42Kahj+1FocmJlfddSjWmifyTDyiJQ00ADpPWaCkJT5NL+M=
X-Received: by 2002:a17:906:9354:: with SMTP id
 p20mr11919ejw.187.1594136636992; 
 Tue, 07 Jul 2020 08:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200707153944.604-1-chunkuang.hu@kernel.org>
In-Reply-To: <20200707153944.604-1-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 7 Jul 2020 23:43:46 +0800
X-Gmail-Original-Message-ID: <CAAOTY__BqCm67p1ywKqJsR3NfZb7QbVYVg9f2cLaURHPMaQTCg@mail.gmail.com>
Message-ID: <CAAOTY__BqCm67p1ywKqJsR3NfZb7QbVYVg9f2cLaURHPMaQTCg@mail.gmail.com>
Subject: Re: [GIT PULL] mediatek drm fixes for 5.8
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_114359_592446_E2CCCCD7 
X-CRM114-Status: GOOD (  15.32  )
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
Cc: David Airlie <airlied@linux.ie>, Bernard Zhao <bernard@vivo.com>,
 YueHaibing <yuehaibing@huawei.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIERhbmllbDoKCkNodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPiDmlrwg
MjAyMOW5tDfmnIg35pelIOmAseS6jCDkuIvljYgxMTozOeWvq+mBk++8mgo+Cj4gSGksIERhdmUg
JiBEYXZpZDoKClNvcnJ5IGZvciB5b3VyIG5hbWUuCgo+Cj4gVGhpcyBpbmNsdWRlIGZpeHVwIGZv
ciBjbWRxLCBtbXN5cywgdmlzaWJpbGl0eSBjaGVja2luZyBhbmQgc29tZSByZWZpbmVtZW50Lgo+
Cj4gUmVnYXJkcywKPiBDaHVuLUt1YW5nLgo+Cj4KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2lu
Y2UgY29tbWl0IGIzYTllM2I5NjIyYWUxMDA2NDgyNmRjY2I0ZjdhNTJiZDg4Yzc0MDc6Cj4KPiAg
IExpbnV4IDUuOC1yYzEgKDIwMjAtMDYtMTQgMTI6NDU6MDQgLTA3MDApCj4KPiBhcmUgYXZhaWxh
YmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPgo+ICAgaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdCB0YWdzL21l
ZGlhdGVrLWRybS1maXhlcy01LjgKPgo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA1
YWI1NDZmNWU2MzA5MzczYWVmMDFhOGQzOThlMTYzYWI3YTc4NDMxOgo+Cj4gICBkcm0vbWVkaWF0
ZWs6IG10a19oZG1pOiBSZW1vdmUgZGVidWcgbWVzc2FnZXMgZm9yIGZ1bmN0aW9uIGNhbGxzICgy
MDIwLTA3LTA1IDA2OjM5OjIxICswODAwKQo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IE1lZGlhdGVrIERSTSBGaXhl
cyBmb3IgTGludXggNS44Cj4KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gQmVybmFyZCBaaGFvICgxKToKPiAgICAgICBk
cm0vbWVkaWF0ZWs6IFJlbW92ZSB1bm5lY2Vzc2FyeSBjb252ZXJzaW9uIHRvIGJvb2wKPgo+IEVu
cmljIEJhbGxldGJvIGkgU2VycmEgKDMpOgo+ICAgICAgIGRybS9tZWRpYXRlazogUmVtb3ZlIGRl
YnVnIG1lc3NhZ2VzIGZvciBmdW5jdGlvbiBjYWxscwo+ICAgICAgIGRybS9tZWRpYXRlazogbXRr
X210ODE3M19oZG1pX3BoeTogUmVtb3ZlIHVubnVzZWQgY29uc3QgdmFyaWFibGVzCj4gICAgICAg
ZHJtL21lZGlhdGVrOiBtdGtfaGRtaTogUmVtb3ZlIGRlYnVnIG1lc3NhZ2VzIGZvciBmdW5jdGlv
biBjYWxscwo+Cj4gSHNpbi1ZaSBXYW5nICgyKToKPiAgICAgICBkcm0vbWVkaWF0ZWs6IEZpeCBk
ZXZpY2UgcGFzc2VkIHRvIGNtZHEKPiAgICAgICBkcm0vbWVkaWF0ZWs6IENoZWNrIHBsYW5lIHZp
c2liaWxpdHkgaW4gYXRvbWljX3VwZGF0ZQo+Cj4gTWF0dGhpYXMgQnJ1Z2dlciAoMSk6Cj4gICAg
ICAgZHJtL21lZGlhdGVrOiBEZWxldGUgbm90IHVzZWQgb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRh
Cj4KPiBZdWVIYWliaW5nICgxKToKPiAgICAgICBkcm0vbWVkaWF0ZWs6IEZpeCBLY29uZmlnIHdh
cm5pbmcKPgo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2NvbmZpZyAgICAgICAgICAgICAg
IHwgIDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jICAgICAg
ICB8ICA4ICstLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgICAg
ICAgICB8ICA2ICstLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5j
ICAgICAgIHwgMjUgKysrKysrKystLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RzaS5jICAgICAgICAgICAgIHwgIDUgKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfaGRtaS5jICAgICAgICAgICAgfCAxMiArLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19tdDgxNzNfaGRtaV9waHkuYyB8IDUyIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gIDcgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgODggZGVsZXRpb25zKC0pCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2
ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
