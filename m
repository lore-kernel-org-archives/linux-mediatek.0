Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1546FC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 23:54:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8813261435
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 23:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8813261435
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vF4iyXYnW6kJCZm+l1qKfbUEhx/7bW7dEJOBqTQiwrs=; b=G3S8DL6OCtfBJfHGNLlIdGKQa
	vB3IP+8irdB2n36xQc2E23MQAMpX2YNsktm04kBvEBasxgexTUj4sKT0DcJj2TrO93VdkigUPgRjs
	SvFbnT/B6GpCpLUuqL6nz7rb9QXUKGmeBR8uVEC50FRdDd7qpcv7w+7Br5sQbC935GNiS6prpP+QL
	xgt1R0QBsUDAyq1vc2MgoH8P8sQt8e66/IuuvooPsYxlaO4qoRX/IU9WUmtfLu7VLD0GbZlG2eRH9
	l4f9PvuwjqMYuUhnQryb0LoxF6dKlrFie/jOF/XPghQhNKjFYfNyPGjDpR3PJXiNDQafOF19g8uD6
	rDtQhYlbg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZMft-00FPn5-Vx; Wed, 21 Apr 2021 23:54:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZMfi-00FPkg-7G
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 23:54:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Ha9Jxb8RRWJm9u6+BE/jlSRSSfMQmc0ncpQ85OvWeew=; b=EQMRx8q4m8e5ZgiuWqo+rV3RmE
 gVwS1Xxw55bfOP2euvsBLds5qm4ZNxZboTEyhD+r/BYyYXbKcwgiQ0quiz4I/m/6E9SgjZvBmpp1B
 SBYI3WjQcCHZQpHK77J/gFW/vN6tgAJHar+JRApNcTOsbeW1GJmW9uc0p9uAFLyKNMlJ2gl88A9I7
 KXT3wsA5rQknFSffwyDRMmnL2WWGGV79rAOiPK1UlFH5vOksUcoQK99TUv/ODP4SUWE5hJZjyd+Q3
 NBhP4XGs2zz0GHTW5WcikjwJZh7I0vPEcqnG20/WJIiewkyRU5bRsoqB5084DMybF8d8htIQ3VXLA
 MysAiWQQ==;
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZMff-00DGm7-Hq
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 23:54:16 +0000
Received: by mail-lj1-x236.google.com with SMTP id z8so49690700ljm.12
 for <linux-mediatek@lists.infradead.org>; Wed, 21 Apr 2021 16:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ha9Jxb8RRWJm9u6+BE/jlSRSSfMQmc0ncpQ85OvWeew=;
 b=M50X8kcpN0JZxJee2WEC7hWKQL0fYBwjBzseQ1GefKJtd3isMQEL5rIyivhKodzsOE
 +jbXIkBkGJmO0NYoUS/5Ts4KaIZXB6BQsnP7QKmFwHTHedhE8iBorxq8C5MX3i8iD8fW
 sUSEWlmlyZMEQFYsijMDfiLsCDxtlpUxCzKZKOzNZUDzxelFut7iGeyfvTNqaXkdIP2/
 bNN/fRjFYVPRoxPMG79suGFZ+R54dzIHJccxLrZFSCe5rlaQ21rotV83aJvjMS8a/ad4
 Ugm4PUZJaM8cIEVW2TEPWZaFAWn0Wi2rxQlEvrQ3lHyP9ecDdFc6haxupHcWi0ypD+1p
 8WJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ha9Jxb8RRWJm9u6+BE/jlSRSSfMQmc0ncpQ85OvWeew=;
 b=g2baxh9Svr33zx2tJiFDQsXoE7Vta6qgLDc73LA4m7I1b3W1UYJ+y0u9sI9s0u5n/D
 a03DNcVIYzrVaxJgp8YqdpNuYKopm154n+ilxmeoVoTsoXmCfcfyBaSWeRtDMiCHhgRB
 s+x8twfn+dKJZddwOP8x0PVR+G2eKq+QNfACrfEVDOhk8vDmfN8O/w8qRlWmwJvgQuoN
 Sqfb4fxlZd8G2G6KeYS43HFl2vt7XeHELPNua5BKOWdvBFbKXPBghQUSQ+kFM9KfSYdH
 RSjVvqnnKIshQ7Z/bBhtCFhlpbutn/9JtpPg4mlR2gBxkiSo5dEhPGUnrlcRgQV+wMvp
 E2Jg==
X-Gm-Message-State: AOAM5324nelghUtcXR+Bpu6sOu6IJ+ojc3yPRhKele3D8uQo4Uyf5ur9
 pliv/Ij716rT32iCfO0beMCQo1qeiVYVALf3yBOCdQ==
X-Google-Smtp-Source: ABdhPJxXbb75aL5nQVGTClsRSQ0xMrdu07CRAlP8Af8vi1m/elQpncbyJdz0Xi1ZLRYaId/J1dJqb2gXdIhWm1JwzMw=
X-Received: by 2002:a2e:8992:: with SMTP id c18mr557921lji.74.1619049253829;
 Wed, 21 Apr 2021 16:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210419093449.3125704-1-tzungbi@google.com>
In-Reply-To: <20210419093449.3125704-1-tzungbi@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 22 Apr 2021 01:54:03 +0200
Message-ID: <CACRpkdbhTbskkxkVo4Jw2=KDapytqw=QJ4kmRtqk=bHhgKUpGg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mediatek: use spin lock in mtk_rmw
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: Mark Brown <broonie@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_165415_642040_489DAF2A 
X-CRM114-Status: GOOD (  10.87  )
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

On Mon, Apr 19, 2021 at 11:35 AM Tzung-Bi Shih <tzungbi@google.com> wrote:

> Commit 42a46434e9b1 ("pinctrl: add lock in mtk_rmw function.") uses
> mutex lock in mtk_rmw.  However the function is possible called from
> atomic context.
>
> For example call trace:
>   mutex_lock+0x28/0x64
>   mtk_rmw+0x38/0x80
>   [snip]
>   max98357a_daiops_trigger+0x8c/0x9c
>   soc_pcm_trigger+0x5c/0x10c
>
> The max98357a_daiops_trigger() could run in either atomic or non-atomic
> context.  As a result, dmesg shows some similar messages: "BUG: sleeping
> function called from invalid context at kernel/locking/mutex.c:254".
>
> Uses spin lock in mtk_rmw instead.
>
> Fixes: 42a46434e9b1 ("pinctrl: add lock in mtk_rmw function.")
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>

Pulled out v1 and applied this v2 instead, thanks!

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
