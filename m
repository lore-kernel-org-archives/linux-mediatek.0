Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967E4C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 13:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWW6/qzhE1ggG621LPvIbpUcYPST0Xd8E5d4dlu1l28=; b=f//Rq/CsOMYLww
	gfSG3giyNATioIAUeXX+kYIOAre6lCiybD7VG0boO8EfbL2nKkGsp5sUYDIHP06zoqZcMrrjDgHra
	jx/7A4yPE6KIpHUfACFxaIzf35WUB6Har9JAs4RvYS8tlAyAuVYcMk0/e6jxBBjB+iCmKIydsxFzS
	aMX6wz4gmIRBj2lowBafjKePR9d5bq6i8ZWfJO7HazF2vXSO5jdY77Le0sGNhTyfxjQeDI9GuubWr
	/n4z4Hr8a94k33cKIDmY611xB6uTDTpgB30FUqvTA/+nceet5VjquVu8HAPjhGpDFghY+Vn+JT7xW
	pOVswfcIOTsaGK+bEy+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL3Qx-00EcrB-G7; Fri, 18 Feb 2022 13:36:27 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL2o9-00ELkj-Uf; Fri, 18 Feb 2022 12:56:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 19A971F46910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645188980;
 bh=uTrs0iGpet0hB7fvu9Fq9q2SGeE6Ag+LJv9/NiWa+1o=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=WQsTRT8IGihAUjMC5wMtRguyPezEtkoidxgsN/MJHZYwKrcD9Ipye768N701zA6vF
 pzp+qgWCPiSCFTRfdBeDkmfv917k6Ih4+6dFDMtwbW9KnlxQ5m9E/t3/ThyvK+beGH
 jOh06U7IrqwLyChqj82/Es3ydkLssuoSor9//5HwnZeC1UgNmbfNlWrX2CMl5/05zA
 QIb7zZiW6R/4NFH4Dn3dVUAdzWV4yRQjXY+IVImQS4vuShTvR2IMYqzZG/y6K4YO2J
 eCSlqmPqxCjyWioiOJOEy4Hui+HNKDG3pt3mLEW7bfFYTSOMjc6Wh/vm5rA4kR9vOe
 wAK4eW0axprTA==
Message-ID: <870bdae1-309e-fef4-0312-e50c33abf020@collabora.com>
Date: Fri, 18 Feb 2022 13:56:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 20/23] arm64: dts: mt8192: Add display nodes
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-21-allen-kh.cheng@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220218091633.9368-21-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_045622_207744_5F62A2C8 
X-CRM114-Status: UNSURE (   6.46  )
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
> Add display nodes for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
