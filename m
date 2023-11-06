Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC583C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Nov 2023 12:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zftzNnO+MyTAFGe68P3+dw5SW+vA2JVSFH6N10VRkHg=; b=k+jKmCBZy4/cX3/78zZHsz1/0M
	edpqevPtQHXaMGiyJX/HOC8h2fRXJcUAP7t/nhI4qXC46P8pTrZ8nDfl9ys5TD5Q2Whmvoxy8glIT
	2oEF0Mj01aIxoc9lschgi700WsVjr4Y+xXsfGmF+3SB/sqMdV6+26Hd8GtN8RTiezBHDZ4MvZ6t1u
	Wm2aL27i9eoLd8sAIZ3dthEcO6/lu0C/PV1hbSbJzpAyr2dTt6eDd7EQBJwEfRe08LvSqcPlMQIpl
	FZfi83wXczHPZWezewdrr/SmkEb0PmvQaB6UQoxLcmLdTayej1T5xz9AR7k7ntNZo3rSfmjVH1wfL
	PDM+S2vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzyyG-00Gf0P-1z;
	Mon, 06 Nov 2023 12:44:48 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzyyD-00Geym-1L;
	Mon, 06 Nov 2023 12:44:46 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C36AE6607482;
	Mon,  6 Nov 2023 12:44:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699274683;
	bh=+ayWnCIJkXFbMbvFLWZ8twgHit1NMR0N6o/rMjRk7Nk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WuNhD0AhVAtckAur993ehd0flOlQec9k7sNhWu6wiS1x5UPjlcMLW+Qlb6cI/n9m3
	 v92XUFmkQ9hPW6sKVEFZYCqT5uPWyhO+KwCDeBF0afCsgYMNCpmcRnk8SEzCdt3teK
	 t10brGh2UiWLk1DruW7jP5vuWIM7f4hzb9BrqH/viAY3/iE2ovO+vaiBJB+3x49UvN
	 Ro74URxDunE4mIkcGkWcSarXB4egRSmqzDVfA4r2NdrEkW8oXaHZk8r783KUhYnEyv
	 kT6H+y3JfiZSatGnhDBDBioXEpP/J0J5AzYcMD69ZxkYIiyLo/h5RRDS2/k67fc59z
	 GrbV1QaokQ6ZA==
Message-ID: <646ef874-dbbd-448d-8b66-d847f3f8e268@collabora.com>
Date: Mon, 6 Nov 2023 13:44:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 12/12] media: platform: mtk-mdp3: add support for
 parallel pipe to improve FPS
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231030100626.12564-1-moudy.ho@mediatek.com>
 <20231030100626.12564-13-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231030100626.12564-13-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_044445_649877_5A6556EF 
X-CRM114-Status: UNSURE (   8.34  )
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

Il 30/10/23 11:06, Moudy Ho ha scritto:
> In some chips, MDP3 has the ability to utilize two pipelines to
> parallelly process a single frame.
> To enable this feature, multiple CMDQ clients and packets need to
> be configured at the same time.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


