Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7614DC77B7F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 22:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=; b=Eicbd25m+KdH2fUG1TIwUsm08O
	36Mg9/UkdaD1pwFLgnYGtpJ4S8Sez3Z63dPTiFS453nFjcYERnFZrXaG4P0n2nPHYXPWMrbGtyhQ0
	FuwPBILk6024Okyvzaf6iAAkM38hLlgMptmjXm7fuZBw4IzqvX0cZb+BeXYGoL/Rg245Ac0CHvwVh
	qECeSbvXT/eSJoxovFn+8SUKxjFT4MVoxAS+crjrHE0lp8S4PpY27VNw9G/xX9JOeJnPoD+UHgyhT
	aMVrEZ57iQPvWTjeWDxezREHa5gID5IvdIFuLiOsz4bN9unBtKcpXH/mFvy01gbH3QnWQW2hvN5/R
	a62835ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxEvi-00ADEB-2a;
	Thu, 11 May 2023 22:38:34 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxEvf-00ACwx-1K
	for linux-mediatek@lists.infradead.org;
	Thu, 11 May 2023 22:38:32 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-33164ec77ccso615725ab.0
        for <linux-mediatek@lists.infradead.org>; Thu, 11 May 2023 15:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683844711; x=1686436711;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=;
        b=bgglkVrLcpIOyGfwQj/esOxMllAkHXCjEjRGyoziuAKG1QDzP6vqAAzUgt1+LJ+9ZJ
         Ha9KCDI7g2QNDty8fmC1H6UCmCpZeDSbyLU9X3RmLOiOhL/SVRrmbllks5beASUV0ACa
         UzQSTZom/8T2Bla+CZHVWPrPuNzGNYOOyqaxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683844711; x=1686436711;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=;
        b=Ulz9RbxzffEuShrm1CCPxhdETBp166dDanxiBPuPJAqXYReAqxM2EXdsPw1z2nG7Is
         zYEGJeMmhLa0uDfG+XdDB16+scIl44ykg3IPpTG389Jz2BrdZYDmvqO17ImJiNtlBVsH
         qZDhMQvCSbiUFeS9YiRy8n8ECx6rFRIiHgSFtTCwzlJaKkwF0QaTPyLUO4WltG3+x7cI
         sd//sDF8f87afNkqUooyY4cp51NyVhu+WczNCNyAucshBWOvqWMZk8Yj9yn5i+APXVb6
         y84p+qYV/Wcf0SFd7zGi7reCAEcvgIrD1NxZEkRMd3BMijRutPyQozUf79nrhcdUY0PP
         d4Qg==
X-Gm-Message-State: AC+VfDzth6xRAgsz6I0o8ny2h5QmUyatPzitwfgvV3VFxUCFjm53YgE1
	wnMZAEhG6dRut79JN1B6LQnV6OeLxav82Jo9IUjBAA==
X-Google-Smtp-Source: ACHHUZ7vCCWbTAYP16U6tuq3EY4U3PXWute7NLps4i5dXRxX/Gfxf5Ubm2VJtH56zuw8yR1ruIHjnEXfdiodYQ+LhYs=
X-Received: by 2002:a05:6e02:2183:b0:335:4c11:68d6 with SMTP id
 j3-20020a056e02218300b003354c1168d6mr15530ila.7.1683844710963; Thu, 11 May
 2023 15:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230511150539.6.Ia0b6ebbaa351e3cd67e201355b9ae67783c7d718@changeid>
 <20230511150539.3.I525a2ed4260046d43c885ee1275e91707743df1c@changeid>
In-Reply-To: <20230511150539.3.I525a2ed4260046d43c885ee1275e91707743df1c@changeid>
From: Julius Werner <jwerner@chromium.org>
Date: Thu, 11 May 2023 15:38:19 -0700
Message-ID: <CAODwPW8f+nG9gTQtDLs_OO1Y29A+znkRwKYLQ-gjYbVLiCL85A@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: dts: mediatek: mt8183: Add mediatek,gicr-save-quirk
To: Douglas Anderson <dianders@chromium.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, wenst@chromium.org, 
	Eddie Huang <eddie.huang@mediatek.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>, 
	Ben Ho <Ben.Ho@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, 
	Tinghan Shen <tinghan.shen@mediatek.com>, jwerner@chromium.org, 
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, yidilin@chromium.org, 
	Seiya Wang <seiya.wang@mediatek.com>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_153831_452180_9F9F86AF 
X-CRM114-Status: UNSURE (   4.95  )
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

Reviewed-by: Julius Werner <jwerner@chromium.org>

