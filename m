Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7551C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 20:24:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D5EB611AD
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 20:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D5EB611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rxJH272Tg/vJasGGP2NSLXXATG+PfUQ5LbWRBH3tXhc=; b=Dv63W6s5tIRX1OWiluCs1WoL+K
	lKRYHLx0S7WSGbyzYyDX0U+lyAUn3Gs7d11+ZmRGsgNC1ueW3bbh822Wz8NvS/XtjYuOAmOPtxWnr
	Zum6IUp9JUbRb1GCYHqtfPJopsA8QbnXyUe2qlaaJ21vwmBypRDrd4ir4tzTSFomLQPL+uE7hZ44x
	TdqDmS4xKi0zUCYuN24pRstxx6CQTHGZQH8cqzis5XgD+m4HYRi4oGVUOTvMcNXqtFz9MV6EJqyUR
	uS5+EC3NBhczgcjZkP/DjzGyfzg1J23xKZBBUxt98BzHzCGeD3ZUioDHvoRJGMxxXorP9f+BILhST
	40x18qgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m32TJ-008PDk-CS; Mon, 12 Jul 2021 20:24:09 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m32TG-008PCw-Us; Mon, 12 Jul 2021 20:24:08 +0000
Received: by mail-lf1-x12f.google.com with SMTP id a12so675247lfb.7;
 Mon, 12 Jul 2021 13:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yYeY2rP+pjFQVV1qgjvzt4BYgK0J1gLR1rodhNcaD0s=;
 b=tvmjz300FQjJ3UYJdTBVRH5Br20ucCK/I3ge2oOSCKYfC1tyolE7JTQZrQZ+cv/XJf
 /45Camoi0EXo+64MEprAndyxnh5SaUVWXJHGIpr18TW75ncn2Z+94+dpkSX3+jmFNoiX
 hblAWhdrDmXxMr6s21IWV/6rda0rK24gwHsfsfwy7fGjJ8vYmAo9oq0E2shlBvjtS6Be
 dzVtwDqHDSrSfHcHR5lxxgR1O5/N4Ay7OP0QibtVFE3ka2/IVtifv2Q4xQLdCaQOzaly
 SoD6DwzjJWa0Wd9x2bOxlF49xV9KDdTJPLgbGKupSDYp+q4X4uqrtybWQDNw5tq2AtIl
 1wEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yYeY2rP+pjFQVV1qgjvzt4BYgK0J1gLR1rodhNcaD0s=;
 b=bpCtyXoY4peBVdQ9/cLPmQvUw+a97WxAfzLb5vkd6Q6DuTvoAsJ0thhn0/Ed5Exb/d
 vDY/azWwF/oqlE1KVEEvmwSxko2F4Ht3MnnY8H9FK5aj4QA0fBdfrMR/v8LJEVCHwh4u
 ro+ub+JuOLgBEVGVzCOLhs9N3POUM1xV7cuKJ8/pOWSCFoJ0PXC03GyKNAzplTmOY3Vc
 1VVm6l3H3bbrxMWKGODTvZDFOZDcpKzRswkmFJcLUy2pQXiCgkv7C5hHVuPKlYrg+EAn
 GgtIC1kyqQl2FJEkC1YUwYH824k0CjC0K4L4oty/Phy3ZBQkP5HKngGu4B1GBS0aAiqJ
 xpPA==
X-Gm-Message-State: AOAM532k5SOc6iDYC9/rXzkChKx6nYRvkLnajKXaRcKH76KL5pzCsmbd
 prDdAjouI6/lHnv2ah60Ewg90Cb20rI=
X-Google-Smtp-Source: ABdhPJzwgG7yKBZI6BuET4vQUu1NaGRvQQhFGAiTNcIfxyF+s0zZuoAL0naEC3wNmacXr0WekYC/DQ==
X-Received: by 2002:ac2:50d6:: with SMTP id h22mr447041lfm.306.1626121444804; 
 Mon, 12 Jul 2021 13:24:04 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
 by smtp.gmail.com with ESMTPSA id u3sm1288582lft.236.2021.07.12.13.24.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 13:24:04 -0700 (PDT)
Subject: Re: [PATCH v14 0/2] leds: mt6360: Add LED driver for MT6360
To: Gene Chen <gene.chen.richtek@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Dan Murphy <dmurphy@ti.com>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
 shufan_lee@richtek.com, ChiYuan Huang <cy_huang@richtek.com>,
 benjamin.chao@mediatek.com
