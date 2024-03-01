Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9690C5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 08:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2pMQJG3P2eQ9Ef0H+yQJzYMmR/JNrJJ02+6D62HRJWw=; b=E3u7q2Muf7xt1RPCCY52Vd/kTp
	88r/bD4kyNK0oKFZFZIv9zSDyb7efrjRlHwqqRMT5ugnfJC0xaunVAuk8ry11OqwL+m1YB3RYRpsr
	ZUwSa0eL6XuMPjl3pDE5zjAnEZENbwvoCojE+LhUoEP45ltq9hyFW0e37FaC/kR0Mh0d+m0MImcZ8
	vVfiOs0jBjOY93x+ns80GJVuhhQZKySLicmM1nnPZnC11/9PuFJatOnokqQWPkT8/HH7XN2mp+U1r
	Mz3fOC/+FtIA+n6a39PHAyCu4acgWit9BgJNuPITMuacddiKeGsoa0mmet+/C+4WML7w6jBP1C/1t
	vZ5KCVdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfyZK-0000000Gyi8-3pZg;
	Fri, 01 Mar 2024 08:48:38 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfyZI-0000000Gygf-0YUm;
	Fri, 01 Mar 2024 08:48:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709282912;
	bh=FNk79zFXeYWQnbnsxxWTrbJ6d8shuW3/xi5dNaAa0ZM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=etN8nzlpQ0m7Q0Ks13XRtJumPGgOkExxuY3wrNoGTAppx6S6sxRmN3rD7OWTKkYTF
	 cDpzmlFzmAlBtQq97XOSj/tWoftQVsNNGherQg1/v66FP6Gorii83H+wvthjBfGdSd
	 5ik6Ci4TVpvhvhemG9VOX1HJto/vZDlgmZ0Mr8VidLJ2/RlfCVXMxBlzsKcTbGUTCt
	 zdKO7ZXHxggdXOpRR9FN9cX3Ht72tnkl7UQhLiF/bAPtNapjdrQGvtVL22ZngQ6+Nb
	 cbfpaR3eZoLirifB+qHV+5wNaoshXcdXzkd234Jqsuqsz8aI5/jxZXUWD2aFpXS16w
	 5Vi9T8/NXl6yw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AEF0737814A4;
	Fri,  1 Mar 2024 08:48:31 +0000 (UTC)
Message-ID: <48962bd6-3d46-4d3f-b722-1820b8b9530f@collabora.com>
Date: Fri, 1 Mar 2024 09:48:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: mediatek: mt8192: Add missing
 gce-client-reg to mutex
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 "Nancy.Lin" <nancy.lin@mediatek.com>, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240229-gce-client-reg-add-missing-mt8192-95-v1-0-b12c233a8a33@collabora.com>
 <20240229-gce-client-reg-add-missing-mt8192-95-v1-1-b12c233a8a33@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240229-gce-client-reg-add-missing-mt8192-95-v1-1-b12c233a8a33@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_004836_325260_2CB3C820 
X-CRM114-Status: UNSURE (   8.20  )
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

Il 29/02/24 20:44, Nícolas F. R. A. Prado ha scritto:
> Add the missing mediatek,gce-client-reg property to the mutex node to
> allow it to use the GCE. This prevents the "can't parse gce-client-reg
> property" error from being printed and should result in better
> performance.
> 
> Fixes: b4b75bac952b ("arm64: dts: mt8192: Add display nodes")
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



