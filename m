Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122E6C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 08:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMtmxttdjDMRusyp8YuuiE77qbnbZtwtAdEQ0dVdJJY=; b=0CpsTuJkk6dG86cojvUwB6UORs
	ZomfzAxB0OtX/fkWzjIJjq+BiBnHAfkaX7H5hFLXZEcYwyYznWxim2Tot668V2Cw87c2pHiNrxQr5
	5WenKBWID32eZUuTMAThjaFD/dbr/8NPqDNrPe245m1KRghGewHk+oTyfD+5ukM42p67rISyRdvzA
	hjiweog6qrQhymZ0EYfQjpfAawa+a6/Sfqgnq9eD2ixJRQtXchNhMhXMX205EWXvqKMsKUFBjet9G
	uKw6xMVI7eP+kBo2S/WCa+aya1XVE2lquNmaiyXMKA0X1GdYOkR7HwzXzfnIGGc+mj0jmBCnz0xzb
	nVuxpTXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnbF-006S47-6h; Fri, 21 Oct 2022 08:41:53 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnak-006RpD-3y; Fri, 21 Oct 2022 08:41:23 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 831446602534;
	Fri, 21 Oct 2022 09:41:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666341680;
	bh=N4UNINvJZ31lYbQPW+hEaoBxdTyA4gRTjPK7OCidDpE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BGBNH2aFKmpGlLLm0NeLj4/RQcaL0VbfbvpSNvBiB/PxBSbYHaM5/Lch/3U24Rw9U
	 uBZt588RTaMjkK7GBYsGpQFswiZrKuhQTsihqg5euRXUk3k1DRRp73bWSHn8+2Dcf7
	 npCXXGE5bShXnQSd0w5C21N8HzPyFDTFHEuzM9mzryNEoDSixKO2lrum+NfMAIq470
	 uiVTspvctLUxnaFk8ZonDdlNOrp4dcFtsKxC8zHfNWpnRfUbf1LeHgIQb0dpb7mAr1
	 D6OwKw70VLEMuR6S8j2IJLPCY4iu2bohuPAtyXlj89MsLDbC/Vu3TNFLLH7UOLhuiF
	 n6J35jOoBuXnQ==
Message-ID: <51e54a52-17a7-e71d-27ee-d4754fcc8514@collabora.com>
Date: Fri, 21 Oct 2022 10:41:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 04/12] ASoC: mediatek: mt8188: support adda in platform
 driver
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20221021082719.18325-1-trevor.wu@mediatek.com>
 <20221021082719.18325-5-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221021082719.18325-5-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_014122_350035_3F2C24C5 
X-CRM114-Status: UNSURE (   6.98  )
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

Il 21/10/22 10:27, Trevor Wu ha scritto:
> Add mt8188 adda dai driver support.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



