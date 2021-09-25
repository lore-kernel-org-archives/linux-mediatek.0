Return-Path: <SRS0=T8Q+=OP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8589DC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Sep 2021 02:11:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4406860F21
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Sep 2021 02:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4406860F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=58gx4z6LTLECBEAqXx2125UmHsKLFHXN1aFRrbZ+E2w=; b=hin0UWSz/DaVfO
	ND86xqdGJwwAJkwPKDoTihm2dTsPO88mzskbCwsGba9TTNIIKaLrGiTT1YTkcgz6d9kypoDo3oMI4
	QoXKHHDh7eEvtBURjTPnfL6WMA35swEjwKFzh3gksmhSpR7iTQsP4NB9Tj1NDN0E3HzoPMpubTu9d
	Y6/U4/0NH+qp2R4IJ7K6bcKQJ3I2kFl2GLDgiYEQfTI/k9bGjuy7LBXW8WmrU3OAjZgCG9KzA3H5T
	EGsWSnZtFzcfG+sYq7OMz4/Ngyeq8rnDdctyMzdwBTeQ+coRrn8+QLZXNr4OpXQfvJYXP9xvXawTi
	nC4b4oHDq8mGroYEbvAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTxA5-00Fy90-PX; Sat, 25 Sep 2021 02:11:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTx9p-00Fy5H-VQ; Sat, 25 Sep 2021 02:11:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 980A261251;
 Sat, 25 Sep 2021 02:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632535876;
 bh=bh2NnvETqZ5gppTlIxdn7adU8NHofIsaMMg5rGECvIs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oyXkVs0M9xuz9X0bXR7/OLdzcXDXj+3NZbVkICK0B6LOn7gsOhWZKos44L9RBL5uD
 BwIJbHEEidbS9QkrLI2sNoW4Ax3xN9Bmc5DTlxF1VTJibs2mC8MRFn22KYx5dtt3bf
 cNBDnAA7OuYi1HhmOP4ng/RjMxsnN1vS0WhVzYXGQqyGJS42jWbWlFVa67xx2FAGTY
 kJXtiagOrPopJiPuMmZGlKivK4QP/7Dd4GFr5B+kfyGAkRHeDkILUYTUItJA48ftFO
 66LvFyl/hZc3BaTa11PSR2BzR9HgPQGo74IZopZdl10Kmm/a+2T6k3ahghE+dAI/i0
 /aF+O/fDYvGZQ==
Received: by mail-ed1-f43.google.com with SMTP id eg28so43392594edb.1;
 Fri, 24 Sep 2021 19:11:16 -0700 (PDT)
X-Gm-Message-State: AOAM531PTasTl+Teo2WLCJqp+YkxiKi0UHkRDuKbtxUzJD9d0x1Jd685
 4HlFdcnZHQMCxItEvr07pcGtpfuCzRNghfwooA==
X-Google-Smtp-Source: ABdhPJxHVfwE5NBLEqjXLuieV73XDg/3aABwa8SyIvmNcOwLifu66viuQEN5dIOmQCviZEg+9kCT9dfv4FoGZK01SQc=
X-Received: by 2002:a17:906:26c4:: with SMTP id
 u4mr14435742ejc.511.1632535875178; 
 Fri, 24 Sep 2021 19:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210921155218.10387-1-jason-jh.lin@mediatek.com>
 <20210921155218.10387-5-jason-jh.lin@mediatek.com>
In-Reply-To: <20210921155218.10387-5-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 25 Sep 2021 10:11:04 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8uRKQP5AEp6V4Ez1YZAfSYrruo5n-hG=Vp3GUPUE=sGA@mail.gmail.com>
Message-ID: <CAAOTY_8uRKQP5AEp6V4Ez1YZAfSYrruo5n-hG=Vp3GUPUE=sGA@mail.gmail.com>
Subject: Re: [PATCH v11 04/16] dt-bindings: display: mediatek: dsc: add yaml
 for mt8195 SoC binding
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, fshao@chromium.org, 
 Moudy Ho <moudy.ho@mediatek.com>, roy-cw.yeh@mediatek.com, 
 Fabien Parent <fparent@baylibre.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com, 
 DTML <devicetree@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_191118_091975_FAD47C68 
