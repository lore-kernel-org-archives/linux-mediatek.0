Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C77CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 13:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M08Ecpl/M/yRGPCCwojXUmLKmmqyyEiJYdK/72ijUiE=; b=0fxuWDJ/MkpSKr
	kyU7O6KhiC2LcqVMr3xFWoFyUg5IShbUpx0RB66DI86Kd/BjLUx1OHaSK8bX/irgQeg4Bjx52z5cn
	SJpvdf2FPp9wXmojYbxBRwb/+drp9HJB3IZRlHQhPPMXUK7Ym26t7iVtjlEm2OpKeJm/oh3Nymw7c
	jzYQED4e2k0NX8qWK1mUifjPeQrfBAAoF/3WzJFSLIfMA+s9lFhZ3XFlj5B5zbBHbjihGwc6zVfOZ
	CMOYg2OI9xl6+BdMd2bhDQI8fr2n1UwLuyTdipPvjIXBFh82NJdiUC4bprjsuqip+EOLRmw1giVa4
	mPV20MZU0DvVfsvBW+Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL3Az-00EW3R-VC; Fri, 18 Feb 2022 13:19:58 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL2nC-00ELGJ-Bq; Fri, 18 Feb 2022 12:55:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 632611F46910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645188921;
 bh=EPiC567TIFwNwEo5C2DPJ8rGuw9NLCQAHV18pXSm2Bc=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=fEPY4GauWbcMLtGvjhm9gQCQU5NUBSDSaQxGTY1R4pS0JIFlfxpVs6l+QniNlV2OA
 YZvYmBkyix3JYbEyvNFtcFPq9RLrgzVSQpKXJD0ZkJomxjRPmhqsrJDNAl6AeYEnnx
 R5k5egSSRz2Rp1SmONYZKKb60Fgsb6Uxc2UT+4kmMQt2NONJtsCWlVm5vyA7dUdPcn
 AmuOHpvIKyKwsaRuKwn2a5Qy0h6z1QAux9fA9EXqLPeR/92sxzX630JVX5isaGud7O
 +zlRvK8AtvL7HSXgm2dxTioiiehQEdicKB6i8HnYaeCZJv5gepsmF2uwggeAuYOBoI
 fDxWt34/xLJoQ==
Message-ID: <736ee958-2326-f025-2c45-77c3d3e55edf@collabora.com>
Date: Fri, 18 Feb 2022 13:55:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 04/23] arm64: dts: mt8192: Add gce node
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-5-allen-kh.cheng@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220218091633.9368-5-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_045522_607693_33A5299A 
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
> Add gce node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
