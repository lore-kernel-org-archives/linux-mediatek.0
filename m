Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F1FC54E58
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 12:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BamzgDvVnf0Ej+pS1/kUQYOSHkB9qmvbKbLsdm05xU=; b=Tnqud+LnWylXR7/3CNt6aXTqbw
	JFz2aSIa/22cgTF0Ktp0sKIsj+c5XzXAWUMPZ3hzu9nDAb6VkeKv5am40MJ+8JvNc0e8/20nbK0QE
	irMB+ASB4SORxejhUUuSnjCBipSer/HOKUAjrUVqoFkRmA64569p0HiXGoTIJsPhCymAL1hekTNyk
	7Hot2hOLwUHl1nJIuGEvG5fOg5iyPwqB7NGv5Mq8dtg+9jOLg871EIfqUbQPlS2nBKTawnqTTKsxa
	mSydfvT2GmMevfZUjaootKsDAqjSbNlYgNqFPDM6HWGlRYn9iSw985a4q/AVc6y1JwrYRuzmEGvce
	Gn6IF85Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl6nK-00000000CkC-0RA2;
	Fri, 15 Mar 2024 12:36:18 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl6nG-00000000Cir-3P1q;
	Fri, 15 Mar 2024 12:36:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710506171;
	bh=qVRS4AlDH1tcDYo6iWSXKnhmVMUJuEjn+DOA54u7xMM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aPai7EW8s1C94a3NwOZ9T8QgoTHIn62FC0363nl0OCDEY3e+QbFWgq0jQCpNMJmBN
	 VlZXL/D+1xLhQg4jMaxATJnWs6+5Rhy8wahe7iD1m+5woJvrx0IWdcDb9XkemoGsMN
	 1KnpgoShiGson45u9i2LqDcO4vBuPvDQlHJK+uu97Hg1rxiqRLQLELTQtr0oZ5eU/0
	 chTeMThixOtFDCxjkixTAlNiD2eMgDPfOuwjzYnLFn/8rulTgIC3u9UhP0nK9BoYCB
	 Hzqe4D4or2IZf0dCpe38Ok0Z5VqWaidD46HqE2j63Q7aiGSfREC/vSLT6ZOcAbr6F1
	 CC2d+42RDUmJQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CA09E378210F;
	Fri, 15 Mar 2024 12:36:10 +0000 (UTC)
Message-ID: <3a3caf05-64af-4354-aa11-0880b66e91e2@collabora.com>
Date: Fri, 15 Mar 2024 13:36:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: mediatek: mt8183-kukui: Use default
 min voltage for MT6358
Content-Language: en-US
To: Pin-yen Lin <treapking@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 linux-mediatek@lists.infradead.org
References: <20240315111621.2263159-1-treapking@chromium.org>
 <20240315111621.2263159-4-treapking@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240315111621.2263159-4-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_053615_177823_27736E59 
X-CRM114-Status: UNSURE (   7.92  )
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

Il 15/03/24 12:16, Pin-yen Lin ha scritto:
> The requested voltage could be lower than the minimum voltage on the
> GPU OPP table when the MTK Smart Voltage Scaling (SVS) driver is
> enabled, so removing the definition in mt8183-kukui to use the default
> minimum voltage (500000 uV) defined in mt6358.dtsi.
> 
> Fixes: 31c6732da9d5 ("arm64: dts: mediatek: mt8183-kukui: Override vgpu/vsram_gpu constraints")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



