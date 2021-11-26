Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D681C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 12:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o3ZAxL/XPAX3ZeKHlIQx/WBQuiHhkpiHLds+QWYd824=; b=b+Enhsho+hJ1jXmrBUL/WfwHGH
	jK9uZgwD3idqmZ0ejAhNfB3LH6+JlCJ8FbYieni8TvFN6JgJ8dMzl/VfmkpG8k75Mw0AWt8xC0cyD
	ajHRFOPEYuedlkK8iH58mDnEIBRIOOzWwJn1JxCETbBQMfT45pZqli8n7087R0jx+bG9+5+QRR/+v
	SfU+d/FShar8U1JXkon1MhB55YjBUHU0x9oHV04ypQ6HLRax/nI43ktHW1EC94qf8s/Dd62B7ubop
	KWgh2Q3NRxIHKQ1DRpq1rmTN9Qiox5Mlk99QjwevUzpmbKtsoMamv3yMZnST+yhTFvZP8x4noecBj
	Aa1XGejw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqaJO-00AMKC-MM; Fri, 26 Nov 2021 12:26:42 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqa0g-00AHj1-1A
 for linux-mediatek@lists.infradead.org; Fri, 26 Nov 2021 12:07:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3EA201F46821
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637928440; bh=dj2wyPkbyn7gApbtIg2geaaFyZHLewmQWww8/OOcwjY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Az76iqIeCUTTCWBpk7fpTJfqJeU1u4CPWP9K+xYrfFGv/0dB9VO/tXACSwBiWAL3F
 EAqKvqKUkb3xqeMHFuUetdTIX36FVVSmXMgxlkgGCAD4IUsFDxspbvkIve/RwXv/jX
 BJinM1irXDoV2KqilKafoYDmYfGrpMrelH7XbbcEIDLWaL9rwjkx5nNFAqR+qG9nfn
 BAvUfweBRwMsRh5DMb2yXS/4MRvo0f05BeZ3j3Mq3ufsrhqtn+KKqwhfZ52Olvrwfj
 dk+ow6aRijgPT/AJ/d+smDIR/0l4IRuWql8CmwMqRs71yCO7jPA36E1WjRffyzF9to
 HbbVCD2458/lw==
Subject: Re: [PATCH v2 8/8] ASoC: SOF: mediatek: Add DSP system PM callback
 for mt8195
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
Cc: pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 daniel.baluta@nxp.com, daniel.baluta@gmail.com,
 linux-kernel@vger.kernel.org, yc.hung@mediatek.com,
 linux-mediatek@lists.infradead.org
References: <20211118100749.54628-1-daniel.baluta@oss.nxp.com>
 <20211118100749.54628-9-daniel.baluta@oss.nxp.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <3cc9c55c-16ad-26aa-c41b-2f3f9302f021@collabora.com>
Date: Fri, 26 Nov 2021 13:07:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211118100749.54628-9-daniel.baluta@oss.nxp.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_040722_269834_16339B29 
X-CRM114-Status: UNSURE (   8.59  )
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

Il 18/11/21 11:07, Daniel Baluta ha scritto:
> From: YC Hung <yc.hung@mediatek.com>
> 
> Add DSP system PM callback for suspend and resume
> 
> Signed-off-by: YC Hung <yc.hung@mediatek.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
