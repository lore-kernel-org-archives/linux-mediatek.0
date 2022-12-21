Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B65C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Dec 2022 10:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77UxbuSkVbDpTadGv3qhxi2SHwHPQ26mrNGhJzsVPv0=; b=boKQx/bduPPSApf/jimXLU6XKo
	GoriLcuXrpSWeXg4W8YRnt9wtFTydS2sDZd11hEcu3xkIkLQG4rkduua6ETb7fkUgW7FtovQ/iQ3W
	Nokrx32i+AM4sF0HDDo3pCgLqNVZa+zvhgZm8tu9Ul9Eamvfd6JdYvmekiemhPxRFDt/oUEXEiyuP
	sYcWsD1rm/kUPA7HQ2iivgG++iKz+xt2+q9JSjS86wtZ7Bj9UkgB3JjLBiBhMSX5BVQmKufDIQpxQ
	F3+80WrUEa5HBS6hRqUQm7uxWcAA7YNvM9ymQtPUS3fePa97F2XS8RSCoNActauKH5NaOd5XFNBYe
	hpW7yt4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7wG1-00DNi0-48; Wed, 21 Dec 2022 10:23:29 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7wDu-00DLxg-Pt; Wed, 21 Dec 2022 10:21:20 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E93D16602CBF;
	Wed, 21 Dec 2022 10:21:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671618077;
	bh=9XetkCTtF6ckMwoVbeLdJ6HVv33hp/u5TeeEORSL7cQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cpDtg4obq/fxFMnsFDSGSkpTsT9nXQa740njL6vVX4JoXbYkCpj2XgtRe5FIBpcH0
	 UDhlMcoZoeU3UnDVEIHh4ZB8GNcI1wTorVi+zzvD9ipoe/aonF39Dl6nD5f2LkVJEJ
	 JphQ6d3Tw9GVvaDnabpmMpP13vnz8VMzG4LW0wwWmBjeyI+7BReSfYS4hc6sA9HtNZ
	 KOXeRODHLudlRBeCLbG56yRSl0LuSus76H57xABUDa+nS6lgsrAZo6gQLgX1yYanXP
	 yzEsoYCovGOe30aI1HmhLQT+xcXizj1S1+kHqdvWWxolEgi9q8BZydTZ4i4npec6AN
	 AXUZ5VmKb78tQ==
Message-ID: <8dc6fd60-4f45-c191-70ba-41e7cbf81090@collabora.com>
Date: Wed, 21 Dec 2022 11:21:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 3/6] dt-bindings: power: Add MT8192 ADSP power domain
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Ikjoon Jang <ikjn@chromium.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20221221034407.19605-1-allen-kh.cheng@mediatek.com>
 <20221221034407.19605-4-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221221034407.19605-4-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_022119_065642_FF43D168 
X-CRM114-Status: UNSURE (   8.32  )
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

Il 21/12/22 04:44, Allen-KH Cheng ha scritto:
> Add power domain ID for the ADSP power partition found on MT8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



