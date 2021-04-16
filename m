Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D89AC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 05:57:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D422A61184
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 05:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D422A61184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qxamzrw8uYPFRfBday40dFgok+4LA36nD81mW8n3no4=; b=HuO49vJhwbfF32oQNPD/s7ZMy
	gSxgxiBCOqdxcTpHDYp1bai7ibTX9O3vHFgz+3XLeBcKVe/TyX39RJtnA5kGPHHp0O+YJqhWCgrtJ
	Meqy57nzjZlSUOkQoqJNs84sUFj1bjkfBQs2T3qrYwxtntKm107MJ4swuPrgB0Tz4McnKsi11kpjO
	JoQxaZHtnAkXR4UM9k+KE7G9F79Wy/8n7QX67UV44o3Mm00hxvzpG4KQJxhe57+MbW7ESReS8HYIt
	X8Mi9LrOrg2m8ZAJ0Q3VpJnvLEpzDsmPlkAVHepElVcUCzPQ/u81I5BzfycnTJDT2m8eFDoeaVo8i
	8UCb7SsLg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXHSe-000veN-Hb; Fri, 16 Apr 2021 05:56:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXHPD-000vTZ-M3; Fri, 16 Apr 2021 05:53:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=Sz5AkDEHXoTdhaWqNa4aiq2JXP5rqPnHAGXR8ZCTKAg=; b=igh0sDkdkOCibNFQsqP4bVr23a
 KsUB5a1hPhDvhp7paAN6EaGl+PI1gOaHbDA56D4ZNNrDVNVCrBZVRORr1d1yQjQQuhsHQ2iQ+FYV/
 yvDe6jhdNFKuKPOvVbNbVEIKgsTBBujOpyeAuCFw5fMYDecMDxzU1gvKUWaKHyEHUUABvCa/vprl8
 zIOhbbBXpEDNxaTXy5Cx2i0WVFlw1mGeMWFzut4t3dzUgXMCDqvBmUDdRX8r1kHSSwaMP3yWo9I+V
 2XqugtWfTRxIwJPONRbqA04zFZzZzA0RykE28wz94c51/slXbv/3cGfKDAq6iXYFFa180zeFOaLil
 hpZZrAEQ==;
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXHPB-00969w-3r; Fri, 16 Apr 2021 05:52:38 +0000
Received: by mail-ot1-x32e.google.com with SMTP id
 101-20020a9d0d6e0000b02902816815ff62so18881798oti.9; 
 Thu, 15 Apr 2021 22:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Sz5AkDEHXoTdhaWqNa4aiq2JXP5rqPnHAGXR8ZCTKAg=;
 b=hhN8uGqIBz9cbQV+JtKoeYJC9DF8KbPYfeHcv2sRSlO7JlsQh7YxfMBbjgZ7ulVU4n
 na6SYs8pHd2P8eOTE5PXPufwsGafk901JlRrzkz4JmUCYL4n0t3zlBU0knmbGTk9WR12
 8jwqVa1OV4JzgzU5Goyq3DGuWpOIv4R4hHJ68tMh/4TyG1sfNVU/ekXA23B6CDU0RQXV
 lSM7UetSayuuegUyc4iSYy8L5uU79VHyYL9C2hJJLwbmPEOP6pNVa/BqNy2NnUAEaQe8
 kYzH0kYJd01auSpFTa7CK408VdX2rdUYSyopNFU6VwFkbH6bSaFmnH7B0lSj+gMhlVX2
 XRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Sz5AkDEHXoTdhaWqNa4aiq2JXP5rqPnHAGXR8ZCTKAg=;
 b=bIketXi99tzqOnfBh1fIG2o5CGGetTYMclFnfa8lQ/Gim3gq9HdK+oYLa5U0HPomvn
 guBSN4pJ494Lt8mayV60iVdQg4jdAdiOAYdesDGDxhGusMm24sNgLAGX51c6cg0SFMS1
 SSXB52ec/Ab6TEtJWSBz47e5jIcP7ZSKZ+2dr1zFQqGQWqVTwJmGh6b1s2hRHD0yu/gG
 J8XE/BHpPMLeYRf3blxqrWYjs8gvlGT3ZJ+jnKgLR4q4D8FQb15sb+JHiNOcYO4T3c/t
 yy96SQ2OB+pCcoSG6r9f1Zp5NCF1EgeClyrkj8ufRDKGPJSbRdmWle6DK8+RGnmi1rlj
 aq8A==
