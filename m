Return-Path: <SRS0=13eL=E5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8759C63697
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 14:37:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72F2920773
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 14:37:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eg1YRfe2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="LWeEmYqR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72F2920773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0MYpp4Fzh8oO7GtoYfOeIbncbY/6wS62E22SkiBmXfk=; b=eg1YRfe2eIOPq9o+TmXW752BS
	6oPTGXk7pj3PpotJOI6aKq4OkjjCGOiMD7PfZYwLl0MGZzFtUAlQhd9Yio6DPBawfZRVYkVIo5cAx
	9G9ooN0Fe+7XUAS15HHelzLy/qeLYtRIJJvscrmsFTnDfjuFe3a46Z6Hcl4BIRkSwZq7QR8Jcyhv2
	ihCnR4pTwvpFun6dF/cPmLK0BeOy88xcy3wEiDB5YCEj08lTrs7Rt1/5hCPYznWM9q1MBRE2+voVp
	+/o+xqiHye2jQiOGjkcbIghIDFxK+lHr0CxsJo/u2nZCF1H3NahtjB3oU41ca0abo4h4vnYOiJ/o/
	aS3Tdtjig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khCxv-0000b8-5g; Mon, 23 Nov 2020 14:37:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khCxp-0000YN-4T; Mon, 23 Nov 2020 14:37:10 +0000
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E5846208FE;
 Mon, 23 Nov 2020 14:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606142228;
 bh=OUEWYsBkqLktfnlUWZU93Abg+Nz/7mAOEsw44o/z+AY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LWeEmYqRvIgVibJPvSUA2bNMZQKSwK4bFEbNihh1IZICbn9g73foiQyD2lJ+Kj9cW
 aHXTvbMmNhyKgCdAiOyMUqq9ko2uFsk4zH5WkqDSAiwX//khUaYb3iSdJ3ZinOQsLL
 KFYTslYgHiC7hm8tX+CcEdkzT3d+WvIAEY97IJxc=
Received: by mail-ej1-f43.google.com with SMTP id f23so23632127ejk.2;
 Mon, 23 Nov 2020 06:37:07 -0800 (PST)
X-Gm-Message-State: AOAM533bpmOCKKCrKlC/P8fCcJv8l4NfimSeleADUIcrPm24U8HY8o+U
 DZ3lxME82uMKwU1zwQWwZ33JDoP97h8WRSuKZw==
X-Google-Smtp-Source: ABdhPJwGasd9fgVLE5ED8mhWD3NZ+E+/6bwxsrrXYebqvxGYFpzg+IT9Mho0RkDbiY0q9WB2uZjp5mQd28XNDsFa8GI=
X-Received: by 2002:a17:906:d0cc:: with SMTP id
 bq12mr42714267ejb.127.1606142226345; 
 Mon, 23 Nov 2020 06:37:06 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-19-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-19-lee.jones@linaro.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 23 Nov 2020 22:36:54 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9qciG6Cc4b8WqzCugdve99qjTO5ftsyK0PHJiOF+C19w@mail.gmail.com>
Message-ID: <CAAOTY_9qciG6Cc4b8WqzCugdve99qjTO5ftsyK0PHJiOF+C19w@mail.gmail.com>
Subject: Re: [PATCH 18/40] drm/mediatek/mtk_dpi: Remove unused struct
 definition 'mtk_dpi_encoder_funcs'
To: Lee Jones <lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_093709_315281_916F1117 
X-CRM114-Status: GOOD (  17.85  )
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
 Philipp Zabel <p.zabel@pengutronix.de>, Jie Qiu <jie.qiu@mediatek.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIExlZToKCkxlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+IOaWvCAyMDIw5bm0MTHm
nIgxM+aXpSDpgLHkupQg5LiL5Y2IOTo1MOWvq+mBk++8mgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2lu
ZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcGkuYzo1MzA6Mzk6IHdhcm5pbmc6IOKAmG10a19kcGlfZW5jb2Rlcl9mdW5jc+KA
mSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQo+CgpUaGFu
a3MgZm9yIHRoaXMgcGF0Y2gsIGJ1dCBJJ3ZlIGFwcGxpZWQgYW5vdGhlciBpZGVudGljYWwgcGF0
Y2gKImRybS9tZWRpYXRlazogbXRrX2RwaTogRml4IHVudXNlZCB2YXJpYWJsZSAnbXRrX2RwaV9l
bmNvZGVyX2Z1bmNzJyIKWzFdLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvY29tbWl0Lz9oPW1lZGlhdGVr
LWRybS1maXhlcyZpZD00NmI5N2FlZDU0ODRhM2Y0NDU4NGExMGY5ZTA2OTFiZjg5ZDI5MDY0CgpS
ZWdhcmRzLApDaHVuLUt1YW5nLgoKPiBDYzogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtl
cm5lbC5vcmc+Cj4gQ2M6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4g
Q2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21h
aWwuY29tPgo+IENjOiBKaWUgUWl1IDxqaWUucWl1QG1lZGlhdGVrLmNvbT4KPiBDYzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiBDYzogbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IFNp
Z25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgfCA5IC0tLS0tLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RwaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+
IGluZGV4IGNmMTFjNDg1MGI0MDUuLjUyZjExYTYzYTMzMDQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHBpLmMKPiBAQCAtNTIyLDE1ICs1MjIsNiBAQCBzdGF0aWMgaW50IG10a19kcGlf
c2V0X2Rpc3BsYXlfbW9kZShzdHJ1Y3QgbXRrX2RwaSAqZHBpLAo+ICAgICAgICAgcmV0dXJuIDA7
Cj4gIH0KPgo+IC1zdGF0aWMgdm9pZCBtdGtfZHBpX2VuY29kZXJfZGVzdHJveShzdHJ1Y3QgZHJt
X2VuY29kZXIgKmVuY29kZXIpCj4gLXsKPiAtICAgICAgIGRybV9lbmNvZGVyX2NsZWFudXAoZW5j
b2Rlcik7Cj4gLX0KPiAtCj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2VuY29kZXJfZnVuY3Mg
bXRrX2RwaV9lbmNvZGVyX2Z1bmNzID0gewo+IC0gICAgICAgLmRlc3Ryb3kgPSBtdGtfZHBpX2Vu
Y29kZXJfZGVzdHJveSwKPiAtfTsKPiAtCj4gIHN0YXRpYyBpbnQgbXRrX2RwaV9icmlkZ2VfYXR0
YWNoKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZW51bSBkcm1fYnJpZGdlX2F0dGFjaF9mbGFncyBmbGFncykKPiAgewo+IC0tCj4g
Mi4yNS4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
