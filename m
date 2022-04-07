Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBFFC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 12:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jg0Zyq+nkeWOIiW6Jnc60K+eQ46Qzc3jf+mHaideq+w=; b=0zV292k7wEskrx
	tt+tz4uMWG8Ml+yAO9fj5i/7gTROou4d5llhsVN1lELrOaH+7PyW2gpI2uU1hjEkv/BLd4w/Mx0m9
	s6ZsU40Ynmm3/Q84J3QPm9UgM2YGFS6ZjoDJ79xwCCW72k2mfVW6Vr+4PPUAHMS+jldZAuMrvELvi
	NrUd890SrUZs/wy6NTrhNyW9/U6WY++gZWBNe8zdgReddgu9P2ubBCnlmKFDDEeiB2sBGajflPMQM
	052v42eJcZWSsM1roMCdiUxOTpRZbvviIEqlLqE712Rf/eYvIkxeLsu7Kq7onMKxruecbaQTaIq7Z
	icRnyiSl7Cjj2MDcGqPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncR9G-00BpBn-Hb; Thu, 07 Apr 2022 12:22:02 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncR94-00Bp6s-PD; Thu, 07 Apr 2022 12:21:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 4118E1F461B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649334108;
 bh=2epFI9g6RLrV5cEIaOcyg/KZ57pqbR7bwpKwv6HMCUk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Encljqt0QR4uRHtwnRazKXaXKXLSCJjAizdjOvZPZxt+TxBj7nu/O38zy5EUAT+6H
 Igxr4tAdXwkZGEa7WAomoO3uia8/61F9HmCUhFjZUBiBmLBsZetHo7+IFYkikKzRZB
 4cHN5SjoNzKoCkTBMdsuIP9EQCquvcMVcIkPSZ2Lki37Vh8q7lCAvrjY1+kRU3cQRa
 d9FkWw9iKccPddUkbHrqw8LR6n9qHNJ1S8k047JTt9CeFaOcs/Q9iBxX4OkrYIm3Je
 RoXQYu7//rv/p4VtGxjMR3l9M9B21eoVz53n2bfv5xSXXFh1kmYyRScLQ5yNezPyB2
 ZiPbRnFAotgKg==
Message-ID: <d0b9c0c6-0548-a170-1490-c05e043c76d4@collabora.com>
Date: Thu, 7 Apr 2022 14:21:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/1] arm64: dts: mt8192: Add mmc device nodes
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220407113703.26423-1-allen-kh.cheng@mediatek.com>
 <20220407113703.26423-2-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220407113703.26423-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_052151_017276_F3B380E2 
X-CRM114-Status: UNSURE (   8.79  )
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

Il 07/04/22 13:37, Allen-KH Cheng ha scritto:
> In mt8192 SoC, mmc driver dose not use the MSDC module to control
> clock. It will read/write register to enable/disable clock. Also
> there is no other device of mt8192 using MSDC controller.
> 
> We add mmc nodes for mt8192 SoC and remove the clock-controller in
> dts for avoid a duplicate unit-address(11f60000) warning.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
