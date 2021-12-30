Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84070C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Dec 2021 16:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWhySwrnzpx0k+vnzlkM7J3Ch6+VYfkMWAgGC1UcvlA=; b=wZFc/PFpuuxGFg
	oD4eE9r3mfEEsEhUXEX3MgZHOLVCnj8/EPMU8kejdaiWgpf1vgTdcKdd1vcTHC+ydOug4YBzUV00d
	oMLu5ynLaPH/jv8dglDEH+CAb97PRE7HlySfYQMdn5IwU+2sqAAE/YpsppKcyjNT93UK4FTDUIC7E
	ML1p5qAcLy/dUpg4xpVoqtg/TekLWRsZCddCIRejDsZWYJOZQAtIew4dAfHlURn+C3W7BQJ+mSmtM
	FHJqoV6yBC7hh1Epa/er88Cu/M6Ke3SeO7uI0XBSBcrl83aAE1qBVdEA5nnGbDRxXKtEn0Pj18hRa
	dYj5jJlNgsRQXqN7IauA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2yLQ-004kyT-Jg; Thu, 30 Dec 2021 16:32:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2yLF-004kwb-6c; Thu, 30 Dec 2021 16:31:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 51433B81C4B;
 Thu, 30 Dec 2021 16:31:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2301DC36AE9;
 Thu, 30 Dec 2021 16:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640881906;
 bh=DoMqZeSp31c4BdQxbZ15ZYyN+jInAOYa+pzWvuj1V+Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WAxEl4NOgOsftPaDpXfRWoi1nj9/3fBgHhYhGl4tT7fwXxVvRzy6i6pyh+KoCXk0q
 8RZ7JiL0yOC2GV7fDTUlnobaRHJNyofs7qQrBSputf0GNixgO/AaaYPWBjJVLuX09g
 UY6WwzrRDOkUyfrqtsQDdbV4pMqS7s5C56us+39ouMSTW/lGGrTDskGcyRNQ3UHYB+
 GzoO+xEf1ZGOZ9l70xvInPjANXpy5a0HDHDbURl+5luZuHGzm+wJmjUq/qdadbs3jB
 fYYvy6Ti9nRD/RK0j5WLKPou7gV351lmqiFPF1RO9IMihDfLLgbQ3+jVzA28Y0Ye6J
 +aok3dSqdoFRg==
Received: by mail-ed1-f47.google.com with SMTP id l5so65365067edj.13;
 Thu, 30 Dec 2021 08:31:46 -0800 (PST)
X-Gm-Message-State: AOAM532aGxk2vY8VUtuKPIxV0uq57a2HPUJTaUWmbLQH2Trcg920GOWp
 RjZ1f5y8VZLVfpD8r0Uq+iqZyR2wwjxUzryn8w==
X-Google-Smtp-Source: ABdhPJwwoCM4BACwhBGiZnGRAg9C++hI21NbvZwOdn/dltz/26/69d6R/OprjtD1A4ewX0f1NC+U3pEDXI3uVMzy1AQ=
X-Received: by 2002:a17:907:629a:: with SMTP id
 nd26mr26535652ejc.680.1640881904439; 
 Thu, 30 Dec 2021 08:31:44 -0800 (PST)
MIME-Version: 1.0
References: <20211224082103.7658-1-linmq006@gmail.com>
In-Reply-To: <20211224082103.7658-1-linmq006@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 31 Dec 2021 00:31:33 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-7-BrnkPk_5V5y20F6fX3X8Vm0tcYAA=1DNCnxjvNF8A@mail.gmail.com>
Message-ID: <CAAOTY_-7-BrnkPk_5V5y20F6fX3X8Vm0tcYAA=1DNCnxjvNF8A@mail.gmail.com>
Subject: Re: [PATCH] phy: mediatek: Fix missing check in mtk_mipi_tx_probe
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-phy@lists.infradead.org,
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_083149_423229_A64696FB 
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

SGksIE1pYW9xaWFuOgoKTWlhb3FpYW4gTGluIDxsaW5tcTAwNkBnbWFpbC5jb20+IOaWvCAyMDIx
5bm0MTLmnIgyNOaXpSDpgLHkupQg5LiL5Y2INDoyMeWvq+mBk++8mgo+Cj4gVGhlIG9mX2Rldmlj
ZV9nZXRfbWF0Y2hfZGF0YSgpIGZ1bmN0aW9uIG1heSByZXR1cm4gTlVMTC4KPiBBZGQgY2hlY2sg
dG8gcHJldmVudCBwb3RlbnRpYWwgbnVsbCBkZXJlZmVyZW5jZS4KPgo+IFNpZ25lZC1vZmYtYnk6
IE1pYW9xaWFuIExpbiA8bGlubXEwMDZAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3BoeS9t
ZWRpYXRlay9waHktbXRrLW1pcGktZHNpLmMgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BoeS9tZWRpYXRlay9waHktbXRr
LW1pcGktZHNpLmMgYi9kcml2ZXJzL3BoeS9tZWRpYXRlay9waHktbXRrLW1pcGktZHNpLmMKPiBp
bmRleCAyOGFkOTQwM2M0NDEuLjY3YjAwNWQ1YjllMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3Bo
eS9tZWRpYXRlay9waHktbXRrLW1pcGktZHNpLmMKPiArKysgYi9kcml2ZXJzL3BoeS9tZWRpYXRl
ay9waHktbXRrLW1pcGktZHNpLmMKPiBAQCAtMTQ2LDYgKzE0Niw4IEBAIHN0YXRpYyBpbnQgbXRr
X21pcGlfdHhfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgICAgICAgICAg
ICAgICAgcmV0dXJuIC1FTk9NRU07Cj4KPiAgICAgICAgIG1pcGlfdHgtPmRyaXZlcl9kYXRhID0g
b2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRldik7Cj4gKyAgICAgICBpZiAoIW1pcGlfdHgtPmRy
aXZlcl9kYXRhKQoKSSdtIGNvbmZ1c2VkLiBtdGtfbWlwaV90eF9wcm9iZSgpIGlzIGNhbGxlZCBi
ZWNhdXNlIHRoaXMgZGV2aWNlIG5vZGUncwpjb21wYXRpYmxlIG1hdGNoIG9uZSBpbiBtdGtfbWlw
aV90eF9tYXRjaFtdLiBTbyBJIHRoaW5rIHRoZSByZXR1cm4KdmFsdWUgb2Ygb2ZfZGV2aWNlX2dl
dF9tYXRjaF9kYXRhKGRldikgd291bGQgbm90IGJlIE5VTEwuIElmIHRoaXMgaXMKdHJ1ZSwgdGhp
cyBjaGVja2luZyBpcyByZWR1bmRhbnQuCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPiArICAgICAg
ICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4KPiAgICAgICAgIG1pcGlfdHgtPnJlZ3MgPSBkZXZt
X3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCk7Cj4gICAgICAgICBpZiAoSVNfRVJS
KG1pcGlfdHgtPnJlZ3MpKQo+IC0tCj4gMi4xNy4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
