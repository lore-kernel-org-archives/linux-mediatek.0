Return-Path: <SRS0=12Pn=BT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A51C433DF
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2020 00:56:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73711206DF
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2020 00:56:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="poA82vo6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vzzts3B/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73711206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zcavJyDZaiCSUMWTlhE5Z7b/u5Zwms8aOn97AehTV+k=; b=poA82vo6fJT4Fi8NPu556yWJ7
	DdwyG9xYVjbYiU25lMjbH8NN5Bu97qSjYqKCYnTDT4YUZfob8uzl0NIiwBcjDmvPzJaLVR8ZQD597
	p4o+iXnTQ0rtQIg2y7HH6PkWFqwTeIJRpA68h+XZniSDksAXRQGnX3dw0tcwTVzy08CUL+Z0cQauB
	dxacoXUVzIW+Geuy315m/r5fR+FNjL4ht8PmFrFCoviwOnTGAGpRPvGnrWloRcMUlW6n6NQvCMAop
	npLeDThb7+9fm39in62YnosU75oVwyAfqMpGN3N3kCQgZSgy5j8AFk4eMaqOeki7O2Fem/PGykYRK
	wsxuAbCRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k4ZdO-0008Hv-9E; Sun, 09 Aug 2020 00:56:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4ZdH-0008Fq-41; Sun, 09 Aug 2020 00:56:16 +0000
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 095FF20723;
 Sun,  9 Aug 2020 00:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596934574;
 bh=oGs0rKWqxtfTQ9FJ6Jjr2KhUw8xQSwkZHO6TmqRx174=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vzzts3B/x6KCHIQ+Hn1p1HruXW6cecQdzbZNcgEyVsoRaT4HftVQs0kdiUlaEguXF
 fWk0YlcPKuD8iQVaZS7IFIaswzl+kHknNNwU+F4nH42NdpuO6kX7LV17NQ/mHBkQgw
 NjB0xGxWQZpxhDtwLY6w3jb8OvrHfledr0VsJyWc=
Received: by mail-ej1-f44.google.com with SMTP id o18so5892848eje.7;
 Sat, 08 Aug 2020 17:56:13 -0700 (PDT)
X-Gm-Message-State: AOAM532bpscm9MepSZ6J31qXIaHcTl1bwbh84sDmy0slBnX7zpWWmwO/
 XYl9Cz7SqRkxUTfrjB7baPsE8bzcLslaC4InnA==
X-Google-Smtp-Source: ABdhPJyh5IoUDVzcfP7Egn+Xg1eTx8HohyZaiVtN7kN7dlLqqJN22jwVw+zE/NmDFnoeAUDSceqqG3XpXI4D9fjYoSo=
X-Received: by 2002:a17:906:60d5:: with SMTP id
 f21mr15641505ejk.94.1596934572615; 
 Sat, 08 Aug 2020 17:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <1596855231-5782-1-git-send-email-yongqiang.niu@mediatek.com>
 <1596855231-5782-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1596855231-5782-2-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 9 Aug 2020 08:56:01 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9myENG+APAhC6MANHn3bqGZ-jtq08v4pTWCq2v9DDjNA@mail.gmail.com>