X-Gm-Message-State: AOAM532E7XVraQyYVwpebl0SElSVmyWITl/P+FznLjcVFuZls7wHNLWN
 QCDtRP+lUlJIzdZOOI7mSuHtOcRFkxQhTH++S68=
X-Google-Smtp-Source: ABdhPJzai2AZUpqMlxmUdFMD8/LL884tQ/+a9LNwb5D3Cdt4KsiydVj2riIrDLj6ZLQCSuXQ/lT10T3IqFFyC1PY+/Q=
X-Received: by 2002:a05:6830:1398:: with SMTP id
 d24mr2479119otq.281.1618552355449; 
 Thu, 15 Apr 2021 22:52:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210414144643.17435-1-matthias.bgg@kernel.org>
In-Reply-To: <20210414144643.17435-1-matthias.bgg@kernel.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 16 Apr 2021 07:52:26 +0200
Message-ID: <CAFqH_53TOM6oyByRaMb8d7caX+u5Wn5DyrXuXHYKVUwBCfrkZg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: mt8183-pumpkin: fix dtbs_check warning
To: matthias.bgg@kernel.org
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Nicolas Boichat <drinkcat@chromium.org>, 
 Fabien Parent <fparent@baylibre.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_225237_178758_CFAC8A19 
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

SGkgTWF0dGhpYXMsCgpUaGFuayB5b3UgZm9yIHlvdXIgcGF0Y2guCgpNaXNzYXRnZSBkZSBsJ2Fk
cmXDp2EgPG1hdHRoaWFzLmJnZ0BrZXJuZWwub3JnPiBkZWwgZGlhIGRjLiwgMTQgZOKAmWFici4K
MjAyMSBhIGxlcyAxNjo0ODoKPgo+IEZyb206IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJn
Z0BnbWFpbC5jb20+Cj4KPiBGaXggdW5pdCBuYW1lcyB0byBtYWtlIGR0YnNfY2hlY2sgaGFwcHku
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwu
Y29tPgo+IC0tLQo+Cj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLXB1bXBr
aW4uZHRzIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9t
dDgxODMtcHVtcGtpbi5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My1w
dW1wa2luLmR0cwo+IGluZGV4IGViNmU1OTVjMjk3NS4uMGFmZjVlYjUyZTg4IDEwMDY0NAo+IC0t
LSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLXB1bXBraW4uZHRzCj4gKysr
IGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMtcHVtcGtpbi5kdHMKPiBAQCAt
MzIsNyArMzIsNyBAQCByZXNlcnZlZC1tZW1vcnkgewo+ICAgICAgICAgICAgICAgICAjc2l6ZS1j
ZWxscyA9IDwyPjsKPiAgICAgICAgICAgICAgICAgcmFuZ2VzOwo+Cj4gLSAgICAgICAgICAgICAg
IHNjcF9tZW1fcmVzZXJ2ZWQ6IHNjcF9tZW1fcmVnaW9uIHsKPiArICAgICAgICAgICAgICAgc2Nw
X21lbV9yZXNlcnZlZDogc2NwX21lbV9yZWdpb25ANTAwMDAwMDAgewo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAic2hhcmVkLWRtYS1wb29sIjsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICByZWcgPSA8MCAweDUwMDAwMDAwIDAgMHgyOTAwMDAwPjsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICBuby1tYXA7Cj4gQEAgLTU1LDcgKzU1LDcgQEAgbGVkLWdyZWVuIHsKPiAg
ICAgICAgICAgICAgICAgfTsKPiAgICAgICAgIH07Cj4KPiAtICAgICAgIG50Y0AwIHsKPiArICAg
ICAgIG50YyB7Cj4gICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibXVyYXRhLG5jcDAzd2Yx
MDQiOwo+ICAgICAgICAgICAgICAgICBwdWxsdXAtdXYgPSA8MTgwMDAwMD47Cj4gICAgICAgICAg
ICAgICAgIHB1bGx1cC1vaG0gPSA8MzkwMDAwPjsKPiAtLQo+IDIuMzAuMgo+Cj4KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdAo+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCgpS
ZXZpZXdlZC1ieTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFi
b3JhLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
