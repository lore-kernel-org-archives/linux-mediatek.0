Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA438C46467
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 12:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y3f6LY4L/lLnz5JjIGjIGZChBIxAYM9KExA0bJx6y18=; b=1LZlLivN30BVbQ
	gndJqWv6VeWB4rTvHYLNjMYSQhIWwvPoQVnOzaEZCp32SBGiP6+Q+VU3Gnr632qpWgPMTh3b//l1/
	VuRM3t6qFYCnvPdUd47CBmFRKn+ZbiPMn2xzYB062FsL4H4qHWSyvvcJwhghAF0vpA9wyIOxiNjVH
	+rgZXEvGAyshUYnyF+VMUS4WEot7St2XHUG7gBPPva4ByNIJRxmvMebdQxGoNMmokeVioVOS8MYM1
	E7seVaIp5+Ab+74gL+DVp/mQg9pxvNUbM3EAA8tvTi1ODBaLRMZjtEY3wp2cMvl7PRCkjiT+LcVj4
	keDT38lxWaG4IupsfJjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI7vW-000yZB-5H; Wed, 18 Jan 2023 12:52:26 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI7um-000yEJ-Jg; Wed, 18 Jan 2023 12:51:44 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DBCD46602DFF;
	Wed, 18 Jan 2023 12:51:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674046296;
	bh=lRImklMheY/mkerDhgF3t+gOPWvx98JSfHVl/z55Mwg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eV9a7C/DAkgpHzFu+lxyYL9ggSGKrRwZI+eY2S0maBO7wTwByBqCpS52K8nbm3Pj0
	 JkRVQzRW5k8xNiffu4Rrw8MEL2T+1Uud/zsmyVcI1+vaDCMnsJcVi1zk2INR1XH+YD
	 bVW5JZYgehWiVirH7/uiIyIon/rMRkBK/PqOVybCRoE/RPB07kVbzSwV+/XAf1M6FH
	 LqKnApM5JEFyTHxIParFd1sGZIQxgkDvocRx6ENY57BlEdkZ3t8KpUADULE7X4Uv0Y
	 EslnVXL/SHC6sVwi36ridWXDoDXYGpqigm+g57dp7XCQHZUdW+5oxzjb3T8/v8gMsp
	 YfEiNh4sx8laA==
Message-ID: <0488e63a-aa81-08ea-4b32-2bb608c957ea@collabora.com>
Date: Wed, 18 Jan 2023 13:51:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 1/2] thermal: mediatek: use function pointer for
 raw_to_mcelsius
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <cover.1674012985.git.daniel@makrotopia.org>
 <69c17529e8418da3eec703dde31e1b01e5b0f7e8.1674012985.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <69c17529e8418da3eec703dde31e1b01e5b0f7e8.1674012985.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_045140_819936_EC181DB3 
X-CRM114-Status: UNSURE (   8.67  )
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
Cc: John Crispin <john@phrozen.org>, Steven Liu <steven.liu@mediatek.com>, Chad Monroe <chad@monroe.io>, Henry Yen <Henry.Yen@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 18/01/23 04:55, Daniel Golle ha scritto:
> Instead of having if-else logic selecting either raw_to_mcelsius_v1 or
> raw_to_mcelsius_v2 in mtk_thermal_bank_temperature introduce a function
> pointer raw_to_mcelsius to struct mtk_thermal which is initialized in the
> probe function.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



