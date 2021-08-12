Return-Path: <SRS0=QG8e=ND=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E093C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 20:49:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 221F9610A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 20:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 221F9610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GVsx4R13jPUU/eqY+svtCMVGPmWQ8AxmBnRMJ1SZsZs=; b=pDZn6sySHw7YOV
	O0oTmXwlY831bjLmq3tEJ7ku5Px0qOj3uAXcZnM7Jo2sSyJmdbXhQUcNN4nFUwZTFusuHhOsb2z6k
	7wXqCbQIaxCrOgN+g32Kra7KKDvS+wfE7TCcekR9Gj6bYCUhBA6m/b3wEgNo9Vn3dGtCk2syE3O2M
	yo/ZWAbDIf6BG0ZKO6JEUAitDGej+FhUONBmbAq9tPOmcMiGdmMRwTnvgkE8KgmJK54wrrssNMJeN
	hAnBW/d87WrbyjfyMLpja/1uOBtBddA/SIDIN0croimuYhSifkXdOs2cfklYIeh/v5/h2RouRbF2g
	L+0NDLMZ/kztwXNg41vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEHdb-00BEqP-Ty; Thu, 12 Aug 2021 20:49:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEHYm-00BCbs-TJ; Thu, 12 Aug 2021 20:44:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 617C0610A3;
 Thu, 12 Aug 2021 20:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628801056;
 bh=3oBMhQTsZ0JGmoRoNan1Fu4e/2ROq4vLcJGLs+VXjQs=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kveoZYmEcRWdKMSslWCl833egZjWoeUiv2XV5POnBpH2goTk1uB9vb61JgHmfrNg1
 NFHvVfqG1/j2kDKYVXp3nZeCoTgbK9jktfgWuJ6dO54FXsTUJ7POm/3j1i285JDfKA
 tv9VURxE+hW/wYypxhl6idkgauHD0Dr/bEO7TpN5BksHVZuFGeGHzwGITW6HN426ie
 EzywVW/4HiI40dI42eEwBvwEAapz9EL8qr54rs4eq1xpRf9Rob2R8DpHJ3EkqWocWb
 PdKzuGkTlyb29C+Dv9VYHxTOpB5pszRerZ7SAgUNjIie66hRHqjGglgY+luT7fg0IX
 IugecXToOP+wg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 CK HU <ck.hu@mediatek.com>, Bilal Wasim <bilalwasim676@gmail.com>
Subject: Re: [GIT PULL] drivers: soc: mediatek: updates for v5.15
Date: Thu, 12 Aug 2021 22:44:02 +0200
Message-Id: <162880092618.1372486.1035988848948197417.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <49fc7bef-20db-b98c-9437-dd9e4d00e870@gmail.com>
References: <49fc7bef-20db-b98c-9437-dd9e4d00e870@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_134417_009083_E8015598 
X-CRM114-Status: GOOD (  12.66  )
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

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 9 Aug 2021 14:19:57 +0200, Matthias Brugger wrote:
> Hi Arnd,
> 
> Please have a look for the updates of the SoC drivers for Mediatek. If you
> wonder why there is no binding patch for the MT8365 mmsys: The binding was
> converted to YAML. This got taken by Rob. To minimize merge conflicts I left it
> to him to take other mmsys binding patches. Unfortunately there is one mmsys
> binding patch taken by Stephen through the clock tree. So there will be a
> trivial merge conflict (although not in your tree). A bit of a mess this time,
> I'll try to make sure that the bindings for drivers/soc will go through my tree
> in the future (which will make my life easier as well...).
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: a8c371f0cfe7224e4bc3f3f0495e54a035107653

       Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
