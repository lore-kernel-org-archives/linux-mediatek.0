Return-Path: <SRS0=W1mV=QC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6092EC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 23:35:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20CD061B49
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 23:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 20CD061B49
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NREAzGME34hNMb5sAaDqbN0os1LzFRhwfxaEuwX7bLA=; b=Zs++FH+NZexwzz
	6Fp3JgMPZC4lEfgVsdFckORCOJE+q6LcBq1zRhE/33N8tnf1O6GdIJdzhbCRoaY5nnY5R6oQWJaks
	LhLHST3WQXXYe7BCL9WyzVFVDsNMWgIPpHAWkigHCbob7Y1DSlO31Bx5QdrO+yQw8jvN5tm2rtZNG
	Wkxg/QqdvaVnNk/gf/QyVWpG3Wrek8X5Fwp9EJGYRJ1clGgYvzqQ3DBwhNDCouRqDOWd/grbkxYQj
	HhH8dGi06XKp04GF0H/3SZTERyudSWYn+3+CyPNt4JVbOC4yoTeM8BtqmWJ8Y4kig7TiSsnlUzy0d
	lxHwlKzOofOTosHFbDNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmlVG-00HItZ-Vi; Mon, 15 Nov 2021 23:35:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmlV3-00HIqF-Gb; Mon, 15 Nov 2021 23:34:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2472B61B49;
 Mon, 15 Nov 2021 23:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637019297;
 bh=FVoHwv6pHc6/6XgellUtHB1/7EFg1uG9jPVCejpir7c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Qsl+5FNENbc0k27C3spFWxSg6s8O7fi7SluuoB5HnfClaxMEDiVlwxbNPRSlX6cAM
 TO2rnQ5fssRyJU2YXnQVwWcx00vE6rWoed64fA14OSlUdizF4ccQWT3+CmBMl4eWj2
 yiYHP2nMoBJ5owOEpyk1CPf0KoZ0wH5kMxwylJIZ7SxzmmPf0zPDIpAkYrDeZv1+sN
 umbo0G9OF9Ysjal6vS5K1f69PuXGtUvouExEXeSCDyKRI5BfHlU4eo4vj55qp5lZ0d
 N+4BDECfWJtAhzEXU44QqV3p7THZNxVp6613mDYHZ9HJTK8PTOv3NpM7UukZQSnfMm
 5Y6Rg8GP2lnhg==
Received: by mail-ed1-f54.google.com with SMTP id g14so79156592edz.2;
 Mon, 15 Nov 2021 15:34:57 -0800 (PST)
X-Gm-Message-State: AOAM530ihHIfbV4Z3/xXD8Y7faWIFJHqTZkcuLTVOXNP56f55sY9OMvl
 aU9YqldRLsz+0wfpv+QsHLZ+JzlZi+sb25zBxA==
X-Google-Smtp-Source: ABdhPJyAPUR8GQnQdfQ/dYtoPvmL7xu/FHsDaxqbWig0ok/Gn8g9Eu8SXqp+w5jYbe0YDdBmmqGHHyMrlvvqlvxjdb0=
X-Received: by 2002:a17:906:79c8:: with SMTP id
 m8mr3449107ejo.511.1637019295668; 
 Mon, 15 Nov 2021 15:34:55 -0800 (PST)
MIME-Version: 1.0
References: <20210930155222.5861-1-yongqiang.niu@mediatek.com>
 <20210930155222.5861-4-yongqiang.niu@mediatek.com>
In-Reply-To: <20210930155222.5861-4-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 16 Nov 2021 07:34:44 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8DPwrJMR3rJXHbBw31ex40h=T_e=Y+v8y_1CfbL1BYBQ@mail.gmail.com>
Message-ID: <CAAOTY_8DPwrJMR3rJXHbBw31ex40h=T_e=Y+v8y_1CfbL1BYBQ@mail.gmail.com>
Subject: Re: [PATCH v10, 3/5] drm/mediatek: add component RDMA4
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>, 
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_153457_609643_EF8B88F4 
X-CRM114-Status: GOOD (  12.51  )
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

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMeW5tDnmnIgzMOaXpSDpgLHlm5sg5LiL5Y2IMTE6NTLlr6vpgZPvvJoKPgo+IFRo
aXMgcGF0Y2ggYWRkIGNvbXBvbmVudCBSRE1BNAoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0tbmV4
dCBbMV0sIHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tbmV4
dAoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1
IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiBSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBI
dSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogSHNpbi1ZaSBXYW5n
IDxoc2lueWlAY2hyb21pdW0ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kZHBfY29tcC5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9j
b21wLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gaW5k
ZXggODkxNzBhZDgyNWZkLi42NDkxZWFkZjM0YzIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiBAQCAtNDAyLDYgKzQwMiw3IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgbXRrX2RkcF9jb21wX21hdGNoIG10a19kZHBfbWF0Y2hlc1tERFBfQ09NUE9O
RU5UX0lEX01BWF0gPSB7Cj4gICAgICAgICBbRERQX0NPTVBPTkVOVF9SRE1BMF0gICAgICAgICAg
ID0geyBNVEtfRElTUF9SRE1BLCAgICAgIDAsICZkZHBfcmRtYSB9LAo+ICAgICAgICAgW0REUF9D
T01QT05FTlRfUkRNQTFdICAgICAgICAgICA9IHsgTVRLX0RJU1BfUkRNQSwgICAgICAxLCAmZGRw
X3JkbWEgfSwKPiAgICAgICAgIFtERFBfQ09NUE9ORU5UX1JETUEyXSAgICAgICAgICAgPSB7IE1U
S19ESVNQX1JETUEsICAgICAgMiwgJmRkcF9yZG1hIH0sCj4gKyAgICAgICBbRERQX0NPTVBPTkVO
VF9SRE1BNF0gICAgICAgICAgID0geyBNVEtfRElTUF9SRE1BLCAgICAgIDQsICZkZHBfcmRtYSB9
LAo+ICAgICAgICAgW0REUF9DT01QT05FTlRfVUZPRV0gICAgICAgICAgICA9IHsgTVRLX0RJU1Bf
VUZPRSwgICAgICAwLCAmZGRwX3Vmb2UgfSwKPiAgICAgICAgIFtERFBfQ09NUE9ORU5UX1dETUEw
XSAgICAgICAgICAgPSB7IE1US19ESVNQX1dETUEsICAgICAgMCwgTlVMTCB9LAo+ICAgICAgICAg
W0REUF9DT01QT05FTlRfV0RNQTFdICAgICAgICAgICA9IHsgTVRLX0RJU1BfV0RNQSwgICAgICAx
LCBOVUxMIH0sCj4gLS0KPiAyLjI1LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
