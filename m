Return-Path: <SRS0=wQP+=EZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D0BFC2D0E4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 07:55:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D8122220B
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 07:55:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dMhT8TNu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNsRHcaf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D8122220B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G6fcpo5uRR3rfR3FQrnGgwFID1WMsXSOkyOmdsHu3oQ=; b=dMhT8TNuv3+Us8xG8gb+BE23I
	H1opgIUTaKMXVJripi98EQ9l8Tw3I9FYgIxky25XdEmJK89zJ2S1c5DSZJwzpaHuWLas8HFBZVCc9
	jFUw5AtNjZfuHyMKUICU+a4AZjFkVk3uo933vZ5p28Qsfk6E1iPQA7rLW/j/fSx6fTskSyRti7BpC
	Vs4fn5QjGuHO2T15FdQifrRAlnfymYac5MHEkdWU5f+7JE4q4oE9Jh8Qs2osXSABhJCuRg5vmE9yk
	KcC304RBrz9rd5sH/Vp9dBHLx4gF8eIlKzWtAcTf9z/Njar3cjDPxvCo2Yq6ZqDr44jqWkawYsSFl
	GF/f1KeFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfenI-0002FC-0Q; Thu, 19 Nov 2020 07:55:52 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfenB-0002EN-6V; Thu, 19 Nov 2020 07:55:46 +0000
Received: by mail-oi1-x232.google.com with SMTP id m143so5359663oig.7;
 Wed, 18 Nov 2020 23:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UqEZgdNvcjcXXhIWHNeHNBTdkcGqiFCGGG3iro71gmQ=;
 b=ZNsRHcafuF4aLywVyyfUtcjcUxqUIvHfl5jTABeV5GkI6jkOtmN4u8INwrzXI8Dh5Y
 1OYCAV+ovERlvxaarRt7FnjbFDuqATZpRjCQZ8xmXtnb7BeMr76HmkqRiHQHMAE+OeBv
 shH5OediHlDPTmmLKhBsPevO6sNsStYNlfxVrf3AlgpXZpUHZcxaVlFnQwLT2wIRpfiY
 0Q4SxZiO/Pc/ICjuT3YQq1awhGMm7R2iXz77/A+OgZIfJy9Tl60YsNA6yfcwWovWOBbV
 K/33gErJrnxbWcvCLNsADfUjtXzHsUV5mFbe64OjKEaTM4Tnnc41l1hyQWw59OWc9Ta/
 oRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UqEZgdNvcjcXXhIWHNeHNBTdkcGqiFCGGG3iro71gmQ=;
 b=bAPm+Q97RpOL279L4n0wu6sXb7EsMkW1msVYEl2El0VHGwrj5V6ij3d7ajECgYoaRN
 iS2Su4FinNr633WIJPsHbMTya1NrWHUGNdmRSvNPren7Q/9rK8vZf0kU4/rMnzFA7I+B
 35oJ/PIY9dte5P2eCJ/xvl3/Q6EEfVfOc1f13lKYjczqe/CdJ53HhOPgSo3y2zg24vFL
 LuT7tCMBL3LTDKhd1oioGyKiNYpESQdreMLq1LIihZbznEHNzGNRBrrmdHhEZvvqucXM
 x1+DbonVyki2WaEd6Zg/oENxGuW27AjTUdLTFoa7BBjDhqUBhHCML+ZWCMIyJJKIcIzn
 RLbg==
X-Gm-Message-State: AOAM532BQFqCNXxRD5/rqoaQzp83OuP0IPkm9UKI5eFjFO66OAQzSWfv
 2jVbBIoUZHd5G0kymlKn6D3JKienZghPTN++Skw=
X-Google-Smtp-Source: ABdhPJwVys4NN090PM4lDhnegSTeQWHr/UROay2glVQJ86PSq2eo5JMDrAwD/fpQm6omSHvSUuDiO/2DdJl03wKW/zE=
X-Received: by 2002:aca:4783:: with SMTP id u125mr2154242oia.23.1605772543224; 
 Wed, 18 Nov 2020 23:55:43 -0800 (PST)
