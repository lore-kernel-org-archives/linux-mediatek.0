Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD69C5478C
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Feb 2024 10:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MrcULc0j9VhZHsR9l/8wrazMWOXy7O6VSABsatJkozc=; b=LxQCwYnyPcaMRTaJwLWGOvhv4J
	Po5NwTCluRcwO+bTq8Mx+XIaD0g3SGa/pPQ5Knsa3hGrEqZwDf4wiA5GWBgmg9ajX4FxiQaex4gRR
	68EJvma6xkqzNdpaB78tg3t8itRDeWKubPo3JggP4oB41CehIvys9gRhVPhI3Bc9csO11LN+TO78D
	qwj5rCTrJjjyyPsoeWOjLCCK8b417/KKjiNf8z2PU8qu0tmQPVJkdfFArn0H9LQKkpJ0A6d0qk0l7
	PzT/9Bt0LwnEAWvCFeT5dVmNzMcjVgInYINJnw5oBlW0v3VS7aIh7oq77EK+KbgfdJnV31YKFi31t
	mNH+IJeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSpo-00000008vwl-0q9u;
	Fri, 23 Feb 2024 10:31:16 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSom-00000008vbz-2nDh;
	Fri, 23 Feb 2024 10:30:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708684210;
	bh=a5wsB2yzzq4HgC/3HlvIPTX8LqprZF/u+NXqYmbqYW8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=AITRzPoueMRYeP57son9yL6hAeAgXHSh8sWxepR3jEGc2Mp36bHj3vHMYYi+J7aEx
	 tFcIxI397gK1+nh3flb50/8ug7TbRyAyDAKtTc4o3yOzg3wdF1pRBPZ2/OfekKUju1
	 ib3ph1KHl+R3jvap1mX0iSkEOpiech1UU5Us0C8emgMpSqp23Pk19Mwm1epvnxJLST
	 GmWULOC0PkTfYbbYBfgWC6aKawmvgh0wS9L4yjWUNTrzcbFvi90WHpE8nnT5bXg0uS
	 1EumBITbZZDinPGrDEzkCaNX87LUD4sUdF/qvawmv+5EhkewYtAlW8QFmdr3MEu3aD
	 1rsOgo4/wQfkg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E127E37820CF;
	Fri, 23 Feb 2024 10:30:09 +0000 (UTC)
Message-ID: <c365c2c8-8211-4e36-8ba1-8b4638e81039@collabora.com>
Date: Fri, 23 Feb 2024 11:30:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] soc: mediatek: cmdq: Rename cmdq_pkt_jump() to
 cmdq_pkt_jump_abs()
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Moudy Ho
 <moudy.ho@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240222154120.16959-1-chunkuang.hu@kernel.org>
 <20240222154120.16959-4-chunkuang.hu@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240222154120.16959-4-chunkuang.hu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_023013_616678_473D7F39 
X-CRM114-Status: UNSURE (   5.66  )
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

Il 22/02/24 16:41, Chun-Kuang Hu ha scritto:
> In order to distinguish absolute jump and relative jump,
> cmdq_pkt_jump() append absolute jump command, so rename it to
> cmdq_pkt_jump_abs().
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



