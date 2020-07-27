Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	BODY_QUOTE_MALF_MSGID,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE7FC433EA
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 12:24:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A06D32075A
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 12:24:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RCUyt6WK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nUrbMSi3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A06D32075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Oby2dBFpEYUmgzDka/de042B2BQA6CZKloKqHmSvS6k=; b=RCUyt6WKnGqEEaqlgNxXao1dR
	cmMtTAWpAGifazQLIZ3fdcWGdwyzqN0GEfzHaoXTQS3AgZk6qIvIrFWYNWcV+smjO+xnLEbLliJ7v
	lsEnZ+8hiPIm0YzS8oZcCSjZzOos0HyfPIhb29PR1I3cs9XheDC7SP0NGeZ2oFA/Et9CoBhQZx56M
	WUbziQFAuocoS6mPcKocbPIr3gXBkQ2/+b3kD2+OLHh209zTUOpktgrghNGamevtHHmkXIM0Oy58f
	JzWqLSNL7NbPFssmDbieE5xR+wK7ei1cWSfn9lU26YdRajOEV2tQ9oSq6dIGZqN6jytRgsunm3mqG
	RwQea/ZBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k02Ah-0004y7-Dy; Mon, 27 Jul 2020 12:23:59 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k02Ae-0004wc-Jo
 for linux-mediatek@lists.infradead.org; Mon, 27 Jul 2020 12:23:57 +0000
Received: by mail-wm1-x343.google.com with SMTP id 9so13969755wmj.5
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2020 05:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=nW+s+24CRruE/ETffG6i/goItz6RdfmROI5j5D2mpGI=;
 b=nUrbMSi32qTnlizWj2ed73CYqqL2UEIRJSfBhC4w27rQzgnIReWP0XOPaUNo+JWctz
 frlCiEsSZmA2hyZQ5HpVKCFnGZYl+lPl+Qx0BHIt+hQUzMtodGL/o7JeXl/UC7JKezPc
 txWueak5g8ZwzNABvcTREcfAoueC4TLeZUkyJ/U5FWeFkgPObCSuBXpefp2nb2eCAJef
 JjpYq3U+0UgHR6+LG8Flnx/xpdsiiSRYBtJltNr8aCS18xBcVE3tqe0LauWTA6dr9VEN
 C/O2aLSvawlGtMe3krHLPZQs+44hcJx4tHK9HYD+NrPS0d43pTUJlA6NYD7Mia8Pbh5h
 ZGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nW+s+24CRruE/ETffG6i/goItz6RdfmROI5j5D2mpGI=;
 b=FAucsf/kpnsjc2aMtLgp7OBsgNF7F+nHfMsAQfopnSUZB+cY/IeZKBr/fNVx0I9hXh
 hpKyaC+iGdn9xp7R0Bgz4hVzL8Mvo7Uug5am1YGjMpQpSceveYklEmISxVonCl0Qfrpc
 TOUUpwfdjbmwkUZ3IRdFyphOAB5uYd9gjzjLYqGpWFH5C0psXI9EAU8IpMEfItBzdgBS
 E5YFCWhhY9jlBp+FfKVhe+fHsz5zwGr0FeTmk1+r7g1lS0TA2gE4ncQIn0RB6doojWqq
 iCQqpJ3cXcTZGw7y4LCGM7AANloLVVahHy+6AHfAYVpEY4FHOMUORnAar6oC93VVZUS5
 ISCA==
X-Gm-Message-State: AOAM531yjEW45SuZIntbqacUqoIKwN8Lj9WSfTC5CDi8Hb3i9S7/mPAa
 QQznzUxIv0siOiVx4s/t4c49VQ==
X-Google-Smtp-Source: ABdhPJyTzJWxSGenCrXIkNyl8yCaqkpB/ibu0t6p38KrhUVRO3DjN06ogmK5+zlRlA9Ho1syWq7VUA==
X-Received: by 2002:a1c:7313:: with SMTP id d19mr19092272wmb.147.1595852635575; 
 Mon, 27 Jul 2020 05:23:55 -0700 (PDT)
Received: from dell ([2.27.167.73])
 by smtp.gmail.com with ESMTPSA id o30sm12516196wra.67.2020.07.27.05.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 05:23:54 -0700 (PDT)
Date: Mon, 27 Jul 2020 13:23:53 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v2 7/9] mfd: mt6360: Remove handle_post_irq callback
 function
Message-ID: <20200727122353.GN1850026@dell>
References: <1594983811-25908-1-git-send-email-gene.chen.richtek@gmail.com>
 <1594983811-25908-8-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1594983811-25908-8-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_082356_714526_EAF89E1B 
X-CRM114-Status: GOOD (  10.53  )
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
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxNyBKdWwgMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgoKPiBGcm9tOiBHZW5lIENoZW4g
PGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiAKPiBSZW1vdmUgaGFuZGxlX3Bvc3RfaXJxIHdoaWNo
IGlzIHVzZWQgdG8gcmV0cmlnZ2VyIGlycS4KCnMvaXJxL0lSUS8KCj4gU2V0IGlycSBsZXZlbCBs
b3cgdHJpZ2dlciBpbiBkdHNpIHRvIGtlZXAgaXJxIGFsd2F5cyBiZSBoYW5kbGVkLgoKcy9pcnEv
SVJRL2cKCnMvZHRzaS9EZXZpY2UgVHJlZS8KCj4gU2lnbmVkLW9mZi1ieTogR2VuZSBDaGVuIDxn
ZW5lX2NoZW5AcmljaHRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMg
IHwgMTYgKysrLS0tLS0tLS0tLS0tLQo+ICBpbmNsdWRlL2xpbnV4L21mZC9tdDYzNjAuaCB8ICAy
ICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkK
Ck9uY2UgdGhlIGFib3ZlIGlzIGZpeGVkLCBwbGVhc2UgYXBwbHkgbXk6CgpGb3IgbXkgb3duIHJl
ZmVyZW5jZSAoYXBwbHkgdGhpcyBhcy1pcyB0byB5b3VyIHNpZ24tb2ZmIGJsb2NrKToKCiAgQWNr
ZWQtZm9yLU1GRC1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCi0tIApMZWUg
Sm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZp
Y2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xs
b3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