MIME-Version: 1.0
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-3-git-send-email-gene.chen.richtek@gmail.com>
 <20201118213712.GA22371@amd>
 <CAE+NS36rnHzhdk5Os+vL=uK225HJT-bUHSRJ6KccaOHc-kCjpA@mail.gmail.com>
 <20201119074416.GA27576@amd>
In-Reply-To: <20201119074416.GA27576@amd>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Thu, 19 Nov 2020 15:55:32 +0800
Message-ID: <CAE+NS3430=-WynyXQr+8MghmtmiCR+2VeTt4aD5cT8UmA+1Qrg@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT
 definitions
To: Pavel Machek <pavel@ucw.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_025545_422675_F0CDA8C5 
X-CRM114-Status: GOOD (  13.41  )
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
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, shufan_lee@richtek.com,
 Wilma.Wu@mediatek.com, Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

UGF2ZWwgTWFjaGVrIDxwYXZlbEB1Y3cuY3o+IOaWvCAyMDIw5bm0MTHmnIgxOeaXpSDpgLHlm5sg
5LiL5Y2IMzo0NOWvq+mBk++8mgo+Cj4gSGkhCj4KPiA+ID4gPiBGcm9tOiBHZW5lIENoZW4gPGdl
bmVfY2hlbkByaWNodGVrLmNvbT4KPiA+ID4gPgo+ID4gPiA+IEFkZCBMRURfQ09MT1JfSURfTU9P
TkxJR0hUIGRlZmluaXRpb25zCj4gPiA+Cj4gPiA+IFdoeSBpcyBtb29ubGlnaHQgYSBjb2xvcj8g
Q2FtZXJhIGZsYXNoZXMgYXJlIHVzdWFsbHkgd2hpdGUsIG5vPwo+ID4gPgo+ID4gPiBBdCBsZWFz
dCBpdCBuZWVkcyBhIGNvbW1lbnQuLi4KPiA+ID4KPiA+ID4gQmVzdCByZWdhcmRzLAo+ID4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgUGF2ZWwKPiA+ID4KPiA+Cj4gPiBNb29ubGlnaHQgaGFzIG1vcmUgY3VycmVudCBsZXZl
bCgxNTBtQSkgZnJvbSBnZW5lcmFsIFJHQiBMRUQgKDI0bUEpLgo+ID4gSXQgY2FuIGJlIHVzZWQg
YXMgbmlnaHQtbGlnaHQgYW5kIHVzdWFsbHkgdXNlIGNvbG9yIEFNQkVSLgo+ID4gQ2FtZXJhIGZs
YXNoZXMgYXJlIHVzdWFsbHkgdXNlIHR3byBmbGFzaCBMRUQuIE9uZSBpcyBZRUxMT1csIGFuZCBv
bmUKPiA+aXMgV0hJVEUuCj4KPiBGcm9tIHdoYXQgSSBzZWVuLCBuaWdodC1saWdodHMgYXJlIHVz
dWFsbHkgZGlmZmVyZXRlbnQgInRlbXBlcmF0dXJlcyIKPiBvZiB3aGl0ZS4gQ29vbCB3aGl0ZSAr
IHdhcm0gd2hpdGUuCj4KPiBJIGJlbGlldmUgIndhcm0gd2hpdGUiIHdvdWxkIGJlIGVhc2llciB0
byB1bmRlcnN0YW5kIHRoYW4KPiAibW9vbmxpZ2h0Ii4uLgo+CgpBQ0ssIEkgd2lsbCBjaGFuZ2Ug
Y29sb3IgIkxFRF9DT0xPUl9JRF9XSElURSIKCj4gQmVzdCByZWdhcmRzLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQYXZl
bAo+Cj4gLS0KPiBodHRwOi8vd3d3LmxpdmVqb3VybmFsLmNvbS9+cGF2ZWxtYWNoZWsKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
