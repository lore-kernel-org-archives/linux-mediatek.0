Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1566DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 13:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q9mzRQAzcR2rB/HK/4WdCIWSGo0uRy/QzrxF1qBIIGY=; b=aapoLyqw8cpIXu
	oTEEOVx0MnKhazbA0PrNHOjtjrPMflczmFi5+HCz3XGdEIPmPewrmiPlX+1iffL8RvT4S/H8og8jd
	4CQEzhimSx01+QC6h/ZOegWJmqgFCfgOlbVGCH1nq3PG0MY6OWqfbIwncTW6fhhUrtRlKvJyP8i4Y
	WrAbh3jth2KwhdTmtrf7a8pAsJaW1ekmOwwzmweamyM0DK2lia+tTkHEJA3Kj/dQBIAmzpBX5Jav4
	vHwezE+pJzuIr+ISBHjQmZgdth+lPpobj2jLpDMQBVyMu7TO1/eXbXasZkRuvQOuNtWOm2/OeYmY6
	m6RkqNIPLPYc3Rt6iYNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc5VA-006Dw2-By; Wed, 06 Apr 2022 13:15:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc5V8-006Dvb-BJ
 for linux-mediatek@bombadil.infradead.org; Wed, 06 Apr 2022 13:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
 :Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=8N0CvfLws0NLfRseiGnNqJN6eohHipGooNObOqOlBoc=; b=QakLC7E/agO4GKPkEtIsoSFI3f
 N86i6MArXUUcPjh86cp5DvkPyDCfdX+K4oJsdGBOBg7JJlrgPd9hLsJmU43jL1QCbvKdBCB/+1N9K
 T3AUPs3vnP5X96gmv0+5UTLx2OCu6kDpHaN2w21zQjebaVbtsK/LVQQeQzBGcSWb63c/kU2+lERDk
 4tNgVjrewyZ29qhJnO0Ut8tLbV3qNm5+zFSKAlXZlFTC1lD+ugsW1Xk7vEzus/ELZWt61wWnUHDGx
 v34gF1Gd3fweAh5hkgAy+h9mhCC8tpa1h79zoa+qPkJV7z3UhLqtrqf/3959cNWm6vZvmiD657YM7
 ECa/lmtw==;
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc5V1-002Auv-Hs
 for linux-mediatek@lists.infradead.org; Wed, 06 Apr 2022 13:15:08 +0000
Received: by mail-qv1-xf32.google.com with SMTP id kc20so2184925qvb.3
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Apr 2022 06:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :content-transfer-encoding:user-agent:mime-version;
 bh=8N0CvfLws0NLfRseiGnNqJN6eohHipGooNObOqOlBoc=;
 b=EvQQ/HwBH9nTQj1t5326cVr1a8c+tpiFpSw2vuQcKK4x1e0TX8OBzNpnPZ096XFsrE
 0ReG2cE6XRXkl41gyZjT1S/DgUXamBCWr4HVULUDSQM2wWOOPKeRifJ5M6EXG2QzqlZc
 rW69m0WEf3gxCTxUmY2EuNEMZu9dgd4aWHjmhCZHXdDbhC8OSIdOWbLE64/7BLNiW3X2
 kBP2BEgL7y7aFgyN3ebhig0yxbvsPW0+UHATP2UhXGdpweSmVBjQq/HX9htgqGjYbsQg
 jjAWm0ttcxyAOtfp1LxwQ0cRTv8+AsL2Fx1Y2MQxfqDJ3dvKWOVv0BxVUknTX3MAsC6A
 3Ukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=8N0CvfLws0NLfRseiGnNqJN6eohHipGooNObOqOlBoc=;
 b=WxcCFLIfC/WI+uOj+DpF0SHik44UtJZJLefwvMrL7mMRmsoCtuEgwKV5bUVwYcive4
 +OrSTDruo5D74/79LrXIk6/JPemzlaeTey6Sa8X/CtGK+zDaKhrvuJNbd470DqFM6OwA
 MFzSQ/3HkehJ2iHHESgN3HyCrelM02eV+equQ7ZCksjMVw44GgHVqb5KWSXY4Re00sFx
 fTuBrSOS7r50wVDZledMXWCNLkwDEucsvLHWloMm7cW0+Sm38whECcAvOEAqbOqGR8Cy
 KaWE8qJYQ64QjE5V+IuSoYR32dJlMz6H6Sm51rrqt+H+Gv6qIjtEYhQKtUcqCIaVfWt9
 qAiQ==
X-Gm-Message-State: AOAM530QvEaM8TKtGbAaZEg5LwN+8+hPrQTTOGwHOb/8WZUQJ03amcW0
 agIujRvvQTS9ZPdqVcyh18qqxw==
