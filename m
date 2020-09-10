Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9208C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 11:46:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71A6D2078E
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 11:46:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C4IMIooh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TA0eyE+C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71A6D2078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y0C71sFUSTrXZRY33eEDfAmGlE3NdqLaaVUTtZY+1CY=; b=C4IMIoohYvEtgt9cXBz/uO6XM
	mgyPIwddK6BArt53sg2XmVEgL0t3P8vzzD74jzUp/xt/ADAvfX74Zi5ORbv/03SCT/f88ebvKEbpl
	fVo6Pl7ZfnMQMWcGw2VOhgAm4c2Xg4Cj/dYa7wHiMfwZx1E115XbeIcYTGd1TDXtnRJeOOZW6A4ES
	ORPgh9Fh+ymHYB4PegabukfbiQ1wn7BS8wGZo3c6PJW270Y74wyLfEh3m4jDQW2xQWvRDMcJhK5IB
	Ct/kJzqQP5Sc/1BPNySdTVn5ZioAmY/GaY/Zxm9scYqglZLz3qqHADhvaoeU2PZYHH6c1dzkyNu30
	9fuM8iBLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGL27-0007OD-0f; Thu, 10 Sep 2020 11:46:31 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGL24-0007N8-52; Thu, 10 Sep 2020 11:46:28 +0000
Received: by mail-pf1-x443.google.com with SMTP id v196so4609522pfc.1;
 Thu, 10 Sep 2020 04:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Nw0E6gxQ2hI2c4XtcGgjWtuM2BIER2w0GyM871TVHiE=;
 b=TA0eyE+C1G8SDT1g5ewoXGJN+Pte1ilhz6PSvNsNQH/mV4ErK+fr1FKYJ9wwPMZILn
 Ed9l1+V5/pBZwg5KGPHzH1iXJCdMvytO1u91dfuuG+lMPlsArNoDH+qw7TUyX0uiGSc+
 VXGaMnOwU72TeQuVxi9MIWYcowk6asEF0ZqZ6tufgjirVCiWVm3rsYZnUaRnh+2shh/z
 NQ5hL/IDyaxFs4dIWHN7DIGNG7A0eZwb+btta7syG8UFhXCh07oWcy4FrSD7DXR2tKnY
 TDOBpN1OMQz5PcPCCq662olaEJv89X4VHgMO5GRUc3beDuHuLwWCgHU6dTHXkIVBnwib
 RRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Nw0E6gxQ2hI2c4XtcGgjWtuM2BIER2w0GyM871TVHiE=;
 b=Mf3ff3f0Lz9YtL7gkz/E2L2ziL4Ip0eNcjsM8SUI5T36uhyMI3OUc/5aJ+IQmwpM1a
 FF/j6iIL/5XdsYnVU6Za5HsFAPQnHqlubRpbReLgeSV25YlcwU/aa1kfZTX0iieejEeb
 Ji6J6OhrVkGhABRGlAtnrieCLj33mBoN13qa7hUBCsqwyA+wtFKoFiyrIOYz4pPFrXcG
 9iLaqTcLWFLdwaVMftsG/cceHITPWH1rQOevuv9Ds+dZNtgBxJlEfK7M58AY3fAM8MrC
 CpEo/fUjh6JHoMu0QyqjY6BVZW0wduVuUczkWngN3TclGFO1WZ2MYTtnicGJ1YxN6eDR
 JIOA==
X-Gm-Message-State: AOAM53131uDWMNgpqQCtCBMSh0H2/OxIFTGP76zscKD4Q6u0BQ2XOK5K
 ZixG77PEa95WCt2a+3QsbBCHrg2gkwD4xlJXNIA=
X-Google-Smtp-Source: ABdhPJwpLTvKve2riypUG+0ME7LX2XWWhl8ZwU5Y5Lg5Cj0ecvXaABCi2XmCtinoJjzwlOm6SQanVtnbYUXx1NFPLMs=
X-Received: by 2002:a63:ec4c:: with SMTP id r12mr4068361pgj.74.1599738385970; 
 Thu, 10 Sep 2020 04:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
 <CAHp75VdLDvoQicP1nLnjOiit6qjaw9n7+LuJ-J3MtaoHUOa_2g@mail.gmail.com>
 <CAE+NS35FETQ9ASJeYP=Sa8dm7ohRBcdAwUioCAnHPY2TiD4pNA@mail.gmail.com>
In-Reply-To: <CAE+NS35FETQ9ASJeYP=Sa8dm7ohRBcdAwUioCAnHPY2TiD4pNA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 10 Sep 2020 14:46:08 +0300
Message-ID: <CAHp75VdeqiMdm=zS7W9sfu7=hVFMo0NV6kTOZ_q6UNq9jFcNuA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] leds: mt6360: Add LED driver for MT6360
To: Gene Chen <gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_074628_210091_100CD963 
X-CRM114-Status: GOOD (  15.93  )
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
Cc: linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, cy_huang@richtek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, benjamin.chao@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>, shufan_lee@richtek.com,
 Wilma.Wu@mediatek.com, Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBTZXAgMTAsIDIwMjAgYXQgMTE6MTEgQU0gR2VuZSBDaGVuIDxnZW5lLmNoZW4ucmlj
