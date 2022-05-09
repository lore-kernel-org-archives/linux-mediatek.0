Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5027AC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 08:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yKfySjqV16LQmG9NqGkmJ+7R0lkaS/03xfRd/g53j88=; b=nca1H424h4eZz2
	6bCEFvZ6ylCfBuoSEJor9QG4ImHhxJieduVw3JmxaF23W4JeTWo+zYOssPQ4v/g45qCEqH+UoKFXe
	KYm3GPLtWQ9bc7C9CYV+8p6x9EKYmODs0bln2NHlcxCjfuxVML71leFhFcPdDF8jNdaZj1q73RgF4
	7hOjIlFnfyT/INzSKdAJRqexq5JAHhlfhPUx60qGtGwO8VF9e199kP3gNU3h9FUvDGpOfR5kL6JcR
	tBWoDnNvjQdhTt5ID30wSpmHaBcxUFpr89bzK6+f5fStWo1jMrTWXytQoZ4Y8Vy/jhoLrCP6ZIZhw
	NyNBbvuzIqUVQTPtlmWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnyRX-00D3BG-F9; Mon, 09 May 2022 08:08:35 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnyRM-00D3A9-IY; Mon, 09 May 2022 08:08:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id CA6D11F43962
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652083700;
 bh=Ci9YeTkiERXxEyN0uHAckbygOm03b3gSoys0gEWkatg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lu6CSgcBkNxkj+rtHKpudaiQFms5D8/IHGzvYxKIceXMeY9ow6WkzNphJXQzVG8/H
 YpIvmIWMc0Lsv+jRPUAQOYH4/qX9Eo6ZW7mfibHFgBQCAg/aVZbqKTbi+m+80VsR3f
 XBSAXXqjI4YIqEl/A3S+eYyOUYdhakyTDvlVx7lapZCuHTGJsrELSEWusIG5LdpcFN
 GQdwqMj8BN+Bg1hRfYiKmi5j1t7bzVn1VJ5T7sNzNmIBoRpCfKkinbu7PGFOwhcF7C
 KxlpzMGUkALypqUucXwngY+oyZwauCCXuYIKIcuA88LxNVU/rN+bnFWnheTFif05o2
 vLPbXmcGVgGEQ==
Message-ID: <40d49a43-9e90-7af0-5af3-5a61a384e442@collabora.com>
Date: Mon, 9 May 2022 10:08:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v8 2/2] phy: mediatek: Add PCIe PHY driver
Content-Language: en-US
To: Jianjun Wang <jianjun.wang@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wei-Shun Chang <weishunc@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, rex-bc.chen@mediatek.com,
 randy.wu@mediatek.com, jieyy.yang@mediatek.com, chuanjia.liu@mediatek.com,
 qizhong.cheng@mediatek.com, jian.yang@mediatek.com
References: <20220507060621.32252-1-jianjun.wang@mediatek.com>
 <20220507060621.32252-3-jianjun.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220507060621.32252-3-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_010824_873415_42440251 
X-CRM114-Status: UNSURE (   6.37  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 07/05/22 08:06, Jianjun Wang ha scritto:
> Add PCIe GEN3 PHY driver support on MediaTek chipsets.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
