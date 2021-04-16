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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E66C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 06:07:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB5BC6113D
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 06:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB5BC6113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2Gn4WHO56xvlZGRKFIAOFN1izCcy3N0coYKd5j1RELw=; b=kiQN8adBZgORFbUDpCjjH2ouh
	HhM+dsXq0OaztFsU/VtSW/Dgur8K+Q1InfF7UeNJZYRl9Jy00QUzW9vyD0Wb1LEN4ujErWo5IUrVh
	YJOaIbcdacSLLpr3FhvafR1b2ivdGNsJ7P0mNS2NNalMARN44+B26ybibc7ShEW1q8Ba5yL6uA7l4
	qM1FAmrbGmn2FqlWCjcJSuAQGEQv0dcu6RTdijnfWbnAnLq5IvyAA/eLG18UKCJzutsrpG99hiePc
	nMKNzFVNmpOfRtnc0stJTg1leGdOXyqajf3VVSMQ/Ag0UG300jIZ224wtKtmDg6czUFDxU4WEr3A3
	K+52A/Xlg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXHdO-000xUa-AE; Fri, 16 Apr 2021 06:07:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXHVq-000wD4-0p; Fri, 16 Apr 2021 05:59:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=PGyYzRPEy6FhxfIB5cecNtkEGo2GJLisHFpfnEIgv9s=; b=pJVDZ56V6hHSeAzOyzoHQftMuE
 5/aK3ONq7FnmGIHWrdq5D5xZFr+IhyRyR1hZiZMOjXEvjViL/oP6Y9ByUbsnK5zMa2Ovx4WiPBzfK
 AXdW3B3MK8o/0rI15U2qIWgv0p4ZpWbnyQAEbvkneErZ77DK1cb5brNd/dQdHTwzWWtE7JEzrZAVr
 PUCHsUILuAbxOQbqTlqZUAk9DyEmOWzeC82ThDXakRoSTnunPJMHl3LOsU25x75PqwXM8+yj2eICc
 S+KEeuW96uiHJAv6eIrixFj3GsPTL7Hbx3+pcq2Ld0ga7ZFV02vbIThTOgCKBX7Vf77mmzumJ+8xS
 6/0WVyqw==;
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXHVn-0096L4-Be; Fri, 16 Apr 2021 05:59:28 +0000
Received: by mail-ot1-x329.google.com with SMTP id
 92-20020a9d02e50000b029028fcc3d2c9eso2306837otl.0; 
 Thu, 15 Apr 2021 22:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PGyYzRPEy6FhxfIB5cecNtkEGo2GJLisHFpfnEIgv9s=;
 b=jVXRN5SAfb3UbbYemk4rVpT24rI8CKDfizfHjfn5MKCNinyhm7Jj6ckJ3/phcJajgo
 C9C60lt/WJRtIk9rbesObsMdWQO2N8Adj27ZIkAJy5m7APNVIcLF7Ow1YHwDnoOsqZf5
 AUmzNO1nqjxHGqmMkSRd7utRabQlEXvEGIdDYsI39afpoq3vFaK+u5rGJyFkDZ8U8Ahp
 ULxns0mlgQOQZ9exk23tehJ4z4+kJrTsh6TPRc2et0ev2mtsVZmfgiBXOuDjeYK18aSp
 +pADTpTOgFpkb7/tjfNESid9h/7AtsnSUYV9VI7WvND3XF+eIwCRlO2rQt+QzSkFdDsv
 vpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PGyYzRPEy6FhxfIB5cecNtkEGo2GJLisHFpfnEIgv9s=;
 b=n8hTGE/dnNfHuRzgaxUKY2JwBJI1x+V6RxVY8E+ryzGCRvxStgixIAhucJVx/6JvaL
 RwYAfBKvH1pex/O+J/7QrrAKK8NfKwB7CaDfLEJGTEB30hT3d3bIxUeqIVJzAYTpC5OQ
 RnSvWiCEGp4qSEXci4NZgtW4zi46zysmmq85kX6dXEVf0y5wAObIYjfzUgaYzgLuHdp8
 DF+17siu3broIrbFlF6FNrhQDrC7rEZEgLOAY56GdSSe2uSFF7qmlQCcACQ5X8J8ve7R
 iMpPrnMZBNApG+oUc17+m0EBF+w7T+5gkQnnmx8DUT5j7owKa9YxiwH7+MudrRSbiXD8
 4h2Q==
X-Gm-Message-State: AOAM53028rSPVkROdQ18oK7vxvrATwBJS47HL5Ocyr0ytT06ktBRRZ11
 Jg+lZDTDCDO7s7G2IX59mDL1U5lfyfvwwTgZBLc=
X-Google-Smtp-Source: ABdhPJzw8TH8HspG/Ib3hNDSuxhA1MFn02ncYre9feD3BsyVC+KHsWN7g55VIGatiTpvjHk2gaoLkqDfjQlGAzAGzDY=
X-Received: by 2002:a05:6830:15d0:: with SMTP id
 j16mr2502749otr.184.1618552766131; 
 Thu, 15 Apr 2021 22:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210415093519.1920877-1-hsinyi@chromium.org>
 <20210415093519.1920877-5-hsinyi@chromium.org>
