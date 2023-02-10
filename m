Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D642CC05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 14:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XD1QEsEoVKxuTdi/IFHwBmm4Ml+OmXpBCIANz5CazGY=; b=1Ja3CvEe9WsdtY8b/nfLgzT9MF
	reGBzXtRDK4bLB4YOMP9r3ugVZmPXpEcUY88MLR9UqYcKIzvmMK2csVf2IrWT8vmHuT1EFxB343ze
	QHSHxFCLcMx9FyspFojO4NFeE8tBBVkxx7qlEXf+wrOWb8aBqIPWYku4jwwvhQVW3yYk/UDz14Mde
	hqaDRDSVdlibzU8/6qjcqIZxOLUA4SUxQuwuh7SPdbH+aNepoFvNb0hpTkVZvIS02CRQrmGPOV+QB
	MVYzrCTt0tRSbnT+FUQeerCk4rhtmoVKS9U4VxL6J21IWnBq8uauj8RWCt8gKMxgicg3Ck09Habva
	uj20zCsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQU1u-005xEL-B5; Fri, 10 Feb 2023 14:05:34 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQU1i-005x9P-E4; Fri, 10 Feb 2023 14:05:23 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 386D366020EA;
	Fri, 10 Feb 2023 14:05:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676037920;
	bh=cqDAyS7WEw+aJC1vtNbHL4JA5/YlZyKWTf2H2EDwQN8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k/JskO7+JOYOaDHViewiF5wyfP0mi7qPHKxV2/qqOkDHzaOuXUZ39HjNy/euqcyqz
	 mi9wnN7XAhafBsxnXAc+8AST7EA4vT8NtSboeWDwCLruVtp3Ezr8k/oSqikhkmfL/F
	 XpGejhiWfnUoB+kD5hxgA7yx6QHAEjnWbahqyplZE0RhTBCYdJosBGpfe/Qfi4jW9D
	 ndZNz24aCagf/8rPjaFB0nV9yTNeiHUcL05r+KG5w+3rN2Y3Bm1wk36C2m5jvWu/yD
	 R+FDqYpAGsgMWSvq4IxfmOSgdLx3f/ENdYS8i3S9jpogQa0jkAtEn98X557tTLWbKp
	 4FFMmdQW1K93Q==
Message-ID: <270c795f-e8c0-7458-edb9-ca407a3bc275@collabora.com>
Date: Fri, 10 Feb 2023 15:05:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v5 03/12] dt-bindings: remoteproc: mediatek: Support
 MT8195 dual-core SCP
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230210085931.8941-1-tinghan.shen@mediatek.com>
 <20230210085931.8941-4-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230210085931.8941-4-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_060522_673585_AF0017AB 
X-CRM114-Status: UNSURE (   9.06  )
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

Il 10/02/23 09:59, Tinghan Shen ha scritto:
> Extend the SCP binding to describe the MT8195 dual-core SCP.
> 
> Under different applications, the MT8195 SCP can be used as single-core
> or dual-core. This change keeps the single-core definition and
> adds new definitions for dual-core use case.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



