Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E50DC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 12:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=luG0mZqT42s4ScqDpuvA+QkBwlM0zBwaqn4Z6IkWsZs=; b=facsEZMmGHAN45K4eWgDkjIamx
	zNgX65ZhV1g0iwqzwtnWiIw75XS722YN0I8J9LDWD3Ws0WJDzKkWj/3L7idDxKSNDLjthn/LejDW0
	egaGwyuHVcN0u50pUii1q3z21s7svsMuJgzWOf/vyNaBEEXrUW9/HdqfUwIGNNinphkf33zHVy0HL
	lNxHH0cUnJnkQNvmbnoG8hDC3LtYReUNQekGNwHXh0IAO4E+3lDOXMo75z233wKh/gPdPKyZ5WIsU
	SggDkIdsUasvnir1wu+h1bbkbOh+Ha+bf60fMmDsdZtcU6gu2nIw+1Qm1fkPFCx4ueZOiMEOwOQsF
	ryMeO64A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osNdr-005BsC-5t; Tue, 08 Nov 2022 12:23:47 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osNdc-005Bke-2f
	for linux-mediatek@lists.infradead.org; Tue, 08 Nov 2022 12:23:33 +0000
Received: by mail-ej1-x62f.google.com with SMTP id kt23so38087761ejc.7
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Nov 2022 04:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=luG0mZqT42s4ScqDpuvA+QkBwlM0zBwaqn4Z6IkWsZs=;
        b=Xo5p4+/dUqGyH5ORFbKrP+oJCQSQZB2ct6cj9l+ZnpTHECjKZE3OYxIXu59IrSc1Qc
         nX/Uwl5d/LXVdtHWsbictVgjLJXjo6Z2VFcV12W3es7PHiCPt0ByVeiUb52qE4sZ+R6J
         M4g06BObqOsWQdjKRSJgJbGxBWKl1UxTSLpW+M0o6UylEofMwGIkMQwGLQRyoCqTQCDW
         9v8p3f/niQpiMs3IfG007/5NdmqFN4TXIrkHYGVLXYFcI5DrApq4k59Hdd64Ou5IAMvq
         /Io29eYqa4UiQwlbhsoVxuAvrAcKYxdDybe9320eNpkUuE+TapewW0K/bzYgVJnvFE8j
         mSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=luG0mZqT42s4ScqDpuvA+QkBwlM0zBwaqn4Z6IkWsZs=;
        b=OVSwJXUAkQIH7f6Q02dAYe1tKuhsURFWlFm3m6RIZuFiS4i14bQYPGHdY9BElGfHBO
         RhjjuYOutHjPZC2ikiWpURR8tG+ipbgupjqNaa5Ka5fUhceoJJlAFLd2aUd8kp5XYg4a
         ZLtYIwQId7ClGQ/ta5m29vcCMVzvnpiZQmGSAmb6xrINZVUYrYDXuaI2/cduz/QGUCsU
         tROz/y+sOkbLxsP+iySBF8N6qzWFb5osiyDy6VLx5qPLDv8R0SEALcaD0bbBnEZFU4b3
         R6GJfn+zXk59CJ2dgNASH1sqSjTVQT7FnLE/ONFoAVdTib7s33bLmI7P4c15dDamHHxD
         0Ljg==
X-Gm-Message-State: ACrzQf38EF+qBuM7C4QbqNm8ir9WcyTdRZ9kiUdD+zUlURBr853tHSg0
	L/lAZ5zX1s9VYD6HzBB5Ft9k+YR6sziDtCsGbCPV4DChuK8=
X-Google-Smtp-Source: AMsMyM7jqo3lgKIdTCyv/JBJ/W0wENabsLDVFGDmYAZKK61Yj7hYAsmkI+a+tjUCNWOJv5Ff4m1Sdtecqie2DFAhPwg=
X-Received: by 2002:a17:906:4c4b:b0:7ad:a197:b58e with SMTP id
 d11-20020a1709064c4b00b007ada197b58emr53785934ejw.203.1667910210848; Tue, 08
 Nov 2022 04:23:30 -0800 (PST)
MIME-Version: 1.0
References: <20221028153505.23741-1-y.oudjana@protonmail.com> <20221028153505.23741-7-y.oudjana@protonmail.com>
In-Reply-To: <20221028153505.23741-7-y.oudjana@protonmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Nov 2022 13:23:18 +0100
Message-ID: <CACRpkdaWFe87x0NDb5PqZo1PDDG1W9Q4do2o=e4T=Jz+ksGPfA@mail.gmail.com>
Subject: Re: [PATCH v4 06/13] dt-bindings: pinctrl: mediatek,pinctrl-mt6795:
 Improve interrupts description
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
	Andy Teng <andy.teng@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_042332_158884_6B49F45E 
X-CRM114-Status: UNSURE (   7.57  )
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

On Fri, Oct 28, 2022 at 5:35 PM Yassine Oudjana
<yassine.oudjana@gmail.com> wrote:

> From: Yassine Oudjana <y.oudjana@protonmail.com>
>
> Clarify the meaning of sysirq to avoid confusion.
>
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Patch applied.

Yours,
Linus Walleij

