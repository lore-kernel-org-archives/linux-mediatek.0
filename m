Return-Path: <SRS0=KJBd=AM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBBEC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 08:29:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD2B92077D
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 08:29:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SkLcSriV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A3Ofc3mz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD2B92077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qAA/Ks3O0x1N/wZEKaBsQS5fALxy0YViu5B33OGBeBs=; b=SkLcSriVcSni/FPyJ662re9An
	XYRbK5RoSvbAbJTAZZtcPYRpWYdlBNjYRVanj5SNFtQOhPGgtJxPaJhntyEb+7+hEZWU6/01e40Jv
	RDvwo3UKkmae7Jm6MTVIS879QvNksvZP7ZEimlNnJlJQOGF6oxYoMyc3h/M6w17B5ibbIKllc4NTu
	wa7ziiocOMcyeWfQHhUY15Ov3wL7skWs1QG88+Uk04h/lAPmMWN0Ce22e0XyaB424G9IHfYBHCYVl
	TCN5wN8Vxp4fh67vj/hrnGobiEBbsrbT9CWRAR8s0bQNXyK4cqX1RWemIC3Gx1nEV1YRqOO6AsKGD
	Y1ipf6u6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqY7w-0000M9-J7; Wed, 01 Jul 2020 08:29:56 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqWyo-0001cD-1d
 for linux-mediatek@lists.infradead.org; Wed, 01 Jul 2020 07:16:30 +0000
Received: by mail-wm1-x341.google.com with SMTP id l17so21271374wmj.0
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Jul 2020 00:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=IGhhk32SvHiFdB0hZEKj8zNTTDQsZ1TsfgdXo8+49ys=;
 b=A3Ofc3mzIf50ua0wXQbeXXTcFuIzOZwfEOsrrtzKlW0px5KeRaL13sgueXXuzVj8OK
 3o2jJL///kb2aDttgf81Lu5R+QJP76q1sm1EASEhQ2C3OC/8qOoGb2qSIe1QN0Cwxgho
 oWvaeHGQ2aBLqdd6z2sWCYHj+tsbfiP3M3IsJxr6veM4O4BIoxJaqYuBwnIzEJzDLRBM
 mjawO8dSakI9nRS3X84xCHkOgn9O/7RyEcva+qZ0e2ebh954QSVE5Cq4m+trVh3QKFpW
 WicGjQsGCgEtYnmillibWxYqbPY/Nfndq9XXrzonyyyGmClHjWbpGPvcm0ZEdTqA2Vos
 /n1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IGhhk32SvHiFdB0hZEKj8zNTTDQsZ1TsfgdXo8+49ys=;
 b=dB0K4D17G23LbVZYks1JBFjMFj9zzLhvC2qKjPqxSBDm2mGzE6IoHZMbH0Un4uyxzw
 /pUBFD0iQTRRJTm7d0SHzFkGleXdjbkBr/54dMLa32G9kNAwVAocjIfaj82kWBd4UKxQ
 dHAsaWoF0ZuwP2rkeKm1FjTILtSC1gb90iQK7uX8sDJvi+Kt7ceN4BefSQL2TGSHxay+
 uSqlVguMDKCRo/33c8LUloXWv0nYNTntUu7m2HoJc8s2p+fgjJwHeYRnpRZNaYkqWv3Y
 8OyyyWl40Yau/ubZlvbpW1qjAD7yD4RhVoU3W5n0ySgw2272XebUzq4EKSHUPIDNQyis
 5PUQ==
X-Gm-Message-State: AOAM531G4sqRVp9tGqlA6oSaC3NL32jji4u4cfHeAc+Iw0i4A9v8rtl1
 rPM65CmmE6bW+q6v79HDfa01wg==
X-Google-Smtp-Source: ABdhPJyf/QJmTPtaPrKrIWWP1HO2uuxJnD19rp3j2PuXJ9f9qdns0XDOvWyRa78gSLklXHnc7IaRug==
X-Received: by 2002:a1c:9d0c:: with SMTP id g12mr18744257wme.107.1593587783414; 
 Wed, 01 Jul 2020 00:16:23 -0700 (PDT)
Received: from dell ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id n14sm6508639wro.81.2020.07.01.00.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 00:16:22 -0700 (PDT)
Date: Wed, 1 Jul 2020 08:16:20 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v2 2/4] mfd: mt6360: implement i2c R/W with CRC
Message-ID: <20200701071620.GQ1179328@dell>
References: <1592567631-20363-1-git-send-email-gene.chen.richtek@gmail.com>
 <1592567631-20363-3-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1592567631-20363-3-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_031627_436321_F7DC198E 
X-CRM114-Status: GOOD (  10.88  )
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
Cc: linux-arm-kernel@lists.infradead.org, gene_chen@richtek.com,
 lars@metafoo.de, pmeerw@pmeerw.net, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, knaack.h@gmx.de,
 matthias.bgg@gmail.com, shufan_lee@richtek.com, jic23@kernel.org,
 dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxOSBKdW4gMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgoKPiBGcm9tOiBHZW5lIENoZW4g
PGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiAKPiBpbWxlbWVudCBpMmMgUi9XIHdpdGggQ1JDIHdo
ZW4gYWNjZXNzIHN1Yi1kZXZpY2UgUE1JQyBhbmQgTERPIHBhcnQKClBsZWFzZSB1c2UgcHJvcGVy
IGdyYW1tYXIsIGluY2x1ZGluZyBjYXBpdGFsIGxldHRlcnMgYXQgdGhlIHN0YXJ0IG9mCnRoZSBz
ZW50ZW5jZSBhbmQgZm9yIGFiYnJldmlhdGlvbnMgc3VjaCBhcyAiSTJDIiBhbmQgZnVsbCBzdG9w
cy4KCkFsc28gdGhpcyBkb2Vzbid0IG1ha2Ugc2Vuc2UgdG8gbWUuICBQbGVhc2UgZWxhYm9yYXRl
LgoKPiBTaWduZWQtb2ZmLWJ5OiBHZW5lIENoZW4gPGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9tZmQvS2NvbmZpZyAgICAgICAgfCAgIDEgKwo+ICBkcml2ZXJzL21mZC9t
dDYzNjAtY29yZS5jICB8IDU0MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0KClRoaXMgcGF0Y2ggaXMgZG9pbmcgd2F5IHRvbyBtdWNoIHdhY2t5IHN0dWZmIGFs
bCBhdCBvbmNlLCBtYWtpbmcgaXQKdmVyeSBkaWZmaWN1bHQgdG8gcmV2aWV3LiAgUGxlYXNlIGJy
ZWFrIGl0IHVwIGludG8gZnVuY3Rpb25hbCBwaWVjZXMKYW5kIHN1Ym1pdCBhcyBzZXBhcmF0ZSBs
b2dpY2FsIHBhdGNoZXMgKGluIGEgc2V0IG9mIGNvdXJzZSkuCgo+ICBpbmNsdWRlL2xpbnV4L21m
ZC9tdDYzNjAuaCB8IDI0MCAtLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAzIGZpbGVzIGNoYW5nZWQs
IDM1NyBpbnNlcnRpb25zKCspLCA0MjUgZGVsZXRpb25zKC0pCj4gIGRlbGV0ZSBtb2RlIDEwMDY0
NCBpbmNsdWRlL2xpbnV4L21mZC9tdDYzNjAuaAoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpT
ZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIg
T3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29r
IHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsK
