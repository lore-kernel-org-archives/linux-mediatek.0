Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFDBC54EBE
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jan 2023 09:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=43DZEK+yTxJhONHu1PJ7HCqmsR2b3LOFm9YJRpq/FKQ=; b=A0A4QCIZJ+ZKySoIz5lFI7T7Ts
	aXfkj4LYKSddhKDBLbdSCgRsMNg0HwzXxg9KfhgUo38HLslKSHfAJsOFGJuN6ZkeqjFmuTiuBlROW
	4j7QNVcGhPXubHXJZ/4JSYmBKzEPeggLq9cX3lftTD3PjNH1AxUEVuFVro0mGrsgHsQiK7P4rlTq+
	deWfOf2/UecqJGaZZPpwFExmxLjWhemImjj3agKQ9UJzEeGVYPTeCxMVQo5rZ6rMadKs4STE41v+t
	i3ngNmfTT2KPZ3K3ibL7rHhFRaGpX8ZD0rPhWoJ/fLzZZdg3RlwCoqAhQO09fMHFtoTH6f2EdE5N4
	JOrH7Exw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFAoC-0063u2-T7; Tue, 10 Jan 2023 09:20:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFAo1-0063pe-2O; Tue, 10 Jan 2023 09:20:30 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C51C66602D6F;
	Tue, 10 Jan 2023 09:20:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673342427;
	bh=g8LJ5B4rMDQV97cEiwnSy/f5QYjiF15lfCvnnH5n72k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MIjZ3lECCLCdFrjMcSHZqxDoDQhX+9fOc+uBgiIaeRF4QS4av3YE5Ulo2EP8kbeg7
	 dwg4uQpknuzd1yNOWl9cHdRqjHuYx93ZhI20G8xOh1DH+wa0wcyTluVjkPNU9OUfqg
	 1UdQKLDThtscSBOUrifp0bBug9gZpkxstJywG5V3MbxIneyaYCX8Wht7bW1Rpg+Gbu
	 V4mHYQPVATOD60tn2zIW20C1/pl6vUFNz4jzLVJ+oCn0IzsY3lT3cLUaKJddc9vshX
	 V8TXLUkKtfU3nHRUDT3Ivb0b6V5iLdljH2nM0YhacL0tijeiG/hEE3j7wOKRPSv3Gs
	 MAzaJXyOuQsqw==
Message-ID: <3b6c19a9-66ac-a18c-cb3b-144066077bd1@collabora.com>
Date: Tue, 10 Jan 2023 10:20:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/3] drm/panel: boe-tv101wum-nl6: Reduce lcm_reset to
 send initial code time
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com, thierry.reding@gmail.com, sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1673330093-6771-1-git-send-email-xinlei.lee@mediatek.com>
 <1673330093-6771-3-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1673330093-6771-3-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_012029_267743_837C5041 
X-CRM114-Status: GOOD (  10.01  )
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

Il 10/01/23 06:54, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Since the panel spec stipulates that the time from lcm_reset to DSI to
> send the initial code should be greater than 6ms and less than 40ms,
> so reduce the delay before sending the initial code and avoid panel
> exceptions.

Please change the commit title to describe what you're doing.

drm/panel: boe-tv101wum-nl6: Remove extra delay in init commands


....and the commit description should also contain something like

Reduce the delay after LCM reset by removing an extra delay in the
initialization commands array. The required delay of at least 6ms after
reset is guaranteed by boe_panel_prepare().

Regards,
Angelo


