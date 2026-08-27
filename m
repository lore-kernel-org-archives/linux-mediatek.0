Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3920C61DC4
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2026 14:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNAVc3KEaJO754MBwf1BXCQjtokctPSDVwjt06/SloY=; b=tBXGekSXrBNPTwiOTCdOyLuJ6D
	seXx7XvNjMABS9mCRp+dhSx5T5yfRN5jzMFoXoF6pRAZ/7PgZuuwR7VMUpIpf8dG6AEQ3qfefs1Ot
	DhK5BSKqYvgYG/A5jfNXlbXT95+nNx1DUAM9cdaUiLEdDXWhc/78SVrsI5Q0ftFc/+mPrzQuNxc2p
	fNcRXLJMpAESAZvCpU7lR0ZwukzkoMjwvPUlNH2POwQpHAXewIVeP/PaTOu29p0P/kV2XEg35LkIE
	a0BT96iuWFNlct75dwLioyK535cHUQsjbtGAzt4aT8+k3ySXxyEc8kg8aJKjnmLKsUmFniPw5pUnH
	F+DrjVOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzbSH-00000004CSq-2Lr3;
	Thu, 27 Aug 2026 14:51:49 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzbSF-00000004CRw-0mv7
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Aug 2026 14:51:48 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c252c7270faso282913266b.3
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2026 07:51:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787842305; cv=none;
        d=google.com; s=arc-20260327;
        b=pT/Dk3+mE5WqIMfRDZXpbH1zTTOB6cCqHX6+TFNTVHpB7oFFH3rxY2p7O7BsYCkwy5
         iYe7zgeofoLDcWEnRnQkX0GVYoXhcMsdC5TlIk/Nhk85SbDesJGhcr6eX+FTSC9G8vmb
         h48LGQt0MpjV1Y+xsfTItr8dBMWFPF+jm1qwm+0n5NBWApX275Qsi/U1byXgBEtkacoD
         NZFZdFq6QS7C8tT1w1PE8/RXlArkZVdXceKEP62tKtTtKx2pMrxyKZZ7zmfnLI872NEh
         CBbkasUcBSepeSiyyldhzoHaR4/JickPAo+AUAUmSV8mxKuwL5E2DDMuUeJ+ydk/+sQC
         cSMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rNAVc3KEaJO754MBwf1BXCQjtokctPSDVwjt06/SloY=;
        fh=FGCOzqW4oK7K8xS5EwKwlW8qFzyVhVsDXrbSpirq1u0=;
        b=mMJEIYcJ5HE+ZwHg70/KSrYbT5eufWo5HuYwtDLGVxYpl0FJ+xKCvex4mcfGQ4Xe+p
         rNawsEPXkzhzUidqV3BufrtBf/N6qji1MSMsOorQ10AuN3Ac4r0bT4DpYBoTTdbjup0L
         74YHBdMOIC1K4OkqAhasCr8Z6HGE2b2OG8uX9KCYss+jAGgJdKbx5PKHoMuVdtFQixdY
         xubhjsu7dC5JljYLppE5UGuew+lftxAwP1fOrhHT7T+PGEsGN3Gc8tJHBvZOnJrfm/no
         gbemK0fZ5tALF87H1uxbU5lYG+O79BI/OXGbp/V3WA9Zt3/Ixh46D+v68nChQrSBY1YX
         la1w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787842305; x=1788447105; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNAVc3KEaJO754MBwf1BXCQjtokctPSDVwjt06/SloY=;
        b=ilBFR/qZrmFDotl/8/zOjgV2AHAYCIBpLYxEoD20h9vD+hL/m4oSYTvH9WhbVPMgFV
         KbAN2CK4FCoaKVJSQR1G0ttjRDTD8a1dqrKFo8evv6ywJFXi80mfFdK9jb2AAmGj8yM7
         OZIRMWKlMPncSx/mb1feT/r6lo5xEXYcYzqQNJLoW7s4iPbCIOrEGGlA8RPHYXvDkQhv
         Ofq1LFz1CcOcmWBK/exVKkx8+xJLVrkqK1FELSTQnxQ0fxe+9OFofrSoa+AkSTlPTK0F
         FxSXrKjERqHoQOCQ4e23vWlGzHUM/ZyA1FXke2d1GVe3WEPumE50FXSC62TPb0JnGc5i
         aBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842305; x=1788447105;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rNAVc3KEaJO754MBwf1BXCQjtokctPSDVwjt06/SloY=;
        b=Y8o8CERmqPvHXMjKh+Sn7d1uCyOD3+e8rKt5hAdYrh/39nGmqXZmg/NhF9p7GZMW9u
         hP4w5PpmYSGsUbpySej5/pbGadLStgWbwyjpT4NAz5vEJG4ZS4DCJXCgL+hpUHqwgn7d
         +k9Kg4tvONxBufuOUkPJaFo1Y4+lRN0OM/VCNRXsoLBFoaBIylivc2Y6v7bcRPiB/LuK
         O1GXv2cNtXd0wS14cI35xjxpT36YZSHSBOyPqRCBnsasYqh+Cs/8nf+7t7E/k015Qlto
         ZjUj99YZ2bwW5OR+St/M60k2y9XeOZEJl1vxjYK98Un5uMZ3bANKZQjO9ZqScoFa42e5
         uxhA==
