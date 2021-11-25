Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774EDC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Nov 2021 15:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1uTcQs+KBP7RwBGN9XMRPyWQ/1uhXwlcXU+XVWGQgd8=; b=jjImhpC39zVWSV
	cIL92S5QDfVBakDDLy+WBmQGbl3Rv7js9Ckx4nZcvZY+4Kdh3A67G+qqK00NKGXOH00R+UNQcn4qh
	tv2dsMrYMSnEtLsdESiFOskQIG13mcKXui48IBbMdsWXk7zt1715n+hcWnzHNBksPV343nmmeHQ/w
	pzgd10kkYbRD3gx6qI8Zf3urKxtQXc/TbL98rYe0DkCLd107fmhGDjRD6qMVFRjaN92v8JuQAKn+F
	JAXtcDwhkoieQASBmQEtA0AQkdy9seGliU1X4aEY2noe4iT64dkSP2FKYRNn8vvQOST9NbZ2GpBVZ
	mm4BiEX6xR9q9o3UfFGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqH4V-0087aD-RI; Thu, 25 Nov 2021 15:54:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqH4G-0087WP-Cy; Thu, 25 Nov 2021 15:53:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E1646113D;
 Thu, 25 Nov 2021 15:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637855628;
 bh=WQKBVuM8/HahVHD2Ha+5Ib66vd148D5kd4JIoF5YXYw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NJkIymGInuducGSTAKj/FQ8gLVkz2guOuDv+NT8zNFhcLJ4OYAtEIftb7v5XFBcgX
 JZ1x/jgUqfHXU9vVfmZSYZy+b6Vg/gw9woBsTGPEL9+Vv12wpZ6iUXQIt7lCnN8yln
 0GIaZUtswzpAGLUtFCwwUNzktWCSwsj3XmnCEx1tqK4MOe/+N6++JLBF/TshxWVyZc
 Chsh5hPgEKTETRUaPkgZ17zyJMxFNCoQWkQXk9ODLTxZam0Yr7erF/f/XmtfmW/B2s
 ky4iDsYpMMQyo5zvVp/y9/lzZbQ5joAp6UYTWD9IERHDzmy6/XjtkNkO8RQSZ0RKKq
 7BH3JvLwRkKng==
Received: by mail-ed1-f51.google.com with SMTP id g14so27413132edb.8;
 Thu, 25 Nov 2021 07:53:47 -0800 (PST)
X-Gm-Message-State: AOAM531J+1Mph03SiOU37Cveta/o6KabGMY8/76jw8KOpV6jtgUYUhw4
 XJxtH4nJzHrdL9/FahfFSb1tdHn3XErq8JSKBQ==
X-Google-Smtp-Source: ABdhPJyWuSCxWweua9Qb5oiDhlo9g8K+nlZBzMrHfDLk16MCEQQl+zFjUJxBfRZ+oWeUyMxTWfL4Uc81RcQThqCEADs=
X-Received: by 2002:a17:906:79c8:: with SMTP id
 m8mr30595476ejo.511.1637855626321; 
 Thu, 25 Nov 2021 07:53:46 -0800 (PST)
MIME-Version: 1.0
References: <20211026155911.17651-1-jason-jh.lin@mediatek.com>
 <20211026155911.17651-12-jason-jh.lin@mediatek.com>
In-Reply-To: <20211026155911.17651-12-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 25 Nov 2021 23:53:34 +0800
X-Gmail-Original-Message-ID: <CAAOTY__8Bh_Me8sDYgAM4ZQiDxkz55BZyrwNuVRqxyfK79rYkg@mail.gmail.com>
Message-ID: <CAAOTY__8Bh_Me8sDYgAM4ZQiDxkz55BZyrwNuVRqxyfK79rYkg@mail.gmail.com>
Subject: Re: [PATCH v12 11/16] drm/mediatek: remove unused define in
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
X-CRM114-CacheID: sfid-20211125_075348_504660_98817543 
X-CRM114-Status: GOOD (  13.54  )
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

