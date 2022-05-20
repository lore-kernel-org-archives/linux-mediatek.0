Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C186C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 00:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nzh0s68z/Y6zr8qtlPCpSSdHknwDl2TcBXK3PWyi9Yc=; b=yYdQJGo7CLdbat
	ev/JOjVqx4KnPnxRuzDNqt61W7MWdGgK0M8wVlFz1FvYoo96IbA3ycq28pDr3LBxJqZ/I62b/1TtB
	oQsLYN47IdORsBq2ozI28T6SnZzHxQK1mxtbSu7ILKP+72cQ0G46hyYgZORHaCcqGQyPxpgfp0ZgG
	En/JZJlwvLI+4Oc0cDcwK7nu3ngQtEB6zzc094x/mEf79AxPF0kzTHz1t3GpoiRc+m1LLiDZ9+iwC
	gAUDQa8ugreZtpyXjBk96XFUz7M+9Wlg6DyG19q9ac8e70uWL7K+aM3I7lPE55CRulomzyjXFm+0h
	hjpXpA3UxTjfT4Ah8pcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrqel-009pXr-3e; Fri, 20 May 2022 00:38:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrqeL-009pLH-By; Fri, 20 May 2022 00:37:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E26D761AB2;
 Fri, 20 May 2022 00:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42193C385B8;
 Fri, 20 May 2022 00:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653007068;
 bh=A1S6mg9OBT6AKltZiiqdbCazkwAG61jCviwhpWl8/IQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ueLxfJiMsabO3DZ1zq2+xp/0ZP75rmH59UF+XVeRNfAYoWFaiIXmfLLsGlSX16SA7
 g+mK75hgrGJOty7Y4t9FmGx+zjcCZ8fQCo+y3wxiMW/nNfi/Yxdyfb7l6evmz54FML
 ZaUcJtpHEH1kYlGRBQ/LKOcWV1I+c3fc94QV2LnA34TZiOLtVimDcgO7VYx7k0l5VC
 BV2Zat1lkm+I+bvjo6pwRbUcBZoqm04Mjm10NQ4puIcyrZ2MMfNFl4hZP3+A7CBqs6
 PlcsyeM3GRpoXZLCIqFmxpIZmbxTler+cGGZsTIs2EDgRL2fJvNwT5yjDa7T3JDxwV
 HuSM8FsjT7V1A==
MIME-Version: 1.0
In-Reply-To: <20220519071610.423372-6-wenst@chromium.org>
References: <20220519071610.423372-1-wenst@chromium.org>
 <20220519071610.423372-6-wenst@chromium.org>
Subject: Re: [PATCH v3 5/5] clk: mediatek: mt8173: Switch to clk_hw provider
 APIs
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Chen-Yu Tsai <wenst@chromium.org>,
 Michael Turquette <mturquette@baylibre.com>
Date: Thu, 19 May 2022 17:37:46 -0700
User-Agent: alot/0.10
Message-Id: <20220520003748.42193C385B8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_173749_486668_6C3289CA 
X-CRM114-Status: GOOD (  11.23  )
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

Quoting Chen-Yu Tsai (2022-05-19 00:16:10)
> As part of the effort to improve the MediaTek clk drivers, the next step
> is to switch from the old 'struct clk' clk prodivder APIs to the new
> 'struct clk_hw' ones.
> 
> The MT8173 clk driver has one clk that is registered directly with the
> clk provider APIs, instead of going through the MediaTek clk library.
> 
> Switch this instance to use the clk_hw provider API.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Miles Chen <miles.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
