Return-Path: <SRS0=N2rV=IA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBEEEC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Mar 2021 06:08:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E4C161601
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Mar 2021 06:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E4C161601
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gP1qid7YFerNxiNvU7jDMFP2siafrTDypzNU3pDfpAo=; b=lvlJHzteTmKgMdr/eW9SdZW1v
	iAOq18s3Y0u8IOKU3FBSom8lFEzJiZEqAII+0fkf4q6jM/ckZwAs149kSpQoLKCJ0rcDQVN7f8WVI
	MXsfeeCZI0rQ2G8ZI8IYrRkep73w4o1oulf1dJiCXJL8t+kAdPMeGwzSOsbA8eB43HVIuW8Lh+Uk8
	hTNpKGpY43L2quhgBqpxQTqDFf5UY37IhDVEQC/jfnlCUHK74WjNum0jeSiX1rTnOA+kMnI1NxdCr
	EF/IHkZ/4FR21rtbGajvMFuFuA/oWxk9bLglkPegQRs2hYKrmf+9Jfejh7bMnLc35H6ifwyOOxNTY
	P3UqmPCVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGyCw-0000fO-CD; Tue, 02 Mar 2021 06:08:34 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGyCs-0000el-US; Tue, 02 Mar 2021 06:08:32 +0000
Received: by mail-oi1-x22f.google.com with SMTP id o3so20864035oic.8;
 Mon, 01 Mar 2021 22:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=C19cOmvXJnbprBsxYo6fNevVqPz+le4Pn/VUf3uem0I=;
 b=Kf8td8+mDqzkq/7SM8w4qjPMc1KK311qIsXMdPIYdmOMgBC8UQY7XzByFqs70585hC
 iowVQmK4mlLCr2eXf5FvDUk+calrVOUsmVzUvIGfZolYMfqRS2VW0oDTqaK7fG9hjGM8
 hFwPoYRycK0XVZN76fiHHmuuN/ZUfqMrWzHYl/oVOCRY1gOeqBx2IfO2PeB4sT6T/kS3
 7eK27CO4mOLC0OAXXX6slJLssqTlr3MulWeYxeQVfmr97lDC4Hxwcpvdlj1SUYRvz8jH
 4wOoD091V6jKlkiTd9y82rxmHlT75iepJZIf0ZSJc3UYJ88H4pHdzC/l0+VcjYZwAVz0
 sxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=C19cOmvXJnbprBsxYo6fNevVqPz+le4Pn/VUf3uem0I=;
 b=kp0f4L5oWvFDgz72SSqdfMJAbDCBp2Uwh13ucS6dfWFN8rn7kwBTN9/RK1VRsr0YId
 3AAb+ERuymAmx0+7vOhyO9rZGYDrYPWHzIbPe3CDV61mZXLEqasLZzit8cRVEG6AiGUg
 ZjdZr8Mu1HLsqDn3PMHHLIrRgIOGB4RwMnqnMIC7gHUXsJG4uBoFUfjnrW+UCMghhEO1
 eOClkYZtQ1kaVa2BPDwDPG1vWi7xzManseiJn+dg0Tbi/G8dlQ+ITSy2Ww4lbUNGmv7n
 IxTS1ZPFUO4vmocmSHQjuoa3pdUC5DgyDu++bCj6HO6AeMYEglvkKysHZ6h8h5+dkrwW
 gRdw==
X-Gm-Message-State: AOAM530n6dFYqDLOrCCaotv+AdBPQNbgYB7ajvWL7FlrdjPPuKsfDDKN
 Qcj91uRukpnbrAiGYPKmnnGtIAXCa/SbQBD2MYw=
X-Google-Smtp-Source: ABdhPJy8wziwmYMPu/9/w+eXOxWojzCtW8JGO//mmOEQX/Ss1bf0j5WQzo4DDP/cRs89vYzM7K15EQqJuFgdnHDH40E=
X-Received: by 2002:aca:4d55:: with SMTP id a82mr2086651oib.23.1614665307388; 
 Mon, 01 Mar 2021 22:08:27 -0800 (PST)
MIME-Version: 1.0
References: <1608547554-6602-1-git-send-email-gene.chen.richtek@gmail.com>
 <1608547554-6602-4-git-send-email-gene.chen.richtek@gmail.com>
 <20210219104724.GC19207@duo.ucw.cz>
In-Reply-To: <20210219104724.GC19207@duo.ucw.cz>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Tue, 2 Mar 2021 14:08:18 +0800
Message-ID: <CAE+NS36NvH-s_UOR8RUZA_gd+FUZ5oLqb=n0s41dSMYWDn9DnA@mail.gmail.com>
Subject: Re: [PATCH v13 3/5] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT
 definitions
To: Pavel Machek <pavel@ucw.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_010831_088925_5135518D 
X-CRM114-Status: GOOD (  10.57  )
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
 devicetree <devicetree@vger.kernel.org>, ChiYuan Huang <cy_huang@richtek.com>,
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

UGF2ZWwgTWFjaGVrIDxwYXZlbEB1Y3cuY3o+IOaWvCAyMDIx5bm0MuaciDE55pelIOmAseS6lCDk
uIvljYg2OjQ35a+r6YGT77yaCj4KPiBIaSEKPgo+ID4gRnJvbTogR2VuZSBDaGVuIDxnZW5lX2No
ZW5AcmljaHRlay5jb20+Cj4gPgo+ID4gQWRkIExFRF9GVU5DVElPTl9NT09OTElHSFQgZGVmaW5p
dGlvbnMKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHZW5lIENoZW4gPGdlbmVfY2hlbkByaWNodGVr
LmNvbT4KPiA+IEFja2VkLWJ5OiBKYWNlayBBbmFzemV3c2tpIDxqYWNlay5hbmFzemV3c2tpQGdt
YWlsLmNvbT4KPiA+IEFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+Cj4g
Tm8sIHNvcnJ5LCBJIGRvbid0IGJlbGlldmUgd2UgbmVlZCBhbm90aGVyIGRlZmluZSBmb3IgZmxh
c2gvdG9yY2guCj4KCkFzIHByZXZpb3VzIGRpc2N1c3MsCj4gV2UgdXNlIHRlcm0gIk1vb25saWdo
dCIgYXMgcmVmZXJlbmNlIHNheXMKPiAiV2hlbiB5b3UgYXJlIHRyeWluZyB0byBpbWl0YXRlIG1v
b25saWdodCB5b3UgbmVlZCB0byB1c2UgbG93IHZvbHRhZ2UsCj4gc29mdGVyIGxpZ2h0aW5nLiBZ
b3UgZG9u4oCZdCB3YW50IHNvbWV0aGluZyB0aGF04oCZcyB0b28gYnJpZ2h0Igo+IHdoaWNoIGlz
IGZvY3VzIG9uIGJyaWdodG5lc3MgaW5zdGVhZCBvZiBjb2xvci4KCklmIGFueSBjb25jZXJuIGFi
b3V0IHRoaXMgY2hhbmdlLCBtYXliZSB3ZSB1c2UgTEVEX0ZVTkNUSU9OX0lORElDQVRPUiBpbnN0
ZWFkPwoocmVmczogaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjAvMTEvMjQvMTI2NykKCgo+IEJl
c3QgcmVnYXJkcywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgUGF2ZWwKPiAtLQo+IGh0dHA6Ly93d3cubGl2ZWpvdXJuYWwu
Y29tL35wYXZlbG1hY2hlawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
