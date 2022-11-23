Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D17C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Nov 2022 16:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HnrLuZsBiw9T9ufj6/L+0HnsN1aIGOuKfxe7jez2gT4=; b=ndlF1fABOz9Gtx4BhlBQ10q6+L
	sgiwNRzqJjLzPvbkD9hsvkiFvK1YtHd7DOM0Ww/plIGXSOYxp8QqMxPPXvZKvVN71hqLlOFYJ8IZI
	IkQDs9yZQPxrlCAIjH7/YjNHECCm2Roa+RkjkMjRwJeDkxP4zqJq1OyK51eP7ogmOP9DQCqvWdExh
	MIkiuam9N0wlMrqjoIFvsucJ0aPULWgmenkotrzoTYi872desCnznmSGk2hrIYiEvcVsmmesb7snn
	Fj41HbGjWpAyjgOvsSAd54eGahEUpu8eTDgzs1WnoYhywYHogkXjWwIu0kkfRyvQchW2xeB6t6IMD
	c8vgAAIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxsGu-000jkB-Ev; Wed, 23 Nov 2022 16:06:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxsGI-000jd5-EG; Wed, 23 Nov 2022 16:06:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 030D961DE6;
	Wed, 23 Nov 2022 16:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50051C433C1;
	Wed, 23 Nov 2022 16:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669219569;
	bh=WQYGgaE2FlHz9BgmKebu5rd6gRZbPxNH81JDfaGj06Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IRYGO/4fmWR76PpS8av15fkBwXOLOYjBCFGPQZ4CE7XXUr3d5axzamdRf64l5ziWb
	 6V0iSRY0Fma2b04hVJUWIiSMN7woWN6izXe5wARaZ49bV5d8PypGDnBky3PT23f6e6
	 oODkeUsmmcGZjMHfQpygWcjZhTz0cetJTuHhE/9UrwUm912Fmttqq2ECOAGpUPCjGR
	 TYfO+DyHLVH+RKw0Ku8wBJeZVAuDQGTC1pUOyKIxPYVjl6TV8rfkEP038gXGvE/wqn
	 Lu/nyH1EkZoeRo00sO7GOR+WpdW4jOsVr2gtaIN/58BhNU5el8ZR+iwbpDAbCEGC61
	 dJb8u88vS0n4A==
Message-ID: <9b74bde1-53e8-0435-9913-af88f626d737@kernel.org>
Date: Wed, 23 Nov 2022 17:06:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v28 01/11] dt-bindings: arm: mediatek: mmsys: add vdosys1
 compatible for MT8195
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux@roeck-us.net, nfraprado@collabora.com
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, singo.chang@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221107072243.15748-1-nancy.lin@mediatek.com>
 <20221107072243.15748-2-nancy.lin@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20221107072243.15748-2-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_080610_538360_2C1228A8 
X-CRM114-Status: UNSURE (   9.93  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 07/11/2022 08:22, Nancy.Lin wrote:
> Add vdosys1 mmsys compatible for MT8195 platform.
> 
> For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding to
> 2 different power domains, different clock drivers and different
> mediatek-drm drivers.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Any reason for not CC-ing maintainers pointed out by get_maintainers.pl?

Best regards,
Krzysztof


