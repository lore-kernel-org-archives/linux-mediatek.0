Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE29AC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 23:22:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE50660EE6
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 23:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE50660EE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RMiNDOyNtl1VLWtFNX9vfy2DnSDqdAPU76ntggUoHQE=; b=q0iV6gkbxDp32+
	mQ1sbiU6UUjZXDxRX8Vy2SPutUy0YZfBxX1b9XsBDe4UKd4TnIw3I3DsrVRopoq0h0yv5YSZcL92p
	J2rFqv64JIzO5HJOVPC+hC5B212Rz99aeT9wv9ddpvZ7zAosq2EREb6eUQOTuZ91ivlYojfv6fUwP
	6OBID195GnqFh1icil5fhRXsmgkYgOnqRIHBhRtNpIpU23W91tYGbhLVnrJydu22LbES8nnWRMrbl
	R1l25NYvKGcTfEI4Lh1IBEBxnIs3IffmwzwMOZ+L0yGFfC4iu79VaNZjfadmPfrIjNh+RsahECSxd
	68oMmJTx/GxUA2FJLffQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAhGC-000a8I-7p; Mon, 02 Aug 2021 23:22:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAhFy-000a3l-27; Mon, 02 Aug 2021 23:22:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89E3560F0F;
 Mon,  2 Aug 2021 23:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627946521;
 bh=3UoqdS3ZjZO9aG1FWGZpLNJXpg3edmkfj19jMqgZlag=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fZhBqZC5RN6LFgGTGAhcn9gnxLB6jXBYSgOOOb3AzHHBvQBRGi0ncfOX+8XzA3G+b
 uRWDWytkUy+fILgu0GiBK/xlCsIiOBJQ/P3aTSYFsoynHfrSRGezrzY5rQRd+d1tgd
 enAjzKNkNQdAzL+CTW3IRAwInHu8WyyFLBFFzk5EGN7hpEs6yf1f5A3PRM2jhtoJgN
 aIa3A7EByOkol74HKb3UynsYZFhIl+Ut5hDk5XNUxCSB+Oropz9drSfdJcjcK1XQiv
 X2tzH143UQee2M7iIboGmRrlKHp/F5y1/gSMFEAGvWufIPxVp2UVwvahkDHr0mtcln
 Fb4lPigquJArA==
Received: by mail-ej1-f41.google.com with SMTP id hw6so19584301ejc.10;
 Mon, 02 Aug 2021 16:22:01 -0700 (PDT)
X-Gm-Message-State: AOAM533+fUuQfxk2N4p03fMFgPVm4FJNiL/ZXeP3Bh5sxT6vyOTpUr76
 G4oXoy6Yy5lJ7eUp0O4FHNJfumvO1Wce9rSDwA==
X-Google-Smtp-Source: ABdhPJzVHbdqkXZSKJFkdObdtrHHP6P1rJNANKJM5suYmF9hkJsLk9QTqNsPcHe3pRC+2S0r6+TIODJy9UBBYIcSj/0=
X-Received: by 2002:a17:906:2451:: with SMTP id
 a17mr17629191ejb.75.1627946520087; 
 Mon, 02 Aug 2021 16:22:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210714101141.2089082-1-enric.balletbo@collabora.com>
 <20210714121116.v2.7.Idbb4727ddf00ba2fe796b630906baff10d994d89@changeid>
In-Reply-To: <20210714121116.v2.7.Idbb4727ddf00ba2fe796b630906baff10d994d89@changeid>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 3 Aug 2021 07:21:49 +0800
X-Gmail-Original-Message-ID: <CAAOTY__EA323tC+BswgTfx4EM9FF8Hf9AAkqoxuacuxQwr4SnA@mail.gmail.com>
Message-ID: <CAAOTY__EA323tC+BswgTfx4EM9FF8Hf9AAkqoxuacuxQwr4SnA@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] drm/mediatek: mtk_dsi: Reset the dsi0 hardware
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Collabora Kernel ML <kernel@collabora.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Eizan Miyamoto <eizan@chromium.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_162202_170409_54FFF33F 
X-CRM114-Status: GOOD (  19.73  )
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

SGksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFi
b3JhLmNvbT4g5pa8IDIwMjHlubQ35pyIMTTml6Ug6YCx5LiJIOS4i+WNiDY6MTLlr6vpgZPvvJoK
Pgo+IFJlc2V0IGRzaTAgSFcgdG8gZGVmYXVsdCB3aGVuIHBvd2VyIG9uLiBUaGlzIHByZXZlbnRz
IHRvIGhhdmUgZGlmZmVyZW50Cj4gc2V0dGluZ2JldHdlZW4gdGhlIGJvb3Rsb2FkZXIgYW5kIHRo
ZSBrZXJuZWwuCj4KPiBBcyBub3QgYWxsIE1lZGlhdGVrIGJvYXJkcyBoYXZlIHRoZSByZXNldCBj
b25zdW1lciBjb25maWd1cmVkIGluIHRoZWlyCj4gYm9hcmQgZGVzY3JpcHRpb24sIGFsc28gaXMg
bm90IG5lZWRlZCBvbiBhbGwgb2YgdGhlbSwgdGhlIHJlc2V0IGlzIG9wdGlvbmFsLAo+IHNvIHRo
ZSBjaGFuZ2UgaXMgY29tcGF0aWJsZSB3aXRoIGFsbCBib2FyZHMuCgpBY2tlZC1ieTogQ2h1bi1L
dWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gQ2M6IEppdGFvIFNoaSA8aml0
YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiBTdWdnZXN0ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5r
dWFuZy5odUBrZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEVucmljIEJhbGxldGJvIGkgU2Vy
cmEgPGVucmljLmJhbGxldGJvQGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4KPiAobm8gY2hhbmdlcyBz
aW5jZSB2MSkKPgo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgNSArKysr
LQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiBpbmRleCBhZTQwM2M2N2NiZDkuLmQ4YjgxZTJh
Yjg0MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+IEBAIC0xMSw2ICsxMSw3
IEBACj4gICNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9ybS5oPgo+ICAjaW5jbHVkZSA8bGludXgv
cGh5L3BoeS5oPgo+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gKyNpbmNs
dWRlIDxsaW51eC9yZXNldC5oPgo+Cj4gICNpbmNsdWRlIDx2aWRlby9taXBpX2Rpc3BsYXkuaD4K
PiAgI2luY2x1ZGUgPHZpZGVvL3ZpZGVvbW9kZS5oPgo+IEBAIC05ODAsOCArOTgxLDEwIEBAIHN0
YXRpYyBpbnQgbXRrX2RzaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAq
bWFzdGVyLCB2b2lkICpkYXRhKQo+ICAgICAgICAgc3RydWN0IG10a19kc2kgKmRzaSA9IGRldl9n
ZXRfZHJ2ZGF0YShkZXYpOwo+Cj4gICAgICAgICByZXQgPSBtdGtfZHNpX2VuY29kZXJfaW5pdChk
cm0sIGRzaSk7Cj4gKyAgICAgICBpZiAocmV0KQo+ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0
Owo+Cj4gLSAgICAgICByZXR1cm4gcmV0Owo+ICsgICAgICAgcmV0dXJuIGRldmljZV9yZXNldF9v
cHRpb25hbChkZXYpOwo+ICB9Cj4KPiAgc3RhdGljIHZvaWQgbXRrX2RzaV91bmJpbmQoc3RydWN0
IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsCj4gLS0KPiAyLjMwLjIKPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