In-Reply-To: <20210415093519.1920877-5-hsinyi@chromium.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 16 Apr 2021 07:59:17 +0200
Message-ID: <CAFqH_515cZrto3wHuUsiMtoQMHjDv-isH3LMRkkgJ+KMZFd6oQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] arm64: dts: mt8183: Add kukui-jacuzzi-kappa board
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Sean Wang <sean.wang@mediatek.com>, Ben Ho <Ben.Ho@mediatek.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_225927_419450_8F678F48 
X-CRM114-Status: GOOD (  16.52  )
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
MjEgYSBsZXMgMTE6MzY6Cj4KPiBLYXBwYSBpcyBrbm93biBhcyBIUCBDaHJvbWVib29rIDExYQo+
Cj4gU2lnbmVkLW9mZi1ieTogSHNpbi1ZaSBXYW5nIDxoc2lueWlAY2hyb21pdW0ub3JnPgoKUmV2
aWV3ZWQtYnk6IEVucmljIEJhbGxldGJvIGkgU2VycmEgPGVucmljLmJhbGxldGJvQGNvbGxhYm9y
YS5jb20+Cgo+IC0tLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL01ha2VmaWxlICAg
ICAgICAgICAgfCAgMSArCj4gIC4uLi9kdHMvbWVkaWF0ZWsvbXQ4MTgzLWt1a3VpLWphY3V6emkt
a2FwcGEuZHRzICB8IDE2ICsrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNyBp
bnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL21l
ZGlhdGVrL210ODE4My1rdWt1aS1qYWN1enppLWthcHBhLmR0cwo+Cj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvTWFrZWZpbGUgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L21lZGlhdGVrL01ha2VmaWxlCj4gaW5kZXggYTFjNTBhZGM5OGZhLi5kZjcwNjc0OTQ5Y2UgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9NYWtlZmlsZQo+ICsrKyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvTWFrZWZpbGUKPiBAQCAtMTUsNiArMTUsNyBA
QCBkdGItJChDT05GSUdfQVJDSF9NRURJQVRFSykgKz0gbXQ4MTczLWV2Yi5kdGIKPiAgZHRiLSQo
Q09ORklHX0FSQ0hfTUVESUFURUspICs9IG10ODE4My1ldmIuZHRiCj4gIGR0Yi0kKENPTkZJR19B
UkNIX01FRElBVEVLKSArPSBtdDgxODMta3VrdWktamFjdXp6aS1kYW11LmR0Ygo+ICBkdGItJChD
T05GSUdfQVJDSF9NRURJQVRFSykgKz0gbXQ4MTgzLWt1a3VpLWphY3V6emktanVuaXBlci1za3Ux
Ni5kdGIKPiArZHRiLSQoQ09ORklHX0FSQ0hfTUVESUFURUspICs9IG10ODE4My1rdWt1aS1qYWN1
enppLWthcHBhLmR0Ygo+ICBkdGItJChDT05GSUdfQVJDSF9NRURJQVRFSykgKz0gbXQ4MTgzLWt1
a3VpLWtha2FkdS5kdGIKPiAgZHRiLSQoQ09ORklHX0FSQ0hfTUVESUFURUspICs9IG10ODE4My1r
dWt1aS1rb2RhbWEtc2t1MTYuZHRiCj4gIGR0Yi0kKENPTkZJR19BUkNIX01FRElBVEVLKSArPSBt
dDgxODMta3VrdWkta29kYW1hLXNrdTI3Mi5kdGIKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9i
b290L2R0cy9tZWRpYXRlay9tdDgxODMta3VrdWktamFjdXp6aS1rYXBwYS5kdHMgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My1rdWt1aS1qYWN1enppLWthcHBhLmR0cwo+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5iM2Y0NmMxNmU1ZDcKPiAt
LS0gL2Rldi9udWxsCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMt
a3VrdWktamFjdXp6aS1rYXBwYS5kdHMKPiBAQCAtMCwwICsxLDE2IEBACj4gKy8vIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBNSVQpCj4gKy8qCj4gKyAqIENvcHlyaWdodCAy
MDIxIEdvb2dsZSBMTEMKPiArICovCj4gKwo+ICsvZHRzLXYxLzsKPiArI2luY2x1ZGUgIm10ODE4
My1rdWt1aS1qYWN1enppLmR0c2kiCj4gKwo+ICsvIHsKPiArICAgICAgIG1vZGVsID0gIkdvb2ds
ZSBrYXBwYSBib2FyZCI7Cj4gKyAgICAgICBjb21wYXRpYmxlID0gImdvb2dsZSxrYXBwYSIsICJt
ZWRpYXRlayxtdDgxODMiOwo+ICt9Owo+ICsKPiArJm10NjM1OGNvZGVjIHsKPiArICAgICAgIG1l
ZGlhdGVrLGRtaWMtbW9kZSA9IDwxPjsgLyogb25lLXdpcmUgKi8KPiArfTsKPiAtLQo+IDIuMzEu
MS4yOTUuZzllYTQ1YjYxYjgtZ29vZwo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
