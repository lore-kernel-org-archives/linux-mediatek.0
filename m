Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2C8C04A95
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 08:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKAuigQ84iczZpJnNEVPstVEaDgyZ1ju+1tnWItWp1I=; b=cWHSLxqpdfVgaDkusxFjbvSV4W
	M264CTdZTtH4aMCZXiroh4uAHQdjdVKhf9C80vEYVX+9DrhwqAdbsQ01Sl1oxLbKTLPUYWivJAWpf
	KWq6hy3U6g8X3Pa1M569qABZu4+285jd5BJT1+S8oYG1D+KSNyRGjovgSHBKiFNYV+UZ4/2CNH3Pa
	dvVVETavFprEL0/va7fbuWSg3ZDa2CAzZQLISGSDO0ASDZYe8yZiO2RkA4R8L65lLNYS1w5KIdTyf
	caCf5ga8FRuzrWX02ePZFJy1nRLMwEl9mXOnfkSgQxLsgxgAL1eISIQi3NFXJNuPfGDq2MM6grNbY
	PMBacxIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odos1-001oRB-JN; Thu, 29 Sep 2022 08:26:13 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odorf-001oK2-2O; Thu, 29 Sep 2022 08:25:52 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1F58066022A4;
	Thu, 29 Sep 2022 09:25:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664439947;
	bh=pdmRLmAswWGM6e3ox6qIWAmKi6CdrOkRovia8PRsexs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hCT94Ka7UG2J+S5WoY/9PrWwJj7Bp1CqSLD9+pALZtjNvUY+92x74SzzVHFgOFFyr
	 7+9eaVdHtrsN4zZ7iWdn4l3kvzuOSnKhGOJBwDX/30JGWeUoxNczcRdRWMDL+joCkZ
	 Wl6M+6dExYk6RkHpdOOFYBG5nrIX7bTPYOxoEQvt44kRzSMlBTmIdmWUlGxgwNnxgN
	 cj9olldCO4B7fIwgVFCwD50C/N2WjpoHPOOXPQFxnf7nEwBW9jHsSAzw6kMSLpKplT
	 nTxALcjOU3lCR7+HOD69zK23V/b/Dk+Q9zQR02mOY5NJimNAmkVUWReFesjqyiRiMW
	 XmF9EbFscDgkw==
Message-ID: <97f2b299-ea8e-c53e-703e-d62fadfe8904@collabora.com>
Date: Thu, 29 Sep 2022 10:25:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 3/8] soc: mediatek: mtk-svs: move svs_platform_probe into
 probe
Content-Language: en-US
To: matthias.bgg@kernel.org, roger.lu@mediatek.com, jia-wei.chang@mediatek.com
Cc: nfraprado@collabora.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220928155519.31977-1-matthias.bgg@kernel.org>
 <20220928155519.31977-4-matthias.bgg@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220928155519.31977-4-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_012551_265141_ED88C6EA 
X-CRM114-Status: UNSURE (   7.49  )
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

Il 28/09/22 17:55, matthias.bgg@kernel.org ha scritto:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Moving svs_platform_probe into driver probe function will allow us to
> reduce svs_platform members. This will be done in a follow-up patch.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


