Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C5DC38147
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 12:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ryNPmOsOGtokyRaEkzbTmHG0q4+x9KvMefkrXP0vfKM=; b=gyJ4V+94q00ii4IiYaKz/5+hOe
	peh+hHCLeyDWkuBVEeH8/hftoua/RIepZ3dz35Erba8dDb0HEssA8LBkK2bE2gFuvVBZM2ZwbDO47
	1PqIF8KGqPGcHdb+kSSaDhxq7pdZY1vZ/1bkoNkjugz7Qawahwb/3RfHtlzJDy+togrAL7lEUXcaS
	ePg4w88dCpdnJyoLlMrl4+Z+v3INXVjy6+qfB6xyfogxXfhzHbkpNYL1E1aW4a80XEyXgfOt51SXy
	BcaEU8eECAGyzSe1FdoghwsepGd0jDnFk5wqCiNLU2YBU+zJfzhiTzfdiYib7z/UbhVgcpPFKWid4
	SA+bohHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI7by-000qYg-C2; Wed, 18 Jan 2023 12:32:14 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI7Zo-000pVO-GQ; Wed, 18 Jan 2023 12:30:02 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1A1856602E0A;
	Wed, 18 Jan 2023 12:29:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674044996;
	bh=H1zVPKEUhT12KA+z/uL5nxzOq/6vUtEisSOkrk4sRng=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PBM15/5Vdko7sJkmjzn5UvO5R/i6DsAxS/gdop6RrtvbvYZXNbdOKvKjPfmqlyfIB
	 NLmPQYdMn+coV4Mna13TpjHq7bSSedDsiAgLVA1LHzj1mpfMtapHOUo3NJBkyc9tTE
	 SxOsW9mWOR1g7iPrLoEPvDlijfVXRaq7VyInxsKqqnl0jzqVCh8/5AAzpMT+idd6d+
	 YmbCfYNdwSuXugiLHA8Nzjq95RuikIN08x4tI2gGo8EbzEuEzBWoMefyteKaVj0C3x
	 qXJkmmiq2Ajr1CNHKZoqk2qKKZnxEnFrpi12WP0Oh3wL+aUH8HGD3fVPhYCym8VgfJ
	 JdmwnX+URYbQg==
Message-ID: <f48c29ed-9154-0936-64c9-d5aa8dc9cae3@collabora.com>
Date: Wed, 18 Jan 2023 13:29:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v7 3/3] phy: mediatek: tphy: add debugfs files
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Eddie Hung <eddie.hung@mediatek.com>
References: <20230118084343.26913-1-chunfeng.yun@mediatek.com>
 <20230118084343.26913-3-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230118084343.26913-3-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_043000_746592_F0CEC4AD 
X-CRM114-Status: UNSURE (   6.14  )
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

Il 18/01/23 09:43, Chunfeng Yun ha scritto:
> These debugfs files are mainly used to make eye diagram test easier,
> especially helpful to do HQA test for a new IC without efuse enabled.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


