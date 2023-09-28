Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70790CE7B17
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 10:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3ATzasusUER7Y5u/B+DSvxIbjhbhxhR/AxcKsVZJgE=; b=B0opCAcBhFDUkvsvCwEsHv96oV
	6zK7q/sVEf3CFK+GfSrlfik5s652/9px2vBOx9LvBXCyntSuYMaOhxlra+Z5ay8CoW59kfzsrLNXi
	RaS6vShO6xQ5PVk9b6Eaj0q/5rSTZpEPiXiKLGrQHdG0vJoLTPd8iYszYrza/66abu080471zKhl3
	X0XSQR90VbBW189xFW9kZwpfFCtq1HEJwlv3BhoRYHpxgoWzsvx3iVocE3npyRDMFXRDIB6l0N8vC
	Uu78KDZmXydjCoo5kU6RiKbaNhAVA3+j2+XjtV5wRytLj/7qqnKjSIs+Pm9JbfvxV/UiLPjNL5DQl
	e8rDGpwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qloEN-002pV4-0Q;
	Thu, 28 Sep 2023 10:26:51 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qloEI-002pSY-0x;
	Thu, 28 Sep 2023 10:26:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 80C0C6607330;
	Thu, 28 Sep 2023 11:26:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695896805;
	bh=dNImo2pegaylz0bmhaLxUkF8kpAdvHs5N5o4YQuhfDc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QlK1O6+XlAqhBSRNKIS8ei50rW5nlXH4/8sJ7u2A+Fc4ylviKQJJUQ21RtEs19ZHd
	 YG4yjb+AguQ+9p8ArCr6oBVFVQI37BKDtSxodGmx/gbHZcvdUq2Tjgvywebh9DE47E
	 9JfvaW3iA43Cl59hZWIXBblhe6GKX0SavzFGSMIYIoCTvrerc8ke+XMfRe3zgLcg4I
	 vehfrdSFTpmgmKHIawlXghPpimifSBen9XvgHiITeEbMwB3a9SheAEqsrK9aFj2LNj
	 B2Gi9sxX66+weNk4gLr820LlaTUAM3yec7igicp11C8DhAmi+Qt86tsDpxbYXJ77k8
	 Wf/hC4QYdAJgQ==
Message-ID: <cd683f18-8150-b718-71d1-d88e61bc438b@collabora.com>
Date: Thu, 28 Sep 2023 12:26:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 12/12] arm64: dts: mediatek: mt8183-kukui: Add PMIC
 regulator supplies
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230928085537.3246669-1-wenst@chromium.org>
 <20230928085537.3246669-13-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230928085537.3246669-13-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_032646_490996_0E8CF441 
X-CRM114-Status: UNSURE (   9.49  )
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

Il 28/09/23 10:55, Chen-Yu Tsai ha scritto:
> The PMIC regulator node is missing regulator supplies. Now that the
> binding supports them, add all the power rail supplies. Most of them
> are fed from a system-wide semi-regulated power rail. A couple LDOs
> are fed from the PMIC's own buck regulator outputs.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