X-Google-Smtp-Source: ABdhPJySaVPBdyzFHzfJKSHKkPd1JA+dpYpBIJIxwqBWJeTCDsXQB8+GyZydfPlDh/ZW4wIZUkA5IQ==
X-Received: by 2002:a05:6214:4011:b0:443:e253:61fc with SMTP id
 kd17-20020a056214401100b00443e25361fcmr6868372qvb.110.1649250896805; 
 Wed, 06 Apr 2022 06:14:56 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net.
 [173.246.12.168]) by smtp.gmail.com with ESMTPSA id
 t67-20020ae9df46000000b006809a144ac1sm10369209qkf.99.2022.04.06.06.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 06:14:56 -0700 (PDT)
Message-ID: <5c200bbb0e2d73642115649f05f945840b0ef67a.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: Fix v4l2 compliance decoder
 cmd test fail
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Tomasz
 Figa <tfiga@google.com>
Cc: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>,  Hsin-Yi Wang <hsinyi@chromium.org>, Fritz
 Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,  dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, 
 linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Wed, 06 Apr 2022 09:14:54 -0400
In-Reply-To: <20220406012048.5970-1-yunfei.dong@mediatek.com>
References: <20220406012048.5970-1-yunfei.dong@mediatek.com>
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_141505_276231_756A273B 
X-CRM114-Status: GOOD (  15.36  )
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

TGUgbWVyY3JlZGkgMDYgYXZyaWwgMjAyMiDDoCAwOToyMCArMDgwMCwgWXVuZmVpIERvbmcgYSDD
qWNyaXTCoDoKPiBXaWxsIHJldHVybiAtRUlOVkFMIHVzaW5nIHN0YW5kYXJkIGZyYW1ld29yayBh
cGkgd2hlbiB0ZXN0IHN0YXRlbGVzcwo+IGRlY29kZXIgd2l0aCBjbWQgVklESU9DXyhUUlkpREVD
T0RFUl9DTUQuCj4gCj4gVXNpbmcgYW5vdGhlciByZXR1cm4gdmFsdWUgdG8gYWRqdXN0IHY0bDIg
Y29tcGxpYW5jZSB0ZXN0IGZvciB1c2VyCj4gZHJpdmVyKEdTdHJlYW1lci9DaHJvbWUpIHdvbid0
IHVzZSBkZWNvZGVyIGNtZC4KPiAKPiBGaXhlczogOGNkYzM3OTRiMmUzICgibWVkaWE6IG10ay12
Y29kZWM6IHZkZWM6IHN1cHBvcnQgc3RhdGVsZXNzIEFQSSIpCj4gU2lnbmVkLW9mZi1ieTogWXVu
ZmVpIERvbmcgPHl1bmZlaS5kb25nQG1lZGlhdGVrLmNvbT4KPiBSZXZpZXdlZC1ieTogQW5nZWxv
R2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3Jh
LmNvbT4KCkFja2VkLWJ5OiBOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1ZnJlc25lQGNvbGxh
Ym9yYS5jb20+Cgo+IC0tLQo+IGNoYW5nZXMgY29tcGFyZWQgd2l0aCB2MjoKPiAtIGFkZCByZXZp
ZXdlZC1ieSB0YWcKPiBjaGFuZ2VzIGNvbXBhcmVkIHdpdGggdjE6Cj4gLSBhZGQgRml4ZXM6IHRh
Zwo+IC0tLQo+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9tdGtfdmNv
ZGVjX2RlYy5jIHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlh
dGVrL3Zjb2RlYy9tdGtfdmNvZGVjX2RlYy5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRp
YXRlay92Y29kZWMvbXRrX3Zjb2RlY19kZWMuYwo+IGluZGV4IDM4NTllNGM2NTFjNi4uNjliMGU3
OTdkMzQyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNv
ZGVjL210a192Y29kZWNfZGVjLmMKPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlh
dGVrL3Zjb2RlYy9tdGtfdmNvZGVjX2RlYy5jCj4gQEAgLTUxLDggKzUxLDcgQEAgc3RhdGljIGlu
dCB2aWRpb2NfdHJ5X2RlY29kZXJfY21kKHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkICpwcml2LAo+
ICAKPiAgCS8qIFVzZSBNMk0gc3RhdGVsZXNzIGhlbHBlciBpZiByZWxldmFudCAqLwo+ICAJaWYg
KGN0eC0+ZGV2LT52ZGVjX3BkYXRhLT51c2VzX3N0YXRlbGVzc19hcGkpCj4gLQkJcmV0dXJuIHY0
bDJfbTJtX2lvY3RsX3N0YXRlbGVzc190cnlfZGVjb2Rlcl9jbWQoZmlsZSwgcHJpdiwKPiAtCQkJ
CQkJCQljbWQpOwo+ICsJCXJldHVybiAtRU5PVFRZOwo+ICAJZWxzZQo+ICAJCXJldHVybiB2NGwy
X20ybV9pb2N0bF90cnlfZGVjb2Rlcl9jbWQoZmlsZSwgcHJpdiwgY21kKTsKPiAgfQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
