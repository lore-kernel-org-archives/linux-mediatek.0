Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8EBC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 15:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WYE5TAiy2CQ46FAY9FVF2d4Ru1KDzqAJA4Gg7h0etq8=; b=IuM0y8LebvArqq
	qmIMsKiTf6ogtQteYMepGDgxMhO3TUF3rIar9jiGbm1enMMt+wLHOi0sUTJCsh3WmzwSuvvcgFHG7
	WlV6no8p9Wh1D8IxXFgaKKixSYzx2rVr+4HY9zMThh3KFq58jqrEr16MD0xKDMpoFxdbFI3kmUpbp
	c7jh5pHSht0SjIuHEWIeSyzHP7tjDrTcL6EdpEohsL/4sMgEC3Xcj2Cv3QHWZfFoyihXwvBjV7KmB
	2RNTOmC5ZmPhUaHLDLqEJ649CKq/kG/+QkoVQ2I9qzTkYG0PdtDGl1kDrUGKRoR/Jr88zKrHQVoWN
	RHBXMaZ7M3l/sNZbPOgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWJuI-008CKF-5h; Mon, 21 Mar 2022 15:25:18 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWJtz-008CB7-TW; Mon, 21 Mar 2022 15:25:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 636FDB817C5;
 Mon, 21 Mar 2022 15:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D28CC340E8;
 Mon, 21 Mar 2022 15:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647876297;
 bh=945ge3Ti9ULGISUBSWbrCFtQjRwrKwiq0M8/AnX998Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ghKBuVvXv7inHlpQkjLY/gv6R3PmGKTTFhclWMdoseHIPEGT2rBxzLgxoqE8kLJW5
 W8ZCCg+A83eOlUDajqgU8Rmi9Q3e9hcC6GQYu7gB4iE5e5+tP4Hsz6dbiMXqB7krf/
 43Tbz7IP9ILqEGBjFhDgy1LQTukm+B1pmKbFciFfZUsGM4poil2ksRAAWwIxbOwP6U
 XDqo2GkjZCZXNFR8zMB/kcI4LUUBiytONbQ1oJF63x2tXYqvvozKI7XlmUKHw40ZXk
 o1MEQMhP23V4rWD0bij6u5OMdirq3wwZQdccuoR/9qIdAwE5HdCqm3DoXgaaHXOZOH
 F6AXUCDmcqm6Q==
Date: Mon, 21 Mar 2022 23:24:52 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: broonie@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
 linmq006@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [v5 2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of
 speaker
Message-ID: <YjiYxMPY8dehglTW@google.com>
References: <20220319114111.11496-1-jiaxin.yu@mediatek.com>
 <20220319114111.11496-3-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220319114111.11496-3-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_082500_116790_2F22CF9A 
X-CRM114-Status: UNSURE (   8.72  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Mar 19, 2022 at 07:41:09PM +0800, Jiaxin Yu wrote:
> MT8192 platform will use rt1015 or rt105p codec, so through the
> snd_soc_of_get_dai_link_codecs() to complete the configuration
> of dai_link's codecs.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
