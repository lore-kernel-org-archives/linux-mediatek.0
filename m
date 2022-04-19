Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB79C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 15:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=56WBu5lTvvWUvAK9B3zd+HtoWPnk/P23038k+cZmW0I=; b=mVOEHcGCu1wxez
	dkPT7Aj2cJHAzmCIMaOxhYYWDptynRZg3jjFNkgLhhkZAlREtM00TBrUihisyIG8/1gQfkuCInd1A
	5a3Ff04gNTBjya5bmIGuzKQl1w5kDUtmTXj9RWjDdCT5PzPI25b1dtZpLHY2Pzt6ZfCegwL8X/Fuj
	J9yCep+3NXmR2HPlubIhFdV8fJK75Bc2lIsU6eZZCmYmQn3Lw9dpFcSOBNmcmQRufQWzTZYCVZONP
	c0FsjTyZzjKJE9aCHyMGRDUSKzOt4Wttz6BBQhkf4xdtckBrno3Bkc5YKIWXHA6f5ydrd/oNqIQqU
	o5vbkMI1QEccCuMfxJRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngq8v-004oXA-D6; Tue, 19 Apr 2022 15:51:53 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngq8b-004oPb-C2; Tue, 19 Apr 2022 15:51:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 231B3B81B83;
 Tue, 19 Apr 2022 15:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757F6C385AF;
 Tue, 19 Apr 2022 15:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650383489;
 bh=O4kGVoQeyYUokLkOOMtZf5WOtbhgJryyxOH96kgYGWg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=klJHKV5I+g2Y1d16IPc8lyj1aPp+9M5Mz4/MZb8GLEi2UzIvqnRpna2bs6GRg/RvB
 DIRSqYsV/a/EX4sbCleHHU5NWQUqS7OEu3dcDv6n0iWPz7gx2C58sfCyTqB8hstH2T
 V1v8Ccuy0wGWLTQIjc15N8ITf7AQKRYKDZuKuXkCmU194O32ViY4PClMNKd+yhH8p5
 HviGRNHbYUXKiGsfzeRocm5BCRBhVIc/95trLdt/hgYu2l41XA2QdYhlMxm45CVsmM
 Q4wUpVtraPwZ859xkSJkO5Fb5KcPTsgG8jEa0oK/SCJf8npZOsac3S26ihnoj5ohGx
 Zct9bEjLhlP6A==
Received: by mail-ed1-f43.google.com with SMTP id c6so21834707edn.8;
 Tue, 19 Apr 2022 08:51:29 -0700 (PDT)
X-Gm-Message-State: AOAM531aOP9HUM0YntmzdKgt0k6TDVdAxhQ7TAGF1lrPgFxeDuav0R1L
 vQyirT1K4qMIHEDWr1CS1Wxvqd7Wd6ifV2i5Tg==
X-Google-Smtp-Source: ABdhPJxRQq1KhhEnyhwExUKH5+pHmDmDmtEOzqa8MsO/Bzy4bhTSovBUc9c64I5QmB4PSBJ5skgDN0lf1caFPvqdiLw=
X-Received: by 2002:a50:d4d9:0:b0:41d:6ee0:80d with SMTP id
 e25-20020a50d4d9000000b0041d6ee0080dmr17812286edj.254.1650383487528; Tue, 19
 Apr 2022 08:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220419033237.23405-1-rex-bc.chen@mediatek.com>
 <20220419033237.23405-4-rex-bc.chen@mediatek.com>
 <74b3f0e3-1d9f-de9e-ccf0-1f2174ba7c25@gmail.com>
In-Reply-To: <74b3f0e3-1d9f-de9e-ccf0-1f2174ba7c25@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 19 Apr 2022 23:51:16 +0800
X-Gmail-Original-Message-ID: <CAAOTY__u3q1YcNwGpyEUpRbThsg6U1-gYtaqtGgy2J4jMwSOUg@mail.gmail.com>
Message-ID: <CAAOTY__u3q1YcNwGpyEUpRbThsg6U1-gYtaqtGgy2J4jMwSOUg@mail.gmail.com>
Subject: Re: [PATCH 3/5] dt-bindings: mediatek: add vdosys1 RDMA definition
 for mt8195
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rex-BC Chen <rex-bc.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 krzysztof.kozlowski+dt@linaro.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jason-JH Lin <jason-jh.lin@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 DTML <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_085133_731803_08D89E0D 
X-CRM114-Status: GOOD (  26.72  )
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

TWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4g5pa8IDIwMjLlubQ05pyI
MTnml6Ug6YCx5LqMIOS4i+WNiDEwOjU35a+r6YGT77yaCj4KPgo+Cj4gT24gMTkvMDQvMjAyMiAw
NTozMiwgUmV4LUJDIENoZW4gd3JvdGU6Cj4gPiBGcm9tOiAiTmFuY3kuTGluIiA8bmFuY3kubGlu
QG1lZGlhdGVrLmNvbT4KPiA+Cj4gPiBBZGQgdmRvc3lzMSBSRE1BIGRlZmluaXRpb24uCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogTmFuY3kuTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPgo+ID4g
UmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5v
LmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+Cj4gPiAtLS0KPiA+ICAgLi4uL2Rpc3BsYXkvbWVkaWF0
ZWsvbWVkaWF0ZWssbWRwLXJkbWEueWFtbCAgIHwgODYgKysrKysrKysrKysrKysrKysrKwo+ID4g
ICAxIGZpbGUgY2hhbmdlZCwgODYgaW5zZXJ0aW9ucygrKQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVk
aWF0ZWssbWRwLXJkbWEueWFtbAo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtZHAtcmRtYS55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVk
aWF0ZWssbWRwLXJkbWEueWFtbAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAw
MDAwMDAwMDAwMC4uNmFiNzczNTY5NDYyCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxt
ZHAtcmRtYS55YW1sCj4gPiBAQCAtMCwwICsxLDg2IEBACj4gPiArIyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4gPiArJVlBTUwgMS4yCj4g
PiArLS0tCj4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9hcm0vbWVkaWF0
ZWsvbWVkaWF0ZWssbWRwLXJkbWEueWFtbCMKPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+ICsKPiA+ICt0aXRsZTogTWVkaWFUZWsg
TURQIFJETUEKPiA+ICsKPiA+ICttYWludGFpbmVyczoKPiA+ICsgIC0gTWF0dGhpYXMgQnJ1Z2dl
ciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4KPgo+IEkgZG9uJ3QgdGhpbmsgSSB3b3VsZCBiZSB0
aGUgY29ycmVjdCBwZXJzb24gdG8gbWFpbnRhaW4gdGhpcy4gVGhpcyBzaG91bGQgYmUgdGhlCj4g
cGVyc29uIHRoYXQgaXMgbWFpbnRhaW5pbmcgdGhlIGRyaXZlci4KCkFncmVlLiBUaGlzIHNob3Vs
ZCBiZQoKQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+ClBoaWxpcHAgWmFi
ZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IFJl
Z2FyZHMsCj4gTWF0dGhpYXMKPgo+ID4gKwo+ID4gK2Rlc2NyaXB0aW9uOiB8Cj4gPiArICBUaGUg
bWVkaWF0ZWsgTURQIFJETUEgc3RhbmRzIGZvciBSZWFkIERpcmVjdCBNZW1vcnkgQWNjZXNzLgo+
ID4gKyAgSXQgcHJvdmlkZXMgcmVhbCB0aW1lIGRhdGEgdG8gdGhlIGJhY2stZW5kIHBhbmVsIGRy
aXZlciwgc3VjaCBhcyBEU0ksCj4gPiArICBEUEkgYW5kIERQX0lOVEYuCj4gPiArICBJdCBjb250
YWlucyBvbmUgbGluZSBidWZmZXIgdG8gc3RvcmUgdGhlIHN1ZmZpY2llbnQgcGl4ZWwgZGF0YS4K
PiA+ICsgIFJETUEgZGV2aWNlIG5vZGUgbXVzdCBiZSBzaWJsaW5ncyB0byB0aGUgY2VudHJhbCBN
TVNZU19DT05GSUcgbm9kZS4KPiA+ICsgIEZvciBhIGRlc2NyaXB0aW9uIG9mIHRoZSBNTVNZU19D
T05GSUcgYmluZGluZywgc2VlCj4gPiArICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvYXJtL21lZGlhdGVrL21lZGlhdGVrLG1tc3lzLnlhbWwgZm9yIGRldGFpbHMuCj4gPiArCj4g
PiArcHJvcGVydGllczoKPiA+ICsgIGNvbXBhdGlibGU6Cj4gPiArICAgIG9uZU9mOgo+ID4gKyAg
ICAgIC0gaXRlbXM6Cj4gPiArICAgICAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE5NS12ZG8x
LXJkbWEKPiA+ICsKPiA+ICsgIHJlZzoKPiA+ICsgICAgbWF4SXRlbXM6IDEKPiA+ICsKPiA+ICsg
IGludGVycnVwdHM6Cj4gPiArICAgIG1heEl0ZW1zOiAxCj4gPiArCj4gPiArICBwb3dlci1kb21h
aW5zOgo+ID4gKyAgICBkZXNjcmlwdGlvbjogQSBwaGFuZGxlIGFuZCBQTSBkb21haW4gc3BlY2lm
aWVyIGFzIGRlZmluZWQgYnkgYmluZGluZ3Mgb2YKPiA+ICsgICAgICB0aGUgcG93ZXIgY29udHJv
bGxlciBzcGVjaWZpZWQgYnkgcGhhbmRsZS4gU2VlCj4gPiArICAgICAgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VyL3Bvd2VyLWRvbWFpbi55YW1sIGZvciBkZXRhaWxzLgo+
ID4gKwo+ID4gKyAgY2xvY2tzOgo+ID4gKyAgICBpdGVtczoKPiA+ICsgICAgICAtIGRlc2NyaXB0
aW9uOiBSRE1BIENsb2NrCj4gPiArCj4gPiArICBpb21tdXM6Cj4gPiArICAgIGRlc2NyaXB0aW9u
Ogo+ID4gKyAgICAgIFRoaXMgcHJvcGVydHkgc2hvdWxkIHBvaW50IHRvIHRoZSByZXNwZWN0aXZl
IElPTU1VIGJsb2NrIHdpdGggbWFzdGVyIHBvcnQgYXMgYXJndW1lbnQsCj4gPiArICAgICAgc2Vl
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pb21tdS9tZWRpYXRlayxpb21tdS55
YW1sIGZvciBkZXRhaWxzLgo+ID4gKwo+ID4gKyAgbWVkaWF0ZWssZ2NlLWNsaWVudC1yZWc6Cj4g
PiArICAgIGRlc2NyaXB0aW9uOgo+ID4gKyAgICAgIFRoZSByZWdpc3RlciBvZiBkaXNwbGF5IGZ1
bmN0aW9uIGJsb2NrIHRvIGJlIHNldCBieSBnY2UuIFRoZXJlIGFyZSA0IGFyZ3VtZW50cywKPiA+
ICsgICAgICBzdWNoIGFzIGdjZSBub2RlLCBzdWJzeXMgaWQsIG9mZnNldCBhbmQgcmVnaXN0ZXIg
c2l6ZS4gVGhlIHN1YnN5cyBpZCB0aGF0IGlzCj4gPiArICAgICAgbWFwcGluZyB0byB0aGUgcmVn
aXN0ZXIgb2YgZGlzcGxheSBmdW5jdGlvbiBibG9ja3MgaXMgZGVmaW5lZCBpbiB0aGUgZ2NlIGhl
YWRlcgo+ID4gKyAgICAgIGluY2x1ZGUvaW5jbHVkZS9kdC1iaW5kaW5ncy9nY2UvPGNoaXA+LWdj
ZS5oIG9mIGVhY2ggY2hpcHMuCj4gPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2Rl
ZmluaXRpb25zL3BoYW5kbGUtYXJyYXkKPiA+ICsgICAgbWF4SXRlbXM6IDEKPiA+ICsKPiA+ICty
ZXF1aXJlZDoKPiA+ICsgIC0gY29tcGF0aWJsZQo+ID4gKyAgLSByZWcKPiA+ICsgIC0gcG93ZXIt
ZG9tYWlucwo+ID4gKyAgLSBjbG9ja3MKPiA+ICsgIC0gaW9tbXVzCj4gPiArCj4gPiArYWRkaXRp
b25hbFByb3BlcnRpZXM6IGZhbHNlCj4gPiArCj4gPiArZXhhbXBsZXM6Cj4gPiArICAtIHwKPiA+
ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybS1naWMu
aD4KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL210ODE5NS1jbGsuaD4KPiA+
ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Bvd2VyL210ODE5NS1wb3dlci5oPgo+ID4gKyAg
ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZ2NlL210ODE5NS1nY2UuaD4KPiA+ICsgICAgI2luY2x1
ZGUgPGR0LWJpbmRpbmdzL21lbW9yeS9tdDgxOTUtbWVtb3J5LXBvcnQuaD4KPiA+ICsKPiA+ICsg
ICAgc29jIHsKPiA+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+Owo+ID4gKyAgICAgICAg
I3NpemUtY2VsbHMgPSA8Mj47Cj4gPiArCj4gPiArICAgICAgICB2ZG8xX3JkbWEwOiBtZHAtcmRt
YUAxYzEwNDAwMCB7Cj4gPiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgx
OTUtdmRvMS1yZG1hIjsKPiA+ICsgICAgICAgICAgICByZWcgPSA8MCAweDFjMTA0MDAwIDAgMHgx
MDAwPjsKPiA+ICsgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNDk1IElSUV9UWVBF
X0xFVkVMX0hJR0ggMD47Cj4gPiArICAgICAgICAgICAgY2xvY2tzID0gPCZ2ZG9zeXMxIENMS19W
RE8xX01EUF9SRE1BMD47Cj4gPiArICAgICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmc3BtIE1U
ODE5NV9QT1dFUl9ET01BSU5fVkRPU1lTMT47Cj4gPiArICAgICAgICAgICAgaW9tbXVzID0gPCZp
b21tdV92ZG8gTTRVX1BPUlRfTDJfTURQX1JETUEwPjsKPiA+ICsgICAgICAgICAgICBtZWRpYXRl
ayxnY2UtY2xpZW50LXJlZyA9IDwmZ2NlMCBTVUJTWVNfMWMxMFhYWFggMHg0MDAwIDB4MTAwMD47
Cj4gPiArICAgICAgICB9Owo+ID4gKyAgICB9OwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
