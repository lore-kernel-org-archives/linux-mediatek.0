Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DACC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 09:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TqfqDQW1Nok4F5vO20MPlyOgZ7Ob9ph47oKOUqw62+I=; b=Tz3Yzn9zhNwhWY
	ijfFs98ZUPSqjAYATIiSqEQiHV9nhSYKiaC/Zvar4ad7ARIA0mHNxPpjgAH/oJzIf+VvOeLRRy4Sr
	zTvsG9QgVqrQRABso5p8xfGTdYRWcs278orhYqaoGStlzReOFNx+OJLSMxdl/g2OI7ir2lki9Oq9K
	wb3/enbXV4iA1HdSHuBnwqgXMrWpOOHWz6Q0NsE8Wn+oMehEz55im3+zaY6Kk21OkCKPsojP41zIG
	pppEWUwJT8y3533Njmtu9RI0YjFea5W/+RBnyyM2XDjt+hnZhObcSVv/uhthmZdCXcnpYoOPKg52D
	XzVL4cHtoGZaj2bxgYRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njHag-00Ddnm-H2; Tue, 26 Apr 2022 09:34:38 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njHaB-00Ddbt-5o; Tue, 26 Apr 2022 09:34:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 508501F42EA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650965644;
 bh=rJV+WgKQbS9YkErAeAH4ZHj5hEyYRCA+EeCqsUmDst8=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=Ydb2vsaYzSHDHjT5WtuxJ73o6SZ/9ds70/2T1b3/NOYe5Ii6uMUn+e09tdZaazUnY
 13IolpGgsqAa0crJPa9+zVuGptmz6bdmP9WkO5J3aeRjHLdV2j0jcdabw2KCIuuFDO
 q4XJVC1jC1Xipu+kXdXO0SDUcAyD7gcqdnE4MAPIpnd/xE1T75NfVf7DzMpOfHWe9i
 2UK/3KBu8Xtu/4feI7SGGZWuPwBIVPsiBJeKcckVX0uGMf8I3cFy5VleYqzcD+20w6
 wg03TevLDvIxzEj+dWj6MD617WyDMuxTaKaTeJkR+Pb0zDWz+krwx0yb3Mt4OK7qVw
 bgYDCeQUcHYVg==
Message-ID: <54232342-b8a1-d7cc-fe2a-548794036da1@collabora.com>
Date: Tue, 26 Apr 2022 11:34:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH V3 03/17] clk: mediatek: reset: Refine and reorder
 functions in reset.c
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: p.zabel@pengutronix.de, chun-jie.chen@mediatek.com, wenst@chromium.org,
 runyang.chen@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220422060152.13534-1-rex-bc.chen@mediatek.com>
 <20220422060152.13534-4-rex-bc.chen@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220422060152.13534-4-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_023407_429027_568EC026 
X-CRM114-Status: UNSURE (   6.00  )
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

Il 22/04/22 08:01, Rex-BC Chen ha scritto:
> To make drivers more readable, we modify the indentation of the drivers
> and reorder the location of functions.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
