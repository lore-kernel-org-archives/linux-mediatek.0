Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5017BC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 09:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PyiXdkyJ7NTdcBqXGH/Xd5PGJPdHNypzKoBk66n3wjg=; b=FxtINUp21JKhet
	6UII1OQnFWh0RWZKLLYEjLBrdiJ9eMb29c/VtHBe2COKaXlwQEr9wQP9SijuOhNiwYZKAHr4FTa6s
	iDIS65PVyNhNsIVTNZmJ9HXNk00CruWstYlavuccMvB3ryT6Jg25nWh1JnUVCmJ6/5TzP2LOurgiA
	19egDysnL9WfM06+xYsIHHweC3NdeNnplFtRdsHKssY4O462Tbf+RCnn4lHxOUgpadJn1JCNCLiCN
	fCRcGCVQxH9tbctGf4BAsI6Dft+4QCULr7n0M6G+iBfCCj+ICmzVwnB7u3y7xsWXqI+Nqqu6RPgsH
	Uk86uyPEE0rg0Pr+IKuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh6Me-008F1a-7d; Wed, 20 Apr 2022 09:11:08 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh6M1-008EkR-11
 for linux-mediatek@lists.infradead.org; Wed, 20 Apr 2022 09:10:31 +0000
Received: by mail-ej1-x631.google.com with SMTP id g13so2199265ejb.4
 for <linux-mediatek@lists.infradead.org>; Wed, 20 Apr 2022 02:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Sqol68HqvgykQP0mBplsih5xwUcq0N0BeoEU6Izjsrg=;
 b=A616bAmDABOaqD1AFXlQ2NC0J1otij5nJ6AlSdyIH3dWmMP24eT+rasB3Ha9EjoWq2
 2BDShFBwFP7HsvtgFQujpyIcWmocDrS96+8/5QQj61juuiprcJK72Qm8XDEG/E2+F9SN
 MVLHeNmPXpqNQ7CgrhhN1p2OF3/6r3lr9dkTMvHsyo2XpXjX1jtMSAqSEGtp/QhkNiz1
 2Pt9tmdJWArBwKwwm95F8G6kht1cQDFfqj4XF4DkZ1zF7bOtEInL3fd6+CUsNPzCtyVd
 PpcRxCUtBHz0ePSsdBIcHLQ8JvmtQHXOwaUwBvc3G3b7Uk/+4cR2SQhSITu0MD0Irie5
 sbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sqol68HqvgykQP0mBplsih5xwUcq0N0BeoEU6Izjsrg=;
 b=ncNgjHgR+NkxVIHgFxoJ5AhNQZepf9MoCqULD5fqSetcj1tvFL/KyEm9slaDEdvAFL
 RSvQ3dhgpJEK8ilbuKFB8ApF2IVF9AtMD6Dizwjgtpq6jgM/EgFWGek2yo4QyXIFw3sn
 bkMgtQbxcYlONaef0iYJ6t0c0Cfykim50fnhPEk4XSm6r5bSiczi1edQuey5dJIPeDPs
 sMkEPXa9GT9oTm2g7RaUiKVS0XDIgyZFIb+0ZwYOJ/QydF4TvUAmyNjB5eFjUPqAv0mw
 jTl2wAw/Timow5+wFs5WfMW4KaOzzUkOIujOANf/4UNHh5d0GIarnK+zT9cpVXVKkQEf
 aaZQ==
X-Gm-Message-State: AOAM530+vJgUs7VKT9g3eCufc2JWJnWqnYLmDGEbiyijxdCnNXKrztjP
 MVOEwdu5bvaQNQWnhixvjonKcFmpXYrsnQ==
X-Google-Smtp-Source: ABdhPJxG92rPSC3hNtQHBpaG7HiZnIUs60MNNSFnIks9tTPwIDOBQYMRSTrb6KzJ4JTHbkzpA/IZQQ==
X-Received: by 2002:a17:907:d06:b0:6e0:e2f5:4f55 with SMTP id
 gn6-20020a1709070d0600b006e0e2f54f55mr18000749ejc.618.1650445827173; 
 Wed, 20 Apr 2022 02:10:27 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 r3-20020aa7d583000000b00420a8b66566sm9727057edq.97.2022.04.20.02.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 02:10:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: mt8183-kukui: align SPI NOR node name with
 dtschema
Date: Wed, 20 Apr 2022 11:10:15 +0200
Message-Id: <165044570803.75184.17759035800452933385.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220407142143.293740-1-krzysztof.kozlowski@linaro.org>
References: <20220407142143.293740-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_021029_128397_1F67D050 
X-CRM114-Status: UNSURE (   8.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 7 Apr 2022 16:21:43 +0200, Krzysztof Kozlowski wrote:
> The node names should be generic and SPI NOR dtschema expects "flash".
> 
> 

Looks like no one wants to take this, so let me take care of it.

Applied, thanks!

[1/1] arm64: dts: mt8183-kukui: align SPI NOR node name with dtschema
      commit: 4e3ffebd69e0aada1ce6bf4bf832e14a3c4f50db

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
