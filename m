Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D04E7717F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2024 08:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wn0GSYmONmbslt7dO8ydqzTbIRd55hIrQYVYc6W7YU=; b=rNW21GzDbcC0KFNWm9Wgx8bMFz
	nQtOkbpCx1AkCQ2LAJz+XQZhjNMql9vp6pn9ZupfmyewLDE4OxnbG8oJd2zMRy3v/ZV44VSucwMVD
	3E51mdSgylMXd0658kcu+vFdKTqh01FZ2WTbxozDUjgzHkBwdz1yT+MwSZxsuIWbe8J1ReAlBPSjA
	BNNvSPXfEz7wDIxUB3ZuAj5WCJoWWM2i6/Nx5W41ljzkTkmdez1cO/GveaYD3929Z1Sajkiiy0k52
	VpSgMqmL638+0PCk/wYuWI2VQ6hCdLCHalxnE7jQW2F0PIMckgu/HJEzlMMPX2dNbaIpVh/0TH2Tm
	creRyHmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvij-0000000AjKu-1sq6;
	Tue, 10 Dec 2024 08:35:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvdR-0000000AiII-0P47;
	Tue, 10 Dec 2024 08:30:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733819422;
	bh=D/akYzP1UwzneFmaGWcaSpwJggtt+UsOpmWeS6mis/c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OtaEKcFobIeglbDwbkmFobtAfnmBovLhDxJUjjWL/t6PVvSZuaXLtSI52sIOfl4cC
	 UtbFmBpoY+yxn4c8d1awEsyTc9Kdcth6HFh0F1y/u4R8CaksvsMz4RvNHL2RrHhX57
	 R1yxriioWrVYsJPnfSOV4DKmdVltVeho0r3k3M8FsMNW03tJlKqku+I7YB1FGxVm8F
	 1SClMyOrznX+s7HdGlCiHVPv7vOiRtSAlsixBXyO+i+yxTHf5IlPyetUcBArbByBgp
	 Hb8dlc39gcCQllZNMZ/XLD8FqbJQx4zan8YaIzkhqbPdSBV7dXoVCDltf7oKH+/hGv
	 wjV2Oa0q/wdog==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BE24217E14EA;
	Tue, 10 Dec 2024 09:30:21 +0100 (CET)
Message-ID: <ad1ac38c-6a04-4f84-a8fc-998d97c542e5@collabora.com>
Date: Tue, 10 Dec 2024 09:30:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] soc: mediatek: Add command for APU SMC call
To: "Karl.Li" <karl.li@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Chungying Lu
 <chungying.lu@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 chien-chih.tseng@mediatek.com, andy.teng@mediatek.com
References: <20241030013533.855696-1-karl.li@mediatek.com>
 <20241030013533.855696-2-karl.li@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241030013533.855696-2-karl.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_003025_305776_4AE37CE6 
X-CRM114-Status: UNSURE (   5.83  )
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

Il 30/10/24 02:35, Karl.Li ha scritto:
> From: Karl Li <karl.li@mediatek.com>
> 
> Add command for APU SMC call.
> The APU microprocess's start and stop sequence will process in ATF.
> 
> Signed-off-by: Karl Li <karl.li@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


