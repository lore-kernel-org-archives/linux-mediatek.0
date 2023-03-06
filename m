Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB568C64EC4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 22:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5c358ipi4Vt99BrjRiy5z3SaM/LHgeps04nWxxfLfzs=; b=0z4IiLZedJOnDu
	ClMmdTBBqTO9rLofzuhhxQqG5IE5cgiHYMX4TWiXOWx8VGh/nhPtUfqR+p+35UACfDXo9w5U2e2Mg
	CJu2JjVpt0FV6xZAX+B5B1DGyBolRF28LSct9V66wKlBgxTjG07OGuIrw7Bz7eT7fYHKRbA6dLWtS
	BlSXvmYNO0LuOCVqDuS7W/mgEartlqgdufI01850wdSdRBw/Peo149GpPaeerh7XvhcpQdqHGIVkT
	lBJbaN1IW2YhyZwHJW9AQTMalJ8GP8vmPqXdWlwweybmhn+dhf7AThpYIGDkEIpBV0U+QLRzIKGo6
	XV9H6M4lRz6Q4dQXGhYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZJ1W-00FCG6-Sz; Mon, 06 Mar 2023 22:09:38 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZJ1M-00FCBE-Ja
	for linux-mediatek@lists.infradead.org; Mon, 06 Mar 2023 22:09:29 +0000
Received: by mail-yb1-xb33.google.com with SMTP id e82so9722797ybh.9
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Mar 2023 14:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678140567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5c358ipi4Vt99BrjRiy5z3SaM/LHgeps04nWxxfLfzs=;
        b=y6IlTFq9wh6AAJI0b2On9RPaIxlkMAom2XGC3qtLKngFcU+K2v1/dUd6PojmMTJka9
         LpWy+qNud0PFYrKrnd1OA3FhmUdBnOJCNxmWr2EmTVJEPw7sIQS2L0siDGqIV3esrP6G
         dAS7U14k2PTv/oEJlzzdbfFZvU+JGd/gxmmoLVc55SE6QmKhLZoi5RYpdgWOmO2z8pND
         y79Eqhdfzs5V+eJOm5j8N47lPfRnamv3m8rqToNX6Gc+AGXVM9d5dLwPe0FnFOU5Z+Gr
         Ko9Px+2oN8udbhUyRvJ6xv3RbuOsKljw9PCX7RKhDi0KxPrJRoEWWSA2xhzQOJ99+tDp
         vMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678140567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5c358ipi4Vt99BrjRiy5z3SaM/LHgeps04nWxxfLfzs=;
        b=1mPshydxCwLeDHUxFx3ADN95IkKYIhlVuFPZuPAs8pJQU72tbUG47ZnWwXHXzjtrAS
         M0H4VZ9ftN/z/HivZsCwzEAJ0Hjf19lwgwxg8CA/eSuh1bSRmSsc/sluB7d4U82J5zLt
         2wIPaFBUPry0mpuLqN+l04n2HNzcFFtgYh0p3zC3EbTQHtalWaGR1PqRwMK6bhkM/SAr
         E0Yj9ykQ6jzy6YdfD/luYe6xl7/kg/W5DOHP+M/vX82K3P9vMYXPfaYxgNJDXOVfN9bb
         mhiNQQhB/SyTAkCR3+89Q5GioYWjVpQGyWyWuPmsBak0mjtr6iRxJ4PoCQuAIetybcug
         saxg==
X-Gm-Message-State: AO0yUKXLrsQL9yl26/F7Uemj8H+e/u2r7msRKf8RqdlRSQAYIN5yerjA
	UjIZYftU8nYRPuswPnxXfqTnDisxcEWvemWEPlb7cg==
X-Google-Smtp-Source: AK7set/PdFBK9urMpw+5M7Ji1nzK6dx2LJ23tdjkUepZRyWvDmY3aEBF0cZ+iYqMw1+m4OTu85tD91S/epnMzfXpVHM=
X-Received: by 2002:a5b:b84:0:b0:ab8:1ed9:cfd2 with SMTP id
 l4-20020a5b0b84000000b00ab81ed9cfd2mr7363696ybq.5.1678140566986; Mon, 06 Mar
 2023 14:09:26 -0800 (PST)
MIME-Version: 1.0
References: <20230303002850.51858-1-arinc.unal@arinc9.com> <CACRpkdayVLTT0x6hfnwvL-Atafkj8PRw5uwe7Wic3jtn+X-axA@mail.gmail.com>
 <486ebf30-dde3-b77d-c292-ba7605313273@arinc9.com>
In-Reply-To: <486ebf30-dde3-b77d-c292-ba7605313273@arinc9.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Mar 2023 23:09:15 +0100
Message-ID: <CACRpkdagmqfrsZtJrWn9h8ZMiJUrsKF1_B4KV7+LhZdc6C7tLA@mail.gmail.com>
Subject: Re: [PATCH 00/20] pinctrl: ralink: fix ABI, improve driver, move to
 mediatek, improve dt-bindings
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_140928_648569_50D070F8 
X-CRM114-Status: UNSURE (   7.08  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Daniel Santos <daniel.santos@pobox.com>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, William Dean <williamsukatube@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Mar 6, 2023 at 3:56=E2=80=AFPM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.una=
l@arinc9.com> wrote:

> Sure, if it's necessary. Once I get feedback, I'll rebase it to your
> linusw/linux-pinctrl.git for-next tree, see if it needs manual changes.
> I'll let you know.

Hm my for-next branch is a mixdown for linux-next so use the branch
named "devel" instead.

Thanks!

Linus Walleij

