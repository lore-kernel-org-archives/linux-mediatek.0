Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21043C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 10:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N5u4FL9JnZs8ZkWgNEk2E0Pgo5QjFnuZPtUoNAXXjWs=; b=ohHQjSS54aJyhc
	kcn+rQqWI2w4wl5xJhtj34V5L5bR9OLB1+wpS8fe6S63Qth0UL0zOIUDPj/ljeodIMcge3/gsmLKL
	xryc/IY1UXHdE6fGbijmhpCoAIYhyX06zdLNlzmQ9cabedbs/XTeXcA9o1sU7FpB4GjPcmstoRmJU
	sJbBKPwtTW7bTuNyVFTFN37mp3wMJFnQaHwfPgSmujeCBtnxGgR3A9tPcBSrHXEdQLSn+DTu5yq+G
	ISt5zYi0827bwIwL9sU0niH+FW00BFQPND5yi/0UPML65ws37yK/JAJmFWa4nm7pSL+dcAWgV2+bI
	KdjCV7t3pWb1iyoRBvKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfJGK-009fH0-Df; Fri, 15 Apr 2022 10:33:12 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfJFw-009f6c-U6; Fri, 15 Apr 2022 10:32:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C85F21F47E6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650018767;
 bh=nlyT9uQbkjzioWEO7W6j0Auq0HCeIzNo2fkjz3Pa5Bo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PhpUX9sJw3idQnExRhUN2jNHlw5zgo9InQmuXeIt/zr3f9kXox4eLopzl46snvjoK
 PW44SeAuzTuIPuiCHcpCu9Wf0/7GrabvSMNLTqZs+oFp9f5P7qC5UcNb7i0UTn0U6r
 G1c9zNMf1Bvjk79ml8RoYpQ3t8PmyU6ViAo0taWQCD92hkFrPAbj+5HZDvAcDmrPB4
 cDDnyOpmn08p0cbZO06axCyBwNBbarJVSu5PP+ulbn5o1EKYBCdDIjOB5TPHf/mvwj
 SvOnSkoXSgJhn24uopJkFOU6dDwq0lQm/eWYXmk1xYKTIqnBGCMTQDEoUpuj0wsR03
 8NoqlVfBgFyYQ==
Message-ID: <7f5a4307-b28d-1072-ee1d-752b3761bc30@collabora.com>
Date: Fri, 15 Apr 2022 12:32:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v19 09/10] drm/mediatek: add postfix 0 to
 DDP_COMPONENT_DITHER for mt8195 vdosys0
Content-Language: en-US
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: CK Hu <ck.hu@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220415083911.5186-1-jason-jh.lin@mediatek.com>
 <20220415083911.5186-10-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220415083911.5186-10-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_033249_145687_EAD53BFA 
X-CRM114-Status: UNSURE (   7.32  )
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

Il 15/04/22 10:39, jason-jh.lin ha scritto:
> Because mt8195 vdosys0 has 2 DITHER components,
> so the postfix 0 need to be added to DDP_COMPONENT_DITHER.
> 
> Then DITHER enum will become:
> DDP_COMPONENT_DITHER0 and DDP_COMPONENT_DITHER1.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>

I think that "postfix" should be "suffix" instead :)))

In any case:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
