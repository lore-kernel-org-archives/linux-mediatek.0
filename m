Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83FFC61DA4
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 15:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xrQFXlyYQ6BXMoPDycsGZ57c4QKFYnwrzSnOP2uhY5c=; b=45cKq6DNgIGc5o03mZ9wSMQzFN
	pRORvX+SaGcCk0ynYIsS/OceSSxzX/SCgX6MX7CD8e3mloBd5jFW1JPypAP9k0KIEhEvwAL88zIuN
	pxP0ZzycSooslbdy4wvOL1Xo+b3r3qAlrRMRVyuTdUcoCIktwZWa5bzhNOFJPRCtmrMr/C6KWL7z/
	LKFYMhBtBltJYy8ft35DLw6lbEHyJ+8LM6vq/MvbFeWrKpYxuVCVL3D9QobFjP2fkjK6jFkKJ8uX6
	dLhXiPf7V6QgT4qu54lPYj7eJ+Dfc61n69+Tj22wa7iXOfw2eHXVJ+FSky4BUZDUfJqA+Ba3Y8lfT
	y8rj7oXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRwr2-002O0m-Rs; Tue, 14 Feb 2023 15:04:24 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRwXY-002GKb-DG
	for linux-mediatek@lists.infradead.org; Tue, 14 Feb 2023 14:44:17 +0000
Received: by mail-ej1-x636.google.com with SMTP id a3so6645221ejb.3
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Feb 2023 06:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xrQFXlyYQ6BXMoPDycsGZ57c4QKFYnwrzSnOP2uhY5c=;
        b=cyHfaTfuSm92uaxOOI5uhaqsN3TkKg07lGrEjNCHarVlWiuxKjf7oCRkDQiSrJ/KIk
         p5VPejZpJlyqc19jdm4yIAtmbX44fCAdI6wqgg9v4YAaok/eEno0mOVacSZXPDhkxp2J
         qbjHuqtbjrasP+JXVegXZbnKWHgRbS2t1jiCNmn6snPhkXdzrJH9qwW57EH/XhQrC7OJ
         GsP5zfZEwJWcGtu9B4PtuDmEAtynzF2fLSrayg1qu971n2vEqSYIpVqTOiG566AkV1yM
         rFM8V/u6mkKZxW8lB4fYFuz9Cm6kI3PSsKOAnaaCx59PjobGSRpOaMstMIaM4G63GO/I
         oKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xrQFXlyYQ6BXMoPDycsGZ57c4QKFYnwrzSnOP2uhY5c=;
        b=M60OdOTXXAEe/cfc0qWy6gDNFRwEDOo3+FqNXCI/me4RhlaawA2mg5xn8RQjmUo8Ph
         9xbUrYwjO7eOD5UB9ZlPthPh84yTYEg2KKGnmbvJ5Eksr57IIfKN3kCfWLnlWx2gXvyd
         FeAo/hXwAsNCSBYp8+4CS4O8Avhvagzt7lS1z3ZpiRNK4m05Rcj6KYNn4eFJRvA+MTbQ
         yRuhWNbcSnjqVopiqJrY3okEKwmnHXJu0SqtI+CZyLIcUQ+DllUohhJ+WJHlcnlWGOeH
         ElziIy2I2PP63tNgIW/C9BMzEJYBVL1fM8ihiERe0mYaUkDAfhVzxNZ7xPwFAg4IYE2+
         awiQ==
X-Gm-Message-State: AO0yUKV6+IMiREf2fYHE7/Hm0wx0jUMeLn27BycRQkmg97fUnRY4bg6y
	nhde/BUx+L52nUcLUuItH6xUygI8geJmewYORqPOSQ==
X-Google-Smtp-Source: AK7set/YceEYxxH3TbzkuGJIzLDMG/nIB5TSYUNzc7KRmoGREeVdPIvcdk7XhvgncEgDMo7G5qTrhettsGOZMVxekYo=
X-Received: by 2002:a17:907:9877:b0:878:4e40:d3e0 with SMTP id
 ko23-20020a170907987700b008784e40d3e0mr1424731ejc.13.1676385852883; Tue, 14
 Feb 2023 06:44:12 -0800 (PST)
MIME-Version: 1.0
References: <20230209105628.50294-1-bchihi@baylibre.com> <20230209105628.50294-7-bchihi@baylibre.com>
In-Reply-To: <20230209105628.50294-7-bchihi@baylibre.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Tue, 14 Feb 2023 15:43:36 +0100
Message-ID: <CAGuA+oqOgprdu0dVcmB=qJd5HJjada3d8ZazMpoG-SBPizzuPQ@mail.gmail.com>
Subject: Re: [PATCH v14 6/6] arm64: dts: mediatek: mt8195: Add temperature
 mitigation threshold
To: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com, 
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com, 
	matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com, 
	rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_064416_478455_5F6CABCF 
X-CRM114-Status: UNSURE (   4.46  )
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

Hi Matthias, Angelo,

Would you please confirm if this patch can be applied?
and, if it is the case, to which tree it will be applied?

Best regards,
Balsam

