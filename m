Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE79C11F64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 17:31:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF15C61409
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 17:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF15C61409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WyVspFklr+AEnwwZKpU2Xh2TgyS2lJNFvA+mhhfeTrQ=; b=cgrVISTmVE7CY1wVfi9G3qDsjx
	zTCCkb9i8XgOzPtfoNYQSlWvfUeAIqQ6i0DL28H8JYF+69PafhovoHgwtYJruKCsmlO3rrAn4jApf
	CLm56vNz5P7iydpx03RwabdqEj2B1ACe4/uInSapTUYTOUlcmwNIHnldR6O32cvrpxo9BlWD0cqLo
	HYXlGExuTGVqhNLDnb/6UQpgu6lZByPLoFpC+gaidCiE73rmwYJuTnyhP0n7iRW5+2bp+5zdkaOY1
	DA1oWiSn9DtiHkowNl/7jqLo0n48B6n+YxqaVyJzqfxnqIXHLWYLPhHhgtyeoXdnILEfHrJ2kTCV3
	ivsF1TNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz0Wj-000cHR-I2; Thu, 01 Jul 2021 17:31:01 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz0Wh-000cGA-As; Thu, 01 Jul 2021 17:31:00 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso4645970wme.0; 
 Thu, 01 Jul 2021 10:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wB59Tcol7WFyeIqJfVL0G5i3exPR6uZKms17tlCBAcA=;
 b=Y8ARRoqc+A3kGi68cV34ZqpfYcUNQk7PR0cfnBlk9Lcy+jS9GLKKIaDT7LnqR/4ZfU
 lwW5OFcVy3apvlrcNpRuQlclhWKkBfiXPOVsVU6zs5R1lQg+pY5NfjCJCCw+qkhWXdFg
 rW5B/pXvj7RKYopYjO2IqgNVUK2J/RMfhxt6T0O4mNfmLMnWnUXclbMK4Sa1zXyooqlI
 2KA4NIfDYFtih3LTEiBF03jeOBMny4UpdGyswCqm3Dg33cIXDLZLcm9YjRa09h6BXx00
 zP2eQmh9gpMCXo8f9GNMR2gkSTZux1HfhOlN7ZV8huXyRgTx8aKg3jdAmNuuvhckdxqn
 26rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wB59Tcol7WFyeIqJfVL0G5i3exPR6uZKms17tlCBAcA=;
 b=Y5hlcb18Q2ejfAly1ghqT+hW7+4+DagJIk8lszrArE6RwY21aO8DlUZcOW7miE5WKS
 Xbzz8xECkQ0GlBq5h6jqTlim/GLjCrnoZ965+YnFCNhrkW/HngVbTY1uKcB23y+rx6+Y
 q+xaRr+7GQwTCJAA1ARj5dHq2ejyaswQfJnMp9MAuTbQBvgKAXZBHeodGADSixoCnRtU
 /L/bDMVPX9w1YsglizWQB53VYHz8WbPjv8okQUL8ByzVGQAxUXoSEhVLIcewVRPuOSM/
 Mny4iwFcOzd6tTMywaDg5nXEUzN9OthG3xwhlWz3LoTTP9oPJavDxPCm8HPfx/CusCWg
 5+Hw==
X-Gm-Message-State: AOAM532L+meo1q2xbol7r8g49CutD5CQ5HtAuFjklJNqBQRk3P/g16pn
 NeD3Q4E1vBXLgt0IwfcSc48=
X-Google-Smtp-Source: ABdhPJxq0hqSO0GgKP+IeHAM+Sv/K9Ww1tFO+oYT06t29roLupBgPd6bCKR7iRCdUtEV8d+GtGdsgg==
X-Received: by 2002:a1c:8097:: with SMTP id b145mr11874162wmd.54.1625160657555; 
 Thu, 01 Jul 2021 10:30:57 -0700 (PDT)
Received: from ziggy.stardust ([213.195.127.100])
 by smtp.gmail.com with ESMTPSA id y7sm10089139wma.22.2021.07.01.10.30.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 10:30:57 -0700 (PDT)
Subject: Re: [v11 01/19] dt-bindings: ARM: Mediatek: Add new document bindings
 of MT8192 clock
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, 
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, linux-clk@vger.kernel.org,
 DTML <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20210630132804.20436-1-chun-jie.chen@mediatek.com>
 <20210630132804.20436-2-chun-jie.chen@mediatek.com>
 <CAAOTY_8SgZ5SN9Q0nfL_jQVTbB7ZDqgoGFRkKe8+QJwUi55Hew@mail.gmail.com>
 <da0db357ac7e41ca6ec2007eccccbb465049cd01.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <775b61ab-8a23-ab78-f7a8-11d09d7ded3f@gmail.com>
Date: Thu, 1 Jul 2021 19:30:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <da0db357ac7e41ca6ec2007eccccbb465049cd01.camel@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_103059_431976_3042729C 
X-CRM114-Status: GOOD (  14.04  )
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

CgpPbiAwMS8wNy8yMDIxIDA0OjEzLCBDaHVuLUppZSBDaGVuIHdyb3RlOgo+IE9uIFdlZCwgMjAy
MS0wNi0zMCBhdCAyMjozMCArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90ZToKPj4gSGksIENodW4t
SmllOgo+Pgo+PiBDaHVuLUppZSBDaGVuIDxjaHVuLWppZS5jaGVuQG1lZGlhdGVrLmNvbT4g5pa8
IDIwMjHlubQ25pyIMzDml6Ug6YCx5LiJIOS4i+WNiDk6MzDlr6vpgZPvvJoKPj4+Cj4+PiBUaGlz
IHBhdGNoIGFkZHMgdGhlIG5ldyBiaW5kaW5nIGRvY3VtZW50YXRpb24gZm9yIHN5c3RlbSBjbG9j
awo+Pj4gYW5kIGZ1bmN0aW9uYWwgY2xvY2sgb24gTWVkaWF0ZWsgTVQ4MTkyLgo+Pj4KPj4+IFNp
Z25lZC1vZmYtYnk6IENodW4tSmllIENoZW4gPGNodW4tamllLmNoZW5AbWVkaWF0ZWsuY29tPgo+
Pj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4+PiAtLS0KPj4K
Pj4gW3NuaXBdCj4+Cj4+PiArCj4+PiArICAtIHwKPj4+ICsgICAgbW1zeXM6IGNsb2NrLWNvbnRy
b2xsZXJAMTQwMDAwMDAgewo+Pgo+PiBtbXN5cyBpcyBhIHN5c3RlbSBjb250cm9sbGVyIHJhdGhl
ciB0aGFuIGNsb2NrIGNvbnRyb2xsZXIsIGlzbid0IGl0Pwo+Pgo+PiBSZWdhcmRzLAo+PiBDaHVu
LUt1YW5nLgo+Pgo+Pj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItbW1z
eXMiOwo+Pj4gKyAgICAgICAgcmVnID0gPDB4MTQwMDAwMDAgMHgxMDAwPjsKPj4+ICsgICAgICAg
ICNjbG9jay1jZWxscyA9IDwxPjsKPj4+ICsgICAgfTsKPj4+ICsKPiAKPiBUaGFua3MgZm9yIHlv
dSByZW1pbmRlciwgSSB3aWxsIG1vdmUgbW1zeXMgdG8gc3lzdGVtIGNsb2NrIGNvbnRyb2xsZXIu
Cj4gCgpUaGUgbW1zeXMgc2hvdWxkIGJlIGRvY3VtZW50ZWQgaW4gbWVkaWF0ZWssbW1zeXMudHh0
CgpSZWdhcmRzLApNYXR0aGlhcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
