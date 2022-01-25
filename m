Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379B8C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 16:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xJ85iNtaZcui99YvMU5VKCUAe2zd5xdwmwjPag6oi88=; b=1ixpdgtkIm62RC
	kN4bvHC8/SUZOYUltFIcvbQERbZAKiEGpR6S8I+Qe9TU0nUIn+VTQVpDdIhNzVsCu6Qn69pYF1JVB
	mtC65B8em9QJROU17RJ2vub3fvHcl84wzXQhg5JumXv6LfIpt1zUnz7tjLbF55vclUyfBYhiOAubP
	VqXH6+lzJwRWU056+9v/JnWlm2hSng2t1jJyU67C7ZhAErHNbScC/hUxnFI+TcbvTnGGG5E6ofk1L
	PPTBpxnvAyNlonb14PsTbQT2kT4sdsuTUfQzhKLH7YSzfsLlz7rKCY0olvQkcKK0oc6DbIItkIZM6
	1vUR0KPmji7dBtiuiQ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCOpa-008iBh-4P; Tue, 25 Jan 2022 16:38:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCOpJ-008i66-0U; Tue, 25 Jan 2022 16:37:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7FCEF61783;
 Tue, 25 Jan 2022 16:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8DE1C36AE2;
 Tue, 25 Jan 2022 16:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643128668;
 bh=0SbnCeCphRYqlsxXfeUWz/qWyG7bTyCBGzOjbuAH5Dc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=a2+BlBCqxNtZsHEVJ/XadX8YqxFCaaIgvUhhoV3LrmgKcnsjExEDDMm1dXnw9R8yd
 PJoUN4/cxbnMqJWAe7rTifcEWosfGpe+Zh5uCqs+DYkWNTDq2i/kcdN8VY6dhAYPgw
 cPCBPUYifxHb02J73Ongl3OuYsseuwTlurAyjIyWahf99M5ZJ5ySuFt3Sh3IMubhTd
 dKc/8wr00ziqjy6TZ0BoksBLQAdjEmyz7/4PyoHCH3GOUXoCNCgsJOb6n2muQxq/vI
 mhRADqGeCpqTLoWUbO26qrduVtqFwz/vqfg24caLP/b3H0iDMYqOX79K7YBmQURdFO
 Jw1NB+/sgF0gQ==
Received: by mail-ej1-f52.google.com with SMTP id k25so31469688ejp.5;
 Tue, 25 Jan 2022 08:37:47 -0800 (PST)
X-Gm-Message-State: AOAM533N2tzdFxtqLBbdPkkIeAt5jgAwSK9KAWxf0Pd6aGwoU4KKSSnz
 2HfHXeDZZ9r87R92c2Z8RLnYQw2vKoqfz9btlg==
X-Google-Smtp-Source: ABdhPJxyyAYvHJMTL8SDODd9IBTgr3px6W8UcKYtqPJCptQLpuAelZlyNXECnWKkBdpovGOEJAhz1LMK0H+6WpZ6lAM=
X-Received: by 2002:a17:906:6c1:: with SMTP id
 v1mr16523116ejb.638.1643128666268; 
 Tue, 25 Jan 2022 08:37:46 -0800 (PST)
MIME-Version: 1.0
References: <20220118133759.112458-1-angelogioacchino.delregno@collabora.com>
 <20220118133759.112458-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220118133759.112458-2-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 26 Jan 2022 00:37:35 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9PTK1HoHruvX_6n010aADA5_Rd72TFTMsn4hrH8dts=A@mail.gmail.com>
Message-ID: <CAAOTY_9PTK1HoHruvX_6n010aADA5_Rd72TFTMsn4hrH8dts=A@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm: mediatek: mtk_drm_crtc: Use kmalloc in
 mtk_drm_crtc_duplicate_state
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 Collabora Kernel ML <kernel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_083749_154903_D8AD36ED 
X-CRM114-Status: GOOD (  18.76  )
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

SGksIEFuZ2Vsb0dpb2FjY2hpbm86CgpBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxv
Z2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPiDmlrwKMjAyMuW5tDHmnIgxOOaXpSDp
gLHkuowg5LiL5Y2IOTo0MeWvq+mBk++8mgo+Cj4gT3B0aW1pemUgbXRrX2RybV9jcnRjX2R1cGxp
Y2F0ZV9zdGF0ZSgpIGJ5IHN3aXRjaGluZyBmcm9tIGt6YWxsb2MoKSB0bwo+IGttYWxsb2MoKTog
dGhlIG9ubHkgdmFyaWFibGUgb2YgdGhpcyBzdHJ1Y3QgdGhhdCBnZXRzIGNoZWNrZWQgaW4gb3Ro
ZXIKPiBmdW5jdGlvbnMgaXMgYHBlbmRpbmdfY29uZmlnYCwgYnV0IGlmIHRoYXQncyBzZXQgdG8g
ZmFsc2UsIHRoZW4gYWxsIG9mCj4gdGhlIHJlbWFpbmluZyB2YXJpYWJsZXMgd2lsbCBvbmx5IGV2
ZXIgYmUgc2V0LCBidXQgbm90IHJlYWQgLSBzbywgYWxzbwo+IHNldCBgcGVuZGluZ19jb25maWdg
IHRvIGZhbHNlLgo+IFRoaXMgc2F2ZXMgdXMgc29tZSBzbWFsbCBvdmVyaGVhZC4KClJldmlld2Vk
LWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4KPiBTaWduZWQt
b2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxy
ZWdub0Bjb2xsYWJvcmEuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9jcnRjLmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jCj4g
aW5kZXggMDlmYzlhZDAyYzdhLi5mNTM2YTBhOTI3ZTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fY3J0Yy5jCj4gQEAgLTE4NSw3ICsxODUsNyBAQCBzdGF0aWMgc3RydWN0
IGRybV9jcnRjX3N0YXRlICptdGtfZHJtX2NydGNfZHVwbGljYXRlX3N0YXRlKHN0cnVjdCBkcm1f
Y3J0YyAqY3J0Ywo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgbXRrX2NydGNfc3RhdGUgKnN0YXRlOwo+
Cj4gLSAgICAgICBzdGF0ZSA9IGt6YWxsb2Moc2l6ZW9mKCpzdGF0ZSksIEdGUF9LRVJORUwpOwo+
ICsgICAgICAgc3RhdGUgPSBrbWFsbG9jKHNpemVvZigqc3RhdGUpLCBHRlBfS0VSTkVMKTsKPiAg
ICAgICAgIGlmICghc3RhdGUpCj4gICAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+Cj4gQEAg
LTE5Myw2ICsxOTMsNyBAQCBzdGF0aWMgc3RydWN0IGRybV9jcnRjX3N0YXRlICptdGtfZHJtX2Ny
dGNfZHVwbGljYXRlX3N0YXRlKHN0cnVjdCBkcm1fY3J0YyAqY3J0Ywo+Cj4gICAgICAgICBXQVJO
X09OKHN0YXRlLT5iYXNlLmNydGMgIT0gY3J0Yyk7Cj4gICAgICAgICBzdGF0ZS0+YmFzZS5jcnRj
ID0gY3J0YzsKPiArICAgICAgIHN0YXRlLT5wZW5kaW5nX2NvbmZpZyA9IGZhbHNlOwo+Cj4gICAg
ICAgICByZXR1cm4gJnN0YXRlLT5iYXNlOwo+ICB9Cj4gLS0KPiAyLjMzLjEKPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFp
bGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
