Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2145BECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 13:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oS6dT+uElpsj2xuXqp0MCz7p9dbNYoV/BVlHcGGk8LU=; b=VaBSJeli4XmVyVo97EXdPk8YpO
	EHFgsAnDzhmjV8TqoGXHWVVxZiIcwbGlcND2zS7oJTofVJI4C+Hm80fSnrwrCn+iDWhoaquhbRmW1
	TImxVGoaPZ7uqVAvplIhLiBCL/gWUsZAqMVF5LwWFjHb3fm5lux1JYzvadaehdV6KsI0Up39JLVuJ
	fH36n0upxzQrlERSIB59unRoJnqxePC2rv77IdIxgQj7O/aIjSqm5GGNlR9XrYFKIKuMqQepSDy/M
	GupfXPgmNbz1hmTcftU2gVRQX1y/qpUegdFNWr+SMhtkCdmp1OAL0NH7ydQoFJFtfFERgUrk8iNun
	DafYF2fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opUlF-00C1gf-Le; Mon, 31 Oct 2022 13:23:29 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opUl5-00C1dM-Qz; Mon, 31 Oct 2022 13:23:21 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6D302660037C;
	Mon, 31 Oct 2022 13:23:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667222598;
	bh=ctOc72E5TG5g0Jfe6gFuy0T4ihRYDcFuhpGAII5uE5M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BAWpsTGOkdARYdWAUioC/8GohNdfgTZqbfoCUeTdPIdPgS/vDd+CtKLh5X2PPgmrf
	 vHXRvOxj7l9b8CcZPGLj3BcXMEsbPT7+TpyBpQFJAoDHeQgxikCv9ewtWsYqLBGtDo
	 kLR/QFbkpphY3ixfp0DAeeIom7DCV/wzDs+pc078Kq32W46QXCRgiaRDJWlPhwYFNq
	 filMsDgk+XfCzEfz/dyy3MmUrohLNxIJ0zm5jZC1IT9k+ylBzOgon8ej+rw3rLikOA
	 KZKPY3YMSoWOrkBg3WpKv+1ctBbb8iDYeVs3X0008NxXAjbBPRZ7bLYQryDn78ks1Z
	 wtkxOoSnn5lhw==
Message-ID: <bd40a99a-63e3-b763-5c1a-74a42c384032@collabora.com>
Date: Mon, 31 Oct 2022 14:23:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v4 3/3] arm64: dts: mt8195: Add venc node
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Irui Wang <irui.wang@mediatek.com>
References: <20221028094317.29270-1-tinghan.shen@mediatek.com>
 <20221028094317.29270-4-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221028094317.29270-4-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_062320_027923_B04C25BA 
X-CRM114-Status: UNSURE (   7.62  )
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

Il 28/10/22 11:43, Tinghan Shen ha scritto:
> Add venc node for mt8195 SoC.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