SGksIEphc29uOgoKV2hlbiBJIGFwcGx5IHRoaXMgcGF0Y2ggdG8gbWVkaWF0ZWstZHJtLW5leHQs
IEkgZ2V0IHRoaXMgZXJyb3I6CgpBcHBseWluZzogZHJtL21lZGlhdGVrOiByZW1vdmUgdW51c2Vk
IGRlZmluZSBpbiBtdGtfZHJtX2RkcF9jb21wLmMKZXJyb3I6IHBhdGNoIGZhaWxlZDogZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYzo1MwoKUGxlYXNlIHJlYmFzZSB0
aGlzIHBhdGNoIG9udG8gbWVkaWF0ZWstZHJtLW5leHQuCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoK
amFzb24tamgubGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5tDEw5pyI
Mjbml6Ug6YCx5LqMIOS4i+WNiDExOjU55a+r6YGT77yaCj4KPiBSZW1vdmUgdGhlIHVuc2VkIGRl
ZmluZSBpbiBtdGtfZHJtX2RkcF9jb21wLmMKPgo+IFNpZ25lZC1vZmYtYnk6IGphc29uLWpoLmxp
biA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4KPiBSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBI
dSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2RkcF9jb21wLmMgfCAxMCAtLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxMCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kZHBfY29tcC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZGRwX2NvbXAuYwo+IGluZGV4IGYzZGI5NmExYjI0ZC4uODM5ZmZhZTMwMTljIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gQEAgLTIxLDggKzIx
LDYgQEAKPiAgI2luY2x1ZGUgIm10a19kcm1fY3J0Yy5oIgo+Cj4gICNkZWZpbmUgRElTUF9PRF9F
TiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwMDAwCj4gLSNkZWZpbmUgRElTUF9PRF9J
TlRFTiAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwMDA4Cj4gLSNkZWZpbmUgRElTUF9PRF9J
TlRTVEEgICAgICAgICAgICAgICAgICAgICAgICAgMHgwMDBjCj4gICNkZWZpbmUgRElTUF9PRF9D
RkcgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwMDIwCj4gICNkZWZpbmUgRElTUF9PRF9T
SVpFICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwMDMwCj4gICNkZWZpbmUgRElTUF9ESVRI
RVJfNSAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwMTE0Cj4gQEAgLTM5LDggKzM3LDYgQEAK
PiAgI2RlZmluZSBESVRIRVJfRU5HSU5FX0VOICAgICAgICAgICAgICAgICAgICAgICBCSVQoMSkK
PiAgI2RlZmluZSBESVNQX0RJVEhFUl9TSVpFICAgICAgICAgICAgICAgICAgICAgICAweDAwMzAK
Pgo+IC0jZGVmaW5lIExVVF8xMEJJVF9NQVNLICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDNm
Zgo+IC0KPiAgI2RlZmluZSBPRF9SRUxBWU1PREUgICAgICAgICAgICAgICAgICAgICAgICAgICBC
SVQoMCkKPgo+ICAjZGVmaW5lIFVGT19CWVBBU1MgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IEJJVCgyKQo+IEBAIC01MywxOCArNDksMTIgQEAKPgo+ICAjZGVmaW5lIERJU1BfRElUSEVSSU5H
ICAgICAgICAgICAgICAgICAgICAgICAgIEJJVCgyKQo+ICAjZGVmaW5lIERJVEhFUl9MU0JfRVJS
X1NISUZUX1IoeCkgICAgICAgICAgICAgICgoKHgpICYgMHg3KSA8PCAyOCkKPiAtI2RlZmluZSBE
SVRIRVJfT1ZGTFdfQklUX1IoeCkgICAgICAgICAgICAgICAgICAoKCh4KSAmIDB4NykgPDwgMjQp
Cj4gICNkZWZpbmUgRElUSEVSX0FERF9MU0hJRlRfUih4KSAgICAgICAgICAgICAgICAgKCgoeCkg
JiAweDcpIDw8IDIwKQo+IC0jZGVmaW5lIERJVEhFUl9BRERfUlNISUZUX1IoeCkgICAgICAgICAg
ICAgICAgICgoKHgpICYgMHg3KSA8PCAxNikKPiAgI2RlZmluZSBESVRIRVJfTkVXX0JJVF9NT0RF
ICAgICAgICAgICAgICAgICAgICBCSVQoMCkKPiAgI2RlZmluZSBESVRIRVJfTFNCX0VSUl9TSElG
VF9CKHgpICAgICAgICAgICAgICAoKCh4KSAmIDB4NykgPDwgMjgpCj4gLSNkZWZpbmUgRElUSEVS
X09WRkxXX0JJVF9CKHgpICAgICAgICAgICAgICAgICAgKCgoeCkgJiAweDcpIDw8IDI0KQo+ICAj
ZGVmaW5lIERJVEhFUl9BRERfTFNISUZUX0IoeCkgICAgICAgICAgICAgICAgICgoKHgpICYgMHg3
KSA8PCAyMCkKPiAtI2RlZmluZSBESVRIRVJfQUREX1JTSElGVF9CKHgpICAgICAgICAgICAgICAg
ICAoKCh4KSAmIDB4NykgPDwgMTYpCj4gICNkZWZpbmUgRElUSEVSX0xTQl9FUlJfU0hJRlRfRyh4
KSAgICAgICAgICAgICAgKCgoeCkgJiAweDcpIDw8IDEyKQo+IC0jZGVmaW5lIERJVEhFUl9PVkZM
V19CSVRfRyh4KSAgICAgICAgICAgICAgICAgICgoKHgpICYgMHg3KSA8PCA4KQo+ICAjZGVmaW5l
IERJVEhFUl9BRERfTFNISUZUX0coeCkgICAgICAgICAgICAgICAgICgoKHgpICYgMHg3KSA8PCA0
KQo+IC0jZGVmaW5lIERJVEhFUl9BRERfUlNISUZUX0coeCkgICAgICAgICAgICAgICAgICgoKHgp
ICYgMHg3KSA8PCAwKQo+Cj4gIHN0cnVjdCBtdGtfZGRwX2NvbXBfZGV2IHsKPiAgICAgICAgIHN0
cnVjdCBjbGsgKmNsazsKPiAtLQo+IDIuMTguMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
