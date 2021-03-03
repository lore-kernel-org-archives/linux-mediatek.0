Return-Path: <SRS0=K2BI=IC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45DBFC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Mar 2021 02:24:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0ABD64E51
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Mar 2021 02:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0ABD64E51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VsUmEsMO1EzDhM6lI66xZkZ+88Co8geNv2GcE71cA1I=; b=KUoGVAteluw+2N5F2WhGQ32Ml
	ClIfahRNPeWoSz2cFWC+1+y7lBcQiibgNKDBo0itcaKEOm9e5ZcDEthDvypVfO+tUEd3qJhS/wLUN
	S0EDKBg5W/jgAMD0y0TpJs7f/vJOwWvuNaHNt4xT7g6UGsUF6xw0YvsHdyjM3dbVF4+oFZoOv+D42
	5JZ9E5Lahapjckm+WWyc4GA1VQVeDkfltjlkwBYas29CmSK29KXPWaoZGnjye7qi7OCJEqT50XVUT
	t6Fu5OyVE/1u4D9mQH5rSKRqvXdQn6Dnx3w4S/CTmwGbOYg1RmSkCmJeTS/g27MM1qTbzauDz1Ftp
	llyBi9J/w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHddG-007TAg-9a; Thu, 04 Mar 2021 02:22:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHbHT-007282-DX
 for linux-mediatek@lists.infradead.org; Wed, 03 Mar 2021 23:51:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9FCA64F3F
 for <linux-mediatek@lists.infradead.org>; Wed,  3 Mar 2021 23:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614815502;
 bh=4yS5iyJsfhsmr+JcD2q/iH0huGBVo0X7ndYyoZeb90s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Wcwfy2oLdCegFM+NSj5hIFVc7IO8f2MbMGQGKYiV4XONi62oteEtvl+UFt7TgUooX
 xiruDUU4P/IxGiiuoopVydls3hf2BifOFr2bt8yvypmBGYvhHvLEn6m6Ktj44nFMRj
 7ZOo6u6VD2EG9ooX02rLJ3SYXMg7kraYH/js/b7pXTTCo4o4Q8l5NPm7DhpBExYjrN
 IyFDCuHCiNN3XddxFZxvFnaBHSFfJyOjNp6dYsuCwvMxp3zL8ky0CqyQAa5uqaF/ls
 ST/IYm6MOPIVvf4xZ9X8MfzmxAy6Y0APTx5JZhlHvEuFTk+wD8xY8ix3gm1zdHZEsT
 gR9zYjPEVUKgQ==
Received: by mail-ej1-f44.google.com with SMTP id mj10so25680673ejb.5
 for <linux-mediatek@lists.infradead.org>; Wed, 03 Mar 2021 15:51:41 -0800 (PST)
X-Gm-Message-State: AOAM531zt3acQWzbLlU73oLmpNnzWgv8pdaOsPf1CCqMA/EGjvf/By+A
 CGqxkhM8Bgk4bmA4FYMpzZfWCydiputHzwSpBA==
X-Google-Smtp-Source: ABdhPJxjTF125VBav37vNTxcoNrEEtc96QdczKSVNaMWeC6x43SJnAkfM2Ubk2nF5FkmmMzIcHZNXpwWfscGCx+RprI=
X-Received: by 2002:a17:906:a106:: with SMTP id
 t6mr1209918ejy.63.1614815500452; 
 Wed, 03 Mar 2021 15:51:40 -0800 (PST)
MIME-Version: 1.0
References: <20210223215057.125708-1-robh@kernel.org>
In-Reply-To: <20210223215057.125708-1-robh@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 4 Mar 2021 07:51:29 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-x2RTU9c0=ibRdiO8-o8F0GU0DNa5UDSeKsmboSJfHDw@mail.gmail.com>
Message-ID: <CAAOTY_-x2RTU9c0=ibRdiO8-o8F0GU0DNa5UDSeKsmboSJfHDw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: mediatek,
 dpi: Convert to use graph schema
To: Rob Herring <robh@kernel.org>
Cc: DTML <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, 
 Jitao shi <jitao.shi@mediatek.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
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

SGksIFJvYjoKClJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IOaWvCAyMDIx5bm0MuaciDI0
5pelIOmAseS4iSDkuIrljYg1OjUx5a+r6YGT77yaCj4KPiBVcGRhdGUgdGhlIG1lZGlhdGVrLGRw
aSBiaW5kaW5nIHRvIHVzZSB0aGUgZ3JhcGggc2NoZW1hLiBNaXNzZWQKPiB0aGlzIG9uZSBmcm9t
IHRoZSBtYXNzIGNvbnZlcnNpb24gc2luY2UgaXQncyBub3QgcGFydCBvZiBkcm0tbWlzYy4KCkFw
cGxpZWQgdG8gbWVkaWF0ZWstZHJtLW5leHQgWzFdLCB0aGFua3MuCgpbMV0gaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4Lmdp
dC9sb2cvP2g9bWVkaWF0ZWstZHJtLW5leHQKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4gQ2M6
IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+IENjOiBQaGlsaXBwIFph
YmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgo+IENjOiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0
aGlhcy5iZ2dAZ21haWwuY29tPgo+IENjOiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgo+IENj
OiBKaXRhbyBzaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gLS0tCj4g
IC4uLi9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS55YW1sICAgICAgIHwg
MTEgKysrLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgOCBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkcGkueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS55YW1sCj4gaW5k
ZXggNmNkYjczNGM5MWE5Li5lYjg0YjUzY2FiYjEgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHBpLnlhbWwK
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxkcGkueWFtbAo+IEBAIC01MCwxNSArNTAsMTAgQEAgcHJvcGVydGllczoKPiAg
ICAgICAgLSBjb25zdDogc2xlZXAKPgo+ICAgIHBvcnQ6Cj4gLSAgICB0eXBlOiBvYmplY3QKPiAr
ICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvcG9ydAo+ICAgICAgZGVz
Y3JpcHRpb246Cj4gLSAgICAgIE91dHB1dCBwb3J0IG5vZGUgd2l0aCBlbmRwb2ludCBkZWZpbml0
aW9ucyBhcyBkZXNjcmliZWQgaW4KPiAtICAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2dyYXBoLnR4dC4gVGhpcyBwb3J0IHNob3VsZCBiZSBjb25uZWN0ZWQKPiAtICAgICAg
dG8gdGhlIGlucHV0IHBvcnQgb2YgYW4gYXR0YWNoZWQgSERNSSBvciBMVkRTIGVuY29kZXIgY2hp
cC4KPiAtCj4gLSAgICBwcm9wZXJ0aWVzOgo+IC0gICAgICBlbmRwb2ludDoKPiAtICAgICAgICB0
eXBlOiBvYmplY3QKPiArICAgICAgT3V0cHV0IHBvcnQgbm9kZS4gVGhpcyBwb3J0IHNob3VsZCBi
ZSBjb25uZWN0ZWQgdG8gdGhlIGlucHV0IHBvcnQgb2YgYW4KPiArICAgICAgYXR0YWNoZWQgSERN
SSBvciBMVkRTIGVuY29kZXIgY2hpcC4KPgo+ICByZXF1aXJlZDoKPiAgICAtIGNvbXBhdGlibGUK
PiAtLQo+IDIuMjcuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
