Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06286C76196
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 12:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FLPlu0sWNUCD/FCOc4F16aGgvco0RMjmGGMgtnt3I0E=; b=Wx6MMfUgZzJN7z
	7NyyBpGWnXesJxtqIYlwmv5UVj/45NpUIbCZEBiV8TjfZH989jqZX+l/xd9JzRG8Vdpn6vgMFnGep
	E27ERgQUAdpJTYGDx5JDn4vPwdl8l1zT2wBhKZ0gpgiBl7+1DND4N79MiuckkWAOWX1zx+WNHVKCx
	QViS5DEFr/gAlnpdJFxKoG64jPzzQ19JlqJhKcV3x81+9w9vxsUTp3bixqCLBiqv0Srj51NBOQ71I
	1UZa3JlGV/t0VAPjqoRHlAB+PPlO74ES/OkXE3qD4jOHOwapcr32VMNwr8Vy6uDpe+6gt629UHg0X
	/jCic8Z9jLJFMlNefd+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJXG-00FJqY-0B;
	Mon, 03 Apr 2023 12:43:46 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJXB-00FJor-3D;
	Mon, 03 Apr 2023 12:43:43 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 107476603105;
	Mon,  3 Apr 2023 13:43:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680525820;
	bh=pfKKC24shtvA/rXAR9B/Z1hLIkyt7OJi4x4sgnOzJ4w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E+aRNVEux5sMeLcJ+vqHmQ5aDu98LjC4Bo2QRef0rixMvao06HXBb+qFWc+tSis7K
	 Liy8m21xm8aQetY1koAG4OJFoStg9e/TQCy4NSEN7UqfGpjxNcebUI2Di5pdEQSIWE
	 82falL+mlPGFsCKcrEPSEqiDARZ33Ks0IFi8YixFnxRaN9P7jLwBgPpcGAyM04KAcy
	 Of85MiIOq4BkW/IqSim9YFPMf0vJTJB8/r+4nIvR7WzYs6GoTZMxYQ3XnhfKAvu/RB
	 RBIZQt3gXzvDoQ3XAOZESH5at6jdwGmx0B6jflGyeTfaYKdJqZ+U9w2HsxzqPv3ncm
	 DsrKSa9YYwyOg==
Message-ID: <601a8435-8e2a-2c25-5fe3-40be62269469@collabora.com>
Date: Mon, 3 Apr 2023 14:43:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC] arm64: dts: use size of reserved partition for bl2
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20230403105818.29624-1-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230403105818.29624-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_054342_162209_6C761517 
X-CRM114-Status: GOOD (  11.73  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 03/04/23 12:58, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> To store uncompressed bl2 more space is required than partition is
> actually defined.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

If this doesn't get changed anymore, I'm fine with it... but a question arises:
did you send patches to add your BPI-r3 board(s) to upstream u-boot?


> ---
> I used the definition i got from mtk used in their SDK uboot.
> 
> Openwrt uses also the first reserved partition to give bl2 more
> space:
> 
> https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=target/linux/mediatek/dts/mt7986a-bananapi-bpi-r3-nor.dts;h=f597b869abc80d1a73f44ebb85ad4da17376bb52;hb=HEAD#l22
> 
> so imho it should be same in mainline to not require complex bl2
> compression.

Regards,
Angelo