X-Gm-Message-State: AFuF++m6KJvslbZG2e349DkoML2q6QwIgznxEwnrcdzypY2EqiSpOUhn
	1UeXbac+wWg+7u/ly3kjwVSUyQx1PSBQctzs1XtbxWpWFGFSrU+wHf//j7WZ9P8XWhW+5NZgNnW
	d2xFXTAHr3yjwCXJcoGi9Lrj7b8D982Y=
X-Gm-Gg: AR+sD11CjY4Zv0kdU/IoUu3QKmieMxFyTsncVjdwaJuQ8MHHb7EI2LqaCGG9AX2g4ks
	kR+mB13RlYdAJ9tTEW/cxFwuTYJSXO9aBuiVQNBXDy9VNCSrBOJk1Lhx5nfjI0asdWPBQVNsL6B
	NZ6ezTl/docbmgkOgkUrGkMWQivKKwMfZB3oOG72WDodJQP7T+8OmbRj5GtEJFcuayvuTNezMtf
	RN8FJSoz+2ZpDv4fFlxFzYywDyPLntoJKcR6buZgGsM0ru6uanxBftcCCaX5zbJzcpQAsNDmnkM
	T8wz5mgaUMIvTepOSGRHTfeaUoGQTzhKjwlxsfnamHo=
X-Received: by 2002:a17:907:b050:10b0:c25:2688:8212 with SMTP id
 a640c23a62f3a-c252688970emr595367466b.0.1787842304808; Thu, 27 Aug 2026
 07:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260809160643.33991-1-l.scorcia@gmail.com> <20260809160643.33991-2-l.scorcia@gmail.com>
 <20260811-amethyst-seriema-of-gallantry-ca9c7f@quoll> <CAORyz2KXJf4gU46649w1ncb7TAOErdoGmfOMzwKr8b+eGdAgVA@mail.gmail.com>
 <20260812-smooth-artichoke-kittiwake-f6e85e@quoll> <409e398b-eb8f-48eb-a0d3-ed8fa811328f@kernel.org>
 <CAORyz2JbOsiDYzCw--Y-tiRXEaZ69B8S9Hjvs-j5WZmtck-ynQ@mail.gmail.com> <ca373f33-fa20-40cf-ab7b-33dd9c25bc49@kernel.org>
In-Reply-To: <ca373f33-fa20-40cf-ab7b-33dd9c25bc49@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 27 Aug 2026 16:51:31 +0200
X-Gm-Features: AcwNN1UfydGY6AWpAopJHGYjoXoxQXXnBv3_HR2BQl9Llz3VNnES3KHGvzZYgY4
Message-ID: <CAORyz2Jq-Q5CbFU5=vCffVyMmyS2KodFhomfUqyGwa1w8Q8RTg@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: reset: Add mt6589 toprgu reset IDs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_075147_249745_56127E03 
X-CRM114-Status: GOOD (  11.46  )
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

> The IDs do not describe hardware capabilities, but ABI between hardware
> (DTS) and software (Linux). If you do not have them in the software,
> then the ABI is not used. I looked at your driver patch and did not find
> usage of these.

Thank you for the clarification.
Since I'm not adding resets to any mt6589 DTS node here I can
completely omit this patch in the next revision. If anyone in the
future wants to specify a toprgu reset for a mt6589 DTS node, they may
submit the binding header together with the actual DTS reference.

Thank you,
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

