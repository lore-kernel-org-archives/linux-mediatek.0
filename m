Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72D1C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Jan 2022 05:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ji1T5dk9kGhCLXfgAsPi0Vv0UTXKoiDQ77fXt2WU1Mc=; b=3pLaeR8OVBMrOw
	gf170KQDbgtScHQVFY5Veodc7mx9GDBCYUV1iKWa2U46o+0RiirXKmZP/dAXAxkvQHSlBBcEJ01dD
	B4KqKVo2V5Q6AjrTrZp9OMT+UidrWRoJx+GIguaZjHtHLXbS4xCYnfEWZDSeQzKukHjDOpbyEIbgB
	0bwtKoy1lCBKsDS6NHYObZGLce+cI9U6GeNyJP+VjmPVtxxEOT32OJqEVb5DDaWAqHeensZUdUEuV
	LvbNs4jwnPT1ZXWjN+HA/xksj0Ck+tFZTsYXFWBy5pj9CuTsIAoWqW5h8tzJWKNOu5c4mrBhJHX92
	tKQy/0bzR9lt0WPKKaPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3tF0-007YLU-VD; Sun, 02 Jan 2022 05:17:10 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3tEy-007YKK-7f
 for linux-mediatek@lists.infradead.org; Sun, 02 Jan 2022 05:17:09 +0000
Received: by mail-lf1-x134.google.com with SMTP id bp20so68348648lfb.6
 for <linux-mediatek@lists.infradead.org>; Sat, 01 Jan 2022 21:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9OUJm1l1Lkz1YaEdfh/UEwDaTVMcLzVdwO6tOQfKl7o=;
 b=EhPaLrzIg6G1hnSZHwGOBFaFHxH4UcQg44k8y7RnCfMMJ26s5yYuh3KY+LGCoUO72S
 zJ6UWj/g3J+AduMZdZqDx9LQwmBSwgLNID7w37AIoSfThf/Id7LBJF1IqdhQF/4U8IRB
 YyxQq5z7zRdxF77bI6jV79EMMjbhK3HRul9oK57hQO+cDjpiN/zUwHELKzk9UcWHf7fx
 dncoZMGHqFNmmiLDT/ehp5122zyz/vLMKwkgXoUhuRhVC2B55nmx/oqyLkdIkRrmPKp5
 1k64Q55v8bTDmR+ZAnkBIWNQ5fi+1UCfb8LXztefaq7WGWOkRL0Q8P8TIPqxSD2AuWe4
 d1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9OUJm1l1Lkz1YaEdfh/UEwDaTVMcLzVdwO6tOQfKl7o=;
 b=J50fXB62ABjvT4wB+woQLupyzWV+RfAztdi8x1YlH9uEVAtZjAlygBGHGB2aLN34rk
 pasOEGNhP3NDWuisMgdXnatc5JHJ71YOM2F2H3FmnsAaFu90TulvfkqTxtkxwnQQIP6h
 97/nwmrsYng5gJbReEE7PWhRTtpCjJ/eq1WvShaY5EZCWrhCOoK4mUDhUnQroPxIgzyL
 ThHve5KGvNv8ScxqGM33cU0gI4Z9QV+BTCDgzAwLkb3fRYsh/dbTAFVvFk2c3pRETr0D
 ZZXReUcXvcbaCNKeuvhUP+FmSQltJkp4AWwyaHqL3KJRYBRrvg4LzyYEyHvwLFJO2soT
 YYkw==
X-Gm-Message-State: AOAM533b4J9qwiUuQtPkyS8EurDT4TqeOzMF9iMiZS0OAhVbk8+Vr7Ey
 bgTh5koKcb/qLEH+J97g3WDgRz1/h1JsT2xxtyHDFQ==
X-Google-Smtp-Source: ABdhPJx1AorkEc1HSDDatFay0OziPayU+K/x43xNs6lLbJwcnlEBOfMLwN9/X8ZQciCUI5gZ71NO+Ml7PdU9DJ0OS/g=
X-Received: by 2002:a05:6512:39ce:: with SMTP id
 k14mr18954362lfu.508.1641100625527; 
 Sat, 01 Jan 2022 21:17:05 -0800 (PST)
MIME-Version: 1.0
References: <20211220121825.6446-1-tinghan.shen@mediatek.com>
 <20211220121825.6446-4-tinghan.shen@mediatek.com>
In-Reply-To: <20211220121825.6446-4-tinghan.shen@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 2 Jan 2022 06:16:53 +0100
Message-ID: <CACRpkdaGui4ULm7E7Y7YFLZ1BXKfvKKqv4KC=eTMBDExJThPdA@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] dt-bindings: pinctrl: mt8195: add wrapping node of
 pin configurations
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: robh+dt@kernel.org, matthias.bgg@gmail.com, broonie@kernel.org, 
 bgolaszewski@baylibre.com, sean.wang@mediatek.com, bayi.cheng@mediatek.com, 
 gch981213@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220101_211708_391708_BD577E11 
X-CRM114-Status: UNSURE (   9.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Dec 20, 2021 at 1:18 PM Tinghan Shen <tinghan.shen@mediatek.com> wrote:

> On mt8195, the pinctrl node has pinctrl groups to group pin
> configurations by users' need. In each pinctrl group, it has
> subnode(s) to list pins needed and pin configurations. By supporting
> multiple subnodes, we can configure different pin characteristics
> (driving/pull-up/pull-down/etc.) in a pinctrl group.
>
> Update pinctrl-mt8195.yaml to add subnode in pinctrl groups and an
> example to illustrate the usage.
>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

This patch applied.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
