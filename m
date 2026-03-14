Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CCB10706E4
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Mar 2026 15:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=79yloG2S6LSxDMg+2dBq+50iWkXEACUaWo+PxUDAKzk=; b=pVkLFK708F4A0NMNjwEKXTN4xg
	YX/0jEdsM9Z91CaaiKDlMVHw3+gnS+mBleJ+214FJO/uWIsx1jlLVYYl1o4+YPy0HoT12EOLwRttJ
	PQfZcnBKQFrNXQ6QBZfVfFvYtlLBmb+J25cAtJnT4fs5BZy3KzCsbe282Ot03m+iflJMw8uMu3jXm
	jYOEPgbqd90jip7VINYiTQzEYqzpoDnPqsoWoKs7/pCFHjEFgE5Qk6XERksCLhNB0J+uBPqtvF6UU
	LXaLavTAEn70MR1P/AKKZSBBfKheazBc6aMPZXED5uDDIdDbhW2tClscaKPvXlMMS6GfzRro9Gtv/
	FDvRS79Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1QoJ-00000001xdg-3tF7;
	Sat, 14 Mar 2026 15:21:51 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1QoH-00000001xcv-0qmA
	for linux-mediatek@lists.infradead.org;
	Sat, 14 Mar 2026 15:21:51 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-506a747448dso28098231cf.0
        for <linux-mediatek@lists.infradead.org>; Sat, 14 Mar 2026 08:21:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773501707; cv=none;
        d=google.com; s=arc-20240605;
        b=OS/l5ntwBZiRyQleka0T9n6m1RN5Q56Q/hn09YJm1+z7bWqga4dbz5/VMW2ZUuPJzg
         PFiA5LVsqm7y3GDI1vcHtBZeRb2vsgK1fVDakO+CCqsJxssLsycvR1IiwynpfMvyNq8X
         GbA5hIjLG/xRC5/JS49aIgWwx/xT6J/nLw05L/MLXrIG2XDluZ74SFPNGJq5upfdUUER
         8V1nxK4IiL9wIikXiDGh+2dRSEquX4gFcpvyGgiav+Km29RKFctXgZSm3zpptwBaO7Cp
         KlM7WryWzUkZTpaCOa/b+fccPtyowiSot3Anzh4JvpEP+XR70JjBQjYgd0jNmf29iz74
         tERA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=79yloG2S6LSxDMg+2dBq+50iWkXEACUaWo+PxUDAKzk=;
        fh=fDX683ooIXcmSCYrPTHMR6oNvhxxFBbxOuGDukbbiRA=;
        b=IjVpqeEX6sUVxi5BHPhueH2jXiyQsKTvFT0HJwD0vC1170OO3ORIGgUqFB1KxxMG6D
         HqI4voJXaZad6nNec5/uoFGKOm660PnpEZQQi/64aT/npnmbINBvzDvVNiVZULTb/NBJ
         tQapRD9YAEqGmpUR1udW/yN+q2zkNfG0fngnqN9AL72Y1Af8ZVMsIlR66CNoSI7xlmZF
         5BpnOPWMnl/jGOBYngcjZm4G0bIZZhIAbWfwbNCmOTxhkdlC/NbCqmzbgEPNaLVdQEfG
         7s7n6QToiwSnZCHqahP/n71x51az4r+UJ0UFMwxqlyfrcss4TbOeQ9NCzqHLE76FVoIq
         0pZg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773501707; x=1774106507; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79yloG2S6LSxDMg+2dBq+50iWkXEACUaWo+PxUDAKzk=;
        b=UpwJd9AMJeYRMBwM8JX0CdAHsPkJwj+ps74WJ7446uENt/3URkKfMyyPEKmGd8ON+l
         IXjL73EurynB69L0VB2Gq/aqOhvPZMQSF3w40uladP9hDnARyFkxAGqOxmb3OGiYoo2/
         HcBHlIvYicemPNjvYjbd2YBcS1xFjtdzqJyzGBfS8Jem2tHlmb+JZLFzk1QLPaERSELL
         FPHmasZDJPVCQB0Fg25sb07y2PSUpGNt39RrHwRpftkeEAp1X6P0LvDiAr3IWm/Y4b1d
         /MIXJ21kCpGmr8XoHzkGUESBWbfVIKz/zHp80rAP3Xl1OWWrG/CIjJiImaTm9xsVAtG2
         133g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773501707; x=1774106507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=79yloG2S6LSxDMg+2dBq+50iWkXEACUaWo+PxUDAKzk=;
        b=jUStyXZBFePRp+WZQj6+572wPDFAb7eYMCahrmaKV9S5VNr/kLaCBSwaBwwmXQ3IgO
         yRyLMpeBxaUnYce5z6Q+bgnc5j6RZy6/E79IK0t0FMkvjC9pfuP+qPRYTvN2BuPx8XF/
         7vNAkWxm6URvYXWEKrsG9DymnEzsBJim3O+/X2/WFNIRQ9oHMw7y9+ik8kAk+Mmk3DMR
         v+neXi8TDZWjrqQX5l+8UHIMopFfUO1m1vryn0HkhUhFqI1DbCp0RXnoncrcfbFTTgdm
         25OGN3g2y2igm9IyPQEQNSxhDyQPZOZMZEfh7KdTbs2Z8e+I7IbDEOdImWfreU0c2WhM
         SQiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqkFw6xpva1mojhq546Bbpqe8civMJePSYvWeuu2m5BiaFWVQzV4BIDMwRAwcuuCQVi6maaYSUxsF6wjz/vw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmsGWV0pWiwGmv0qQhE3XtnunFEa+aDcyFa6e5i7NGchsNhs2D
	IWIhMpqFie4tY9TurdHwQBTtJjBQyBVZcnszKCpk0WMxQxpBsIlp4Sxy+E9saEXcGeKkmOS6duG
	FzixyVzmiWjD0s5N5zpSX5tXY47jeMVw=
