Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00C6C4363A
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 15:49:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74CEB20878
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 15:49:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eF8KdkrJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="eEMMCin3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74CEB20878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lSGckJ8pZ2OVrAS4w4NY6+OU4CAcIzOM0MHcBpbOx4o=; b=eF8KdkrJU2sH85D8mjAD++uEA
	qCP7RpV6LgBZOHtxDBWrBfIwBLkazT9/iqzysdnir+3slyaSlNGU+XWfw5v9MvFe2tD8Z3MBAJZrl
	rgSHlNGmKAJatayJgMpTU/rj8GS7fB4xH35rpSYRWX7bubP3tyCKzEb8kGAl1A3uhSWWINm7z9Mx8
	fouYJIsDc0v1kNmuTEpgdz65P17bQ7S1ZPzPXN93o/tL9KAgsLumYt/8C0hdh2w21m8yNy7vOO8co
	4jG2I/2ae1G7tuM7Cy26s9K7HTpXTdGxDIb4s26CE0UEJNHrE3aFRVcJBQa/Kw0R/6soYnXfEPNIu
	6INVP9j4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVzJq-00048M-32; Fri, 23 Oct 2020 15:49:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVzJl-00046V-3f; Fri, 23 Oct 2020 15:49:26 +0000
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9683D223EA;
 Fri, 23 Oct 2020 15:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603468163;
 bh=8rC8JAv/ZvbLKMGSVzWGE/gWAOObW9y+163pOgJE734=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eEMMCin3DbmL/T9VnL09w6YGkmRahFquStX7PwBv6i768kDe2YF3dQvTjsN0+lvj3
 DTzXuudR9H6h4tlOKW1CVGnLat2WhIiYUNA3VUmjmx9pJozWLqgTEwNDfEzyOeIFCa
 4fRKMdvUUGILKjzyCLk6xELDl3Kg0IRM7AYuxj0o=
Received: by mail-ej1-f51.google.com with SMTP id k3so3011130ejj.10;
 Fri, 23 Oct 2020 08:49:23 -0700 (PDT)
X-Gm-Message-State: AOAM533UGX0X6z0CuG9rbl41Lv2NveHFJ8kWNc7u/qoD1m+cvl6cnvV2
 eCMvKfZ1znJ+4xyLySvsXyi9eLjO9oy4dTaUXQ==
X-Google-Smtp-Source: ABdhPJw1PDvJSraa+neHMAgIfWWTxOH+reRWWuRSaRPlwJ3vt+DK5mhM/16fgvV4BGg8vj7cvWu44cDBA15ePkriZ84=
X-Received: by 2002:a17:906:9511:: with SMTP id
 u17mr2597628ejx.194.1603468161912; 
 Fri, 23 Oct 2020 08:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201023133130.194140-1-fparent@baylibre.com>
 <20201023133130.194140-3-fparent@baylibre.com>
In-Reply-To: <20201023133130.194140-3-fparent@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 23 Oct 2020 23:49:11 +0800
X-Gmail-Original-Message-ID: <CAAOTY__5mWnrRJetok2VRhCN9ga9mez55jDVturLNWPYnQAVDg@mail.gmail.com>
Message-ID: <CAAOTY__5mWnrRJetok2VRhCN9ga9mez55jDVturLNWPYnQAVDg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: display: mediatek: dsi: add
 documentation for MT8167 SoC
