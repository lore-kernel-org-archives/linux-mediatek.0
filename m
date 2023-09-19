Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63463CD54B2
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 10:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=irHCov/ubVvpuQi+m2cIjuNTYUBxmwqsGkazo+QJqqA=; b=bke91k2jIU0CueukNPAeTdSzgh
	J1pJR6NJ/12qjrNQ7lH5mFZqKCl8PBOtHI6wm/B6atDYJjsNlUJEw6VLSCM9Ct/uBcd2XhmjCY0iX
	ifo1M4I8WOpueooDtXBQwpt+SgNFziuHIGD7OMrIdyrHtrqOMGQ9MSPK5uMB4NuB8eWwwwhqZcu/B
	deTEyaF/tjpIB1xJ345E5Myy61SHX3xNGLv3U5CxzJhH9C4EylaBipluiOG2saXVrmIicB1dtTPPK
	U+lZFiSCMd1Vt8D1/24wQC+VL6hcNPHF+2nsmKQfe0coeM5v0Usr4tTisXplUohIdxWk+wS6OyZIy
	e0MBb9Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYMw-0009VU-2B;
	Tue, 19 Sep 2023 10:54:14 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYMs-0009RK-24;
	Tue, 19 Sep 2023 10:54:11 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 40B8966071A9;
	Tue, 19 Sep 2023 11:54:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695120849;
	bh=YIL8CVeCu2phmjTNYbQbVDRE1/tG7w/T7zljvP0+8Uc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WBGWu/Ab+USWrsW0Z0Uhl+RO5yYIJvHCGPrih+x7pbvCqkRg8r1OfBvmX9xwJAh21
	 4HnvcLBXESSY49rYXVpBZAM3+yKFi/+UytYdQAh1lcX56O1gaC8+VghudX9akkIEBl
	 ++O1Yv7neVxSA7fS2HLIgL4TbofYMrBtt5eGmBk9FUgucvoUgZIsWgwLnHiQlXraQN
	 JPRO1TJQfvU0HSowGaZPUjJ2z/YuFMXkldlIVOm9Dbu8KFf6IHZavvNPt1KT2vssWB
	 8fuHSC2uShhJF67yNVYKBpV3y7KFMT0doAKk+qoFuChJtfNTgkrHbKlQt6/ApoQvk4
	 Hf/FQTa1KdsAQ==
Message-ID: <766b1ac5-f2c4-0e58-24ff-dafde8e5995b@collabora.com>
Date: Tue, 19 Sep 2023 12:54:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 10/10] arm64: dts: mt8195-cherry: Add secure mbox settings
 for vdosys
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230919030345.8629-1-jason-jh.lin@mediatek.com>
 <20230919030345.8629-11-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230919030345.8629-11-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_035410_814711_67E0AC65 
X-CRM114-Status: GOOD (  15.63  )
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

Il 19/09/23 05:03, Jason-JH.Lin ha scritto:
> Add a secure mailbox channel to support secure video path on
> vdosys0 and vdosys1.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> index 37a3e9de90ff..9b838b2cdb3e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -1147,6 +1147,16 @@
>   	status = "okay";
>   };
>   
> +&vdosys0 {
> +	mboxes = <&gce0 0 CMDQ_THR_PRIO_4>,
> +		 <&gce0 8 CMDQ_THR_PRIO_4>; /* secure mbox */
> +};
> +
> +&vdosys1 {
> +	mboxes = <&gce0 1 CMDQ_THR_PRIO_4>,
> +		 <&gce0 9 CMDQ_THR_PRIO_4>; /* secure mbox */
> +};
> +

Is the secure mailbox number firmware dependant?
Otherwise this could go in mt8195.dtsi.

Regards,
Angelo

>   &xhci0 {
>   	status = "okay";
>   



