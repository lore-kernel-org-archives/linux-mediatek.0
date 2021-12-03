Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70876C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Dec 2021 00:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=opcsXZgT2oSgu020cpHnskgiMPPZQV3hdrO2s+MyVOQ=; b=fvdEe+wMFG7Eue
	oi8mhO9d0zo/WlB42+IdWXZU7CWP++Nb3IzlbFrBemOdDJ1Uy8fx2b27JzwzT0GNt4WlrbQHeEkRo
	MfbDfm9MMrJrMMe5Pr8B68Fkqt9muPhAS1T8sqC7Bs8ikc+qORz99SXWydiDbXaJIyF5Y8fL5j90t
	KXXMfj2qgsXal9XZUgHEtpm28T+nkuma6MqLoF8udKlk3JJsUXUypvQyssXFiBC5mm5uiBKm2tDe0
	rXtyOzFT9flom9q4CSYB3xmqKY9ZXOWTTaOLxg88n1JGj1iIyj/lj2eacZ0a3ZIkz55izGaQxnBU9
	4biv4HP6qW/8kkkY3CFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msw6b-00DnLF-VK; Fri, 03 Dec 2021 00:07:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msw6P-00DnHm-1K; Fri, 03 Dec 2021 00:07:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9D4D5628F6;
 Fri,  3 Dec 2021 00:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD281C56747;
 Fri,  3 Dec 2021 00:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638490018;
 bh=hUUGmi1Kxjg4GVMJJk27j4s8CR+5/UrEzujzqqM7DVc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lODZkcZ6BvnOCz4O6iIV8krAEhmKF9YU38giD5x/tcmBjHGC3UagRE9v+yFJwvKCg
 vj6BIa+dluXsClTi/MxisQBtIOISTtvwatHIfILWRDwS17zmq05s5SQqKHNHB4nvNG
 J5JxyfEG+BRwHjpfqF4Hxj4PRPsQ/AbshzYRawqO+P4dJhXlv19pa/4EHR4XseSRsA
 B3ObZEF8xI3U7IwT6l9AUu8peIJdLqzRkud5+SUOpKyn0T+TEhwHhMaynBvaFn8xRq
 6BH/qAfQJ+saTZr6CJWlVOqGhYAWlwJ9fMb4Z8wNYSVxzyALMQZfhrwdwnNdYOdvcF
 dGzEVF5XoTayQ==
Received: by mail-ed1-f51.google.com with SMTP id x15so4693311edv.1;
 Thu, 02 Dec 2021 16:06:58 -0800 (PST)
X-Gm-Message-State: AOAM531trEaWK0RSpdqmGEJkR0swnr/A4Fi5q4iApkm18uGMj7lb5ppo
 Xj4c8CWYPScHVhHMQP2J2XyM2XcS3hbCV9/Ihg==
X-Google-Smtp-Source: ABdhPJy/vfyFg8Uq9KjiNMxw9kzU+8NVCXfS+xyKdO85QAO1nUO0e3tnO/OopVm4P79WiTBhXyFZoO0samMN/lsdoo4=
X-Received: by 2002:a17:907:7f2a:: with SMTP id
 qf42mr19657908ejc.388.1638490017099; 
 Thu, 02 Dec 2021 16:06:57 -0800 (PST)
MIME-Version: 1.0
References: <20211129184439.16892-1-jason-jh.lin@mediatek.com>
 <20211129184439.16892-11-jason-jh.lin@mediatek.com>
In-Reply-To: <20211129184439.16892-11-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 3 Dec 2021 08:06:45 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-edo+HagSJPxgFyYT2itXk4isbY=fnd=o6YO8kx0Ms=g@mail.gmail.com>
Message-ID: <CAAOTY_-edo+HagSJPxgFyYT2itXk4isbY=fnd=o6YO8kx0Ms=g@mail.gmail.com>
Subject: Re: [PATCH v13 10/15] drm/mediatek: remove unused define in
 mtk_drm_ddp_comp.c
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fei Shao <fshao@chromium.org>, Moudy Ho <moudy.ho@mediatek.com>,
 roy-cw.yeh@mediatek.com, Fabien Parent <fparent@baylibre.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com, 
 DTML <devicetree@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_160701_177448_E468C013 