Message-ID: <CAAOTY_9myENG+APAhC6MANHn3bqGZ-jtq08v4pTWCq2v9DDjNA@mail.gmail.com>
Subject: Re: [RESEND v7, PATCH 1/7] dt-bindings: mediatek: add rdma_fifo_size
 description for mt8183 display
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200808_205615_314119_81F3DE20 
X-CRM114-Status: GOOD (  20.50  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDjmnIg45pelIOmAseWFrSDkuIrljYgxMTowNOWvq+mBk++8mgo+Cj4gcmRt
YSBmaWZvIHNpemUgbWF5IGJlIGRpZmZlcmVudCBldmVuIGluIHNhbWUgU09DLCBhZGQgdGhpcwo+
IHByb3BlcnR5IHRvIHRoZSBjb3JyZXNwb25kaW5nIHJkbWEKPgo+IENoYW5nZS1JZDogSTY3NjM1
ZWM3ZjNmNTljZjRjYmM3NzM3Mjg1ZTVlMjhmZjBhYjcxYzkKClJlbW92ZSBjaGFuZ2UtaWQuCgo+
IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
Pgo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlh
dGVrLGRpc3AudHh0IHwgMTQgKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGlu
c2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0Cj4g
aW5kZXggYjkxZTcwOS4uZTZiYmUzMiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlh
dGVrLGRpc3AudHh0Cj4gQEAgLTY2LDYgKzY2LDExIEBAIFJlcXVpcmVkIHByb3BlcnRpZXMgKERN
QSBmdW5jdGlvbiBibG9ja3MpOgo+ICAgIGFyZ3VtZW50LCBzZWUgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2lvbW11L21lZGlhdGVrLGlvbW11LnR4dAo+ICAgIGZvciBkZXRhaWxz
Lgo+Cj4gK09wdGlvbmFsIHByb3BlcnRpZXMgKFJETUEgZnVuY3Rpb24gYmxvY2tzKToKPiArLSBt
ZWRpYXRlayxyZG1hX2ZpZm9fc2l6ZTogcmRtYSBmaWZvIHNpemUgbWF5IGJlIGRpZmZlcmVudCBl
dmVuIGluIHNhbWUgU09DLCBhZGQgdGhpcwo+ICsgIHByb3BlcnR5IHRvIHRoZSBjb3JyZXNwb25k
aW5nIHJkbWEKPiArICB0aGUgdmFsdWUgaXMgdGhlIE1heCB2YWx1ZSB3aGljaCBkZWZpbmVkIGlu
IGhhcmR3YXJlIGRhdGEgc2hlZXQuCj4gKwo+ICBFeGFtcGxlczoKPgo+ICBtbXN5czogY2xvY2st
Y29udHJvbGxlckAxNDAwMDAwMCB7Cj4gQEAgLTIwNywzICsyMTIsMTIgQEAgb2RAMTQwMjMwMDAg
ewo+ICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmc2Nwc3lzIE1UODE3M19QT1dFUl9ET01BSU5f
TU0+Owo+ICAgICAgICAgY2xvY2tzID0gPCZtbXN5cyBDTEtfTU1fRElTUF9PRD47Cj4gIH07Cj4g
Kwo+ICtyZG1hMTogcmRtYUAxNDAwYzAwMCB7Cj4gKyAgICAgICBjb21wYXRpYmxlID0gIm1lZGlh
dGVrLG10ODE4My1kaXNwLXJkbWEiOwo+ICsgICAgICAgcmVnID0gPDAgMHgxNDAwYzAwMCAwIDB4
MTAwMD47Cj4gKyAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMjI5IElSUV9UWVBFX0xFVkVM
X0xPVz47Cj4gKyAgICAgICBwb3dlci1kb21haW5zID0gPCZzY3BzeXMgTVQ4MTgzX1BPV0VSX0RP
TUFJTl9ESVNQPjsKPiArICAgICAgIGNsb2NrcyA9IDwmbW1zeXMgQ0xLX01NX0RJU1BfUkRNQTE+
Owo+ICsgICAgICAgbWVkaWF0ZWsscmRtYV9maWZvX3NpemUgPSA8MjA0OD47Cj4gK307CgpJIHdv
dWxkIGxpa2UgeW91IHRvIHNob3cgcmRtYTAgYXMgd2VsbCBzbyB0aGF0IGNvdWxkIHByb3ZlIHR3
byByZG1hCmhhdmUgZGlmZmVyZW50IGZpZm8gc2l6ZSBpbiB0aGUgc2FtZSBTb0MuCgpSZWdhcmRz
LApDaHVuLUt1YW5nLgoKPiAtLQo+IDEuOC4xLjEuZGlydHkKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dAo+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5n
IGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
