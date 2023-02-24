Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D84AC677F1
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 08:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WXBxCzUTwUkY9VpXwOuTsg9QsDGpyRlggQ0Ehs3LnAQ=; b=GAga+9sVk2x5Ux1/nY6I9mm7gr
	VhoZhIqumoMl9Gd1jd7W4Ezgtumz12NPrBVaxlBxlDqhRzovQ+bxGB76SGVBY31Lm/yN8g8YnaPuM
	kiR+zhXNyEIF+tuxK/J8du0Q7c9HsLhaPKvFwyojQPfUWN8aHgUw+RFxhO80iY66M78keIBRhX3Qi
	nyBtD1lBVWUe3KGA0l/gG5Z5EgE4UcZXaYhv9a1rpBYc87MHUCzJP0oAuZ26PKVPA2QinoTcw1x5J
	pOHLQBgNEeqBt+Sl+bp/8mcVi+nNA3doyVM4uj0M9l37qDMYbjMaKNTARfQehOGOAvxx9fW0ZB8S6
	TvepqMug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVTpB-001b4S-TK; Fri, 24 Feb 2023 08:53:05 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVTp9-001b32-DE
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 08:53:04 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-536b7ffdd34so263015147b3.6
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 00:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WXBxCzUTwUkY9VpXwOuTsg9QsDGpyRlggQ0Ehs3LnAQ=;
        b=kLCBct7OJ0ZWzc41yyFNoAbZU/0AeYHVz7PrnBKPVpdqsXs2IAdyj+vQZ4TlLmrVwI
         weqFuX+933EX7S14S/LlRbwYOj0fFXjgMSzRLlN69zyC1b53+Gb1kHUBmbSLcPTaJfSL
         mpJY1tS03b3k21dWA0+dIK2361RNm6DE73/5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WXBxCzUTwUkY9VpXwOuTsg9QsDGpyRlggQ0Ehs3LnAQ=;
        b=WmmgNvD6tVyBSfWNtUDnxDBFkZw140raGTpKy2wYLgr00ROLRzNItTkxQxAyhBUACE
         OwmQjeWDf6xrYybajYBT977RmeGDVcUNakBE3WEub9SRPP8h6mJavbVO5qvWibD3ijCU
         2Y8lLtSr443hk+y0IKpIw7CvdA+GREIc7+dkFpHAEGMG9E1W5bQCPPhFhNqYMbaGhcB0
         XMTB27MOA8MGjkk0gn4jQXYMdfP/bxUVv+uNt7TTnhwQx5sgSp8TJrqp8yHbDjxbd8du
         3+S2X+YW1kad6RxXAwdKF0tuXa4ivvPgLjJpK4YwPljV2T/HM4Xt8h9eqkbvlcW/XI4+
         XV6A==
X-Gm-Message-State: AO0yUKXyCUnQ9+PfxTAb4U5jJQ/xlLcH5JzDwjmmpussH91dFn94TIvX
	BCHSbjaYbJOxu5LxlrYEb7CK3LjC2yhnZb4pRW+1+hOCpUHvmh6Q
X-Google-Smtp-Source: AK7set+Ee//aV+bgfKyyjEpjRL0bSpqErjnIpTNSDdx4FSfXGZbHvCA4NH6lrLlFfb3LI0RYGdapOLHeJoNvs/rJzp0=
X-Received: by 2002:ab0:5550:0:b0:688:c23f:c22f with SMTP id
 u16-20020ab05550000000b00688c23fc22fmr3805805uaa.1.1677228765555; Fri, 24 Feb
 2023 00:52:45 -0800 (PST)
MIME-Version: 1.0
References: <20230223145426.193590-1-angelogioacchino.delregno@collabora.com> <20230223145426.193590-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223145426.193590-5-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 16:52:34 +0800
Message-ID: <CAGXv+5H7ADKUu1bsGrF5F-EgJBM6WW0N+AFw=m+hH_00QGHDew@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] arm64: dts: mediatek: cherry: Add configuration
 for display backlight
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_005303_488071_3DF8C582 
X-CRM114-Status: UNSURE (   6.88  )
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

On Thu, Feb 23, 2023 at 10:56 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Configure the hardware PWM for the integrated display's backlight:
> all Cherry devices enable the backlight with GPIO82 and manage the
> PWM via MediaTek disp-pwm on GPIO97.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

with some additional patches to enable the internal display.

