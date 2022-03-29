Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3CCC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 09:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=841NPvu9IPe/bMMADv3OMDXHyjPMf4N9k0jNDDIU+5s=; b=Tr+DU8EHaeWTRP
	THFGX7X/a0glHim26ck9HLClOFQa9DZbv9T6yoqOQX0PJAk1BO/kfvbQ+3jLuevqK/+4QUukM5fPy
	taSlXeEELp/eZJ7b6hI45WKDmvtE8/qb8U0u72+Lgzk24J+iKlAdI9Uws+8Lwgxug/zypPPhUP5w5
	FegAam4H/gkYJBsO3vxYOTkWj4AJTxR073Tu0laaped41AaWXJZMEC952+WqjWW0dFwooBXwq3lEo
	oTalX7o0A9Jio8lAwULts9qQKKXQn0tjY8vh8Jny0+Y4ZnBE2XASv0dt7sTGBDQ1AVwXiG4SsCpDU
	EHwU3VT7jSRbGZGSrRTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ8Yg-00BjKE-6j; Tue, 29 Mar 2022 09:54:38 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ8YT-00BjGt-Mb; Tue, 29 Mar 2022 09:54:26 +0000
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 96F5180F9;
 Tue, 29 Mar 2022 09:52:18 +0000 (UTC)
Date: Tue, 29 Mar 2022 12:54:21 +0300
From: Tony Lindgren <tony@atomide.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Palmer <daniel@0x0f.com>, Ansuel Smith <ansuelsmth@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-actions@lists.infradead.org, linux-sunxi@lists.linux.dev,
 "open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-arm-kernel@axis.com, linux-aspeed@lists.ozlabs.org,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 chrome-platform@lists.linux.dev,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com,
 linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-tegra <linux-tegra@vger.kernel.org>, linux-oxnas@groups.io,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-unisoc@lists.infradead.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 linux-realtek-soc@lists.infradead.org
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Message-ID: <YkLXTWdZ3zASxr4H@atomide.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <CAFr9PXkgrRe-=E=GhNnZ4w1x_FMb97-_RmX6ND1vEd74_TbZSw@mail.gmail.com>
 <YkK691VG6ON/6Ysn@atomide.com>
 <CAMuHMdXDDNTgBdJTa8+H1H5v1gAarp07xxWu_E1JL8mXS8HPMg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXDDNTgBdJTa8+H1H5v1gAarp07xxWu_E1JL8mXS8HPMg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_025425_799019_D7EB6A96 
X-CRM114-Status: UNSURE (   8.88  )
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

* Geert Uytterhoeven <geert@linux-m68k.org> [220329 09:02]:
> On Tue, Mar 29, 2022 at 10:03 AM Tony Lindgren <tony@atomide.com> wrote:
> > For example, I have a pile of pending omap clock clean-up dts patches
> > posted and tested waiting for v5.19-rc1 to apply. I'd rather not start
> > redoing or fixing up the patches with sed :)
> 
> Git merge/rebase/cherry-pick should handle renames fine?

Possibly.. Not sure I'd count on that based on my earlier experiences
though :)

Tony

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
