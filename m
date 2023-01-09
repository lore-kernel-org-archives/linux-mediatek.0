Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABCCC5479D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 13:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qnppp6O9rdKqbwFnY5I7NEyC+PLI49fpb8XjPx9K9kY=; b=i0cNzfZaNDiRk0wxJRPcxd32vq
	Lp8JQvvGEtl8EY6BEUWEq9y6cCmHgJfYTf/HrpikfMv0glU51ZD6+WzeCVrN+uTOhJ59cFKBeFuKp
	gtCTMeqivmf2d6v7sAUaTiXGL0e2glCNdzNWDsZe7yUsrD5G6FdX5gvHFYoDh3m/fQ//WB+t4AxE3
	eLV9lzFGu6hMllcDXS6+OELxsg5Z/QGXTVedTRuZ2VmeMP+oWCMqJxf2UJ66kOlQkRmUCxo2O01Lu
	Ec9j3T1zSCbY68r/z4XTT64azLjFcDF3LzfuDBnHO+Y4vsFIHWKnULpLiw6qsP2fPKoAWDSHBHn2c
	Z9TqUZYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEsXt-001jJk-TO; Mon, 09 Jan 2023 13:50:37 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEsJU-001ddL-48
	for linux-mediatek@lists.infradead.org; Mon, 09 Jan 2023 13:35:45 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 16so8561445ybc.0
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Jan 2023 05:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qnppp6O9rdKqbwFnY5I7NEyC+PLI49fpb8XjPx9K9kY=;
        b=X5KBMlY+l3uEKb3KlAV/VkLeIZQlibfQI7xC0OEIMJWiX1pzgdPRkFkUDfldoqejWP
         qx3CpUdKYQJE9qqkyYEgYRUJMr/qXageQlaPEuyS9VYuQgL5KWNdWEa7NpUsSY38jb35
         kpsJLNys+M8NNRoeLVFcOhtSKnkC7yA3/qIkNNyINYnszPTRYMZmtjeu4fHqk98mBdlp
         j2kbOVve4XGndCbLypd4+p3QK1xG0dxBrG3FmZkq/hPKjzULYboVBM6l9imslaIyZmNW
         J5w/fiIT35b/v3j64NyNZeo4qNF2MkgGdZNyFoOF/2rfcv3v0ScaukX2Uz4/pBnxuzVQ
         d8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qnppp6O9rdKqbwFnY5I7NEyC+PLI49fpb8XjPx9K9kY=;
        b=uP4ZTEV4GT6L02EnoF0zifHUbs1p2xDaQ8BL3h0C/aeGbzVQb1pcKiqBFeFXRapZ81
         GCnMUkgyPzT7KNt8bddyRqNc8qAvqI4OofPeOfLa1k4UIfads31wvyvZGLXLQ4D1Rcmd
         pkVMQpnYTug1xDYoix/Gpay4MJzphQukRIoCbawCXlJdcbFrvuu46WKoly1a/mkCFmS6
         ePCIXqTRySozYzwxh+lXuhtZW5p9Vlso/asBJ5G9xBmtmpi0FHi1uEO53azIsEXK3L5A
         i3ph4EDcrAeOiRgAMnotr0CocT1rs2h63Or6jFdEPFsWZhc7vsw5d857d6ZPApzbwZ2+
         jB+Q==
X-Gm-Message-State: AFqh2kqTYUECNrMLOzL+OZnozkw12bSMnRZ9wkbdsw7/JYkbiww1oUC8
	QHZvHFmxfHrjZxUlxcNRuEug3rluN4SkqrV0WXKW3Q==
X-Google-Smtp-Source: AMrXdXt+flubROOHapYHT2FaRO7FxPa9Na5CMrvvqi4lErIiX3EJ1CN07iHonh9qeMFuiACLFZuGrIn3WqgqO1jsWJs=
X-Received: by 2002:a25:911:0:b0:7bf:fd02:6dbb with SMTP id
 17-20020a250911000000b007bffd026dbbmr55958ybj.341.1673271342147; Mon, 09 Jan
 2023 05:35:42 -0800 (PST)
MIME-Version: 1.0
References: <20230101220149.3035048-1-bero@baylibre.com> <20230101220149.3035048-5-bero@baylibre.com>
In-Reply-To: <20230101220149.3035048-5-bero@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 9 Jan 2023 14:35:30 +0100
Message-ID: <CACRpkdY-VqM_mzgJ=n9fEtFJD64EBie1EQF+8Bk5iLE68mCnSA@mail.gmail.com>
Subject: Re: [PATCH v7 4/7] dt-bindings: pinctrl: add bindings for Mediatek
 MT8365 SoC
To: =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de, 
	maz@kernel.org, lee@kernel.org, matthias.bgg@gmail.com, 
	chunfeng.yun@mediatek.com, gregkh@linuxfoundation.org, 
	angelogioacchino.delregno@collabora.com, allen-kh.cheng@mediatek.com, 
	nfraprado@collabora.com, sean.wang@mediatek.com, zhiyong.tao@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_053544_206281_8DE94E06 
X-CRM114-Status: UNSURE (   6.95  )
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

On Sun, Jan 1, 2023 at 11:01 PM Bernhard Rosenkr=C3=A4nzer <bero@baylibre.c=
om> wrote:

> Add devicetree bindings for Mediatek MT8365 pinctrl driver.
>
> Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com>

Looks good to me, do you want me to just apply this one patch to the
pin control tree?

Yours,
Linus Walleij

