Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F0FC64ED8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 10:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81aqISuq2eYUnck2go8oizXxt9eqFaaUJ7kbWY5LcaQ=; b=MbdXBRhxCC1ymLtP7v65yUervi
	UrO1o0USt1whnOpFP1fVokVeHzz76g3gv7MN712mWbUhDAM2hG7pdprW7NVXCbeTqpdmbtUKHo0e1
	4gX/u+RSG6pljn1+DhV/iPcoJP464CXInITlbeTawmLjmn7/rS7fyqoNg+RgOrERZElXuqn+qKBG6
	jaiyVg/ECU/knccRSClqPVnyMokrLstXt+mhOOvDD0YQlp7CJsHVPWoZY4CM8ZDITxkT1i1y25LEZ
	lAiBCEIpjG0Z12qVp5G3q0V7uvO11INJkbhgeDW815Wlef4vQcDhqXKY60qYnqzFCgPshBpylyJrT
	ae2L3SGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUvx-001r4a-D7; Fri, 24 Feb 2023 10:04:09 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUv0-001qXH-LI
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 10:03:12 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id d7so15017712vsj.2
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 02:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=81aqISuq2eYUnck2go8oizXxt9eqFaaUJ7kbWY5LcaQ=;
        b=BBIaeUfzGQ8ePb1MEWkKRMSN306q1XdtDnvrgaXMI2a78+E4hErLx37tCLGhJSxY4A
         RMdxBfp07pBnOryIBtcyvGw0ia26eC6PpMmP3Wm0XRyE7bRga3NyH5nlZ7HkoxceIc6S
         Ybi1UNdfJUUIcirP0Oxp+u2C4gL8bYn7DmAiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=81aqISuq2eYUnck2go8oizXxt9eqFaaUJ7kbWY5LcaQ=;
        b=0gFswyxTV6g9UQDuEQkHoHZeHW7CjkX8SNZBwxXg2Li/drfrDsFmMHWkbEdjmwov38
         EbuLEzMsB/SIyVfvaGEAjb0STD/hFOg9ZFs6R/nDlaNINv/BpogvfYFJ/K8CYpYa43BM
         UUngKB8lbG+Bf9McNpFDYUXTiP+wrtaZVNFumayDeD+UQKJLa15g/5H+DmYfZ0OIyCIZ
         spBABZGniF5jjCOCjOpO9BDoj/qboerLq87RNBk6NfblQadgxAyKQjNvwx9t2gPOGI62
         9h47MQy/2ZCMUILhjqeFw0XHP2Kq9foje7Cr9dFbm0t9R6G8+WnwwAvkDUZ4TAqzdy14
         lBoA==
X-Gm-Message-State: AO0yUKXkNmIN0BvV0B6cNDLJsu+VAW3csneX4eOpqRzyzouByEsg4kFb
	yifszZlic/rVKch5Ib5lINPArCZAgIvIpq0A8sTbcw==
X-Google-Smtp-Source: AK7set+3I53BDKCorZLNVo5d0QftsqocEySXrxgfRxSbKglMQGMQLOvpEbCtJonqcgFcA2dFPOyYsedOXPEqiC/zdec=
X-Received: by 2002:ab0:53d5:0:b0:68a:5c52:7f2b with SMTP id
 l21-20020ab053d5000000b0068a5c527f2bmr4368520uaa.1.1677232989554; Fri, 24 Feb
 2023 02:03:09 -0800 (PST)
MIME-Version: 1.0
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com> <20230223134345.82625-17-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223134345.82625-17-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 18:02:58 +0800
Message-ID: <CAGXv+5HgMPvsCUWjeofYBbrGKBvP_eE70exKZ2QLRFuMvn7PAQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/16] arm64: dts: mediatek: mt8186: Add GPU node
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_020310_717159_15AF2809 
X-CRM114-Status: UNSURE (   7.04  )
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

On Thu, Feb 23, 2023 at 9:44 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add a GPU node for MT8186 SoC but keep it disabled.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

