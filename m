Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66E0C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 18:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t3HGk/y8i42gL9tSNdgBOuYRC7G/O2E/OdIupeg5sJc=; b=xx+qSVg5R2ULVh
	frUwbKJLqK1MNcHFqsvar+L/UnzLL8zFN8aEkIvpI4vgAPApQF+fmAoY9ppazokhkIWlpZ3yHw39C
	KFb9QKZvNFgvQl5S+kIQkGd+vmyDa0nDcQ0+NBsWOMSlKwRgkbIiAruL+/YRbwfyjNTARt5V/EA04
	tyxixWpPte47shF1tKcnN0hh5TarHjIdGf6JtySV0xj+csqSatbMm44zivcPKFJurIA1sa+cff8l/
	q6PLMshpzd/e2e0cjnveuJi6ujJW+eZZMgHNarKzKs5ldd55lVxasA8EVU5veo8m5gNF5TtCH5Isj
	E634AhqiXZlSKOgLeAZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP7ZZ-000D5D-Gr; Tue, 01 Mar 2022 18:50:09 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP7ZW-000D3r-Iw
 for linux-mediatek@lists.infradead.org; Tue, 01 Mar 2022 18:50:07 +0000
Received: by mail-qk1-x735.google.com with SMTP id n185so13683289qke.5
 for <linux-mediatek@lists.infradead.org>; Tue, 01 Mar 2022 10:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=tR+m3BKtc2q7T6REjyTd+tbxkuYAbwb84wcNcVtcDDo=;
 b=qv5pnnvk7TeB5F2VVork6VcyASkHuuOWpbcXzJ/cyRI1+PmIYBs0U/EhxwQ2jdj+iz
 ctAJe9aKpLrV9V6eod+MqOLF+7QiLy6rK3fu33GePVDsbqQmnuhE4iWBKDcnPXK3Xv76
 KPohYg/mFz2m3Zsr2NedsoI1aJoRw2JRXFjNubOcth+U1/2fAxw4X9GX4vE685YUHQ28
 sQv3PydxnGXuozXRJ9RMqeXb8xDJBTJmcf91k/L9cFuON1fxzCJlrb/gUoRQiVr/NaQV
 7BSHai6kmrDU03Az1bPf2EYC2mSqSYYo5T5M1N0vBIFrL5rK9XKddEJohWn7UTm7gZrd
 AdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=tR+m3BKtc2q7T6REjyTd+tbxkuYAbwb84wcNcVtcDDo=;
 b=mPZNk5WgcsXTwuSpJBJrODl4gsPWaNdAAZmLcmgY44pTEDKINHHr63BNogo2uFSiSD
 n+snqi19GJRpRpjAC7833sK8DcwTjznmuLl9dTLD9GCy1OP+70LGn1GL4H4RRdc5VQLi
 Rw6tMoxPHelp8o5CoMhp3RUCvMGUaQxbjYvA7RNnSRzGQ1zdx1819iC8YAdAG2/QQ3xs
 yocmHl60irYh8OFFe3jwOdtK7hvFEu/hNxtj1q6iFH09pkv3Wn2v9235Ieg6XwKGrQJH
 lrTvQ8fW/SJJ9+eDOf+NFxBLZ8gcIm+HmvGieWKkg/RkGlkxwCjcK6FY8PbLNt3cSuUW
 xP/A==
X-Gm-Message-State: AOAM5328IeiQnJ4+9X0fDAGoRsAnn53UgODTJp12rok3Gr342nO9LTdZ
 IZJKJZvZnOag3y1uPmVDs0rP1Q==
X-Google-Smtp-Source: ABdhPJzSf4CtwvIG03wik3crXOBqVn2fR41pWQVrAZp/7qf1AZE3+yMudYLmNy+Tlo28zIT/Kyx94g==
X-Received: by 2002:a37:6c45:0:b0:478:a755:8845 with SMTP id
 h66-20020a376c45000000b00478a7558845mr14371883qkc.362.1646160605528; 
 Tue, 01 Mar 2022 10:50:05 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net.
 [173.246.12.168]) by smtp.gmail.com with ESMTPSA id
 h17-20020a37de11000000b0047caf996ef8sm7044983qkj.20.2022.03.01.10.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 10:50:05 -0800 (PST)
Message-ID: <9d44d2136ba60e7471ea82551f4cfed2c030ce2b.camel@ndufresne.ca>
Subject: Re: [PATCH v7, 05/15] media: mtk-vcodec: Call
 v4l2_m2m_set_dst_buffered() set capture buffer buffered
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi
 Shih <tzungbi@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Cc: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>,  Hsin-Yi Wang <hsinyi@chromium.org>, Fritz
 Koenig <frkoenig@chromium.org>, Dafna Hirschfeld
 <dafna.hirschfeld@collabora.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang
 <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Tue, 01 Mar 2022 13:50:03 -0500
