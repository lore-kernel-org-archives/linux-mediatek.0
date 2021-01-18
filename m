Return-Path: <SRS0=/Mgn=GV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C0BC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 15:05:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D80FF22BEA
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 15:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D80FF22BEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Jn2EtJMJ4IKccEkgXQkFJRDKrZ4QM1kDacktTLYflkw=; b=dFGTHg5HcopD8QMrF2vTMlhuJ
	58Au8SOJWGxupdawjgUfIU1I6m7aH7Gn2BF78KW0R2md3zT7Mv/tGhTMHgD/TaoCAXnK6guW0LMue
	fw8SvyOX7IVnAb0CtW3hoUzavHpltP8GfM8N9wWBzcUSyIGeEtqDvkIsBBozZLFgw90DrmFs6YxWx
	z6PAkwImq08bIwRpUsLTXiaJ266ttkfoXdy+ITHzZMVzZvNjKypBwLKV6tSV2gvOyNslgJTMGoKd6
	1207h0OQRW9rLC1OWj3JUmP8A148zsiG/wNB2GGbwen1NQkcb0X1yQfQpeMnCaoOH3O9jqIoUfO0/
	cmcmZ+lFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1W6A-0002Ep-UZ; Mon, 18 Jan 2021 15:05:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1W67-0002E5-9W; Mon, 18 Jan 2021 15:05:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F1A922BEA;
 Mon, 18 Jan 2021 15:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610982338;
 bh=O6M1n/+xN3XivdFxg/+MeYf0/keKDicCppxhlPQcqAo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gu4q31Ni9yGfcWk46rz/cLDZVGk5skrlSQ0hEbFEU2l+cFzxD2LvJvCh+TMY7DNWw
 OsbMuu1lvYbvUuKIHXO2vMxoHqqzJLyqNyIPtzTWfpsXmIU87GkEjdXojUOOx9YY47
 Hv0daJ84K6I9xYWSAzqu3i/z6PMRjYZoNLUbNdh0TQ8358/2WoJ207Pm7xnMgLIwxX
 mhE8cPknJ6sm7Tb09I1hPPJLJRjFUfhJeLXDKka+a4aoXBEjfbzZah32BNKEMawIlp
 s96ecjh0LQnBQsbGQplb8R+rMfQqJS3imqFt81LxnkecaBOW4UJpysnFpD+wHYjbma
 akC2YMZzsTnxQ==
Received: by mail-ed1-f54.google.com with SMTP id n6so2854549edt.10;
 Mon, 18 Jan 2021 07:05:38 -0800 (PST)
X-Gm-Message-State: AOAM532gmWyW2Zsk36baHpIDMCqMKr3KzdsDjCs0RvIB+RKb6yd7t+Z4
 PukQS43lH3hRDfkbLy4OiWAvwafWQlcNLXHfxw==
X-Google-Smtp-Source: ABdhPJyfXzalDLfP+23Rji9ljj49KRJPNaWxn9PX5oQgRjG3us5FDJGuKT75vRlC9zwSL0fJPMRPsmGBGhMExyQutg0=
X-Received: by 2002:a05:6402:55:: with SMTP id
 f21mr20025590edu.38.1610982336942; 
 Mon, 18 Jan 2021 07:05:36 -0800 (PST)
MIME-Version: 1.0
References: <20210116090656.11752-1-chunfeng.yun@mediatek.com>
 <20210116090656.11752-4-chunfeng.yun@mediatek.com>
