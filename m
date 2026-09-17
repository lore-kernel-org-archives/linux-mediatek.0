Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63078C982D2
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2026 16:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0dTGZsVCSr6ANtWetAbHE4IIsX02FpxvKoMT01AVXUs=; b=J+ez8/UwaT0rwdxi32zpORLzgW
	+T10VBUkTp+R/7vReZSfY6Fx3RnfWhqFQtyIBVurLquflDn8LPwkfbi7drgAXwFYsFV5Ct8zlsD7z
	f+glDeJxyRSC73y1hZc0tvaCX7pOCys4xUBEkakZrofh6mVOc2eUo7O0wUQr/nSlM0yX9yQpsy1R+
	9d6kEElAq3w1geJUi5AhrniWwVmauHWhFH+BygVOdetJcEakya9VcaqKCMM7ikykoRKemWSZ4hU3n
	cRNetG4c/SpztbNHsL33B7MWb1/mjGjNsjYvHRkUeH8y9wGHgo2OpnBybL9zs9HeWpNgpcAlmTgkt
	A8KEJYlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FLB-0000000C084-2KCo;
	Thu, 17 Sep 2026 16:52:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FL9-0000000C078-2YuJ
	for linux-mediatek@bombadil.infradead.org;
	Thu, 17 Sep 2026 16:52:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0dTGZsVCSr6ANtWetAbHE4IIsX02FpxvKoMT01AVXUs=; b=hKitj6nMQRERWucQLF9fWs3KYT
	3hWWINbE0ZFOZrM33vokiEOwwO7/iXb6da4D5+JVAN3ZD5CsKv4u+nknjnh9BpuJDoZjpql18XkSS
	ayirhnoT9QT1ylL0FG8h987BVA6TOSAsfMunLSCYb/XEDTp9AdJJeCvm/QM8xLgFT8fsMFZikxxfp
	1h7zEIbQK0gNoE0b0NXGkEDEaV1H8cvpNHYjKzEt+t+pOESO28Y8xI9F2i7azNVikY5PSMm32bd6k
	Xnm8+BYiWQp+W+AzaATd4l6w3mVYSGcFiRK7I/6JoZJrRmxxwTDFtcFpoPWb0yjguwV634DijRAnG
	6Y1WbhMA==;
