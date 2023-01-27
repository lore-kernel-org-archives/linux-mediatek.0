Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9A1C38142
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 13:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0if3bG0az4VVrqjrBAgqmkkRSjBuWgCJhmn0kYqVUo=; b=lyQST6vQpgjlav7322VT/GNLFb
	T32e2H72osuHmFoAZBNnkOa4y9jlie8gb7xd+E9YiZ46MjdFUY70rXk7tGcA2JLwmEqKshYAxCTCf
	285MgFrFDKUa2CiV8ba7Xj559evW2wVMWUELYC2uBK6u78P3SBpyfxgipMQp0KrKeiQfkDzX0hADf
	LlqHjFISSTBOPTclTo0NpHBWLdiK2zbM2SntjN7cC2IzkrLjs5ojz4zHbx6hpKGAKqiwueI8Kv2I3
	CO/fGwJJRFtjTXtwTj9/9pSFRcIc+127cZXptsA+irdMtvw8REqvlxUvLIpWiII9372+Senx0S408
	5CxfhO9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOYg-00EuZD-Vp; Fri, 27 Jan 2023 13:14:23 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLNtu-00EZg3-Hm
	for linux-mediatek@lists.infradead.org; Fri, 27 Jan 2023 12:32:16 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-4fda31c3351so64635867b3.11
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jan 2023 04:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v0if3bG0az4VVrqjrBAgqmkkRSjBuWgCJhmn0kYqVUo=;
        b=FgWZXTUPi5P9XiCuBQQ7Mban5muT1PCuAYN+0cWoieKvqtgyl0BETa13RIeZruTQcI
         RMlnL/epMaeKzOQBweNCUpVbgYQafunJr0MAQW3/TvrzRwOexZQDDdWIlMiYv3B3TxCw
         JAaM3ihmcnwnT6voKtG6v0nmzCa5/Vs1uAlqRdqztT9iXBELBGQOHR+CyaOD+rjUb+pS
         r6JdwodKRM5lkPtF//UxlDd0AKiRSqjF37It476HLdauFoJe3GYrjo7GgUvsup2sPglI
         VwPK9Df8V36vQ6HzWHzRR1pRwIpcHi394E26eYHS02OgJpMJMT+PAQhk4Dh9ODBTHfHg
         y5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v0if3bG0az4VVrqjrBAgqmkkRSjBuWgCJhmn0kYqVUo=;
        b=ZBKvxNsZFBKNA9vZqMy8NdHysKrbuMZKqXA+qc4HIzNRUpYuKZOtq14ARb552IcfPJ
         HgrShpG8zvaFSDPuHiZ5zjHTlbwL55WRnFiYxk0ocj4n5YexyuFg9fsFAzcreAz+8lOo
         FiLn0hd7/5x4eu+ZUzdpHaHB530QBYrHCb14nKZWHEr1fRKrX2GX5p+eA6jv3mgSMbAI
         giflOW440dhCPUxLoQt5bRFTNqpK1nt9llPDC3H7Sb865vS9G6UFJaaKtqTSAjCpmyYJ
         s8irhZ3ZYwbmDakFCxez9aXNU95FkWDJnSwJ28Fn2vcPJEzIXLthpE1e241RG5BVmyNk
         qyjA==
X-Gm-Message-State: AFqh2koDYg8OOfphTRGuH8XNfkCK5LXuilJ3Djdh2IkK0HDBWcfqRFj0
	8T7wEYpz9xaoqGlCMvYSrY1I/74UX2+4j8nIybzC5A==
X-Google-Smtp-Source: AMrXdXuW9ov/7XYT2FJRuxqTfJG/eiPAHPczrgtkY00TYBLkmPlms6WH7OhqK/K+U7X67YZnbPfgRMOD/fB39Awpptc=
X-Received: by 2002:a05:690c:39b:b0:4f3:8d0e:edce with SMTP id
 bh27-20020a05690c039b00b004f38d0eedcemr3524525ywb.185.1674822729729; Fri, 27
 Jan 2023 04:32:09 -0800 (PST)
MIME-Version: 1.0
References: <20230120020536.3229300-1-robh@kernel.org>
In-Reply-To: <20230120020536.3229300-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Jan 2023 13:31:58 +0100
Message-ID: <CACRpkdYRmTiwdtghDjLpCwuQFzDEYhJiWStkwuphUUsAiOEwcw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mediatek: Fix child node name patterns
To: Rob Herring <robh@kernel.org>
Cc: Sean Wang <sean.wang@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_043214_599089_602B2154 
X-CRM114-Status: UNSURE (   9.65  )
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

On Fri, Jan 20, 2023 at 3:05 AM Rob Herring <robh@kernel.org> wrote:

> The child node name patterns in Mediatek pinctrl bindings don't match
> reality. I don't know where '-[0-9]+$' came from, but I don't see any nodes
> with a matching pattern. Also, patterns such as 'pins' or 'mux' are
> ambiguous because any prefix or suffix is allowed. If that's desired, it
> should be explicit.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Patch applied!

Yours,
Linus Walleij

