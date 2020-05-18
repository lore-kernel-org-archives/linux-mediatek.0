Return-Path: <SRS0=JQKK=7A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C9ECC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 15:23:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A48E20758
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 15:23:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GDMVHJSb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rejD3Cq3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A48E20758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9mlp3vyWnDFICM6NRlWvXQxf/sieogMPurA3fMDbsh0=; b=GDMVHJSbgi5n9E
	d9RH6NxeZgQQI2Yoi9iedZjMCLWl274BHd14/v7+aorS5tXWbX+F++RGAiEMLvuXyO6chaA4zviE5
	p24iEDYMHrTxjjx13O+OCTzYotfhJwU8+GmQ86s6iFb1IVeJEgldqpoQIyPx7nYgt1pHJOoV8Gqr9
	8MMiGymjr3yUZwr0HnA6DdnmMYhwYL8sKGYi39iRi7Z0k1uvtmByepiy7g17KVZnpbZULyTD+uUHj
	54Z/NVEu+PGk9JEkiJQMg49/OcCICkSZhfFxEnNTcg7GOCLyEv3NhfF8dvIYJAJISbVz27VatVqSh
	O9XK3UQ7tZbVxrWc1pyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jahc8-0002d6-Dd; Mon, 18 May 2020 15:23:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jahbw-0002TN-QP; Mon, 18 May 2020 15:23:26 +0000
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 32DE720758;
 Mon, 18 May 2020 15:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589815404;
 bh=yxtbYhqiBpX0vaCKJ8nincWDlOttWPQGQYeL0KqTH88=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rejD3Cq3JkMBTzUozSEQ/NMDN4wNabDl16h10hnxRO/FeHWgmHuBR1gpptZvSLEmk
 MerhXjFPxqumyVcS4pDPVo779TNtQyQiVWYUsMSyf/WgUSilWfXZfG2UVY6cyEzsRH
 qEihdwS5ax4XJoPtGyu0LU44g3M2x4HNHH/cZuEo=
Received: by mail-ej1-f41.google.com with SMTP id o10so9128758ejn.10;
 Mon, 18 May 2020 08:23:24 -0700 (PDT)
X-Gm-Message-State: AOAM533HiYz0L6v8v4vIdJ6VuOzmAhyc9xaEM6/Gr4QUU1BpTtbgy02M
 LH341K1kfwRh8IHoAjKovxHuk7/yrFwnHz/gwQ==
X-Google-Smtp-Source: ABdhPJx1xmRv1Gbqt6X2HaH4typf9wcXv81hsB28v44g5GQNU5bFmryX50AtKCXktDvePVh8ZZJSpwAS+KTHOyiTrIE=
X-Received: by 2002:a17:906:924a:: with SMTP id
 c10mr10734314ejx.360.1589815402680; 
 Mon, 18 May 2020 08:23:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200518112254.23692-1-matthias.bgg@kernel.org>
In-Reply-To: <20200518112254.23692-1-matthias.bgg@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 18 May 2020 23:23:09 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-kBsnBk3RRUb_ks96c1Cf6hJ+SeSE4T52Djoqjzxk3jA@mail.gmail.com>
Message-ID: <CAAOTY_-kBsnBk3RRUb_ks96c1Cf6hJ+SeSE4T52Djoqjzxk3jA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Delete not used of_device_get_match_data
To: matthias.bgg@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_082324_879096_C9E77D58 
X-CRM114-Status: GOOD (  15.82  )
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
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE1hdHRoaWFzOgoKPG1hdHRoaWFzLmJnZ0BrZXJuZWwub3JnPiDmlrwgMjAyMOW5tDXmnIgx
OOaXpSDpgLHkuIAg5LiL5Y2INzoyM+Wvq+mBk++8mgo+Cj4gRnJvbTogTWF0dGhpYXMgQnJ1Z2dl
ciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4KPgo+IFRoZSBkcml2ZXIgd2lsbCBiZSBsb2FkZWQg
YnkgdmlhIGEgcGxhdGZvcm0gZGV2aWNlLiBTbyB3ZQo+IHdpbGwgbmVlZCB0byBnZXQgdGhlIGRl
dmljZV9ub2RlIGZyb20gdGhlIHBhcmVudCBkZXZpY2UuCj4gRGVwZW5kaW5nIG9uIHRoaXMgd2Ug
d2lsbCBzZXQgdGhlIGRyaXZlciBkYXRhLgo+IEFzIGFsbCB0aGlzIGlzIGRvbmUgbGF0ZXIgYWxy
ZWFkeSwganVzdCBkZWxldGUgdGhlIGNhbGwgdG8KPiBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEu
Cj4KClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4K
Cj4gU2lnbmVkLW9mZi1ieTogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgfCAxIC0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2Rydi5jCj4gaW5kZXggZTJiYjBkMTllZjk5Li42M2VjOTJiYTBlOTIgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwo+IEBAIC00NDcsNyArNDQ3LDYg
QEAgc3RhdGljIGludCBtdGtfZHJtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
Cj4gICAgICAgICBpZiAoIXByaXZhdGUpCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVN
Owo+Cj4gLSAgICAgICBwcml2YXRlLT5kYXRhID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRl
dik7Cj4gICAgICAgICBwcml2YXRlLT5tbXN5c19kZXYgPSBkZXYtPnBhcmVudDsKPiAgICAgICAg
IGlmICghcHJpdmF0ZS0+bW1zeXNfZGV2KSB7Cj4gICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2
LCAiRmFpbGVkIHRvIGdldCBNTVNZUyBkZXZpY2VcbiIpOwo+IC0tCj4gMi4yNi4yCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
