Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F261DC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 13:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pL8By+stYLtRk49Kv4ICJeZ9UkaaUYS5YhRDc6B0LoE=; b=T4HN8aw5YDdX4Nb6zs94BkrVoq
	FzOIRBlfFC7jY0yZvhKQOqPWOrAO3e/Oo9ODoSXxqRYB7B0nSLAXKLqQpTLNpQUjfVVFeUigoJK+6
	+W9aspnKjodsA4TSSLi1EDlqnq0094d85haWoSf2qEUk0li4tw5i4eI06tgYf6vMz3dB25W8VzHYl
	BKGeeB2yWpHh2l6i22WZ6m1MweLj2rrhlD15TLHrmfAKv4U04qLD1HKdnefsYWlDcCakrRB2d0s87
	gC8YCiAQOo1OGqf+cR1+ug1+viABpHZMhdX+apZzYx+Hxh5xdfsj6RUGhcRqszPHql/6YmsEutJUu
	71xsTMeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE9Uh-005oAn-FW; Wed, 20 Jul 2022 13:12:03 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE9UT-005o0d-1X; Wed, 20 Jul 2022 13:11:50 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 580496601A88;
	Wed, 20 Jul 2022 14:11:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658322705;
	bh=/aJXjeq353/maK2sPLcnpF6bI8a871nPzf7N4BJcdCM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OGBGdhurIMN8G9vwPC3RVKH0ZK7KiR5HSImkL+pB/SjsasHETu8/99QdWf7ZE94Qd
	 aiBqVB7rSQuSHVKyimYj5pywJwDfMvYjLZsVAwgFl+ES/13MpB3x+cIVS3IOZAHneH
	 dV4pnOz2RVmX94RTI9Qoxu3sXxnxc1WT0G3YLvMdyfc8oZIFa7C4M93GJJXAyMAndf
	 z8yprig8/8BI4lavGgK0hrbyjxBI6P4SH8pcgENdHWKy8YpcMYjxVhPiUh3uIL4ppK
	 JQBhzAn4bLsf71HFJP5lRKCCj6PqoMaowb9jnZlFZdG0lsbaj1OCPhBRbZYAYlMArV
	 Hg3E1OkpiOS4w==
Message-ID: <7b8db168-b22b-c8f9-4f99-452f3bb7b2b0@collabora.com>
Date: Wed, 20 Jul 2022 15:11:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 2/4] arm64: dts: mediatek: Remove mt6589 wdt fallback
 string from mt7986
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 nfraprado@collabora.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220720125015.13797-1-allen-kh.cheng@mediatek.com>
 <20220720125015.13797-3-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220720125015.13797-3-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_061149_248981_81872D59 
X-CRM114-Status: UNSURE (   7.82  )
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

Il 20/07/22 14:50, Allen-KH Cheng ha scritto:
> The watchdog driver for mt7986 relies on DT data. The fallback
> compatible "mediatek,mt6589-wdt" won't work.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


