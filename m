Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5E6C001DE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 08:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2PU0a9VuD0AqZ7LLCF0XhwtJkP2bxDSGXNRofV50mGY=; b=OTid64T5H2qIoEZJmi1WBGb9ux
	KLNPSkieBIRDo26ahJbsrbeVPw5TTfD4CtsR4Ind0xgjud6VIJMmywQmnNcojh8X1nG3PWwLprlIe
	LLHUZsg6lxq392uDbAAStCsBMX26vHfZ7Zzqs1yrnk8KLX796dO/p41LoZJsjOqeJ2IsLAuYYM9rx
	b/Gbf8CjWCSgvi0/UJ4lqRrn4w/w4FJsLS9ZY5HbOLBftt5p/hC0WiW8QkkjhDo9B/rHORXRiZI6O
	aO2oY7uFcCe5OcUNmXMfkIm8TZ1DBnKHK6U/tIQIYkbeUT9D96xG/yxVXNgVTi0v0WaUjJUMHNhA8
	s09TR+/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlI1-00DKCb-2h;
	Fri, 21 Jul 2023 08:15:05 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlHz-00DKAv-0F
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Jul 2023 08:15:04 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-4812f39ca53so630306e0c.2
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Jul 2023 01:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689927299; x=1690532099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2PU0a9VuD0AqZ7LLCF0XhwtJkP2bxDSGXNRofV50mGY=;
        b=TTXUft0VE9EI+2NHbHh36+FLkJiAXUGzc5JeTg1MRU2/+hAY8Tp+Rde0Xz44B/cVzp
         BdQL3i8ZzqSy5SvzLqCqDEigrbpKpDFcJqH5qVXXQdPnSSuum3aDX48yhAgLbuhooPDr
         NYRKFgdBJEswNg9iKQ0Lw0nCexdyVbBzefEAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689927299; x=1690532099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2PU0a9VuD0AqZ7LLCF0XhwtJkP2bxDSGXNRofV50mGY=;
        b=f8abkMp1USwze83m2XqZLLrt06oeCtSfKwR6JpdKxQXsaNfJc0WqKdyIgpDgxPSVvL
         h7vDfV8D1pei65UWr7f9Xp3/N5Jeb1gZYUYantMx6m05iY9NcDjr/tgZig65tKWrYzD0
         hTZX/eti13hv6UdVomSBNXWQK1AOXQZZraWMTgTT2D3vjPAZkzBLTUBQ/43glFUJGVeQ
         LiwJo3pS0hR3VYGQz6lh6PCyfEr/noqQD1dAZdaLS/k7MpbXI2uKlYkx2WJjYinW0vtw
         4GAlOXw5lMHJN6ldFoX3B6Rmn1D4oA208MZLIDPKx0u2sVnJzIajXrT/Xiem/DUEFaSa
         HbZw==
X-Gm-Message-State: ABy/qLZeul8fep2NSiNlouYQrjKBn5EPKdy5dVOkZ2OBMZOgMVAZ0izB
	hqevRdNjQHxOgPyOaLUjlBbRry9oAbdKaCIYBKIpjw==
X-Google-Smtp-Source: APBJJlECUvJBjbKPxeyxhugDWCa/+ZcACmwgOgioxcqGIfgnTdRb8nXyKKwshtlfcwhbKhOt4HSOz3rq6GuBw1C9KU8=
X-Received: by 2002:a67:fa4d:0:b0:445:bd3:5b3a with SMTP id
 j13-20020a67fa4d000000b004450bd35b3amr417073vsq.4.1689927299149; Fri, 21 Jul
 2023 01:14:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230721080751.2012318-1-wenst@chromium.org>
In-Reply-To: <20230721080751.2012318-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 21 Jul 2023 16:14:48 +0800
Message-ID: <CAGXv+5HndYc3eXVBwy=hvsZpTQb-cSgMmDds-Cnjhn0Z461i1g@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] regulator: mt6358: Remove bogus regulators and improvements
To: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_011503_110895_E83A5E8A 
X-CRM114-Status: GOOD (  14.45  )
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

On Fri, Jul 21, 2023 at 4:08=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Hi,
>
> This is v2 of the remainder of the MT6358 regulator driver cleanup
> and improvement series. v1 can be found here [1].
>
> Changes since v1:
> - Merged patches dropped
> - Added patch to move VCN33 regulator status sync after ID check
> - Added patch to fix VCN33 sync fail error message
> - Added patch to add missing register definitions
>
> Various discrepancies were found while preparing to upstream MT8186
> device trees, which utilize the MT6366 PMIC, that is also covered by
> this driver.
>
> Patch 1 should either go through the mfd tree and an immutable branch
> created for the regulator tree to consume, or given an Ack, merged
> directly through the regulator tree.

Please ignore this thread. I forgot to add Lee to the recipients.
I will resend later.


ChenYu

