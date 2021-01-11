Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A1DBC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 23:50:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE03922BED
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 23:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE03922BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lg97UPk/0t/Q4qf/S0EiN2nxKpFMLxgIjG92zilVSKM=; b=V8ZRD1wcGKtdVC6NzEMD1uxb1
	gid9l+Ros6ETTbzYtPeR9/xmx/ghTI0vLhGVF9+ZKGym4c/IKusJL/t5hpSTDXE/Hv+UIWbyspz1J
	Wn7udTKkwkM8T2+jUPczI4U/rVCZOzIcU4xFk1hh+8OZTT+vztHTbvluJTIkwbvs+N8i8p87RIezp
	7PTJt2VD67qBvKNGuMv0V8leYHIO/SKnmGeIsio/7gD2Q1pcAL4pC9oxpD4Bpqu4HWjMRvadpSJCf
	YzcarmuMiKcgB2PtN+GFP8chaERWTwXyns+sWcbgspvRShLk1+sQfIVH5DhT1jsOUdFdtBZzxipmJ
	77Rhob5sg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz6xE-00049j-Ee; Mon, 11 Jan 2021 23:50:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz6x4-00045X-EP; Mon, 11 Jan 2021 23:50:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C39A22BED;
 Mon, 11 Jan 2021 23:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610409021;
 bh=7YRMvE845hC7SAVXz/U/NF9WxBp7q4L/HB0jlWcqqVU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Lrzp2zbK7APcbmjCCCv0vJu/ty5To01Fq6cbVVmMwxYiiv2J2JwFrIfphZetDHv3/
 pxoAVneTZnJX7oghB1xRLmSFyup0O/+Jy020Ov3u7psjAxu7mzIl73WpRvmR053r+u
 7csdeeuUyBxtANKtSjtf7hd7TnOL4sXEebmM1Ktk97XAxIoKYZ+0Nf+mHzsTAbiuoR
 GHfHFoP2Y8cj3RMDVwbanwcg1gMxn3AP1SjCVvMFmbyiRjlJOKUB8RScGwfkz9vzWu
 JYQknH1DyE1VTzeYkxdil6aTTgV2dbBra9atRqx+TmSMb5IWImmkMQLLz0UiGbGbKa
 Ovx5cxzbSllpQ==
Received: by mail-ej1-f54.google.com with SMTP id n26so888831eju.6;
 Mon, 11 Jan 2021 15:50:21 -0800 (PST)
X-Gm-Message-State: AOAM533iV0nHogp8b5AMOSEoaT/CXbVwJiF9ZwrcncXMmbl/0z5SWlV8
 +whI2/HXUd/xowNQURiNXrKOcLaVKWFL0dsolg==
X-Google-Smtp-Source: ABdhPJxVy9VDMMYfYRVMs9afxI0l5RRiNtKc2yMSb9lG3FiW9P61v7cZ+yR5sHJHLZMW2E0QIlo4LzB1ZzkCSbrrWtg=
X-Received: by 2002:a17:907:2108:: with SMTP id
 qn8mr1236249ejb.127.1610409019978; 
 Mon, 11 Jan 2021 15:50:19 -0800 (PST)
MIME-Version: 1.0
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
 <1610351031-21133-7-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1610351031-21133-7-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 12 Jan 2021 07:50:09 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8CaUr-zZXoBsQTXvxeO88WhHm0neg5RuDR1KG6NsaWwA@mail.gmail.com>
Message-ID: <CAAOTY_8CaUr-zZXoBsQTXvxeO88WhHm0neg5RuDR1KG6NsaWwA@mail.gmail.com>
Subject: Re: [PATCH v3, 06/15] drm/mediatek: add component RDMA4
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_185022_570425_BE9B5E82 
X-CRM114-Status: GOOD (  17.57  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 CK Hu <ck.hu@mediatek.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMeW5tDHmnIgxMeaXpSDpgLHkuIAg5LiL5Y2IMzo0NOWvq+mBk++8mgo+Cj4gVGhp
cyBwYXRjaCBhZGQgY29tcG9uZW50IFJETUE0CgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8
Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5p
dSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZGRwX2NvbXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21w
LmMKPiBpbmRleCBiYzZiMTBhLi5mYzAxZmVhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gQEAgLTM5Miw2ICszOTIsNyBAQCBzdHJ1Y3QgbXRr
X2RkcF9jb21wX21hdGNoIHsKPiAgICAgICAgIFtERFBfQ09NUE9ORU5UX1JETUEwXSAgID0geyBN
VEtfRElTUF9SRE1BLCAgICAgIDAsIE5VTEwgfSwKPiAgICAgICAgIFtERFBfQ09NUE9ORU5UX1JE
TUExXSAgID0geyBNVEtfRElTUF9SRE1BLCAgICAgIDEsIE5VTEwgfSwKPiAgICAgICAgIFtERFBf
Q09NUE9ORU5UX1JETUEyXSAgID0geyBNVEtfRElTUF9SRE1BLCAgICAgIDIsIE5VTEwgfSwKPiAr
ICAgICAgIFtERFBfQ09NUE9ORU5UX1JETUE0XSAgID0geyBNVEtfRElTUF9SRE1BLCAgICAgIDQs
IE5VTEwgfSwKPiAgICAgICAgIFtERFBfQ09NUE9ORU5UX1VGT0VdICAgID0geyBNVEtfRElTUF9V
Rk9FLCAgICAgIDAsICZkZHBfdWZvZSB9LAo+ICAgICAgICAgW0REUF9DT01QT05FTlRfV0RNQTBd
ICAgPSB7IE1US19ESVNQX1dETUEsICAgICAgMCwgTlVMTCB9LAo+ICAgICAgICAgW0REUF9DT01Q
T05FTlRfV0RNQTFdICAgPSB7IE1US19ESVNQX1dETUEsICAgICAgMSwgTlVMTCB9LAo+IC0tCj4g
MS44LjEuMS5kaXJ0eQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
