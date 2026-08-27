Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BC5C61DC6
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2026 11:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WdDC4sV3epSU/xCoz/N1VgwbDwuBbVuoylTs5Qjj+4=; b=H5j4qzJts0gJi0tIhoTYWU+HiV
	a1BYiRDl708aZXizf02Wn/ndlpC8sd5wTIquOYCLUVvYMjWc7dK975e87NH739uXAAgw6UFFEdeXm
	VCTFT49Qc3OatHiI60C+I4QyiEnyMFOw6BxdmbQ/1F2DaTPVQ7Ol/cjua0+F3D9Eai87jDFNK/TmF
	PaOb+opiaI6/vKOITr3tEfqbbVokg5Cqe46zVGz6/5hibNeRBrra0mhEBQTyy6ZZKd3/no4hWore7
	mukQR6yjua2mCk5+4pUMH06eVkmr8kMhYqyMTGN6MuucWVtF9JL7GZvoBuuCBPKkn5/RyUNw/aehX
	zxfXsEkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzYjt-00000003v13-01YQ;
	Thu, 27 Aug 2026 11:57:49 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzYjq-00000003uzl-1llC
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Aug 2026 11:57:47 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c20ce3c118aso189867266b.0
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2026 04:57:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787831864; cv=none;
        d=google.com; s=arc-20260327;
        b=FROEoXqVPupsi+gaFhU3I+mIMnY64mrB8NfTRavmrJYNde214BZoyvU5uSwPs1OI9R
         Ctn1lYfBT9tiGtd7xIds2iEx7aCrpGD0Spdfv6/VDEK7FSCsZ8LCZhnwLbqDwgR4Y2pd
         oUg2QuK2jWvYn2ABtS4u+phg1QKJQ16iZUwBhT3sb8P+OjjF2TSd/yVaIkjmvsM/HMfs
         yJiNMlpVsRLkgU6b1y1otqq4zIr5dG6TFdbt0G1d7tKm0rqg+b9ZHHU6oWL5nJ8DYRtI
         z7tND2xZjumI45Y0vQwfLe5OdpIOMVSo0trD3z6ZZQaCpWEplb4r98TPf1vCtkirpE7w
         Iz6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6WdDC4sV3epSU/xCoz/N1VgwbDwuBbVuoylTs5Qjj+4=;
        fh=FGCOzqW4oK7K8xS5EwKwlW8qFzyVhVsDXrbSpirq1u0=;
        b=dhaxv4kiMC4O2lwbH+4D0B5W8VAolerCglxuPtefZpZzPgkMTHb6p7751Gnr69rALY
         O/zki2pbfC3Ihk8232zmXRdENILMYkh2/2HcXh75gd1xOBc8RnYBIrsgGodWYpmeCnLC
         dJrLAJjqj8Y49JmKLTyUigi1sEnqHGdX6g0gww2apOjQvVHrWWl/yXaek/cQxx4Jo60+
         L19CDkJE3CWQ7Ug2ehBd9TsU60aNR2Slkadn/ZqqoTNRCzw4RMk/G3lMRbSbFHe2ER1Q
         zmiImF9/D41hv8nqC0kS3AIp5DUNBl6n4ZjgG8F5/BE8xxTzljy2GLsG70S5HrrcsHld
         1Nbw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787831864; x=1788436664; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6WdDC4sV3epSU/xCoz/N1VgwbDwuBbVuoylTs5Qjj+4=;
        b=VQ6Sq94p3FUucPwmpvHPdWDMb+Lb/wObuALcAHL67kO0isL1UPAQ/3JVL0NtfMx0XZ
         Pi5ZafCOe/PsfrWazvC0ZQppq8JtOdgqLFJ0xLuXGoGNP4UuS/dMYbEBC5isOZF7SPSo
         mEkiFmQiFZkCyktHhB1MAzKLClfyYDZV3B3r7axz1ZAoGX42BP+EACfGcDbw/ayZcSeP
         8kbvQycsD0cwdvfMc9JQCvZISYuWbnYlAEkg7U5jjZSTuD+yCo9Jy1lklHh/QRDWogB2
         ABSEJWgrzkAE0P+9hBsFfupqWDo/b0zmiKsKMvArDIy2DXFCGLgrAdjCf3z8V4V8p6Xc
         Z2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787831864; x=1788436664;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6WdDC4sV3epSU/xCoz/N1VgwbDwuBbVuoylTs5Qjj+4=;
        b=QalfCRmORzGY4XmJVnIm0CzrOQrFl8j75UGszAuPucR6ZqO7F4UxTfCJRlQUem7H0q
         gcEowZ4a7Y0eFnYHztap3GPe8qAo/DyjBS5jN0L9dJGP+2xyM1CHU0heH2PXJkyE/8IT
         7otEwd/lmD4nH4hWeTBEvlkcC+yXBED9ISjIgxX0JQukHNDY4ZbZq7qHmcLHQNOe+CIU
         JTm5wAnoRboMSwC5E2gh8ZBRyvdi9BfXZ3sk9nHpKCSHnAAzQ33/r1yvChT9sx8ZJ8uj
         Wx9tR8K2rUe4JpLkHg6Tp0Onsv27+V2LCjIG2AYMKp5gMzTTz8fGPmXW4BrW3SO9tg68
         SATA==
