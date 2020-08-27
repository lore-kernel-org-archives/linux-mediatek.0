Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1EFC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 04:53:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B441D2078A
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 04:53:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SnAred2a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FvkxLG6V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B441D2078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zObUxEDEbyu2i0KCUKYdP3HczwNyFlLwMYCSiyvst4Q=; b=SnAred2a07rK6UaU6WxgmsmEh
	queBB6ZIwVbdHhFjGZM5uznbGnZh0GrMDBi+BZ7QHkJzvjVvku7SmTO+O2TwYqIQzq1TjEfXqhvNh
	RTG1en1QZBmxcxN3OC4/JOUTqYVx22vKlDmXl4pFFvCdBFRZY06uXHTsYxmpqax81DmddYiSPPIVz
	odc/iWAeyI+C73itIBsdpjLpuctISMUVF5YTzghjS0pYnzGAfGI0B79Mmophm4fs39m0y5EXJrW98
	qMNLNxXNpQazAETHnT4YU/FMDetF/FPt/6OMVaNPYFL+TgdU+ADEiJby1QyzpuDnwCjJ+dE4epNSy
	68lhovxlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kB9uo-0001Uy-7t; Thu, 27 Aug 2020 04:53:34 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kB9uj-0001Th-Pk; Thu, 27 Aug 2020 04:53:30 +0000
Received: by mail-lj1-x242.google.com with SMTP id v12so4896959ljc.10;
 Wed, 26 Aug 2020 21:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VfXaV7Ot1lSa8F3M4QFP11oTUsc4RIqW2P8Ni4Vvi3k=;
 b=FvkxLG6VoVE/W3qV25+mpcUx9KGnCIvR9cP/DI027OQMSjUTJEkVEbt92cLK5SDbD/
 UHVM7mQ1gtqhqmeWcDi2vlQu3y2J1l55ULb5ZhYN7DhI4JOhkbBnctK8pZtuZnM9Xrmt
 XFch2KrE2+H1Y7FusDDB3OFlVjLgjrP5c84HeM2HBqusfABp0rXpCQovfA5jHHBX5mHO
 fK091Eda4unJsViWrCCsz8Qky7f+3j8DhaUqZIkviewBvvO3n3Z8gSm9f78FYkbDyy+2
 5fnqOHa3/Z/bAYmuyudcPtft0cYUL+s70Uy1N6RetNVUBXteUKi1mgpoShreNI4GylzU
 WZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VfXaV7Ot1lSa8F3M4QFP11oTUsc4RIqW2P8Ni4Vvi3k=;
 b=C2gw04QpmbBJm7F3adc1P+rmrHZSIG8DZeWe4omIU/fGCZIOHrNe0Hqv24sB8n0gtr
 J4sMxiJSAE8s/r1jV3U9FfY9g+AxqEM634J08h64muIxYmGYuueB89kAR7XZDy1ENwTv
 brcz2HvSiPUSywlWCZUOlbCSbi/TF3BBgR+Df+15JFIs82mGQ+EAw5uCKuUyblftbFC5
 m9Kj2A6ymK7RtG9OlhoPHmtIeDnBD+mGLtFGdR4+gLr7NyDVvh3C+dmn1U3vvThDZUZw
 ss/s+JpY+ftcbPMQkh2SK8+Tt2rf+uFX77FhyCry1E6WfRFcuIc5iEPKlLlVEqHZgFEP
 r/0g==
X-Gm-Message-State: AOAM530CnldBXEsiila/dOE6+9DPRcJiLGb0O1eofNcu23QX7jJnbHha
 bt1G4iaMyAZwqER8udn1787r+kbprCsxZ19D+I0=
X-Google-Smtp-Source: ABdhPJxiPd+z3Woi/CPVydxc4d5ALoYsOisEmeXn0aWdBmXlvi+FNKeUs3Edy9XlM9OaPmTX7nko4vme/6vJqKBA4u0=
X-Received: by 2002:a2e:4e09:: with SMTP id c9mr9113859ljb.283.1598504008139; 
 Wed, 26 Aug 2020 21:53:28 -0700 (PDT)
MIME-Version: 1.0
References: <1598498732-25194-1-git-send-email-u0084500@gmail.com>
 <1598498732-25194-3-git-send-email-u0084500@gmail.com>
 <b9c73699-bd84-52f7-e42d-a482036e78e0@roeck-us.net>
In-Reply-To: <b9c73699-bd84-52f7-e42d-a482036e78e0@roeck-us.net>
From: =?UTF-8?B?5ZWf5Y6f6buD?= <u0084500@gmail.com>
Date: Thu, 27 Aug 2020 12:53:16 +0800
Message-ID: <CADiBU3-PyA-BKLuSSQpWXj9_up8yWbDsSVxeqUEEkEqn9syRbw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] usb typec: mt6360: Prevent the race condition
 during module remove
To: Guenter Roeck <linux@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_005329_860339_199F3CC5 
X-CRM114-Status: GOOD (  16.50  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang <cy_huang@richtek.com>,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

R3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PiDmlrwgMjAyMOW5tDjmnIgyN+aXpSDp
gLHlm5sg5LiK5Y2IMTE6MzTlr6vpgZPvvJoKPgo+IE9uIDgvMjYvMjAgODoyNSBQTSwgY3lfaHVh
bmcgd3JvdGU6Cj4gPiBGcm9tOiBDaGlZdWFuIEh1YW5nIDxjeV9odWFuZ0ByaWNodGVrLmNvbT4K
PiA+Cj4gPiBQcmV2ZW50IHRoZSByYWNlIGNvbmRpdGlvbiBmcm9tIGludGVycnVwdCBhbmQgdGNw
Y2kgcG9ydCB1bnJlZ2lzdGVyCj4gPiBkdXJpbmcgbW9kdWxlIHJlbW92ZS4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBDaGlZdWFuIEh1YW5nIDxjeV9odWFuZ0ByaWNodGVrLmNvbT4KPgo+IFBsZWFz
ZSBzcXVhc2ggd2l0aCB0aGUgZmlyc3QgcGF0Y2ggb2YgdGhlIHNlcmllcy4KRG9uZSwgc3F1YXNo
IGludG8gdGhlIGZpcnN0IG9uZSBhbmQgcmVzZW5kIHRoZSBwYXRjaC4gVGh4Lgo+Cj4gVGhhbmtz
LAo+IEd1ZW50ZXIKPgo+ID4gLS0tCj4gPiAgZHJpdmVycy91c2IvdHlwZWMvdGNwbS90Y3BjaV9t
dDYzNjAuYyB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi90eXBlYy90Y3BtL3RjcGNpX210NjM2MC5jIGIvZHJp
dmVycy91c2IvdHlwZWMvdGNwbS90Y3BjaV9tdDYzNjAuYwo+ID4gaW5kZXggNmEyODE5My4uYTM4
MWI1ZCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNwY2lfbXQ2MzYw
LmMKPiA+ICsrKyBiL2RyaXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNwY2lfbXQ2MzYwLmMKPiA+IEBA
IC0xNjQsNiArMTY0LDcgQEAgc3RhdGljIGludCBtdDYzNjBfdGNwY19yZW1vdmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKPiA+ICB7Cj4gPiAgICAgICBzdHJ1Y3QgbXQ2MzYwX3RjcGNf
aW5mbyAqbXRpID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7Cj4gPgo+ID4gKyAgICAgZGlz
YWJsZV9pcnEobXRpLT5pcnEpOwo+ID4gICAgICAgdGNwY2lfdW5yZWdpc3Rlcl9wb3J0KG10aS0+
dGNwY2kpOwo+ID4gICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4KPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
