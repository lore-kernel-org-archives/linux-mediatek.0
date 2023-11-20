Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92FAC5AD4C
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 17:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvb5F+BXAEfWD+5XFrgTY12VaeoW/tInaqYzAJp7Lgc=; b=RxDtrYZhQwKdz55h/3OvAQMUfa
	qbxS9Ygr2wksQdNnihFlZD2DHYiIYxG83a2VDzo6Jmom1/1CaXIUI1MHOMcKYDF64L//WHJTrb7mW
	1LfUXXwz7Otn6wqM6VnTxEiwo6GgDiS3zRWmdHq9HEDDM8+Mg5jGfOgTPbOVnYg/wZ88GvD3fbcna
	qZhj+77mHql/pt3Su2ROYMkDULDzen1wQiwOyIoXJV5uIweIp3HqIAU5deTghNR/2cj+a94FVAf0t
	rEvQnIpu2WSstN07TwsH9AfxvK14/7zaJKn6V5bPU8cz8CSoWGxNyVD+LIMFffUGAbevewwpX0zo+
	i8VoyDxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r589k-00DrqS-2i;
	Mon, 20 Nov 2023 17:33:56 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r589h-00DrnI-28;
	Mon, 20 Nov 2023 17:33:54 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1r589X-0008RA-0O;
	Mon, 20 Nov 2023 17:33:44 +0000
Date: Mon, 20 Nov 2023 17:33:41 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 2/2] watchdog: mediatek: mt7988: add wdt support
Message-ID: <ZVuYdZQbwj4tAfER@makrotopia.org>
References: <4d7db8786dce35273db516f3d41228bc27a08fe9.1699980962.git.daniel@makrotopia.org>
 <3f5ed9656ea66637d259e9771ed852511369ba9b.1699980962.git.daniel@makrotopia.org>
 <dd9c2e72-c0dd-4e94-9474-a20b4598a0d4@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd9c2e72-c0dd-4e94-9474-a20b4598a0d4@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_093353_698879_94EB1116 
X-CRM114-Status: GOOD (  17.43  )
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

On Mon, Nov 20, 2023 at 09:19:46AM -0800, Guenter Roeck wrote:
> On 11/14/23 09:04, Daniel Golle wrote:
> > [...]
> > @@ -89,6 +93,11 @@ static const struct mtk_wdt_data mt7986_data = {
> >   	.toprgu_sw_rst_num = MT7986_TOPRGU_SW_RST_NUM,
> >   };
> > +static const struct mtk_wdt_data mt7988_data = {
> > +	.toprgu_sw_rst_num = 24,
> 
> Kind of odd to have this defined locally, while the others are in include files,
> but not worth arguing about.

From I have just learned from Krzysztof Kozlowski those headers shouldn't
even exist in first place, as the listed IDs are not actually referenced
anywhere in the driver, hence they aren't actually bindings [1].

Quote from that thread:
| >>> Where is the driver change using these IDs?
| >> It isn't needed as the driver doesn't list the IDs. [...]
| > Then it is not a binding.
---

Now that they do exist it's too late to change that for everything
already existing, I suppose. However, it also doesn't seem like adding
such a header for MT7988 as well is going to be acknowledged, hence we
will have to live with the inconsistency in the driver in which older
SoCs will obtain the number of resets from a macro in their respective
dt-bindings header while newer SoCs won't have such header and hence
it will have to be defined in the driver itself (as that's also the
only place where that number is being used).

> Please make it a define at the top of the file, though.

Ack. Will do.


[1]: https://lore.kernel.org/lkml/6912f6f406bc45674020681184f3eeca2f2cb63f.1699576174.git.daniel@makrotopia.org/T/#ef01d7efc6c4fbf1d4830bafe7c90e39746939671

