Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8283C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 16:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LNUmthAwvA/GqRe/cwUDxjPFYxFX7LHvqppUlFF5j9U=; b=oX6o2P0uubyhJv
	EjQ3sCIDILiIglItAdsy06fabR6qcyTSBtcn2f26tdWIUR5GJrc1fY/aUO+l24Zc5ZMi7khgBNyhT
	nUqBGj2MhvhJHG+BnvplVUNFKJzM/sfXVO/eU2U4m3ljRvYXUiUAMItt128wp9OAmVM8GrzcZXvgd
	QrwnpNuxL66oaNJl3X78mApPR0QhMF1PFg4yFUsemNmVWWHIoqzQmRm1X+AaJ9LEiAK0gs27Y3j7f
	P1KdrDNvauevj3AYYxF7b0JlQMmQ0WFU+j6i0cXrt90V/chu9vNrLupvrKP4nYTewzK5+HL72+/GV
	sYKyYiPT0OD4pKtcGfGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXQ2e-00H9na-8L; Thu, 24 Mar 2022 16:10:28 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXQ2R-00H9kP-Hs; Thu, 24 Mar 2022 16:10:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 644EC1F4588F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648138211;
 bh=EwHy9mWfSuvvqMimVBgvIfNMqN76TuyvYhpTkRpZ2mY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YbwjaZuSY3rU3Yk34+j0IN39Nb0q9CbL2386wWKs6DQDuScq7BoiG/R1eZtGHpVPP
 1Mg8LvlcNYHAwZ6OvFhRirYcEebf7Q262A+kMh3t3jVqA8WGpa9tsqWAhoTlu0Jwxl
 ECZvz5TWxtJr/C8UUvGzoOqLdqzUCYEHExLvKrNY4+4UCk9vFIg0rEPprIuHg4i31E
 fUtdDqlvq9QLgv3bmn3HQuRmi+tDjc77o0vd40iYf9rttMuzRfqfX42AcWxn6crrHD
 ZCHo3m1TckA+Jn2XXesjXA2CY48xu5kp8EYNQaZOEgbODYkwWO1B50uVqywZ6JfJsj
 gdX3Dy4O2aWSQ==
Message-ID: <18525f9a-e5b3-f6c2-e88f-3e0c5b789cad@collabora.com>
Date: Thu, 24 Mar 2022 17:10:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4 2/6] ASoC: mediatek: mt8195: merge machine driver
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, matthias.bgg@gmail.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, aaronyu@google.com, tzungbi@google.com,
 miles.chen@mediatek.com, yc.hung@mediatek.com
References: <20220324053851.27350-1-trevor.wu@mediatek.com>
 <20220324053851.27350-3-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220324053851.27350-3-trevor.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_091015_819394_7CA9F95F 
X-CRM114-Status: UNSURE (   8.81  )
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

Il 24/03/22 06:38, Trevor Wu ha scritto:
> Because most functions can be reused in different codec combinations,
> mt8195 machine drivers are combined to one common file.
> 
> The model and compatible string are used to decide which codecs are
> being used.
> 
> As a result, We can prevent from copy-paste functions when new codec
> combination is introduced.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Thanks for this much appreciated big cleanup!

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