X-Gm-Message-State: AFuF++nd+5WEmvrsZbkq/mWM/LA8wKeoG22Eyda9KKJUDKog5l5+PJp3
	yx7LqN+DzVVdgtP8Vd/oDDHpLCSCSwD4RDyWAGf6Xscqp2VWN7XJNhvsd2fVnwcRc6FePvMY4mL
	hyP84Xhh8qm6Ooy6V3e2mkzZwZHO0Duk=
X-Gm-Gg: AR+sD1329CUKWQb4Io2tsZtcT7nlNGjNiE5G1zaTlBDD9vM1f1iVIuHo6qPFxm3RuDL
	o2r7xu1mGAL2EjclRDOwMFigv1safnk0QNKPCn6BX0cR97OkfzttcYCgX8rcpqxrfhUsnSfPAp2
	aCaJd6EfqKe3LqrmmmgKSe/iypNFVj6GRTFFqf9uitZZhh4Y7bztHEtvkRrCu2uYqs4xhmWnyyS
	KnVBpBEyFF/J+8En5iAfS/GO1jxmLe82Go/t0i0V3k+vLscvyPXRN1/0oH+gPloM9Ypk9asIcgq
	IReZ8UIRe1frG6Ut5u/BWjHNLO4MDdem9/lk6+dqOx4=
X-Received: by 2002:a17:906:4784:b0:c1c:49d9:4c34 with SMTP id
 a640c23a62f3a-c25360ae6f6mr459116966b.11.1787831863644; Thu, 27 Aug 2026
 04:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260809160643.33991-1-l.scorcia@gmail.com> <20260809160643.33991-2-l.scorcia@gmail.com>
 <20260811-amethyst-seriema-of-gallantry-ca9c7f@quoll> <CAORyz2KXJf4gU46649w1ncb7TAOErdoGmfOMzwKr8b+eGdAgVA@mail.gmail.com>
 <20260812-smooth-artichoke-kittiwake-f6e85e@quoll> <409e398b-eb8f-48eb-a0d3-ed8fa811328f@kernel.org>
In-Reply-To: <409e398b-eb8f-48eb-a0d3-ed8fa811328f@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 27 Aug 2026 13:57:32 +0200
X-Gm-Features: AcwNN1X9AttqB8t1bj6TQbgbNwwMvZ74IM7YuKbj9WRorR3Nx4t8S9M-g6F42ms
Message-ID: <CAORyz2JbOsiDYzCw--Y-tiRXEaZ69B8S9Hjvs-j5WZmtck-ynQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260827_045746_597433_E75DD539 
X-CRM114-Status: GOOD (  13.36  )
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

> > Then these bits stay as is in DTS but bindings header is not needed. You
> > can have of course DTS header, as we did in the past multiple times for
> > such hardware constants.
>
> So I wrote above this to myself and can be ignored completely? Then why
> would we not ignore your patches?

I am sorry, I'm definitely not ignoring reviews and I'm actually
trying to understand and fix my mistakes.
This reply refers to v3, but in v4 you reviewed earlier today I added
reset table support in the driver, therefore in v4 those constants are
IDs instead of bits (and it should help cleanup the other MediaTek
existing bindings if deemed necessary).
If they're IDs that describe actual hardware capabilities, shouldn't
they be located under devicetree/? (Again, I understood my mistake in
v3, but in v4 it should be fixed).

I feel like I am missing something that's very clear to experienced
kernel devs about the boundary between kernel sources and device
trees, but I can't seem to figure out what exactly. I'll try reading
the kernel docs again.

Thank you for your time and patience.
--
Luca Leonardo Scorcia
l.scorcia@gmail.com

