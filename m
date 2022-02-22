Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EFAC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 02:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yoy2JGV/eE9+EX+iYZqmccWEGUIZjbQa+tPWDmxIgks=; b=EZK7jE15gOoycQ
	ztWh1N5VBMLy3O5GaVXmYizPuqyFvIYu6kcypJSQaURLaJHlCVmXBAYy5A80AIf7RjN62ieEvfaXb
	ylGf+KKrrGedYAvnL3D1cLaVfRAVu+BJl64xCPbfORO3j86aFtM4/pXce581DSzfxxHTD+nGiPrnY
	d4ajT0xPrYKVPlRze4HqsJmueJLDm/+5JLf2qtzoDUdlFxC5MVdBMHu8GH6tpbhLPeQU7gX9RmRrL
	H2IeRtlH7CTauJDJUNLu3nt5wpZv97QhkF4a/V1V7sGvOxTX1hRQLQxuYT73UpWH+3P5ezrbsPgsz
	COhV0IRJpujUQrsvn6VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMLKV-007mmc-Dc; Tue, 22 Feb 2022 02:55:07 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMLKI-007mki-MI
 for linux-mediatek@lists.infradead.org; Tue, 22 Feb 2022 02:54:56 +0000
Received: by mail-yb1-xb29.google.com with SMTP id g6so16783163ybe.12
 for <linux-mediatek@lists.infradead.org>; Mon, 21 Feb 2022 18:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pTWIyZP+k2rrcUY6YOsZs3zseacI9EWGSS4sqz8sNKo=;
 b=FlXakkD+veWuWTWzUSD+2VkyDXMB+4bB9g8EA034TbiDOBbKPBTPGiqf00xbHyAj+R
 1+JmVDdBYIm6fYnXMzHNeMJbj1npKms53i7mKbDRaUGMV4dgh4g9QZbgGVgTK3biZ7er
 XMGqeD2yf6pnwGr1mKQMj+vpnpmSsvcHkIdOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pTWIyZP+k2rrcUY6YOsZs3zseacI9EWGSS4sqz8sNKo=;
 b=qZM5/5Cm5Ax5G0/4KmsU0f6Q25Pdl/ydB0FjOV4/Nl+d3wy+BboPNi1CxpX1MZrQk7
 dpeTvvfNysfP/42PVfkU5DVtbjtq9RTvhmq5YcFw6mGvfv2Qu6ABUGni7sCKIoEt3hWQ
 K9/FHhXrmUOgaWWRQidbLqX9+F+GqQZhT674J70av39F73wpy2JDK3llJUPxKzD3FkRO
 R3a3oVs2FUOuhbcgCJCr0jEBlt7NN5D0FXSNBSVkOZ8rfuhhC7e8p16Rr0k2XhPJdYX9
 OGMX3VCpW9aNFyJLiCvG73mM6CLi/ZNx38D174BD6AwvP3+blub4laRVfyQ9L2q77F+I
 lH5g==
X-Gm-Message-State: AOAM533TEWHNobgYPmGeXp0g0UKY0CR8l8U4e95I9BP4w/LoOvQaMRcl
 gmu1KvGov0aiey2X96zx1zpBK0EdUMUNpuP0bNmCAw==
X-Google-Smtp-Source: ABdhPJxXIWOV/8KmJIE6h3WY3JKwFygbyCz14qlx7kc+P1HhRD+kKQCYKOodK7IlxfG6jXwUsmQnJtv3ciFVybw35TM=
X-Received: by 2002:a25:2393:0:b0:61d:f1c0:a779 with SMTP id
 j141-20020a252393000000b0061df1c0a779mr20155835ybj.461.1645498493375; Mon, 21
 Feb 2022 18:54:53 -0800 (PST)
MIME-Version: 1.0
References: <20220210141931.291712-1-angelogioacchino.delregno@collabora.com>
 <20220210141931.291712-6-angelogioacchino.delregno@collabora.com>
 <CAGXv+5H0OkMk=1MZH3jCFSZbauJmEcgFADfDXDPf2r1wrp8wCw@mail.gmail.com>
 <211bd3ca-f786-b161-6f3d-dc6b8471ffc7@collabora.com>
In-Reply-To: <211bd3ca-f786-b161-6f3d-dc6b8471ffc7@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 22 Feb 2022 10:54:42 +0800
Message-ID: <CAGXv+5F9tdu=K0R1QGT-wj5zX-der+pxP5aWA1zcpGBmH0gUjw@mail.gmail.com>
Subject: Re: [PATCH 5/5] pinctrl: mediatek: common-v1: Commonize
 spec_ies_smt_set callback
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sean.wang@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com, 
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_185454_744792_A3D10746 
X-CRM114-Status: GOOD (  15.68  )
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

On Mon, Feb 21, 2022 at 9:40 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 21/02/22 10:58, Chen-Yu Tsai ha scritto:
> > On Thu, Feb 10, 2022 at 10:21 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> All of the MediaTek pinctrl drivers registering with pinctrl-mtk-common
> >> that are offering a .spec_ies_smt_set() callback are declaring their
> >> own function which is doing exactly the same on all drivers: calling
> >> mtk_pconf_spec_set_ies_smt_range() with their struct and a simple check.
> >>
> >> Commonize this callback by adding the ies and smt structure pointers
> >> to struct mtk_pinctrl_devdata and changing the callback signature to
> >> take it.
> >>
> >> Removing the callback and checking for the existence of the spec_smt
> >> and/or spec_ies data would allow us to staticize the function
> >> mtk_pconf_spec_set_ies_smt_range(), but this solution was avoided as
> >> to keep flexibility, as some SoCs may need to perform a very different
> >> operation compared to what this commonized function is doing.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Hi Chen-Yu,
>
> did you mean Reviewed-by? :-)

(facepalm) Yes.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
