Return-Path: <SRS0=hgkd=NY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20333C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 23:32:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA7E46101A
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 23:32:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA7E46101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zrGGyxfCNl9oQO63wITU5oeVKV6HRGPj40g0iSYdeyM=; b=XKXrwGOpo1Mhyq
	BQ3pp7W7FCsrrmABoLkITCBqjY2G9E3k3ntPhU6Y3d/I2T3NWlT+cnLn7S1robK+Lm7n/0197cRwg
	8W6JxM56t0sXQcx7BCyUIp1T43dS+CypKMN3bLikDVJIgVsMgAvwI0Ngr+lT+upqF3qbkO03yI/fa
	9n5okbta9CgFiULOr3wdkRdBBtWa1ojm0a7wtuo1j2pS809Mi96xnsSFqYdyrY2awX8snzWmII+2k
	Pa6ZLmlUkIEP5o9DJUvOm+/aPQItnapL4zL3MtozV2U2b/27RBNMCM3FjUIPIH5egP6WuoreNnDba
	t45GOHStkPQ3do37DwAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLwCE-00AjaA-Qv; Thu, 02 Sep 2021 23:32:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLwBz-00AjXV-8Y; Thu, 02 Sep 2021 23:32:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B430F61051;
 Thu,  2 Sep 2021 23:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630625541;
 bh=GA+AjqeSDCMykVukDLkZcSq4WcK7pD/aBcJsuedYksc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=s/+04C7t67KD1oG/KwSDWU00s5MUQy4g4uRK3IHnaWC07ifQquiLbK2upmY3IHvAo
 e/q2VuygnBfxNMPkYWu7v9l8qa9/uDTGCri4M+4nOQ080OOnpb+w9RfG7hC+A7VAdO
 PN5Lz35UHLEP5BVOI5RGoc1hYJ2oUVh/Abips89rgJasyvrhxd9kdp1/i9ULEMVGvv
 dNuaaNVrpe/HvaA42AykZaA1YyMwp5h0n02UtJd1BREnqpbJuD8Lo9XchkBN5171sM
 NgLasAowEdufp+Asaegop1S9jL7aXwOByYL62n4JE92DVDGX1caI116UxuXcWzid7G
 BpQpq7TmQADig==
Received: by mail-ed1-f44.google.com with SMTP id g21so5364269edw.4;
 Thu, 02 Sep 2021 16:32:21 -0700 (PDT)
X-Gm-Message-State: AOAM5335DWRBTjwAeVfjPQXWS8TMcwrdo97ScUzXKK9YIDW0Ol3AeW1r
 W+DccOgFeYSXfr37akt70KygbTHCIYuBIZ6FYw==
X-Google-Smtp-Source: ABdhPJycLgYARkg/m3hOc4WHpsXYKVG0oQ2LR7ICSZMV1BjFzJrqx7nH9R3KSEgDZ135ljqbSAxTS7LGdqw0PpvXpm4=
X-Received: by 2002:aa7:d351:: with SMTP id m17mr863165edr.72.1630625540273;
 Thu, 02 Sep 2021 16:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210824100027.25989-1-moudy.ho@mediatek.com>
 <20210824100027.25989-4-moudy.ho@mediatek.com>
 <YSU0TrfFCsaI1TqV@robh.at.kernel.org>
 <0092244acd520acac81208b8863b15fba58f4193.camel@mediatek.com>
 <CAL_JsqJ_cProt35pdd2MjoHsSKtd+0n1Dwq6ooV+CJH5sfOFWg@mail.gmail.com>
