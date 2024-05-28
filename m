Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CEFC27C44
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 May 2024 10:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7G4Z+JDPlGSq4FjtsjOg3xvjrPwA6k8DfYP4Dn+4po=; b=2cAyT1nimnF7iGCqdDGWAz/RBG
	Y1VVb5nCfmyUELtOWXXXVtxo0m/ce37iypViipoalxzZqxGyRTvj/E5DWQFuzJIAgjReflp6t37ib
	fYhFee5FB/q56i1zwczmHBnabC94dpWNvRXdaRT3b9tfcrKIBXZ5iu+EO90kSJaff1jNzlLqbI7oa
	/4+1E/t4tnu43ELycQNqyaO/8CM4cOn15hKrUV5w2JbuJikPOkBCVGP6ADj1fX8lcU8NGTko/g+Tc
	rzAuTR/MPLFJN64tB8qRbg/gGuFQ5xqflb8O1OkfQ7We7igX4RM45VBe1ndcPWIoy5mdLrJeGvS0b
	vR1c9azg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBu0w-00000000DE0-2NjT;
	Tue, 28 May 2024 10:25:06 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBu0i-00000000D3Z-2Xil;
	Tue, 28 May 2024 10:24:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716891887;
	bh=eCwSK1GHrFnFt48tdaVfJXIdF4FWIhLcfBXFC1OraC4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uXmoZx45jNRaFuP8GluwtX/dBcGxZBoC2sG3ztrO7Vw/mLyOgR6UHs5a39tVBZlII
	 tjM15S11SxO8H3TJvsD6+Ut+EF5A3BM2RLN/3GySr33UwEqLb0DH+bSm9OtW2bwZHA
	 ONOPOhmtKh8DTktxE/FsTqxmPJeVm6MBHGDwkenM9P9FvspUPB3kSMpokA5kqdtS7A
	 xHSc80R/5YVbiW+DOYJ+5HEccTEXY+0rLu1ow14Qst+fqaeNEGn7iA4LEOg+joW6Re
	 U2fA/SCgJqgv4hEz+heCV0YecgNueNj8a5r46HzdaJXIHE90lX7QeJNURxq0oM2/zN
	 zarGK7OsgFw6g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 962773782113;
	Tue, 28 May 2024 10:24:46 +0000 (UTC)
Message-ID: <26c862ec-1613-46fc-ba37-5649fd55e159@collabora.com>
Date: Tue, 28 May 2024 12:24:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/8] mailbox: mtk-cmdq: Support GCE loop packets in
 interrupt handler
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240525230810.24623-1-jason-jh.lin@mediatek.com>
 <20240525230810.24623-5-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240525230810.24623-5-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_032453_052172_18E040E9 
X-CRM114-Status: UNSURE (   8.57  )
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

Il 26/05/24 01:08, Jason-JH.Lin ha scritto:
> 1. Add a loop flag for CMDQ packet struct.
> CMDQ helper will use a loop flag to mark CMDQ packet as lopping command
> and make current command buffer jumps to the beginning when GCE executes
> to the end of command buffer.
> 
> 2. Add a looping task handle flow in irq handler.
> GCE irq occurs when GCE executes to the end of command(EOC) instruction.
> If the CMDQ packet is a loopping command, GCE irq handler can not
> delete the CMDQ task and disable the GCE thread.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



