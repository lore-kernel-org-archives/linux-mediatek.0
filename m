Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3502AC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 06:11:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A591661153
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 06:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A591661153
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nlXnPpnbKA9wJECPdnYZf4R7pcnuFEIZOQOCXJ2MhDw=; b=QdI/tHFMluQRMwe4tI1etH2ZX
	IQMCeR3/V3sOPh//F7FrWpuuE6yED1+DEa2Rof3z4wXKD4yr+FKyFn+auk9zqsUQzl/PPjsXsYOwE
	yQ1/3Fskxlk6xP3xhWcI82weQpMY5oRuJCKx30ioAYU3iC6Q3dMGAIQekGLeSNqVF/NvW/PTPdaq8
	GinYJeS/iDB4t6NVeH7vAyl9vxmsMNbhSSV636p4/05Kln5kQYOj3F9C8D+nn6UBO0dYJfFvCFcMK
	TQJbp6GcDONlZg6yIKAHnpqcTAS8gTgjJid4aUlKZrtiRQ6Sn5Dnsan/RgpunY6ygTZUtTaiIYcee
	Mu6RsJfcQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXHgf-000yPD-4z; Fri, 16 Apr 2021 06:10:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXHY6-000waq-Ak; Fri, 16 Apr 2021 06:02:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=T4qHEDweevzaKk+/Z7BMChCVb0eziZLwAYSXDX8BD/Q=; b=cfaTsq4SQeB/CXedHkQQh13O5A
 o1UUtQEDqDsgupkjFwQpfm6Rad3Ytie9eXTxVag31sXNxltF/hCChGFjPcR0jMBg6P/9nxBH4RjWv
 P8SeXveowAFVP3SWsK6nEuQC4RX/aoAfVI0iE6FTPPEx7hNcKH5GzvCx8QIli11Oswrr046cNbtyH
 zxPSSV2RPQO+DDhkXZaD0bZjT4xkOQLnMZ0SbJFX7RoQli+9XGmEHZAGCRKvlLvmgjsBqt1rW8UBx
 IW+QZ6RYGPUIRz3xU+mU+dOXeLuKiDw7fZ/VQVArdxV9OjxJJHnpMcPsIxBN+Go98q8oikpm2STDj
 Go4QBDEA==;
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXHY3-0096QR-M6; Fri, 16 Apr 2021 06:01:49 +0000
Received: by mail-ot1-x336.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so24800918otn.1; 
 Thu, 15 Apr 2021 23:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=T4qHEDweevzaKk+/Z7BMChCVb0eziZLwAYSXDX8BD/Q=;
 b=gBtm9gxXcMOgIUXbqx9Dano+Ty2CSlmYq4jCAqzvhb1V2WUOeAi2V50ECrk7ENP0Z3
 xoeNLkQH/VzHK4wZrI4yAaNTOOKF29SCeox3B1+9t4oSKKPoOGjsm1ljGPj8qlZt67EZ
 Tty/xNjM/PInqfCa9P//rKTFG6JUCZOsyyfmMMNPVctirKlbX8ob0u2PUcPoMqn+Ydzd
 9Wga1CdYoNE/ROSpb/g6yj32I4nMh4KP4CSXn2pcu9Sj1/C0L4KFb5FbCFpLP/zY5bVX
 FbDUD8iOC/JhlJrIqaqkwbvcK/vZo5m0BByG0QSg6vjdtJ2s/3Or9LGRdtBPQXrhdf58
 ov8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=T4qHEDweevzaKk+/Z7BMChCVb0eziZLwAYSXDX8BD/Q=;
 b=lXNpO9yAjcIqmI4HpEoE6yJROJiKt+t1b6vesHPqGIEXULH0ZleNGoR0BhpD74FDDg
 aU9THqOXORZw4R5RBLv7gdu6HSPe0WZPuFPbNEAp5dYnovrwE/pH03U6CLne2GrT8RON
 PcUOty4vl+vJHD/8X2cvWzHp5X/qSJrMTe8aJnRGDK2u0zp2sBo9rbxl3NtmgyzX6yC9
 lN0od4/vSBj8DKjjV5Sd36VHqhMCxKNfP8Dd/HaCq/ADZuVYFWIrM2+gnMwBFP3wN2j5
 wlY8/eO7MtYHihaYev2eNFHg+jAqvA8wnWOfERFuRyONsHjMNtOnIFHcmpyHGTY7VUgF
 ju1Q==
X-Gm-Message-State: AOAM533abhqEV2AakYWML6tdqPHnJVcKat50swe0hKWYSnwh8iI4eTTQ
 IQ17kZ7XciWRgCiGbJAk5oOWev8qIp5xAhIhG6s=
X-Google-Smtp-Source: ABdhPJyKhobAkSPrF0bBE94D2OcYfN/PyYnWg2+xNPQ+k2AGgT/bPjH/3M5KcyXX5guT86pQU+koBSKDN7y/XH2ctlQ=
X-Received: by 2002:a05:6830:15d0:: with SMTP id
 j16mr2509358otr.184.1618552906846; 
 Thu, 15 Apr 2021 23:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210415093519.1920877-1-hsinyi@chromium.org>
 <20210415093519.1920877-8-hsinyi@chromium.org>
