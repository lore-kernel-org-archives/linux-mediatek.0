Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C841C433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 23:18:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 923E76192C
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 23:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 923E76192C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Twg4fhfY6KH+NZmn+tFS/VRWoggFMRy6FriUBN7XjjA=; b=Bj7FdpgYQ0UKtCz54CsDj0XSD
	HN6fyorc1Jj8OuJ+rqqqgvF/jfEr3ST0wqq5SOyXsCagZMYDAn73hgOEBR1V/ExLs3kDgTKKemOJc
	ML8C5Ka6NfFUQ4JOVtw6bBSBIsC9maZrlOjg61Oyqg/cERIzxvftchM7pmW8JUV7MMELR/yKSpWhN
	6jyjgbnrWblVK621zBXRhzpYY7yQXgX88zymgs6Y3M3sPuf1JOjdKEoDKQL+MxnmUY1PwkkFWVWOy
	Duq893/eCuQ6ZtL/fOZh+qfC26iiRbUxQjD31l4qBGe+lBwRDxt8vlO0RvKQENIN5PfJ8tCils+7x
	rqg+4C8TA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR19A-001t9o-U2; Mon, 29 Mar 2021 23:18:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQuax-000l0l-CP
 for linux-mediatek@lists.infradead.org; Mon, 29 Mar 2021 16:18:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id ABB3661970
 for <linux-mediatek@lists.infradead.org>; Mon, 29 Mar 2021 16:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617034699;
 bh=g+KluKB8J7DldbUMXc360cZ2gLPYH64Rs8T0Q973c4I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rOdQJbEmVrohRzyR/kvIUq1DyxuS1AGnIYY291bil5RUReLZ/ova6oNK6727ph2D4
 QSr6GfH6jpbKu66U4tbssqFrHf+lEgkrQJv7yhaBTAt1qWx+JkWdTDznkr1qJ1YWcy
 GkI75ELPPDgjntv+NB2/kuYnXEKNRN+HAoRZPpJSHEPeclpvJrlFhHJ/lNCaVQHI+z
 q8x7hOV5gggLQLb+PW6cMwjOZu40snyKDYJA2ekfFvHfcBmrBmPMFgvrzhuj9HXanZ
 OS0ulcnltRdB8DgpAcl3EtIpd79yIup3Z5xklgMu+zyw30tOHbr2icTSktunZOES9T
 ErVFtoZvln4cA==
Received: by mail-ej1-f43.google.com with SMTP id kt15so20339192ejb.12
 for <linux-mediatek@lists.infradead.org>; Mon, 29 Mar 2021 09:18:18 -0700 (PDT)
X-Gm-Message-State: AOAM532I2S5Y+kWvlPtekhfHLhMUl+us9y4h/eg6JTBz7Cqrf+FpEOB7
 vLR4xU5n+3C7h+KMqUKZPY8tyLXakNQFH6zPFQ==
X-Google-Smtp-Source: ABdhPJzW5H3Lz87UAaUdYwZ6+LCv3qjBvbr2LYXfYPYVmXRCOrWSVgwuKYSAM/RT4dWSLTowm0pFAOoA7i5p2TsOxgA=
X-Received: by 2002:a17:906:7c4:: with SMTP id
 m4mr29562982ejc.63.1617034697158; 
 Mon, 29 Mar 2021 09:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210313094331.26374-1-chunkuang.hu@kernel.org>
In-Reply-To: <20210313094331.26374-1-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 30 Mar 2021 00:18:05 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-6i-D5Ou+Bme-ipvodmqU8Ybsot4yNhKgqr4G-=Ptr9A@mail.gmail.com>
Message-ID: <CAAOTY_-6i-D5Ou+Bme-ipvodmqU8Ybsot4yNhKgqr4G-=Ptr9A@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: crtc: Make config-updating atomic
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_171831_720759_05162D9F 
X-CRM114-Status: GOOD (  17.76  )
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

