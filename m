Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52321C54E58
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 12:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlo4yzj3d/43JfBEo/OyQE/14w4A9wo09EBo82SBVAs=; b=o8VzlOP2sf+GuHHxq80GL8cT4l
	MjbnHwHc+HFCL5/5NhCoSW/YY/WvjINLQVJftAeIGIKjdSpWdBhSMLWZ8TrJ9qAPhTza1wznU9AkE
	LB3U3DSmZJbPv5mI8w7Er47YDFJhLKhZV1ed7b9Zf7l3O1J6AirjzQTsqCwvidROgwkb/R5qBUKgz
	qp0na8n00gbClfc3xWD/zrS0HKvaf6EjwnLPK1S4h3T9w2j8bvpW7yh+e6P3/BGmVeD6GLCL4pWvL
	ByZn4nRLBud6RIaW72TAdXPJ1SFd/rB0ohFx0tU+Y80zhOVve52Nba5f4bfxckx3Rulo07gXpDUup
	oGjrK/8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl6nQ-00000000Cn5-23om;
	Fri, 15 Mar 2024 12:36:24 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl6nI-00000000Ciw-2z1f;
	Fri, 15 Mar 2024 12:36:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710506171;
	bh=snxNVny3b5vWDdS22vpyzo7kUdKFFpuQnWuKvhCD5dI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=v6v02svMU6nHv8G5f72MSLjj8eV+uDHl/+9DybGTO/rBYJD/1kG3udMNQEAwGM3Q4
	 IrayK0Ilj0Z9Erc71/W+z/fozg3A9OcVONXbyl6iUlvmQ7KiT/MFxs0jwxuEPVwGsF
	 /BCdNMJS9V4ad/2C7YDCMcsYzaNFb8eJJP7Eyh8ZO1lWkBRhv7J+njMs2LnF7jWlri
	 tHKKPIdw8ZWanN8ApKa7AjcU7Oct7YC2MqnBxXAek3oEx5Kss+IqU3ojAOMBOHorqs
	 wUxS2W7GEdxs3Z3z2pOswPQKY8is4e6kXaB80129NAp/cGTvGEkubwgkM+aYAtZZf3
	 77/385bq/PpKg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 539093782110;
	Fri, 15 Mar 2024 12:36:11 +0000 (UTC)
Message-ID: <c6188852-378a-4455-8120-024d463ee983@collabora.com>
Date: Fri, 15 Mar 2024 13:36:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: mediatek: mt8195-cherry: Update min
 voltage constraint for MT6315
Content-Language: en-US
To: Pin-yen Lin <treapking@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 linux-mediatek@lists.infradead.org
References: <20240315111621.2263159-1-treapking@chromium.org>
 <20240315111621.2263159-3-treapking@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240315111621.2263159-3-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_053616_917443_551EE3A5 
X-CRM114-Status: UNSURE (   8.52  )
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
> Update the minimum voltage from 300000 uV to 400000 uV so it matches
> the MT6315 datasheet.
> 
> Also update the minimum voltage for Vgpu regulator from 625000 uV to
> 400000 uV because the requested voltage could be lower than the minimum
> voltage on the GPU OPP table when the MTK Smart Voltage Scaling (SVS)
> driver is enabled.
> 
> Fixes: 260c04d425eb ("arm64: dts: mediatek: cherry: Enable MT6315 regulators on SPMI bus")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



