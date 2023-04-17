Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCD5C77B72
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 07:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6Xhtyph4cLXWmWxGa3yPeSvP8dtWdVvmItaubPfmPM=; b=0pK8NmCY26AOD6ydOAJ3dLWGpZ
	txoo6xy69Qs7+rXADnHWo5nm+pxGcW5sxgEvd8/V7EZ+thtHjIWbJKeMzzQjX8vcBc90WsKiMrn5p
	lk96b5GhnpSXwSrYQC098ZUzZ+7cFr4o2Jl76to+0eMBUmbRLzLOCRfLiQzBq8PqZvOvsVIBqWDQR
	7q/38hQ7eYv1+v8kIpBXLAYN6pYf4XMYcRUf8O/UUxbjFS5UcYZcLPaJDqqhYCFNLYOyY6k4qlzUg
	GvayIpPvsNbbf2grm5o4j+ttGFyOglgLwpWzGb3kqWmM+Cwgl4cFDrUOKpUngxXSVcOJLz6TWHQtE
	pe8bMSdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poJS9-00FDQs-2q;
	Mon, 17 Apr 2023 07:39:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poJS5-00FDMA-1g;
	Mon, 17 Apr 2023 07:39:07 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 291FA6602F91;
	Mon, 17 Apr 2023 08:39:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681717141;
	bh=EiNOtPE+lhG3aPoSAyOgtZ67mh+dWMxFs/Uq9B0YnJ8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lU0itS7YxkQVm5YQFoUgsqWn6Vd06iFLiHynBxqblggbo2MEPzBT9spA2Zqfk4UFJ
	 Cbn6jnVbdcE6SP9XuzTJUpIa+a26j8PNE5v1HgXyYTB7WakjfRLirje5oUn7+TtKnd
	 bLcSHcZvINymW6HM5iAOoi/D+yz/GJAGpB4jOX8Zjk4TD0ZZ2renr3eNnM2c+Al26Z
	 eoq+f8VLGcbey/5VL4MV2Tbg+sprTWOj8W89BZyma/PlYpbTWa/J1mV/8LqvmAAXVV
	 9ekNPLBtSrrSH9BW4YLhf3RIVVkMKjoBceZ393ExGtxsz1AYo0+QFBRYctCQPodwsw
	 Wea+5pJxYXv8A==
Message-ID: <447c1e8a-b3cd-0515-3998-edf3d2f5d476@collabora.com>
Date: Mon, 17 Apr 2023 09:38:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] phy: mediatek: fix returning garbage
To: Tom Rix <trix@redhat.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, matthias.bgg@gmail.com, nathan@kernel.org,
 ndesaulniers@google.com, granquet@baylibre.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230414122253.3171524-1-trix@redhat.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230414122253.3171524-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_003905_768885_5ADDF83B 
X-CRM114-Status: UNSURE (   6.60  )
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

Il 14/04/23 14:22, Tom Rix ha scritto:
> clang reports
> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable
>    'ret' is uninitialized when used here [-Werror,-Wuninitialized]
>          if (ret)
>              ^~~
> ret should have been set by the preceding call to mtk_hdmi_pll_set_hw.
> 
> Fixes: 45810d486bb4 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
> Signed-off-by: Tom Rix <trix@redhat.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



