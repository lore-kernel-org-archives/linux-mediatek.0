Return-Path: <SRS0=bt65=BM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D594C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Aug 2020 00:09:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD190207BB
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Aug 2020 00:09:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="w3xazvr/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="auSXa5Kl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD190207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZUZfN8vrOacg71D+Jaa76SgXGVJrkDw59FeaP0aveq4=; b=w3xazvr/mHPOmeD+v8iMqSsSF
	GsZpce1d6vyvzugqyQY/ZiXiQJbSfXRm9CMpap8IF6t1qYyna1d6TWEN/f0ub48e7Oe8ScOHf9m1X
	3wbWFQZJDU6y6sWloZx8jURs+ii3qdpx+XmzdmkZQuNLOq7hr5psiKhZLCbLMP0nSWYCJyOaLO7Zz
	bGCcQhAxeFd6XuvbSLBJND/MmNyqOEkWyE8hnDeFmtATjBeo7ceUE3PozYjIkXHUrY9tIreAZfjOD
	W3z+RuE+rEBDc1Km/FhNnCwwxPpDq9MAWE8HzZ5Z5bfROUuWUkpOvqs4p6KTatVQUtfGNmjiTDZL7
	117mzqWwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k21Yk-0005lC-TN; Sun, 02 Aug 2020 00:09:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k21Yh-0005kO-6v; Sun, 02 Aug 2020 00:09:00 +0000
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 28C73208E4;
 Sun,  2 Aug 2020 00:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596326938;
 bh=oCx/GR0RX1huNTjbv/4QOj0BuphlW+WSIv710+yID1o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=auSXa5Kl4kZmf41UMcsHVRiDTL85kbbPlpxVkVFQ7kWooytCoMrwGXLSHsoRDdwJv
 xF/3YFiTpEPCuGF/rFnjd68Phkka9RwUgLkY0C5OL8mSPZFJdulDE16Q4HL+mBKiQZ
 2aWsNLP3xq0tkonqfRAa1bYYq38KoR6z2FFtMzIc=
Received: by mail-ed1-f45.google.com with SMTP id i26so21490139edv.4;
 Sat, 01 Aug 2020 17:08:58 -0700 (PDT)
X-Gm-Message-State: AOAM5323ocomwLRjo8hKFvwGeiz/xUfsiZF/ffS4kgXsB9Y1hekLg8NB
 ysuvu0z8xMIsdC01QFhaThKr1da8a4R8tG66OQ==
X-Google-Smtp-Source: ABdhPJw+2iH5+3kHHpb6k2cVa4JH26tuia/OYDRUWLfZx9UmtxOcJ2m2snfcRquwm1ycO+1YX3mUPz/vKyDmnugHutE=
X-Received: by 2002:a05:6402:2037:: with SMTP id
 ay23mr9749512edb.48.1596326936640; 
 Sat, 01 Aug 2020 17:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200728111800.77641-1-frank-w@public-files.de>
 <20200728111800.77641-3-frank-w@public-files.de>
In-Reply-To: <20200728111800.77641-3-frank-w@public-files.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 2 Aug 2020 08:08:44 +0800
X-Gmail-Original-Message-ID: <CAAOTY__7wCeTm0OY0P1VKZp-r7+d7yj=LLb79Nzr1pVVkOjy2g@mail.gmail.com>
Message-ID: <CAAOTY__7wCeTm0OY0P1VKZp-r7+d7yj=LLb79Nzr1pVVkOjy2g@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] drm/mediatek: fix boot up for 720 and 480 but 1080
To: Frank Wunderlich <frank-w@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200801_200859_638517_C0B55CA4 
X-CRM114-Status: GOOD (  21.62  )
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
 Philipp Zabel <p.zabel@pengutronix.de>, chunhui dai <chunhui.dai@mediatek.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZyYW5rOgoKRnJhbmsgV3VuZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+IOaW
