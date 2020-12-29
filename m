Return-Path: <SRS0=bnG6=GB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A65C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 15:25:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F021207BD
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 15:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F021207BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jzRr/7JBqE1XDo56RqggSDoIrl4PzGdR82axo03FIPw=; b=Ja4x8MfiXdnJlrrvEE6TucA/O
	h9eeiIZxnhTwjzRI9kfihYlkUg3htyqB51VMQ/iMI3Plq1tiplYHs5yvTFfa5at065YUZS/m8YYKS
	WX+Mprlgpyyz0aGXV8HgGHOYhxWqxRxJ/OPui+GMqxvdkgyUAZCMGT2xgYYTSif35kj3+6/mhKW3S
	aoTA1yqk9XgaVPft3CtTSZbEWzRmvZioxxxjobcrhIrtQZ5aXA5qGfug10E7BdGZP32RCW89JIbZS
	ucExjedzxrbX1bplLwsMNaucDEpEbSmytZdCvjXxRFd2yDLXrMCr8mEHQzIaT7n1ijPpEqk7JN28a
	bU703OTXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuGrr-0006Un-3x; Tue, 29 Dec 2020 15:24:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuGri-0006RU-Pi; Tue, 29 Dec 2020 15:24:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD46921D1B;
 Tue, 29 Dec 2020 15:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609255490;
 bh=eilapBpeoN7sFfsn0ggyc6cG1SRv9g+vbu+jGX2ZpLA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZuE4S5P8hITqz1X0escxosAV3o1TcBsgoMQeesxCNTHHQe/plvD7FZCCTDiLIcLPE
 M7e05HXO+CUT6e9Zff8a3+X20r4zbjxf9KiwqenvAwvk33wV6ALdsIms9sLlVdGmXk
 wKIm59mqBicAYE6HeMrLt25t6akFJyCSSC/9/5braxafr3QejL9ZRxfkyeAbczYOEm
 qKKy5AYZLr0MtZmYvZwxrDuOBZTHMj7lnCAcxD9+/QrnlhHgcwBxC4DKfk/WnxUnBy
 L4k732YoW7feYNMHf8FXVjHhUD05rVVwtC5tpm68hyzs1KiJc4wX/zoZe+E40WpW/k
 syBd7vI0wl4Pg==
Received: by mail-wr1-f52.google.com with SMTP id q18so14989772wrn.1;
 Tue, 29 Dec 2020 07:24:49 -0800 (PST)
X-Gm-Message-State: AOAM531f0IEUxCok9vXWM3zmkMaQPy1i0d6AhyA8VmXyMXlDrc+NO8Yp
 BSaN6uOgbIV+Vxo2/12L/ZXTXyF5FAAz8Ro1Cg==
X-Google-Smtp-Source: ABdhPJwfw4rYEsYu8nEniPGc6G6JHID1nl4QlJyDYtZF/WHawvurk6lDHUtip9QnXX+NOG2EV9QTm0HD335QYsb/xq8=
X-Received: by 2002:adf:e60f:: with SMTP id p15mr55674939wrm.60.1609255488542; 
 Tue, 29 Dec 2020 07:24:48 -0800 (PST)
MIME-Version: 1.0
References: <1609144630-14721-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609144630-14721-7-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1609144630-14721-7-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 29 Dec 2020 23:24:36 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9ZL9FEMKT_3xARh51hxK6_AbYJHci9ENXDwzCwNGo8Fg@mail.gmail.com>
Message-ID: <CAAOTY_9ZL9FEMKT_3xARh51hxK6_AbYJHci9ENXDwzCwNGo8Fg@mail.gmail.com>
Subject: Re: [PATCH v3, 6/8] soc: mediatek: mmsys: add component RDMA4
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201229_102451_179305_EBCF0797 
X-CRM114-Status: GOOD (  16.61  )
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
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDEy5pyIMjjml6Ug6YCx5LiAIOS4i+WNiDQ6Mzflr6vpgZPvvJoKPgo+IFRo
aXMgcGF0Y2ggYWRkIGNvbXBvbmVudCBSRE1BNAoKUmV2aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUg
PGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPgo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBO
aXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L3Nv
Yy9tZWRpYXRlay9tdGstbW1zeXMuaCB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1z
eXMuaCBiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oCj4gaW5kZXggMDll
ZTQyNC4uYWE0ZjYwZSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9t
dGstbW1zeXMuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5o
Cj4gQEAgLTM4LDYgKzM4LDcgQEAgZW51bSBtdGtfZGRwX2NvbXBfaWQgewo+ICAgICAgICAgRERQ
X0NPTVBPTkVOVF9SRE1BMCwKPiAgICAgICAgIEREUF9DT01QT05FTlRfUkRNQTEsCj4gICAgICAg
ICBERFBfQ09NUE9ORU5UX1JETUEyLAo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9SRE1BNCwKPiAg
ICAgICAgIEREUF9DT01QT05FTlRfVUZPRSwKPiAgICAgICAgIEREUF9DT01QT05FTlRfV0RNQTAs
Cj4gICAgICAgICBERFBfQ09NUE9ORU5UX1dETUExLAo+IC0tCj4gMS44LjEuMS5kaXJ0eQo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