Received: from mail-ed2-x0f.google.com ([2a00:1450:4864:33::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7FL6-000000094c3-2cIx
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Sep 2026 16:52:02 +0000
Received: by mail-ed2-x0f.google.com with SMTP id 4fb4d7f45d1cf-6aa053900f5so1900831a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Sep 2026 09:51:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789663918; cv=none;
        d=google.com; s=arc-20260327;
        b=JhRuf8JQ1ZQUef8CLeyXbSu12TfKryYCeTGStV5yXFUDvyn2V3ohPM2JCqFwHAi9gu
         fEtXZa6UtkojaoES/xK+IFtcuauX1kuJ8ktJoN2HcfuOuVCJbgALve93ZAR9fPxqhVSS
         2/0T3nPz/e1XHSXeasNGFFYHbmbJhu613k/YPR+57F/92XvzAmCMJ95OcyLrbBBVhrkS
         C+F2eXqsJ+8PX5aBsy5/WBrhqBTCmi7twyJxeqjLYjOTKjp0KS/mrLvqlcEcC2bjCmnH
         RgWwb0UBGhepFhgoqTHjF6dbVcXRD266TnROb8sBfEO+iXaemEAiKE/hE8+NhEdvw7wU
         VuNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0dTGZsVCSr6ANtWetAbHE4IIsX02FpxvKoMT01AVXUs=;
        fh=9HXO+7xWpswAGpZIRti7KtB9KWIDyMtx+LGoTtLacOQ=;
        b=EmYOoOsfazoWqc6yywJhZ8iV88tX8sd+o8FhzjjKj4Lt2CP5ae/OO8o5PPeOcZbRfD
         FT/3Nj93k/WZH7Z5gwW57Ma38LshXPzLDtmKB2ReD7Zv+VoEtBX/U/cMJte7yHuqAump
         UbykpupxJyAQX+tX2vcwQCKKlvETERgDsxM/dxEUeTidjBnZYiVkZRVUfU4H4eJ72je2
         1yFNI6fDTMG4mjbx6pTDbbwkQKL/IlWxsWcQeHJISyFVQE/wxPff5c8H/EajQo49TZNC
         YiCQVKJB6J+xFUzq78wYJE8eI894XGJg9TIbWDCQTUbR0MLOzhXefzLL9dIb/SlrQSTk
         HfoA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789663918; x=1790268718; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0dTGZsVCSr6ANtWetAbHE4IIsX02FpxvKoMT01AVXUs=;
        b=T5NHSSY7l6N49Mhkw7l6l2HjwJblI+KHdhpd0CKamUcYuUOel40ynF3Xi0JELmOyMg
         wdJTrJDUCNCWycSVUDZREk2XCMd1SvC7yLkKLukX8oiecX+hZvtJNOKnT3Y4l3ka7Y3T
         GUchpwnC1looowb75FLw9kWE/d5mJGM+Z6y9l06Ut68aVrdSdgTBE1w4Sf8MCQZL2D8g
         X/hiWDfyEIVuIGOSMJflucVhoVyGfnjcXUhIOHC1q2hlUs0fYMm+lcSDFJD+bznSA0Ok
         1w/cIJ1h8lNknj9qiwiARZjimuVD2GHaIGeVpVQgqas3Gh4QNMttxnv/QYop1SCZEdnd
         NCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789663918; x=1790268718;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0dTGZsVCSr6ANtWetAbHE4IIsX02FpxvKoMT01AVXUs=;
        b=U20tMJaGXT1pvX1XrtZI7zz+Hdy2Cy3jSMSdaEYK815iLPUxpMuSfFX3cYPLSBHjB5
         /1fpBd4fASvXnf9cT2OdQuD7PC21dR/nKXZzngFG+XD426RoU5FFagjtSlniQ+tSLSU5
         TANc8c7Yo5c9WHJ0ZQ7E3ydRw+zPazpfVybv0bYM1nodx5AHJz09XFo51oEeAUFDdM7z
         fo+ogJMgUjZZ6O/XfpSDTAMJnFw6MScsxSIg0ktBONlY8nA/WXBJdUYXSohwqN5spC3I
         DMd/2cEga6gE9xrDHJe+84PtXfB91BmqJqFkIjWBR5l5zme4G3nda88oZI2ur6tBwPyO
         UHkw==
X-Gm-Message-State: AFuF++k1W18tVef4yvNV8nela//zMRZxQNMfoLj9hAK18gb+4Akl4TBK
	xbAPzco2s1g/DM9OH0q7O2CwORp9pV7RkK1vjnHySK/RzHVcTQN8vpGXcKmioH/QYehI0lSaqB6
	FwNXwMcOqS+wI34NNvdCSh0uJp7Ln6fc=
X-Gm-Gg: AYBFou2nW13w4mHGUznW6T/QydIfk9wl0XjCSTzUL7LVvMSqUve4lL1tGI35OlbqVt4
	Z4i468IxJvsZ6zetnL0lLkCG52yJHratyLJ/1dSfhtiuvURTcTpBlnYVdkAleU52MBB36HEGmvq
	xZ5PKLW2OpRvM6ylz4r8OwC2tT50DbnY/oqh2eR1Xb3/0y2JkvfRh2Z/UTRJkgsvQBwYvmO6X2u
	0ZEz+xjm84i8Dy4Sfku6YisgEJo3XfUFGtix2+rozOLkZ+HOzG4wyCVaVflAnG2E0QnDVuhukw6
	yTMgRsCsj0UwlmMfzXA7UPDmsopZ2tpPNM4gzjuDwuv2NGcFenG8xpQ=
X-Received: by 2002:a05:6402:3789:b0:6a9:98de:6d8d with SMTP id
 4fb4d7f45d1cf-6aa2245fd0fmr5568315a12.45.1789663918221; Thu, 17 Sep 2026
 09:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260902193351.185771-1-l.scorcia@gmail.com> <20260917143459.GA2348773@google.com>
In-Reply-To: <20260917143459.GA2348773@google.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 17 Sep 2026 18:51:47 +0200
X-Gm-Features: AcwNN1UCLyUlHms-nbsVMpe5KcLakQ0vi0ozu7P9tcFuOM-WKvxcQ6ubbojqdxA
Message-ID: <CAORyz2+rT-oNJtWc5BRDrpUjBPVbO6A=qrX_K+J7fAR5Ebm_3Q@mail.gmail.com>
Subject: Re: [PATCH v10 0/9] Add support for MT6392 PMIC
To: Lee Jones <lee@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Julien Massot <julien.massot@collabora.com>, 
	Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_175200_719470_D807D8F6 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Still waiting on Acks by the looks of things?

Unfortunately yes. Patch 4/9 [1] was suggested by you in [2] and it's
independent from the rest of the series; it could be merged without
introducing functional changes, but I don't know if you can provide
the Ack for it or if a specific maintainer has to provide that.

[1] https://lore.kernel.org/linux-mediatek/20260902193351.185771-5-l.scorcia@gmail.com/
[2] https://lore.kernel.org/linux-mediatek/20260520150014.GF2767592@google.com/

Thank you
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

