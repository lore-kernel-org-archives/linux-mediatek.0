Return-Path: <SRS0=6w7/=HO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6460EC4332D
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Feb 2021 14:41:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D0BC64E8A
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Feb 2021 14:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D0BC64E8A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4hlDV4GcIuJI2nsuMWExLv5d6ZcXbX4aI/rMTcoh0UE=; b=wA8G1qdjtBaxB7jv0bkDbaREA
	OrEh56I1leGY5j0sDP9PqesZ0GQPC2YqlBDtnKkr+jXQHTr0fc3CLsm8tUroTcF5+i7iKybyStLfD
	UZXwhrqIMJgExRpUwHyyfnCjSRLJ5+edNq9FTiE0e/MmbciAQHqZC7BpPn/C2tIjdkystxekq5l9r
	iZgC4tP2GaHnKKqPjt3M8CwyC8CM6NBWYV6wG6HWlagsRo/MWMiO3Kbms/XN/Fcb2ROAc7qDHgJlF
	m+P54xcL7TAa48Se69qMd93WV7VuE+xYK5vxnOTtlBP46rGfpsVUxNunpWtAQfIgYxT1OAA8H4jmo
	yvJItJYFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAZde-00058T-Hw; Fri, 12 Feb 2021 14:41:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAZdZ-00056k-QV; Fri, 12 Feb 2021 14:41:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D13C864E6B;
 Fri, 12 Feb 2021 14:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613140897;
 bh=w41GzsJk0Vogbh4l71xjGxLnYcjpT88j2ABTUyR0CPA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CMJycKMceiGxoVjgh66jMjcZGvF/VK0b5CQPBqftuYsiYWCVToXNfbG4tzSjxa45T
 820jRA1mpFm2F6XQLAZQ+YNjN6CR48/YM7qEYXZ0zA73VLCLS2hEldmADLAo9crSCo
 Fypz0aHib4ZJ1dUeK1BX1iMHA/DamncbRbNsxEXOtfZmnDvQVacS93v6JcaA6IoBma
 FDvCISxq9JB0n+ZCz3Df3KFhH4X6lLv2hhMCJPDDKi40FfdnnV/v0Ijx5b0gGGLDOr
 z+JbUd2J5mE1STVwthrR/nDJwnlk7bW6X4M6vCDnvM5YcIykZZXFwX61UYSleHHj9E
 YXt6C3hKpaq2Q==
Received: by mail-wm1-f45.google.com with SMTP id i9so1242381wmq.1;
 Fri, 12 Feb 2021 06:41:36 -0800 (PST)
X-Gm-Message-State: AOAM530VD8MfCoo6AtaFwJcOShDPKL0rMd6b5uv6sQ92Fd6UMnh+ocqH
 /SPTyWWAYqavJeKjDAmbipdEHHdjBikgdbpfqA==
X-Google-Smtp-Source: ABdhPJzdFy4n8dWcKUYHoVq6+dVbyp7JXRlajzvwa8pvXT90zRWzOYhLksxIrD/3To51pG8WvOViuzKeUWRQtAPU1Qc=
X-Received: by 2002:a1c:5f82:: with SMTP id t124mr2937914wmb.55.1613140895464; 
 Fri, 12 Feb 2021 06:41:35 -0800 (PST)
MIME-Version: 1.0
References: <20210201070016.41721-1-chunfeng.yun@mediatek.com>
 <20210201070016.41721-4-chunfeng.yun@mediatek.com>
In-Reply-To: <20210201070016.41721-4-chunfeng.yun@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 12 Feb 2021 22:41:24 +0800
X-Gmail-Original-Message-ID: <CAAOTY__G=+8q=8WiRsh4Qvfk5GQz3D4iFTBecWXGq7hX_7_m_g@mail.gmail.com>
Message-ID: <CAAOTY__G=+8q=8WiRsh4Qvfk5GQz3D4iFTBecWXGq7hX_7_m_g@mail.gmail.com>
Subject: Re: [PATCH next v3 04/16] dt-bindings: phy: mediatek: hdmi-phy:
 modify compatible items
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210212_094138_041350_670B2F86 
X-CRM114-Status: GOOD (  14.02  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 DTML <devicetree@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIENodW5mZW5nOgoKQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPiDm
lrwgMjAyMeW5tDLmnIgx5pelIOmAseS4gCDkuIvljYgzOjAw5a+r6YGT77yaCj4KPiBtdDc2MjMt
aGRtaS10eCBpcyBjb21wYXRpYmxlIHRvIG10MjcwMS1oZG1pLXR4LCBhbmQgdGhlIGNvbXBhdGli
bGUKPiAibWVkaWF0ZWssbXQ3NjIzLWhkbWktdHgiIGlzIG5vdCBzdXBwb3J0ZWQgaW4gZHJpdmVy
LCBpbiBmYWN0IHVzZXMKPiAibWVkaWF0ZWssbXQyNzAxLWhkbWktdHgiIGluc3RlYWQgb24gTVQ3
NjIzLCBzbyBjaGFuZ2VzIHRoZQo+IGNvbXBhdGlibGUgaXRlbXMgdG8gbWFrZSBkZXBlbmRlbmNl
IGNsZWFyLgoKQWNrZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3Jn
PgoKPgo+IENjOiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPiBDYzog
UGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPiBTaWduZWQtb2ZmLWJ5OiBD
aHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+Cj4gLS0tCj4gdjM6IG1vZGlm
eSBjb21taXQgbWVzc2FnZQo+IHYyOiBubyBjaGFuZ2VzCj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3BoeS9tZWRpYXRlayxoZG1pLXBoeS55YW1sICAgIHwgMTEgKysrKysrKy0tLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21lZGlhdGVr
LGhkbWktcGh5LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21l
ZGlhdGVrLGhkbWktcGh5LnlhbWwKPiBpbmRleCA0NzUyNTE3YTE0NDYuLjBkOTQ5NTBiODRjYSAx
MDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21lZGlh
dGVrLGhkbWktcGh5LnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcGh5L21lZGlhdGVrLGhkbWktcGh5LnlhbWwKPiBAQCAtMjEsMTAgKzIxLDEzIEBAIHByb3Bl
cnRpZXM6Cj4gICAgICBwYXR0ZXJuOiAiXmhkbWktcGh5QFswLTlhLWZdKyQiCj4KPiAgICBjb21w
YXRpYmxlOgo+IC0gICAgZW51bToKPiAtICAgICAgLSBtZWRpYXRlayxtdDI3MDEtaGRtaS1waHkK
PiAtICAgICAgLSBtZWRpYXRlayxtdDc2MjMtaGRtaS1waHkKPiAtICAgICAgLSBtZWRpYXRlayxt
dDgxNzMtaGRtaS1waHkKPiArICAgIG9uZU9mOgo+ICsgICAgICAtIGl0ZW1zOgo+ICsgICAgICAg
ICAgLSBlbnVtOgo+ICsgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ3NjIzLWhkbWktcGh5Cj4g
KyAgICAgICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDI3MDEtaGRtaS1waHkKPiArICAgICAgLSBj
b25zdDogbWVkaWF0ZWssbXQyNzAxLWhkbWktcGh5Cj4gKyAgICAgIC0gY29uc3Q6IG1lZGlhdGVr
LG10ODE3My1oZG1pLXBoeQo+Cj4gICAgcmVnOgo+ICAgICAgbWF4SXRlbXM6IDEKPiAtLQo+IDIu
MTguMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
