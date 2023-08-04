Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE70BC04A6A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Aug 2023 04:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jyxoLO007wer8vGQEULqHDYToyFmbyl5+nKvUOzjdb4=; b=oFDLEpa5NV37f0fu7GgeORfARP
	4p8HvImrriPWQVTbnM/o8mOMvjoBKRu/YqMYr7msGJov5b4NRuIIHyEu+PPINrziwPWqzuzjQ2pqX
	f8vpGL7qsi3ciA8tEgCChVLFWC3sNMQw1tmN3ooZfxB2pSIjj/nRoQefFSkrTSVVejuEHCN+bQkAI
	Hhbb0YyZoNiyRevcuuS2jUUUi4XPu0/msJbPYyFgYZAc/R9XKWXpOFt5OeFHfaSdi9OUEylG4dEoa
	WrdDoBXeTNFzetYFuvCT4DN+MMCd03mloBfjZQNisZpoRnQKiYfmnMZaqV94LzNp8Zl6gY8tt9rIK
	bFYukPEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRmL5-00BWXH-2l;
	Fri, 04 Aug 2023 04:22:59 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRmL3-00BWVs-1E
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Aug 2023 04:22:58 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-487179c285fso304159e0c.1
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Aug 2023 21:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691122975; x=1691727775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jyxoLO007wer8vGQEULqHDYToyFmbyl5+nKvUOzjdb4=;
        b=HhCcRMkezocHEWPSlGsjN6Df5ziasYgLp+/MegocGZ5QyXALKJUFRvYCyB1ZLBKlxw
         jUbaUziLCoxrwYv3P8F8mSrEdq6K1d+MJ3nxCCoLtPWhZnPyMPmSv5yEmduGjeRi7WIn
         var+a7bGU0jSz/JjRNGVunR0qb/efTwOkTPVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691122975; x=1691727775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jyxoLO007wer8vGQEULqHDYToyFmbyl5+nKvUOzjdb4=;
        b=W4ieSrjHtsHixzcsCxCsdGFgNlrZ/lLJuytnL5DGE0D++jmpsxOfJxdHXqBkbJacHx
         X6BWU9zbjlyJvR8KQsN0Vh2PSgvLTcHJl5DKkUzT3TntqOQHkQIilO/QhwAxGDEZlCbM
         g204Dhkc1MKUD6pzvbTqEuimgErsjCH3eiGyjsULjeYhU4x2vRajfWnh8m6vNdS2j5ws
         tMhZ6ti935qcnz9E00QHCFKSK0sYt3TjeM6ssNFysPIfpUYRK7sSIyNGW2JtBg/8rbZk
         1/GPS1T+RcQPXAXZiBpsOctqXD7N8y8S2Gvm39Kd1eXy9fC3A4qv6e8Wpdih9N3s8nV9
         xnLg==
X-Gm-Message-State: AOJu0YyvxqdnLuppp4Vb/VSs5cKdtaXk2JdyOVw5jZNTv59rhfZWVPrI
	EM9ZmGf9ybtQixEZ+Kx5718yam6wwfZNpdIXIUfGDQ==
X-Google-Smtp-Source: AGHT+IFYGSRicG0zDcxiQP5nBUEu++Q6FFkpz7aoPRLFhF+eMD9RVVQWfLW+KaLFuSN55QHHLbuYZL2f/A9BObI5TWE=
X-Received: by 2002:a1f:5f84:0:b0:487:1586:4c29 with SMTP id
 t126-20020a1f5f84000000b0048715864c29mr383643vkb.1.1691122975222; Thu, 03 Aug
 2023 21:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230803012341.2388831-1-chenjiahao16@huawei.com>
In-Reply-To: <20230803012341.2388831-1-chenjiahao16@huawei.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 4 Aug 2023 12:22:44 +0800
Message-ID: <CAGXv+5H1LL-0FbcmuwRCtkmnWRmO0L4+0jxzKZeAzJKTWDiZqw@mail.gmail.com>
Subject: Re: [PATCH -next] thermal/drivers/mediatek: Remove repeating warn msg
 after devm_thermal_add_hwmon_sysfs()
To: Chen Jiahao <chenjiahao16@huawei.com>, rafael@kernel.org, daniel.lezcano@linaro.org
Cc: amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, aouledameur@baylibre.com, 
	void0red@hust.edu.cn, robh@kernel.org, daniel@makrotopia.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_212257_438420_5D70B22B 
X-CRM114-Status: UNSURE (   9.48  )
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

On Thu, Aug 3, 2023 at 9:24=E2=80=AFAM Chen Jiahao <chenjiahao16@huawei.com=
> wrote:
>
> Referring to commit 8416ecfb32923 ("thermal/hwmon: Add error
> information printing for devm_thermal_add_hwmon_sysfs()"),
> return value has already been checked if ret !=3D 0 in
> devm_thermal_add_hwmon_sysfs(). Error handling has also been
> performed in this case, including print warning message for
> debugging.
>
> Removing dev_warn() following devm_thermal_add_hwmon_sysfs()
> to clean up redundant warning message.
>
> Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

