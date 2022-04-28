Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7DBC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 14:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pY9UlYMjuQZOB8/YpQn1ezVPSrZAVFJSXvq52RzrMJs=; b=kOyuohUax8lhpq
	c5Oa/Kk8+4ZFz38tq2rsWQW/w/PLfj9LjQ/5msxLYP05+IQuWtHhkUuuFdE+7T4DIYlnnO4fqK86+
	KBk9FnzAAhZf6DLstP2TKhw2KgY/37GaYP8N6Uy5NUDGquOljYItBbNjNqVrqlPJJHjn/j30+4S83
	Ss6Tg/IGVVGNSXRLNlMSxa/nQipOJEEmpgkaxnwCf36u3wyh907uM5DYnHWWVeW2JbMltWt4gBh6Y
	YGw2m5WR0fbtpP3ivgi1m19r0PRF9zfAoF1FTxpw7h6crqUOHMbWRNh2kKnuqk+ADxKsApZn3HrY4
	e8MIB7U4byF86Wgvt/rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk4nM-007KZ4-D8; Thu, 28 Apr 2022 14:07:00 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk4cb-007F4K-Ai; Thu, 28 Apr 2022 13:55:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 2D4CB1F458DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651154151;
 bh=0A+3aw2UPkQ8ovDESnexGar9sBmgEXSnygPWIGyxILc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nP7QpFEAFCOP+N4FdZxDN2KGBkwFF/v4xNXBA6znhP0b3ZBBJbI5sl3Ka1sI4Tn4K
 5moJIeiZC5i16HqKUa53+PYARBHMysSewDEUK4lW/ABsY2PDko+rIH+K4FGmkPWHH6
 s+gfOSnQVvRNnkxxgDtw6X3QDjcsMT6JtBi6io9xfynNpgAiODWURcVpdm99PCLOrC
 9cAajG+1YdXYMUgynsuXy0aGUAlJCK4LPzJIPFdu+c/jfcL1MCQOqQuCY7GDoGlND3
 gpJFmEC521+3Vqfgt/jJizjyLgiHxTsd8FFmMq7pwV4d89OjH3GnDh6IopGSRVwlyI
 31Na9C0j+LiyA==
Message-ID: <2e967249-2735-6bc6-6add-2feeecf6a613@collabora.com>
Date: Thu, 28 Apr 2022 15:55:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] clk: mediatek: Delete MT8192 msdc gate
Content-Language: en-US
To: matthias.bgg@kernel.org, mturquette@baylibre.com, sboyd@kernel.org
Cc: weiyi.lu@mediatek.com, chun-jie.chen@mediatek.com, ikjn@chromium.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 allen-kh.cheng@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>
References: <20220422143756.14806-1-matthias.bgg@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220422143756.14806-1-matthias.bgg@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_065553_561860_A5CDD477 
X-CRM114-Status: UNSURE (   6.32  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 22/04/22 16:37, matthias.bgg@kernel.org ha scritto:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> The msdc gate is part of the MMC driver. Delete the not used code.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

This code will never *ever* be used. I agree with removing it for good.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
