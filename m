Return-Path: <SRS0=P9v4=KV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA84C4707F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 02:45:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0B2161432
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 02:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0B2161432
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nahrgHPB1p/HRWDkLioz64onk8GISt6NI0p+zCZ2XOQ=; b=pZwebvOV1z5wjd
	TeX6SiFaiFpYmchgWDYDv4UEzGfQ/97SBWM1YUSC4pVBl3WKIpi+LbY9WreNB+Xj9pBTTKhM9M1OS
	mDtb6IDcBvJOJJ0LyU0guBEJ42eL0Dx2LrJZKMfSv60Qq3WmR8XWF9Pohy61raS427wwIoLbjqZU7
	vJogv6HRa9P5Pc+4v1YV7Ys89uz71Yiz0LJ4gdfoxTLipkPe61oIBfr64K/27zTD/VD7wd4WoU/y5
	8pVBGNJ5jY7aoBqINCpGsXMnXyIxMHGOVn/8A2Cr6DvF2RB7P2tbWsSE6ysONTQwt22QyjkHBNJF6
	AUUE3ikQRYFMBf9mCwDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lljXf-00ACJq-AC; Wed, 26 May 2021 02:45:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lljXS-00ACFy-1L; Wed, 26 May 2021 02:44:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F74D61437;
 Wed, 26 May 2021 02:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621997093;
 bh=rsTIIgQ3nqy4Xh20GrbgV6iG0hbzpPJ4x64TSBbYFzk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aUw7bzkvwfXwXcnX0Slx6qwQ0gJAzurxTvY/6anEvxSCUgDNwo6TiL5z/qDcIiN/n
 W8Qfhw6DQK146YWDr5wnl2Z0wcLGa/Rdr8IHiommUUeoVz55BGbNZVr6RVUS27kgJb
 Xkci9t+L6u7TfXgsUbCuUD7ynjf9280qRvmGxinoaubF1Cl8z+i4PSCuowzzMqpcnm
 +/Axvp/3LlZw3A0o5qG0J05BLrtmzO7RzHO+auUKaWCP954siMkCBxjOuMGqbSDq6y
 Rc4w5RZTU1G9mxAKgETSyqh376Mrgl3pmBwexauhUGsyej6ToClSMvZC/m7vYFOZGT
 nISKkkisEHaXg==
Received: by mail-ed1-f54.google.com with SMTP id s6so38593834edu.10;
 Tue, 25 May 2021 19:44:53 -0700 (PDT)
X-Gm-Message-State: AOAM533e/XrBFGewfyZgko5ps6ysy+fIrezFDxeRO5PmnSGaCQYN9Vl3
 I+HU9JvwppGb7V1vcTCNrgBG1FN/kRRvNTvunQ==
X-Google-Smtp-Source: ABdhPJxwO04yl5WZa0+jOnbeZ7drXGaZrOwZtr9HVj+l8GtBtUXQE1ouzcgJ7WJCend58die4B49R8xq/+6Bkf17N/E=
X-Received: by 2002:a05:6402:4cf:: with SMTP id
 n15mr36336665edw.162.1621997091699; 
 Tue, 25 May 2021 19:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210525121448.30075-1-rex-bc.chen@mediatek.com>
 <20210525121448.30075-2-rex-bc.chen@mediatek.com>
 <CAAOTY__aasihVxC72f7b_R-=UcR85Z1G9M8TxUS9dBrad-aRxQ@mail.gmail.com>
 <c90629c915bc1c0d2e6b1070939a443ce5f8644c.camel@mediatek.com>
In-Reply-To: <c90629c915bc1c0d2e6b1070939a443ce5f8644c.camel@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 26 May 2021 10:44:41 +0800
X-Gmail-Original-Message-ID: <CAAOTY__3FWA37h5AoK_VR9LhyfHf3dGx2m-2P==2PNOpsxwyJQ@mail.gmail.com>
Message-ID: <CAAOTY__3FWA37h5AoK_VR9LhyfHf3dGx2m-2P==2PNOpsxwyJQ@mail.gmail.com>
Subject: Re: [v4,PATCH 1/3] drm/mediatek: dpi dual edge sample mode support
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Jitao Shi <jitao.shi@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_194454_141453_79BF01F8 
X-CRM114-Status: GOOD (  20.14  )
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

