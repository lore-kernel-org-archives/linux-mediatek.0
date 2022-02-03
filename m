Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1715DC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 15:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EbQqzdsdEY/iizwZlqC+5mfz6+3bSVaQbyvehByPwfM=; b=UkunO8L4vQvzan
	qbVEH6uZx868wVr8Q37KKXWgRgb5Urm1OAkZbjVaiLjqijPrXMT99To9xm8zOoNyPE4EOeALILHFk
	7E9zqmQP70F9lrn9JTSsbc4OBYC1y+zpHRszsbj/5yBTKEnNzLkG2+0YB1i0pb6K4irC1KqbeoI7r
	Id7J+5btORMiFaqXHH4MI23X2o29bjqUi1DGijck2LspB+UkxHRcZJnmfCJGlNKZAtMIUNSomfzzZ
	KRVnSgH8dVgIFNk3AE4O+Of8lNCpCgpeiZKzqbv1pCjk7JacDHbHRdkDDg2Oq15oIfvTt2ETM7bvT
	N3FoyIv8JCuOYo/YgG9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFdwM-001pBD-Eb; Thu, 03 Feb 2022 15:22:30 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFdw7-001p3y-0B; Thu, 03 Feb 2022 15:22:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E3ED11F45DE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643901733;
 bh=p3SA4DH8umb5AGfbl4BOeosHW8FgMfO69DMY9bjzJH8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=C1MjGbVAur3D4H5dF7bnrH1fW0f1/OxR9t/qgwowt9z9leT+2LdyrLbyISLgAzsGZ
 4H91w4fZkWLGfW2+dl8v3anufV7L+ZugcsaAXss37C3h6SP5q70Pe/SeWsq3Qq0piN
 FtOJV8jAXHiYZLyLcL+lkXviQmW376IjbYtZDLVRpeBM6bwdh4YS7r/D5NFmvKwov+
 MANzBz2Ryz7lWyMzOWFAv0NZN9c3i47MZX1X/EZoAC/HGwkKcL8JU8Z0R7BYhPIoWD
 0z97lPKXB0mWHvo4U4vukpcXP4oU74vlaQgrtF8rYMJ3t0VDLyM8gP7PHxO/AlUXeP
 0nEI9zlPu6mVw==
Message-ID: <d715e450-5576-f340-28fb-ed770607a15f@collabora.com>
Date: Thu, 3 Feb 2022 16:22:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [V11, PATCH 11/19] dt-bindings: interconnect: add MT8195
 interconnect dt-bindings
Content-Language: en-US
To: Dawei Chien <dawei.chien@mediatek.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat
 <drinkcat@google.com>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Fan Chen <fan.chen@mediatek.com>,
 Arvin Wang <arvin.wang@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>
References: <20210812085846.2628-1-dawei.chien@mediatek.com>
 <20210812085846.2628-12-dawei.chien@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20210812085846.2628-12-dawei.chien@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_072215_229115_4072324A 
X-CRM114-Status: UNSURE (   6.25  )
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

Il 12/08/21 10:58, Dawei Chien ha scritto:
> Add interconnect provider dt-bindings for MT8195
> 
> Signed-off-by: Dawei Chien <dawei.chien@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
