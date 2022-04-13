Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C82C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 06:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fLc1YjOEtL7GoxNckOGD14KxxQsDCNE0ksSPBkiL7sk=; b=eo7fr2e4yKy3P+
	Vf46+VkW0NWfLKgtKQYmkn9T7UOKpKq33MAjBVh5q0WdAAaa8S/3riD66uoDNbJBVgRsBsjQJrHC5
	aXL9S7tOvfnARlfC091yGIGOkNSdmD6RZwpfD9srRwEYzwpEm0dWLl7I+TbCuE2mHDFmPkFhaHfiv
	LpLHAFQ0Yk4Tk3ubbU4seX2wfpBmQUYk9nBBQjrAzo8myecLRvuBcjBvDrN1b31YOGIKQi1DjvScQ
	DRfR6J+KBIZTIdngFpjQtY8Gr73YL+oklVqYchcnSNLeArVGn7SGGK+txxZhbcJdi3qwUtK74y4KS
	HwWDEXFEjnbraJjASwDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neWZw-00HBGR-Vz; Wed, 13 Apr 2022 06:34:13 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neWU1-00H8mi-7i; Wed, 13 Apr 2022 06:28:06 +0000
Received: by mail-qk1-x72b.google.com with SMTP id s4so728534qkh.0;
 Tue, 12 Apr 2022 23:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IQXd2jV2y0H/jmnC3zsa4bcZYEpr7db5gHWElQ3LxHo=;
 b=AvEuQTFPadwF9B77e3hFm5DnRzYyP8mYjU5oKInOTekImMPQ9N1mTIms5cmjhh5hfX
 LkSFJbC8gnLmJpgwY9zA4JI9A+RTpDk5xxPfFD0tF0qxtIC1rK0grKMt/tLDK8cS23fT
 RulFwQP5jljqMXD5I54GLeZedam6rTu20H2OlNPRx5/9V/Vn8nf/+xNxosavSCJY/SCu
 +poIEZNxeCdfOF4HvSyXtg1difDMot4a7EYKqtr2rJrY4OKZ+FFp5sutGw0baRndzwRM
 OmTkbR4cyxBWSnly8W0CvNAabWt3/+9Tr+h92US8UHNUlCwCRzxn0emaPr/vkcSVEKYA
 vplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IQXd2jV2y0H/jmnC3zsa4bcZYEpr7db5gHWElQ3LxHo=;
 b=RbxEhAFwp1ML4p2owiMK4f0gevik3vajoDOHg1CixLtrC9IFkijNcoRstw5IFZwwVh
 jYKtAdp2bptalB8SfCuWRhwUDerWQkbtr2JFfeOD1fRNmVZsUsisUyB3HOmHGwgC3Ble
 C23X/5smWflvByefEibtzyXksK1tpBUg2/tDRpdFpMkmMxF3O/5TNvSjfhJQcdTJuJQf
 s4eDim03vI7BX6Mn+Zg1oWRoi1wfIFEB7fqvxVAxquEDFtYh+DJ/kHhYhA/+Ko9r+s5l
 mTnD1Dq1JTU2vWuvXQ9D9YFacC3AZyq/7BaR7nQTyCs8vv2mzg1LWDSeG4XjXPJxP4ZK
 7q3g==
X-Gm-Message-State: AOAM533bU3Rew61EL0jT+v7Q/8Ksy6rg9rqyV/mg3jAvEMAPHKSxHGxr
 6Lk+blv2qkpct7zOFzLJrE1u3KuKUGNz2PBUR/+OqdSj
X-Google-Smtp-Source: ABdhPJxSAul1DQiuip/zXWO7y/5rdjzwToJfLdrqCdPR32d03sINv0FlPWqCmtrCOu+ed1zUDp0D9fKwELAyHXivy54=
X-Received: by 2002:a05:620a:bd5:b0:67d:15ed:2fcd with SMTP id
 s21-20020a05620a0bd500b0067d15ed2fcdmr5870340qki.81.1649831281235; Tue, 12
 Apr 2022 23:28:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
 <20220413060729.27639-9-arinc.unal@arinc9.com>
In-Reply-To: <20220413060729.27639-9-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Wed, 13 Apr 2022 08:27:50 +0200
Message-ID: <CAMhs-H8W990kGWPtVkLLXj4wr0+v8aEgv42K6Ffh+k=misYvGQ@mail.gmail.com>
Subject: Re: [PATCH 08/14] MAINTAINERS: add Ralink pinctrl driver
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, erkin.bozoglu@xeront.com, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "open list:MIPS" <linux-mips@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_232805_332315_B8DAB3CC 
X-CRM114-Status: GOOD (  14.97  )
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

T24gV2VkLCBBcHIgMTMsIDIwMjIgYXQgODowOCBBTSBBcsSxbsOnIMOcTkFMIDxhcmluYy51bmFs
QGFyaW5jOS5jb20+IHdyb3RlOgo+Cj4gQWRkIGEgbmV3IHNlY3Rpb24gZm9yIHRoZSBSYWxpbmsg
cGluY3RybCBkcml2ZXIgYW5kIGFkZCBtZSBhbmQgU2VyZ2lvIGFzCj4gdGhlIG1haW50YWluZXJz
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQXLEsW7DpyDDnE5BTCA8YXJpbmMudW5hbEBhcmluYzkuY29t
Pgo+IC0tLQo+ICBNQUlOVEFJTkVSUyB8IDcgKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwo+
IGluZGV4IGZkNzY4ZDQzZTA0OC4uY2JkMGMzZTE4MGJmIDEwMDY0NAo+IC0tLSBhL01BSU5UQUlO
RVJTCj4gKysrIGIvTUFJTlRBSU5FUlMKPiBAQCAtMTY1MDIsNiArMTY1MDIsMTMgQEAgTDogICAg
IGxpbnV4LW1pcHNAdmdlci5rZXJuZWwub3JnCj4gIFM6ICAgICBNYWludGFpbmVkCj4gIEY6ICAg
ICBhcmNoL21pcHMvYm9vdC9kdHMvcmFsaW5rL210NzYyMSoKPgo+ICtSQUxJTksgUElOQ1RSTCBE
UklWRVIKPiArTTogICAgIEFyxLFuw6cgw5xOQUwgPGFyaW5jLnVuYWxAYXJpbmM5LmNvbT4KPiAr
TTogICAgIFNlcmdpbyBQYXJhY3VlbGxvcyA8c2VyZ2lvLnBhcmFjdWVsbG9zQGdtYWlsLmNvbT4K
PiArTDogICAgIGxpbnV4LW1pcHNAdmdlci5rZXJuZWwub3JnCj4gK1M6ICAgICBNYWludGFpbmVk
Cj4gK0Y6ICAgICBkcml2ZXJzL3BpbmN0cmwvcmFsaW5rLyoKCkFja2VkLWJ5OiBTZXJnaW8gUGFy
YWN1ZWxsb3MgPHNlcmdpby5wYXJhY3VlbGxvc0BnbWFpbC5jb20+CgpUaGFua3MsCiAgICBTZXJn
aW8gUGFyYWN1ZWxsb3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
