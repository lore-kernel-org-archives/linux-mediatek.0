Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DC08C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 10:52:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF8DA651FD
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 10:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF8DA651FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a4XwXpQ+TQ2aUcxTYB8+/EGBKUXRHkRuCAWtm2KHZ2I=; b=qKc0Ue0+5aeH2Gyu4LwP534LN
	PvbWl8WSYvlxekTtA0GhBOPWJ4M4e/gMjN7PNo5fHg/9TezfVfHfw7yWmnFY7H/Nu+bMecMIUOtt3
	9TjTMJZuK9OuVU5QHCG9xcLoyQ/gpx7W2U18Aj7J8U17WraqYK8H2Ak6SFNTYWIeUNd1c3Q+yywHO
	fkWIR4Xfss3/C3xewbArA4I96we9HjY9XBmOU7UoMnxtqb/R/k2XgQ6SWJAzmTnIiP34+bZezuyR5
	AwiMYVTjm5WeFPa8xaejAvm/J8hkxfd7QdlhMy3sfgIrA8+xRV2hY7n3fvlkXNFqm72tAocjq4cpn
	6AdcT6P7A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJDVA-00GY4u-Vd; Mon, 08 Mar 2021 10:52:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJDV1-00GXzA-Bc; Mon, 08 Mar 2021 10:52:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B9883651FF;
 Mon,  8 Mar 2021 10:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615200747;
 bh=pMZw1TDBbUwEEUX1lkSoLFf+kqIBxMbLfKVSPQF9aaQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Cq/00uHwzgIWa2KhCcr2lkUukJ6RAb7W8ZHe5c0F53BJVsTwVQfIh7wW0MgtqdSrP
 2Fhdzs40UVdWveB9g+5MsYy3Q7JxWL1qORCs/1qonr8lKj/v1zZ99uwvh6VNZSgbIf
 KBuPyT6XPnWIu3pF+z64xNcEeyMBUG0pfZ839f3yxPUdNWVhDU3YBG9TihxLQfmJx3
 wBcMQaAkYeOY9yyebMeZGiLX9hwZdQoIMlLNMokOpbBpOgIRB7Xa9G/S4Rsa/kNg9m
 I22JRNGXbXB4Ki/nFerZAqxsFTRZ3pQOkv5i4BV0//HiJ3CCcdijtN0rVWMXJmiTlI
 aU4x6/1455Ujg==
Received: by mail-ed1-f50.google.com with SMTP id w9so13901257edt.13;
 Mon, 08 Mar 2021 02:52:26 -0800 (PST)
X-Gm-Message-State: AOAM530nt37LQmB0uOobYGqljDJjJMYJDLZgyzWBjP6vZR3UaVZ6LLHs
 tt2kXQQnPJC6sy0jIcz7xoTBaXrozAydeqQVFQ==
X-Google-Smtp-Source: ABdhPJwqrES4G6zQVHpgFQQXFeYCzz2BE4zfV+Kku+1yeWjOOp6BnRWpxzqG37t7y9Uurj0BLHKxt6C58JJCGy7Z2A4=
X-Received: by 2002:aa7:cf14:: with SMTP id a20mr21354191edy.49.1615200745215; 
 Mon, 08 Mar 2021 02:52:25 -0800 (PST)
MIME-Version: 1.0
References: <20210308070520.40429-1-chunfeng.yun@mediatek.com>
In-Reply-To: <20210308070520.40429-1-chunfeng.yun@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 8 Mar 2021 18:52:13 +0800
X-Gmail-Original-Message-ID: <CAAOTY__rno0A_8WCWHiNv6tLyqDOVe+dVmbJbv7_pDse+BTpSQ@mail.gmail.com>
Message-ID: <CAAOTY__rno0A_8WCWHiNv6tLyqDOVe+dVmbJbv7_pDse+BTpSQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8173: fix property typo of 'phys' in dsi
 node
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Cawa Cheng <cawa.cheng@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Jie Qiu <jie.qiu@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_105231_590210_08C7C3B5 
X-CRM114-Status: GOOD (  14.10  )
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

SGksIENodW5mZW5nOgoKQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPiDm
lrwgMjAyMeW5tDPmnIg45pelIOmAseS4gCDkuIvljYgzOjA15a+r6YGT77yaCj4KPiBVc2UgJ3Bo
eXMnIGluc3RlYWQgb2YgJ3BoeScuCgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1
YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gRml4ZXM6IDgxYWQ0ZGJhZjdhZiAoImFybTY0OiBkdHM6
IG10ODE3MzogQWRkIGRpc3BsYXkgc3Vic3lzdGVtIHJlbGF0ZWQgbm9kZXMiKQo+IENjOiBzdGFi
bGUgPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogQ2h1bmZlbmcgWXVu
IDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRz
L21lZGlhdGVrL210ODE3My5kdHNpIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRz
L21lZGlhdGVrL210ODE3My5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgx
NzMuZHRzaQo+IGluZGV4IDc1MDQwYTgyMGYwZC4uMDAzYTU2NTNjNTA1IDEwMDY0NAo+IC0tLSBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTczLmR0c2kKPiArKysgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE3My5kdHNpCj4gQEAgLTEyMzYsNyArMTIzNiw3IEBA
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZtbXN5cyBDTEtfTU1fRFNJMV9E
SUdJVEFMPiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8Jm1pcGlfdHgxPjsK
PiAgICAgICAgICAgICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJlbmdpbmUiLCAiZGlnaXRh
bCIsICJocyI7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgcGh5ID0gPCZtaXBpX3R4MT47Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgcGh5cyA9IDwmbWlwaV90eDE+Owo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIHBoeS1uYW1lcyA9ICJkcGh5IjsKPiAgICAgICAgICAgICAgICAgICAgICAg
ICBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ICAgICAgICAgICAgICAgICB9Owo+IC0tCj4gMi4xOC4w
Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
