Return-Path: <SRS0=J04E=HF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A4E2C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 16:14:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B93564E31
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 16:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B93564E31
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bE8K+pmPsDTr2dbwPNSkfxJL2KLNMpF98pqXkhDNbNc=; b=ZmVlLGQM0/uh8rJs7j+lr9YxT
	hVihors0TFUcGu5RKZ9Vwv22D1BcV0ESZPHxc7Z+UN/fPgTxR79fcTEf/HEeGgfgVf9qSfNFKcLm+
	wRm8gT9Baor5L244Pnt2kGWLfDYOSJ2n5XZIQhr997XWR3Ry2C4MrrRyqwjheU+L2Sc0KejxY71c7
	+ZtyaE1q2ysToX+3ImBp21plF14XYetub+Yu6q7HUQ57Pdw9xLm3dSLhg6lH0tlYKMCZhhyUH0z1f
	EGYvw5S+WcznSfm7DAJXFqZj2KckBnXB3mQRodqO8nGNJBjFK0dRxTyLrnavFl+0/haCJ54mQoP48
	pik6fPlfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7Kn1-0008RW-Of; Wed, 03 Feb 2021 16:13:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7Kmv-0008Og-TC; Wed, 03 Feb 2021 16:13:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C12864FA4;
 Wed,  3 Feb 2021 16:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612368832;
 bh=LC9OXHbkmbODTVan4GjYicX/tmgRGEDCOAypuGP002Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PQImXGeQ27g9pWi9pTRz79rlBC+Z/rOMfQfsE48RrMxum/fNN9EqDozK757TIiUOq
 fUCdSojcLSbLicSOmhLKsK06YUx/YXdglPNcFiLm6ba1mGWcWGtHfoqv+pFEuvQSTd
 daEcg2Qoj3pv9q6oee6Y6OtB85FRGo4hz07p+xgrd9LyiNW1lgFhlM7R78oFvUe8/B
 DNTlG+gNe9748OVkwA/Up8mrpmhKevTahGimfddMia6zqkISfLtkCtpgNPLXsBHDtT
 BXzAUds6JJ7KeEsCpVtZY1Dms1/COUxMgtEbmHz0kzPBo6u2xMZlNOi6WkE4mPwRjq
 akS91Qfn5h/mw==
Received: by mail-ej1-f52.google.com with SMTP id w1so36619713ejf.11;
 Wed, 03 Feb 2021 08:13:52 -0800 (PST)
X-Gm-Message-State: AOAM530IEM2TrFTNyNeSUc8HI7nXaNQRexh39+hUnLVcXv4X6l5sXXGT
 BMh4SbvXPXBgWxCAtvUUvkG20zyAWhGW25hwNA==
X-Google-Smtp-Source: ABdhPJybqLj1SNuzvTeyri0ZANhZswWzGp11dtUOf1eekuNSDPoExd5Kl4ZRSB5xaVfeOFOu8R2haSrcO7uCyqI0vgA=
X-Received: by 2002:a17:906:bce2:: with SMTP id
 op2mr3960888ejb.127.1612368830940; 
 Wed, 03 Feb 2021 08:13:50 -0800 (PST)
MIME-Version: 1.0
References: <20210202081237.774442-1-hsinyi@chromium.org>
 <20210202081237.774442-6-hsinyi@chromium.org>
In-Reply-To: <20210202081237.774442-6-hsinyi@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 4 Feb 2021 00:13:40 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9YhT5hM7QUQrkk=q-aiyCvBVr2B9ErvcL2Wj-UiEOfnA@mail.gmail.com>
Message-ID: <CAAOTY_9YhT5hM7QUQrkk=q-aiyCvBVr2B9ErvcL2Wj-UiEOfnA@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] drm/mediatek: Fix ccorr size config
To: Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_111354_117349_C71A50AA 
X-CRM114-Status: GOOD (  17.21  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEhzaW4tWWk6CgpIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+IOaWvCAyMDIx
5bm0MuaciDLml6Ug6YCx5LqMIOS4i+WNiDQ6MTPlr6vpgZPvvJoKPgo+IEZyb206IFlvbmdxaWFu
ZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+Cj4gRml4IHNldHRpbmcgdG8gZm9s
bG93IGhhcmR3YXJlIGRhdGFzaGVldC4gVGhlIG9yaWdpbmFsIGVycm9yIHNldHRpbmcKPiBhZmZl
Y3RzIG10ODE5MiBkaXNwbGF5Lgo+CgpBcHBsaWVkIHRvIG1lZGlhdGVrLWRybS1uZXh0IFsxXSwg
dGhhbmtzLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRybS1uZXh0CgpSZWdh
cmRzLApDaHVuLUt1YW5nLgoKPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlh
bmcubml1QG1lZGlhdGVrLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBIc2luLVlpIFdhbmcgPGhzaW55
aUBjaHJvbWl1bS5vcmc+Cj4gUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9jY29yci5jIHwgMiAr
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY2NvcnIuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9jY29yci5jCj4gaW5kZXggNmVlMjQzMWU2
Yjg0My4uNmM4NjY3M2E4MzVjMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2Rpc3BfY2NvcnIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9jY29yci5jCj4gQEAgLTY1LDcgKzY1LDcgQEAgdm9pZCBtdGtfY2NvcnJfY29uZmlnKHN0
cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IHcsCj4gIHsKPiAgICAgICAgIHN0cnVjdCBt
dGtfZGlzcF9jY29yciAqY2NvcnIgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPgo+IC0gICAgICAg
bXRrX2RkcF93cml0ZShjbWRxX3BrdCwgaCA8PCAxNiB8IHcsICZjY29yci0+Y21kcV9yZWcsIGNj
b3JyLT5yZWdzLAo+ICsgICAgICAgbXRrX2RkcF93cml0ZShjbWRxX3BrdCwgdyA8PCAxNiB8IGgs
ICZjY29yci0+Y21kcV9yZWcsIGNjb3JyLT5yZWdzLAo+ICAgICAgICAgICAgICAgICAgICAgICBE
SVNQX0NDT1JSX1NJWkUpOwo+ICAgICAgICAgbXRrX2RkcF93cml0ZShjbWRxX3BrdCwgQ0NPUlJf
RU5HSU5FX0VOLCAmY2NvcnItPmNtZHFfcmVnLCBjY29yci0+cmVncywKPiAgICAgICAgICAgICAg
ICAgICAgICAgRElTUF9DQ09SUl9DRkcpOwo+IC0tCj4gMi4zMC4wLjM2NS5nMDJiYzY5Mzc4OS1n
b29nCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
