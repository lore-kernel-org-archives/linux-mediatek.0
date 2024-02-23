Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC89C5478C
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Feb 2024 10:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19fTMOvTKju9L3Anstk0721GU3+0wDd9L8r6ljdj//g=; b=Lmw2WpzM/6HehEEFGNdHRnTSxN
	mJf37JEyKIPV+abWekdE1XjOswIN5zZnwbMcDrn9mTtqZo118kBA8jY01ppBM2SNPBaQF+czUFxm0
	hWLzIT9qBPwPWbWc0bpTJhxdL/YYj/Rne/fJ4Of14OddD3Klzfh0HN6nye6ZWXESITlgQLdUyd3CT
	ZW3UoMxkID7W9uFwpmIUfCc8xGywJc5eVMtTV+QtxRtxfvv8uhVKbe7xxJJzmUUka3Z4mq2rucVie
	+InXrAk4TVCDSnmwTtjegljrxEWcPowOi1xasBwXJeg9MDxvFI0tWXDb06YZkUpz7Y4PNZUe3MVv0
	mC1wlNdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSqq-00000008w9q-1teg;
	Fri, 23 Feb 2024 10:32:20 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSot-00000008vdM-3UZw;
	Fri, 23 Feb 2024 10:30:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708684213;
	bh=lG1vOEdIEIT+tsgIXj2hsQ9c8Cdoi+8MMRDj+wt4ZPE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=h8KqeDAWWeFaJpGwqiONHdV9Xi3WVCrM6hy6olAK3cb+8vBzr5zL2QvguPXI79lol
	 DOC2+LkW9RCSc4fVFNJd3Xc9D4EC+R6UDL8zbO19mNWsuiR3LAah8rdWRwIZ5L+Pd2
	 rhjrnKX9CQkip2+pMvdRnU3CxYACKGgiNzu9FOgXPEf2wvWvZ2mFOow2PmxGrg9jka
	 d4pMInAoS+wdvHHVYYRkmfd7/wgVfSAYqazaT0JsXb86XSj/LzJVFerOZ/Sa6TgWsT
	 YwBT/vSGwpV/OcPIN6FYWuXR3XZ5cedN5BpwO2gY9+TBkCVHTUZ+aF3AH7tCkkxyVk
	 CTZmlupxnvnLw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9174C37820DF;
	Fri, 23 Feb 2024 10:30:12 +0000 (UTC)
Message-ID: <0a98ae3c-6d89-4a93-94bf-542092ae8e1d@collabora.com>
Date: Fri, 23 Feb 2024 11:30:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] soc: mediatek: cmdq: Fix typo of
 CMDQ_JUMP_RELATIVE
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Moudy Ho
 <moudy.ho@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240222154120.16959-1-chunkuang.hu@kernel.org>
 <20240222154120.16959-2-chunkuang.hu@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240222154120.16959-2-chunkuang.hu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_023023_410008_D2BB4A3B 
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

Il 22/02/24 16:41, Chun-Kuang Hu ha scritto:
> For cmdq jump command, offset 0 means relative jump and offset 1
> means absolute jump. cmdq_pkt_jump() is absolute jump, so fix the
> typo of CMDQ_JUMP_RELATIVE in cmdq_pkt_jump().
> 
> Fixes: 946f1792d3d7 ("soc: mediatek: cmdq: add jump function")
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


