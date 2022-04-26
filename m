Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CEFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 09:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ErnO8eMwPlbRs71yDzX+tcoXjjMVwFxV1YpOErqJtP4=; b=lOFI0/fKUJgumC
	RkSBUJo0j8Wq1OJiTBn8+MiQpwYluuH1KGg/4LdxEkD6D30nopbLd1oOWzEbJMtjt1PWC8bNtcXUt
	5zuFOa8YIojodOjDzFdhs4rIJk/ChDEqZSUm2lhFrkpqLCsM9J1KahnBn4Avx76pwFCsK1+H0TR3v
	HhMEaRIrsKX35HdxaHiy5UUbTV8qfIjTZIxLXMffNgFMFRY3oBSsZDFzyHW/qFXdbfxWGJlp6mUyh
	Lf7jk/b4r9gYvl2LoysTk5gd5Li/DmvUaHSPBSdJ7+//1aNhL9iVwcmZxGQe5O6fs3wMeXTrhPvUd
	oyY8WyEcrRC+eRwmySHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njHbi-00DeTP-Tf; Tue, 26 Apr 2022 09:35:42 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njHaK-00Ddfm-Pq; Tue, 26 Apr 2022 09:34:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D45D81F42EA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650965655;
 bh=jtBKZC8RMt0jLfx45LC4xjlbnrdyLhFIEyBfRCIsU3c=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=EcC8zmqm/98TOeg67Q/LVCohjVTuTwTt4SBXcqP8tjTZHkv3Of0oI8k4aeTi0udqc
 uT6y59H10IzChaboaSVVAGq/UzdJS0i29i3axjratfqWD7BR8QACinuR1FqxQID/ga
 rL6A3q5XfpOQOTsmuIRJflpK04MnCYtg54VPtZpoawu0bW9P1OZQKOkmTtslW5VHHF
 D8Ku4jqS0Ln0NizY9tc9OoJfSgFvorQWwu1Ifxs+I1WCh7JYqBtTwP2S0J2y2+Lr7k
 XzFcqVsMDgcAwOMEAFwBY6lYrDPg46jNjkIZkVDWCq+uo0XH+caicKAWYt6pC2kD+v
 IelgBvEo69KEQ==
Message-ID: <5a927c06-92af-4608-cb74-eb53a12248d7@collabora.com>
Date: Tue, 26 Apr 2022 11:34:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH V3 05/17] clk: mediatek: reset: Merge and revise reset
 register function
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: p.zabel@pengutronix.de, chun-jie.chen@mediatek.com, wenst@chromium.org,
 runyang.chen@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220422060152.13534-1-rex-bc.chen@mediatek.com>
 <20220422060152.13534-6-rex-bc.chen@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220422060152.13534-6-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_023417_018093_5F880B0F 
X-CRM114-Status: GOOD (  14.00  )
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
> There are two versions for clock reset register control of MediaTek
> SoCs. The old hardware is one bit per reset control, and does not
> have separate registers for bit set, clear and read-back operations.
> This matches the scheme supported by the simple reset driver.
> 
> However, because we need to use our data structure "struct mtk_reset",
> we can not use the operation of simple reset driver. We keep the
> original functions and name this version as "MTK_RST_SIMPLE".
> 
> In this patch:
> - Add a version enum to separate different MediaTek reset hardware.
> - Merge the reset register function of simple and set_clr into one
>    function "mtk_register_reset_controller".
> - Rename input variable "num_regs" to "rst_set_nr" to avoid
>    confusion. This variable is used to define the number of reset set.
> - Rename "regofs" to "reg_ofs".
> - Adjust delaration type for mtk_register_reset_controller().
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