References: <20210524152427.123856-1-gene.chen.richtek@gmail.com>
 <CAE+NS37kf1JAJ2Zt7UGsfsubp6O=xBNtnJgVEnz8-mm2rxFa+g@mail.gmail.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <019cde8b-e4db-6ad4-fd71-5ed03f174da3@gmail.com>
Date: Mon, 12 Jul 2021 22:24:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAE+NS37kf1JAJ2Zt7UGsfsubp6O=xBNtnJgVEnz8-mm2rxFa+g@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_132407_038880_EDA99BC8 
X-CRM114-Status: GOOD (  19.89  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgR2VuZSwKCllvdSBzdGlsbCBjYW4gY2FycnkgbXkgYWNrOgoKQWNrZWQtYnk6IEphY2VrIEFu
YXN6ZXdza2kgPGphY2VrLmFuYXN6ZXdza2lAZ21haWwuY29tPgoKT24gNy8xMi8yMSAxMDozMyBB
TSwgR2VuZSBDaGVuIHdyb3RlOgo+IEdlbmUgQ2hlbiA8Z2VuZS5jaGVuLnJpY2h0ZWtAZ21haWwu
Y29tPiDmlrwgMjAyMeW5tDXmnIgyNOaXpSDpgLHkuIAg5LiL5Y2IMTE6MjTlr6vpgZPvvJoKPj4K
Pj4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkIE1UNjM2MCBMRUQgc3VwcG9ydCBjb250YWlucyBkcml2
ZXIgYW5kIGJpbmRpbmcgZG9jdW1lbnQKPj4KPj4gR2VuZSBDaGVuICgyKQo+PiAgIGR0LWJpbmRp
bmdzOiBsZWRzOiBBZGQgYmluZGluZ3MgZm9yIE1UNjM2MCBMRUQKPj4gICBsZWRzOiBtdDYzNjA6
IEFkZCBMRUQgZHJpdmVyIGZvciBNVDYzNjAKPj4KPj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbGVkcy9sZWRzLW10NjM2MC55YW1sIHwgIDE1OSArKwo+PiAgIGRyaXZlcnMv
bGVkcy9mbGFzaC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEzCj4+
ICAgZHJpdmVycy9sZWRzL2ZsYXNoL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgIDEKPj4gICBkcml2ZXJzL2xlZHMvZmxhc2gvbGVkcy1tdDYzNjAuYyAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDkxMCArKysrKysrKysrKysrKysrCj4+ICAgNCBmaWxlcyBjaGFuZ2Vk
LCAxMDgzIGluc2VydGlvbnMoKykKPj4KPj4gY2hhbmdlbG9ncyBiZXR3ZWVuIHYxICYgdjIKPj4g
ICAtIGFkZCBsZWQgZHJpdmVyIHdpdGggbWZkCj4+Cj4+IGNoYW5nZWxvZ3MgYmV0d2VlbiB2MiAm
IHYzCj4+ICAgLSBpbmRlcGVuZGVudCBhZGQgbGVkIGRyaXZlcgo+PiAgIC0gYWRkIGR0LWJpbmRp
bmcgZG9jdW1lbnQKPj4gICAtIHJlZmFjdG9yIG1hY3JvcyBkZWZpbml0aW9uIGZvciBlYXN5IHRv
IGRlYnVnCj4+ICAgLSBwYXJzZSBkZXZpY2UgdHJlZSBieSBmd25vZGUKPj4gICAtIHVzZSBkZXZt
KmV4dCB0byByZWdpc3RlciBsZWQgY2xhc3MgZGV2aWNlCj4+Cj4+IGNoYW5nZWxvZ3MgYmV0d2Vl
biB2MyAmIHY0Cj4+ICAgLSBmaXggYmluZGluZyBkb2N1bWVudCBkZXNjcmlwdGlvbgo+PiAgIC0g
dXNlIEdFTk1BU0sgYW5kIGFkZCB1bml0IHBvc3RmaXggdG8gZGVmaW5pdGlvbgo+PiAgIC0gaXNp
bmsgcmVnaXN0ZXIgbGVkIGNsYXNzIGRldmljZQo+Pgo+PiBjaGFuZ2Vsb2dzIGJldHdlZW4gdjQg
JiB2NQo+PiAgIC0gY2hhbmdlIHJnYiBpc2luayB0byBtdWx0aWNvbG9yIGNvbnRyb2wKPj4gICAt
IGFkZCBiaW5kaW5nIHJlZmVyZW5jZSB0byBtZmQgeWFtbAo+Pgo+PiBjaGFuZ2Vsb2dzIGJldHdl
ZW4gdjUgJiB2Ngo+PiAgIC0gVXNlIERUIHRvIGRlY2lkZSBSR0IgTEVEIGlzIG11bHRpY29sb3Ig
ZGV2aWNlIG9yIGluZGljYXRvciBkZXZpY2Ugb25seQo+Pgo+PiBjaGFuZ2Vsb2dzIGJldHdlZW4g
djYgJiB2Nwo+PiAgIC0gQWRkIGJpbmRpbmcgbXVsdGljb2xvciBkZXZpY2Ugc2FtcGxlIGNvZGUK
Pj4gICAtIEFkZCBmbGFzaCBvcHMgbXV0ZXggbG9jawo+PiAgIC0gUmVtb3ZlIFY0TDIgaW5pdCB3
aXRoIGluZGljYXRvciBkZXZpY2UKPj4KPj4gY2hhbmdlbG9ncyBiZXR3ZWVuIHY3ICYgdjgKPj4g
ICAtIEFkZCBtdXRleCBmb3IgbGVkIGZhdWx0IGdldCBvcHMKPj4gICAtIEZpeCBmbGFzaCBhbmQg
bXVsdGljb2xvciBuby1vcHMgcmV0dXJuIDAKPj4gICAtIEFkZCBMRURfRlVOQ1RJT05fTU9PTkxJ
R0hUCj4+Cj4+IGNoYW5nZWxvZ3MgYmV0d2VlbiB2OCAmIHY5Cj4+ICAgLSByZXVzZSBhcGkgaW4g
Zmxhc2ggYW5kIG11bHRpY29sb3IgaGVhZGVyCj4+Cj4+IGNoYW5nZWxvZ3MgYmV0d2VlbiB2OSAm
IHYxMAo+PiAgIC0gYWRkIGNvbW1lbnQgZm9yIHJldXNlIHJlZ2lzdHJhdGlvbiBmdW5jdGlvbnMg
aW4gZmxhc2ggYW5kIG11bHRpY29sb3IKPj4KPj4gY2hhbmdlbG9ncyBiZXR3ZWVuIHYxMCAmIHYx
MQo+PiAgIC0gbWF0Y2ggZHQtYmluZGluZyByZWcgcHJvcGVydHkgY29tbWVudCB0byB0aGUgZnVu
Y3Rpb25hbGl0eSBuYW1lCj4+ICAgLSByZW1vdmUgZXhpc3QgcGF0Y2ggaW4gbGludXgtbmV4dAo+
PiAgIC0gZGljaWRlIG11bHRpY29sb3IgY2hhbm5lbCBieSBjb2xvciBkZWZpbml0aWlvbgo+Pgo+
PiBjaGFuZ2Vsb2dzIGJldHdlZW4gdjExICYgdjEyCj4+ICAgLSBGaXggcHJpbnQgc2l6ZV90IGJ5
ICV6dQo+PiAgIC0gRml4IGR0LWJpbmRpbmcgbmFtZSByZWd1bGFyIGV4cGVyc3Npb24KPj4KPj4g
Y2hhbmdlbG9ncyBiZXR3ZWVuIHYxMiAmIHYxMwo+PiAgIC0gRml4IGtidWlsZCB0ZXN0IHJlYm90
IGJ1aWxkIGVycm9yCj4+Cj4+IGNoYW5nZWxvZ3MgYmV0d2VlbiB2MTMgJiB2MTQKPj4gICAtIE1v
dmUgZHJpdmVyIHRvIGZsYXNoIGZvbGRlcgo+PiAgIC0gUmVtb3ZlIExFRCBGVU5DVElPTiBNT09O
TElHSFQKPj4gICAtIEtlZXAgODAgY2hhciBwZXIgbGluZQo+Pgo+Pgo+IAo+IERlYXIgUmV2aWV3
ZXJzLAo+IAo+IFBsZWFzZSBsZXQgbWUga25vdyBpZiBhbnkgdXBkYXRlLgo+IAoKLS0gCkJlc3Qg
cmVnYXJkcywKSmFjZWsgQW5hc3pld3NraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
