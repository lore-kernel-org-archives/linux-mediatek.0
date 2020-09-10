Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28BE0C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 07:25:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDAFA2073E
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 07:25:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="btt7NoXR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VCg1Rxdg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDAFA2073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=53/okWMO/dsDcoGtRQlJZ1peP647X1BTR0o46QspDUE=; b=btt7NoXReI6ngRExHQUAOzj3R
	rKeDs5R1HIGSN2mYMmR/a/UwiZsMc/+LY4ujhqere5u+KQnv9i1NceWPRwhMXAHe71pCc5H9/iSN5
	pC/iAa8QHd/DpuggrWYZIKAVqv3KlDek8gK6L4nG4v16mZzPe6tIvHRWYAY/ORcs7LJx1KUnt9Isn
	ZePq5FrBrprFN126dQYEj3yhVbSMjbhndANEmnnLM/Y/0v+VeX0p5R4qSeA0D8m9COp5S4C/svjyr
	QR+8eU8q8Cj1GX/DH84rK9T0zHqJowVtlUWpE3sbiuyrDSGRszmxVnEhe1u59LRJazeLyvZM2Jpsi
	vZIUg0OVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGdQT-0007Ey-3Y; Fri, 11 Sep 2020 07:24:53 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGdQM-0007Ce-Tv; Fri, 11 Sep 2020 07:24:47 +0000
Received: by mail-il1-x143.google.com with SMTP id a19so3564868ilq.10;
 Fri, 11 Sep 2020 00:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yDDPYjQ6DUX6xXLMzgBfV6buP3oYPEgo+EN2kc6eWTY=;
 b=VCg1Rxdg/5MOXY5w9Loq/ArIKnhcyC7pdwtI0PJCD0vVfIdVBX+RvdOd1Q5EE/A53w
 HWGWf0JGtxHP61Zr4h8gH4j26j5SNSoxD3vtLuGw3a0z0WxP89DkWfDwDzZcnX1R76Ic
 jXruVD3rEZ4UXYCNvS2a7SCyOmZW8U+yp5ao+bAfosxKLd2YKefNhRYzjaJSwazSk08G
 v654syyecqb4nuwrs7j4hZIwCdFoj/l0Ei56xgFfWkIAn4dksivJxtmTJHXaJn+CYlHl
 YLMUqkbMZRmVZbV0VPKguJqZFYMyTDpGNyYxSUjXRJrxYEL6h6Dj3bXA5NYbLYpMKZqk
 ClfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yDDPYjQ6DUX6xXLMzgBfV6buP3oYPEgo+EN2kc6eWTY=;
 b=UNJYh0eDprGI0Qc/QbtXzuFbWtBA5WixBK73cmkuK3ZUMdOtIBBkhxbqSuQqNrM3gN
 Fcl0wcwyy1G1WxJdFGUOkjfA9koK5xh3N5pBsLUzFzKrF2RTa/9RS9luFzPnDL+iz4I2
 I0hj0zxe3RflpQynjnTLVKcIh7WzR2w/mp8Gxdu7LqLNGgWg/PHCKl31+d3otujjXjkF
 KhMuyKKo0LyQrOPqn5v7p4M1dnnN+8X1ifyiHC3KiaRyS38O3NYPkwxMU2iGvDoq0LJp
 zZPqLesI/QwKp3hIZDBALentmiw8NnJWt3xtqS8AS/xam8OBM+yrunMmjCV6orO4kcty
 Souw==
X-Gm-Message-State: AOAM5303pBtTL16VFbNcZS+FsD+rC0ir2VOau23Sh6CBEkQjB5i64I5n
 aYI+bvFod7x/UfninOdMCwDNt+UYiSljbbu3Gj0=
X-Google-Smtp-Source: ABdhPJzhSZZfBvon++gRijFHc6uMrRA3K01c6hT3xUWA9CJkZCyxj2DMSIaOlblADANdWJCoh65AMYrunuU/yZTx3G4=
X-Received: by 2002:a92:d1d1:: with SMTP id u17mr699311ilg.127.1599809083413; 
 Fri, 11 Sep 2020 00:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
 <559a568e-3a2e-33c6-43aa-547a18f8e26b@gmail.com> <20200911070503.GA9818@amd>
