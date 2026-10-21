Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E61E606A31D
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2026 06:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U+gJ+J7r;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YDf5OSlq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75HaQkKBv/s4TtNxkrkKWGdW1y+fNkvn+Rmd7D3S10U=; b=U+gJ+J7rSOvCXUs8FpmX83/Yih
	wif0HjLkxURsXPSX9c4s++YxBtj99fHLm7R2vKxE59BclM0ZU5h86KOSqo1ECuPVB9EYOTtdTj/1q
	j0Px9c0V3cKNdO6yakJKR9zD2NbLF4wRSfnDEvPwdZW3QLyhjsGCBYAVXIyJSExnQTLf8BcREERYw
	36RaVvQ6VhoX/R4mUYh8boIxMDVlVce5KJxHRgHmqcmC5sUUMa86rhYD54bBCMi+iwG89GQD/zvNj
	KA/+m0VkcA2300nUP+FTHfhNM3rSQUrgi67lZS3kiBO7nMMpcyZlWxTb8yQrE+SKv8/aACyHxjrmF
	GDvgkczw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQ2Z-0000000BC0g-3quB;
	Wed, 21 Oct 2026 06:43:11 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQ2X-0000000BBzp-0wlK
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Oct 2026 06:43:10 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-8b0e21048f8so3802777b3.0
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Oct 2026 23:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792564988; cv=none;
        d=google.com; s=arc-20260327;
        b=Q83F2cgFBPF1j52Wck+V0WEhrZ7COIyrfTes9NxtS+IGn1Gdv3DOSYLCRLBb93xcOJ
         rk5Qn8xej7ag1C3Jpqn9mMyrzGX2WK3pditfoj4TAbIBMi7Ha95dOhik8nVit/Tc6cCC
         VyBcAxPUzkFfYpLaiWakT2vzJiKUMAEIL7mBvDz+pfm2F0rxgR/rxQXjxN6IKdqqQ8dY
         MWVkMUT9PWhBDaow0sHR1/0T+CUAu9a7j0kouWExS+jvVgeH5KpIIRILXoOgnOueH0R5
         FSDEmYesfI7Rpwcbm/eSQA7qy10BB+CrI80ZM7yeOpEWp1vwb1q1CcUz4L11VCDgjXMA
         eyRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=75HaQkKBv/s4TtNxkrkKWGdW1y+fNkvn+Rmd7D3S10U=;
        fh=VVaYIfRboAiCsWevHsjmPy/5AoVSwB2YlIXM9liHBQU=;
        b=Jfd4u8bH024c40Yjrf2d32KRqAk4insKxcqCuBLcti2whgU+KFBmDinWksz+3O67Hu
         Kj42mM1xg9TEJoJsFGYu4nPWqoJ1uk0OklvmqdkDlKfCGvvdDBLfiKfiH78tij5sjIUz
         ozy7SqR1Wrpwb6arGcmsGFa0vbAvB3fkAIBK8YgERKqvDhwcu4KUcvSEVLb6pjvvB6Uv
         UNdJn8ZOQHBAvH9ZZ9j3w1Z9FR3E2+qFXQ3racAXBx7AQIX6RbAD1oJvf/quh1OFIzks
         RVxelu1Hxukkpdu/fNnTCtwZ5h3XOLtQUOUBmMxMdKj9lNqi1//KXFrrsoH75AFMM0VL
         37Tw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792564988; x=1793169788; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=75HaQkKBv/s4TtNxkrkKWGdW1y+fNkvn+Rmd7D3S10U=;
        b=YDf5OSlqyiAQ4K0Pdci52CGRqwr6FTcWUif8bvIFiPRR2Yy9orejWCJbXgINQuLK7l
         S12uBwCJH+/9aO5C6pYb4uW/3KFGRRapCa17Ki/OpERCYlbDLlJMoALqdYOYbXv+N6D+
         W3w+NTswee1sJVNjMjJD75L3J6Qh41pfTj3MWkVvgCnC7szwMvbnj8Kz65ApDmd/1ERB
         rcRtL/r/CmSBfFX8vVeQyUz0T3t0sR/jhItum8iayj0v5RVKiAiCtEliWxJoj+c9Jfs5
         bHhfAK7MRnwT4+1Qt+RtdD/6vHUX0KUtA+Gekp7ERDW9ZGMjxJiZvmMACoW7OE2BZgW4
         Dbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564988; x=1793169788;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=75HaQkKBv/s4TtNxkrkKWGdW1y+fNkvn+Rmd7D3S10U=;
        b=xRQ6VvN6QrIGNr+g4lgwC4pq5GKcnatT6i2KVTGSGnDXgTBpf5bKtp6+ypQRRPq29I
         5UrIXgrwr5sUtraQCaKGOYnHONzRHcDzBRy1tBym6ivgSuh2SLSnAe7Mpb7WszzhKREA
         AkCWLovb+27BpD2o1yv53D+v8FnGA3S+AiuBrPVeroXcfNjqjbhlywD+dWY0vOg6L7R5
         L0UFOBaLH1+P1TNoEvCkbTzZ3W1O2VPa3mAfot1T8KEh8YMG1wwjkNlSKclo4KGDbZZ7
         3TZb/xh5+mwup/KsYOscsDNd5XjBU/P1LQi/0qCofY/LYOwm0GkpL0uakXpR8a65ZK5p
         h6lw==
