Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F82C3DA42
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jul 2024 13:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RNh+bkIftIo4Ce0W8ZDnhu6D6PXQTwGF8ECRlFaYX7M=; b=FnSdW6HBkf6C8zUFI+8ijHPiF0
	sWv+2rvRbcRbI6bV59BV/iyzr6TKhD/7XoiBmM3VKPqgIgH0Pug3zYN0VvsIv2EXItrMt3X8D3CB4
	19z7o1ZvaBE9M85Z9AWecuBPHMx2THiRtzVMNdNperoLNAYGsziNK8eYv2rHMBujHa4l+V7CrXYlj
	YId2XHkULILQ+HFTfiHk0IWaj0GchmIZvgcc+wIHY6r8kH1cNt7hgljSiT9QeizsIv5//7jrYSCRL
	9MxOk3vbwvdmVXDWCvV0I/wwCymAwNW1+UDiMqeE0ry+zppqASS40um4CCf6g+GXK18Fcq+wb6J76
	JHOL2Y6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU537-0000000DxO4-2wcu;
	Wed, 17 Jul 2024 13:50:29 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU52T-0000000DxCL-0pjS;
	Wed, 17 Jul 2024 13:49:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721224188;
	bh=6ehNFxuXAzA5VSSUmxWhalLXcJ1zzSogzZ/g03PKf1o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qDJtzF/EjZbWVNU3Uxs/2vEF3NMK4vOZLgjK5km4+mzD7qLQBglJ/kI7Mm13n0A1d
	 QU9wXAuuY9CBEGJsEFAXbiPVF/TboMbQYIQoppTam2UrU9I0vR2ehmb5oLaJsld6Cc
	 laRaJcI9S2ZSYMdd4k42VWA6RLk8ub6D8W8eE8Wzm6uPo1F6jZfYtxWXt3uwJXeZU1
	 wE3tSyAVdbPs2RB6cbqNgMhFvZ85IBTfS7P8OREJUt8Ur8OHZxcEi+hkdrYvDAeNLT
	 SgFsV2ZPZbM5vwnKvbRkV08p5t6yohwwvmN1BYaE4RXvj/fTEPU6XbgHq2EE0wZx6r
	 S1r+quJMC86EA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A4DF33781144;
	Wed, 17 Jul 2024 13:49:46 +0000 (UTC)
Message-ID: <7d53e037-c4dd-4eb1-b79c-41f58f82beb6@collabora.com>
Date: Wed, 17 Jul 2024 15:49:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] drm/mediatek: Support "None" blending in OVL
To: shawn.sung@mediatek.com, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>,
 CK Hu <ck.hu@mediatek.com>
References: <20240717-alpha-blending-v4-0-4b1c806c0749@mediatek.com>
 <20240717-alpha-blending-v4-1-4b1c806c0749@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240717-alpha-blending-v4-1-4b1c806c0749@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_064949_406231_8E5E999F 
X-CRM114-Status: UNSURE (   4.41  )
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

Il 17/07/24 07:24, Hsiao Chien Sung via B4 Relay ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.com>
> 
> Support "None" alpha blending mode on MediaTek's chips.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


