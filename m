Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD378C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 May 2022 22:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OFMtY1Rs6khqCtqtKbz+viNqHcNnMzniGUk0vMf2VeI=; b=kqP3aPrYKTDGsy
	IGOPdYwGonw4kuKAeBx6jhtgwY6NYhxWHXrZ5nWKGEs/siY0geg654MTa0PvjNZFTUdk6VzEBDq69
	Zf3Z9FxmJUud+cXGhpZJ5CCsp1ggsMVKRou/UlJamGubLwdihUzP7VERkTToKiea0Xlse0FkQ9ZIB
	EOGlD7GIliE4BCSL3VSa6puHnrc8CUB5xHDsa0iD7z22r3vmka2jf2vM6PHwBO8FkqO5TXWYrdvIW
	onktZQ5GSHKpZzTw7GvmJ455Lt/yt9ePi2gmPTdM/jtlaRwtEzixr//C6M66BVoCuGr9lmxxZU4kt
	HfmumWo9wLYOZL7vo8hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nq0WE-002VPm-KI; Sat, 14 May 2022 22:45:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nq0W3-002VNk-MM; Sat, 14 May 2022 22:45:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AEE0C60C75;
 Sat, 14 May 2022 22:45:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B96C34118;
 Sat, 14 May 2022 22:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652568336;
 bh=bS5HQAMDtikZldwnYUYBmDVi720L89RDOZV60SNkgDQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=G3X7Ev3uaoY/99lBrRDH0OqAad20kfM8hFPhKgOuiy71sVqP3jfe1TTCpq41mQr8L
 kYPnzbCMHWA6jUl1tjPUWUgNSW/7ouRo/NPU6rQAdBI4Dy+yAtZq7xXfMT5mMX5NiM
 N2W9MztlpmbJ/1e8Nr0FmquYQIAxKIs/0tYYng0cUog1vEKlaNMTvQVcxfRB73Pii3
 mIx7UT970RvOi6UJLcfSvIMv5CISDxRVc2azYHrqQJOChXgkzjsadFFE/6yuGiOQav
 W7s0iRCV6s0KCUxyKZa458d+pNBHY3TQQmOJ79m5r9t8R4HhM43mhaT8WwhII9tCn4
 sZQjFC7Tih8+w==
Received: by mail-yb1-f169.google.com with SMTP id p139so243127ybc.11;
 Sat, 14 May 2022 15:45:36 -0700 (PDT)
X-Gm-Message-State: AOAM533CnPKpl6JKWMTBDwKyD6PZrFoO5G2DhiMlJ9ba+S0wM7usf1JW
 9Of5luRvNl8sYs0i4rWA1clkX6826EYwU03NDg==
X-Google-Smtp-Source: ABdhPJzl9etzP0gMxcOzXLXqcN7qDo28gwQdlJmLqkufMpWnqlfrfltoJeXr0AOfQGCpVjoKglRILz+NUksdOsA4GYs=
X-Received: by 2002:a25:df16:0:b0:64a:9f33:829c with SMTP id
 w22-20020a25df16000000b0064a9f33829cmr11383457ybg.641.1652568335010; Sat, 14
 May 2022 15:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220419094143.9561-1-jason-jh.lin@mediatek.com>
 <20220419094143.9561-9-jason-jh.lin@mediatek.com>
 <402f0e60-8d3c-850d-84ff-af5424b72b73@gmail.com>
 <CAAOTY_-jiX_BhaZ5+skRu4RSZLjcHJerVtwH34fz4N6_jbVK0w@mail.gmail.com>
 <623fb170-b59a-84a0-3826-4b78968924bc@gmail.com>
