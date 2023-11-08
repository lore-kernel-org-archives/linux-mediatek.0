Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B467C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Nov 2023 10:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWVTCFuiah+4cH3nVc3Q9Jb7V98Tih9EBfEZsaTmgDw=; b=Ty/noepxv7QmNKNLtM5FTr8Z8h
	v/f968Rje1sKB4PIIBdvG8er4veM4l6soy3EySoFs/+ComikCvOD49Kk4Epq1ixXQSZoQYh1Ld8LQ
	/uZsXQnsgg47sE9R1sTNaNJ6RlLOgHcafEMkj7Qn7ksYBaUoYdKJYiqBmd6j3HkDlgyKbclP0WZ6o
	OXQqT33v6+8iQlUowj7OXetnY08yHh0XH9fIzgGb2Sodjbc8+d+Wnm3z7eETks5CsARGuDSGXChH0
	tiVc6qNXh6lOXdLu0SebkxtEINLNrY0lhc5fcEvtVUax81CvD2Q9lcXg9IE4u/gTAht1/vLY6gc/B
	rfsshSQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0fnm-003Rkf-1Z;
	Wed, 08 Nov 2023 10:28:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0fni-003Rjk-0u;
	Wed, 08 Nov 2023 10:28:48 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 47BFC66074ED;
	Wed,  8 Nov 2023 10:28:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699439325;
	bh=GcdHSJgeWmGJHtZ0x7dgpKg31f7UCRSoxm5HSXeUxRo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OWOcC1BhTdlJM3ym30ZgZXQjJCqmdW2mFzl+wEdTSILf40dl1hzI9LgQjOxv0elap
	 8NsGvetL9Yh1Yx6shGwMW3lKKMwd2kPfskgU2NTgkuhJk8jnTqb2KBzgTFU/lKYLgz
	 vTGbNUSxgHb1lYK5ZUQ7g8RBj/soMmxG9Si/4oimWQ7E2VxwfXvp/p4aLr0ZdhOHBF
	 TA2DkvLt1aXxIiwHDsvjV3+ba0rxQEZFfVxpBHnPSG7zQGXWWuxS9htJIoyrwl6di4
	 rmzxDp4qZh5SjdIVZb664dRHGrNH/YrfWPHVliYc5WxsadqetM8YbWrGpJD2Co5H+Q
	 HAwFCrAQFy3Dg==
Message-ID: <f45ab1e1-8c42-4923-9fa4-fc93cea8cfe0@collabora.com>
Date: Wed, 8 Nov 2023 11:28:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8192: Add SVS node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230710025834.20513-1-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230710025834.20513-1-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_022846_447909_5E64F0E4 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 10/07/23 04:58, Allen-KH Cheng ha scritto:
> Add MediaTek Smart Voltage Scaling (SVS) node for MT8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