X-Gm-Gg: ATEYQzw0SflBRTJ9gOzCo9MO83EofXmyj6xHlA26Pm6zq14YItvNAm/+gKrEGhBTM6F
	KBemgBAnrBLfeigZpflR7PZob9RPIQeCPvlT/0SJcf1YvYP7d9mBRgcQwJsWhv2K4fYNrYO2/CM
	vmta3Yt1MGaH3bN3rQQQ4LHLgO2TyvgB5bRa9BeDxVedgNOiVm9JfJYbqcgP/ip3wxX4KUQ/ZEa
	2o2vigrkZ/4OIM3jdUS2ZE8lLPCsG8FXxTARorh8PwzN9TvpbdtSO5G+kTiW3+7ywdG6fA7z7Nf
	yQkxjwh3
X-Received: by 2002:a05:622a:48f:b0:509:30b0:831e with SMTP id
 d75a77b69052e-50957cd8e8cmr91300511cf.21.1773501706958; Sat, 14 Mar 2026
 08:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260312041533.187553-1-akkun11.open@gmail.com>
 <20260312041533.187553-7-akkun11.open@gmail.com> <20260313-cunning-fresh-rattlesnake-ab8087@quoll>
In-Reply-To: <20260313-cunning-fresh-rattlesnake-ab8087@quoll>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Sun, 15 Mar 2026 00:21:36 +0900
X-Gm-Features: AaiRm535EmprjKZQc-5oWppPCZE2tY_D2F_kXvT9geVdj9eW0363jXm8lhZ_OXM
Message-ID: <CAKr_iV4m9Jaxv3SCR1Rxg4ZmKPCkDteVaLZNCJo+tjqhX0=6sw@mail.gmail.com>
Subject: Re: [PATCH 6/6] dt-bindings: pinctrl: mediatek: mt8188: Fix include
 guard comment
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	sean.wang@kernel.org, linusw@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	hui.liu@mediatek.com, nfraprado@collabora.com, linus.walleij@linaro.org, 
	mars.cheng@mediatek.com, andy.teng@mediatek.com, hanks.chen@mediatek.com, 
	sam.shih@mediatek.com, rafal@milecki.pl, ben.ho@mediatek.com, 
	erin.lo@mediatek.com, zhiyong.tao@mediatek.com, Jason-ch.Chen@mediatek.com, 
	amergnat@baylibre.com, seiya.wang@mediatek.com, tinghan.shen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_082149_251463_26FAD0B6 
X-CRM114-Status: UNSURE (   7.29  )
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

On Fri, Mar 13, 2026 at 10:39=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> No bug here, otherwise explain user-visible issues.

Ok, I'll be careful in the future.

> No, just a churn. This has no benefit, because it is obvious which if/end=
if
> this corresponds to.

I understand your point.
Certainly these patches do not affect the compiled kernel.
However, I found that there are over 400 instances of mismatched include
guard comments across the kernel. While it doesn't cause bugs, I thought
this discrepancy should be addressed for consistency and readability.

Anyway, I withdraw patch 4, 5, 6.

Best regards,
Akari

