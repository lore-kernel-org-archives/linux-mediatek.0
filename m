Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7429DC05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 02:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52xSp5wmYAd5hFLJ9WZGw8pChWVD+OAjWtck6oN5dzs=; b=v0MUbKBunidEmS4W8x3CozmcXB
	7CmzJU6+T4KQtJjFn57ftPnyGVYutcpKlBGqQ2vrB+O4EJbnHILsqv6mVYBnHpQpCA2UI5JJUzA4W
	uqqI5Z1JR6m4feHiyXBC7cAGoBhitSg5UNRQ7DxyFvYC5SWo6Mk71Ey1gX/2S95NF3kUsPFRYX1Wp
	lFBFOFln4lEW6WGSXj5tV1II8rvLwR3DwfgTJ1Y0RHVak0+lCjsHzu9qjkRpA5qyMmx7XNafIRTCY
	7TyX/B0PUzpT9X2TzUwIvNScrSzd9zBiY9OP3iIChShQNt5tr6npggrLwYzoAEdPZswrSoQwdee4q
	iCiJb8RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQJNJ-003y2m-OM; Fri, 10 Feb 2023 02:42:57 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQJN8-003xwN-4S
	for linux-mediatek@lists.infradead.org; Fri, 10 Feb 2023 02:42:47 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 6so1993515vko.7
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Feb 2023 18:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=52xSp5wmYAd5hFLJ9WZGw8pChWVD+OAjWtck6oN5dzs=;
        b=U1fCU9dL7zEQQUng1tf5EwsK3VWDYVsNNyBj39FW19d1Mr7MMWDk3X92i8GTR2E/v0
         47ufcXPTM+wllgKMkSh+S1EEpjBhwtLcJgqOur9mlxYBGhCpe05yzGcH6VqrQwTPoLAV
         Rt9ONCKI6fv1m3JL4fhZrhRxitGMBVxaGnuHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=52xSp5wmYAd5hFLJ9WZGw8pChWVD+OAjWtck6oN5dzs=;
        b=G0vAgrxXmRqhqPfFnxFSorTnne8nfzqKfz7HNIxjooYEzVxyEd7FQmG6s0kxOtdkJ7
         vWpWz4sVr062J53rLLvXROw0HVU/VcRa+SOCR9dKDXFN8j2GQzhc9cHzDU2g9ZmVfRpc
         4k5IvlsXoMnIzwFu7Ro0mSgEuWM+weMTE35t+jSIlCB3SvYprIaFhbtzWdCuc1pq0M99
         gGYyOYxlHdPLFchAILyrrueeLK7treV8SuqteFMqJvczNJj7wFhicO9Zpu8/6pSDWtNh
         9LeaeX6spOHvwIs/8k1YsYs/XrAuw1L0yQ2+FJhJFlIQHAaLChLJriyzWMIIsFyAH2wM
         TqNQ==
X-Gm-Message-State: AO0yUKXjhPwyPqrvT/dNvSg8ZaIrbE5OHjKPn1Ar0uzuP+hn6FcRBdj3
	T36eBccZI5HcDLRP/PNv/FZsWOh83rRpP7Xcr7b/7w==
X-Google-Smtp-Source: AK7set/pFESZTcCKGsksw48p4w49A2qXmUP7rMlB1Od7HUbkX1rQ/0T8voev8FHMMturLnSAI+My622kXRWl2w49i/E=
X-Received: by 2002:a1f:f242:0:b0:400:db86:64de with SMTP id
 q63-20020a1ff242000000b00400db8664demr2812373vkh.22.1675996964119; Thu, 09
 Feb 2023 18:42:44 -0800 (PST)
MIME-Version: 1.0
References: <20230209160357.19307-1-matthias.bgg@kernel.org> <20230209160357.19307-3-matthias.bgg@kernel.org>
In-Reply-To: <20230209160357.19307-3-matthias.bgg@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 10 Feb 2023 10:42:32 +0800
Message-ID: <CAGXv+5HjnP6DC9RV9MUSatyuD0S64K+=kafifFJqYgOhSWu02Q@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] arm64: dts: mt8195: Align vppsys node to dtschema
To: matthias.bgg@kernel.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	matthias.bgg@gmail.com, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_184246_217560_FEEC3DE8 
X-CRM114-Status: UNSURE (   8.40  )
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

On Fri, Feb 10, 2023 at 12:04 AM <matthias.bgg@kernel.org> wrote:
>
> From: Matthias Brugger <matthias.bgg@gmail.com>
>
> As the node is a syscon, this has to be reflected in the compatible and
> the node name.
>
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

