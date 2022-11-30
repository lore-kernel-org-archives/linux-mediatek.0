Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971EEC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 11:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtw3viLufrNMyaqM5DWZS1sfqZXPVHJbOtLFNMg7BsI=; b=qc5KRqhxvjYB8TeBCk7LCse7/B
	GghYJHWe/Kdct1YsdUEX9R1VZtkFkx+563bRbx2BwStPTNa4alfPzlscTj0skZYd/CbikRbkElPuh
	9zrJ/BOh3riNgV1a1CZ5rRKlDHNNbmsx40B17hqfOqOa1cydlMEBzRwRwBD506Irjy3dcv0qdpD+q
	PRhm71+Bqi4YnNEKb1Rzt+si7/Hc53bxt6IGGp4nKmOGuGOcopIw6WAwhRzrEexzfr8sMTDdx1+rQ
	te0qGDxq+uoXy6ku66a9H3pB0kYfHpfFsTVOqxsmpyKPV2z2oAUJZvAfZAEpKAgBttL6fKM2aXde4
	cpgtvPPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0LFt-00Fo4z-AG; Wed, 30 Nov 2022 11:27:57 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0LFX-00Fnug-Qd; Wed, 30 Nov 2022 11:27:37 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9C8F16602B54;
	Wed, 30 Nov 2022 11:27:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669807654;
	bh=kWjNWvSSWzmMWFlVFsu7JLK0HHOMIvZT6PtRFM1iPPY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n06qiu0wTRMYK0ayVkLisLO4lHylw8YLI9bcrNnrn62e48f9rST8I0TSHWbLTBb79
	 MEtMaa4S/dKv1Oc4h8BTqTV6pTbW4k4vBt5wrA8V9W23J8cjoyTMQjNeNRdIvpsXLv
	 f1BMly73nthosBDqCpYoriQTE3LcN/ya5j/GV7ZWExTmvezYOeWtGbkiT6azXMtSCL
	 DppGfPtR+/BWd1v8ovi5v7yjgwr9Uehf+f+U4wM0t0tmeKQ4dbAZ8Uv/K0HDxbJyVU
	 4EvGYmasu3oXZEFLOyNQpZzT0Zu4DLPdQ8RHJLeORMlbz92vTpWPX+D01xXF3aRNBr
	 1r7hyd09xu5Pw==
Message-ID: <d97d1fb3-3fa1-beaf-a351-3cc8ded2ca5f@collabora.com>
Date: Wed, 30 Nov 2022 12:27:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v5 3/3] arm64: dts: mt8192: Add video-codec nodes
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, yunfei.dong@mediatek.com
References: <20221128143832.25584-1-allen-kh.cheng@mediatek.com>
 <20221128143832.25584-4-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221128143832.25584-4-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_032736_021904_065D6B22 
X-CRM114-Status: UNSURE (   8.32  )
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

Il 28/11/22 15:38, Allen-KH Cheng ha scritto:
> Add video-codec lat and core nodes for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


