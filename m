Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEFFC48260
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Feb 2024 12:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TF0yCZor+aud4S0yD7mvWXwyr7HqvaebsAgj1qj+Meo=; b=blnjKAMPBuIR9ybbfOhJ+/bwyg
	LdpwpBMh3K5yZz2MU2g99stmGw4TqjI32MWbPVYv+03a4y5YsgL9loDggY995vR9XPbXFMOTAHKIP
	Kna6RHELDS376JsCB+dbAdUns6VQQ8bc+7+6sDSBcsMlquzRyfgn2ocd+6vMygvrF3NQQCSF3D4j/
	hSE6iqOJjQXEMlL6SzZiVAvk3tdAmDoaTYxIbyTeOv8gexr3AqgXOK5DVa+gQ2qnqKcq37MBo9iEm
	zexksDrroKsT7Z5bY3kCauElpgUXcZPccnZE3iVqKwlPsdJlYu1la3QYnPokE7Fb41Vk24YhB+JSA
	4xGKq01A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raxQv-00000002JHE-1el0;
	Fri, 16 Feb 2024 12:35:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raxQr-00000002JFN-3OqL;
	Fri, 16 Feb 2024 12:35:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4E70661B3B;
	Fri, 16 Feb 2024 12:35:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F96C43390;
	Fri, 16 Feb 2024 12:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708086909;
	bh=riZV/gkwObqh/32FznqVlHkFGhQ6oMb4j7nisfi+Pj8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GbvU/Ry5/vrxGXr+/cJ3ce+0WWNod37nCHhivKlwvOvOdU5rB51aeeuNiEHWGi+8U
	 TXcgT9qIiajvxhmUVcdq9QiyvNJO934lWk/dSBK1mHGl1qC52TivCDJiNA3gjEkbOK
	 Jujz3PrRMuF3/zL1pp1CFwJdkmJu+dQ9Gl/6h22lnW0l/yY6H6QSrS+VpCo7YWm/bT
	 lMZfmM73SdV1EKg7JQYCsf8aadyoODC1NHPcwbSRF0ag4mDj9WmJ+iT6fbdS4LMrnp
	 OiHS+V5j/x/7KZw/4N6vqdOTXTkXo9IhSr0aJNQyCwXOneWWbM0qaL2814yyhoK2fU
	 wEBhPlEo4mgjA==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
In-Reply-To: <20240213063919.20196-1-zajec5@gmail.com>
References: <20240213063919.20196-1-zajec5@gmail.com>
Subject: Re: [PATCH] dt-bindings: dma: convert MediaTek High-Speed
 controller to the json-schema
Message-Id: <170808690375.369652.1439304081643409723.b4-ty@kernel.org>
Date: Fri, 16 Feb 2024 18:05:03 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_043509_910730_1B93439A 
X-CRM114-Status: UNSURE (   5.39  )
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


On Tue, 13 Feb 2024 07:39:19 +0100, Rafał Miłecki wrote:
> This helps validating DTS files. Introduced changes:
> 1. Adjusted "reg" in example
> 2. Added includes to example
> 
> 

Applied, thanks!

[1/1] dt-bindings: dma: convert MediaTek High-Speed controller to the json-schema
      commit: fa3400504824944ec04bd3f236fd5ac57c099fd5

Best regards,
-- 
~Vinod



