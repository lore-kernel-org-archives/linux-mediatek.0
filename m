Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CAAEC43461
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 22:22:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 361562087D
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 22:22:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UZHTmPrY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 361562087D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VfGlbsD6+5hr/aX/575SZi7k2bOCgvtzX2PPLHy4Hfs=; b=UZHTmPrYkbtRHb9OenF3cUn1U
	BnQZc8MtkF5s0eqcuUR1eD64C6qQ9xfDF2StKxLe2XyGC1OdAYOV5dendiR+2t/aIPqq56CVIzWO6
	U2NLM6ZJtE9QnHQ5/dXxo7o7CbUR0I4UcJxBXrdkFG+qLA0N4DOfcVvroFoPVFjCEFig7MWyYPXoZ
	oBzRHR7Uc41ev9Zbh/cOf+tC3g2prDZt0ZPBHt2C4qLmnVyK2CP0VPUUXtsMyOWonJ1qDvOElXUZ9
	Kr0BsJnZ1u4lRhTE+IsurXx08y7E7RyUXHpCOePnt25bJowaGEVzSCE8kc4pzmZPuoTbfYumCzgO+
	0e4AQ7eEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFm0d-0003b3-NE; Tue, 08 Sep 2020 22:22:39 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFm0Y-0003aK-O0; Tue, 08 Sep 2020 22:22:35 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id CDA7D1C0B7A; Wed,  9 Sep 2020 00:22:33 +0200 (CEST)
Date: Wed, 9 Sep 2020 00:22:32 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: leds: Add bindings for MT6360 LED
Message-ID: <20200908222232.GB1005@bug>
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-3-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1599474459-20853-3-git-send-email-gene.chen.richtek@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_182234_903376_74EFB12E 
X-CRM114-Status: UNSURE (   7.45  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 cy_huang@richtek.com, linux-kernel@vger.kernel.org, gene_chen@richtek.com,
 benjamin.chao@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, jacek.anaszewski@gmail.com,
 matthias.bgg@gmail.com, shufan_lee@richtek.com, Wilma.Wu@mediatek.com,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi!
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add bindings document for LED support on MT6360 PMIC
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>

Put this first in the series.

Acked-by: Pavel Machek <pavel@ucw.cz>
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
