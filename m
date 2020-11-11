Return-Path: <SRS0=/0MH=ER=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D9BEC55ABD
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 16:47:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C60EA206FB
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 16:47:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YcKNOMQC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B/+8hOwV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C60EA206FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fZBxrxzSHpIiUELCvdY/t8h0sE1K++9e61NRN8VdDTA=; b=YcKNOMQC8ccwqKENnOB6+cTzb
	7cQsvbEGFNsaAJv8ZS+VcEODtfLRIvRbQgBLdigi6nREdmn5JzwKAkZME4PCPP7SY2SKCDnCeUvvm
	gdhJ2vKZsSFueqEpolSs1/jmimUM7N7soW+2RRG5y2tVQa3+vxVUiJFgQZ57gnAoWUrR50eawd24L
	RH+rOayjtyo2Y4vNjkTVzUWBDeUbFgDp10xeCOCXE+H852R/yPFHFgOyIhQGjX21o8NFoHK2EgVd4
	HtM8LfWZrTpDM/Qz9iF+wZK/zmgHabrXJBgkFkrAof5Lo1I3mCPyb4ZolaMp4MXcG/Uroy1xPDxKQ
	mB3hOZXFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kctHG-0000Rj-9y; Wed, 11 Nov 2020 16:47:22 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kctHC-0000PA-LB
 for linux-mediatek@lists.infradead.org; Wed, 11 Nov 2020 16:47:19 +0000
Received: by mail-wr1-x442.google.com with SMTP id r17so3196758wrw.1
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Nov 2020 08:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=iFsaSefHhmkCScyFYoknkXxLil5Qp2yw29m3QJALDc0=;
 b=B/+8hOwVHut4qAjEftspH+8vOftFemj7qMkkqsNfSt9PH1QrCUn7bFMuufqiEPYHvf
 CdmPz2mS5JPSwdBBTN3N+khMGnoAGP2AMLWxir+wYUZpoPc8LzHTAHww18QLMHCLtGYB
 WdS1kZXw1Wk0uKOLDhIKppmqhF3IRsIPWNzfTn9bLxl5JmBlg6Q7imM185QgomyT7bns
 goQSjXEEH8X/SURQO3CsKV8CgFklhDx6f8EPYOP2Wn8iCNBG0Nh+SLEoIZhcKXUsGWMQ
 Qy/b3ca3qV3J2XYHhKzCGO+yZLvq7xFp70cyUOg4Cn2HgU4qdJ00TQIkU9tKw04hBuju
 YPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=iFsaSefHhmkCScyFYoknkXxLil5Qp2yw29m3QJALDc0=;
 b=q6Ar8Ph24NmeYXL1WXm++5//IKwiTW3bI6jaQgJK5s1X5iV3Ey5WVpO+EcZxDzQgf/
 g5bGt68tefdypT7Ljc0y0ZPxteGM/+0k8WItIZFNYeQDInR7eNhFV/PLHmWOVNe2FRcW
 y+iXWlrwtIlkn/HhuieAk031nzYac+gwgQj/X23EH7eOmvmJIEm/PJDD6EsFpjYHopif
 5F4Z2rwYsnUcqxPPVnwUP20/gRHyL/hFM4+qqxLIKAtBYD2KR1HYFY/EvsCVcTyyVhlz
 ZOJou9LjbGQLxFIp4mKm+k9NLf77L0dOdS7H/trUQVvinfKsEt8hEXjY+m7QHKyYcPA1
 fsig==
X-Gm-Message-State: AOAM5323p2shhJEZh8H8p/EeRjiTThq3DGA5xlaXSFRqxV0KEqq/3ONh
 6ig2p7aigv5vT5SJ0qYjm1oKCw==
X-Google-Smtp-Source: ABdhPJzRnnvVYKTjowXa7ib7kM/imqHcA0TsWc1jxSxFSms9DDStsTD9noYghcLYEnaRaNhZGEfe7g==
X-Received: by 2002:adf:ffc3:: with SMTP id x3mr2959101wrs.32.1605113237207;
 Wed, 11 Nov 2020 08:47:17 -0800 (PST)
Received: from dell ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id s4sm3225443wro.10.2020.11.11.08.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 08:47:16 -0800 (PST)
Date: Wed, 11 Nov 2020 16:47:14 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v6 11/11] mfd: mt6360: Remove MT6360 regulator
 of_compatible attribute
Message-ID: <20201111164714.GR2063125@dell>
References: <1604656432-10215-1-git-send-email-gene.chen.richtek@gmail.com>
 <1604656432-10215-12-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604656432-10215-12-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_114718_898266_282F00F1 
X-CRM114-Status: GOOD (  14.56  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 sre@kernel.org, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAwNiBOb3YgMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgoKPiBGcm9tOiBHZW5lIENoZW4g
PGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiAKPiBSZW1vdmUgTVQ2MzYwIHJlZ3VsYXRvciBvZl9j
b21wYXRpYmxlIGF0dHJpYnV0ZSBiZWNhdXNlCj4gTUZEIGRldmljZSBzaG91bGQganVzdCBpbnN0
YW50aWF0ZSB0aGUgcGxhdGZvcm0gZGV2aWNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdlbmUgQ2hl
biA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL21mZC9tdDYzNjAtY29y
ZS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYyBiL2RyaXZlcnMv
bWZkL210NjM2MC1jb3JlLmMKPiBpbmRleCA0YmNmYTdmLi41MzlhYjQzIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMKPiArKysgYi9kcml2ZXJzL21mZC9tdDYzNjAtY29y
ZS5jCj4gQEAgLTM0MCw3ICszNDAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1mZF9jZWxsIG10
NjM2MF9kZXZzW10gPSB7Cj4gIAlPRl9NRkRfQ0VMTCgibXQ2MzYwLWxlZCIsIG10NjM2MF9sZWRf
cmVzb3VyY2VzLAo+ICAJCSAgICBOVUxMLCAwLCAwLCAibWVkaWF0ZWssbXQ2MzYwLWxlZCIpLAo+
ICAJT0ZfTUZEX0NFTEwoIm10NjM2MC1yZWd1bGF0b3IiLCBtdDYzNjBfcmVndWxhdG9yX3Jlc291
cmNlcywKPiAtCQkgICAgTlVMTCwgMCwgMCwgIm1lZGlhdGVrLG10NjM2MC1yZWd1bGF0b3IiKSwK
PiArCQkgICAgTlVMTCwgMCwgMCwgTlVMTCksCgpJZiB5b3UncmUgbm8gbG9uZ2VyIHByb3ZpZGlu
ZyBhbiBPRiBjb21wYXRpYmxlLCB5b3Ugc2hvdWxkIHVzZSBvbmUgb2YKdGhlIHNpbXBlciBoZWxw
ZXJzLgoKPiAgCU9GX01GRF9DRUxMKCJtdDYzNjAtdGNwYyIsIE5VTEwsCj4gIAkJICAgIE5VTEws
IDAsIDAsICJtZWRpYXRlayxtdDYzNjAtdGNwYyIpLAo+ICB9OwoKLS0gCkxlZSBKb25lcyBb5p2O
55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJv
Lm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86
IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
