Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8DBC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 10:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HsCpvRzPomED9FwumsSQIkO6+wDK4h6lFTN37WI9Js=; b=UOjkUcZrlTcAzBeMSK4kwe2EJd
	XiT5prxV++dUcBxCn9W3v21ZkKxIsEczDmsXVnUQhH0wnGLSdQ/sxhPR+TB35n27ACmj37AIBiodw
	PPCWIQRfBp5k/Tibrnh4PCw5xKyPEEMKWxOz966XCDxwnZuQQ8R61GMrwp8txyJEAfGJZSAInMMD/
	I8W6fHwj0Gv7MKJ3eqRHm0uJrVmPMzBsn0Weh13t6CuMEAIhK/4m4EFzUiEaO//AxUfOcA16irXe6
	wGlD+ceKu/Jjs6L5WgAdjHBZJvkDMGhIxmTBs5AYazyZS8nrNlNqP3uRcQ7CjuHeq/lPdLBfGM7n1
	wzcSyYTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryr22-0000000DBBD-2Ovr;
	Mon, 22 Apr 2024 10:36:18 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryr1z-0000000DBAS-1h8S;
	Mon, 22 Apr 2024 10:36:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713782173;
	bh=qB9ESYnlpbBc8BQ5YozfKxN503oTQZjT1vyLxzz2ACA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tBAQuJb2cAfsbp/fccSgu0p6Iv5kqUcLHBPBRZZUYpjxvp5ltUnL4Z5H2QOOnkbbD
	 CkBW3YMOe3NyAKYXoEOKB4/GpP7tZ+XxP5G7eYJ8d4fS0wlI12zQmezlNvaevjhQ8t
	 WwhViHbhgcVUK2SViflBgIT4b7DCmhVcWPkE2ZqQdR3wChS8/iKLle6r6o0xqywAsM
	 oB+6rX4OueyVW1SpD3VYSbghLnoebXABmhz1av7c+0PwkUz2q3M8ueJkfPBHTZY9E8
	 ScsNtOxemBBXsq0oUcf2g7B0Tvv+sa4Eg5S1TQB65J3jZevtiVC0vfTHwL6f73qIdq
	 8oMsgFqFCV4jQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B6E9A3780C22;
	Mon, 22 Apr 2024 10:36:12 +0000 (UTC)
Message-ID: <1b066d9b-866c-40d9-a65e-71a7ae85475d@collabora.com>
Date: Mon, 22 Apr 2024 12:36:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: mt8390-genio-700-evk: remove
 spi2
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Yow-shin Liou <yow-shin.liou@mediatek.com>,
 Jason-ch Chen <Jason-ch.Chen@mediatek.com>,
 Chris-qj chen <chris-qj.chen@mediatek.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20240422093926.15392-1-macpaul.lin@mediatek.com>
 <20240422093926.15392-3-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240422093926.15392-3-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_033615_614219_D86EC246 
X-CRM114-Status: UNSURE (   6.96  )
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

Il 22/04/24 11:39, Macpaul Lin ha scritto:
> Remove spi2 node since this is usually be overridden by
> dtbo overlay.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

There's no *.dtso for this board yet, so it's not getting overridden by any dtbo
overlay.

If you add one, you can remove this - otherwise, no.

Thanks,
Angelo


