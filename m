Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A770C197A0
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 08:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLuOvtO0GbVIO2PG8CKu4RnBc/IExhKHTeJWYQVWG54=; b=dy1DhGhRck/DydacfzV+DO57W2
	wyZ13ocC6nViFTieg/lySbdYN/PKzf9IWZbQJ/EfJ2wjTljY/ybzqCIwaA/0rmJJ+dznTLlYEzQul
	sYl59mxEQffh9Epz1+10lorKpaDPC47aWC2wrtaN+EABjlItuUxf1vMQivlkbfGhTgdJYcyM5bmb6
	E0osyN9VUBrvudFutJx31xtbStXSa1TFBDpW8pQmLsUE4fQz2kufqmhpsJqMNOLdIqdIO3wunTaiE
	LbT3tJhzovMoDyv3FIa7OFmb1p0x+MnmmEB5J+wcgGVyPKmVy5O/XlUAc9oQg/D1tpUQZlKmbqDss
	bt+PGxcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Y3j-002u3i-1P;
	Thu, 16 Nov 2023 08:49:11 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Y3g-002u3C-1Q
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Nov 2023 08:49:09 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 914AF6607340;
	Thu, 16 Nov 2023 08:49:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700124547;
	bh=euDkFNtGvQr0sz8e9BU7mvYiyCJF/bhThXtK5d4f/U0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QTnSh/9P2TJ2dSP8Vg/VWZgd327u9ezjnrnwos2+Sefk90WjgR3Tc0lKRjWMZoJ35
	 80v/X8gEtsQ0/FeQhTSBic47mAGTqkTFvJ6xttDatzbvre6lFkvw1WxC/zk8780Iuj
	 o+LSwX6hlb9dFtj14oyWg41jXpg+TSGjhscfJcjN6XWXjfoqjOh9v4OVgevi7TUhZK
	 Obqt23wCEUXFvSPJs6X1dZ+cSuBpURnrOL4bY80eLoAF9VZKOba4hv1/Hyh95LtQPG
	 xI5HHiVg0Mf+PaaNyg1Xy650YSdZ51N3/2b8QYF7qDY6XABLSTUeDDtGnWvvnss+D9
	 rHpkF8QX5uEwg==
Message-ID: <0876a85f-cb17-417b-9471-9112c51208d8@collabora.com>
Date: Thu, 16 Nov 2023 09:49:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] ASoC: mediatek: mt8188-mt6359: add es8326 support
Content-Language: en-US
To: Rui Zhou <zhourui@huaqin.corp-partner.google.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, perex@perex.cz, allen-kh.cheng@mediatek.com,
 kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20231116073106.3757618-1-zhourui@huaqin.corp-partner.google.com>
 <20231116073106.3757618-4-zhourui@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231116073106.3757618-4-zhourui@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_004908_617445_19E1D29B 
X-CRM114-Status: UNSURE (   4.28  )
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

Il 16/11/23 08:31, Rui Zhou ha scritto:
> To use ES8326 as the codec, add a new sound card
> named mt8186_es8326.
> 
> Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



