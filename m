Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07237C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 14:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xJk/T5aG490tbUzb9D1Gl4F9BTAVg4yktvNpNHg0zJk=; b=j06G9oIttsYgbF
	ag2rXqeMf0d0gDyRaAjJERK8kxrzwmvjky5PA9H42e/RV9ZHl6rij6AwOPyRCp8bbKXNCNP5oBZD7
	qVJtbXzyYZHb9ecDQO6alDnl/LvgtRMlw95VLXV/e03YHTa82wKw7NnpCnFHuUbVSIHOE8PQMrKQx
	u77cC/CVgUG66OV9KAuDi1JJynfl4eolEam9IPOabl7BNfR7x97C9eR1XSBhi/r8ISDcBZ3TLQUUI
	tisjvBIOgaltDWYdYxdCdzUX2dW/0B1QzCsKXIp5JnxRoKMjjcb0Mn2zkKeIE2+HHcgAeZXRhp25N
	H9I9F+BLS2IOtgUIjy9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZvQw-002TcH-7u; Thu, 31 Mar 2022 14:05:54 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZvP6-002SeW-UT; Thu, 31 Mar 2022 14:04:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id CB68B1F468F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648735439;
 bh=fy1+tUPoPcfNztYimOdywPSnGkPWW1wOSSxIBddwBMk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Fcy9oxZuRcaE2Du88OXSRaLsSYrgbXGi1xhLjwvbeSaDdEkjq5OAo0IxZ62G53HpV
 A7PvowXg2nFGtVmaE/bXeK95t6J1CxpH6p8aRYmC5PnOMJk2VzdPjEysFI1Tu5KkiV
 fG7+D/ujjUYeEPKDFhYjUHIMvybGnXhJ4VjEF1BGJ9/Qj2G2dZTbZ5b8LYvTwZBFPd
 ze9QZq5VNtNS0Q/zayrS1TNfiBMFPZgeadEaZtIhQyhq0k/Ub4DqKG2WDQMdhwd9TG
 /m0qqVssG6trma9b0dk4On0DQuecu6Xp9ZK43MvmBrzcre9nGbcaLBvrpMYyME+LBv
 yyCK30O6TVRMA==
Message-ID: <bd7c2c10-aacb-1d7f-7f60-71265ab80fe1@collabora.com>
Date: Thu, 31 Mar 2022 16:03:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5, 1/4] dt-bindings: pwm: Convert pwm-mtk-disp.txt to
 mediatek, pwm-disp.yaml format
Content-Language: en-US
To: xinlei.lee@mediatek.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: linux-pwm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, rex-bc.chen@mediatek.com,
 jitao.shi@mediatek.com
References: <1648730873-18505-1-git-send-email-xinlei.lee@mediatek.com>
 <1648730873-18505-2-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1648730873-18505-2-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_070401_164066_D1DE07D0 
X-CRM114-Status: UNSURE (   6.16  )
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

Il 31/03/22 14:47, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Convert pwm-mtk-disp.txt to mediatek,pwm-disp.yaml format as suggested by maintainer
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
