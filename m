Return-Path: <SRS0=UyV0=DN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F86C4363D
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 23:22:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7820206F4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 23:21:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QYzu0qfU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xl0uxwUm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7820206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ojUTpFd1PqjGPiIKV7PK9Pytpzb1o7DbTtC8XNeOm0Q=; b=QYzu0qfUUlu/qmly47sDnD2cd
	EufXWj/PEyLy561WhIZm7aeEASADB8blFUVuoBw3DexdC3YvSNK1OuG2PrsqeWsDc/IgICy0kEiX1
	+Hm/M/KAx6z1X0UBjmh7UQC/5zTALmb7Lx09b2QHziQC6KioqX8pBO/YPcJ0E6WZGrTjf/oFQMm04
	b9OwNrzxq3M5C4TOn+eCyUjyX/sUaD6+x/hhuki/mn8E8/uKpmrBaMgnqsrG8noSSq5sen1DZTM6J
	GnBvLzBB8W3NvMotE7laJ4uvEVdcC12ZeVgMWAyLc2/8d0o92GfE4v5TCnujX3eXRjPQEJSRwvkze
	EulYrsI6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPwHG-00059v-VS; Tue, 06 Oct 2020 23:21:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPwHD-00058t-T8; Tue, 06 Oct 2020 23:21:48 +0000
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2CC3120E65;
 Tue,  6 Oct 2020 23:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602026506;
 bh=w3rqYm5bSFfRjGcsvP6qbO0O2mVCq2b8LjMq0OPbP40=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Xl0uxwUm+NkrIKVP4mecVV2Rs0vfEWkV9waA9yE/pESk2/GZ7DSFJAAd7CuIBn9oQ
 MRyBBeWeGeUnFZodptsOWZQlHLI2WIFiPbaZKQ4U7EgYwxMFIh4sanjDcskWD6S9do
 usmA1KwJ+wokdx33MuZ9qTHbgDLQIt/OkrXm58OY=
Received: by mail-ej1-f43.google.com with SMTP id ce10so290804ejc.5;
 Tue, 06 Oct 2020 16:21:46 -0700 (PDT)
X-Gm-Message-State: AOAM532XQFZGLEXRj99tgs2Bw1ToR4pbPaYJ/kROZVR98cXQbAYTx5gS
 YN2gxizFe8y+ngAbPMoHHSGN4jE5R+/rHYGRrw==
X-Google-Smtp-Source: ABdhPJzI6uOPlHzkLjMWX6Wd8VyldUGyz9WuXn4fUheBeqE1Mroh8mreITWhdb7rTnLjmpJOrZaD3RCflUhpQe4Iqhs=
X-Received: by 2002:a17:906:3b8e:: with SMTP id
 u14mr402539ejf.127.1602026504590; 
 Tue, 06 Oct 2020 16:21:44 -0700 (PDT)
MIME-Version: 1.0
References: <20201006193320.405529-1-enric.balletbo@collabora.com>
 <20201006193320.405529-3-enric.balletbo@collabora.com>
In-Reply-To: <20201006193320.405529-3-enric.balletbo@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 7 Oct 2020 07:21:33 +0800
X-Gmail-Original-Message-ID: <CAAOTY__NVjKW-WXekeZSb4RRR4G01LQrPN+m_g0EQJ9hLviN8g@mail.gmail.com>
Message-ID: <CAAOTY__NVjKW-WXekeZSb4RRR4G01LQrPN+m_g0EQJ9hLviN8g@mail.gmail.com>
Subject: Re: [PATCH 2/4] soc: mediatek: mmsys: Use
 devm_platform_ioremap_resource()
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_192148_008364_38290A68 
X-CRM114-Status: GOOD (  17.54  )
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
 linux-kernel <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4g5pa8
IDIwMjDlubQxMOaciDfml6Ug6YCx5LiJIOS4iuWNiDM6MzPlr6vpgZPvvJoKPgo+IEZvciB0aGUg
Y29tbW9uIHBsYXRmb3JtX2dldF9yZXNvdXJjZSgpK2Rldm1fcGxhdGZvcm1faW9yZW1hcCgpIGNv
bWJpbmF0aW9uLAo+IHRoZXJlIGlzIGEgaGVscGVyLCBzbyB1c2UgaXQgYW5kIG1ha2UgdGhlIGNv
ZGUgYSBiaXQgbW9yZSBjb21wYWN0LgoKUmV2aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5r
dWFuZy5odUBtZWRpYXRlay5jb20+Cgo+Cj4gU2lnbmVkLW9mZi1ieTogRW5yaWMgQmFsbGV0Ym8g
aSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4KPiAtLS0KPgo+ICBkcml2ZXJz
L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYyB8IDcgKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
c29jL21lZGlhdGVrL210ay1tbXN5cy5jIGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lz
LmMKPiBpbmRleCAzNmFkNjZiYjIyMWIuLjE4ZjkzOTc5ZTE0YSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYwo+ICsrKyBiL2RyaXZlcnMvc29jL21lZGlhdGVr
L210ay1tbXN5cy5jCj4gQEAgLTMwNiwxNSArMzA2LDEyIEBAIHN0YXRpYyBpbnQgbXRrX21tc3lz
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAgICAgICBzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpjbGtzOwo+ICAgICAgICAgc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZHJt
Owo+ICAgICAgICAgdm9pZCBfX2lvbWVtICpjb25maWdfcmVnczsKPiAtICAgICAgIHN0cnVjdCBy
ZXNvdXJjZSAqbWVtOwo+ICAgICAgICAgaW50IHJldDsKPgo+IC0gICAgICAgbWVtID0gcGxhdGZv
cm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsKPiAtICAgICAgIGNvbmZp
Z19yZWdzID0gZGV2bV9pb3JlbWFwX3Jlc291cmNlKGRldiwgbWVtKTsKPiArICAgICAgIGNvbmZp
Z19yZWdzID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOwo+ICAgICAg
ICAgaWYgKElTX0VSUihjb25maWdfcmVncykpIHsKPiAgICAgICAgICAgICAgICAgcmV0ID0gUFRS
X0VSUihjb25maWdfcmVncyk7Cj4gLSAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiRmFpbGVk
IHRvIGlvcmVtYXAgbW1zeXMtY29uZmlnIHJlc291cmNlOiAlZFxuIiwKPiAtICAgICAgICAgICAg
ICAgICAgICAgICByZXQpOwo+ICsgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIkZhaWxlZCB0
byBpb3JlbWFwIG1tc3lzIHJlZ2lzdGVyczogJWRcbiIsIHJldCk7Cj4gICAgICAgICAgICAgICAg
IHJldHVybiByZXQ7Cj4gICAgICAgICB9Cj4KPiAtLQo+IDIuMjguMAo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5n
IGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
