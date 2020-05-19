Return-Path: <SRS0=0J5R=7B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB22C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2020 15:13:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1284207FB
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2020 15:13:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pCEGqjgi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jpt+oYEr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1284207FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6IDO4H+Dv04z3EEFWuo9JvTdkKvvWTWt99llyYYAYhk=; b=pCEGqjgiRcXl60
	YO+8Lvm4/Nr/n1dJbLfC1KctwQJq/8kY1RQ92BbBXs+vZWUN+EqvywOgDIJADTmwXrMEh36ZV9i/y
	GPPECumcVrlUP53QemkFtqtgTC4f2TMNVwxnw2X1wcpuLsJ+023oA2TBJ6+gek7gXfRT42cjUfECv
	75L4x/nDIQXXtUyUJAScBFwRlX03LfVXrV6BWRgFjnbxb0hbWSTtKjpb0NZAc8RME09YZ+y10lewU
	G67RH2x08cDrUmwwpG2hAu3VNZZjQ6vdiK6hLX1rkciyRJ+S0qPBJlmmjJbS9RwDFLaeDnZ8YvesP
	iu+QaMAeB3gasZu3Jadg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jb3vb-0000sy-5c; Tue, 19 May 2020 15:13:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb3vQ-0000jD-Fe; Tue, 19 May 2020 15:13:01 +0000
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DB7AB20849;
 Tue, 19 May 2020 15:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589901180;
 bh=Qtbu//gwpsRgyyl9L3XkraCEI0EULn3K3RbouB9xCeQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jpt+oYEr/qLu8YKDUQL8P9cwVuslDQk/015dkdkhmsDRvEfaZtFD4uA1yKlYIYne8
 y47NLk9GyDnv+rTz3Jeuatg8RFxszmBvD4CUBHFaLvXDWHBGCz6HCGmaM6g1RiVCJp
 2AeoGrgrAa+hzL2tngLpK22kKiZ60Pq1WRzfandA=
Received: by mail-ed1-f43.google.com with SMTP id h16so11783985eds.5;
 Tue, 19 May 2020 08:12:59 -0700 (PDT)
X-Gm-Message-State: AOAM532bO8zdjdQyKr7tD8klN7UdqAvdpx+/ui32MW2Fb4+fhse69Zhv
 u8nsOIYlsBk5wYbkoGT3JRV1CXb+DlER4Aqg1g==
X-Google-Smtp-Source: ABdhPJyFxb862sEE7yUUw8vzjALBePQs+s7LW5KIAbQcfYVO9A/nJbgo93p98Hnk05Kl1tbTOxD4nL6FFB/3FC4K5Eo=
X-Received: by 2002:a50:e1c5:: with SMTP id m5mr12614504edl.47.1589901178288; 
 Tue, 19 May 2020 08:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200519094045.2447940-1-enric.balletbo@collabora.com>
