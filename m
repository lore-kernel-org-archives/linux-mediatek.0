Return-Path: <SRS0=MDpP=IQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0944C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 00:27:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2486364F38
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 00:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2486364F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zPZfEghgFmPCDGFjRn1s4iUh2UKOvLwNcuy+76TnXeA=; b=FtqctMY+aZ8Cn5CQwlND2IB4J
	iVB+SFT4YxvidnLlPKecuz8ivwiyq3EtlB0K/lY98YntorLFftnVTN/Felxa744VnA2/0PlbQiUJv
	RCMROD1upr0G9SQjx/0dvoFFtFcGd+6Wull7oxJvF5YgfquhnpIEWbkwF0lXgBGncJLfZhOhgPA9X
	28oXlSBPxikVbjOCjG+7DCBUfUp0WMFjdzKlRpBBYW0vKOR835dAki+n4hgRA8cPesaAYmKa+i96H
	ntk2uvVYVarHhNem4XxhIkD88hl1VinUor25FXLmOuB1iCA6omN0cOkz0X7fGZkSIIG5QTmI76tMV
	qebojzLpw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMgVP-0049xF-BT; Thu, 18 Mar 2021 00:27:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMgST-0049oE-H9; Thu, 18 Mar 2021 00:24:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CAE2E64F21;
 Thu, 18 Mar 2021 00:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616027051;
 bh=p6PEaph2u8ios6gltNUavvYhOGS187eCou4MgdO3Fbw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lo3/9xI377wnkqkFHWz4/aGIG0YwtWvM9RVVl1u8oi86jJjYcy6MnQy7Z5QIo8EGW
 2byJtLdwK9affsW4A+KPNJjQTc7gwfeAwJ5UJ/tRN/Pp4oXjM6ZPFRzDpmG1eIoLyV
 qxlooaxDB6pGXpnb+iCUJd3P76QJqlMWJ7Bea5RqaMYPHun7MDLH3D8oPQ54bd2Qzz
 FLHV03rKqdjg1rGTey1O8SoiTZKodPmd1pOYM7PlX6pWMg5trats2QuFIQkxEpzPBn
 V8c5pefw8BUi+KyJKQvE++yeRgqMaOljr1oUo88A/ARQ5i24MaQcrVF1QD8sneA9+7
 VPPWDkEzp48vg==
Received: by mail-ej1-f49.google.com with SMTP id a7so1172642ejs.3;
 Wed, 17 Mar 2021 17:24:10 -0700 (PDT)
X-Gm-Message-State: AOAM533cGgFV+0usS4Sb7sdkuy7emv11iZgWiHn6WjQva6yV9EmGXlux
 OvNhYVeITnpYKz7xn78k/IsMru5WOhuOmDxyRQ==
X-Google-Smtp-Source: ABdhPJwl0sxRTizbicTK0xRvRINhzU0QimeYmr7XbstUaY16PHVXUP4gL+Bk4D2R+s0MFSs2qYLvjNQoeYEac9DwLXg=
X-Received: by 2002:a17:906:3750:: with SMTP id
 e16mr37952648ejc.75.1616027049177; 
 Wed, 17 Mar 2021 17:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210210075656.1096251-1-weiyongjun1@huawei.com>
In-Reply-To: <20210210075656.1096251-1-weiyongjun1@huawei.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 18 Mar 2021 08:23:58 +0800
X-Gmail-Original-Message-ID: <CAAOTY__hAcEHoeebdVCNaaay7OmbgrfBx5r7EfhuU9mNEy0ELw@mail.gmail.com>
Message-ID: <CAAOTY__hAcEHoeebdVCNaaay7OmbgrfBx5r7EfhuU9mNEy0ELw@mail.gmail.com>
Subject: Re: [PATCH -next] soc: mediatek: Make symbol 'mtk_mutex_driver' static
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Hulk Robot <hulkci@huawei.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 CK Hu <ck.hu@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_002440_771808_0A7155FD 
X-CRM114-Status: GOOD (  18.34  )
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

SGksIFlvbmdqdW46CgpXZWkgWW9uZ2p1biA8d2VpeW9uZ2p1bjFAaHVhd2VpLmNvbT4g5pa8IDIw
MjHlubQy5pyIMTDml6Ug6YCx5LiJIOS4i+WNiDM6NDnlr6vpgZPvvJoKPgo+IFRoZSBzcGFyc2Ug
dG9vbCBjb21wbGFpbnMgYXMgZm9sbG93czoKPgo+IGRyaXZlcnMvc29jL21lZGlhdGVrL210ay1t
dXRleC5jOjQ2NDoyNDogd2FybmluZzoKPiAgc3ltYm9sICdtdGtfbXV0ZXhfZHJpdmVyJyB3YXMg
bm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwo+Cj4gVGhpcyBzeW1ib2wgaXMgbm90
IHVzZWQgb3V0c2lkZSBvZiBtdGstbXV0ZXguYywgc28gdGhpcwo+IGNvbW1pdCBtYXJrcyBpdCBz
dGF0aWMuCgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5v
cmc+Cgo+Cj4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IFdlaSBZb25nanVuIDx3ZWl5b25nanVuMUBodWF3ZWkuY29tPgo+IC0tLQo+
ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbXV0ZXguYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9zb2MvbWVkaWF0ZWsvbXRrLW11dGV4LmMgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbXV0
ZXguYwo+IGluZGV4IGY1MzFiMTE5ZGE3YS4uM2EzMTVhNjJlNzgzIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvc29jL21lZGlhdGVrL210ay1tdXRleC5jCj4gKysrIGIvZHJpdmVycy9zb2MvbWVkaWF0
ZWsvbXRrLW11dGV4LmMKPiBAQCAtNDYxLDcgKzQ2MSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkIG11dGV4X2RyaXZlcl9kdF9tYXRjaFtdID0gewo+ICB9Owo+ICBNT0RVTEVf
REVWSUNFX1RBQkxFKG9mLCBtdXRleF9kcml2ZXJfZHRfbWF0Y2gpOwo+Cj4gLXN0cnVjdCBwbGF0
Zm9ybV9kcml2ZXIgbXRrX211dGV4X2RyaXZlciA9IHsKPiArc3RhdGljIHN0cnVjdCBwbGF0Zm9y
bV9kcml2ZXIgbXRrX211dGV4X2RyaXZlciA9IHsKPiAgICAgICAgIC5wcm9iZSAgICAgICAgICA9
IG10a19tdXRleF9wcm9iZSwKPiAgICAgICAgIC5yZW1vdmUgICAgICAgICA9IG10a19tdXRleF9y
ZW1vdmUsCj4gICAgICAgICAuZHJpdmVyICAgICAgICAgPSB7Cj4KPgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
