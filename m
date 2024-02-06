Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AA2C4828D
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 23:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DtOrymEAdfT98LBNA0k140e2ceLpyomhr7hhmTPTgGQ=; b=v7PaNW+xrJqzGkNMKyz7185FLZ
	+rB5WNDUMni8EggCDHsqgCTnK8h1xqu6RT3EICQZ/GN8UF4pyeArTrllTMn6/+zfWZcHIOpcMk/GX
	/WzsMYurtVFtoOYr/J4PQRZE03I3ueEL76WPC95Nn5qUbKh0AFwvCi1UgydL3EXDL8dngzWZNblAK
	6w0XnnVmTKfSVsudHr+wPBToeQ4Oq41WUV/TdGZwoyd53/cFoC6PyxmoHf1Q7lFd4f7rxUAPjWNTg
	gFXWz3hNjIeJcDAKT08R9zau+OBy8JDrVAC89QpakSfNLM1E7lylp+mDpvesLk0TLcgCsXXReYwla
	tlHe83hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXVIB-00000009E27-24vP;
	Tue, 06 Feb 2024 23:55:55 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXVI8-00000009E1P-30TL
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Feb 2024 23:55:54 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-60485382886so563507b3.3
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Feb 2024 15:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707263750; x=1707868550; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DtOrymEAdfT98LBNA0k140e2ceLpyomhr7hhmTPTgGQ=;
        b=f5+zedVKoYfucP6a8X5KUrvofRhxwyApEyDkF7+UHEwzyujiYJFgOg51ntbASSlTat
         OouM7luiNOKzOnhRu+2xq+l/Bc6mA8YsZKvj49D8moXYGuPFrfl5g0ChJVE5wS2u/H/B
         FgrDeOZgNUSGtJ7UA/9u7LHwpzqp5e/ec14H0ndovDnbFk53vIc4XbV+gpvuw1dITTvE
         2+NRXbLh/S58Jxt6pY7607Sse8TjxXfKUprLKC2lRfNRoWE5fUY+Avkes3cAuEajeCsY
         nI0inwVJrCcN4R8zzcssHs/jpGUBgWhX1TRfKaqu7EjuXkOMwCO3/gjIl1VO9zYJJ4Vn
         TFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707263750; x=1707868550;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DtOrymEAdfT98LBNA0k140e2ceLpyomhr7hhmTPTgGQ=;
        b=S4rbouKnN9j4hy2A3gKv9+1EwA6PcO2ZSgH9iRBoptvDrMzwCujisC5CgH7xEpjzUX
         K0zB+9l1gPzRk9Q+RvyDcoXlXbp4zTHZbq+3+YIPovK41aUsiMFEusq+yn1IMHYw8El9
         4yOpIlQ6PFZUUvNEoE+YroZQlNgSQjIQeAwoJogprVobxi5nWXL9Ti/LLvLzFNDwPkK2
         JDhnOj17SPP2nMMZA18AOZw7pTM30HEW3d6DsKpcIQ7+HKEnkbG9Wb39yoXGpe64/dkz
         odgwQEVCmUwlZPx1acT0K06VhsgPxiC0dagIe9Le5Nu3YgHI5osVdhuE90Dpiug8OfvA
         5tGA==
X-Gm-Message-State: AOJu0Yyv1p3fOETJoIZSw/8/rUFW+QtUODIK1pXNeaCoCpLo+VUOC2VA
	nFk4UeKGjeEIin8lDA0bPFtJ0tsqLyQS3UK5O4Z8oFO77LtepO0S8+MjKZOU6X4v6D5s4ECA0qR
	q5uTr5xhikzwo4QpF6r0WAGzIOO5NTutMcfUTLBpe5FJX/YD+
X-Google-Smtp-Source: AGHT+IGISuFKG1k2BfAulBOJpI9EmvTpxTlFZrpNuJJtfFGYhSYF/J4K/1laI4Q+IHu9l22ZD8TtE9ZK7QeYlyatSnA=
X-Received: by 2002:a81:f10e:0:b0:5ff:828e:20a with SMTP id
 h14-20020a81f10e000000b005ff828e020amr3418024ywm.48.1707263750656; Tue, 06
 Feb 2024 15:55:50 -0800 (PST)
MIME-Version: 1.0
References: <20240207-spmi-multi-master-support-v1-0-ce57f301c7fd@linaro.org> <20240207-spmi-multi-master-support-v1-1-ce57f301c7fd@linaro.org>
In-Reply-To: <20240207-spmi-multi-master-support-v1-1-ce57f301c7fd@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 7 Feb 2024 01:55:39 +0200
Message-ID: <CAA8EJpqsJmv36=o1aTjVH6eMHXMg8BHNpiDvs+Q8YB23ezVGtQ@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] spmi: Add support for multi-master
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_155552_799777_9F01DA95 
X-CRM114-Status: GOOD (  12.80  )
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

On Wed, 7 Feb 2024 at 01:34, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Some newer SPMI controllers support multiple bus masters.
> Such a master can control multiple slave devices. The generic
> framework needs to be able to pass on the master id to the
> controller-specific driver. So do that. The framework will
> check if the devicetree child nodes are actually bus masters
> and will register the devices for each master. The legacy
> approach will still be supported for backwards compatibility.

Please remind me, are those two actual bus musters driving a single
bus in parallel or two SPMI buses being handled by a single device? In
the latter case this implementation is incorrect. There should be
multiple spmi_controller instances, one for each bus. Allocate them in
a loop and set ctrl->dev.of_node after allocating.

>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/spmi/spmi-mtk-pmif.c |  6 ++--
>  drivers/spmi/spmi-pmic-arb.c | 10 +++---
>  drivers/spmi/spmi.c          | 76 ++++++++++++++++++++++++++++++--------------
>  include/linux/spmi.h         | 10 +++---
>  4 files changed, 67 insertions(+), 35 deletions(-)

-- 
With best wishes
Dmitry

