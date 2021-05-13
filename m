Return-Path: <SRS0=rIjB=KI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E7ADC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 00:07:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD92C61412
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 00:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD92C61412
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Etteo5IRQAzesL1jJB/Tyi+3sG0N0Q5GefoqDz3qJZs=; b=jFSqY4pXtFzddYEAQYhPYDnPs
	UumOGuRYAbw18p2Lxpmh3jgt2vJyLAg1o9obuLdXFAzUCqHy8mvYs0F3Ei7SWyrRPXnUjkrq8Zi0J
	eYsUsQmFbjMRqPsiaRvK9EgZ8UHkzi1cNQRxGfz+JKZZM+L+0NwO9Ur1qtxHq4zJ0nYq0m3IBrsfL
	gaLw5JGlDpx4amf7rsjN+W7KuA3lFLndW5vhRRo0t5ZehhH9wGN8pdCW0/Z+8NRXWE0ROtB/yFwus
	h6Xk0qsAtoHlpxw50ceiZEOXesEZXbxOmpTNz471mkrw+/elaVzA5vloYFAbj00BS/fmTDRTjkdk3
	xbDDqIEdw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgysw-004HlK-O3; Thu, 13 May 2021 00:07:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgysg-004Hk2-7P; Thu, 13 May 2021 00:07:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=mtsZQjBZ4Kn2gA4I7stRuzSsrzZRsTIVV5x2h3wk2lU=; b=4+Zh+Y3Ze3Rr3PWO7IAbpcSDWC
 JWhs4wlT+aAhfZEUbH1iGawCSRq4xUEPXEXz3uKBR5f7gvkRci2/XQBHqUlgBF7nY23dw2Cb4qgq1
 wRt5s+0ptVkRjq9djXoDTbtS8zQmz3u1fUfo8W0OSRVTAVlfv+MXR6avwQvcWFvIqIhp4XJ1Dr/QZ
 Z9v4pCeiMz/vjPyDJHZxtK1uSszZZk16qruZP6yYZO1cv5jBYTvf7Ix0Y6qTfZmBm2VsdPQ+uOkMI
 S9AAtJNKGV5D2wlasiDjehREsXxetJ3+rY7k5GoFbzehDpUg3YOdTDswBsWkv3SiCw1C2jBB2PKhD
 qqNN5o3Q==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgysd-00AvG3-A3; Thu, 13 May 2021 00:07:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3AA7361405;
 Thu, 13 May 2021 00:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620864426;
 bh=v2Nqrzk8IMsTBDnwOsCTq2LatPsRSKHVbANck2rKQ8o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QITqSl9VhSZwPCtmR6nhxI1fDkmIBopcdtEI0C2u5AFCsqvKozQIeO1AfTOKvm73I
 JHxXVjs6V1Fkl+tgfvxkv9HRu1FPEq7ZK+MGeQGN4WIqDP/hWBwP+hI953RjlgO26r
 3ofNU3OLpGJNDSbemkAQsCStml7pzuMgN1bplo2yrzaXQydqd1pijrdwUEK0JtzEK1
 Qf9xiQT8Gt/ftUr39L7fWm/G31VcT2/zDKGDjxnd6MCWtBiW+HCjrHuzSaESKpbS2f
 QdP1Hhqo4bdqGPPFzE2Us/Ha/udH91kWHfNPUe+CBdlx3qH8II1PVmhSnF0Lej6muD
 5DKHY63tzl3Jg==
Received: by mail-ej1-f47.google.com with SMTP id n2so37487182ejy.7;
 Wed, 12 May 2021 17:07:06 -0700 (PDT)
X-Gm-Message-State: AOAM533oxEgK1hCS5MrM6bJTOAw8CK5a16ztFaM//06Qncxl9h1uWD7A
 Jy+7c2cayivF3hnQy6fnRVVlYyYA4HogHjnNNg==
X-Google-Smtp-Source: ABdhPJyfh9opbiHkboCndggh2+uLHJvaZkDGaqHLCtZT/4YagZu6vDBz+VrubRjLiXkTfTnqyKa2x9kZeO9mRpM4LKo=
X-Received: by 2002:a17:906:b755:: with SMTP id
 fx21mr941485ejb.267.1620864424849; 
 Wed, 12 May 2021 17:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210419073244.2678688-1-narmstrong@baylibre.com>
