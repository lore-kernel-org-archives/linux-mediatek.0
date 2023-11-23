Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C273AC61DF7
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 22:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AlzBAdXlEJqo3JGgHVMrzmyLNBJ86/rD4+jxJfhvHWo=; b=NhjYWCUR2XlX3sDI+UJDyddVLg
	bOjTBt8W5seoAuXwOH5/vKCIyeOP0EMzZbGBlU6cknHZygcW2Dq9KyHOWjgLA3b38pz1CWe2bdh6h
	ngHKqyg/+SNU8Fl0p1fNCBUot/jAkhx7NoUCFgOg5mKHocxyPMbHTUdyTYdMOkbxjNW9A1CyyviRB
	qibOeBtYBEhrn0OW7Y+7JWa6PsYe6OZRHg0mtOzpNU+3lLARdL2cGi9qEJ9EO/FvtHpLW/BR5Xf4Y
	5SK79U/zWefiaHxqSef1Beg9AOzDG+PNFIopAyUX9qFapST00iUTfcs1gI1chrVwMAAOnPidM/jnh
	N8N/fllg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Id6-005o7f-1S;
	Thu, 23 Nov 2023 22:57:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Id3-005o6t-0N;
	Thu, 23 Nov 2023 22:57:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 7C39FB82D77;
	Thu, 23 Nov 2023 22:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D596C433C7;
	Thu, 23 Nov 2023 22:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700780218;
	bh=xrj+obBZs3qijThw6u7kIITase46Q1QURXGiZSMGFBI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Y1gYtJQtAsh/3wDkm1vHs4w6EFT+mCVIJim+KIK4QMFoBPToLX+XkRyHlJdL0ifEt
	 /wMOEiin3ay+eZhGsN/Mje8lKfSCTvzvlmwaWOOQ85kxvS4+BZ1hQsgyNM7uxvHHnV
	 cJdMWAVyZrQszH7Y/xNibCt2eHHodroA6dTLIAHT2AX4Fd0M/xFKy1kIsCy6b+KwUG
	 s6hN4kFDEZWpi1mrThOEzSbMh39+Xk0us1+VIsqVubslupACV+nQG8Yg81nSxLzjZT
	 jDr/3g+D/ZuhH5UsoPym38EDYqtVbxgzLqEiFFePC7JJOYi0RFVtYsivtGzaQQPILm
	 vQ2SwaTuz5W1w==
MIME-Version: 1.0
Date: Thu, 23 Nov 2023 23:56:52 +0100
From: Michael Walle <mwalle@kernel.org>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding
 <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Xinlei Lee <xinlei.lee@mediatek.com>
Subject: Re: [PATCH] dt-bindings: pwm: remove Xinlei's mail
In-Reply-To: <20231123172823.4offrr7w4tsrhl4y@pengutronix.de>
References: <20231123134716.2033769-1-mwalle@kernel.org>
 <20231123172823.4offrr7w4tsrhl4y@pengutronix.de>
Message-ID: <bdfe874642d0b24c7e0ceeb1109361ff@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_145701_292556_838D84AB 
X-CRM114-Status: UNSURE (   5.35  )
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

>>  maintainers:
>>    - Jitao Shi <jitao.shi@mediatek.com>
>> -  - Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Xinlei is also listed as maintainer in
> Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml.

https://lore.kernel.org/all/20231123134927.2034024-1-mwalle@kernel.org/

In hindsight, I should probably have put both patches in one series..

-michael

