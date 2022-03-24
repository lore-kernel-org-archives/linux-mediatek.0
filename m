Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4B9C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 00:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oVcTi5LlVRRRfRUIGKf7iAIFNJldYigiD9Eofk0mGbc=; b=jcKZ7fFqhkD0z1
	SOt62a3FHf3e+oJ6MNZMPL92VhR1ubde3+esLe/1e8huw7ELLfqYd7/yLRlLbvNzx36aBJGGd8WrD
	vykjdsMDnLaEufd6x9Bfta7PqYMAHQe2e4kbHWWk4byMwtH593WMdMdOLzJ81kDBeOYuev8tRPW+G
	XJkKbMREYX/McMJfATZsMs4S/mGqkTXHSMrrfy+gU1ZlsDSzyXkj4Tj9RAKJH/UNAIqtstSOWYST6
	sFGZ8HnNa+UM8E70WFxLWUTZGKvlX2zFDRTYxmdDVhOPPTKnynccn0kXrd89FebWoB1QrUHWTR9ck
	12qQyYn+8rHf2dKdzXiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXBnQ-00FFyd-4A; Thu, 24 Mar 2022 00:57:48 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXBnC-00FFu2-Vz; Thu, 24 Mar 2022 00:57:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9E29EB821DA;
 Thu, 24 Mar 2022 00:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F423BC340E8;
 Thu, 24 Mar 2022 00:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648083452;
 bh=BQcVmEPhzCFk4v+8oWiaAxBOeilqbJFo+BuD++HaQxw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HWW/KDkd19s8uyy1l/3SNXQ1tQ1cI+AYB4cdNiBLdE/7SA4jzyOWboKg7UBUp86b1
 CA1e6SQqbRUo8GpQTWCq3VVxmN51Bqe/c9CUoWBSP0SN9gB9HQ8cvqiCIdSgO8Z9Wo
 VR8ZXkSKGXxcRstv15O/2u9kw1MIno26CZw1Gsg2JIlVptGS7TrsupndhJ+4GN1KKd
 RFgRyK6Kn4uy9Nm5q112eq0hi86XTDU7TkCHNBnGxi/EV9ahUAtyY6msoLl0iipVWv
 YhI/ssY7WH2Lx5fGx1Dsc5fyE4QFDuh9yB/5b7vAHpkK/aL5lNA7ghi8bKeFHC2CI7
 yGnQgS7gFff7w==
Date: Thu, 24 Mar 2022 08:57:27 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: broonie@kernel.org, robh+dt@kernel.org,
 angelogioacchino.delregno@collabora.com, aaronyu@google.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, linmq006@gmail.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [v6 3/4] ASoC: mediatek: mt8192: refactor for I2S8/I2S9 DAI
 links of headset
Message-ID: <YjvB96lI22tUs3ql@google.com>
References: <20220323164442.921-1-jiaxin.yu@mediatek.com>
 <20220323164442.921-4-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220323164442.921-4-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_175735_197971_BA43077D 
X-CRM114-Status: UNSURE (   8.21  )
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

On Thu, Mar 24, 2022 at 12:44:41AM +0800, Jiaxin Yu wrote:
> MT8192 platform use rt5682 codec, so through the snd_soc_of_get_dai_link_codes()
> to complete the configuration of I2S8/I2S9 dai_link's codecs.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
