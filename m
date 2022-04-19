Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBC8C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 05:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9yY+QimW7iHPJdFMyS8MHA5bA9Ht3M7QqHNAT5VHafI=; b=fu/yboRU2HeZY+
	vo4WqBK+Z0V2ubHMbbRnwCS+925ss4XBDR8fnZjWS03RhQTPFyEO0I0zWcAOhL80DmlNgueBZP17F
	vnEc6hHhLaw472iSGDUIvqSkTNYkyvV+DOu2GzgaXD7LiK6JEYCiio8+P1mLnPMSgIz02CTwn47J+
	ty7AtXzG9J8xwcyyanbYlOSTI++jDBDD4eMB3nzGLScY+Mn285yT4c34hQmH3DZIB33vwrP6hJiWb
	YR7Ta45WFEkWfEspwmU3fN8oAZlWjRX2HMzutGzivt7d4z3yP+MSvAB+xbaKthYsW3qxTEXM34dzC
	N+EPsIB9pxkyhocmtCpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nggs2-001dnb-Pt; Tue, 19 Apr 2022 05:57:50 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nggrz-001dlY-Pn
 for linux-mediatek@lists.infradead.org; Tue, 19 Apr 2022 05:57:49 +0000
Received: by mail-yb1-xb29.google.com with SMTP id j2so29286550ybu.0
 for <linux-mediatek@lists.infradead.org>; Mon, 18 Apr 2022 22:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s2Mq/KXo85I/OUkWdk3Gw91RvgR7MItesWK3GhJYw2c=;
 b=W8YN/I6gYh88jAVMIihLdgPNL0d595w85B0bL7H/J/0P/ofL9dUZ/FBBHUkwKWony1
 f4A/TTKiLVqKO5pelo16M9HF5hB6OZ6UlX8RcpDhJxB6eR7D1pIiV+n2P8lqTNL52FiS
 1xuVeivp+Zb50XAJLeqP8h9VeuekXid5cqUwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s2Mq/KXo85I/OUkWdk3Gw91RvgR7MItesWK3GhJYw2c=;
 b=1Sk3BWrYx4UzWDzTm95TgReVkNJwNUdVrdSVAjKnzhs4psEQ2L/iUBEgFX8XwecxWv
 Lk2QuS6jjdPg0Tmbl1a8ZyVSrU/LN0xb9vdrN2HTpiCBCp1kMhAwOFZHfO6QGv47/CS6
 n3Qvs3uAf/nimlxPv16J5w79N+BF7KFJDbJU7oKDDFK+yP+g0JQ7PExtVJ+rfWrDUJFE
 JJlAREZSEVDmXLrJudhXM0IkE2jsDEtkebNY7M6/w/r856LvcumMGq4TmMg41aB5zDKd
 LPL1jKFLQvIRvarA8sGPOTdSm7lnCH0uJcAfIL0JwDEE43P8ZtkaOhRHWJgyvGu/p+3n
 ha6w==
X-Gm-Message-State: AOAM533LzyhLpZzPOJSe+HrEupHO3Hmo2Up3nNQ30vEt+n7TQp7XwLPB
 UuF6cZEaiJDWjT96P079ktdV5SGBMnH3UoC9HYEB8w==
X-Google-Smtp-Source: ABdhPJwYYcBxOtEG5s9zmIzc+xRZY7jcR0X2MW3EEbzIamXgJPjnppX5NLhhFjn6M6KCHWX9mrjp8DSSyVdk3/Ca/cY=
X-Received: by 2002:a25:8d90:0:b0:634:7136:4570 with SMTP id
 o16-20020a258d90000000b0063471364570mr13341740ybl.582.1650347866332; Mon, 18
 Apr 2022 22:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220418132154.7401-1-rex-bc.chen@mediatek.com>
 <20220418132154.7401-3-rex-bc.chen@mediatek.com>
In-Reply-To: <20220418132154.7401-3-rex-bc.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 19 Apr 2022 13:57:35 +0800
Message-ID: <CAGXv+5F027EsJCG4zQarcoqCR8S4tew1n1DjeqU7_+HOzmZs2Q@mail.gmail.com>
Subject: Re: [PATCH 2/7] clk: mediatek: reset: Rename reset function
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
 p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com, 
 chun-jie.chen@mediatek.com, yong.liang@mediatek.com, 
 runyang.chen@mediatek.com, linux-kernel@vger.kernel.org, 
 allen-kh.cheng@mediatek.com, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_225747_905791_F89F8F37 
X-CRM114-Status: GOOD (  14.25  )
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

On Mon, Apr 18, 2022 at 9:22 PM Rex-BC Chen <rex-bc.chen@mediatek.com> wrote:
>
> There are two version for clock reset register control of MediaTek SoCs.
> Since MT8183, the version 2 is adopted.
>
> To make the driver more readable,
> - Rename them to v2 for MT8183 and v1 for previous SoCs.
> - Adjust the fuinction order in reset.c.

I'm not sure that the renaming actually helps, since it is not given that
people outside of MediaTek would know which chip use which version. The
original name of "_set_clr" at least relays how the hardware works, which
coupled with the register naming in the datasheets make it quite obvious
if the hardware is using the "set/clr" variant.

On a different note, the v1 hardware, where a hardware bit represents the
state, is quite common, and there is a common reset driver that handles it.
Perhaps that could be reused instead of code duplicated?
See drivers/reset/reset-simple.c.


Thanks
ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
