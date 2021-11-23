Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981A8C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 03:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FL+ugFfyTEVp/K9sFCjNaVswPkkaC6/n3dIdV/7g+/Y=; b=hCGPd0jkZCf3gM
	r0TlsbV9e7kCaa+MajpCz9gLqt9miuJ0zxSt6S1SKtAF4ZZzq6Oxz3M72xsW6voJSRbidQINIK3Uk
	5M7iw7kz5QNYx/avd+Z21WnJb6RevOh0xLv76a9mZcphC6Qd/apSYOtH5HqtGuNAksYkKBg7teHSt
	bCeLf5kKD3YmoWRHzdth85eRJapZy6P6Y8UnoMIxRiycqrSoxb1jjVD5ljrxVDU0LJmk575qPhmIm
	V31hVr2C1/dBO8oiFuP2N6Uc1XZjAC14V+8FoPjD6pfNYPcgUKc5mVENrYkDqwQ+MaO0ZDMij3+b0
	W10AR3t5xIuFsOEeeG3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpMF1-000hDI-GB; Tue, 23 Nov 2021 03:13:07 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpMEn-000hBu-Qh
 for linux-mediatek@lists.infradead.org; Tue, 23 Nov 2021 03:12:55 +0000
Received: by mail-pf1-x432.google.com with SMTP id c4so18027166pfj.2
 for <linux-mediatek@lists.infradead.org>; Mon, 22 Nov 2021 19:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x2hw3oGQCKQYUHt6V/jeij7qOnZntnAL24E56nojTHg=;
 b=gIujpSdtAknKwM2DSCD5wuUpkhhrH097yVr1sWa5jsFkkwO6U/TMS7VEQfHoKjLGL6
 PtpPhqkX1Z7hbVNjcxu5DJd9GOmfEfVT6Y9r2uZvBxgEZPk7Hn1NmP/l+gM3W3dOBQ3x
 6vZ6SxFMdjJew9B39sgKA6TfPpnGdtqBqCme6ZdYPXOImU4zYFMu5EXhfTihw7hujNeo
 9yOb2ntl1hkTeiwd+VvHEFxRw5ul7ni5R36VPr5MjQDIDYi3ZHd6CNHZbM0+juKYrnj8
 BofEsJR2zzFmZGqrLL9fU3Fh8Bj/P/pFWHNsUpcISaU861PnqmjmVI5Y5+yWM0SqbgAW
 Sj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x2hw3oGQCKQYUHt6V/jeij7qOnZntnAL24E56nojTHg=;
 b=gDMw1Q7QM4XSB5G0FmqP/j/9pUEo+IG0Dl77ECzMFX/j3PTJYWDcgMpi1u8IO+56um
 ST+3IvGLfMn0ouDOClyHrD9Te1ZKl2pbfPoU4/FrOV60wnNC5/aBD/QJtwSciPRcMFwe
 O+BawpNVY+t6SVho2VmNkVYCaCGMVMK3F9OECKY8k1+v9LvZR/nuO3sotQUpQq0abEhE
 +h0xS7J39TO8XGnAB/EraIVxB5QEhlaqqI2S+Fzn+6WBRBy4oNxJw60GdMEbYDr/wBHK
 Ex5wVfr5Co3othZqe9Q0LTGDhT7We+2+QV0tR7m9s7TcV9vjfO76EMQ4ZXsWJslm29Rt
 Uw5g==
X-Gm-Message-State: AOAM531vBa89Y9G91amnis6WpoyQB2KHA2za4fiDMCLSx0dyHlx+0I+O
 zcSMFDxtsM4fqIKiPLgmu88B1gMr78LQYFeUEgmUMA==
X-Google-Smtp-Source: ABdhPJwMXvJBc/Q+TZQf5i18d92jX/IrYo7Qd/Ip5lemBkmdtvpN1+Uh02bMi2Upj+gk5gH0ickdapbkQ+WCbMkkrCM=
X-Received: by 2002:a05:6a00:84c:b0:494:6d40:ed76 with SMTP id
 q12-20020a056a00084c00b004946d40ed76mr1974231pfk.65.1637637169565; Mon, 22
 Nov 2021 19:12:49 -0800 (PST)
MIME-Version: 1.0
References: <20211122164644.19442-1-jiaxin.yu@mediatek.com>
 <20211122164644.19442-2-jiaxin.yu@mediatek.com>
In-Reply-To: <20211122164644.19442-2-jiaxin.yu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 23 Nov 2021 11:12:38 +0800
Message-ID: <CA+Px+wWeV=9DF7wdSyjaZKS=XCJjri1Dmpf-kfNVZOqm5fV33w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mt8192: remove unnecessary CONFIG_PM
To: Jiaxin Yu <Jiaxin.Yu@mediatek.com>
Cc: broonie@kernel.org, matthias.bgg@gmail.com, alsa-devel@alsa-project.org, 
 kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_191253_882541_C33A8BE1 
X-CRM114-Status: UNSURE (   5.97  )
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

On Tue, Nov 23, 2021 at 12:48 AM Jiaxin Yu <jiaxin.yu@mediatek.com> wrote:
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reported-by: kernel test robot <lkp@intel.com>
Acked-by: Tzung-Bi Shih <tzungbi@google.com>

Could you also submit another series for the cleanup?

At least for sound/soc/mediatek/:
$ rg --files-with-matches CONFIG_PM sound/soc/mediatek/
sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
sound/soc/mediatek/mt8173/mt8173-rt5650.c
sound/soc/mediatek/mt8173/mt8173-max98090.c
sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
sound/soc/mediatek/mt8183/mt8183-afe-pcm.c

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
