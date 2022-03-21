Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF384C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 15:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9zjhpDmSzmZUoOFvg/tbC82QP7pj52/G7vsltLBfBoU=; b=hOsl5WTI5pUQTr
	6uqUmtauIjVt0D0Ltws9IgVI8QbO9zetgJa15cH+RSs0oFFL6JOteLp3o0dPWV0S5kXoisx+OxLl3
	ssPhqNhJjdzmqAkvxo382jOvpjZbcG/GreqCp+riligjxvsOmRCyICo6NGJa2yPUdpTqulnCblLUV
	Xh4KjILVW4D7XaeYe+S49H94y9o7+cqio6upQqwAWBOhVZVeB5JVmx/lKuzOQahz0uH8urnJ22PyQ
	GdoY+iRYrtRNvhPUOzfrLh9ouL5dr/zPx+AAuHj7aiDxgUUwaq6RP7cm4ac77QzZbplxSVdRNeeiQ
	6wcSKjyiGFq7yH+TXi+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWJgS-00877t-IE; Mon, 21 Mar 2022 15:11:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWJgG-00874I-Nl; Mon, 21 Mar 2022 15:10:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 27C39B81745;
 Mon, 21 Mar 2022 15:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B6C2C340E8;
 Mon, 21 Mar 2022 15:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647875445;
 bh=U1Ggj4W2ZgC/aj170kV3Ah+sDyh9pe5OZQ5A2oCA+7Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qftt6/+J1yF8fk9IVjFbkzJrarwX8I6KyM5sE2Glq6kHuUECaEmp9FPsNQSZH983a
 n35JmkcRop65KCXBio9Q2WczHDEWY7zMsnH+8VF57nfQ5tHI/VXEnF82uY+V/ASaPX
 eH1ycMc1XTQ5+v8fKg5ubikGd6JfFl5EQPkKocNT9n2xqsff1zmPdYro2wrkAggL1M
 9xrLWUrf/jbe+9vSeASPpTymjiTK2Y1CMhBuoWRS7MlMriOluLDobj6etfavgazVm0
 +H7lWAxw0GZEURiBkpJbjPuUc0nEsBAPRsAZhECXtBd2+PWVcxVDY9HEwDHw/5aaou
 P103Qu8YSYsPw==
Date: Mon, 21 Mar 2022 23:10:41 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: broonie@kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 matthias.bgg@gmail.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, aaronyu@google.com,
 angelogioacchino.delregno@collabora.com, yc.hung@mediatek.com
Subject: Re: [PATCH v3 1/6] ASoC: mediatek: mt8195: revise
 mt8195-mt6359-rt1019-rt5682.c
Message-ID: <YjiVcUJ9Xm54ivcn@google.com>
References: <20220321072312.14972-1-trevor.wu@mediatek.com>
 <20220321072312.14972-2-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220321072312.14972-2-trevor.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_081048_969892_D03C2952 
X-CRM114-Status: GOOD (  10.83  )
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

On Mon, Mar 21, 2022 at 03:23:07PM +0800, Trevor Wu wrote:
> Revise driver for the coming driver combination.
> There are two major parts including in the patch.
> 1. Apply some suggested changes used in mt8195-mt6359-rt1011-rt5682.c.
> 2. Reorder the layout for centralizing the codec related code.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
