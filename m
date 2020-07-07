Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62EF5C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 23:01:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FD5B2065D
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 23:01:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LywSLCqJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pid8eg/X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FD5B2065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6bpzBwdM6AZKLpAzwhsZVWpec0pBlQ/3VcdlD+Xe+mo=; b=LywSLCqJxHeGrwm1cOwRDq+Pe
	sSY4PL9CrmQgL86Eq26MQvikSItwOhTQ6LFqzJ7mg+a5QGz1vC1BjrAmSb5RGumoRocWkeP2GgEho
	1rPmlfDjGpUDvFblXYw6PPHfAZVpTROS9Tgk3pb0DY42LA+oF7CPAbkoqj1rbHqGnvYZcxBI6ZdIL
	M6E1lBRIrVu96MEu11XDXiba870SNf5/UAQYLUVA1Pe3VwAsvRZUCOg8e3E6YlXrlvKY9w9BEy5pK
	89QPHlVKD5sQOdRtf2eT3jPpXbVoHJAt2x/yRjCV1M/pHW5iOnQ1tio0mguHMTtMKloEHNfFeroea
	UYjq5Wl8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jswak-0007Rg-Vr; Tue, 07 Jul 2020 23:01:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jswag-0007R3-8Q; Tue, 07 Jul 2020 23:01:31 +0000
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 484912065D;
 Tue,  7 Jul 2020 23:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594162889;
 bh=4qJEKQQJcDJ7ghgfJoXN9/TcliJkC9rBFhJEq8AKAaY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pid8eg/X7TWu5oQ8D71nKDtkDO8KtHQjV+IIyaY5BUtDBgetVYrRuZ9TlpnFwDDK+
 Wd2CW2uDvrIhRkC5CSjvo/bz4xcCA4p54ZKnG7J8XZdeBTen2XI63NHEI9flHq48W0
 Gn2Ct2XkGWr8+Kz54wmfV/L6UEuVdOgYCBktcIPA=
Received: by mail-ed1-f42.google.com with SMTP id dg28so40072522edb.3;
 Tue, 07 Jul 2020 16:01:29 -0700 (PDT)
X-Gm-Message-State: AOAM5318UwGFkAx/0FFX06lYYb5yDKB9TdKIKz2OV5ZeowyTCqkgn/Xv
 EiqcfZWquQ33Y97UGbDmsNjYllD/WbF1YK8MXA==
X-Google-Smtp-Source: ABdhPJwN63+iLNiej03gzID1NxPCPP+r0o1MDFI0VjDfCehdz0KEDSLVG+M6Dv9Ka1UwMaw0JXkczgR7RHvqXl9MfPE=
X-Received: by 2002:a05:6402:203c:: with SMTP id
 ay28mr54721396edb.271.1594162887967; 
 Tue, 07 Jul 2020 16:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1594136714-11650-10-git-send-email-dennis-yc.hsieh@mediatek.com>
In-Reply-To: <1594136714-11650-10-git-send-email-dennis-yc.hsieh@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 8 Jul 2020 07:01:17 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-BKW9jbGD5-Un=xagRWizOXaBrvvfdQV7TyzhYWuS8Ag@mail.gmail.com>
Message-ID: <CAAOTY_-BKW9jbGD5-Un=xagRWizOXaBrvvfdQV7TyzhYWuS8Ag@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] drm/mediatek: reduce clear event
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_190130_433245_1148CC07 
X-CRM114-Status: GOOD (  16.22  )
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
Cc: Daniel Vetter <daniel@ffwll.ch>, wsd_upstream <wsd_upstream@mediatek.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 Houlong Wei <houlong.wei@mediatek.com>, HS Liao <hs.liao@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIERlbm5pczoKCkRlbm5pcyBZQyBIc2llaCA8ZGVubmlzLXljLmhzaWVoQG1lZGlhdGVrLmNv
bT4g5pa8IDIwMjDlubQ35pyIN+aXpSDpgLHkuowg5LiL5Y2IMTE6NDflr6vpgZPvvJoKPgo+IE5v
IG5lZWQgdG8gY2xlYXIgZXZlbnQgYWdhaW4gc2luY2UgZXZlbnQgYWx3YXlzIGNsZWFyIGJlZm9y
ZSB3YWl0Lgo+IFRoaXMgZml4IGRlcGVuZCBvbiBwYXRjaDoKPiAgICJzb2M6IG1lZGlhdGVrOiBj
bWRxOiBhZGQgY2xlYXIgb3B0aW9uIGluIGNtZHFfcGt0X3dmZSBhcGkiCgpBY2tlZC1ieTogQ2h1
bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gRml4ZXM6IDJmOTY1YmU3
ZjkwMDggKCJkcm0vbWVkaWF0ZWs6IGFwcGx5IENNRFEgY29udHJvbCBmbG93IikKPiBTaWduZWQt
b2ZmLWJ5OiBEZW5uaXMgWUMgSHNpZWggPGRlbm5pcy15Yy5oc2llaEBtZWRpYXRlay5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyB8ICAgIDIgKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jIGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jCj4gaW5kZXggYzg0ZTdhMTRkNGE4Li5i
YTZjZjk1NmIyMzkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fY3J0Yy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5j
Cj4gQEAgLTQ5MCw3ICs0OTAsNyBAQCBzdGF0aWMgdm9pZCBtdGtfZHJtX2NydGNfaHdfY29uZmln
KHN0cnVjdCBtdGtfZHJtX2NydGMgKm10a19jcnRjKQo+ICAgICAgICAgICAgICAgICBtYm94X2Zs
dXNoKG10a19jcnRjLT5jbWRxX2NsaWVudC0+Y2hhbiwgMjAwMCk7Cj4gICAgICAgICAgICAgICAg
IGNtZHFfaGFuZGxlID0gY21kcV9wa3RfY3JlYXRlKG10a19jcnRjLT5jbWRxX2NsaWVudCwgUEFH
RV9TSVpFKTsKPiAgICAgICAgICAgICAgICAgY21kcV9wa3RfY2xlYXJfZXZlbnQoY21kcV9oYW5k
bGUsIG10a19jcnRjLT5jbWRxX2V2ZW50KTsKPiAtICAgICAgICAgICAgICAgY21kcV9wa3Rfd2Zl
KGNtZHFfaGFuZGxlLCBtdGtfY3J0Yy0+Y21kcV9ldmVudCwgdHJ1ZSk7Cj4gKyAgICAgICAgICAg
ICAgIGNtZHFfcGt0X3dmZShjbWRxX2hhbmRsZSwgbXRrX2NydGMtPmNtZHFfZXZlbnQsIGZhbHNl
KTsKPiAgICAgICAgICAgICAgICAgbXRrX2NydGNfZGRwX2NvbmZpZyhjcnRjLCBjbWRxX2hhbmRs
ZSk7Cj4gICAgICAgICAgICAgICAgIGNtZHFfcGt0X2ZpbmFsaXplKGNtZHFfaGFuZGxlKTsKPiAg
ICAgICAgICAgICAgICAgY21kcV9wa3RfZmx1c2hfYXN5bmMoY21kcV9oYW5kbGUsIGRkcF9jbWRx
X2NiLCBjbWRxX2hhbmRsZSk7Cj4gLS0KPiAxLjcuOS41Cj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
PiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
