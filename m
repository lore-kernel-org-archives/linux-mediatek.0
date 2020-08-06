Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800FFC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 11:31:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1778B22D04
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 11:31:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yfYmQ/kx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrhVDbNQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1778B22D04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9vhA29sZeRmPAebuBfI8XlKXQb94/ZigUdGy1V3mjHE=; b=yfYmQ/kxwxV9jGnG4F/UyHWaV
	UzEGzx/9MADdU3c2rWlIQv4Tex42JiGBHIb0Ok5HAjrOcOTfGTX7n8a2rnNDpJ2DIeD3gJnPnc5nK
	/lmFQrG6bRbCTWsv01WStstq5SAc/fNazbCnkGb/2l65GQIcybkk9Sfg6sYSEcCSV1Rs2pL+ff7rW
	C50D/kAJxjHswxzmi+sDbcTWTsLtAyRkk1gxEBzWHQTby0sV1Zg4JvVnLYcSuL+gKOqguHX/skQvd
	/R85zaZOIntR9zp9wDBysbYfUphgTE53ftTuaImhSuR0TiZ7J6MotdRxgxgKqICeFgYI/P1NYdS1Q
	17L35MZrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3e79-000661-Ul; Thu, 06 Aug 2020 11:31:16 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3e76-00064m-Ka; Thu, 06 Aug 2020 11:31:13 +0000
Received: by mail-io1-xd42.google.com with SMTP id k23so49135256iom.10;
 Thu, 06 Aug 2020 04:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GBkcW6NgtTDsQc7K+wm9MXLGks5e/hCdXllRiayCbwg=;
 b=KrhVDbNQF8AsaaoIl4UOq09EsyfUznkaVXPCKNK89TXD4Uz95qFlls1Uidq4Vskll9
 zMvwZ2qZED8YOEIFfYZSHnbu0eZf46ZwG2xa9S+vuPklscZyIUL8aITpZ+2i4NmkySdw
 nZdaNIrVnvMY4Tr3C+aZGR98x5SvBijd5poj/LjbLGpkGcm1eouHtZjbWiGLLv3GflxY
 Rns9zkuRpElvyvFXPBEWRYvrKdHPEr/oqAaYL+0dABM42HpcSDxCRi6EYu9dlHzgMsWD
 IVsMY9HkHa66iGKoZTMCpDZ02mbKCnF6o0CyI4jP6zCGVYjYqzuP/LPMMGI4MsfHzMkO
 rtMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GBkcW6NgtTDsQc7K+wm9MXLGks5e/hCdXllRiayCbwg=;
 b=j2O5bodBhSiu1/8jxVGypxgn4DeA8rUQod33Rgah9is+h9cs2arZCwTmQjUD/4eT8m
 rqbvYx5c3w9JSFK175QnfZmHEXp9CcO8OzJph4FMU4wv22df2MgnyI+4cE7Wi4XKkeHb
 xE8wmBWrq46m0dVltiRw04pJUdmWvdA1Zq/BCRKF1cIKxa0D4P4Eai7lbztbr4ka4Nhd
 C8pg7xc5L+drKlmDeBTa+UMsJ9MWezUMwtwVBELwQyDwPhuLp99i7ePNk/etvwED/lq2
 LdmN9XHT/VLCZEiQViiZeJ/OUjnRjR0xBv2svo38KdpTl+v07oGU1mVmXqlpfeCTOFOH
 spHQ==
X-Gm-Message-State: AOAM531t3xcKaohMCVtw13XmqPdkYiO1g/0XeVMdM+zzra+K41PEzP54
 RluJzgqeWq8h0BSHwL+l0/uEY6k511QW/se1ScQ=
X-Google-Smtp-Source: ABdhPJy7a7Ne0v4q4AEIG4e7TRTRyIROhS0phm/+rD1dY9pUIJCcXadcDhjB/ixMMu7NcRS0NZ+3yYPztVui/apjKL8=
X-Received: by 2002:a05:6638:1b5:: with SMTP id
 b21mr11426605jaq.125.1596713468774; 
 Thu, 06 Aug 2020 04:31:08 -0700 (PDT)
MIME-Version: 1.0
References: <1596558782-3415-1-git-send-email-gene.chen.richtek@gmail.com>
 <1596558782-3415-11-git-send-email-gene.chen.richtek@gmail.com>
 <20200805161021.GK5556@sirena.org.uk>
In-Reply-To: <20200805161021.GK5556@sirena.org.uk>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Thu, 6 Aug 2020 11:30:56 +0800
Message-ID: <CAE+NS360iKLoGxiiz8NmQqCp2Uge98Eehe4g2sn_N0e-E3DgyQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] mfd: mt6360: Merge different sub-devices I2C
 read/write
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_073112_726039_1415FAB0 
X-CRM114-Status: GOOD (  10.42  )
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
Cc: Gene Chen <gene_chen@richtek.com>, rafael@kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

TWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPiDmlrwgMjAyMOW5tDjmnIg25pelIOmAseWb
myDkuIrljYgxMjoxMOWvq+mBk++8mgo+Cj4gT24gV2VkLCBBdWcgMDUsIDIwMjAgYXQgMTI6MzM6
MDJBTSArMDgwMCwgR2VuZSBDaGVuIHdyb3RlOgo+ID4gRnJvbTogR2VuZSBDaGVuIDxnZW5lX2No
ZW5AcmljaHRlay5jb20+Cj4gPgo+ID4gUmVtb3ZlIHVudXNlIHJlZ2lzdGVyIGRlZmluaXRpb24u
Cj4gPiBNZXJnZSBkaWZmZXJlbnQgc3ViLWRldmljZXMgSTJDIHJlYWQvd3JpdGUgZnVuY3Rpb25z
IGludG8gb25lIFJlZ21hcCwKPiA+IGJlY2F1c2UgUE1JQyBhbmQgTERPIHBhcnQgbmVlZCBDUkMg
Yml0cyBmb3IgYWNjZXNzIHByb3RlY3Rpb24uCj4KPiBJdCdzIG5vdCBjbGVhciB3aHkgdGhpcyBp
c24ndCBqdXN0IGRvbmUgaW4gdGhlIGRldmljZSByZWdtYXAsIHRoZXJlJ3MKPiBleGFjdGx5IG9u
ZSB1c2VyPwoKYmVjYXVzZSBJIHVzZSBvbmUgcmVnbWFwIHRvIGFjY2VzcyA0IEkyQyBkZXZpY2Vz
LApJIG5lZWQgY2hhbmdlIHRoZSByZWdtYXBfYnVzIHN0cnVjdCB0byBmaXQgSTJDIHJlYWQvd3Jp
dGUgd2l0aCBDUkMgYml0ClRoZXJlZm9yZSwgTUZEIHJldmlld2VyIHN1Z2dlc3RzIEkgY2FuIG1v
dmUgdGhlIHJlZ21hcCBhcGkgdG8gcmVnbWFwCmZvbGRlciBzdWNoIGFzIHJlZ21hcC1hYzk3LmMK
CklzIGl0IG9rYXkgdG8gYXBwbHkgdGhpcyBjaGFuZ2U/CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
