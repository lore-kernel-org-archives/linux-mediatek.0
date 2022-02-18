Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96ACC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 13:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sLj9Y8uGh75SxF30ueFILG16Uhe9EsNNmeKES5NVfWs=; b=ELWkq1+DicbNSK
	Uruc9n7q8zvHH5xB8kkGwjWNYwmKKqv3V3SXIz+2M4Qunj/ysx5068suKvIN2zjeBiC03fny4gwXO
	v/o6E5/ue7dO1dmGFInT/l29/k2YZAIQYrvX0n3eRZaCh001LHuw3AaJpSLiVxe5RQnp+muOu2tii
	6v3yV+FJOJw6UUlGxisO7HK+kAoDIxjrgh35oKbMxN2qYomKAlk/kKLNmHLwL1XpXEuZ6C3ZfC6Cj
	o+5nPXwS6NS2iIvvkG+bXVPNJZojMkkFr/Q2lVD4eRbZ7okIIdVG88OEDVtghYfO6GDsckryaz649
	Fy6N1OG7S/um3BNcY5hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL3Bp-00EWPj-FT; Fri, 18 Feb 2022 13:20:49 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL2nG-00ELIW-59; Fri, 18 Feb 2022 12:55:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 48D701F4241F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645188925;
 bh=2TJxTk0LuUKF/ZSF5CGiEwtO+jC4dl5uLAMmRWgbMtU=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=QTqxlgziKH1SwAdM5296IkyLCb62/mtbqbh7yTWuKBZQY3ePgNoh96am6OTXmVhOD
 XAUnuPicfp57sO6D/Y9xuY5365xDQMMBVgmzCv1QkhywCQJ1NdRRmkqeIlNW/z4Mp3
 3td9f50+nOC2l5IPfs3vq/0rj/1Bbf1r9dysm/+DPlZqcsjFRXsPtYsx8GW5Cmh19M
 TyDuQjGXSO7f1g9aJI68PvYmANfpZIJlONeXh3q2QhvGfqeX9SngcB7psp5una2R5J
 R/8scisESAH0jF2knrzApDGqIJSFb9zWzV7qwBFilpUlxB8UJSz8296mELZ8BkOsLW
 Sv5zkBVupw+Nw==
Message-ID: <b6eb7555-9b31-f6d5-93d0-ccf22adacb71@collabora.com>
Date: Fri, 18 Feb 2022 13:55:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 03/23] arm64: dts: mt8192: Add spmi node
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-4-allen-kh.cheng@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220218091633.9368-4-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_045526_396289_86D9ABF5 
X-CRM114-Status: UNSURE (   6.85  )
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

Il 18/02/22 10:16, Allen-KH Cheng ha scritto:
> Add spmi node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
