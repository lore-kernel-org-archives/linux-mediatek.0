Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC43C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 01:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LSQPtCH693gzGOcABUfapNU8bF9n8mdhJvpRtgISBDY=; b=01OypmQ5GNt2CO
	ReauMNNbqvULdlLJobXKwIGcTyypXwCBC4YtReXGC/byKYfYoTK8c8wu0fqoHKooRDrYRCuHlXIo/
	j5aIGQQhBwV6YMh1EkCGekoAlQQcl+Pcj6d7w1bdkdWf5tkWKAGeeOTLruVuLgHt3753xrKm6o0zF
	ZpfEDtwYSaTgzjsUuKdbNefDA+QNXanbcZwYztpSlACaB9ImJkbTwEqd6aoE8gRN55VWJV0ZhO01s
	+eIHSS8HndcZwGeODdQD4B+7d7o2Uqffc+FLLG7A7Dhe/T9vyG5dDmA4Uwq2mQ9NKvb+GRpnRzoVP
	6f5y8f8gSpjgGnYmJdBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOrbP-00EbE5-QP; Tue, 01 Mar 2022 01:46:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOrbL-00EbDc-Up; Tue, 01 Mar 2022 01:46:57 +0000
X-UUID: 9a44f460536b454aae3a8635bd9529af-20220228
X-UUID: 9a44f460536b454aae3a8635bd9529af-20220228
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 645208683; Mon, 28 Feb 2022 18:46:45 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Feb 2022 17:46:43 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 1 Mar 2022 09:46:42 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 1 Mar 2022 09:46:42 +0800
Message-ID: <fa9a04263ed0b1aa54a140e7eec47e838d3e5587.camel@mediatek.com>
Subject: Re: [PATCH v4 2/2] drm/mediatek: add devlink to cmdq dev
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 1 Mar 2022 09:46:42 +0800
In-Reply-To: <CAAOTY__rnVMRB=OhkTm4Ojh31yAcYwCQTBGozpGsnC_oC_jqvQ@mail.gmail.com>
References: <20211202064039.20797-1-jason-jh.lin@mediatek.com>
 <20211202064039.20797-3-jason-jh.lin@mediatek.com>
 <CAAOTY__rnVMRB=OhkTm4Ojh31yAcYwCQTBGozpGsnC_oC_jqvQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_174656_024463_02BF55C6 
X-CRM114-Status: GOOD (  12.33  )
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 singo.chang@mediatek.com, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, tzungbi@google.com,
 Nancy Lin <nancy.lin@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQ2h1bi1LdWFuZywKClRoYW5rcyBmb3IgdGhlIHJldmlld3MuCgpJIGZvcmdvdCB0byBhZGQg
dGhlIGNvbW1lbnQgdGhhdCB0aGUgcGF0Y2ggc2hvdWxkIGJlIGJhc2VkIG9uIFsxXS4KV2UgY2Fu
IG9ubHkgYXBwbHkgaXQgYWZ0ZXIgYXBwbHlpbmcgWzFdLgoKU28gcGxlYXNlIGFwcGx5IGl0IGFm
dGVyIHRoYXQuIFRoYW5rIHlvdSB2ZXJ5IG11Y2ghCgpSZWdhcmRzLApKYXNvbi1KSC5MaW4KLS0t
ClsxXSBkcm0vbWVkaWF0ZWs6IG1vZGlmeSBtZWRpYXRlay1kcm0gZm9yIG10ODE5NSBtdWx0aSBt
bXN5cyBzdXBwb3J0CgpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgt
bWVkaWF0ZWsvcGF0Y2gvMjAyMjAyMjIxMDA3NDEuMzAxMzgtMjEtbmFuY3kubGluQG1lZGlhdGVr
LmNvbS8KLS0tCgpPbiBTdW4sIDIwMjItMDItMjcgYXQgMTE6MzMgKzA4MDAsIENodW4tS3Vhbmcg
SHUgd3JvdGU6Cj4gSGksIEphc29uOgo+IAo+IEJ1aWxkIGVycm9yOgo+IAo+IC4uL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYzogSW4gZnVuY3Rpb24KPiDigJhtdGtfZHJt
X2NydGNfY3JlYXRl4oCZOgo+IC4uL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Ny
dGMuYzo5MDI6MjY6IGVycm9yOiDigJhzdHJ1Y3QKPiBtdGtfZHJtX3ByaXZhdGXigJkgaGFzIG5v
IG1lbWJlciBuYW1lZCDigJhkZXbigJkKPiAgIG10a19jcnRjLT5kcm1fZGV2ID0gcHJpdi0+ZGV2
Owo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+IC4uL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2NydGMuYzo5NzQ6MzA6IGVycm9yOiDigJhzdHJ1Y3QKPiBtdGtfZHJtX3By
aXZhdGXigJkgaGFzIG5vIG1lbWJlciBuYW1lZCDigJhkZXbigJkKPiAgICBsaW5rID0gZGV2aWNl
X2xpbmtfYWRkKHByaXYtPmRldiwgbXRrX2NydGMtPmNtZHFfY2xpZW50LmNoYW4tCj4gPm1ib3gt
PmRldiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gSW4gZmlsZSBpbmNsdWRl
ZCBmcm9tIC4uL2luY2x1ZGUvbGludXgvZGV2aWNlLmg6MTU6MCwKPiAgICAgICAgICAgICAgICAg
IGZyb20gLi4vaW5jbHVkZS9saW51eC9kbWEtbWFwcGluZy5oOjcsCj4gICAgICAgICAgICAgICAg
ICBmcm9tIC4uL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYzo3Ogo+IC4u
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYzo5Nzc6MTY6IGVycm9yOiDi
gJhzdHJ1Y3QKPiBtdGtfZHJtX3ByaXZhdGXigJkgaGFzIG5vIG1lbWJlciBuYW1lZCDigJhkZXbi
gJkKPiAgICAgZGV2X2Vycihwcml2LT5kZXYsICJVbmFibGUgdG8gbGluayBkZXY9JXNcbiIsCj4g
ICAgICAgICAgICAgICAgIF4KPiBSZWdhcmRzLAo+IENodW4tS3VhbmcuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