UmV4LUJDIENoZW4gPHJleC1iYy5jaGVuQG1lZGlhdGVrLmNvbT4g5pa8IDIwMjHlubQ15pyIMjbm
l6Ug6YCx5LiJIOS4iuWNiDk6NTHlr6vpgZPvvJoKPgo+IEhlbGxvIENLLAo+Cj4gVGhhbmtzIGZv
ciB5b3VyIHJldmlldy4KPgo+IE9uIFdlZCwgMjAyMS0wNS0yNiBhdCAwODowMSArMDgwMCwgQ2h1
bi1LdWFuZyBIdSB3cm90ZToKPiA+IEhpLCBSZXg6Cj4gPgo+ID4gUmV4LUJDIENoZW4gPHJleC1i
Yy5jaGVuQG1lZGlhdGVrLmNvbT4g5pa8IDIwMjHlubQ15pyIMjXml6Ug6YCx5LqMIOS4i+WNiDg6
MTXlr6vpgZPvvJoKPiA+ID4KPiA+ID4gRFBJIGNhbiBzYW1wbGUgb24gZmFsbGluZywgcmlzaW5n
IG9yIGJvdGggZWRnZS4KPiA+ID4gV2hlbiBEUEkgc2FtcGxlIHRoZSBkYXRhIGJvdGggcmlzaW5n
IGFuZCBmYWxsaW5nIGVkZ2UuCj4gPiA+IEl0IGNhbiByZWR1Y2UgaGFsZiBkYXRhIGlvIHBpbnMu
Cj4gPiA+IFVzZSBudW1fb3V0cHV0X2ZtdHMgdG8gZGV0ZXJtaW5lIHdoZXRoZXIgaXQgaXMgZHVh
bCBlZGdlIG1vZGUuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8u
c2hpQG1lZGlhdGVrLmNvbT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogUmV4LUJDIENoZW4gPHJleC1i
Yy5jaGVuQG1lZGlhdGVrLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RwaS5jIHwgMTcgKysrKysrKysrKysrKysrKy0KPiA+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gPiA+IGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+ID4gPiBpbmRleCBiZWE5MWM4MTYyNmUuLmQzYjg4
M2M5N2FhZiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cGkuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gPiA+
IEBAIC04Myw2ICs4Myw3IEBAIHN0cnVjdCBtdGtfZHBpIHsKPiA+ID4gICAgICAgICBzdHJ1Y3Qg
cGluY3RybCAqcGluY3RybDsKPiA+ID4gICAgICAgICBzdHJ1Y3QgcGluY3RybF9zdGF0ZSAqcGlu
c19ncGlvOwo+ID4gPiAgICAgICAgIHN0cnVjdCBwaW5jdHJsX3N0YXRlICpwaW5zX2RwaTsKPiA+
ID4gKyAgICAgICBib29sIGRkcl9lZGdlX3NlbDsKPiA+Cj4gPiBJIHdvdWxkIGxpa2UgdG8ga2Vl
cCBvdXRwdXRfZm10IGluc3RlYWQgb2YgZGRyX2VkZ2Vfc2VsLgo+ID4gSW5pdGlhbGl6ZSBvdXRw
dXRfZm10IHRvIE1FRElBX0JVU19GTVRfUkdCODg4XzFYMjQgaW4gdGhpcyBwYXRjaC4KPiA+Cj4g
SXQgbWVhbnMgdGhhdCBJIG1heSBpbml0aWFsaXplIG91dHB1dF9mbXQgaW4gcHJvYmUgYW5kIHNl
dCB2YWx1ZSBpbgo+IG10a19kcGlfYnJpZGdlX2F0b21pY19jaGVjaygpIG9mIHBhdGNoWzMvM10/
CgpZZXMuCgo+ID4gPiAgICAgICAgIGludCByZWZjb3VudDsKPiA+ID4gIH07Cj4gPiA+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