In-Reply-To: <20210116090656.11752-4-chunfeng.yun@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 18 Jan 2021 23:05:25 +0800
X-Gmail-Original-Message-ID: <CAAOTY__DtGc85JNyxWcebof5h3_Os2ugyy1P0jZsOs0Yzj2miw@mail.gmail.com>
Message-ID: <CAAOTY__DtGc85JNyxWcebof5h3_Os2ugyy1P0jZsOs0Yzj2miw@mail.gmail.com>
Subject: Re: [PATCH next 04/15] dt-bindings: phy: mediatek: hdmi-phy: modify
 compatible items
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_100539_456765_3C68C152 
X-CRM114-Status: GOOD (  13.23  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 DTML <devicetree@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIENodW5mZW5nOgoKQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPiDm
lrwgMjAyMeW5tDHmnIgxNuaXpSDpgLHlha0g5LiL5Y2INTowN+Wvq+mBk++8mgo+Cj4gVGhlIGNv
bXBhdGlsYmUgIm1lZGlhdGVrLG10NzYyMy1oZG1pLXR4IiBpcyBub3Qgc3VwcG9ydGVkIGluIGRy
aXZlciwKPiBhbmQgaW4gZmFjdCB1c2VzICJtZWRpYXRlayxtdDI3MDEtaGRtaS10eCIgaW5zdGVh
ZCBvbiBNVDc2MjMsIHNvIGNoYW5nZXMKPiB0aGUgY29tcGF0aWJsZSBpdGVtcyB0byBtYWtlIGRl
cGVuZGVuY2UgY2xlYXIuCj4KPiBDYzogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5l
bC5vcmc+Cj4gQ2M6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4gU2ln
bmVkLW9mZi1ieTogQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPgo+IC0t
LQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWssaGRtaS1waHkueWFtbCAg
ICB8IDExICsrKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3BoeS9tZWRpYXRlayxoZG1pLXBoeS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3BoeS9tZWRpYXRlayxoZG1pLXBoeS55YW1sCj4gaW5kZXggNDc1MjUxN2Ex
NDQ2Li4wZDk0OTUwYjg0Y2EgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3BoeS9tZWRpYXRlayxoZG1pLXBoeS55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9tZWRpYXRlayxoZG1pLXBoeS55YW1sCj4gQEAgLTIx
LDEwICsyMSwxMyBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgcGF0dGVybjogIl5oZG1pLXBoeUBbMC05
YS1mXSskIgo+Cj4gICAgY29tcGF0aWJsZToKPiAtICAgIGVudW06Cj4gLSAgICAgIC0gbWVkaWF0
ZWssbXQyNzAxLWhkbWktcGh5Cj4gLSAgICAgIC0gbWVkaWF0ZWssbXQ3NjIzLWhkbWktcGh5Cj4g
LSAgICAgIC0gbWVkaWF0ZWssbXQ4MTczLWhkbWktcGh5Cj4gKyAgICBvbmVPZjoKPiArICAgICAg
LSBpdGVtczoKPiArICAgICAgICAgIC0gZW51bToKPiArICAgICAgICAgICAgICAtIG1lZGlhdGVr
LG10NzYyMy1oZG1pLXBoeQo+ICsgICAgICAgICAgLSBjb25zdDogbWVkaWF0ZWssbXQyNzAxLWhk
bWktcGh5Cj4gKyAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10MjcwMS1oZG1pLXBoeQo+ICsgICAg
ICAtIGNvbnN0OiBtZWRpYXRlayxtdDgxNzMtaGRtaS1waHkKPgoKSSBsaWtlIG1vdmUgJ2l0ZW1z
JyB0byB0aGUgYm90dG9tLgoKLSBjb25zdDogbWVkaWF0ZWssbXQyNzAxLWhkbWktcGh5Ci0gY29u
c3Q6IG1lZGlhdGVrLG10ODE3My1oZG1pLXBoeQoKLSBpdGVtczoKICAtIGVudW06CiAgICAgIC0g
bWVkaWF0ZWssbXQ3NjIzLWhkbWktcGh5CiAgLSBjb25zdDogbWVkaWF0ZWssbXQyNzAxLWhkbWkt
cGh5CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPiAgICByZWc6Cj4gICAgICBtYXhJdGVtczogMQo+
IC0tCj4gMi4xOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
