Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB35EC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/yN1vGKGsASkfi2lvQL1OEknuYkKTSPRfjpemPzadwY=; b=cSWOtRpL6BRSFR
	vKHT0k4nbU9EKz3UcSHlQCkgXw5D+W2nqSzLbJSoalqnVjUIOaVlMZz52ikJHSZWzW4fk3mByEyFe
	1xnc8sGz/P+KZb6K9FMH7iImMVAsbJLstL5Hvxhj6szNCxJyK2XH231VyEUyQPLHz/F7VpDrfzSWC
	5VBReEEf0dnX/nt2Jf1JehkGuus33eqf1gAs2Asn29ZtREzdhuUftMudWgdDtNhcfl8arpjIkaQQJ
	Jpc7TZOEXxZrjhsxg3dDoqa5IlbieUv+ZLZ2k5iQqubQFGpAmY8F4hhWH9XgsEKrsERh4hJW9kgYX
	Bi+lgAM0IcQqi6ex5OMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKnNX-00C56V-9x; Thu, 17 Feb 2022 20:27:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnL5-00C3ti-UN; Thu, 17 Feb 2022 20:25:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5333361DA5;
 Thu, 17 Feb 2022 20:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D10C340E8;
 Thu, 17 Feb 2022 20:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645129518;
 bh=Aw1U3dx7zIY5dvXD5S4ZApyDcFqLvtaEFFmV/5dNE+s=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=RAy4yADJhUr6IQo+AX9biv04hkFtucU//d3h6RuFbbyUQjTp9yqao4AsyTeh+q/HP
 dYDYz9pqLN4SQcsc+ThayBrrDlth4MYaFzkA8Mg/1enHFHB46Bm25CkLELdDqR2MUI
 NQg+EkT0ZMGDdiSUxblpmw2DxDnlM+tiFyGbMvKtRe4Z2eCBAvcJMBuqzB1zHun9G0
 LjL+LpnCpJzEpQOBMNmGaH+BGIHc1qwi6vhwAMK0EcXE15d+B7nrV60da20Iy2W0tG
 uohafv4aZSNr57WFgNsHxERPXTEbza5jRQ52uC6JnH6YurkgdW6VC9aDI+X4IU3e7Z
 t0nzp9YlSaS9A==
MIME-Version: 1.0
In-Reply-To: <20220208124034.414635-13-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-13-wenst@chromium.org>
Subject: Re: [PATCH v3 12/31] clk: mediatek: pll: Split definitions into
 separate header file
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>
Date: Thu, 17 Feb 2022 12:25:17 -0800
User-Agent: alot/0.10
Message-Id: <20220217202518.A8D10C340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_122520_072283_F1404937 
X-CRM114-Status: GOOD (  11.29  )
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

Quoting Chen-Yu Tsai (2022-02-08 04:40:15)
> When the PLL type clk was implemented in the MediaTek clk driver
> library, the data structure definitions and function declaration
> were put in the common header file.
> 
> Since it is its own type of clk, and not all platform clk drivers
> utilize it, having the definitions in the common header results
> in wasted cycles during compilation.
> 
> Split out the related definitions and declarations into its own
> header file, and include that only in the platform clk drivers that
> need it.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