In-Reply-To: <CAL_JsqJ_cProt35pdd2MjoHsSKtd+0n1Dwq6ooV+CJH5sfOFWg@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 3 Sep 2021 07:32:09 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9ztP2c3qeF4cGBujdBWwdNrk-k14EPjD_yukH73L11qw@mail.gmail.com>
Message-ID: <CAAOTY_9ztP2c3qeF4cGBujdBWwdNrk-k14EPjD_yukH73L11qw@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
To: Rob Herring <robh@kernel.org>
Cc: moudy ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maoguang Meng <maoguang.meng@mediatek.com>, 
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Landley <rob@landley.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Alexandre Courbot <acourbot@chromium.org>, 
 Pi-Hsun Shih <pihsun@chromium.org>, menghui.lin@mediatek.com, 
 Sj Huang <sj.huang@mediatek.com>, ben.lok@mediatek.com, randy.wu@mediatek.com, 
 srv_heupstream <srv_heupstream@mediatek.com>, Hsin-Yi Wang <hsinyi@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_163223_383402_E62F5A17 
X-CRM114-Status: GOOD (  34.36  )
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

SGksIFJvYjoKClJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IOaWvCAyMDIx5bm0OOaciDMw
5pelIOmAseS4gCDkuIvljYgxMTowNuWvq+mBk++8mgo+Cj4gT24gTW9uLCBBdWcgMzAsIDIwMjEg
YXQgMjo1OCBBTSBtb3VkeSBobyA8bW91ZHkuaG9AbWVkaWF0ZWsuY29tPiB3cm90ZToKPiA+Cj4g
PiBPbiBUdWUsIDIwMjEtMDgtMjQgYXQgMTM6MDIgLTA1MDAsIFJvYiBIZXJyaW5nIHdyb3RlOgo+
ID4gPiBPbiBUdWUsIEF1ZyAyNCwgMjAyMSBhdCAwNjowMDoyNVBNICswODAwLCBNb3VkeSBIbyB3
cm90ZToKPiA+ID4gPiBUaGlzIHBhdGNoIGFkZHMgRFQgYmluZGluZyBkb2N1bWVudCBmb3IgTWVk
aWEgRGF0YSBQYXRoIDMgKE1EUDMpCj4gPiA+ID4gYSB1bml0IGluIG11bHRpbWVkaWEgc3lzdGVt
IHVzZWQgZm9yIHNjYWxpbmcgYW5kIGNvbG9yIGZvcm1hdAo+ID4gPiA+IGNvbnZlcnQuCj4gPiA+
ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNb3VkeSBIbyA8bW91ZHkuaG9AbWVkaWF0ZWsuY29t
Pgo+ID4gPiA+IC0tLQo+ID4gPiA+ICAuLi4vYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRwMy1j
Y29yci55YW1sICAgfCAgNTcgKysrKysKPiA+ID4gPiAgLi4uL2JpbmRpbmdzL21lZGlhL21lZGlh
dGVrLG1kcDMtcmRtYS55YW1sICAgIHwgMjA3Cj4gPiA+ID4gKysrKysrKysrKysrKysrKysrCj4g
PiA+ID4gIC4uLi9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLXJzei55YW1sICAgICB8ICA2
NSArKysrKysKPiA+ID4gPiAgLi4uL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMtd2RtYS55
YW1sICAgIHwgIDcxICsrKysrKwo+ID4gPiA+ICAuLi4vYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWss
bWRwMy13cm90LnlhbWwgICAgfCAgNzEgKysrKysrCj4gPiA+ID4gIDUgZmlsZXMgY2hhbmdlZCwg
NDcxIGluc2VydGlvbnMoKykKPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0Cj4gPiA+ID4gRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMtY2NvcnIu
eWFtbAo+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQKPiA+ID4gPiBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRwMy1yZG1hLnlhbWwKPiA+ID4gPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0Cj4gPiA+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21lZGlhL21lZGlhdGVrLG1kcDMtcnN6LnlhbWwKPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0Cj4gPiA+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlh
dGVrLG1kcDMtd2RtYS55YW1sCj4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NAo+ID4gPiA+IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLXdyb3Qu
eWFtbAo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLQo+ID4gPiA+IGNjb3JyLnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRwMy0KPiA+ID4g
PiBjY29yci55YW1sCj4gPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4gPiBpbmRleCAw
MDAwMDAwMDAwMDAuLjU5ZmQ2OGI0NjAyMgo+ID4gPiA+IC0tLSAvZGV2L251bGwKPiA+ID4gPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRw
My0KPiA+ID4gPiBjY29yci55YW1sCj4gPiA+ID4gQEAgLTAsMCArMSw1NyBAQAo+ID4gPiA+ICsj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkK
PiA+ID4gPiArJVlBTUwgMS4yCj4gPiA+ID4gKy0tLQo+ID4gPiA+ICskaWQ6Cj4gPiA+ID4gaHR0
cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL21l
ZGlhL21lZGlhdGVrLG1kcDMtY2NvcnIueWFtbCpfXztJdyEhQ1RSTktBOXdNZzBBUmJ3ITFDMENo
THF6aTdacThEMmQ0X1M0SXFDRWVpNEdYZGd5M19WQ1FnOE1kc0pQN244VGx4Ykd5YWppcHVzZkg4
aGkkCj4gPiA+ID4KPiA+ID4gPiArJHNjaGVtYToKPiA+ID4gPiBodHRwczovL3VybGRlZmVuc2Uu
Y29tL3YzL19faHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwqX187
SXchIUNUUk5LQTl3TWcwQVJidyExQzBDaExxemk3WnE4RDJkNF9TNElxQ0VlaTRHWGRneTNfVkNR
ZzhNZHNKUDduOFRseGJHeWFqaXBpLU9Jbml4JAo+ID4gPiA+Cj4gPiA+ID4gKwo+ID4gPiA+ICt0
aXRsZTogTWVkaWF0ZWsgTWVkaWEgRGF0YSBQYXRoIDMgQ0NPUlIgRGV2aWNlIFRyZWUgQmluZGlu
Z3MKPiA+ID4gPiArCj4gPiA+ID4gK21haW50YWluZXJzOgo+ID4gPiA+ICsgIC0gRGFveXVhbiBI
dWFuZyA8ZGFveXVhbi5odWFuZ0BtZWRpYXRlay5jb20+Cj4gPiA+ID4gKyAgLSBNb3VkeSBIbyA8
bW91ZHkuaG9AbWVkaWF0ZWsuY29tPgo+ID4gPiA+ICsKPiA+ID4gPiArZGVzY3JpcHRpb246IHwK
PiA+ID4gPiArICBPbmUgb2YgTWVkaWEgRGF0YSBQYXRoIDMgKE1EUDMpIGNvbXBvbmVudHMgdXNl
ZCB0byBkbyBjb2xvcgo+ID4gPiA+IGNvcnJlY3Rpb24gd2l0aCAzWDMgbWF0cml4Lgo+ID4gPiA+
ICsKPiA+ID4gPiArcHJvcGVydGllczoKPiA+ID4gPiArICBjb21wYXRpYmxlOgo+ID4gPiA+ICsg
ICAgaXRlbXM6Cj4gPiA+ID4gKyAgICAgIC0gZW51bToKPiA+ID4gPiArICAgICAgICAtIG1lZGlh
dGVrLG10ODE4My1tZHAzLWNjb3JyCj4gPiA+ID4gKwo+ID4gPiA+ICsgIG1lZGlhdGVrLG1kcDMt
aWQ6Cj4gPiA+ID4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91
aW50MzIKPiA+ID4gPiArICAgIG1heEl0ZW1zOiAxCj4gPiA+ID4gKyAgICBkZXNjcmlwdGlvbjog
fAo+ID4gPiA+ICsgICAgICBIVyBpbmRleCB0byBkaXN0aW5ndWlzaCBzYW1lIGZ1bmN0aW9uYWxp
dHkgbW9kdWxlcy4KPiA+ID4KPiA+ID4gSWYgd2Ugd2FudGVkIGgvdyBpbmRleGVzIGluIERULCB3
ZSdkIGhhdmUgYSBzdGFuZGFyZCBwcm9wZXJ0eS4gV2h5Cj4gPiA+IGRvCj4gPiA+IHlvdSBuZWVk
IHRoaXM/Cj4gPiA+Cj4gPiBJJ20gc29ycnkgbm90IHF1aXRlIHN1cmUgd2hhdCBIVyBpbmRleGVz
IG1lYW5zIChzb21ldGhpbmcgbGlrZQo+ID4gYWxpYXNlcz8pCj4KPiBJdCBtZWFucyB3aGF0ZXZl
ciB5b3Ugc2FpZCBpbiB5b3VyIGRlc2NyaXB0aW9uLgo+Cj4gQW5kIG5vLCBJJ20gbm90IHN1Z2dl
c3RpbmcgeW91IHVzZSBhbGlhc2VzLgoKQmVjYXVzZSBtZWRpYXRlayBkcm0gZHJpdmVyIGhhcyB0
aGUgc2FtZSBwcm9ibGVtIHdpdGggbWRwIGRyaXZlciwgYW5kCml0IGhhcyBhbHJlYWR5IHVzZSB0
aGUgYWxpYXNlcyBbMV0uIE5vIG1hdHRlciB3aGF0IGlzIHRoZSBjb25jbHVzaW9uCmZvciBtZHAg
ZHJpdmVyLCBJIHRoaW5rIG1lZGlhdGVrIGRybSBkcml2ZXIgc2hvdWxkIGFsaWduIHRvIHRoaXMK
Y29uY2x1c2lvbi4gSWYgdGhlIGNvbmNsdXNpb24gaXMgdG8gcmVtb3ZlIGFsaWFzZXMsIHNob3Vs
ZCBJIG1vZGlmeQp0aGUgZHRzIHdoaWNoIGhhcyBhbHJlYWR5IHVwc3RyZWFtZWQ/IFNob3VsZCBt
ZWRpYXRlayBkcm0gZHJpdmVyIGJlCmJhY2t3YXJkLWNvbXBhdGlibGUgd2l0aCBkb3duIHN0cmVh
bSBkdHMgd2hpY2ggdXNlIGFsaWFzZXM/CgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvYXJjaC9hcm02NC9i
b290L2R0cy9tZWRpYXRlay9tdDgxNzMuZHRzaT9oPXY1LjE0CgpSZWdhcmRzLApDaHVuLUt1YW5n
LgoKPgo+ID4gSXQgd2FzIG9yaWdpbmFsbHkgdXNlZCB0byBtYXJrIG11bHRpcGxlIGlkZW50aWNh
bCBtb2R1bGVzIGluIHRoZSBNRFAKPiA+IGRhdGEgcGF0aCBhbGdvcml0aG0sIHNvIHRoYXQgYXBw
cm9wcmlhdGUgcGF0aHMgY2FuIGJlIGR5bmFtaWNhbGx5Cj4gPiBkaXNwYXRjaGVkLgo+Cj4gSWYg
dGhleSBhcmUgaWRlbnRpY2FsLCB0aGVuIHdoeSBkbyB5b3UgbmVlZCB0byBkaXN0aW5ndWlzaCB0
aGVtIGluIERUPwo+IElmIHRoZXJlJ3Mgc29tZSBkaWZmZXJlbmNlIHlvdSBuZWVkIHRvIGtub3cg
YWJvdXQgc3VjaCBhcyBjb25uZWN0aW9ucwo+IHRvIG90aGVyIGJsb2NrcywgdGhlbiBkZXNjcmli
ZSB0aGF0LiBBbm90aGVyIGNvbW1vbiBleGFtcGxlIGlzIG5lZWRpbmcKPiB0byBrbm93IHdoYXQg
Yml0cy9yZWdpc3RlcnMgdG8gYWNjZXNzIGluIGEgc3lzY29uIHBoYW5kbGUuIEZvciB0aGF0LAo+
IG1ha2UgdGhlIHJlZ2lzdGVyIG9mZnNldCBvciBiaXRzIGJlIGFyZ3MgdG8gdGhlIHBoYW5kbGUg
cHJvcGVydHkuCj4KPiBSb2IKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
