Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25647C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 13:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nYnY7O3k0PAE7edWWRRbtiDEMgg2hHH+NAs8HQjhdqU=; b=Dvd8Se801HiUp7
	TkeFEHA4a+5TMzvgvyvjQiwnqq36ajLLxFGYw4qzi02OAN3r43EYliZCjflBVWgWCQOqu58VWXw6Q
	qSf0j7cOwVfcHrSlH7tV+teDfp0iPIDq/uY3GfAVaBqSnZIkK9tX6j2ooRhmBPlXE5uhm3So33RjC
	puk55K2JR52hXSSZObjjTBR6nBOYE2TmCxtp5jfCWqM9iwEDHaLwNyB+MgpKCrnb2wXaCHsDMbhva
	vWQIfr8ZDjHodHpiBZFmCROLKgPtXveTMaDGJWSkbB6M6yhiJgOy93yUijXVtzUwGeQM/JrK0vPlX
	v517ifRADFrjIUw+dUdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL3DL-00EX5d-KT; Fri, 18 Feb 2022 13:22:23 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL2nM-00ELLN-2C; Fri, 18 Feb 2022 12:55:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1883E1F469B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645188930;
 bh=Qe1GV5ntwY224GpH3mDeY8hjTlrLQF+I8Rv72GgKwbo=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=MNy2YI6n3JxkNurvi4QeqdE2LKT3dAuu2ykGswNiVWheZJ7gMaEZSdBgTchM4Gd1x
 suU71IPup/ANknva4rh/HsXevDQWZjnSXLiiOVql7cL+isT7q0WGzx8D1xZt3Ozc0f
 DO/0jHXXMQauhq0nYlsklak6dsIn5ope30BItvUvd2WOrBtitu3EB29fTEGjFW0WUt
 KWCNCaKHY0XD2biZrBj3oweGRPs7U1oRQ6Sd27HjL7d1gnOesQNg28ZUhf8aCSTFrr
 FIQPpoNmgREb1qMn/iSqv9cMNSAq6xdOp+txcR+8qxr8E5CcHz5qK/roATl1IsSHCk
 RpMVO1OQ6YQXg==
Message-ID: <6d9716bc-e78b-22bd-fb76-9d82c360e046@collabora.com>
Date: Fri, 18 Feb 2022 13:55:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 01/23] arm64: dts: mt8192: Add power domains controller
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-2-allen-kh.cheng@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220218091633.9368-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_045532_301854_4E1AD7F2 
X-CRM114-Status: UNSURE (   6.24  )
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
> Add power domains controller node for SoC mt8192.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
