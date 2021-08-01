Return-Path: <SRS0=bJmk=MY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6DFCC4338F
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Aug 2021 00:37:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B5F861055
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Aug 2021 00:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B5F861055
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ak6P/AWMRhLO3oiPaEQd3MT5gKPnAYwFJFAZvd87cC8=; b=Fbh29k2B0SgdxZ
	0N6kSghZKH8yvooDOL8HruW6LN93y1s8CmBK7jQv+EjIu1VqfQromJymlf2rr6DT/KiYeKHDefAaj
	TW7xVcoN3UF9Gb3Srh+jNbzVOAyR/S63UPy/nerJWlx/A4Ij2aaR7MAGv+xTrXsPI72zwyWzkKv0/
	Rk0fChzMQmpwzzjcMbE4RiRxOIveDRlYMZW+uySvkN6yxFfKNYnWzPsg9Fycudm5RspGF8edFoCP0
	DLVzY9kOt/SGWFThtu0VRk3K9iTEwVzim/5rgoQpYWnRMD4VpkOD/S267u83wkAGj9OnP0oC30QlX
	T9MyWoobQx/a7zWkbScw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9zTl-00CXWH-Jr; Sun, 01 Aug 2021 00:37:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9zTX-00CXT1-AR; Sun, 01 Aug 2021 00:37:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1D7361077;
 Sun,  1 Aug 2021 00:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627778226;
 bh=3JavNvosscnPl0cKpKchPRZKHTqWBRvdfJhDj49Ch9I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mGqrD+PcCAJ1zGEBOw+Sw41cTTUqJY9sdcjy3hA6W1IOrlv7KFp4nkUgj/TFi0uQO
 dY76R3R5/v/6YloJBbFnJLV64cCTJWT/2HimfHtfV4W+4ZGqgtEAcsvgg6Gy9orJx7
 l7MS8sw+9ODs5bMUy4OfwwGZ/jqGqn1rf1Eq1mS9b7cUOF+sAdXG8wXL+BHSleS2tj
 zojEsDwU++BLlZzygd1gwdMM9iMbYYbnUreA+VmxrzQZxDTiWpjDZ34fRIdNEbvsxl
 62ziqL/svpYbpcfEAw5ppNtOKeKS9D32H/aPwsOKty2uk0dzmNN5/6q+EiEgXhgL2L
 JL8fFoOvj6hzg==
Received: by mail-ed1-f49.google.com with SMTP id n2so19154118eda.10;
 Sat, 31 Jul 2021 17:37:06 -0700 (PDT)
X-Gm-Message-State: AOAM532L5Xt0RgJRl8EMiZ9xXtkvy3pscs4X1+5XuvwdfIZ2AlgtiswO
 pl3KeHNNG7dEnhH48UUDnuqVDLKmUlxfFhz53Q==
X-Google-Smtp-Source: ABdhPJwGejZmn+ir4WLj0iJxidWR2q1q2GQkCkoU8d81JhftGj7k3aKFDFGlAWds7B1EA+JK8Gd2VPe/dvPyFj2Eddw=
X-Received: by 2002:a50:d71e:: with SMTP id t30mr11285964edi.72.1627778225214; 
 Sat, 31 Jul 2021 17:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210729170737.21424-1-jason-jh.lin@mediatek.com>
 <20210729170737.21424-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20210729170737.21424-2-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 1 Aug 2021 08:36:54 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9sasTb=W3Kkhx-UZ-ATSe_ge8A14pmOHFCOQjag89r0Q@mail.gmail.com>
