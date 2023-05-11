Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B3FC77B7F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 22:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=; b=vsegHIMZiKXlr0Og2Ki4H/Ptiz
	+pnQxyaNyYuBMAdKrQv8kyfdfIstPyNWaY87W1asGzIKZPexUCl0deeKESXtQOxSEpLAiTxfWEN0f
	5/Lp6mS/xKfuKBUv3f7euo7I5FWRZFkspEO+KWIlzIKRdOJXo52+JjySGAJjNbx5ZG/dZ4a9T6Kcm
	auslz53wF4kwC9n9kBmsBkvdQmc5F7AuRvf1rhcYfxsGAM0nkudOkySXCWrCVymIE7MJBaVFRokS2
	01VuNsPm1oXy6pR0EpYcNPRNoCxteAZ3QHQM/KiqFS2gQGGZm7IGB45TUTB3n4faSyn6fqp139ew1
	YzUjjaDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxEvs-00ADIS-1z;
	Thu, 11 May 2023 22:38:44 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxEvq-00AD2W-1Y
	for linux-mediatek@lists.infradead.org;
	Thu, 11 May 2023 22:38:43 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-335a61eb904so537545ab.0
        for <linux-mediatek@lists.infradead.org>; Thu, 11 May 2023 15:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683844722; x=1686436722;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=;
        b=D1FyFhLQwaDejOigqWLk+GuyULBq7LZgABB5i2e5+IKmmWCfxwSTJT3DQuSmKwKjd8
         e3jhl3HKPDcYXl9986gGkAGRHMQQZJGQk97gBFA8DDgNTtenpBsRUNX6l23eGj3nmZiF
         Ps7NGOVGb2IR8BW+825K4FT0AQX2T3+wgvhKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683844722; x=1686436722;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=;
        b=K9aHcG2HOWSvoom/lp5gOAp9cVkzaiU0xNWFJKff4JsadpGbFoOvTBMyAfWJsfQy0z
         Cme9/YGEqbwkZyDonXGH9hIgCoxJyIxzXtNUebsrerJ28KSqj+3U5EbcKHFCDojAyanQ
         2lzQpeSx6xXWUvWWxZ5EyZoZgVTt4EqWepTUvaGREbRKkOKChscEULapP3C8DMGeqPKj
         YPM6bPWgq4vR4VJvr9DAWobFU/clTzS47JPblB2sl4/CoMEXrxdIC1r3tyw8FKF8/PTM
         YR9LEnhAFRn6zm2BSNyW/N/+fErS99MhFZyEIeSG8W8i9RjjLEWuvOGp9MxrPu795tzY
         IJCg==
X-Gm-Message-State: AC+VfDz3tWkZyDeaUP9jJAQYmEyR08CMDU0NGPFD/qe8DpcBPmmGPmlT
	yi+lVNYVvwg0DzfQHx3MviqKsP2PmqlETH6gToECwA==
X-Google-Smtp-Source: ACHHUZ5s2SSlvAKm0yJCbow0T1hR5Nz2BqU0NUPOjYkRbNoZ1N11ksD1vWehbac9D31CrZPeMvxv/rSrw7qS62xLZeQ=
X-Received: by 2002:a05:6e02:1c4c:b0:331:4df0:8196 with SMTP id
 d12-20020a056e021c4c00b003314df08196mr14030ilg.13.1683844722057; Thu, 11 May
 2023 15:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230511150539.6.Ia0b6ebbaa351e3cd67e201355b9ae67783c7d718@changeid>
 <20230511150539.4.Iaa0ee05cf0362540fda50dd6a0d87ee35dccd88b@changeid>
In-Reply-To: <20230511150539.4.Iaa0ee05cf0362540fda50dd6a0d87ee35dccd88b@changeid>
From: Julius Werner <jwerner@chromium.org>
Date: Thu, 11 May 2023 15:38:30 -0700
Message-ID: <CAODwPW9zj6SAbBjk8c91sTOtzzAceJ+=kaMuMOqDYv4Q8JLDyw@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: mediatek: mt8186: Add mediatek,gicr-save-quirk
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
X-CRM114-CacheID: sfid-20230511_153842_524137_2A9C0B00 
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

