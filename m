Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90CAC5ACB3
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 14:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OqWPsQ6owNnLWYguSOo3gjWDHzyhMdFbXPhRMrxvmy0=; b=ScAshGYqayYTRyibOMtHJlP4VB
	DTU9mIRDOqeUxf9vlqotjTELhNrXWo0BCJSp0WMaxce4yXQSJl/nrpsCz98NmFiZ/gz28G01LImb/
	tG+9y6xRiM7AbYdHeY7s4sOBspltb0G4CEUXhAPcMwVNoGk0F6B/RIxfpwUK4jYqulDrx3oSyooZy
	mkYVjviRfEXm2Upv3xBRV7zndbohW03DWiDz2GxOxRG4cvgPJ7Szz2vlj0zbOKZo+4zUfzU9v6IJP
	6muOB7ZCQ6zD6cKPFYciLt/FR1XNzDrMLkGvGhusKM1dpEEE0YDfopjr1C/zfRUAwp6ddPkBNeBWo
	+dkD6Wbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3d9h-003fLi-1l;
	Thu, 16 Nov 2023 14:15:41 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3d9e-003fL2-33;
	Thu, 16 Nov 2023 14:15:40 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 82342660734A;
	Thu, 16 Nov 2023 14:15:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700144135;
	bh=EIPsM67ANJzpy88Piqk/eKq1WBdo5WSII3uZmoT8sOk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kPMkCqRYwKWnoOxHiRwASL+IIWJYbjM4FcTkMQHZt3rYct2xV3lG6J9SIMtEAVs86
	 Du5Kj9l38OjG4SOd43rnBBRz0fuWpXLo1B2XvV+kGzv9FRWVARc+eo5CFq/5IWkqV4
	 syjVJhywj3pJZQY3CcEb1kbZoId+l0j1N8pa3oRumqTQQBV51hVnozMRuy1IvGDl0B
	 yOsNVhj/rAxPXJ3iPv4jClAky0ERJ5x/SnMbw2EJuWNaQXf+z/aFEibpOzDlXtDmfz
	 7ck3+XwaJKxY7gSJwg/vT2Gtv8pGup9/4It/dE3pD4KTl80hxmyfJ9qhnuOKlWLG6P
	 yZdE+Ua8lXrLw==
Message-ID: <a5a3e14f-9e10-46cb-a0a3-f76248738a87@collabora.com>
Date: Thu, 16 Nov 2023 15:15:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] dt-bindings: soc: mediatek: add mt8186 and mt8195
 svs dt-bindings
Content-Language: en-US
To: Mark Tseng <chun-jen.tseng@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Roger Lu <roger.lu@mediatek.com>,
 Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20231116110447.3598-1-chun-jen.tseng@mediatek.com>
 <20231116110447.3598-4-chun-jen.tseng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231116110447.3598-4-chun-jen.tseng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_061539_140077_3CA5C544 
X-CRM114-Status: UNSURE (   5.76  )
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

Il 16/11/23 12:04, Mark Tseng ha scritto:
> Support more SoC svs compatible in dt-bindings.
> 1. MT8186
> 2. MT8195
> 
> Signed-off-by: Mark Tseng <chun-jen.tseng@mediatek.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