Message-ID: <CAAOTY_9sasTb=W3Kkhx-UZ-ATSe_ge8A14pmOHFCOQjag89r0Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] arm64: dts: mt8195: add display node for vdosys0
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, fshao@chromium.org, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Hsin-Yi Wang <hsinyi@chromium.org>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 singo.chang@mediatek.com, DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210731_173707_433465_33AECE45 
X-CRM114-Status: GOOD (  14.38  )
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
MjAyMeW5tDfmnIgzMOaXpSDpgLHkupQg5LiK5Y2IMTowN+Wvq+mBk++8mgo+Cj4gQWRkIGRpc3Bs
YXkgbm9kZSBmb3IgdmRvc3lzMC4KPgo+IFNpZ25lZC1vZmYtYnk6IGphc29uLWpoLmxpbiA8amFz
b24tamgubGluQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiBUaGlzIHBhdGNoIGlzIGJhc2VkIG9uIFsx
XVsyXVszXVs0XQo+Cj4gWzFdYXJtNjQ6IGR0czogQWRkIE1lZGlhdGVrIFNvQyBNVDgxOTUgYW5k
IGV2YWx1YXRpb24gYm9hcmQgZHRzIGFuZCBNYWtlZmlsZQo+IC0gaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjEwNjAxMDc1MzUwLjMx
NTE1LTItc2VpeWEud2FuZ0BtZWRpYXRlay5jb20vCj4gWzJdYXJtNjQ6IGR0czogbXQ4MTk1OiBh
ZGQgSU9NTVUgYW5kIHNtaSBub2Rlcwo+IC0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9w
cm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjEwNjE1MTczMjMzLjI2NjgyLTE1LXRpbmdo
YW4uc2hlbkBtZWRpYXRlay5jb20vCj4gWzNdYXJtNjQ6IGR0czogbXQ4MTk1OiBhZGQgZ2NlIG5v
ZGUKPiAtIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRl
ay9wYXRjaC8yMDIxMDcwNTA1MzQyOS40MzgwLTQtamFzb24tamgubGluQG1lZGlhdGVrLmNvbS8K
PiBbNF1hZGQgbXQ4MTk1IFNvQyBEUk0gYmluZGluZwo+IC0gaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL2xpc3QvP3Nlcmllcz01MTk1OTcKPiAtLS0K
PiAgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTUuZHRzaSB8IDExMiArKysrKysr
KysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTEyIGluc2VydGlvbnMoKykKPgo+
IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5NS5kdHNpIGIv
YXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTUuZHRzaQo+IGluZGV4IDA0ZDNlOTUx
NzVmYS4uNGZhNDdjYjJiZWRlIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVk
aWF0ZWsvbXQ4MTk1LmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210
ODE5NS5kdHNpCj4gQEAgLTExNTUsOSArMTE1NSwxMjEgQEAKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAjY2xvY2stY2VsbHMgPSA8MT47Cj4gICAgICAgICAgICAgICAgIH07Cj4KCltzbmlwXQoK
PiArCj4gKyAgICAgICAgICAgICAgIG1lcmdlMDogZGlzcF92cHBfbWVyZ2UwQDFjMDE0MDAwIHsK
PiArICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5NS1k
aXNwLW1lcmdlIjsKPiArICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MCAweDFjMDE0MDAw
IDAgMHgxMDAwPjsKPiArICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19T
UEkgNjU2IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
cG93ZXItZG9tYWlucyA9IDwmc3BtIE1UODE5NV9QT1dFUl9ET01BSU5fVkRPU1lTMD47Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZ2ZG9zeXMwIENMS19WRE8wX1ZQUF9NRVJH
RTA+OwoKV2h5IHRoaXMgbWVyZ2UgaGFzIG5vIGFzeW5jIGNsb2NrPwoKUmVnYXJkcywKQ2h1bi1L
dWFuZy4KCj4gKyAgICAgICAgICAgICAgICAgICAgICAgbWVkaWF0ZWssZ2NlLWNsaWVudC1yZWcg
PQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmZ2NlMSBTVUJTWVNfMWMwMVhY
WFggMHg0MDAwIDB4MTAwMD47Cj4gKyAgICAgICAgICAgICAgIH07Cj4gKwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
