Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD619C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Apr 2022 14:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2TgJxwMYgdt00neOtK5QY2sC3PVs9I7o/74AqoDyPvQ=; b=ef6vqXIXRVndUg
	91Vie1iKEBkAdlmfsF38QuBQiy1j00cY4lmnvjuq6BgFBjdt8LeWEc9oGb6C8jnT3hPhHKaALtRvY
	XiuMjH7A2wY6p80KTqqyCfBjWNHBOeDaQFjx+b1vXpNFDmc4KUEKgpBXnRdEAuIjD/8Ig6vBY+SSA
	fzEgcXl102cxuhdfv6gY3VPzIjEg4D7AVoif8BaL65QGUxSWJDPU+8+vS+C8DWiXsAdxJT5QfSrFS
	xgSiwZwHlH8aYF5AlOfeWVrRNEDTYz6VQ2u37UFgSU0lzVmMEFVMB/dIWaLIiUDA/utAVFFGc0XVQ
	y7wdXLIR9EbDH3fl2aMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfjJW-00D62i-3P; Sat, 16 Apr 2022 14:22:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfjJK-00D5yP-47; Sat, 16 Apr 2022 14:22:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7B9C760F53;
 Sat, 16 Apr 2022 14:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1098C385AD;
 Sat, 16 Apr 2022 14:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650118920;
 bh=AQEu64jaXboAv+zoYsgsiYMWLuLEVN/IlKXUW/p/mps=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=E0cUbtpNFUtMtgLzUGDRPk1ps4WTOQ6oEsPx+kxBcp6AtkAxIZMJNc61Bmwu5BN9d
 7d9m/UE8LMvVLGmH3uqoqkkeTg1mUnbTzWuVHrDUFGINZetndpzYrFJSKtJRlTgZZY
 W20TnC595lz8I6gO6/TT14wcxLKlImcvaZhmligz/9dhvCVSgjM+6TNDLOWec1dQNv
 VjcUiv2gT2yv2EdPYRHdjkAdjnlQXYSg2ksm32u6ZjQR7t0SJO2IX9sLiN2z6SiKac
 /SWGtK25uh/IrA6XiGTY5BzUWNSixeZhMySR6VeNbsOygmK2eQVLxdA2hbAQW/+9i1
 RwduB5sdJ5rIw==
Received: by mail-ed1-f51.google.com with SMTP id t25so12876923edt.9;
 Sat, 16 Apr 2022 07:22:00 -0700 (PDT)
X-Gm-Message-State: AOAM533BlcIohA2iC+yCe51DOt2gPFjepriCg2AvWzT3fd9UveY1iMCU
 qbWqlAc5pN1V8iRMVmt90RZZ09kibcedG2Q8iA==
X-Google-Smtp-Source: ABdhPJxbmEV+hwk4GL9LWk4P/pzE9nAuwmYPGG4NNYd79+xQNfoh8INhSk/eBBi9Q4r3fxMonmeqRsOfHI+xYyVF7gw=
X-Received: by 2002:aa7:c38f:0:b0:41d:82c7:7751 with SMTP id
 k15-20020aa7c38f000000b0041d82c77751mr3960939edq.215.1650118919152; Sat, 16
 Apr 2022 07:21:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220411035843.19847-1-rex-bc.chen@mediatek.com>
 <20220411035843.19847-4-rex-bc.chen@mediatek.com>
 <YldWk9eTLbXBcbX+@robh.at.kernel.org>
In-Reply-To: <YldWk9eTLbXBcbX+@robh.at.kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 16 Apr 2022 22:21:51 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8j407wX8SEmK4rSfLheb4GQjQBJPyfXgy=5m+dLw7XPw@mail.gmail.com>
Message-ID: <CAAOTY_8j407wX8SEmK4rSfLheb4GQjQBJPyfXgy=5m+dLw7XPw@mail.gmail.com>
Subject: Re: [PATCH V2 3/3] dt-bindings: display: mediatek: Update disp_aal
 binding for MT8192 and MT8195
To: Rob Herring <robh@kernel.org>
Cc: Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 Nancy Lin <nancy.lin@mediatek.com>, krzk+dt@kernel.org, 
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Jason-JH Lin <jason-jh.lin@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 allen-kh.cheng@mediatek.com, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220416_072202_237961_D79773F5 
X-CRM114-Status: GOOD (  12.70  )
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

Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4g5pa8IDIwMjLlubQ05pyIMTTml6Ug6YCx5Zub
IOS4iuWNiDc6MDLlr6vpgZPvvJoKPgo+IE9uIE1vbiwgMTEgQXByIDIwMjIgMTE6NTg6NDMgKzA4
MDAsIFJleC1CQyBDaGVuIHdyb3RlOgo+ID4gRGlzcF9hYWwgb2YgTVQ4MTkyIGFuZCBNVDgxOTUg
YXJlIGZ1bGx5IGNvbXBhdGlibGUgd2l0aCBkaXNwX2FhbCBvZgo+ID4gTVQ4MTgzLiBUaGVyZWZv
cmUsIHdlIG1vdmUgdGhlIHRoZW0gdG8gaXRlbSAibWVkaWF0ZWssbXQ4MTgzLWRpc3AtYWFsIi4K
PiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSZXgtQkMgQ2hlbiA8cmV4LWJjLmNoZW5AbWVkaWF0ZWsu
Y29tPgo+ID4gLS0tCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxhYWwueWFtbCAgICB8IDQgKystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+Cj4gQWNrZWQtYnk6IFJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+CgpBcHBsaWVkIHRvIG1lZGlhdGVrLWRybS1uZXh0IFsxXSwgdGhh
bmtzLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRybS1uZXh0CgpSZWdhcmRz
LApDaHVuLUt1YW5nLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tZWRpYXRlawo=