In-Reply-To: <20210415093519.1920877-8-hsinyi@chromium.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 16 Apr 2021 08:01:38 +0200
Message-ID: <CAFqH_53t4Y-D2tvi7yySc04VeJrYQWBFtVE7ZipHvpwPN-Zy6g@mail.gmail.com>
Subject: Re: [PATCH 8/8] arm64: dts: mt8183: Add kukui-jacuzzi-kenzo board
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Sean Wang <sean.wang@mediatek.com>, Ben Ho <Ben.Ho@mediatek.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_230147_743269_6ECBE0AF 
X-CRM114-Status: GOOD (  16.35  )
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

SGkgSHNpbi1ZaSwKClRoYW5rIHlvdSBmb3IgeW91ciBwYXRjaC4KCk1pc3NhdGdlIGRlIEhzaW4t
WWkgV2FuZyA8aHNpbnlpQGNocm9taXVtLm9yZz4gZGVsIGRpYSBkai4sIDE1IGTigJlhYnIuCjIw
MjEgYSBsZXMgMTE6Mzc6Cj4KPiBLZW56byBpcyBrbm93biBhcyBBY2VyIENocm9tZWJvb2sgMzEx
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogSHNpbi1ZaSBXYW5nIDxoc2lueWlAY2hyb21pdW0ub3JnPgoK
UmV2aWV3ZWQtYnk6IEVucmljIEJhbGxldGJvIGkgU2VycmEgPGVucmljLmJhbGxldGJvQGNvbGxh
Ym9yYS5jb20+Cgo+IC0tLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL01ha2VmaWxl
ICAgICAgICAgICAgICAgIHwgIDEgKwo+ICAuLi4vYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLWt1
a3VpLWphY3V6emkta2Vuem8uZHRzIHwgMTIgKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMTMgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290
L2R0cy9tZWRpYXRlay9tdDgxODMta3VrdWktamFjdXp6aS1rZW56by5kdHMKPgo+IGRpZmYgLS1n
aXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL01ha2VmaWxlIGIvYXJjaC9hcm02NC9i
b290L2R0cy9tZWRpYXRlay9NYWtlZmlsZQo+IGluZGV4IGIzM2QwYmM1ODAyMS4uMjU3NzBkODMw
NTlkIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvTWFrZWZpbGUK
PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL01ha2VmaWxlCj4gQEAgLTE3LDYg
KzE3LDcgQEAgZHRiLSQoQ09ORklHX0FSQ0hfTUVESUFURUspICs9IG10ODE4My1rdWt1aS1qYWN1
enppLWJ1cm5ldC5kdGIKPiAgZHRiLSQoQ09ORklHX0FSQ0hfTUVESUFURUspICs9IG10ODE4My1r
dWt1aS1qYWN1enppLWRhbXUuZHRiCj4gIGR0Yi0kKENPTkZJR19BUkNIX01FRElBVEVLKSArPSBt
dDgxODMta3VrdWktamFjdXp6aS1qdW5pcGVyLXNrdTE2LmR0Ygo+ICBkdGItJChDT05GSUdfQVJD
SF9NRURJQVRFSykgKz0gbXQ4MTgzLWt1a3VpLWphY3V6emkta2FwcGEuZHRiCj4gK2R0Yi0kKENP
TkZJR19BUkNIX01FRElBVEVLKSArPSBtdDgxODMta3VrdWktamFjdXp6aS1rZW56by5kdGIKPiAg
ZHRiLSQoQ09ORklHX0FSQ0hfTUVESUFURUspICs9IG10ODE4My1rdWt1aS1qYWN1enppLXdpbGxv
dy1za3UwLmR0Ygo+ICBkdGItJChDT05GSUdfQVJDSF9NRURJQVRFSykgKz0gbXQ4MTgzLWt1a3Vp
LWphY3V6emktd2lsbG93LXNrdTEuZHRiCj4gIGR0Yi0kKENPTkZJR19BUkNIX01FRElBVEVLKSAr
PSBtdDgxODMta3VrdWkta2FrYWR1LmR0Ygo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL21lZGlhdGVrL210ODE4My1rdWt1aS1qYWN1enppLWtlbnpvLmR0cyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLWt1a3VpLWphY3V6emkta2Vuem8uZHRzCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjZmMWFhNjkyNzUzYQo+IC0tLSAv
ZGV2L251bGwKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My1rdWt1
aS1qYWN1enppLWtlbnpvLmR0cwo+IEBAIC0wLDAgKzEsMTIgQEAKPiArLy8gU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIE1JVCkKPiArLyoKPiArICogQ29weXJpZ2h0IDIwMjEg
R29vZ2xlIExMQwo+ICsgKi8KPiArCj4gKy9kdHMtdjEvOwo+ICsjaW5jbHVkZSAibXQ4MTgzLWt1
a3VpLWphY3V6emktanVuaXBlci5kdHNpIgo+ICsKPiArLyB7Cj4gKyAgICAgICBtb2RlbCA9ICJH
b29nbGUga2Vuem8gc2t1MTcgYm9hcmQiOwo+ICsgICAgICAgY29tcGF0aWJsZSA9ICJnb29nbGUs
anVuaXBlci1za3UxNyIsICJnb29nbGUsanVuaXBlciIsICJtZWRpYXRlayxtdDgxODMiOwo+ICt9
Owo+IC0tCj4gMi4zMS4xLjI5NS5nOWVhNDViNjFiOC1nb29nCj4KPgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
