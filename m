Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2309BC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 11:07:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA0032071E
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 11:07:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i2hVvCnB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4RkzO8S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA0032071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sTCfAVoqGYC5u0sPp+Ub4jUKuZ0d08RhAmtaWdiFvco=; b=i2hVvCnBKRHB/mQHLpe/8M4lb
	OGyU3ZGlhZ6WMmJ0qOT0+mSynuikcce2sVFj8gXsJNdSj+GMcHjQBZ/I6fsNuU/a9DwLL0gh3ynnz
	3CT8F58gySIiW02er1Apt0MRY8lkAOzZrlJ67V67GTe3qEkcqtrbb06NnAvUvcpAFKsfc4x96QwKa
	IIRlPvYnT+V1l5JqzXEDoSAG9w1DbVoMQ0s59kxRwKoiWOGn4/ay461X6ds2+Fycs390mqFYRvHO8
	WNTZbWqJm838brWMjRezQAXw3A4lpIZBIY6kFK+1S9smAuX7Y2qxrPR+9bSXvbSTq9ILrh47l2Q3W
	QbnTQFhcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAWnh-0000tu-RO; Tue, 25 Aug 2020 11:07:37 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAWne-0000t6-3K; Tue, 25 Aug 2020 11:07:35 +0000
Received: by mail-io1-xd41.google.com with SMTP id b16so12010366ioj.4;
 Tue, 25 Aug 2020 04:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HMkRJoEoEUn21NqqHhnIEKN+rPcZDLWWdRs/dAC79mk=;
 b=M4RkzO8Socq4fG14EpJvwtPBIk+Ptg612O6PKzybgDovHsa/iAeKhnoOPL23WiVTjw
 ABXef7F2fStb2STNKWVKzH3yX9XyXY3m6tB/74La4hi5iLDrFnELJ5UshGHSCy6yaH1l
 kvkTy8k2S/U1doagAha+TiEUwXnYEsHGyPsgaadbjQOdau4vrE+KNTZPFhTFurdr5ar0
 jzr3S5NDTfRG6TUTvmTDJRvxvWnnmXSqviY28l7sfJdCO0fOTYriAdgu3Mgv1ecMkUh3
 PnaA4lAm4/eG1oDZQIavREQa3tCy5fcqjt86jFgu7C+UxS/hBZDrPRoUls9kCvdmmbVk
 d5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HMkRJoEoEUn21NqqHhnIEKN+rPcZDLWWdRs/dAC79mk=;
 b=IcdfwB2mvxJ6OOt+V+Bum7djqtnQ4jFo/0pzATpRacu9p4r2i+P4mtFTuVtdoZr4H4
 EYzaV0Uorez3Y0VWupkhdnfl1SeT1OfcyLH9sf9SIdY8y1EqRQkTeN4bnCb7ElezAjnG
 fKacODBatKGpSfMcPmw5SrVh+sO94sQ0hx2JxqxYLkZTyJSFw1980nrZN95aNyGwrgy4
 3jquswr5JCPBbG2cvDc+XmfXg8txYrF+yrgabqbNVuWvrEMl4hlmTLFy6XPvqE3rhEth
 uRxZ7rconf0CwJVnsVYwCxQ+5VxRPW4sdZwFPVOa8yFuWpQ06X1o7idB7hxusb0k2HRk
 Rz0Q==
X-Gm-Message-State: AOAM531/5Q1/HUepHUMUvB+yw+RZZDZo+NHmbAq8/3NICipi7eozvrge
 GPZa26iffreDyUGutWWSD/l8KMmPNr5fzB7LRP8=
X-Google-Smtp-Source: ABdhPJyjCL5MWKrkK6LZVA0FEUJuMqi3HTst3sxJ022Y6tIPShnYoH25nJYtY0lkWRabwgUMnf/2K9Rdq7wgtUvvN8k=
X-Received: by 2002:a05:6638:1489:: with SMTP id
 j9mr10160242jak.22.1598353652285; 
 Tue, 25 Aug 2020 04:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <1597910022-22617-1-git-send-email-gene.chen.richtek@gmail.com>
 <1597910022-22617-3-git-send-email-gene.chen.richtek@gmail.com>
 <20200820113015.GB5854@sirena.org.uk>
 <CAE+NS36C0AwbrFJdYGY6_n_g3DVitp_e1GfZUxjMbKu1bJ_t4w@mail.gmail.com>
 <20200824194840.GF4676@sirena.org.uk>
 <CAE+NS37p38dAN1bAi_VvEYYGNiWDVFKrdHL-hTgi2nim_7Zvqw@mail.gmail.com>
 <20200825093404.GB5379@sirena.org.uk>
 <CAE+NS35eh9PhRA1M2f2med52WhRsEfWp=zWUfgETq4odHouxDg@mail.gmail.com>
 <20200825100804.GD5379@sirena.org.uk>
In-Reply-To: <20200825100804.GD5379@sirena.org.uk>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Tue, 25 Aug 2020 19:07:21 +0800
Message-ID: <CAE+NS36VX0FosRZ8xs-RTMCcEuMERvoERx2yT0as5wsSRS0+=w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] regulator: mt6360: Add DT binding documentation
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_070734_352699_A7E67D04 
X-CRM114-Status: GOOD (  19.68  )
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
Cc: Gene Chen <gene_chen@richtek.com>, devicetree@vger.kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

TWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPiDmlrwgMjAyMOW5tDjmnIgyNeaXpSDpgLHk
uowg5LiL5Y2INjowOOWvq+mBk++8mgo+Cj4gT24gVHVlLCBBdWcgMjUsIDIwMjAgYXQgMDY6MDE6
NDZQTSArMDgwMCwgR2VuZSBDaGVuIHdyb3RlOgo+ID4gTWFyayBCcm93biA8YnJvb25pZUBrZXJu
ZWwub3JnPiDmlrwgMjAyMOW5tDjmnIgyNeaXpSDpgLHkuowg5LiL5Y2INTozNOWvq+mBk++8mgo+
Cj4gPiA+ID4gTERPX1ZJTnggaXMgSFcgZGVzaWduIGxheW91dCwgc28gYWN0dWFsbHkgaXQgY2Fu
J3QgYmUgY2hhbmdlZCBieSBkZXZpY2UgdHJlZS4KPiA+ID4gPiBMRE9fVklOMS9MRE9fVklOMiBz
dXBwbHkgZnJvbSBWU1lTLCBub3QgcmVndWxhdG9yLCBzbyBJIHRoaW5rIHVzdWFsbHkKPiA+ID4g
PiBub3QgdG8gc2hvdyB0aGUgc3VwcGx5IGZyb20gaW4gZGV2aWNlIHRyZWUuCj4gPiA+ID4gb3Ig
SSBzaG91bGQgZGVjbGFyZSBhIGR1bW15IHJlZmVyZW5jZSB0byBzeXN0ZW0gcG93ZXIgbGlrZSAi
Ki1zdXBwbHkgPQo+ID4gPiA+IDwmc3lzdGVtX3Bvd2VyPjsiPwo+Cj4gPiA+IFdoZW4geW91IHNh
eSBpdCdzIGZyb20gdGhlIGhhcmR3YXJlIGRlc2lnbiBkbyB5b3UgbWVhbiBpdCdzIGZpeGVkIGJ5
IHRoZQo+ID4gPiBzaWxpY29uIG9yIGlzIHRoaXMgc29tZXRoaW5nIHRoYXQncyBmaXhlZCBpbiB0
aGUgYm9hcmQ/Cj4KPiA+IGZpeGVkIGluIHRoZSBib2FyZCwgbm90IHNpbGljb24uCj4KPiBBaCwg
aWYgaXQncyBmaXhlZCBieSB0aGUgYm9hcmQgdGhhdCdzIGV4YWN0bHkgdGhlIHNvcnQgb2YgdGhp
bmcgdGhhdAo+IHNob3VsZCBiZSBpbiBEVCAtIHRoZSBEVCBkZXNjcmliZXMgdGhlIGJvYXJkIHNv
IGlmIHNvbWUgb3RoZXIgc3lzdGVtIGhhcwo+IGEgZGlmZmVyZW50IGNvbmZpZ3VyYXRpb24gdGhl
biBpdCB3aWxsIGhhdmUgYSBkaWZmZXJlbnQgRFQuICBXaXRoIHN1cHBseQo+IHByb3BlcnRpZXMg
eW91IGNhbiBqdXN0IGxlYXZlIHRoZW0gbWlzc2luZyBpbiB0aGUgRFQsIHlvdSdyZSBub3QKPiBz
dXBwb3NlZCB0byBidXQgc28gbWFueSBzeXN0ZW1zIGRvIGl0IHRoYXQgdGhlIGZyYW1ld29yayB3
aWxsIGhhbmRsZSBpdC4KPiBPdGhlcndpc2UgaWYgeW91IHdhbnQgdG8gcmVwcmVzZW50IFZTWVMg
eW91IGNhbiBoYXZlIGEgZml4ZWQgdm9sdGFnZQo+IHJlZ3VsYXRvciB3aXRoIG5vIGNvbnRyb2wg
YW5kIGhvb2sgdGhlbSB1cCB0byBpdC4KCm9rLCBJIHRoaW5rIEkgd2lsbCBmb2xsb3cgdGhlIGZy
YW1ld29yayB0byBoYW5kbGUgaXQuCkkgd2lsbCBhZGQgc3VwcGx5IGRlc2NyaXB0aW9uIGluIGRl
dmljZXRyZWUKICBMRE9fVklOMS1zdXBwbHk6CiAgICBkZXNjcmlwdGlvbjogSW5wdXQgc3VwcGx5
IHBoYW5kbGUocykgZm9yIExETzEvMi8zIHdoaWNoIGlzIHN1cHBseSBmcm9tIFZTWVMKICBMRE9f
VklOMi1zdXBwbHk6CiAgICBkZXNjcmlwdGlvbjogSW5wdXQgc3VwcGx5IHBoYW5kbGUocykgZm9y
IExETzUgd2hpY2ggaXMgc3VwcGx5IGZyb20KVlNZUwogIExET19WSU4zLXN1cHBseToKICAgIGRl
c2NyaXB0aW9uOiBJbnB1dCBzdXBwbHkgcGhhbmRsZShzKSBmb3IgTERPNi83CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
