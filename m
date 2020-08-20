Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA9AC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 23:29:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A62AB20748
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 23:29:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZUcwvVBS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+bEnNLE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A62AB20748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tntJmWSqJuXl9iyU5MkowIJLoRE/86d5vr3fVG+oKGA=; b=ZUcwvVBSo5wFDT4k2uln/oQ6C
	4ZxjfOJn+gp+O5oktkmjUpDpSKEZlJHdaynjUm/4K5jsHxe4obVhouYzJmHA4bF4PsVz0IKfYuZxv
	zGjdv8HeFZtWmKzwiNx++FGjaVH9rWkaZ3yfIDTYVn8SqAgWkv1oFnR3/SiqguBqXsveTBfAJn71j
	1ctFtzAifCe9H3IQBOrFFgGBs2v5hQGB6fkSOS143Aq5XSv6Y3fksF4wSmFLA5xShV+pZ4AxWI2mB
	XVE0gJddJdiui2sEwviGtcOvqlFpJs6SN1gf9X6kI5o0YQ//E3f+meEwn9agA0mNIvYz9tMm5rDuG
	e6mnYpbSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8tzj-0002qH-NW; Thu, 20 Aug 2020 23:29:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8tzh-0002p8-EV
 for linux-mediatek@lists.infradead.org; Thu, 20 Aug 2020 23:29:18 +0000
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7FC8F2087D
 for <linux-mediatek@lists.infradead.org>; Thu, 20 Aug 2020 23:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597966156;
 bh=bKIvHzrlFLAY5vwtgGAdC1wJCyUfAnJFseoDMgzigx8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=b+bEnNLE6+HsWq7x5OSDXaMkftNAz4NFkwWLXj7ccDE94t43MARMMjC3J94xYQmsA
 f6D6XYta+/yyG4M3BjviD5IKk89CnoRql9WFbfQERyU6olplbfAeu88OQp3G0va2rJ
 bGU2Yp698SHeTgNFdhjPMsDKfzOGkI9IEw9Tczno=
Received: by mail-ed1-f45.google.com with SMTP id k25so1572482edj.13
 for <linux-mediatek@lists.infradead.org>; Thu, 20 Aug 2020 16:29:16 -0700 (PDT)
X-Gm-Message-State: AOAM5304jYkmaPVidCpqMrCy5QyDJTLZPfRxqbQXRwy8t6eUVWtbmiZV
 aRjz/HrsYJ/+cuOAxMN2AJ4JkET99UXEAvNHKg==
X-Google-Smtp-Source: ABdhPJxnbCezgbtFQptt9Mtdn2+1CJtKJfQTBL+lG8Rgr+Qfl6BIxij5gSLnal0+cXbH0RS4NEWuTAiH8SrgPMLvX0g=
X-Received: by 2002:aa7:c606:: with SMTP id h6mr278114edq.288.1597966155156;
 Thu, 20 Aug 2020 16:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200819154421.7013-1-chunkuang.hu@kernel.org>
 <20200819154421.7013-4-chunkuang.hu@kernel.org>
 <919b4b36-8deb-dfbe-81fe-c12f8da65dac@infradead.org>
In-Reply-To: <919b4b36-8deb-dfbe-81fe-c12f8da65dac@infradead.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 21 Aug 2020 07:29:03 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9NOFyxGzvmHPo_6Oqm2AvZSJczC26GzZqC9EVJ=cqy7A@mail.gmail.com>
Message-ID: <CAAOTY_9NOFyxGzvmHPo_6Oqm2AvZSJczC26GzZqC9EVJ=cqy7A@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] phy: mediatek: Move mtk_hdmi_phy driver into
 drivers/phy/mediatek folder
To: Randy Dunlap <rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_192917_580527_C38E1F55 
X-CRM114-Status: GOOD (  15.08  )
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
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chunfeng Yun <chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFJhbmR5OgoKUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+IOaWvCAyMDIw
5bm0OOaciDIw5pelIOmAseWbmyDkuIrljYgxMjowMOWvq+mBk++8mgo+Cj4gT24gOC8xOS8yMCA4
OjQ0IEFNLCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGh5
L21lZGlhdGVrL0tjb25maWcgYi9kcml2ZXJzL3BoeS9tZWRpYXRlay9LY29uZmlnCj4gPiBpbmRl
eCBkZWU3NTdjOTU3ZjIuLjEwZjBlYzJkNWI1NCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvcGh5
L21lZGlhdGVrL0tjb25maWcKPiA+ICsrKyBiL2RyaXZlcnMvcGh5L21lZGlhdGVrL0tjb25maWcK
PiA+IEBAIC0zNSwzICszNSwxMCBAQCBjb25maWcgUEhZX01US19YU1BIWQo+ID4gICAgICAgICBF
bmFibGUgdGhpcyB0byBzdXBwb3J0IHRoZSBTdXBlclNwZWVkUGx1cyBYUy1QSFkgdHJhbnNjZWl2
ZXIgZm9yCj4gPiAgICAgICAgIFVTQjMuMSBHRU4yIGNvbnRyb2xsZXJzIG9uIE1lZGlhVGVrIGNo
aXBzLiBUaGUgZHJpdmVyIHN1cHBvcnRzCj4gPiAgICAgICAgIG11bHRpcGxlIFVTQjIuMCwgVVNC
My4xIEdFTjIgcG9ydHMuCj4gPiArCj4gPiArY29uZmlnIFBIWV9NVEtfSERNSQo+ID4gKyAgICB0
cmlzdGF0ZSAiTWVkaWFUZWsgSERNSS1QSFkgRHJpdmVyIgo+ID4gKyAgICBkZXBlbmRzIG9uIEFS
Q0hfTUVESUFURUsgJiYgT0YKPiA+ICsgICAgc2VsZWN0IEdFTkVSSUNfUEhZCj4gPiArICAgIGhl
bHAKPiA+ICsgICAgICAgICAgRW5hYmxlIHRoaXMgdG8gc3VwcG9ydCBIRE1JLVBIWQo+Cj4gRml4
IGluZGVudGF0aW9uIGFib3ZlLgo+CgpPSywKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+IHRoYW5r
cy4KPiAtLQo+IH5SYW5keQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
