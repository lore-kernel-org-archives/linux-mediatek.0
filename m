Return-Path: <SRS0=QAkp=PD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2476DC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 16:22:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEC47604DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 16:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DEC47604DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TqROmd4o4t5XKfmMFmB13ayuLAJHwWpYsM05Hw/fYRk=; b=CUyln1uNhOnhd9
	F8x5HM2I6dAAIsSmW2UcoxvB1lSA0hTCBb6n1eUTTBqX/vpVA4NoTwP+acZaIV8qHan5ZrOVJbj9f
	QhRYV8zMMWQmklF3NVTCTeF3CnATI75MJvNmPmHmRt3YdCDG/ucvyXOXOTrj75pUatUgFIjM63PS5
	Dtn2ETlqbHIX9L6lSivwc2msiAyt8zHA4XjPrz3xCFJbFcgGezqkeUfXvdDCTPq5G/cbFEfVbNNrv
	XjDifxgliJwo0MZjIq+It8ncPx6zpzbMDhbUykfUWm7f/2mS++IjvxcghlRon0ZtUu7/O5jg/+GHf
	ZUaCUyb9HQmTFR5WadFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbPy7-0085B0-67; Fri, 15 Oct 2021 16:22:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbPxX-0084vL-15; Fri, 15 Oct 2021 16:21:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3467A611C1;
 Fri, 15 Oct 2021 16:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634314885;
 bh=z0VMHYGv4k9YfLpE9FUSGVn3TrO3Twply7c7zgpVmYM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=J6WxXOGI05KDKCcMlAcj6PkNDAZRgenVWkTidMhwoD3JNTz/4l51EERh5Ql1ZSJpj
 BbHXZvif3Y2gIy8npj+nEwwpC4iH9jXA+7X6nBWvHtWo3FA5Re2BU3Gw+OHqxb4Ihu
 MjbChxxUI5SnJkj8X4h78uz8Lan/JnmbKUTSNM65fO6nU8rNG1Vmeu/QJoYZQgVcMb
 CexyF34RQoOQiSJuK+q00/JxapoJ3X9lV7FBcS/BSlxwEHkvP94K0v/4b4Gj5lX88F
 siBr2i5g4cd21v++Pfceo+bb/ofBufDtCzga5cQiXB7M1Eb29Rm1529svUV4SJ0X3H
 wr9CZNQCkOeaQ==
Received: by mail-ed1-f48.google.com with SMTP id r18so40303350edv.12;
 Fri, 15 Oct 2021 09:21:25 -0700 (PDT)
X-Gm-Message-State: AOAM531fT+PubxO8RPqZaChxgh2WRxpwNsPZcCyT0LVuFJBL6RcNGNAt
 KA2+cJylvH9dnilATWFUk0ia3tFxvpPV/mgsDQ==
X-Google-Smtp-Source: ABdhPJx6achLWZwzx6ovEoDXmzSv+wCsdnSRUuajZYLhkxDFusi9eOjTSSXm7nZir+rTOgxfNjDkLV4a3hqmrLpqCmU=
X-Received: by 2002:a50:ef10:: with SMTP id m16mr15859060eds.224.1634314883576; 
 Fri, 15 Oct 2021 09:21:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211004062140.29803-1-nancy.lin@mediatek.com>
 <20211004062140.29803-3-nancy.lin@mediatek.com>
In-Reply-To: <20211004062140.29803-3-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 16 Oct 2021 00:21:12 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-3KBXyBvMW8zC1fukkDFGczcP6t+CjRbvGh6uQtOSnTA@mail.gmail.com>
Message-ID: <CAAOTY_-3KBXyBvMW8zC1fukkDFGczcP6t+CjRbvGh6uQtOSnTA@mail.gmail.com>
Subject: Re: [PATCH v6 02/16] dt-bindings: mediatek: add vdosys1 MERGE
 property for mt8195
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, singo.chang@mediatek.com, 
 srv_heupstream <srv_heupstream@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_092127_154092_4BE473D1 
X-CRM114-Status: GOOD (  12.53  )
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

SGksIE5hbmN5OgoKTmFuY3kuTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5
tDEw5pyINOaXpSDpgLHkuIAg5LiL5Y2IMjoyMeWvq+mBk++8mgo+Cj4gTVQ4MTk1IHZkb3N5czEg
bWVyZ2UxIHRvIG1lcmdlNCBoYXZlIEhXIG11dGUgZnVuY3Rpb24uCj4gQWRkIE1FUkdFIGFkZGl0
aW9uYWwgbXV0ZSBwcm9wZXJ0eSBkZXNjcmlwdGlvbi4KClJldmlld2VkLWJ5OiBDaHVuLUt1YW5n
IEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBOYW5jeS5M
aW4gPG5hbmN5LmxpbkBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbWVyZ2UueWFtbCAgfCA0ICsrKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1lcmdlLnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9t
ZWRpYXRlayxtZXJnZS55YW1sCj4gaW5kZXggNjAwN2UwMDY3OWE4Li5kN2QwZWRhODEzZDEgMTAw
NjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVk
aWF0ZWsvbWVkaWF0ZWssbWVyZ2UueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1lcmdlLnlhbWwKPiBAQCAtNTQs
NiArNTQsMTAgQEAgcHJvcGVydGllczoKPiAgICAgICAgY29tbWFuZCB0byBTTUkgdG8gc3BlZWQg
dXAgdGhlIGRhdGEgcmF0ZS4KPiAgICAgIHR5cGU6IGJvb2xlYW4KPgo+ICsgIG1lZGlhdGVrLG1l
cmdlLW11dGU6Cj4gKyAgICBkZXNjcmlwdGlvbjogU3VwcG9ydCBtdXRlIGZ1bmN0aW9uLiBNdXRl
IHRoZSBjb250ZW50IG9mIG1lcmdlIG91dHB1dC4KPiArICAgIHR5cGU6IGJvb2xlYW4KPiArCj4g
ICAgbWVkaWF0ZWssZ2NlLWNsaWVudC1yZWc6Cj4gICAgICBkZXNjcmlwdGlvbjoKPiAgICAgICAg
VGhlIHJlZ2lzdGVyIG9mIGNsaWVudCBkcml2ZXIgY2FuIGJlIGNvbmZpZ3VyZWQgYnkgZ2NlIHdp
dGggNCBhcmd1bWVudHMKPiAtLQo+IDIuMTguMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