aHRla0BnbWFpbC5jb20+IHdyb3RlOgo+IEFuZHkgU2hldmNoZW5rbyA8YW5keS5zaGV2Y2hlbmtv
QGdtYWlsLmNvbT4g5pa8IDIwMjDlubQ55pyIOeaXpSDpgLHkuIkg5LiL5Y2IOTo0OOWvq+mBk++8
mgo+ID4gT24gTW9uLCBTZXAgNywgMjAyMCBhdCAxOjMxIFBNIEdlbmUgQ2hlbiA8Z2VuZS5jaGVu
LnJpY2h0ZWtAZ21haWwuY29tPiB3cm90ZToKPiA+ID4gRnJvbTogR2VuZSBDaGVuIDxnZW5lX2No
ZW5AcmljaHRlay5jb20+CgouLi4KCj4gPiA+ICsgICAgICAgaWYgKHByaXYtPmZsZWRfc3Ryb2Jl
X3VzZWQpIHsKPiA+ID4gKyAgICAgICAgICAgICAgIGRldl93YXJuKGxjZGV2LT5kZXYsICJQbGVh
c2UgZGlzYWJsZSBzdHJvYmUgZmlyc3QgWyVkXVxuIiwgcHJpdi0+ZmxlZF9zdHJvYmVfdXNlZCk7
Cj4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+Cj4gPiBIbW0uLi4gU2hv
dWxkbid0IGJlIGd1YXJhbnRlZWQgYnkgc29tZSBmcmFtZXdvcms/Cj4gPgo+Cj4gQmVjYXVzZSBi
b3RoIEZsYXNoIExFRCB1c2Ugc2luZ2xlIGxvZ2ljYWxseSBjb250cm9sLgo+IEl0IGRvZXNuJ3Qg
ZXhpc3Qgb25lIExFRCBpcyB0b3JjaCBtb2RlLCBhbmQgdGhlIG90aGVyIGlzIHN0cm9iZSBtb2Rl
LgoKWW91IG1lYW4geW91IGhhdmUgYWx3YXlzIGFuIGF0dHJpYnV0ZSBmb3IgaGFyZHdhcmUgZXZl
biBpZiBpdCBkb2Vzbid0CnN1cHBvcnQgYSBmZWF0dXJlPwpDYW4geW91IGNvbnNpZGVyIGhpZGlu
ZyBhdHRyaWJ1dGVzPwoKLi4uCgo+ID4gPiArICAgICAgIGxjZGV2LT5tYXhfYnJpZ2h0bmVzcyA9
ICh2YWwgLSBNVDYzNjBfSVRPUkNIX01JTikgLyBNVDYzNjBfSVRPUkNIX1NURVAgKyAxOwo+ID4K
PiA+IERJVl9ST1VORF9VUCh2YWwgLSBNVDYzNjBfSVRPUkNIX01JTiwgTVQ2MzYwX0lUT1JDSF9T
VEVQKSA/Cj4gPgo+Cj4gVGhpcyBpcyBtYXBwaW5nIDB+dmFsIHRvIDF+bWF4X2JyaWdodG5lc3Mg
YXMgbGV2ZWwuCj4gSSBjb252ZXJ0IHZhbCBiZWxvdyBNVDYzNjBfSVRPUkNIX1NURVAgdG8gMSBm
b3IgaWdub3JlIG1heF9icmlnaHRuZXNzCj4gPSAwLCBiZWNhdXNlIDAgbWVhbnMgZGlzYWJsZS4K
PiBUaGVyZSBpcyBhIGxpdHRsZSBkaWZmZXJlbmNlIGZyb20gRElWX1JPVU5EX1VQLgoKV2hhdCBk
aXZfcm91bmRfdXAgZG9lcyBpcwooeCArIHkgLSAxKSAvIHkKV2hhdCBkbyB5b3UgZG8KCnggLyB5
ICsgMSA9ICh4ICsgeSkveSA9ICgoeCArIDEpICsgeSAtIDEpL3kgPSBESVZfUk9VTkRfVVAoeCsx
LHkpCgpTbywgRElWX1JPVU5EX1VQKHZhbCAtIE1UNjM2MF9JVE9SQ0hfTUlOICsgMSwgTVQ2MzYw
X0lUT1JDSF9TVEVQKSA/CgooeWVzIEkgbWFkZSBjbGFzc2ljYWwgb2ZmLWJ5LW9uZSBlcnJvcikK
Ci0tIApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
