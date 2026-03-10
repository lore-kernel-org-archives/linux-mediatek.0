Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64114EB105E
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 14:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9H0d8aFWKU1KFJZUQtg2Sicpku1crFS+AYWgA9O+B+Y=; b=u62IuUxSAQBob/G6lzwFFUaBv6
	aD1loile/f1zn4ZTbjyEHGyQIBKCMslQkAgBI0DCbgs/Pcw+1UA/gs30o4phicXytxq3dx1oOxKMC
	dqUFRYMkDsMyU7yUeNttSF0seQirM4x/TfBJtgHnBonC+AP/k3aoqynz3dDp20DW1IV7t8NUPCgMn
	M/YBTsbnMDJK6rN2Fv2pd2F+pTw0emBB/gDGwpzrMumk42MEPp0cKf1s6OrnKYvR1/0Vcb90RF11v
	tTINXHi+bauEluCM84vw2K/AmtvrIMQSJOKWK2OLh/QvUOY9O3tWBUMJz96L2qwbB+n8m9pD+sP+K
	A/wN73UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyBK-00000009htB-1dMJ;
	Tue, 10 Mar 2026 14:35:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyBC-00000009hpP-3du1;
	Tue, 10 Mar 2026 14:35:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773153323;
	bh=i9yJ9pRi2fspdy5B+ragvbbhvuj4nCBlo3PLYcUWQkA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FNfhRcLn65GaYJlZv0bP0T8USQp50RpWKPufbPN6GWQ7+TYwx4CC69TkLlJwJ+mcZ
	 if0WY/RdseFKXn11K/XhqkskOIqygKdSPbFb9H2UUug590Leo4sUMsSdYR1cGZEINS
	 X0QX6L6GqyJIkQ+YL63HuILaEUnUxrPtAWPUMh2Hq1zV6QhcGcLsSqcc/l6PKBC4Uh
	 TOptS2UM1LREFSGTnlz0jUyeaSyAfc7fvFOvVgHvlH5JeBvtbLwkR9XRpRz+0CkslQ
	 VWx/1H5eisK/YjffDnc3eLFfUTkFwROAtymsz/aAs0gQgUsrYQF14VcZmBO8rEzAQ9
	 R3o+fWwozmoTQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C860217E13A8;
	Tue, 10 Mar 2026 15:35:22 +0100 (CET)
Message-ID: <213cdf5b-eb48-4fac-8023-5d1d80d6f1ae@collabora.com>
Date: Tue, 10 Mar 2026 15:35:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] rpmsg: Constify buffer passed to send API
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-media@vger.kernel.org, Mathieu Poirier <mathieuu.poirier@linaro.org>
References: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
 <20260310-rpmsg-send-const-v2-3-0e94c5db9bf4@oss.qualcomm.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260310-rpmsg-send-const-v2-3-0e94c5db9bf4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_073527_108058_632B75B1 
X-CRM114-Status: UNSURE (   8.54  )
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

Il 10/03/26 12:22, Krzysztof Kozlowski ha scritto:
> The rpmsg_send(), rpmsg_sendto() and other variants of sending
> interfaces should only send the passed data, without modifying its
> contents, so mark pointer 'data' as pointer to const.  All users of this
> interface already follow this approach, so only the function
> declarations have to be updated.
> 
> Acked-by: Mathieu Poirier <mathieuu.poirier@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



