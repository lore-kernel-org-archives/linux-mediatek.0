Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9FFECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Sep 2022 09:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8JyEcr4+L4FJ5xJhCbs356iLyuXOKiupOdwiwNJb+c=; b=oInnI2i3ykv139ZG6JKmOJAH9T
	9drhOmEAB+epMMZ4XsKSVopUNFXG1G4Si6/tzJW+JCbw+Qlag5DAZHqNH9HHvHEVOf+3kSqkDzrDF
	ogh0AF1vOEt5dieTZrffw3Ihns/hquxMrE/bwL1+FL3JuYxl6XWuHdCICIh8BfEy2h9EokyMJ40Pn
	OcXyKyhVNzbnvrpo7Z8fd4/nRmeoANqN+3S7SAWqoGywEPf8GhED5WFurrhjj7KEBgZerjPOrcCqN
	kjwTiT5XjnSRei79Gppv6ncFWxnSNZ9Mr/pVHje5grof4Bh7a74DCnKmE5R9OiwN+jxhi5laZHgQE
	uo4oNB4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV8aN-00GXsY-Ji; Mon, 05 Sep 2022 09:40:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV6qr-00Dd1v-D0; Mon, 05 Sep 2022 07:49:06 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 73DCC6601E74;
	Mon,  5 Sep 2022 08:48:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662364134;
	bh=ifeP0r3pcu7K42tQxkfGTWseJu3C0X8ZYf3G/UE662w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lO/v/0YooHjyVD5h+o5PJdm2yp6Gza2tJURV14lNDSVKyH5yV9rlkO68HKveNAXv0
	 yjk7ni1KJf3JkfvCQGe6O0m30yZca+d8Q81v6XpeJlQ0QmWeAOVloK6ZrNplz1ja6n
	 T+BwDp9/Vbpst9fwYnWpbn3+51obCq/SLsZAula4IMmnlGrRAYmZKQYvQfzZhcHOZH
	 SrkwF2WKu7miuFK9QnX/KFJtUxPNZR7mjgOVae9fkpZmnYaJLDzrf2Um4CfvlNvWLy
	 hLQg7WuBZpo76KNB2bBMEiA/tvgTbBsrfFdK/P4mNoffi3zAl02C3UMxTECvJiHNIT
	 pX22l/bHp63JA==
Message-ID: <d1815aba-e11b-9014-e1d1-59425c4358df@collabora.com>
Date: Mon, 5 Sep 2022 09:48:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] ASoC: SOF: Introduce function sof_of_machine_select
To: Chunxu Li <chunxu.li@mediatek.com>, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com,
 lgirdwood@gmail.com, daniel.baluta@nxp.com
Cc: matthias.bgg@gmail.com, yc.hung@mediatek.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 sound-open-firmware@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 project_global_chrome_upstream_group@mediatek.com
References: <20220903032151.13664-1-chunxu.li@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220903032151.13664-1-chunxu.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_004903_583587_62944647 
X-CRM114-Status: UNSURE (   8.90  )
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

Il 03/09/22 05:21, Chunxu Li ha scritto:
>  From current design in sof_machine_check the SOF can only support
> ACPI type machine.
> 
> In sof_machine_check if there is no ACPI machine exist, the function
> will return -ENODEV directly, that's we don't expected if we do not
> base on ACPI machine.
> 
> So we add a new function named sof_of_machine_select that we can pass
> sof_machine_check and obtain info required by snd_sof_new_platform_drv.
> 
> Signed-off-by: Chunxu Li <chunxu.li@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