In-Reply-To: <20200519094045.2447940-1-enric.balletbo@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 19 May 2020 23:12:46 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-m67cCrrgb=Ot9gnj22Ks3qDCDFQhELMA=m0xSB9mwWQ@mail.gmail.com>
Message-ID: <CAAOTY_-m67cCrrgb=Ot9gnj22Ks3qDCDFQhELMA=m0xSB9mwWQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_mt8173_hdmi_phy: Remove unnused const
 variables
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_081300_557089_B45DC198 
X-CRM114-Status: GOOD (  12.50  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFi
b3JhLmNvbT4g5pa8IDIwMjDlubQ15pyIMTnml6Ug6YCx5LqMIOS4i+WNiDU6NDDlr6vpgZPvvJoK
Pgo+IFRoZXJlIGFyZSBzb21lIGBzdGF0aWMgY29uc3QgdThgIHZhcmlhYmxlcyB0aGF0IGFyZSBu
b3QgdXNlZCwgdGhpcwo+IHRyaWdnZXJzIGEgd2FybmluZyBidWlsZGluZyB3aXRoIGBtYWtlIFc9
MWAsIGl0IGlzIHNhZmUgdG8gcmVtb3ZlIHRoZW0sCj4gc28gZG8gaXQgYW5kIG1ha2UgdGhlIGNv
bXBpbGVyIG1vcmUgaGFwcHkuCj4KClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3Vh
bmcuaHVAa2VybmVsLm9yZz4KCj4gU2lnbmVkLW9mZi1ieTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJy
YSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4KPiAtLS0KPgo+ICAuLi4vZ3B1L2RybS9t
ZWRpYXRlay9tdGtfbXQ4MTczX2hkbWlfcGh5LmMgICAgfCA0OCAtLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA0OCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210ODE3M19oZG1pX3BoeS5jIGIvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19tdDgxNzNfaGRtaV9waHkuYwo+IGluZGV4IDFjMzU3NTM3MjIzMC4u
ODI3YjkzNzg2ZmFjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
bXQ4MTczX2hkbWlfcGh5LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210
ODE3M19oZG1pX3BoeS5jCj4gQEAgLTEwNyw1NCArMTA3LDYgQEAKPiAgI2RlZmluZSBSR1NfSERN
SVRYXzVUMV9FREcgICAgICAgICAgICAgKDB4ZiA8PCA0KQo+ICAjZGVmaW5lIFJHU19IRE1JVFhf
UExVR19UU1QgICAgICAgICAgICBCSVQoMCkKPgo+IC1zdGF0aWMgY29uc3QgdTggUFJFRElWWzNd
WzRdID0gewo+IC0gICAgICAgezB4MCwgMHgwLCAweDAsIDB4MH0sICAgLyogMjdNaHogKi8KPiAt
ICAgICAgIHsweDEsIDB4MSwgMHgxLCAweDF9LCAgIC8qIDc0TWh6ICovCj4gLSAgICAgICB7MHgx
LCAweDEsIDB4MSwgMHgxfSAgICAvKiAxNDhNaHogKi8KPiAtfTsKPiAtCj4gLXN0YXRpYyBjb25z
dCB1OCBUWERJVlszXVs0XSA9IHsKPiAtICAgICAgIHsweDMsIDB4MywgMHgzLCAweDJ9LCAgIC8q
IDI3TWh6ICovCj4gLSAgICAgICB7MHgyLCAweDEsIDB4MSwgMHgxfSwgICAvKiA3NE1oeiAqLwo+
IC0gICAgICAgezB4MSwgMHgwLCAweDAsIDB4MH0gICAgLyogMTQ4TWh6ICovCj4gLX07Cj4gLQo+
IC1zdGF0aWMgY29uc3QgdTggRkJLU0VMWzNdWzRdID0gewo+IC0gICAgICAgezB4MSwgMHgxLCAw
eDEsIDB4MX0sICAgLyogMjdNaHogKi8KPiAtICAgICAgIHsweDEsIDB4MCwgMHgxLCAweDF9LCAg
IC8qIDc0TWh6ICovCj4gLSAgICAgICB7MHgxLCAweDAsIDB4MSwgMHgxfSAgICAvKiAxNDhNaHog
Ki8KPiAtfTsKPiAtCj4gLXN0YXRpYyBjb25zdCB1OCBGQktESVZbM11bNF0gPSB7Cj4gLSAgICAg
ICB7MTksIDI0LCAyOSwgMTl9LCAgICAgICAvKiAyN01oeiAqLwo+IC0gICAgICAgezE5LCAyNCwg
MTQsIDE5fSwgICAgICAgLyogNzRNaHogKi8KPiAtICAgICAgIHsxOSwgMjQsIDE0LCAxOX0gICAg
ICAgIC8qIDE0OE1oeiAqLwo+IC19Owo+IC0KPiAtc3RhdGljIGNvbnN0IHU4IERJVkVOWzNdWzRd
ID0gewo+IC0gICAgICAgezB4MiwgMHgxLCAweDEsIDB4Mn0sICAgLyogMjdNaHogKi8KPiAtICAg
ICAgIHsweDIsIDB4MiwgMHgyLCAweDJ9LCAgIC8qIDc0TWh6ICovCj4gLSAgICAgICB7MHgyLCAw
eDIsIDB4MiwgMHgyfSAgICAvKiAxNDhNaHogKi8KPiAtfTsKPiAtCj4gLXN0YXRpYyBjb25zdCB1
OCBIVFBMTEJQWzNdWzRdID0gewo+IC0gICAgICAgezB4YywgMHhjLCAweDgsIDB4Y30sICAgLyog
MjdNaHogKi8KPiAtICAgICAgIHsweGMsIDB4ZiwgMHhmLCAweGN9LCAgIC8qIDc0TWh6ICovCj4g
LSAgICAgICB7MHhjLCAweGYsIDB4ZiwgMHhjfSAgICAvKiAxNDhNaHogKi8KPiAtfTsKPiAtCj4g
LXN0YXRpYyBjb25zdCB1OCBIVFBMTEJDWzNdWzRdID0gewo+IC0gICAgICAgezB4MiwgMHgzLCAw
eDMsIDB4Mn0sICAgLyogMjdNaHogKi8KPiAtICAgICAgIHsweDIsIDB4MywgMHgzLCAweDJ9LCAg
IC8qIDc0TWh6ICovCj4gLSAgICAgICB7MHgyLCAweDMsIDB4MywgMHgyfSAgICAvKiAxNDhNaHog
Ki8KPiAtfTsKPiAtCj4gLXN0YXRpYyBjb25zdCB1OCBIVFBMTEJSWzNdWzRdID0gewo+IC0gICAg
ICAgezB4MSwgMHgxLCAweDAsIDB4MX0sICAgLyogMjdNaHogKi8KPiAtICAgICAgIHsweDEsIDB4
MiwgMHgyLCAweDF9LCAgIC8qIDc0TWh6ICovCj4gLSAgICAgICB7MHgxLCAweDIsIDB4MiwgMHgx
fSAgICAvKiAxNDhNaHogKi8KPiAtfTsKPiAtCj4gIHN0YXRpYyBpbnQgbXRrX2hkbWlfcGxsX3By
ZXBhcmUoc3RydWN0IGNsa19odyAqaHcpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBtdGtfaGRtaV9w
aHkgKmhkbWlfcGh5ID0gdG9fbXRrX2hkbWlfcGh5KGh3KTsKPiAtLQo+IDIuMjYuMgo+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