In-Reply-To: <20200911070503.GA9818@amd>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Fri, 11 Sep 2020 07:24:31 +0800
Message-ID: <CAE+NS34aKmu0tjnCPg3nF_vB0ELKsKwZSOeEXsm5V9aPAqqSbQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] leds: mt6360: Add LED driver for MT6360
To: Pavel Machek <pavel@ucw.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_032446_996350_3C1F0537 
X-CRM114-Status: GOOD (  15.24  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 cy_huang@richtek.com, linux-kernel@vger.kernel.org,
 Gene Chen <gene_chen@richtek.com>, benjamin.chao@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, shufan_lee@richtek.com,
 Wilma.Wu@mediatek.com, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

UGF2ZWwgTWFjaGVrIDxwYXZlbEB1Y3cuY3o+IOaWvCAyMDIw5bm0OeaciDEx5pelIOmAseS6lCDk
uIvljYgzOjA15a+r6YGT77yaCj4KPiBIaSEKPgo+ID4gPit7Cj4gPiA+KyAgICBzdHJ1Y3QgbXQ2
MzYwX2xlZCAqbGVkID0gY29udGFpbmVyX29mKGxjZGV2LCBzdHJ1Y3QgbXQ2MzYwX2xlZCwgZmxh
c2gubGVkX2NkZXYpOwo+ID4gPisgICAgc3RydWN0IG10NjM2MF9wcml2ICpwcml2ID0gbGVkLT5w
cml2Owo+ID4gPisgICAgdTMyIGVuYWJsZV9tYXNrID0gTVQ2MzYwX1RPUkNIRU5fTUFTSyB8IE1U
NjM2MF9GTENTRU5fTUFTSyhsZWQtPmxlZF9ubyk7Cj4gPiA+KyAgICB1MzIgdmFsID0gKGxldmVs
KSA/IE1UNjM2MF9GTENTRU5fTUFTSyhsZWQtPmxlZF9ubykgOiAwOwo+ID4gPisgICAgdTMyIHBy
ZXYgPSBwcml2LT5mbGVkX3RvcmNoX3VzZWQsIGN1cnI7Cj4gPiA+KyAgICBpbnQgcmV0Owo+ID4g
PisKPiA+ID4rICAgIGRldl9kYmcobGNkZXYtPmRldiwgIlslZF0gYnJpZ2h0bmVzcyAlZFxuIiwg
bGVkLT5sZWRfbm8sIGxldmVsKTsKPiA+ID4rICAgIGlmIChwcml2LT5mbGVkX3N0cm9iZV91c2Vk
KSB7Cj4gPiA+KyAgICAgICAgICAgIGRldl93YXJuKGxjZGV2LT5kZXYsICJQbGVhc2UgZGlzYWJs
ZSBzdHJvYmUgZmlyc3QgWyVkXVxuIiwgcHJpdi0+ZmxlZF9zdHJvYmVfdXNlZCk7Cj4gPgo+ID4g
RG9lc24ndCBoYXJkd2FyZSBoYW5kbGUgdGhhdD8gSU9XLCB3aGF0IGhhcHBlbnMgd2hlbiB5b3Ug
aGF2ZSBlbmFibGVkCj4gPiBib3RoIHRvcmNoIGFuZCBmbGFzaD8gSWYgZmxhc2gganVzdCBvdmVy
cmlkZXMgdG9yY2ggbW9kZSwgdGhhbiB5b3UKPiA+IHNob3VsZCBub3QgcHJldmVudCBlbmFibGlu
ZyB0b3JjaCBpbiB0aGlzIGNhc2UuCj4KPiBZZXAsIHRoaXMgaXMgc3RyYW5nZS9jb25mdXNpbmcu
Li4gYW5kIHdhcyByZWFzb24gd2h5IEkgYXNrZWQgZm9yIG5vdAo+IHN1cHBvcnRpbmcgc3Ryb2Jl
IGZyb20gc3lzZnMuCj4KPiBDb3VsZCBJIGdldCB5b3UgdG8gcmVtb3ZlIGNvZGUgeW91IGFyZSBu
b3QgY29tbWVudGluZyBhdCB3aGVuCj4gcmV2aWV3aW5nPwo+CgpNVDYzNjAgRkxFRCByZWdpc3Rl
ciBkZWZpbmUgaXMgU1RST0JFX0VOL1RPUkNIX0VOL0NTMS9DUzIgKGN1cnJlbnQKc291cmNlKSA0
IGJpdHMuClRoZSBTVFJPQkVfRU4vVE9SQ0hfRU4gaXMgc2hhcmVkIGJ5IEZMRUQxIGFuZCBGTEVE
Mi4KSWYgSSB3YW50IHRvIGVuYWJsZSBGTEVEMSB0b3JjaCBtb2RlLCBJIHNldCBUT1JDSF9FTiBh
bmQgQ1MxCklmIEkgd2FudCB0byBlbmFibGUgRkxFRDIgc3Ryb2JlIG1vZGUsIEkgc2V0IFNUUk9C
RV9FTiBhbmQgQ1MyCkZvciBleGFtcGxlIEkgc2V0IEZMRUQxIHRvcmNoLCB0aGVuIEkgc2V0IEZM
RUQyIHN0cm9iZS4KV2hlbiBJIHNldCBGTEVEMiBzdHJvYmUsIEkgd2lsbCBzZWUgdGhlIHN0cm9i
ZSBjdXJyZW50IGlzIEZMRUQyIGFkZApGTEVEMSBjdXJyZW50IHdoaWNoIGlzIG5vdCBJIHdhbnQu
ClNvIEkgbmVlZCBkaXNhYmxlIEZMRUQxIHRvcmNoIGZpcnN0LgpDb25zaWRlcmluZyBldmVyeSBj
aXJjdW1zdGFuY2VzIGlzIGNvbXBsaWNhdGVkIHdoZW4gc2hhcmUgc2FtZSBIL1cKbG9naWMgY29u
dHJvbC4KQW5kIHRoZSBvdGhlciBwcm9ibGVtIGlzIHRvcmNoIG1vZGUgc3dpdGNoIHRvIHN0cm9i
ZSBtb2RlIG5lZWRzIHJhbXAKdGltZSBiZWNhdXNlIHN0cm9iZSBhbmQgdG9yY2ggbW9kZSBjYW4n
dCBiZSBjby1leGlzdC4KCj4gPiA+K01PRFVMRV9BVVRIT1IoIkdlbmUgQ2hlbiA8Z2VuZV9jaGVu
QHJpY2h0ZWsuY29tPiIpOwo+ID4gPitNT0RVTEVfREVTQ1JJUFRJT04oIk1UNjM2MCBMZWQgRHJp
dmVyIik7Cj4KPiBMZWQgLT4gTEVELgo+CgpBQ0sKCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUGF2ZWwKPiAt
LQo+IChlbmdsaXNoKSBodHRwOi8vd3d3LmxpdmVqb3VybmFsLmNvbS9+cGF2ZWxtYWNoZWsKPiAo
Y2Vza3ksIHBpY3R1cmVzKSBodHRwOi8vYXRyZXkua2FybGluLm1mZi5jdW5pLmN6L35wYXZlbC9w
aWN0dXJlL2hvcnNlcy9ibG9nLmh0bWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