In-Reply-To: <20220223034008.15781-6-yunfei.dong@mediatek.com>
References: <20220223034008.15781-1-yunfei.dong@mediatek.com>
 <20220223034008.15781-6-yunfei.dong@mediatek.com>
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_105006_714097_88DC0A1F 
X-CRM114-Status: GOOD (  15.41  )
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

TGUgbWVyY3JlZGkgMjMgZsOpdnJpZXIgMjAyMiDDoCAxMTozOSArMDgwMCwgWXVuZmVpIERvbmcg
YSDDqWNyaXTCoDoKPiBsYXQgdGhyZWFkOiBvdXRwdXQgcXVldWUgICAgICBcCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0+IGxhdCBoYXJkd2FyZSAtPiBsYXQgdHJhbnMgYnVmZmVy
Cj4gICAgICAgICAgICAgbGF0IHRyYW5zIGJ1ZmZlciAgLwo+IAo+IGNvcmUgdGhyZWFkOiBjYXB0
dXJlIHF1ZXVlICAgICBcCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtPmNvcmUg
aGFyZHdhcmUgLT4gY2FwdHVyZSBxdWV1ZQo+ICAgICAgICAgICAgICBsYXQgdHJhbnMgYnVmZmVy
ICAvCj4gCj4gTGF0IGFuZCBjb3JlIHdvcmsgaW4gZGlmZmVyZW50IHRocmVhZCwgc2V0dGluZyBj
YXB0dXJlIGJ1ZmZlciBidWZmZXJlZC4KCi4uLiBzbyB0aGF0IG91dHB1dCBxdWV1ZSBidWZmZXJz
IChiaXRzdHJlYW0pIGNhbiBiZSBwcm9jZXNzIHJlZ2FyZGxlc3MgaWYgdGhlcmUKaXMgYXZhaWxh
YmxlIGNhcHR1cmUgYnVmZmVycy4KCkkgaGF2ZSBjb25jZXJucyBhcm91bmQgdGhlIHVzZWZ1bG5l
c3Mgb2YgcnVubmluZyBhIGRlZGljYXRlZCB0aHJlYWQgdG8gZHJpdmUgdGhlCmxhdCBhbmQgdGhl
IGNvcmUgYmxvY2tzLiBIYXZpbmcgMyB0aHJlYWRzIChjb3VudGluZyB0aGUgbTJtIHdvcmtlciB0
aHJlYWQpIGhlcmUKaW5jcmVhc2UgdGhlIGNvbXBsZXhpdHkuIFRoZSBoYXJkd2FyZSBpcyBhc3lu
Y2hyb25vdXMgYnkgZGVmaW5pdGlvbi4gSSB0aGluawp0aGlzIHBhdGNoIHdpbGwgZ28gYXdheSBh
ZnRlciBhIHByb3BlciByZXdvcmsgb2YgdGhlIGRyaXZlciB0aHJlYWQgbW9kZWwgaGVyZS4KCj4g
Cj4gU2lnbmVkLW9mZi1ieTogWXVuZmVpIERvbmcgPHl1bmZlaS5kb25nQG1lZGlhdGVrLmNvbT4K
PiAtLS0KPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZGVj
X3N0YXRlbGVzcy5jIHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zj
b2RlY19kZWNfc3RhdGVsZXNzLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMv
bXRrX3Zjb2RlY19kZWNfc3RhdGVsZXNzLmMKPiBpbmRleCA1YWViZjg4Zjk5N2IuLjIzYTE1NGM0
ZTMyMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRr
X3Zjb2RlY19kZWNfc3RhdGVsZXNzLmMKPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210
ay12Y29kZWMvbXRrX3Zjb2RlY19kZWNfc3RhdGVsZXNzLmMKPiBAQCAtMzE0LDYgKzMxNCw5IEBA
IHN0YXRpYyB2b2lkIG10a19pbml0X3ZkZWNfcGFyYW1zKHN0cnVjdCBtdGtfdmNvZGVjX2N0eCAq
Y3R4KQo+ICAJc3JjX3ZxID0gdjRsMl9tMm1fZ2V0X3ZxKGN0eC0+bTJtX2N0eCwKPiAgCQkJCSBW
NEwyX0JVRl9UWVBFX1ZJREVPX09VVFBVVF9NUExBTkUpOwo+ICAKPiArCWlmIChjdHgtPmRldi0+
dmRlY19wZGF0YS0+aHdfYXJjaCAhPSBNVEtfVkRFQ19QVVJFX1NJTkdMRV9DT1JFKQo+ICsJCXY0
bDJfbTJtX3NldF9kc3RfYnVmZmVyZWQoY3R4LT5tMm1fY3R4LCAxKTsKPiArCj4gIAkvKiBTdXBw
b3J0IHJlcXVlc3QgYXBpIGZvciBvdXRwdXQgcGxhbmUgKi8KPiAgCXNyY192cS0+c3VwcG9ydHNf
cmVxdWVzdHMgPSB0cnVlOwo+ICAJc3JjX3ZxLT5yZXF1aXJlc19yZXF1ZXN0cyA9IHRydWU7CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
