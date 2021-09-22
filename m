Return-Path: <SRS0=6VVk=OM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0898C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Sep 2021 16:19:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9123361168
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Sep 2021 16:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9123361168
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K46GjWFnjxe/rilwoLOvlsj+fKZS45qmVSiIzhY1Rg4=; b=O9DVH1HB6z24ma
	aa1bj3BpyJrHcwc/FGvqfitzp3meJON+iRvblJ9rhAv0OOcuL/q+rt487++mwnIFA8cwc7yBqm38c
	3FdR4YV7E6NayAICJ4Hkf01kTuvLCj6yrNtfPTA1qDJ9zv2vgAKzk5pSAkiwZGSYZBNGv4PEwCJ1B
	8D+DW6xMp1r78xRP4EYNpt+PQViR/OFjOU8opIOgMc5gpUueEv39gMagCi8oYNJM4jixN65Cw2O82
	R5Oj0aV3aw74stO3HxJHNJL9te5IXdEpNsd8SNIOsF0xrDD75YH7k4SoK2wupHe7iLush9JN85Sf5
	IlgbIxYCHFO1nw/N8s3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mT4xh-0096VV-N7; Wed, 22 Sep 2021 16:19:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mT4xR-0096RF-Hp; Wed, 22 Sep 2021 16:18:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE93B61247;
 Wed, 22 Sep 2021 16:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632327532;
 bh=hBAsvrZV+yB9m6NQkJEZNKVRMGBNiMFtAVk+tAPOY9Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tvBDjXnxpOCJ0Q2yUYHVlM4RcUAK7bmcQrWaf8cpMP0CpMj4/OPX4tjAAbr01BJ6x
 hgFDhOzlOqA/hPGrQBVZ2ZjI9u2NDeJMI9z+yYYStOmB5YlB8aaaQBcfZnEsTTwq20
 BhW6M4sFyWb//tBKLuZ8vV/nTpl2f5hjQ4x7rq3g8qL4lQwsNG/AJVtoKTbG3C2BTg
 lMLlVqkgoDP3ZMrOvMIIjJ5/JHJS6GL0kEPH0Tt9QItD9mWS3XLH3u9zhEsHFKNjfC
 roXWTs2IpYgemMSg1fHCgnGhgewzQPuXb6AvhgzVSCmHiTtNXE2BNYcy2Hk3bdx3fS
 nkHEsWWaYdU2A==
Received: by mail-ed1-f46.google.com with SMTP id co2so11826881edb.8;
 Wed, 22 Sep 2021 09:18:52 -0700 (PDT)
X-Gm-Message-State: AOAM531VNQ8MGWhL5Ra+VJK86dhbHUQDcK4cqa8/NTp8q/XS04g6z2pr
 525Ho21hqcvOAUSbvilAOtgmUWf+W2irDJTI+Q==
X-Google-Smtp-Source: ABdhPJz8tVsKtk6yn9u+71rcMAgS0BuyzKIk3KLCLhFxiOLPm8SNwNUm1S5K8ylJ5RD8JjnCsHo+3ja0ifSpdXbFmNM=
X-Received: by 2002:a17:906:3181:: with SMTP id 1mr455229ejy.388.1632327531346; 
 Wed, 22 Sep 2021 09:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210907083723.7725-1-granquet@baylibre.com>
 <20210907083723.7725-5-granquet@baylibre.com>
 <1631026304.913177.3958449.nullmailer@robh.at.kernel.org>
In-Reply-To: <1631026304.913177.3958449.nullmailer@robh.at.kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 23 Sep 2021 00:18:40 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8dpL2q4H9wHOusCtODAHos_rL2_p8BGhsGEkAFLeV1FQ@mail.gmail.com>
Message-ID: <CAAOTY_8dpL2q4H9wHOusCtODAHos_rL2_p8BGhsGEkAFLeV1FQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: display: mediatek: add MT8195 hdmi
 bindings
To: Rob Herring <robh@kernel.org>
Cc: Guillaume Ranquet <granquet@baylibre.com>, David Airlie <airlied@linux.ie>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 DTML <devicetree@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, CK Hu <ck.hu@mediatek.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Daniel Vetter <daniel@ffwll.ch>, Jitao shi <jitao.shi@mediatek.com>,
 linux-phy@lists.infradead.org, 
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210922_091853_664491_C013F3B6 
X-CRM114-Status: GOOD (  18.71  )
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

SGksIEd1aWxsYXVtZToKClJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IOaWvCAyMDIx5bm0
OeaciDfml6Ug6YCx5LqMIOS4i+WNiDEwOjUx5a+r6YGT77yaCj4KPiBPbiBUdWUsIDA3IFNlcCAy
MDIxIDEwOjM3OjIxICswMjAwLCBHdWlsbGF1bWUgUmFucXVldCB3cm90ZToKPiA+IEFkZCBNZWRp
YXRlayBIRE1JIGFuZCBIRE1JLUREQyBiaW5kaW5ncyBmb3IgTVQ4MTk1IFNvQy4KCk1vdmUgdGhp
cyBwYXRjaCBiZWZvcmUgdGhlIGRyaXZlciBwYXRjaCB3aGljaCByZWZlciB0byB0aGlzIHBhdGNo
LgoKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdWlsbGF1bWUgUmFucXVldCA8Z3JhbnF1ZXRAYmF5
bGlicmUuY29tPgo+ID4gLS0tCj4gPiAgLi4uL21lZGlhdGVrL21lZGlhdGVrLG10ODE5NS1oZG1p
LWRkYy55YW1sICAgIHwgNDYgKysrKysrKysrCj4gPiAgLi4uL21lZGlhdGVrL21lZGlhdGVrLG10
ODE5NS1oZG1pLnlhbWwgICAgICAgIHwgOTkgKysrKysrKysrKysrKysrKysrKwo+ID4gIDIgZmls
ZXMgY2hhbmdlZCwgMTQ1IGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWss
bXQ4MTk1LWhkbWktZGRjLnlhbWwKCkkgdGhpbmsgdGhpcyBmaWxlIHNob3VsZCBiZSBtZXJnZWQg
aW50byBtZWRpYXRlayxoZG1pLWRkYy55YW1sIFsxXS4KClsxXSBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxo
ZG1pLWRkYy55YW1sP2g9djUuMTUtcmMyCgo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtdDgx
OTUtaGRtaS55YW1sCgpJIHRoaW5rIHRoaXMgZmlsZSBzaG91bGQgYmUgbWVyZ2VkIGludG8gbWVk
aWF0ZWssaGRtaS55YW1sIFsyXS4KClsyXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxoZG1pLnlhbWw/aD12
NS4xNS1yYzIKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ID4KPgo+IE15IGJvdCBmb3VuZCBlcnJv
cnMgcnVubmluZyAnbWFrZSBEVF9DSEVDS0VSX0ZMQUdTPS1tIGR0X2JpbmRpbmdfY2hlY2snCj4g
b24geW91ciBwYXRjaCAoRFRfQ0hFQ0tFUl9GTEFHUyBpcyBuZXcgaW4gdjUuMTMpOgo+Cj4geWFt
bGxpbnQgd2FybmluZ3MvZXJyb3JzOgo+Cj4gZHRzY2hlbWEvZHRjIHdhcm5pbmdzL2Vycm9yczoK
PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRp
YXRlayxtdDgxOTUtaGRtaS5leGFtcGxlLmR0czoxOToxODogZmF0YWwgZXJyb3I6IGR0LWJpbmRp
bmdzL2Nsb2NrL210ODE5NS1jbGsuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+ICAgIDE5
IHwgICAgICAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svbXQ4MTk1LWNsay5oPgo+ICAg
ICAgIHwgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+
IGNvbXBpbGF0aW9uIHRlcm1pbmF0ZWQuCj4gbWFrZVsxXTogKioqIFtzY3JpcHRzL01ha2VmaWxl
LmxpYjozNzk6IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlh
dGVrL21lZGlhdGVrLG10ODE5NS1oZG1pLmV4YW1wbGUuZHQueWFtbF0gRXJyb3IgMQo+IG1ha2Vb
MV06ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCj4gbWFrZTogKioqIFtNYWtl
ZmlsZToxNDM4OiBkdF9iaW5kaW5nX2NoZWNrXSBFcnJvciAyCj4KPiBkb2MgcmVmZXJlbmNlIGVy
cm9ycyAobWFrZSByZWZjaGVja2RvY3MpOgo+Cj4gU2VlIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFi
cy5vcmcvcGF0Y2gvMTUyNTE3MAo+Cj4gVGhpcyBjaGVjayBjYW4gZmFpbCBpZiB0aGVyZSBhcmUg
YW55IGRlcGVuZGVuY2llcy4gVGhlIGJhc2UgZm9yIGEgcGF0Y2gKPiBzZXJpZXMgaXMgZ2VuZXJh
bGx5IHRoZSBtb3N0IHJlY2VudCByYzEuCj4KPiBJZiB5b3UgYWxyZWFkeSByYW4gJ21ha2UgZHRf
YmluZGluZ19jaGVjaycgYW5kIGRpZG4ndCBzZWUgdGhlIGFib3ZlCj4gZXJyb3IocyksIHRoZW4g
bWFrZSBzdXJlICd5YW1sbGludCcgaXMgaW5zdGFsbGVkIGFuZCBkdC1zY2hlbWEgaXMgdXAgdG8K
PiBkYXRlOgo+Cj4gcGlwMyBpbnN0YWxsIGR0c2NoZW1hIC0tdXBncmFkZQo+Cj4gUGxlYXNlIGNo
ZWNrIGFuZCByZS1zdWJtaXQuCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