QXBwbGllZCB0byBtZWRpYXRlay1kcm0tbmV4dCBbMV0uCgpbMV0gaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cv
P2g9bWVkaWF0ZWstZHJtLW5leHQKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgpDaHVuLUt1YW5nIEh1
IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4g5pa8IDIwMjHlubQz5pyIMTPml6Ug6YCx5YWtIOS4
i+WNiDU6NDPlr6vpgZPvvJoKPgo+IFdoaWxlIHVwZGF0aW5nIGNvbmZpZywgdGhlIGlycSB3b3Vs
ZCBvY2N1ciBhbmQgZ2V0IHRoZSBwYXJ0aWFsCj4gY29uZmlnLCBzbyB1c2UgdmFyaWFibGUgY29u
ZmlnX3VwZGF0aW5nIHRvIG1ha2UgdXBkYXRpbmcgYXRvbWljLgo+Cj4gU2lnbmVkLW9mZi1ieTog
Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyB8IDE5ICsrKysrKysrKysrKy0tLS0tLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jCj4gaW5kZXggOGIwZGU5MDE1NmM2
Li44NzBmNjYyMTA4NDggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fY3J0Yy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0
Yy5jCj4gQEAgLTYxLDYgKzYxLDcgQEAgc3RydWN0IG10a19kcm1fY3J0YyB7Cj4KPiAgICAgICAg
IC8qIGxvY2sgZm9yIGRpc3BsYXkgaGFyZHdhcmUgYWNjZXNzICovCj4gICAgICAgICBzdHJ1Y3Qg
bXV0ZXggICAgICAgICAgICAgICAgICAgIGh3X2xvY2s7Cj4gKyAgICAgICBib29sICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbmZpZ191cGRhdGluZzsKPiAgfTsKPgo+ICBzdHJ1Y3QgbXRr
X2NydGNfc3RhdGUgewo+IEBAIC05Nyw3ICs5OCw3IEBAIHN0YXRpYyB2b2lkIG10a19kcm1fY3J0
Y19maW5pc2hfcGFnZV9mbGlwKHN0cnVjdCBtdGtfZHJtX2NydGMgKm10a19jcnRjKQo+ICBzdGF0
aWMgdm9pZCBtdGtfZHJtX2ZpbmlzaF9wYWdlX2ZsaXAoc3RydWN0IG10a19kcm1fY3J0YyAqbXRr
X2NydGMpCj4gIHsKPiAgICAgICAgIGRybV9jcnRjX2hhbmRsZV92YmxhbmsoJm10a19jcnRjLT5i
YXNlKTsKPiAtICAgICAgIGlmIChtdGtfY3J0Yy0+cGVuZGluZ19uZWVkc192YmxhbmspIHsKPiAr
ICAgICAgIGlmICghbXRrX2NydGMtPmNvbmZpZ191cGRhdGluZyAmJiBtdGtfY3J0Yy0+cGVuZGlu
Z19uZWVkc192YmxhbmspIHsKPiAgICAgICAgICAgICAgICAgbXRrX2RybV9jcnRjX2ZpbmlzaF9w
YWdlX2ZsaXAobXRrX2NydGMpOwo+ICAgICAgICAgICAgICAgICBtdGtfY3J0Yy0+cGVuZGluZ19u
ZWVkc192YmxhbmsgPSBmYWxzZTsKPiAgICAgICAgIH0KPiBAQCAtNDI1LDcgKzQyNiw4IEBAIHN0
YXRpYyB2b2lkIG10a19jcnRjX2RkcF9jb25maWcoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+ICAg
ICAgICAgfQo+ICB9Cj4KPiAtc3RhdGljIHZvaWQgbXRrX2RybV9jcnRjX2h3X2NvbmZpZyhzdHJ1
Y3QgbXRrX2RybV9jcnRjICptdGtfY3J0YykKPiArc3RhdGljIHZvaWQgbXRrX2RybV9jcnRjX3Vw
ZGF0ZV9jb25maWcoc3RydWN0IG10a19kcm1fY3J0YyAqbXRrX2NydGMsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBuZWVkc192YmxhbmspCj4gIHsKPiAgI2lm
IElTX1JFQUNIQUJMRShDT05GSUdfTVRLX0NNRFEpCj4gICAgICAgICBzdHJ1Y3QgY21kcV9wa3Qg
KmNtZHFfaGFuZGxlOwo+IEBAIC00MzYsNiArNDM4LDEwIEBAIHN0YXRpYyB2b2lkIG10a19kcm1f
Y3J0Y19od19jb25maWcoc3RydWN0IG10a19kcm1fY3J0YyAqbXRrX2NydGMpCj4gICAgICAgICBp
bnQgaTsKPgo+ICAgICAgICAgbXV0ZXhfbG9jaygmbXRrX2NydGMtPmh3X2xvY2spOwo+ICsgICAg
ICAgbXRrX2NydGMtPmNvbmZpZ191cGRhdGluZyA9IHRydWU7Cj4gKyAgICAgICBpZiAobmVlZHNf
dmJsYW5rKQo+ICsgICAgICAgICAgICAgICBtdGtfY3J0Yy0+cGVuZGluZ19uZWVkc192Ymxhbmsg
PSB0cnVlOwo+ICsKPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBtdGtfY3J0Yy0+bGF5ZXJfbnI7
IGkrKykgewo+ICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSA9ICZtdGtf
Y3J0Yy0+cGxhbmVzW2ldOwo+ICAgICAgICAgICAgICAgICBzdHJ1Y3QgbXRrX3BsYW5lX3N0YXRl
ICpwbGFuZV9zdGF0ZTsKPiBAQCAtNDcyLDYgKzQ3OCw3IEBAIHN0YXRpYyB2b2lkIG10a19kcm1f
Y3J0Y19od19jb25maWcoc3RydWN0IG10a19kcm1fY3J0YyAqbXRrX2NydGMpCj4gICAgICAgICAg
ICAgICAgIGNtZHFfcGt0X2ZsdXNoX2FzeW5jKGNtZHFfaGFuZGxlLCBkZHBfY21kcV9jYiwgY21k
cV9oYW5kbGUpOwo+ICAgICAgICAgfQo+ICAjZW5kaWYKPiArICAgICAgIG10a19jcnRjLT5jb25m
aWdfdXBkYXRpbmcgPSBmYWxzZTsKPiAgICAgICAgIG11dGV4X3VubG9jaygmbXRrX2NydGMtPmh3
X2xvY2spOwo+ICB9Cj4KPiBAQCAtNTMyLDcgKzUzOSw3IEBAIHZvaWQgbXRrX2RybV9jcnRjX2Fz
eW5jX3VwZGF0ZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5l
LAo+ICAgICAgICAgICAgICAgICByZXR1cm47Cj4KPiAgICAgICAgIHBsYW5lX2hlbHBlcl9mdW5j
cy0+YXRvbWljX3VwZGF0ZShwbGFuZSwgbmV3X3N0YXRlKTsKPiAtICAgICAgIG10a19kcm1fY3J0
Y19od19jb25maWcobXRrX2NydGMpOwo+ICsgICAgICAgbXRrX2RybV9jcnRjX3VwZGF0ZV9jb25m
aWcobXRrX2NydGMsIGZhbHNlKTsKPiAgfQo+Cj4gIHN0YXRpYyB2b2lkIG10a19kcm1fY3J0Y19h
dG9taWNfZW5hYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiBAQCAtNTgyLDcgKzU4OSw3IEBA
IHN0YXRpYyB2b2lkIG10a19kcm1fY3J0Y19hdG9taWNfZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMg
KmNydGMsCj4gICAgICAgICB9Cj4gICAgICAgICBtdGtfY3J0Yy0+cGVuZGluZ19wbGFuZXMgPSB0
cnVlOwo+Cj4gLSAgICAgICBtdGtfZHJtX2NydGNfaHdfY29uZmlnKG10a19jcnRjKTsKPiArICAg
ICAgIG10a19kcm1fY3J0Y191cGRhdGVfY29uZmlnKG10a19jcnRjLCBmYWxzZSk7Cj4gICAgICAg
ICAvKiBXYWl0IGZvciBwbGFuZXMgdG8gYmUgZGlzYWJsZWQgKi8KPiAgICAgICAgIGRybV9jcnRj
X3dhaXRfb25lX3ZibGFuayhjcnRjKTsKPgo+IEBAIC02MTgsMTQgKzYyNSwxMiBAQCBzdGF0aWMg
dm9pZCBtdGtfZHJtX2NydGNfYXRvbWljX2ZsdXNoKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiAg
ICAgICAgIHN0cnVjdCBtdGtfZHJtX2NydGMgKm10a19jcnRjID0gdG9fbXRrX2NydGMoY3J0Yyk7
Cj4gICAgICAgICBpbnQgaTsKPgo+IC0gICAgICAgaWYgKG10a19jcnRjLT5ldmVudCkKPiAtICAg
ICAgICAgICAgICAgbXRrX2NydGMtPnBlbmRpbmdfbmVlZHNfdmJsYW5rID0gdHJ1ZTsKPiAgICAg
ICAgIGlmIChjcnRjLT5zdGF0ZS0+Y29sb3JfbWdtdF9jaGFuZ2VkKQo+ICAgICAgICAgICAgICAg
ICBmb3IgKGkgPSAwOyBpIDwgbXRrX2NydGMtPmRkcF9jb21wX25yOyBpKyspIHsKPiAgICAgICAg
ICAgICAgICAgICAgICAgICBtdGtfZGRwX2dhbW1hX3NldChtdGtfY3J0Yy0+ZGRwX2NvbXBbaV0s
IGNydGMtPnN0YXRlKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBtdGtfZGRwX2N0bV9zZXQo
bXRrX2NydGMtPmRkcF9jb21wW2ldLCBjcnRjLT5zdGF0ZSk7Cj4gICAgICAgICAgICAgICAgIH0K
PiAtICAgICAgIG10a19kcm1fY3J0Y19od19jb25maWcobXRrX2NydGMpOwo+ICsgICAgICAgbXRr
X2RybV9jcnRjX3VwZGF0ZV9jb25maWcobXRrX2NydGMsICEhbXRrX2NydGMtPmV2ZW50KTsKPiAg
fQo+Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2NydGNfZnVuY3MgbXRrX2NydGNfZnVuY3Mg
PSB7Cj4gLS0KPiAyLjE3LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
