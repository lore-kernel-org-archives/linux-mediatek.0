Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80305C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 00:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wSRPqaSRaCWc48UJZZGB7NC+k2rgyBFnQHhepl6gzdk=; b=u1L7i2kqYW0xHw
	AFsCdXhJnfQdRDoUNifkI0f7Nay6IZ1OkZXIPzIpif50TqXtqA9wzEXZ08idlXg6VTQpZu7P3hUd5
	RcsDMTAFZ/JBIjwAPoEjKR+7fvHnAhINyVxcR+2RU4/vuYEWUJnuwvr4XqJwnliZ6VX+60hxcPhMw
	1dCZeQ2QtKdJN0zbzFJGNxmip/kPMB0dr3lEipstkAvgGxoeezoY7Ni5nDeYfNVUA/ocPnvXi76vI
	f8MMYPequDr2uCMpsEGAqC3Ny/v5hpUGFLWTY8JGXIwTHZFdForqZMIaj5fUuDw98P98FA3OIpO0+
	ZCKd98K9DYUUBZbYG/0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nF34H-00DrbI-Lg; Wed, 02 Feb 2022 00:00:13 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nF34F-00DrZt-5E; Wed, 02 Feb 2022 00:00:12 +0000
Received: by mail-ej1-x62c.google.com with SMTP id m4so59470364ejb.9;
 Tue, 01 Feb 2022 16:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GqllxHt7yNoWu7VaWkakCDa1qzT4RpRcgjBmYDF5Djg=;
 b=d670fUvw0MYPj7AP65Zg5wsXk1t723UvfwdMSeF7nwsVXZuEUwKQyXRDkloAalyg5m
 PRDINzdmr+XKFP9yLKnHNhUpnZc9h/muYNaX9vqgUtS2ZIQZp3Lv3Hxzj/+Ajpa6NDlo
 vDTzfvl8TUIFgMTOil6NCqy2zrmyFmDr9V2gwGQ7qE9v21Z3XWlClovac0H21dI+5diu
 EcoCth1fIHjU0o+piYxzvyHP6xqXqhIVSR4Aot2aRIaUkpHkNzu0b8kyfVrUsUbaRaJw
 Eh6GfxAGRYJ9ZU7e5xW04WjXNH7GHYkKCNnrT8KTy4BXcjvHPYLeB3TP+bwWVULhswqQ
 eCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GqllxHt7yNoWu7VaWkakCDa1qzT4RpRcgjBmYDF5Djg=;
 b=yURs4mUwNfVmt/XDA0VLcnRvb9EMLZAdDzMCVqDWyyFJoaBgiBFKiiVwqCCfmtdEkK
 2fHaofWTzBtXXtwh+aQ2sWqlO9z+O/XqlSN6HGGuG2xyfEaqL1VrBfAZKZTmMe5BZw5t
 5DpPjWP1t2I/Vu5T+My9MjirsAJiy8RYNLKd9MOrF2XexWY/3PZcVGVqU+bufsTUwOQq
 yK6TwP7wvJRV3M7Dp6t/A+vfb8VYJR5qrmnS4yZbN53JODY7ytO4cj0M0evPTv3iKhVi
 kSlMsI5xQcDufKZoLJv0BcPZQDpGfM8D3zcFBkW+TmNjEyBd9gaiNiPqd0V0DBa9LcIQ
 2eEw==
X-Gm-Message-State: AOAM531tx7ro+uo6qFGMErfhtCoZ3PWwrvboD7C2kKBhAMNDWrSZHG7g
 nFDo4a+8MckszBkqkHIDOji7Pz4sXAPJxuDU4Bo=
X-Google-Smtp-Source: ABdhPJzkU+AoivYaiO+CIbSwtDKaKtKrGb1L6g/G7HKxp0CwA2yyfw4ai/4HM+r9lTmE2r5dHKmXjqmmtuLlzBb87Lg=
X-Received: by 2002:a17:907:d10:: with SMTP id
 gn16mr18527609ejc.652.1643760008830; 
 Tue, 01 Feb 2022 16:00:08 -0800 (PST)
MIME-Version: 1.0
References: <6fc4a81f-1a13-bff9-7b2e-d5bec382cb42@synopsys.com>
 <9bab4777-3034-b789-fdf6-ca8d7e6a8c35@infradead.org>
In-Reply-To: <9bab4777-3034-b789-fdf6-ca8d7e6a8c35@infradead.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 1 Feb 2022 20:59:59 -0300
Message-ID: <CAOMZO5Aa4WxuadfoFGwwyYyD4UGPm-E258xTWU3-ozp_hwG-7g@mail.gmail.com>
Subject: Re: Kconfig CONFIG_FB dependency regression
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Kees Cook <keescook@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Arnd Bergmann <arnd@kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 John Youn <John.Youn@synopsys.com>, Bing Yuan <Bing.Yuan@synopsys.com>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_160011_244905_04246994 
X-CRM114-Status: GOOD (  14.97  )
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

Hi Thinh,

On Tue, Feb 1, 2022 at 8:06 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 2/1/22 15:01, Thinh Nguyen wrote:
> > Hi,
> >
> > One of our test setups is unable to boot (stuck at initramfs). Git
> > bisection points to the commit below:
> >
> > f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
> >
> > Reverting this patch resolves the issue. This issue persists in mainline
> > also. Unfortunately there isn't any meaningful log. Hopefully someone
> > can give some insight as to what could be the issue and revert/fix this
> > issue.
>
> Hi,
> Did you enable DRM_FBDEV_EMULATION?
> Please provide the failing .config file.

Does selecting CONFIG_FB=y help?

We had to manually select this option in imx_v6_v7_defconfig after f611b1e7624c.

Please see:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.17-rc2&id=c54467482ffd407a4404c990697f432bfcb6cdc4

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
