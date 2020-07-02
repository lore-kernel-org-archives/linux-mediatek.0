Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94B7C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 10:28:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B55552073E
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 10:28:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cG97IHXo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lcB1Osga"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B55552073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HcDfApO66M4/0OMmyIwuZwWCdCHbZDdO6+29pu+tcyA=; b=cG97IHXoHo31WGpD8vbBojyze
	TGzaHZ3r/RE/vcfHRkR56yXtLelpJf/U4/C0GFV8Q1FSDd25/+z1VHvvhj65wi9grwN4BKbAf+BsD
	AfXvbNIqckk/ArzhrcNijOWkYdw7+Oiv7rP8VDCxS3HPuburMuVf5DTV0O+MBtlh9YbcAHk5tXtNR
	WfFpQtSGe0XaFmgDvFGU/uhGJeXEeQ1UqpA8wK1Zo6nYFUZ4KIQS6a/yLcDiC8EbXj/Dib4xGBhwU
	lZuFciRIeemEQXjmgQiGL4OEeLeEVbqvsv+iSFwHWJOavdyU1agEwSFw7CrijX5yJupGzu57Oy933
	3xgTZYDZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqwRf-0002wS-Uj; Thu, 02 Jul 2020 10:27:55 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqwRd-0002vT-VS
 for linux-mediatek@lists.infradead.org; Thu, 02 Jul 2020 10:27:54 +0000
Received: by mail-wr1-x441.google.com with SMTP id z15so16249801wrl.8
 for <linux-mediatek@lists.infradead.org>; Thu, 02 Jul 2020 03:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=43XB0eC1/F767YChsoswsUl8WKG5LpvTnDvwDbF5waY=;
 b=lcB1OsgavV6AS6xXpHASRHbQIS9mdi+5CWDIKAPK6byFGjS2kShfucTE6wRte8SXdA
 xnb/NH/QzB1T34ITNbyEh9iRkUFAasKd/cDPVKWtG9msCV4MWqkj0MBQnVKb6bxSqw0X
 Jinj71DqZs8L9cvTp+vcCb0iHjTPx1QKxEE2mmwWnKDodM7YZE4biJv01RwYPOuosSHm
 GWnWTrjgzmvp0fsRu310N6f7b/oQTXQYjYiivWeAOJ+05ZWNWq0sZDLJjIeZpI8GStFq
 t4rmjQn0HjLvuTLx3g9Kbek7aYxR7kXcRPexu4CJDJ0Kp9qW66pvjCP/gmVErnjkReQt
 o6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=43XB0eC1/F767YChsoswsUl8WKG5LpvTnDvwDbF5waY=;
 b=nWy+i9XKa/Ns/9uSDgU+/9/Ra0MYYNT0MWcFJy1WhqRShABcHFwFRIV3w5qW+1Huyn
 kpmc6Tif/kRjHMriEYscXs15HflRoDGvjKu1hIrff7baIUACI7elErd5Dzm9S0DbOgAu
 LTtYVCrKSJPSv2qHz2yvkXambNuKo0QnQuqcATttoiqsNk//lFv4iNp+rEAanYRmkeqk
 +0evak9ZNiT6kspkS4amFCSYKXfrjYzVYCEvJgcr3n0MkO9t8J8xY40xCtwfUmMoOqUr
 GpC/vdiAEWtKK+I9fQOnxKE1Grs1/O0Uzv2Tz2bs8ciuNmgl1tPZPxw4qKhPxA1Ke5EO
 HgvA==
X-Gm-Message-State: AOAM533VD9vPClKn04Xn+mh2eZe8OCDvvBTtuX/2Tqd8/k6q1EfX8Vu6
 ANzFrx7CYh2VBO5kdtLHvv5qCw==
X-Google-Smtp-Source: ABdhPJxfvipf12m9Fun1ABvXSxv8cHUNe7t7xgAGmyrBPnhrmnJtU/sJ2LuWrBq69N6HUDPIIlbzwA==
X-Received: by 2002:adf:fac8:: with SMTP id a8mr1728275wrs.368.1593685671492; 
 Thu, 02 Jul 2020 03:27:51 -0700 (PDT)