To: Fabien Parent <fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_114925_324073_E7AB40B5 
X-CRM114-Status: GOOD (  19.67  )
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
Cc: DTML <devicetree@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZhYmllbjoKCkZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPiDmlrwgMjAy
MOW5tDEw5pyIMjPml6Ug6YCx5LqUIOS4i+WNiDk6MzHlr6vpgZPvvJoKPgo+IEFkZCBiaW5kaW5n
IGRvY3VtZW50YXRpb24gZm9yIHRoZSBNVDgxNjcgU29DLgoKUmV2aWV3ZWQtYnk6IENodW4tS3Vh
bmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKSW4gWzFdLCBNZWRpYXRlayBEUEkgYmlu
ZGluZyBkb2N1bWVudCBoYXMgYmVlbiBjaGFuZ2VkIHRvIHlhbWwgZm9ybWF0LAp3b3VsZCB5b3Ug
cGxlYXNlIGFsc28gY2hhbmdlIHRoaXMgZG9jdW1lbnQgdG8geWFtbD8gRGl0dG8gZm9yCm1lZGlh
dGVrLGRpc3AudHh0LgoKWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9s
aW51eC1tZWRpYXRlay9wYXRjaC8yMDIwMDkxNzA3MzMwNS4yNTczOC0xLWppdGFvLnNoaUBtZWRp
YXRlay5jb20vCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKCj4KPiBTaWduZWQtb2ZmLWJ5OiBGYWJp
ZW4gUGFyZW50IDxmcGFyZW50QGJheWxpYnJlLmNvbT4KPiAtLS0KPgo+IENoYW5nZWxvZzoKPgo+
IFYyOiByZW1vdmVkIHBhcnQgdGhhdCBhZGRlZCBhIG5ldyBjbG9jawo+Cj4gIC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNpLnR4dCAgICAgfCA0ICsr
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9t
ZWRpYXRlay9tZWRpYXRlayxkc2kudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNpLnR4dAo+IGluZGV4IGYwNmYyNGQ0MDVh
NS4uNmExMGRlODEyMTU4IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQKPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkc2ku
dHh0Cj4gQEAgLTcsNyArNyw3IEBAIGNoYW5uZWwgb3V0cHV0Lgo+Cj4gIFJlcXVpcmVkIHByb3Bl
cnRpZXM6Cj4gIC0gY29tcGF0aWJsZTogIm1lZGlhdGVrLDxjaGlwPi1kc2kiCj4gLS0gdGhlIHN1
cHBvcnRlZCBjaGlwcyBhcmUgbXQyNzAxLCBtdDc2MjMsIG10ODE3MyBhbmQgbXQ4MTgzLgo+ICst
IHRoZSBzdXBwb3J0ZWQgY2hpcHMgYXJlIG10MjcwMSwgbXQ3NjIzLCBtdDgxNjcsIG10ODE3MyBh
bmQgbXQ4MTgzLgo+ICAtIHJlZzogUGh5c2ljYWwgYmFzZSBhZGRyZXNzIGFuZCBsZW5ndGggb2Yg
dGhlIGNvbnRyb2xsZXIncyByZWdpc3RlcnMKPiAgLSBpbnRlcnJ1cHRzOiBUaGUgaW50ZXJydXB0
IHNpZ25hbCBmcm9tIHRoZSBmdW5jdGlvbiBibG9jay4KPiAgLSBjbG9ja3M6IGRldmljZSBjbG9j
a3MKPiBAQCAtMjYsNyArMjYsNyBAQCBUaGUgTUlQSSBUWCBjb25maWd1cmF0aW9uIG1vZHVsZSBj
b250cm9scyB0aGUgTUlQSSBELVBIWS4KPgo+ICBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICAtIGNv
bXBhdGlibGU6ICJtZWRpYXRlayw8Y2hpcD4tbWlwaS10eCIKPiAtLSB0aGUgc3VwcG9ydGVkIGNo
aXBzIGFyZSBtdDI3MDEsIDc2MjMsIG10ODE3MyBhbmQgbXQ4MTgzLgo+ICstIHRoZSBzdXBwb3J0
ZWQgY2hpcHMgYXJlIG10MjcwMSwgNzYyMywgbXQ4MTY3LCBtdDgxNzMgYW5kIG10ODE4My4KPiAg
LSByZWc6IFBoeXNpY2FsIGJhc2UgYWRkcmVzcyBhbmQgbGVuZ3RoIG9mIHRoZSBjb250cm9sbGVy
J3MgcmVnaXN0ZXJzCj4gIC0gY2xvY2tzOiBQTEwgcmVmZXJlbmNlIGNsb2NrCj4gIC0gY2xvY2st
b3V0cHV0LW5hbWVzOiBuYW1lIG9mIHRoZSBvdXRwdXQgY2xvY2sgbGluZSB0byB0aGUgRFNJIGVu
Y29kZXIKPiAtLQo+IDIuMjguMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
