Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E084BC28B2F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Mar 2025 14:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XC0+NEt4RiiKbO7UF3Yxoh9abRm3XV6mRGNVJCoycpI=; b=Aa8yzp+Nd5/kSN2QlOqj8BtuRp
	qbaP6W31x00e/mcRLKeTD2gbYld1lOFY4dKSndXj2QXIlZtNtG2feZ2Dg4uvrZXuRdr3UgTYjeg4e
	/vjPwv6ig1JH5Sy2PWo5hCHzHXeN0gDjAqqmLO1ECt9xlrmuLEiFFgROGAkl3RcGZYS5tCYspmMlS
	TDLX1dyaUvXrYFlthRCoYqYmHNkfgTS9bbEK0kpHxh9ENsrk7Qexiy2OEw/73ru1Faxjk1HYudOVt
	jDQ0Qm9mQP7yX/0RyP3cOkxGC6w7UjTYrQaG4NDhI3U1CSlUsCS1+Xt+SSRNgmFp+AiNhrHzHD2kN
	NSpkB5Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXtp-00000006BDG-0Ajn;
	Tue, 18 Mar 2025 14:26:33 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXor-00000006ADg-0Cc0;
	Tue, 18 Mar 2025 14:21:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742307683;
	bh=DlTALxhnX1WzQznDtq8NeSAib+9haWmUV8E0yQEGDc4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KhDI9DBXFlIC2GO3+W6xzD9tsjvysmhhYIc+vB+keu4md9fXlwTSNN4CksQ8fRMTl
	 zXwvLnNHqzHqdGDsuZ9fjcgD/0qrG7V+40I63YqSxeZpVkroSWG4j2tDva1KtU3mcN
	 E5toQgEr5RwPfvPfuFv/hteWGM0Hc2p4WpGsUVQIIDBoxs3sBCHbERCNtwecdrsLm0
	 ZSeo6csHIPCbHDRGzJW3ZXLejGyvelgQ9Eb+yz0K92U8T8Z3hu5ldPzf8enVT+dbRD
	 sgzuE/Vbz/iVoNUYTF1L1zXDbUz/eccgz3ikGnghE06aZAnh+iPV9Gfs1yXPXRPokt
	 7JXxZGlh3AMAQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 906DA17E0B25;
	Tue, 18 Mar 2025 15:21:22 +0100 (CET)
Message-ID: <2b666683-47f9-44b5-bae9-109764e60690@collabora.com>
Date: Tue, 18 Mar 2025 15:21:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/chrome: Add support for Google Spherion in
 HW prober
To: Laura Nao <laura.nao@collabora.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, bleung@chromium.org,
 tzungbi@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 chrome-platform@lists.linux.dev, nfraprado@collabora.com,
 kernel@collabora.com
References: <20250318102259.189289-1-laura.nao@collabora.com>
 <20250318102259.189289-2-laura.nao@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250318102259.189289-2-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_072125_237381_FE015A2F 
X-CRM114-Status: UNSURE (   7.18  )
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

Il 18/03/25 11:22, Laura Nao ha scritto:
> Add a new compatible entry for "google,spherion" to the hardware prober
> platform list, using the same I2C component prober and trackpad data as
> "google,hana".
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