Received: from dell ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id 65sm10874282wre.6.2020.07.02.03.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 03:27:50 -0700 (PDT)
Date: Thu, 2 Jul 2020 11:27:48 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v2 2/4] mfd: mt6360: implement i2c R/W with CRC
Message-ID: <20200702102748.GS1179328@dell>
References: <1592567631-20363-1-git-send-email-gene.chen.richtek@gmail.com>
 <1592567631-20363-3-git-send-email-gene.chen.richtek@gmail.com>
 <20200701071620.GQ1179328@dell>
 <CAE+NS35Kj_H9uSgBiff4hogTWmwh6z+vmPNWDh_yU1=p68xQZA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAE+NS35Kj_H9uSgBiff4hogTWmwh6z+vmPNWDh_yU1=p68xQZA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_062754_121099_632FE392 
X-CRM114-Status: GOOD (  15.58  )
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
Cc: linux-arm-kernel@lists.infradead.org, Gene Chen <gene_chen@richtek.com>,
 lars@metafoo.de, pmeerw@pmeerw.net, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, knaack.h@gmx.de,
 matthias.bgg@gmail.com, shufan_lee@richtek.com, jic23@kernel.org,
 dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAwMiBKdWwgMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgoKPiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPiDmlrwgMjAyMOW5tDfmnIgx5pelIOmAseS4iSDkuIvljYgzOjE25a+r
6YGT77yaCj4gPgo+ID4gT24gRnJpLCAxOSBKdW4gMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgo+ID4K
PiA+ID4gRnJvbTogR2VuZSBDaGVuIDxnZW5lX2NoZW5AcmljaHRlay5jb20+Cj4gPiA+Cj4gPiA+
IGltbGVtZW50IGkyYyBSL1cgd2l0aCBDUkMgd2hlbiBhY2Nlc3Mgc3ViLWRldmljZSBQTUlDIGFu
ZCBMRE8gcGFydAo+ID4KPiA+IFBsZWFzZSB1c2UgcHJvcGVyIGdyYW1tYXIsIGluY2x1ZGluZyBj
YXBpdGFsIGxldHRlcnMgYXQgdGhlIHN0YXJ0IG9mCj4gPiB0aGUgc2VudGVuY2UgYW5kIGZvciBh
YmJyZXZpYXRpb25zIHN1Y2ggYXMgIkkyQyIgYW5kIGZ1bGwgc3RvcHMuCj4gPgo+ID4gQWxzbyB0
aGlzIGRvZXNuJ3QgbWFrZSBzZW5zZSB0byBtZS4gIFBsZWFzZSBlbGFib3JhdGUuCj4gPgo+IAo+
IEFDSwo+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHZW5lIENoZW4gPGdlbmVfY2hlbkByaWNodGVr
LmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL21mZC9LY29uZmlnICAgICAgICB8ICAgMSAr
Cj4gPiA+ICBkcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jICB8IDU0MSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KPiA+Cj4gPiBUaGlzIHBhdGNoIGlzIGRvaW5n
IHdheSB0b28gbXVjaCB3YWNreSBzdHVmZiBhbGwgYXQgb25jZSwgbWFraW5nIGl0Cj4gPiB2ZXJ5
IGRpZmZpY3VsdCB0byByZXZpZXcuICBQbGVhc2UgYnJlYWsgaXQgdXAgaW50byBmdW5jdGlvbmFs
IHBpZWNlcwo+ID4gYW5kIHN1Ym1pdCBhcyBzZXBhcmF0ZSBsb2dpY2FsIHBhdGNoZXMgKGluIGEg
c2V0IG9mIGNvdXJzZSkuCj4gPgo+IAo+IElmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIEkgbmVl
ZCB0byBzZXBhcmF0ZSBwYXRjaFsyLzRdIGJ1dCBub3QKPiBlbnRpcmUgbXQ2MzYyLWNvcmUuYyBp
bnRvIHNldmVyYWwgcGF0Y2hlcy4KClllcyBwbGVhc2UuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzm
lq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3Jn
IOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFj
ZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
