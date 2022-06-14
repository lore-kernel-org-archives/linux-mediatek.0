Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CFBC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 07:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AkLTDUqxcLJFutvv+6zlkvX+FExejmSDGu45iBYHwwk=; b=aAckWsOqoOnwvd
	U97pupz7wX8iE6vWHHn1H6w//dy6YjCTkv48/KTeqxOA7HezwJQAjPpc/3td1/XwptAoO1c96mKe+
	Vm44l7KPuqQcIsgNWmYKrTHFauaWtWpQuI56m4GYe4dO8Ie7+Kyz0+96miVCqGmlnbazMQR4cvCvO
	Sg6ElOmz14wdAyd3X1LBAlF8ZFrTjlNt9uu96Ahlkm4uzVtFKi7FMkGh1l0lZ/WWKEs8O4ecHHfk7
	laOJk5tFTRi6CR1acXHunPRBJcy161kndUBQZao8OKL/HjYuGGhxtLmdrpFq0VBngYOCsvk6AN0gg
	uJOSBOQybRZZWYXzFJjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o116X-007y8u-J7; Tue, 14 Jun 2022 07:36:49 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o116H-007y2Z-5I; Tue, 14 Jun 2022 07:36:34 +0000
Received: by mail-lf1-x131.google.com with SMTP id 20so12525951lfz.8;
        Tue, 14 Jun 2022 00:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LFwMlD3e6MpOKchNvuK+4lcuy4YZDarqBQY4i719zcc=;
        b=PAh8hSghT45qJn8oTRAhx1ovw+P3HDYmlFpxUYNixZIUHxPIkAnksasR7avH8YiVVk
         UJqbd+bxOcGrbRKx0vyaV4g9U/iZYQJSSx6BkR3fEaZTaGgaG0P61/puTsbe5/Q+DWtF
         +Jf4v9X+tdwHSVipkPLq+ma11BuKtK6Xa6nfjuC18uMNzr3c/oSYoXNwsQWQCMmf1Rws
         dKFt79RZp2CIm9Uqnwbs39VyU2OWMXsXA9mzqS1Cm0wdmud97suQL+PS8gSqjS4eTCnE
         geR/6WFX9MoQ3U+8mh9eMkv2y0mlzumkOp5BKdefSjLztrSMQxnOGDrrX91/LQj5dIzr
         RQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LFwMlD3e6MpOKchNvuK+4lcuy4YZDarqBQY4i719zcc=;
        b=d+ZUu+3cuyGqNM2jlUS1v7LCOFhT/SrA60QUBsHlnonlp9xb2tKHh+Nr2DyJ+zC+Xs
         WyhAL0QwGLJaeiEXsMs98ybq83C6YFr/fDYPJmH6bl0PLNqQpGvNIS/jH87H4KXHsF8e
         F7CQNI4L/uUr6jYXBM0NFSuyY7uvcX2FqDvZdoH9GwTmtmR6JFl0s0lMgwFdQJVJi/uc
         NitWbeXfH0P/vutVHJAqgH1B/gcCAWpbZpFsqZ+VYrmfk4kReZua6iDpuQMcDnCyv5Fn
         qp75xbItZ8SOCQ1P8WLMQe53erBvcm0xiMZJC/kFcLVBHpKBFqDw4NfbLdKzxbaqaVTW
         s2Vw==
X-Gm-Message-State: AJIora8Nt8xQX8x5DlsqSG4lD9VH5lvNtH2ddaY8Wy3u1nqDs/bh2cnT
	9fm2GSqP0ifrouU2tNNhXQ3l/TtC6MP3ECZ0q7w=
X-Google-Smtp-Source: AGRyM1uROblyDj8YDXZUc3ZoCBhH+XazHfRipMjAGBfNxPmWlz06u+/rd7JiQYm3NWYT2+vv0cn9AF47W2oVtwMUCtI=
X-Received: by 2002:a05:6512:1051:b0:479:6428:7a59 with SMTP id
 c17-20020a056512105100b0047964287a59mr2321642lfb.222.1655192188103; Tue, 14
 Jun 2022 00:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <1651138365-17362-1-git-send-email-u0084500@gmail.com>
