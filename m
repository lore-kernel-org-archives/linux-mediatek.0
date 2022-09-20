Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CE4ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 12:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvsnXdlFPYV5VecVSAOCXIXJbXh6dPQkrPjx4hlgJIo=; b=del+F8BMvHzJEN0SAXW7fhWmTX
	VoxmKd3d+a7XJA1/SK4HaOMaNiWHlJkB0LxzO1h7eQyIRBs2vWWOPVnlIE+QkB6fuBMlgZpXln5K1
	OiiMxYcJulrT0gzIZTl3+6vacgt/YiKxWcu+dJZhgCQciPLMD84LnPTESlDa2ZFlSiYWBt7d35aal
	A1+msUuY12EcDGieMvF2J0Battt0Yv5WTzzHjKUiekeIDwtMz9At8b2+JqoMsTu0AohlP2uHo7lRi
	xO8QBqRZfI4ObTTrY3LbVuNaefDvuNrVN5WGvXj6JUzVGvaAjTLIEzXHNHPRt5IVqscEVQpImdBJK
	8xkVGrRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oacKX-003ghq-S5; Tue, 20 Sep 2022 12:26:25 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oacKL-003gd4-VY; Tue, 20 Sep 2022 12:26:15 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D1D0D6601F6E;
	Tue, 20 Sep 2022 13:26:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663676772;
	bh=0Xo+03ki+KHlNAja6+LcklniT2jv2/zVi1do5nkFLsY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aREvFl1d38iihES0n54eMVA8YHqHT/CBMOuetK3YBw0pYnWE//RHVqwqb7jJkgGWY
	 2von4x7hkslUWx9CCjlBXsuz0gD+5MSzSYNCzGLqKSzALB1ahwN5MaC4Ay2K9RUFph
	 PIlMhQvuab5QlUxZQVOkKFndKcLGMVybBxzdXZ4Herlnk6+9S3JhlxDT969tnJ4EK1
	 R5ES10/lmbLD70loahLuW//P0pMY3G5fM50qRfG/24CpF7oTGZ9IVPuEFyKL1r0JdE
	 6a8ranT2REK8FH1R4y3vkX0I+NQYwzZHGp0nTrhH2Lmc/RuqFeSbqm9Cg4nWIArc66
	 ajtfyZMUV1NxA==
Message-ID: <0e470e92-924f-a664-0ec1-b11ce76c8e77@collabora.com>
Date: Tue, 20 Sep 2022 14:26:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 2/3] dt-bindings: reset: mt8188: add toprgu
 reset-controller header file
Content-Language: en-US
To: Runyang Chen <Runyang.Chen@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 nfraprado@collabora.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220920105622.25666-1-Runyang.Chen@mediatek.com>
 <20220920105622.25666-3-Runyang.Chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220920105622.25666-3-Runyang.Chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_052614_168008_CF12736F 
X-CRM114-Status: UNSURE (   8.03  )
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

Il 20/09/22 12:56, Runyang Chen ha scritto:
> From: Runyang Chen <runyang.chen@mediatek.com>
> 
> Add toprgu reset-controller header file for MT8188
> 
> Signed-off-by: Runyang Chen <runyang.chen@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