X-CRM114-Status: GOOD (  20.17  )
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

SGksIEphc29uOgoKamFzb24tamgubGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPiDmlrwg
MjAyMeW5tDnmnIgyMeaXpSDpgLHkuowg5LiL5Y2IMTE6NTLlr6vpgZPvvJoKPgo+IDEuIEFkZCBt
ZWRpYXRlayxkc2MueWFtbCB0byBkZXNjcmliZSBEU0MgbW9kdWxlIGluIGRldGFpbHMuCj4gMi4g
QWRkIG10ODE5NSBTb0MgYmluZGluZyB0byBtZWRpYXRlayxkc2MueWFtbC4KClJldmlld2VkLWJ5
OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4KPiBTaWduZWQtb2Zm
LWJ5OiBqYXNvbi1qaC5saW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIC4u
Li9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzYy55YW1sICAgICAgICB8IDcxICsrKysrKysr
KysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDcxIGluc2VydGlvbnMoKykKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21l
ZGlhdGVrL21lZGlhdGVrLGRzYy55YW1sCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNjLnlhbWwgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRl
ayxkc2MueWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4x
ZWMwODNlZmY4MjQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNjLnlhbWwKPiBAQCAtMCww
ICsxLDcxIEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1Ig
QlNELTItQ2xhdXNlKQo+ICslWUFNTCAxLjIKPiArLS0tCj4gKyRpZDogaHR0cDovL2RldmljZXRy
ZWUub3JnL3NjaGVtYXMvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkc2MueWFtbCMKPiArJHNj
aGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gKwo+
ICt0aXRsZTogbWVkaWF0ZWsgZGlzcGxheSBEU0MgY29udHJvbGxlcgo+ICsKPiArbWFpbnRhaW5l
cnM6Cj4gKyAgLSBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPiArICAt
IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4gKwo+ICtkZXNjcmlwdGlv
bjogfAo+ICsgIFRoZSBEU0Mgc3RhbmRhcmQgaXMgYSBzcGVjaWZpY2F0aW9uIG9mIHRoZSBhbGdv
cml0aG1zIHVzZWQgZm9yCj4gKyAgY29tcHJlc3NpbmcgYW5kIGRlY29tcHJlc3NpbmcgaW1hZ2Ug
ZGlzcGxheSBzdHJlYW1zLCBpbmNsdWRpbmcKPiArICB0aGUgc3BlY2lmaWNhdGlvbiBvZiB0aGUg
c3ludGF4IGFuZCBzZW1hbnRpY3Mgb2YgdGhlIGNvbXByZXNzZWQKPiArICB2aWRlbyBiaXQgc3Ry
ZWFtLiBEU0MgaXMgZGVzaWduZWQgZm9yIHJlYWwtdGltZSBzeXN0ZW1zIHdpdGgKPiArICByZWFs
LXRpbWUgY29tcHJlc3Npb24sIHRyYW5zbWlzc2lvbiwgZGVjb21wcmVzc2lvbiBhbmQgRGlzcGxh
eS4KPiArCj4gK3Byb3BlcnRpZXM6Cj4gKyAgY29tcGF0aWJsZToKPiArICAgIG9uZU9mOgo+ICsg
ICAgICAtIGl0ZW1zOgo+ICsgICAgICAgICAgLSBjb25zdDogbWVkaWF0ZWssbXQ4MTk1LWRpc3At
ZHNjCj4gKwo+ICsgIHJlZzoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICsgIGludGVycnVwdHM6
Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiArICBjbG9ja3M6Cj4gKyAgICBpdGVtczoKPiArICAg
ICAgLSBkZXNjcmlwdGlvbjogRFNDIFdyYXBwZXIgQ2xvY2sKPiArCj4gKyAgcG93ZXItZG9tYWlu
czoKPiArICAgIGRlc2NyaXB0aW9uOiBBIHBoYW5kbGUgYW5kIFBNIGRvbWFpbiBzcGVjaWZpZXIg
YXMgZGVmaW5lZCBieSBiaW5kaW5ncyBvZgo+ICsgICAgICB0aGUgcG93ZXIgY29udHJvbGxlciBz
cGVjaWZpZWQgYnkgcGhhbmRsZS4gU2VlCj4gKyAgICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9wb3dlci9wb3dlci1kb21haW4ueWFtbCBmb3IgZGV0YWlscy4KPiArCj4gKyAg
bWVkaWF0ZWssZ2NlLWNsaWVudC1yZWc6Cj4gKyAgICBkZXNjcmlwdGlvbjoKPiArICAgICAgVGhl
IHJlZ2lzdGVyIG9mIGNsaWVudCBkcml2ZXIgY2FuIGJlIGNvbmZpZ3VyZWQgYnkgZ2NlIHdpdGgg
NCBhcmd1bWVudHMKPiArICAgICAgZGVmaW5lZCBpbiB0aGlzIHByb3BlcnR5LCBzdWNoIGFzIHBo
YW5kbGUgb2YgZ2NlLCBzdWJzeXMgaWQsCj4gKyAgICAgIHJlZ2lzdGVyIG9mZnNldCBhbmQgc2l6
ZS4KPiArICAgICAgRWFjaCBzdWJzeXMgaWQgaXMgbWFwcGluZyB0byBhIGJhc2UgYWRkcmVzcyBv
ZiBkaXNwbGF5IGZ1bmN0aW9uIGJsb2Nrcwo+ICsgICAgICByZWdpc3RlciB3aGljaCBpcyBkZWZp
bmVkIGluIHRoZSBnY2UgaGVhZGVyCj4gKyAgICAgIGluY2x1ZGUvZHQtYmluZGluZ3MvZ2NlLzxj
aGlwPi1nY2UuaC4KPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25z
L3BoYW5kbGUtYXJyYXkKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICtyZXF1aXJlZDoKPiArICAt
IGNvbXBhdGlibGUKPiArICAtIHJlZwo+ICsgIC0gaW50ZXJydXB0cwo+ICsgIC0gcG93ZXItZG9t
YWlucwo+ICsgIC0gY2xvY2tzCj4gKwo+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKPiAr
Cj4gK2V4YW1wbGVzOgo+ICsgIC0gfAo+ICsKPiArICAgIGRzYzA6IGRpc3BfZHNjX3dyYXBAMWMw
MDkwMDAgewo+ICsgICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1LWRpc3AtZHNj
IjsKPiArICAgICAgICByZWcgPSA8MCAweDFjMDA5MDAwIDAgMHgxMDAwPjsKPiArICAgICAgICBp
bnRlcnJ1cHRzID0gPEdJQ19TUEkgNjQ1IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47Cj4gKyAgICAg
ICAgcG93ZXItZG9tYWlucyA9IDwmc3BtIE1UODE5NV9QT1dFUl9ET01BSU5fVkRPU1lTMD47Cj4g
KyAgICAgICAgY2xvY2tzID0gPCZ2ZG9zeXMwIENMS19WRE8wX0RTQ19XUkFQMD47Cj4gKyAgICAg
ICAgbWVkaWF0ZWssZ2NlLWNsaWVudC1yZWcgPSA8JmdjZTEgU1VCU1lTXzFjMDBYWFhYIDB4OTAw
MCAweDEwMDA+Owo+ICsgICAgfTsKPiAtLQo+IDIuMTguMAo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
