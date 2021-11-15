Return-Path: <SRS0=W1mV=QC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F35C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 23:34:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79A3963223
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 23:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79A3963223
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2O7wTT9hNtOAnfyn2kW9nEvqoehWzJbp+6U27BYqj6Q=; b=hm+NKN6qx/cKbC
	pLGogP5daZCZak4RI5DP99sB+JKBC6fw6PtlDaCPs1Goe0eMMpy//iFDwyIXERtPvncMdw3DEqP4B
	zEdCq2gG3QliunbyT8fiG3gDrEkbCxDGjKE3MpJGA5lEkGu27cRw876y/DXWghG3XX2szzlCy3FkI
	w6f8dg/HAZS6znNNug8/w7aKN7BaSDjakN9y77uv2FkCd/Ijai3QYiTpxv5KbI9ryzSLX4MTkKG9i
	JScWSejKWM6ev2N74xJu+1LQQYfuRfAPlzzNSSxMqp7bBQJWxtylJVKU8bEbsPG0La6F2eQ+wd9oj
	b3FOgeLezOZuV0Q4J8Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmlUg-00HImF-KG; Mon, 15 Nov 2021 23:34:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmlUT-00HIjv-Qa; Mon, 15 Nov 2021 23:34:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 151CB63255;
 Mon, 15 Nov 2021 23:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637019261;
 bh=TImIHqbp486HLuwHQvsUohXCnLk5VoW2gEDqvRP9Bv8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uJTH4aXwYaa+dSQMHLezRwehNizg4YsBHW4nowq/m7HD+udnSv4giJGTdAAJuKhQd
 OWbn3oaOB7gt7gEUN4e0GyWusfn1wGRLjmgvQQj877n1sEok1yrLjVlBdNJjUpDHYW
 mBy0cE6ycLj8/jYrJLVhAexR4HvSlvcjqDuaE8vA3JkSbQrXVYdsHHOssizJV0m2Wl
 Fmh0LtLVsSrZX9GPG31ubLoOf58pUQK+n3B5rPcB7QMRw1TWKaX9d4LU+xs9zXhaVe
 Hn/LpJ2cbVCekxxaoFEOAXcMlW+NdflLDago6i+ZuZHO4eq/eqP8jk4AalYShi+UcK
 jx2t0pvwrgX9Q==
Received: by mail-ed1-f41.google.com with SMTP id b15so78830248edd.7;
 Mon, 15 Nov 2021 15:34:21 -0800 (PST)
X-Gm-Message-State: AOAM533JLWI+yEELs6KRaw1dtZxWaVTk7vgASPQVm4PuNSuyyu7VabTS
 JI2OPIk7K3eGK9zI3cUAvibM2dGccFtyCRDu6Q==
X-Google-Smtp-Source: ABdhPJyigb0xM4tUbMt5283H/raL8mEwtPWWbhCfWI/2StAgMHYuqxQHh9LRuw1npThsAwOZ+I4iT2VnrXstnJeipDM=
X-Received: by 2002:aa7:d3d0:: with SMTP id o16mr3686530edr.159.1637019259273; 
 Mon, 15 Nov 2021 15:34:19 -0800 (PST)
MIME-Version: 1.0
References: <20210930155222.5861-1-yongqiang.niu@mediatek.com>
 <20210930155222.5861-2-yongqiang.niu@mediatek.com>
In-Reply-To: <20210930155222.5861-2-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 16 Nov 2021 07:34:08 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8++T24XmaxneZCEqiWSMmUG=EEd5Jhs+6Szn9fQACt-Q@mail.gmail.com>
Message-ID: <CAAOTY_8++T24XmaxneZCEqiWSMmUG=EEd5Jhs+6Szn9fQACt-Q@mail.gmail.com>
Subject: Re: [PATCH v10, 1/5] drm/mediatek: add component OVL_2L2
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
X-CRM114-CacheID: sfid-20211115_153421_931358_0F78D585 
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
aXMgcGF0Y2ggYWRkIGNvbXBvbmVudCBPVkxfMkwyCgpBcHBsaWVkIHRvIG1lZGlhdGVrLWRybS1u
ZXh0IFsxXSwgdGhhbmtzLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRybS1u
ZXh0CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBO
aXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+IFJldmlld2VkLWJ5OiBDaHVuLUt1YW5n
IEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBIc2luLVlpIFdh
bmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2RkcF9jb21wLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRw
X2NvbXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiBp
bmRleCAzM2U4Nzg5ZmRlOGEuLjRhMmFiY2YzZTVmOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+IEBAIC0zNTMsNiArMzUzLDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBtdGtfZGRwX2NvbXBfbWF0Y2ggbXRrX2RkcF9tYXRjaGVzW0REUF9DT01Q
T05FTlRfSURfTUFYXSA9IHsKPiAgICAgICAgIFtERFBfQ09NUE9ORU5UX09WTDFdICAgID0geyBN
VEtfRElTUF9PVkwsICAgICAgIDEsICZkZHBfb3ZsIH0sCj4gICAgICAgICBbRERQX0NPTVBPTkVO
VF9PVkxfMkwwXSA9IHsgTVRLX0RJU1BfT1ZMXzJMLCAgICAwLCAmZGRwX292bCB9LAo+ICAgICAg
ICAgW0REUF9DT01QT05FTlRfT1ZMXzJMMV0gPSB7IE1US19ESVNQX09WTF8yTCwgICAgMSwgJmRk
cF9vdmwgfSwKPiArICAgICAgIFtERFBfQ09NUE9ORU5UX09WTF8yTDJdID0geyBNVEtfRElTUF9P
VkxfMkwsICAgIDIsICZkZHBfb3ZsIH0sCj4gICAgICAgICBbRERQX0NPTVBPTkVOVF9QV00wXSAg
ICA9IHsgTVRLX0RJU1BfUFdNLCAgICAgICAwLCBOVUxMIH0sCj4gICAgICAgICBbRERQX0NPTVBP
TkVOVF9QV00xXSAgICA9IHsgTVRLX0RJU1BfUFdNLCAgICAgICAxLCBOVUxMIH0sCj4gICAgICAg
ICBbRERQX0NPTVBPTkVOVF9QV00yXSAgICA9IHsgTVRLX0RJU1BfUFdNLCAgICAgICAyLCBOVUxM
IH0sCj4gLS0KPiAyLjI1LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
