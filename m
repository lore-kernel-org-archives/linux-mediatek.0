Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE76EE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 20:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WkADVo0yMZsUe+YWySAxQhQZcqqxMXsQLxfn5vbBVoU=; b=Qgfq3DKzmxEeQJR+BWOSd22/bu
	2zjeTrpuVx8v+cCSDLRGB+Fd75ZCwWPxe+BLs7R9mqT/JRMfHIPBJ1tWID+y+Llw5dRTQDw2YqJdk
	fI5qgNo7fQQse7/NvIFlPu0JE2JtQKAY05A7lSFUC+mvh/Kyu5L3CS7QMgHNkrnpoiq+IwlAqeAIK
	uSIjE783N9bRHXSCsGSDTwNAAhNbPjAmKS+dMcs96FfIRbd4gk8nemk3Nb6xw/ZrbvMUbZvHURiwt
	7aCx1n1+jk10OsKVdVgWAkKHAMu3so2vHv6N3KmGyHSSvTcE4PUBhqRVlpo/P+TuGMlHhsy4WCM+I
	TldUhHvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfnK8-001GHI-13;
	Mon, 11 Sep 2023 20:15:56 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfnK4-001GGW-2S;
	Mon, 11 Sep 2023 20:15:54 +0000
Received: from mercury (unknown [185.209.196.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BE10566072FB;
	Mon, 11 Sep 2023 21:15:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694463346;
	bh=QvYpu+E4ir6H9xoX6RAFUKeRn6noR1kwabk8MMjaLtc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EwwodJ5FTz+p6UYEh057UhpgWQwoWjtl5y2YvIZyQfaFIQmcG9+9uHf4t24SRuZO5
	 hPc8ON09f5gyM9RnP+FYqD2s7LzWITpD6LcDRmDiFIWgO/tiRTer0qEwzOLnID+mTB
	 RggGg4AB1PtBH9DsyR7hoGq/V9xbCe/4vaxajZBIOyrnJ8/uF7VHXFi6VwhJUyt+yR
	 L20eEOSWK66I+nAt4VFh0EXu0jyoaLa6UY6h3xmWXpO8FJ/MZRImeWJc91lYcQrUM1
	 +uZKPCBlyKid6yI+hqybuXfgVpLXnKOnuCKSzp4A3ywhcJwi958kGX8uLI4+uZbCD2
	 Z1dxlDPJnZfvA==
Received: by mercury (Postfix, from userid 1000)
	id 73FFB1060929; Mon, 11 Sep 2023 22:15:44 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>, 
 ChiaEn Wu <chiaen_wu@richtek.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org, 
 error27@gmail.com
In-Reply-To: <20230906084815.2827930-1-harshit.m.mogalapalli@oracle.com>
References: <20230906084815.2827930-1-harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH] power: supply: mt6370: Fix missing error code in
 mt6370_chg_toggle_cfo()
Message-Id: <169446334445.405661.9324882432164519233.b4-ty@collabora.com>
Date: Mon, 11 Sep 2023 22:15:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_131552_998180_BFC781E0 
X-CRM114-Status: UNSURE (   6.15  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Wed, 06 Sep 2023 01:48:15 -0700, Harshit Mogalapalli wrote:
> When mt6370_chg_field_get() suceeds, ret is set to zero and returning
> zero when flash led is still in strobe mode looks incorrect.
> 
> 

Applied, thanks!

[1/1] power: supply: mt6370: Fix missing error code in mt6370_chg_toggle_cfo()
      commit: 779873ec81306d2c40c459fa7c91a5d40655510d

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


