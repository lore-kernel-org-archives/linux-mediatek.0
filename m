Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B8EC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Mar 2022 12:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lnId4QodownrZbOForKQ54kJr+mUfBj7Y7VHPuQJtaQ=; b=1lmrLr+NXr0iaa
	9Bz0T1CF/p0POfs85mdWgi23pjxUAklIbC5989eUmDavRWQUWz8+Op0ZhrsDmzfzWAA4AeHFX88FD
	Qn17NiKA9xZFsmr2oO87JWQEQdALlTGdpP8LHj9idfk7ghmKjgxk8UA+H1KnyBLDv/gih353A6Hmg
	ThYy+Y0zSrAN4jv7IhrDxgAiuqDtT0Y460i0eHrVkwuKCN3+ipkDy4KhqEFEDAfCJlhsYPq+WZA28
	ojQSs60gcvZfYHn6NftahipCvtaMAgI4wUnfPfHcFFe3UKb9s0uVrgPkQBL6ESlHxFSnM2oyTECr1
	kBoyaqAtPrk52Yry8Smg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYRaP-005V72-6a; Sun, 27 Mar 2022 12:01:33 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYRaD-005V4y-0W
 for linux-mediatek@lists.infradead.org; Sun, 27 Mar 2022 12:01:22 +0000
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2e612af95e3so122330057b3.9
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Mar 2022 05:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+JLBatQiTjNxucxb+AAO5n2LSgO+yRQ0dxeApnUF+sc=;
 b=BWL6eg5Qoeih5liyNKTxPU8t35qf9FMH6Hq7U68Y61Anl3fyA1H2eJKBbM+xexmlxF
 +aL7AzpTyJTEDG+vWVy9DTMPpBcG70TJLJhLOpgwLdeDjLwZCl+wjrjvnyE2ZWdXX0Rb
 upPC0UJywk2d4Zfb1EpDIFdq2unL30jj7pOUPgqNrW0QWcgMOiGgHN375QAi7VRBhXfX
 2+kpnaDxPiUNhOjlubGPDH2RXCDtMlLFjbB+JfWFgo/q+5wz34B18XlXUDJbWYI3IrZ0
 Mxc0KY+9A/mCwEc9i2w81HkHj9EHIA79PIgXoKL2bqvYfI1Xae4uLOJD//so9x5OiKqX
 yGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+JLBatQiTjNxucxb+AAO5n2LSgO+yRQ0dxeApnUF+sc=;
 b=17nnS5pvS83mhkxkHI2+a3xhRbCkFrzDhcD6CzhZRX+sAZRP9mwhyOxnmAUWF1W2+A
 a+uMm+56x/bsIS1SVqCjdn5PrCkku4/qDrLsXi/cXt1TuCH3HmN37J+FXehkGVnkiPb4
 mn4gYyyel1qghb1eeKxJ0sAxBHOEYWjxJRwUoWKiXs6yayWuZiDLFNn+XQgEYab3s5Xh
 hTAo6cSBlzlB4PKKoelIqjgLj+E/iUux57xp9dfgB7MfZPfL0Dh30Hovu9bnyztY7Lzo
 g1ZdnuJok7TxnF51Y3eYvztGPnqm8R/a6GEATyCTpQIHOOP3L2OHcWwYzNJTn8VHUryU
 S/+A==
X-Gm-Message-State: AOAM531l/iGYVBz6R+vRvg+GxJmStoEZA43wajdu5zLsUvEKT8OMAtIj
 8IVjoYAEAU0uVwT/vhwxkjXgnb1QiFZY26dxX3Ievw==
X-Google-Smtp-Source: ABdhPJwSVZimEgxSRjV+BLp7lkLZBgy1/Qoke1+kB8RxAxMHiVCaNhApabi0eLeIBCfWUsAR91rj1IwV7cn/PgMj9zc=
X-Received: by 2002:a0d:d68e:0:b0:2e5:9f48:a24a with SMTP id
 y136-20020a0dd68e000000b002e59f48a24amr20897888ywd.151.1648382478791; Sun, 27
 Mar 2022 05:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <202203222145.UcCrXHfm-lkp@intel.com>
 <20220322130308.GA21877@65fc916127a5>
In-Reply-To: <20220322130308.GA21877@65fc916127a5>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 27 Mar 2022 14:01:07 +0200
Message-ID: <CACRpkdbiUDREqOe6C_AAnG7vpeMCgMvaOKknEXT2B0yUWKbyzQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: fix semicolon.cocci warnings
To: kernel test robot <lkp@intel.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kbuild-all@lists.01.org, 
 linux-gpio@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>, 
 Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_050121_101587_DED00A35 
X-CRM114-Status: UNSURE (   6.87  )
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

On Tue, Mar 22, 2022 at 2:03 PM kernel test robot <lkp@intel.com> wrote:

> From: kernel test robot <lkp@intel.com>
>
> drivers/pinctrl/mediatek/pinctrl-mtk-common.c:171:2-3: Unneeded semicolon
>
>
>  Remove unneeded semicolon.
>
> Generated by: scripts/coccinelle/misc/semicolon.cocci
>
> Fixes: 156f721704b5 ("pinctrl: mediatek: common-v1: Commonize spec_ies_smt_set callback")
> CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: kernel test robot <lkp@intel.com>

Patch applied.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