X-Gm-Message-State: AFq9FYJhA7Sn3Rl0bl1252tGpWmyIn8ZIYeyl/yUNdwuQecWQpJSGlq1
	KqGZPP4m8z5pJKpFvB/py5Dzfvv5YPKw1hyp+e3UZJ6qIbtoR3+sg7sxtkV3Mtt2IlEJDfhL4fC
	ZsO+3YfKVMMEaCLIEVWELHv7sh9jkllQ=
X-Gm-Gg: AYBFou13Ifg4UPIo7PpMmbk/NMSRudynAcBLR5XCFvBXwYK8SbxbVBsVxXGJkg1Xps9
	8wcNLTjkZHrUOeoolvp2HBIQTCg+8QO9t7MKQQPI4o8v7uFD5YDi6uAcEWN4k1NgyMFm0tLEc92
	5nj8+ylnNa4U++xu6tWrEvkWZDjZdrqmAl+NupUQGhuiFRnyr3P97HbMkbajkEOpLc+XqgIVPEo
	1BSCQyGdAN+KP7s9jse539qCp5CEL7KT6D8EFyEWEEwB23cByKmpb1ob/a07kNNmYBRGYGfAjVs
	o8cYyBg6cqEVGSGCg8nKW9WF1c0yRYCnkiqOaUPslQs/hwA3q4nhxv9JpxydXyiWgPpzXRdLQpj
	zP6qmlYjATsPEXuzNOzNWZShPdxgQJQY5yBA=
X-Received: by 2002:a05:690e:b48:b0:677:db69:cc1a with SMTP id
 956f58d0204a3-67a0e02fb85mr644184d50.7.1792564987934; Tue, 20 Oct 2026
 23:43:07 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020173556.632798-1-l.scorcia@gmail.com> <20261020173556.632798-2-l.scorcia@gmail.com>
 <43b58ad7-5934-4895-b48d-5b5a7b92e253@kernel.org>
In-Reply-To: <43b58ad7-5934-4895-b48d-5b5a7b92e253@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 21 Oct 2026 08:42:54 +0200
X-Gm-Features: AclHuK9RBvE_tu1JJML2kndZnV_iY7Vg0PVQd2A9ECqRfA0-uzrQqgVwLULojEo
Message-ID: <CAORyz2JaJ40+F1oyrvY_0WdqH=fritbPuuQaZ98sXagVayZPLA@mail.gmail.com>
Subject: Re: [PATCH RESEND v10 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_234309_737954_4DBECD66 
X-CRM114-Status: UNSURE (   8.50  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> And here you write clear note about dependency, once you fixed
> bisectability.

Just to confirm, would the same text I put in the cover email be ok:

"Please note that patch 0006 and 0008 depend on patch 0005 as they need the
registers.h file, but belong to different driver areas. Patch 0009
also depends on
patch 0003 because of mt6392-regulator.h."

or did I misunderstand which dependency you are referring to?

Thank you

