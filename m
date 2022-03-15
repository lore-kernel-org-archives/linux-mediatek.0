Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A50C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 14:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pBzsz3TeXsBkTdjur3HAl6+GieBf/midiNXTrwaeG4U=; b=bfdjCLotCMCWVK
	pPQPd6fJg51aApJHaZ8FUQvRcRCBJTRLYWkH+1LwVdezIImeqiJkADTWW7jrJ26ZAZ99Gr5O+sAmz
	fM7x0hbixUyEGqZrBgC7zTWOGmJYNz4jMv3hUyVW4WGDNkeLROIfl6y8QPJCKUyFHsGMPggzKTu5f
	Et5dPAhO4w1us1U14ASTu71uVZWDFesoZCdZzVIC6nh0Vfw1KGE1kKH/5TXjj59BXjcqeuqohByG6
	pn0gApPbDCDO6aWI+rv9ekmJKFGkoMqbop0pUsm/nhCcdThoG1nrNlI3dYL4Jz+EOmFNxzVlwgPZP
	eEWmZ3ZYHTBUHEiidocw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU8Gb-009TKF-LS; Tue, 15 Mar 2022 14:35:17 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU8Fp-009SwH-TQ; Tue, 15 Mar 2022 14:34:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9EC871F4435A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647354868;
 bh=JxMqM+6uXDMiR30ZOq7gXJqAurfbpVtQGVTFxdg00Bs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ND7xzCPUGu+KFVhFs2po+GLOe/NdZOeF+kj2Sct+iWDSXXg7/rCnaO4KQuGa0ueQy
 wCN56DNvXE/KlskSGgmhihQp7gsePXMvkYFuqsVM4n4/Pa4UhEPclmTOHClIMOukva
 06DaNA0aLLSU7ULg/98ogbAnRiKI3+7bpM/UjqY+5gvfZY34txEexotzuL9tbn+yQp
 Vt5PnoNxx6h81IFblON1CKvLOozNBDfIaY3PpOT3ZSBsNeXnNnVVEszSsbdz9spGCb
 0orgunP+xcVAB07+Z0Sj51yqP4qIMbStr7mqFzj3pkEM/1ido3ER6PiHEWUtxJV4gs
 aozm3XDVkL9IA==
Message-ID: <0066585f-3c7e-6657-b3a0-48448efc2a80@collabora.com>
Date: Tue, 15 Mar 2022 15:34:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3 04/21] arm64: dts: mt8192: Add SCP node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220304130809.12924-1-allen-kh.cheng@mediatek.com>
 <20220304130809.12924-5-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220304130809.12924-5-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_073430_167988_A07460DA 
X-CRM114-Status: UNSURE (   9.27  )
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

Il 04/03/22 14:07, Allen-KH Cheng ha scritto:
> Add SCP node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