In-Reply-To: <1651138365-17362-1-git-send-email-u0084500@gmail.com>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Tue, 14 Jun 2022 15:36:17 +0800
Message-ID: <CADiBU38V+03GrCt6SWbPywzJWfL=ibkzhDHFMJdu8n2XC=TKog@mail.gmail.com>
Subject: Re: [PATCH 0/4] leds: flash: mt6360: Apply the fixes and hardware features
To: Pavel Machek <pavel@ucw.cz>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: cy_huang <cy_huang@richtek.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
	Gene Chen <gene_chen@richtek.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_003633_276117_6018DC9C 
X-CRM114-Status: GOOD (  12.25  )
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

SGk6CgogICAgSXMgdGhlcmUgYW55IGNvbW1lbnQgYWJvdXQgdGhpcyBwYXRjaCBzZXJpZXM/Ck9u
ZSBpcyBmb3IgdGhlIGZpeCwgc2Vjb25kIGlzIEtjb25maWcgcmVmaW5lLCBvdGhlcnMgYXJlIGZv
ciB0aGUgSFcKUFdNL0JyZWF0aCBmZWF0dXJlIGFkZGVkLgoKY3lfaHVhbmcgPHUwMDg0NTAwQGdt
YWlsLmNvbT4g5pa8IDIwMjLlubQ05pyIMjjml6Ug6YCx5ZubIOS4i+WNiDU6MzPlr6vpgZPvvJoK
Pgo+IEZyb206IENoaVl1YW4gSHVhbmcgPGN5X2h1YW5nQHJpY2h0ZWsuY29tPgo+Cj4gVGhpcyBw
YXRjaCBzZXJpZXMgaW5jbHVkZXMgc29tZSBmaXhlcyBhbmQgYWRkIHN1cHByb3RlZCBJU05LIGhh
cmR3YXJlIGZlYXR1cmVzLgo+IEZyb20gTVQ2MzYwLCBJU05LIGNhbiBzdXBwb3J0IHRocmVlIG1v
ZGVzIChDQywgUFdNLCBhbmQgQnJlYXRoKS4gVGhlIHByZXZpb3VzCj4gb25lIGNhbiBvbmx5IHN1
cHBvcnQgQ0MgbW9kZS4KPgo+IENoaVl1YW4gSHVhbmcgKDQpOgo+ICAgbGVkczogZmxhc2g6IG10
NjM2MDogRml4IHRoZSB3cm9uZyBlbmFibGVfcmVnIGluIG11bHRpY29sb3IgYnJpZ2h0bmVzcwo+
ICAgICBzZXQKPiAgIGxlZHM6IGZsYXNoOiBtdDYzNjA6IFJlbW92ZSB1bnVzZWQgZGVwZW5kZW5j
eSBpbiBLY29uZmlnCj4gICBsZWRzOiBmbGFzaDogbXQ2MzYwOiBBZGQgbXQ2MzYwIGlzbmsgY2hh
bm5lbCBoYXJkd2FyZSB0aW1lciBkaW1taW5nCj4gICAgIG1vZGUgc3VwcG9ydAo+ICAgbGVkczog
Zmxhc2g6IG10NjM2MDogQWRkIG10NjM2MCBpc25rIGNoYW5uZWwgaGFyZHdyZSBicmVhdGggbW9k
ZQo+ICAgICBzdXBwb3J0Cj4KPiAgZHJpdmVycy9sZWRzL2ZsYXNoL0tjb25maWcgICAgICAgfCAg
IDQgKy0KPiAgZHJpdmVycy9sZWRzL2ZsYXNoL2xlZHMtbXQ2MzYwLmMgfCA0MTMgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4gIDIgZmlsZXMgY2hhbmdlZCwgNDEwIGlu
c2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuNy40Cj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
