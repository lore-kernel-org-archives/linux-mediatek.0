Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4BCC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 00:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bgYU9HTHvzMmbHa5qHoxV/5kbnqtEoCFxLxvxS2iOL8=; b=tiuCqyCb7nffNA
	tiZl86x/WEzke48TUEtmp7di86FCoH08e3a+ZAcCv3Zov1LvjjWl6NSy/htaiUM2KJ+JIo5K2dPkt
	x1Bzci6nDl9YoWNiFkidM8aUXGERXiBhKOqRHXo1DrWFS8Jg0eMxCVQzfYianpjA2rehgpg9ahQpC
	JX433UJn92y70g+uLaux3AfV65iuYpvcTUAMzxnf7g5/sNQfKbEo4PR6bEU+UFK2txLC+VQ+bQhvk
	6oy+AB8Phzg/76P3+fj6jkARKoGM91Q/+UKEGURlY5jivOEu24o95Iadz75LEbiQmTCHkXC8WD/tA
	KhbeyRB53Be2b71EE6DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrUFj-004WBC-KC; Thu, 19 May 2022 00:42:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrUFZ-004W9L-I3; Thu, 19 May 2022 00:42:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3506EB82281;
 Thu, 19 May 2022 00:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9572C385A9;
 Thu, 19 May 2022 00:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652920963;
 bh=zmNRJAaXDXQx4amQA3NMoD0Oaa4WRs4hCXKUciYbCyo=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=iYFZMhX/CORPBGnQ2Mzvjif3e6iszkSNpCdkUQxE7yVOFEC/heSv/x+KQELAPAusA
 OGXRH1WTqBDKa0PDSg6z1WvqyCSyN/vFXdtFP03fhyPrJyLbDsX//G1br7wvVXMtXx
 4RvkTJadGgMiMUX1NFckAA7bXJ7RhvnE2XaFPZjcxFGrn70W7hcWbHMBQGN8wept2N
 kyadsOW7U/XqjEY0/9xW4+MZ42Y4vhZeXMMMeVL/MDw3++OeFSjdmat7Wrcues1y7/
 qSsYEUjX3qRfxgzYCBR+Mg7Ebu2tn2lBkHQAiSohT7yBF77xJ7+Wj2xgZoKgCiGiW4
 ZwutDE6m/xIoA==
MIME-Version: 1.0
In-Reply-To: <20220513073621.12923-1-mandyjh.liu@mediatek.com>
References: <20220513073621.12923-1-mandyjh.liu@mediatek.com>
Subject: Re: [PATCH v2] clk: mediatek: use en_mask as a pure div_en_mask
From: Stephen Boyd <sboyd@kernel.org>
Cc: miles.chen@mediatek.com, wenst@chromium.org, chun-jie.chen@mediatek.com,
 angelogioacchino.delregno@collabora.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Mandy Liu <mandyjh.liu@mediatek.com>
To: Mandy Liu <mandyjh.liu@mediatek.com>, mturquette@baylibre.co
Date: Wed, 18 May 2022 17:42:40 -0700
User-Agent: alot/0.10
Message-Id: <20220519004242.E9572C385A9@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_174245_778766_A08D0517 
X-CRM114-Status: GOOD (  10.93  )
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

Quoting Mandy Liu (2022-05-13 00:36:21)
> From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> 
> We no longer allow en_mask to be a combination of
> pll_en_bit and div_en_mask, so remove pll_en_bit(bit0)
> from en_mask to make en_mask a pure en_mask that only
> used for pll dividers.
> 
> This commit continues the work done in commit 7cc4e1bbe300
> ("clk: mediatek: Fix asymmetrical PLL enable and disable
> control") and commit f384c44754b7 ("clk: mediatek:
> Add configurable enable control to mtk_pll_data") to
> clean up en_mask(bit0) default setting.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Mandy Liu <mandyjh.liu@mediatek.com>
> 
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
