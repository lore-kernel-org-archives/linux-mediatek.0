Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1682C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 15:01:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7665B207FC
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 15:01:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1fcmWXvX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="y6jdF2/f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7665B207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PcPSLkIBJQT21crtBUS3N8CTPrs2341aTmoRxVAZWWg=; b=1fcmWXvXrJr8WfkEGBdBqLxJ9
	jcgxBHeXI2F6JYRPqv+pLIQ2s4dfaKwEJOyHt5X4Czev6XHFhQJ6vQkUwmeAlMCXUClzkrpWYXZAh
	GiyLS2fALRAh4oljr7WxUf3DxjD/4BU3exlPKhW2eIPepiQw81RfrcaevcLISP7u0HLBFqgULBotv
	IV7ontPUV1YeFw8xN3Gyhgtf+0sbf3GiJdX9hPeMbBCl95khHGE97PX9JUSe66bd8zwRwHBLQ/FSV
	7VtZzfRl5YmByPkeQNx9QlUR+gXHDXKgHk7f6n1uh8zON5F2UobVXPdqdsql4q+g7s7zNc/ziTEru
	4TeRNS8IQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2yRM-00036u-Kl; Tue, 04 Aug 2020 15:01:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2yRH-00033p-FB; Tue, 04 Aug 2020 15:01:16 +0000
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8DBC022CE3;
 Tue,  4 Aug 2020 15:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596553274;
 bh=iTbEpo6hT4ij3tiFeBOJjmAYZg4kRV7aj9Emq+WzyNA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=y6jdF2/fPzm+oVlUu5TOqjL6vqTqk7bQIiPhw6vpc9F+Oeoa+Xm2x90VbQrFtJOhL
 ja7uWx9kM2sRjjqjFYipGu8Xwlp99RV1VnwQ04/TRnyC7Xp+3IWEpcmBPyf3SdWasN
 LpyZ5WRrTa1743/14iEjpAOXEs2BrctkqzUOBOVI=
Received: by mail-ej1-f47.google.com with SMTP id kq25so29836460ejb.3;
 Tue, 04 Aug 2020 08:01:14 -0700 (PDT)
X-Gm-Message-State: AOAM531cl5+3zEDmU6gRIHUTMlhdsRZGd4phCa2OMnU8oi/sjQgK3D69
 87PYquZw4hkRZKMNRvkf5nForo/kYrtkQY1miw==
X-Google-Smtp-Source: ABdhPJzJB/NAHbkY8K8FLXLQQxOKbF0xJx2EWEaw7fMZkjsTp92jQYxuFQfO/ANYXKnrA0eT795Wd5eXvPx0hCw5G9Q=
X-Received: by 2002:a17:906:60d5:: with SMTP id
 f21mr1337420ejk.94.1596553273100; 
 Tue, 04 Aug 2020 08:01:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200804105849.70876-1-linux@fw-web.de>
 <20200804105849.70876-2-linux@fw-web.de>
 <CAAOTY_94Kt3Z4FhB+1Chca-tanzY1Xwun8D2ZQ09Y7p7+Jw40Q@mail.gmail.com>
 <trinity-5e5aa82a-c026-4138-9f33-d3776710eb47-1596552262328@3c-app-gmx-bap28>
In-Reply-To: <trinity-5e5aa82a-c026-4138-9f33-d3776710eb47-1596552262328@3c-app-gmx-bap28>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 4 Aug 2020 23:01:01 +0800
X-Gmail-Original-Message-ID: <CAAOTY__0HjikMH1iTJOkvt6fYXSao75GQQbVPL75vmVn+hpp5g@mail.gmail.com>
Message-ID: <CAAOTY__0HjikMH1iTJOkvt6fYXSao75GQQbVPL75vmVn+hpp5g@mail.gmail.com>
Subject: Re: Re: [PATCH v3 1/5] drm: mediatek: add ddp routing for mt7623
To: Frank Wunderlich <frank-w@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_110115_585785_0636614B 
X-CRM114-Status: GOOD (  10.97  )
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
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Frank Wunderlich <linux@fw-web.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RnJhbmsgV3VuZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+IOaWvCAyMDIw5bm0OOac
iDTml6Ug6YCx5LqMIOS4i+WNiDEwOjQ05a+r6YGT77yaCj4KPiBIaSwKPgo+ID4gR2VzZW5kZXQ6
IERpZW5zdGFnLCAwNC4gQXVndXN0IDIwMjAgdW0gMTY6MzQgVWhyCj4gPiBWb246ICJDaHVuLUt1
YW5nIEh1IiA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4KPiA+ID4gLXN0YXRpYyBjb25zdCBl
bnVtIG10a19kZHBfY29tcF9pZCBtdDI3MTJfbXRrX2RkcF9tYWluW10gPSB7Cj4gPiA+ICtzdGF0
aWMgZW51bSBtdGtfZGRwX2NvbXBfaWQgbXQyNzEyX210a19kZHBfbWFpbltdID0gewo+ID4KPiA+
IFdoeSBkbyB5b3UgcmVtb3ZlICdjb25zdCc/Cj4KPiB3YXMgcmVtb3ZlZCBieSBwcmV2aW91cyBw
YXRjaCBhbmQgbm90IHJlLWFkZGVkIChyZXZlcnQgZmFpbGVkKSwgc29ycnkuIHdpbGwgZml4IGlu
IG5leHQgdmVyc2lvbiwgaWYgYWxsIG90aGVyIGlzIG9rLgoKYWxsIG90aGVyIGlzIG9rLgoKUmVn
YXJkcywKQ2h1bi1LdWFuZy4KCj4KPiByZWdhcmRzIEZyYW5rCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
