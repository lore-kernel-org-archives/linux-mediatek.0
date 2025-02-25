Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9FCC021B2
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2025 16:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=prsLCnCB7psLEbADrI4zv7oPAFPrBxwSuVxZTVcsW70=; b=XM5yshs9dpxrY3m2P2rsP4isaC
	HRcgujRCMg+zKr3pZpl1x+aKalcHlh6svPGMKXGut+zBiguyqKIuZQv+/+6D9XtB7UJIM9KxJDtx8
	KikWgo+TIYpwMMB5i0Kz2jd56hQKRRXgMhG8DmByDSMRCir+VSF+wVeFA7gNBH6Be+c1YOBm0jEJ/
	Kb71txDmpfK4lXF8k8niy0AU8sYAzl3d2DQ3z6a/KGFKiBQZ5QAPMarIb4LIITRDKZeO0o5eTUCAU
	MY50pH7tM5ZKGKwBpKXVKDHaKoNIOKnt8e/3MaJh2WJzV6Ahs+J9NHR21H4+K3ChU844WTMrts/st
	vAHJuIYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy0G-00000000KUh-2RrC;
	Tue, 25 Feb 2025 16:41:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmw8B-0000000HYyS-0sgo;
	Tue, 25 Feb 2025 14:41:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740494513;
	bh=9V4YUg5vnD262h4FPsokWjKuFicYB+C9LqBf+uEcFkE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gX1H+lYWtfXMIju+lsbpaCJqVMgcDQ9W6rJS0QwvxjAH5S1b6PflPtpnAKadTe2AZ
	 6lusWdCY+FCeBBDrir+nW6jCGOznEHcUal+oTWqjQWDV34hH1AsjPUJvByqkxFFrPa
	 xfR8QavRQj7F70rp4YsKRtw3VpfsyqTwJxaBK5oTmeYK2pQu6gkEGpVW0VypU5s1vr
	 ap5EgO9L3ZrXT/0E9HJ6BbsiCq/XkM+sT8KmXaQm2LKriD7gejliy8+hzyt25aSSdI
	 rfA0I4nlxwLQkPZvLdko+PrTIGritCzXrcCol42sDAl1w/nMrDqp32O6i0j163ipYa
	 WVxW2wfI7N97g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 023A417E1010;
	Tue, 25 Feb 2025 15:41:52 +0100 (CET)
Message-ID: <d55dc7d9-8efb-46ae-9acf-19ffbdd6bb8f@collabora.com>
Date: Tue, 25 Feb 2025 15:41:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] ASoC: mediatek: mt8188: Add support for DMIC
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 parkeryang <Parker.Yang@mediatek.com>
References: <20250225-genio700-dmic-v2-0-3076f5b50ef7@collabora.com>
 <20250225-genio700-dmic-v2-4-3076f5b50ef7@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250225-genio700-dmic-v2-4-3076f5b50ef7@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_064155_390595_093CE5CA 
X-CRM114-Status: UNSURE (   9.27  )
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

Il 25/02/25 15:33, Nícolas F. R. A. Prado ha scritto:
> From: parkeryang <Parker.Yang@mediatek.com>
> 
> Add support for the DMIC DAIs present on the MT8188 SoC. To achieve
> that, add a DAI driver for DMIC and register it during probe, and
> describe the AFE routes that connect the DMIC (I004-I011) to the UL9
> frontend (O002-O009).
> 
> Signed-off-by: parkeryang <Parker.Yang@mediatek.com>
> Co-developed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



