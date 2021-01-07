Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81805C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 10:18:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A5E42313B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 10:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A5E42313B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bmEBw3eo81vheB09gIskJlHt5UG1MaCdZW2e+ENHg6g=; b=YxtRDQQ0esY/NyEqcT0xv8kr5
	sp3JdHai0u8OEXWzd1QieJNY5Itrr4QaruLTzM6BBwdyQoOFBrkk8jDWotqB5FujiNtIEKG/DuqC7
	WwVYcjtfucsvbWRIqGMjMXVDu0zwnwtpKvbc1XZxsj85VZ347QlK0Y3w4ErsqK1y/aH7uOYYrTB8i
	leKz3aWcWqpV0r9QElLevfWeVR5+ovK3vRDAVTYNpi0yjdyJYJtGc2i88akN6KcHFD3dwQ4SBUHE4
	Yon39hpdh/DLbTPCJpQR1xfw+X/rWELLrPKDNHjUSW074JN735Q1JQocZaJYoB/ughF5kU4hmd/Pk
	/Oyb54wFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxSMa-0000q0-Rf; Thu, 07 Jan 2021 10:17:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxSMW-0000oy-Lo; Thu, 07 Jan 2021 10:17:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BB77A23356;
 Thu,  7 Jan 2021 10:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610014668;
 bh=6sb108ac5UVxYYGp+wjKpmn1DM3i6z83ytBYRl9cEg0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hH6B8lh70ZD1mRAhDD95qQrPQi2eJCkyxPUKdRaHXGFWvk5kWwkOpr8JGcMmr4J9g
 tu2A3ECZvMyoWTbpWGwp5BHqUdchbi6Q8GBZRvQ+0trW3ZhHIs1eYG4zlYmkXC5KeE
 I344mDb8l3ZW5ICrBovpiJY73YrVHCsP9U4pmfCyvSS6uI3S3mgYxOphgWLsTeu4+d
 CM42hJyJ7xFqID70fcHXWW4UYMb3L5Xqwq2aiQgj91ICb0b+4oYHRXa178czbrZy99
 RIXe8jg0ozfDjyn/YJtnFll+VCC8dHpma9ZlgM0xLu4JMBp+meDvvoawSCOZQb4Ypa
 1/yiKd1F/Q0ag==
Received: by mail-ed1-f54.google.com with SMTP id p22so7162469edu.11;
 Thu, 07 Jan 2021 02:17:47 -0800 (PST)
X-Gm-Message-State: AOAM532KsqogPJ4b0vrFMj8LQm7C3pHAA06MfooCD4dCC4ze1qqCkrbe
 2AyqV85U9hw8TlYF8Bt9TB2lqkGMar2OjHDsUQ==
X-Google-Smtp-Source: ABdhPJwFY76DPb4xZJOUEweB/1qZGG9xebnYuDZQduz4K7shnS7SUrqlKleXXx7W6MP7D9rlLuURfDRF0VERLMbkyZY=
X-Received: by 2002:a50:c3c5:: with SMTP id i5mr1159187edf.166.1610014666156; 
 Thu, 07 Jan 2021 02:17:46 -0800 (PST)
MIME-Version: 1.0
References: <1609989081-29353-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609989081-29353-3-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1609989081-29353-3-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 7 Jan 2021 18:17:34 +0800
X-Gmail-Original-Message-ID: <CAAOTY_85Ks5pa244K_G2Lp-XwmMFvK74X6M4vdM-M5Et_9Y9sQ@mail.gmail.com>
Message-ID: <CAAOTY_85Ks5pa244K_G2Lp-XwmMFvK74X6M4vdM-M5Et_9Y9sQ@mail.gmail.com>
Subject: Re: [PATCH v9, 02/11] dt-bindings: mediatek: add description for
 mt8183 display
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_051748_871999_60F1FFCC 
X-CRM114-Status: GOOD (  16.62  )
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
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 CK Hu <ck.hu@mediatek.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMeW5tDHmnIg35pelIOmAseWbmyDkuIrljYgxMToxMeWvq+mBk++8mgo+Cj4gYWRk
IGRlc2NyaXB0aW9uIGZvciBtdDgxODMgZGlzcGxheQoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0t
bmV4dCBbMV0sIHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0t
bmV4dAoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcg
Tml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiBSZXZpZXdlZC1ieTogQ2h1bi1LdWFu
ZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0IHwgMiArLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxk
aXNwLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlh
dGVrL21lZGlhdGVrLGRpc3AudHh0Cj4gaW5kZXggYjA3ODgxZS4uYzU2MmNkYSAxMDA2NDQKPiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9t
ZWRpYXRlayxkaXNwLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0Cj4gQEAgLTQzLDcgKzQzLDcgQEAg
UmVxdWlyZWQgcHJvcGVydGllcyAoYWxsIGZ1bmN0aW9uIGJsb2Nrcyk6Cj4gICAgICAgICAibWVk
aWF0ZWssPGNoaXA+LWRwaSIgICAgICAgICAgICAgICAgICAgLSBEUEkgY29udHJvbGxlciwgc2Vl
IG1lZGlhdGVrLGRwaS50eHQKPiAgICAgICAgICJtZWRpYXRlayw8Y2hpcD4tZGlzcC1tdXRleCIg
ICAgICAgICAgICAtIGRpc3BsYXkgbXV0ZXgKPiAgICAgICAgICJtZWRpYXRlayw8Y2hpcD4tZGlz
cC1vZCIgICAgICAgICAgICAgICAtIG92ZXJkcml2ZQo+IC0gIHRoZSBzdXBwb3J0ZWQgY2hpcHMg
YXJlIG10MjcwMSwgbXQ3NjIzLCBtdDI3MTIsIG10ODE2NyBhbmQgbXQ4MTczLgo+ICsgIHRoZSBz
dXBwb3J0ZWQgY2hpcHMgYXJlIG10MjcwMSwgbXQ3NjIzLCBtdDI3MTIsIG10ODE2NywgbXQ4MTcz
IGFuZCBtdDgxODMuCj4gIC0gcmVnOiBQaHlzaWNhbCBiYXNlIGFkZHJlc3MgYW5kIGxlbmd0aCBv
ZiB0aGUgZnVuY3Rpb24gYmxvY2sgcmVnaXN0ZXIgc3BhY2UKPiAgLSBpbnRlcnJ1cHRzOiBUaGUg
aW50ZXJydXB0IHNpZ25hbCBmcm9tIHRoZSBmdW5jdGlvbiBibG9jayAocmVxdWlyZWQsIGV4Y2Vw
dCBmb3IKPiAgICBtZXJnZSBhbmQgc3BsaXQgZnVuY3Rpb24gYmxvY2tzKS4KPiAtLQo+IDEuOC4x
LjEuZGlydHkKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