In-Reply-To: <623fb170-b59a-84a0-3826-4b78968924bc@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 15 May 2022 06:45:24 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9gReO45qVhd5-9UrDYsDkOeS+FZT2Dw2McVgZvK3jfeg@mail.gmail.com>
Message-ID: <CAAOTY_9gReO45qVhd5-9UrDYsDkOeS+FZT2Dw2McVgZvK3jfeg@mail.gmail.com>
Subject: Re: [PATCH v20 8/8] soc: mediatek: remove DDP_DOMPONENT_DITHER from
 enum
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 "jason-jh.lin" <jason-jh.lin@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 CK Hu <ck.hu@mediatek.com>, 
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, 
 DTML <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220514_154539_850001_DEF69F9D 
X-CRM114-Status: GOOD (  25.08  )
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

SGksIE1hdHRoaWFzOgoKTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4g
5pa8IDIwMjLlubQ15pyIMTPml6Ug6YCx5LqUIOS4i+WNiDM6NDLlr6vpgZPvvJoKPgo+IEhpIENo
dW4tS3VhbmcsCj4KPiBPbiAwMi8wNS8yMDIyIDAwOjU0LCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+
ID4gSGksIE1hdHRoaWFzOgo+ID4KPiA+IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0Bn
bWFpbC5jb20+IOaWvCAyMDIy5bm0NOaciDIy5pelIOmAseS6lCDkuIvljYg4OjQy5a+r6YGT77ya
Cj4gPj4KPiA+Pgo+ID4+Cj4gPj4gT24gMTkvMDQvMjAyMiAxMTo0MSwgamFzb24tamgubGluIHdy
b3RlOgo+ID4+PiBBZnRlciBtbXN5cyBhbmQgZHJtIGNoYW5nZSBESVRIRVIgZW51bSB0byBERFBf
Q09NUE9ORU5UX0RJVEhFUjAsCj4gPj4+IG1tc3lzIGhlYWRlciBjYW4gcmVtb3ZlIHRoZSB1c2Vs
ZXNzIEREUF9DT01QT05FTlRfRElUSEVSIGVudW0uCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6
IGphc29uLWpoLmxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4KPiA+Pj4gUmV2aWV3ZWQt
Ynk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25v
QGNvbGxhYm9yYS5jb20+Cj4gPj4KPiA+PiBBY2tlZC1ieTogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0
dGhpYXMuYmdnQGdtYWlsLmNvbT4KPiA+Pgo+ID4+IENodW4tS3VhbmcsIEkgdGhpbmsgaXQgd291
bGQgbWFrZSBzZW5zZSB0byB0YWtlIHRoYXQgdGhyb3VnaCB5b3VyIHRyZWUgYXMgaXQKPiA+PiBk
ZXBlbmRzIG9uIHRoZSBwcmV2aW91cyBwYXRjaGVzLgo+ID4+Cj4gPj4gSSBwcm92aWRlIHlvdSBh
IHN0YWJsZSB0YWcgc28gdGhhdCB5b3UgY2FuIHRha2UgaXQ6Cj4gPj4gdjUuMTgtbmV4dC12ZHNv
MC1zdGFibGUtdGFnCj4gPgo+ID4gQWZ0ZXIgSSB0YWtlIHRoaXMgdGFnLCBJIGZpbmQgb25lIGNo
ZWNrcGF0Y2ggd2FybmluZzoKPiA+Cj4gPiBXQVJOSU5HOiBEVCBjb21wYXRpYmxlIHN0cmluZyAi
bWVkaWF0ZWssbXQ4MTk1LW1tc3lzIiBhcHBlYXJzCj4gPiB1bi1kb2N1bWVudGVkIC0tIGNoZWNr
IC4vRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzLwo+ID4gIzY3MDogRklMRTogZHJp
dmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmM6MzkwOgo+ID4gKyAgICAgICAgICAgICAgIC5j
b21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5NS1tbXN5cyIsCj4gPgo+ID4gSSB0aGluayB0aGlz
IHRhZyBsb3N0IG9uZSBiaW5kaW5nIHBhdGNoLCBpdCdzIGJldHRlciB0aGF0IHRoaXMgdGFnIGhh
cwo+ID4gbm8gdGhpcyB3YXJuaW5nLgo+ID4KPgo+IFNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseSBJ
IHdhcyBzaWNrLgo+IFRoZSB3YXJuaW5nIGlzLCBiZWNhdXNlIHRoZSBzdGFibGUgYnJhbmNoIG1p
c3NlcyBjb21taXQ6Cj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvbWF0dGhpYXMuYmdnL2xpbnV4LmdpdC9jb21taXQvP2g9djUuMTgtbmV4dC9zb2MmaWQ9
ODFjNWE0MWQxMGI5NjhlYTg5ZDVmNDRmZTFlNWMyZmM3MDI4OTIwOQo+Cj4gU28gaXQncyBub3Qg
YSByZWFsIGlzc3VlIGFuZCB3aWxsIGdvIGF3YXkgb25jZSBvdXIgYnJhbmNoZXMgbGFuZCBpbiB1
cHN0cmVhbS4KPiBJcyBpdCBPSyBmb3IgeW91IHRvIGlnbm9yZSB0aGUgaXNzdWU/CgpJdCdzIE9L
IGZvciBtZSwgYnV0IHRoZSBwYXRjaCB3b3VsZCBnbyB0aHJvdWdoIGRpZmZlcmVudCBtYWludGFp
bmVyJ3MKdHJlZSBhbmQgSSdtIG5vdCBzdXJlIGl0J3MgT0sgZm9yIGFsbCBvZiB0aGVtLiBTbyBJ
IHdvdWxkIHdhaXQgZm9yIHRoZQpuZWNlc3NhcnkgcGF0Y2ggbGFuZCBpbiB1cHN0cmVhbS4KClJl
Z2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4gUmVnYXJkcywKPiBNYXR0aGlhcwo+Cj4gPiBSZWdhcmRz
LAo+ID4gQ2h1bi1LdWFuZy4KPiA+Cj4gPj4KPiA+PiBSZWdhcmRzLAo+ID4+IE1hdHRoaWFzCj4g
Pj4KPiA+Pj4gLS0tCj4gPj4+ICAgIGluY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5
cy5oIHwgMyArLS0KPiA+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRl
bGV0aW9ucygtKQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9zb2MvbWVk
aWF0ZWsvbXRrLW1tc3lzLmggYi9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMu
aAo+ID4+PiBpbmRleCA1OTExN2Q5NzBkYWYuLmZiNzE5ZmQxMjgxYyAxMDA2NDQKPiA+Pj4gLS0t
IGEvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmgKPiA+Pj4gKysrIGIvaW5j
bHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmgKPiA+Pj4gQEAgLTE2LDggKzE2LDcg
QEAgZW51bSBtdGtfZGRwX2NvbXBfaWQgewo+ID4+PiAgICAgICAgRERQX0NPTVBPTkVOVF9DQ09S
UiwKPiA+Pj4gICAgICAgIEREUF9DT01QT05FTlRfQ09MT1IwLAo+ID4+PiAgICAgICAgRERQX0NP
TVBPTkVOVF9DT0xPUjEsCj4gPj4+IC0gICAgIEREUF9DT01QT05FTlRfRElUSEVSLAo+ID4+PiAt
ICAgICBERFBfQ09NUE9ORU5UX0RJVEhFUjAgPSBERFBfQ09NUE9ORU5UX0RJVEhFUiwKPiA+Pj4g
KyAgICAgRERQX0NPTVBPTkVOVF9ESVRIRVIwLAo+ID4+PiAgICAgICAgRERQX0NPTVBPTkVOVF9E
SVRIRVIxLAo+ID4+PiAgICAgICAgRERQX0NPTVBPTkVOVF9EUF9JTlRGMCwKPiA+Pj4gICAgICAg
IEREUF9DT01QT05FTlRfRFBfSU5URjEsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
