Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B1CC32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 13:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fxxkdkf6d3e93XmDNDqVb+u+zRIk3W2CKV8G30bX9Yw=; b=zOTHIxgxZiQDy5q3uYP+hv0ZWD
	k389dfaJ2BMnIB1Dyv4AXZhjS/nmX9QVijtBWvNznp4NydEVKiGJFMeS+vnCJRiFYCZ4b8oXjEXUU
	vACSLNPMfcvk/EW+Y4LIubxhqsG/JXkx4/Tq3zW9K1yFrFWPoq13uq8icJRwOlVtEBDO2s42UecDa
	IbaSa7ZgfW/4kzpP/hWVE3xKXkPc5/fBV1eKBn6FznzaF+8LjdVwxu2kI7vcPyZgROWSMbLN/4PmR
	2u4LhEzLI62YOzUvqgnykTHss/XK6puNB1YbHnvxp22H016174Ai3WOGCP1HRttt4XVVddLPpcYLv
	rSTfD2Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odXED-00GV1W-9B; Wed, 28 Sep 2022 13:35:57 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odXE1-00GUyN-T7; Wed, 28 Sep 2022 13:35:47 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BA8946601FFC;
	Wed, 28 Sep 2022 14:35:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664372144;
	bh=AooCL7bWhJCQhuXaZSxdLDCqtYCwkPYUXtio0wi7j2c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T0UESf2jxccqO5gCHojUz8JLNXNr4uwDlsw8x7KxA6eWoTgAqLrqpT2wysFMd1jVz
	 wWwu70DVqAkQ/6kasBvedRR+lYDyKZm4J/DjBOjwMOl+Og8pLJG7a0WH0DgdsjP224
	 O+IlHCmWGzbI4hzU79Zd7vdB97a1XOa2Qekuf+pm5FtenJvU0LjK+gql+tXk4kCcxz
	 j0zc5AKjnva2TFVrXHkpVVtb373HEDC0HvANMrypxw2TClrmEQjWE+lkFBC+LK0JeT
	 VLv2NFPP2021rYbPpvdICyix6pS8D+zUawIx3pBmoyFX9A6s3k+PiTHb8961+4HVX+
	 eKVJqc2n8SIZw==
Message-ID: <6ae64f49-5ab9-0b37-ae2c-5519c21a5d73@collabora.com>
Date: Wed, 28 Sep 2022 15:35:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 2/2] phy: mediatek: tphy: add debugfs files
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>,
 Tianping Fang <tianping.fang@mediatek.com>
References: <20220928093041.31481-1-chunfeng.yun@mediatek.com>
 <20220928093041.31481-2-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220928093041.31481-2-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_063546_101394_5D542B7F 
X-CRM114-Status: UNSURE (   9.68  )
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

Il 28/09/22 11:30, Chunfeng Yun ha scritto:
> These debugfs files are mainly used to make eye diagram test easier,
> especially helpful to do HQA test for a new IC without efuse enabled.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Even though this won't be interesting for the vast majority of the people
out there (the users!), it's still nice to have it for IC testing performed
directly on upstream, as that opens new possibilities for you and ODMs/OEMs,
so I agree on getting that code upstreamed.

For that reason, I think that the best approach for this one would be to
enclose it in a configuration option like CONFIG_PHY_MTK_TPHY_DEBUGFS or
CONFIG_PHY_MTK_TPHY_DEBUG, so that this very low level debugging code
doesn't end up in end-user builds, as that may, in some cases, be even
dangerous.

Regards,
Angelo


