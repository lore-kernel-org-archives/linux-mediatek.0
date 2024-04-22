Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78442C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 10:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0U4DzegP4NA1BFpwn8ZjTGgmn6lJFTbYfCuAtsmq9QI=; b=0BHhytaLu/1gOfm9SORLc3YeRt
	GyVlDtrUTmO5b0RJK2OFqbWiQCJTO4weJpR+UEvzKPcUUdPIE1tGVG/OKuvQYlIAOLBIrHTkqbAMP
	Ye1xhYifS/t4RflBvCN42XMfTR1zZmUzlES8sO9a2PD/IECp/Db4xkkORZnLhVScxxYgt3Ivr9brj
	EWBo+HEG2pnnnZ8PA8qjF6FmMZPXHy0Yp+VQsxhH52yf5OoCc5RuvP5pdE2eLtOl7b+tptLsvww6F
	vwB/32Iqmf6NFi5vmmcmCvf/j/Rn2zT0ueY0oemvLRwfQr7u5BI6rKo5fNBt5gE+IfV0wSWpF0deo
	UR8QVXrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryqnf-0000000D7u6-0Yr0;
	Mon, 22 Apr 2024 10:21:27 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryqnb-0000000D7so-1KpX;
	Mon, 22 Apr 2024 10:21:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713781281;
	bh=2be7ddOYKWR8xs1YeIaNBfdWx9fkiLTHGB9jAzYsguI=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=UOmS5MQN5C3p5c1asHHFVKeXkqh2yyHEn6CJSRseym/mTQ5PR3gr7r4VQfngGlwi4
	 KHMax/dK23ukKtcC257YZXmdxt21PGvpfZix6J5PSk1c1WSEH7u1IcbXj+K2t7Dcga
	 B9JsCE614rMFqvOV/EERcknjMhyhr6nXix/ecrN1S+yT/lbDUmvst3MFbQUPvJW3ng
	 it7Xnno9rAi6HQ2Xv/NBmYcNekAb/lmzXnsiiTICw6yd2ZNS43xgGL0bYc7kvHdnYU
	 WpNlBVIo8DoqI1QD+/hVo+ns+rieu3ulrwu6Fx+GgP1lSgBoe1WTjCfp07sYHf+EbD
	 QuQlYhn/TBA/A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 081DE3780C22;
	Mon, 22 Apr 2024 10:21:19 +0000 (UTC)
Message-ID: <2aa41e46-be3c-481a-a7a2-04214ad2e4cc@collabora.com>
Date: Mon, 22 Apr 2024 12:21:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: mediatek: Support MT8188
 dual-core SCP
To: Olivia Wen <olivia.wen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tinghan Shen <tinghan.shen@mediatek.com>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 jason-ch.chen@mediatek.com, yaya.chang@mediatek.com, teddy.chen@mediatek.com
References: <20240419084211.31901-1-olivia.wen@mediatek.com>
 <20240419084211.31901-2-olivia.wen@mediatek.com>
Content-Language: en-US
In-Reply-To: <20240419084211.31901-2-olivia.wen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_032123_490436_2DF50301 
X-CRM114-Status: UNSURE (   5.48  )
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

Il 19/04/24 10:42, Olivia Wen ha scritto:
> From: "olivia.wen" <olivia.wen@mediatek.com>
> 
> Under different applications, the MT8188 SCP can be used as single-core
> or dual-core.
> 
> Signed-off-by: olivia.wen <olivia.wen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



