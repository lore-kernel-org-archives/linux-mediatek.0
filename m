Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38569C2BD09
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 09:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aXp5Nbn9tTirlHBkIQBQ4HPiGMz9A5hDqVQR/3Elg3Q=; b=aE1uqa3V7Mp+KMdWfio8uapQSh
	WRkuVptQYdMuhSxPB1R8upxnehyQeIPRvVqmaA9aClb7w/z5tnRRLkqsh9gneijiMvmCuafeTbUxl
	nc2GcINPqVIAjrvwzqRTQN7iCmTnLgtBJw2Mmbuez31VueSWkkuheXdbJKjf7F3iMEFCkLxERAahs
	5T4i4AnDrJN6+z5enUeFPHvg3zv9uM1B/Fv3PM4zjcKroApPNay38KFtcWunBcskdCfkcyBMvi/oW
	4mc+8+zq4UsGXTou8BO/s5l9Bj0DIAO/KjeHSeUKvOiGqE5Q10imJtAKcZugf/+YoCwN8qxYaB7f+
	iz/it9dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOvwQ-00000009Va3-0UHm;
	Wed, 03 Jul 2024 09:06:18 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOvwE-00000009VXG-03uX;
	Wed, 03 Jul 2024 09:06:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719997561;
	bh=lPh/ydh7sMpJmT5iWarBRwNNzOeXPc3ZWgbxoc64yy4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Uj8pKfnt59TgBwEU6IsqbzOVLDIoTABNzPIwK3je9XYSaWOic5Qra9Vr14q1WFDbx
	 R4wRmaP01IBHUm7Kt7Zx8bIjWhNGdJfs/dDKThIZ1J2GTCzEPkxfQLeHB4snOhd3u0
	 lUuxcqDGt/ubpTA5vEAZjHUt/GbokyD1ljwfmbr2e5SWPV0MV8rUvnqAjj3/24Fsh0
	 Uxo/poQwvREdrU7xzRe09wzF14pZcj1Ek1Rlhs7cLyD96lSSQRiHTaFnNq0dSDW9zr
	 y/M8+CgsgOWgwfzBa+3tSbx34dxTNxW164gxnBkFy/Wzl5JeSv9U74OzI6gsxZMeu3
	 8kZPe/V/slruQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8023C3782039;
	Wed,  3 Jul 2024 09:06:00 +0000 (UTC)
Message-ID: <f9cbd088-c00c-455f-912b-cc119566e62c@collabora.com>
Date: Wed, 3 Jul 2024 11:05:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: mediatek: Increase MT8188/MT8195 SCP core0
 DRAM size
To: Jason Chen <Jason-ch.Chen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240703034409.698-1-Jason-ch.Chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240703034409.698-1-Jason-ch.Chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_020606_215306_74A20E12 
X-CRM114-Status: UNSURE (   5.70  )
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

Il 03/07/24 05:44, Jason Chen ha scritto:
> The current DRAM size is insufficient for the HEVC feature, which
> requires more memory for proper functionality. This change ensures the
> feature has the necessary resources.
> 
> Signed-off-by: Jason Chen <Jason-ch.Chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