In-Reply-To: <20210419073244.2678688-1-narmstrong@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 13 May 2021 08:06:54 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-amQXXF2Opi6vddosnx94TMPw5xDQy5peHpsrXSp0h4g@mail.gmail.com>
Message-ID: <CAAOTY_-amQXXF2Opi6vddosnx94TMPw5xDQy5peHpsrXSp0h4g@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] mediatek: hdmi: add MT8167 configuration
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_170707_434472_2DCEF91F 
X-CRM114-Status: GOOD (  11.64  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE5laWw6CgpOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+IOaWvCAy
MDIx5bm0NOaciDE55pelIOmAseS4gCDkuIvljYgzOjMz5a+r6YGT77yaCj4KPiBUaGUgTVQ4MTY3
IFNvQyBoYXZlIGEgaGFyZCBsaW1pdCBvbiB0aGUgbWF4aW1hbCBzdXBwb3J0ZWQgSERNSSBUTURT
IGNsb2NrLAo+IGFuZCBpcyBub3QgdmFsaWRhdGVkIGFuZCBzdXBwb3J0ZWQgZm9yIEhETUkgbW9k
ZXMgb3V0IG9mIEhETUkgQ0VBIG1vZGVzLgoKRm9yIHRoaXMgc2VyaWVzLCBhcHBsaWVkIHRvIG1l
ZGlhdGVrLWRybS1uZXh0IFsxXSwgdGhhbmtzLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLz9oPW1l
ZGlhdGVrLWRybS1uZXh0CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IFRvIGFjaGlldmUgdGhp
czoKPiAtIHN3aXRjaCB0aGUgbWVkaWF0ZWsgSERNSSBiaW5kaW5ncyB0byBZQU1MCj4gLSBhZGQg
dGhlIE1UODE2NyBjb21wYXRpYmxlCj4gLSBhZGQgYSBib29sZWFuIHRvIGRpc2NhcmQgdGhlIG5v
bi1DRUEgbW9kZXMKPiAtIGFkZCBhIHZhbHVlIHRvIHNwZWNpZnkgbWFjIFRNRFMgc3VwcG9ydGVk
IGNsb2NrCj4gLSBhZGQgYSBjb25mIGVudHJ5IGZvciB0aGUgTVQ4MTY3IGNvbXBhdGlibGUKPgo+
IENoYW5nZXMgc2luY2UgdjQ6Cj4gLSBmaXhlZCBiaW5kaW5ncwo+Cj4gTmVpbCBBcm1zdHJvbmcg
KDUpOgo+ICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IG1lZGlhdGVrLGhkbWk6IENvbnZlcnQgdG8g
dXNlIGdyYXBoIHNjaGVtYQo+ICAgZHQtYmluZGluZ3M6IG1lZGlhdGVrOiBhZGQgbXQ4MTY3IHRv
IGhkbWksIGhkbWktZGRjIGFuZCBjZWMgYmluZGluZ3MKPiAgIGdwdS9kcm06IG1lZGlhdGVrOiBo
ZG1pOiBhZGQgY2hlY2sgZm9yIENFQSBtb2RlcyBvbmx5Cj4gICBncHUvZHJtOiBtZWRpYXRlazog
aGRtaTogYWRkIG9wdGlvbmFsIGxpbWl0IG9uIG1heGltYWwgSERNSSBtb2RlIGNsb2NrCj4gICBn
cHUvZHJtOiBtZWRpYXRlazogaGRtaTogYWRkIE1UODE2NyBjb25maWd1cmF0aW9uCj4KPiAgLi4u
L2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssY2VjLnlhbWwgICAgICAgIHwgIDUyICsrKysrKysK
PiAgLi4uL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssaGRtaS1kZGMueWFtbCAgIHwgIDU4ICsr
KysrKysrCj4gIC4uLi9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGhkbWkudHh0ICAgICAgICB8
IDEzNiAtLS0tLS0tLS0tLS0tLS0tLS0KPiAgLi4uL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWss
aGRtaS55YW1sICAgICAgIHwgMTMzICsrKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfaGRtaS5jICAgICAgICAgICB8ICAxNyArKysKPiAgNSBmaWxlcyBjaGFu
Z2VkLCAyNjAgaW5zZXJ0aW9ucygrKSwgMTM2IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsv
bWVkaWF0ZWssY2VjLnlhbWwKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGhkbWktZGRjLnlhbWwK
PiAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGhkbWkudHh0Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRl
ayxoZG1pLnlhbWwKPgo+IC0tCj4gMi4yNS4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