X-CRM114-Status: GOOD (  13.29  )
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
MjAyMeW5tDEx5pyIMzDml6Ug6YCx5LqMIOS4iuWNiDI6NDTlr6vpgZPvvJoKPgo+IFJlbW92ZSB0
aGUgdW5zZWQgZGVmaW5lIGluIG10a19kcm1fZGRwX2NvbXAuYwoKQXBwbGllZCB0byBtZWRpYXRl
ay1kcm0tbmV4dCBbMV0sIHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRl
ay1kcm0tbmV4dAoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBqYXNv
bi1qaC5saW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+Cj4gUmV2aWV3ZWQtYnk6IENodW4t
S3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIHwgMTAgLS0tLS0tLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMTAgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2RkcF9jb21wLmMKPiBpbmRleCAzNzA0ZTRiN2YzYzUuLjdkM2JkNjIxNGMxNSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+IEBAIC0y
MSw4ICsyMSw2IEBACj4gICNpbmNsdWRlICJtdGtfZHJtX2NydGMuaCIKPgo+ICAjZGVmaW5lIERJ
U1BfT0RfRU4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDAwMAo+IC0jZGVmaW5lIERJ
U1BfT0RfSU5URU4gICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDAwOAo+IC0jZGVmaW5lIERJ
U1BfT0RfSU5UU1RBICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDAwYwo+ICAjZGVmaW5lIERJ
U1BfT0RfQ0ZHICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDAyMAo+ICAjZGVmaW5lIERJ
U1BfT0RfU0laRSAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDAzMAo+ICAjZGVmaW5lIERJ
U1BfRElUSEVSXzUgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDExNAo+IEBAIC0zOSwyNiAr
MzcsMTggQEAKPiAgI2RlZmluZSBESVRIRVJfRU5HSU5FX0VOICAgICAgICAgICAgICAgICAgICAg
ICBCSVQoMSkKPiAgI2RlZmluZSBESVNQX0RJVEhFUl9TSVpFICAgICAgICAgICAgICAgICAgICAg
ICAweDAwMzAKPgo+IC0jZGVmaW5lIExVVF8xMEJJVF9NQVNLICAgICAgICAgICAgICAgICAgICAg
ICAgIDB4MDNmZgo+IC0KPiAgI2RlZmluZSBPRF9SRUxBWU1PREUgICAgICAgICAgICAgICAgICAg
ICAgICAgICBCSVQoMCkKPgo+ICAjZGVmaW5lIFVGT19CWVBBU1MgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEJJVCgyKQo+Cj4gICNkZWZpbmUgRElTUF9ESVRIRVJJTkcgICAgICAgICAgICAg
ICAgICAgICAgICAgQklUKDIpCj4gICNkZWZpbmUgRElUSEVSX0xTQl9FUlJfU0hJRlRfUih4KSAg
ICAgICAgICAgICAgKCgoeCkgJiAweDcpIDw8IDI4KQo+IC0jZGVmaW5lIERJVEhFUl9PVkZMV19C
SVRfUih4KSAgICAgICAgICAgICAgICAgICgoKHgpICYgMHg3KSA8PCAyNCkKPiAgI2RlZmluZSBE
SVRIRVJfQUREX0xTSElGVF9SKHgpICAgICAgICAgICAgICAgICAoKCh4KSAmIDB4NykgPDwgMjAp
Cj4gLSNkZWZpbmUgRElUSEVSX0FERF9SU0hJRlRfUih4KSAgICAgICAgICAgICAgICAgKCgoeCkg
JiAweDcpIDw8IDE2KQo+ICAjZGVmaW5lIERJVEhFUl9ORVdfQklUX01PREUgICAgICAgICAgICAg
ICAgICAgIEJJVCgwKQo+ICAjZGVmaW5lIERJVEhFUl9MU0JfRVJSX1NISUZUX0IoeCkgICAgICAg
ICAgICAgICgoKHgpICYgMHg3KSA8PCAyOCkKPiAtI2RlZmluZSBESVRIRVJfT1ZGTFdfQklUX0Io
eCkgICAgICAgICAgICAgICAgICAoKCh4KSAmIDB4NykgPDwgMjQpCj4gICNkZWZpbmUgRElUSEVS
X0FERF9MU0hJRlRfQih4KSAgICAgICAgICAgICAgICAgKCgoeCkgJiAweDcpIDw8IDIwKQo+IC0j
ZGVmaW5lIERJVEhFUl9BRERfUlNISUZUX0IoeCkgICAgICAgICAgICAgICAgICgoKHgpICYgMHg3
KSA8PCAxNikKPiAgI2RlZmluZSBESVRIRVJfTFNCX0VSUl9TSElGVF9HKHgpICAgICAgICAgICAg
ICAoKCh4KSAmIDB4NykgPDwgMTIpCj4gLSNkZWZpbmUgRElUSEVSX09WRkxXX0JJVF9HKHgpICAg
ICAgICAgICAgICAgICAgKCgoeCkgJiAweDcpIDw8IDgpCj4gICNkZWZpbmUgRElUSEVSX0FERF9M
U0hJRlRfRyh4KSAgICAgICAgICAgICAgICAgKCgoeCkgJiAweDcpIDw8IDQpCj4gLSNkZWZpbmUg
RElUSEVSX0FERF9SU0hJRlRfRyh4KSAgICAgICAgICAgICAgICAgKCgoeCkgJiAweDcpIDw8IDAp
Cj4KPiAgI2RlZmluZSBESVNQX1BPU1RNQVNLX0VOICAgICAgICAgICAgICAgICAgICAgICAweDAw
MDAKPiAgI2RlZmluZSBQT1NUTUFTS19FTiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIEJJVCgwKQo+IC0tCj4gMi4xOC4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