vCAyMDIw5bm0N+aciDI45pelIOmAseS6jCDkuIvljYg3OjE55a+r6YGT77yaCj4KPiBGcm9tOiBj
aHVuaHVpIGRhaSA8Y2h1bmh1aS5kYWlAbWVkaWF0ZWsuY29tPgo+Cj4gLSBkaXNhYmxlIHRtZHMg
b24gcGh5IG9uIG10MjcwMQo+IC0gc3VwcG9ydCBvdGhlciByZXNvbHV0aW9ucyBsaWtlIDEyODB4
MTAyNAoKSWYgdGhpcyBwYXRjaCBkb2VzIHR3byB0aGluZ3MsIGl0IHNob3VsZCBiZSBicm9rZW4g
aW50byB0d28gcGF0Y2hlcy4KCj4KPiB3aXRob3V0IHRoaXMgUGF0Y2ggaSBzZWUgZmxpY2tlcmlu
ZyBvbiBteSBURlQgKDEyODB4MTAyNCksCj4gc28gaSBndWVzcyBjbG9jayBpcyB3cm9uZy4KPgo+
IFNpZ25lZC1vZmYtYnk6IGNodW5odWkgZGFpIDxjaHVuaHVpLmRhaUBtZWRpYXRlay5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogRnJhbmsgV3VuZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+
Cj4gVGVzdGVkLWJ5OiBGcmFuayBXdW5kZXJsaWNoIDxmcmFuay13QHB1YmxpYy1maWxlcy5kZT4K
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pX3BoeS5jICAgICAgICB8
IDMgKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9waHkuaCAgICAgICAg
fCAxICsKPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19tdDI3MDFfaGRtaV9waHkuYyB8
IDEgKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9waHkuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfaGRtaV9waHkuYwo+IGluZGV4IDUyMjM0OTg1MDJjNC4uZWRhZGI3YTcw
MGYxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9waHku
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9waHkuYwo+IEBAIC0x
ODQsNiArMTg0LDkgQEAgc3RhdGljIGludCBtdGtfaGRtaV9waHlfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKPiAgICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIocGh5X3By
b3ZpZGVyKTsKPiAgICAgICAgIH0KPgo+ICsgICAgICAgaWYgKGhkbWlfcGh5LT5jb25mLT5wbGxf
ZGVmYXVsdF9vZmYpCj4gKyAgICAgICAgICAgICAgIGhkbWlfcGh5LT5jb25mLT5oZG1pX3BoeV9k
aXNhYmxlX3RtZHMoaGRtaV9waHkpOwoKSSB0aGluayBldmVyeSBwbGwgaXMgZGVmYXVsdCBvZmYs
IHNvIHlvdSBzaG91bGQgdHVybiBvbiBwbGwgcmF0aGVyCnRoYW4gZGlzYWJsZSB0bWRzLgoKUmVn
YXJkcywKQ2h1bi1LdWFuZy4KCj4gKwo+ICAgICAgICAgcmV0dXJuIG9mX2Nsa19hZGRfcHJvdmlk
ZXIoZGV2LT5vZl9ub2RlLCBvZl9jbGtfc3JjX3NpbXBsZV9nZXQsCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBoZG1pX3BoeS0+cGxsKTsKPiAgfQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfcGh5LmggYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2hkbWlfcGh5LmgKPiBpbmRleCAyZDhiMzE4MjQ3MGQuLmY0NzJmZGViNjNk
YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfcGh5LmgK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfcGh5LmgKPiBAQCAtMjIs
NiArMjIsNyBAQCBzdHJ1Y3QgbXRrX2hkbWlfcGh5Owo+ICBzdHJ1Y3QgbXRrX2hkbWlfcGh5X2Nv
bmYgewo+ICAgICAgICAgYm9vbCB0el9kaXNhYmxlZDsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcg
ZmxhZ3M7Cj4gKyAgICAgICBib29sIHBsbF9kZWZhdWx0X29mZjsKPiAgICAgICAgIGNvbnN0IHN0
cnVjdCBjbGtfb3BzICpoZG1pX3BoeV9jbGtfb3BzOwo+ICAgICAgICAgdm9pZCAoKmhkbWlfcGh5
X2VuYWJsZV90bWRzKShzdHJ1Y3QgbXRrX2hkbWlfcGh5ICpoZG1pX3BoeSk7Cj4gICAgICAgICB2
b2lkICgqaGRtaV9waHlfZGlzYWJsZV90bWRzKShzdHJ1Y3QgbXRrX2hkbWlfcGh5ICpoZG1pX3Bo
eSk7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXQyNzAxX2hk
bWlfcGh5LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210MjcwMV9oZG1pX3BoeS5j
Cj4gaW5kZXggZDNjYzQwMjJlOTg4Li42ZmJlZGFjZmMxZTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19tdDI3MDFfaGRtaV9waHkuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfbXQyNzAxX2hkbWlfcGh5LmMKPiBAQCAtMjM5LDYgKzIzOSw3
IEBAIHN0YXRpYyB2b2lkIG10a19oZG1pX3BoeV9kaXNhYmxlX3RtZHMoc3RydWN0IG10a19oZG1p
X3BoeSAqaGRtaV9waHkpCj4gIHN0cnVjdCBtdGtfaGRtaV9waHlfY29uZiBtdGtfaGRtaV9waHlf
MjcwMV9jb25mID0gewo+ICAgICAgICAgLnR6X2Rpc2FibGVkID0gdHJ1ZSwKPiAgICAgICAgIC5m
bGFncyA9IENMS19TRVRfUkFURV9HQVRFLAo+ICsgICAgICAgLnBsbF9kZWZhdWx0X29mZiA9IHRy
dWUsCj4gICAgICAgICAuaGRtaV9waHlfY2xrX29wcyA9ICZtdGtfaGRtaV9waHlfcGxsX29wcywK
PiAgICAgICAgIC5oZG1pX3BoeV9lbmFibGVfdG1kcyA9IG10a19oZG1pX3BoeV9lbmFibGVfdG1k
cywKPiAgICAgICAgIC5oZG1pX3BoeV9kaXNhYmxlX3RtZHMgPSBtdGtfaGRtaV9waHlfZGlzYWJs
ZV90bWRzLAo+IC0tCj4gMi4yNS4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
