Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007F1CF0449
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 10:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zG6vGX/JB1+PWH/bc1tAorj+ZJFoaspmcCKIv2Xs7T8=; b=JfveQu1xSLaZ/BWUJg5KuwzUVk
	KDRW/VHQTAPmLfhvKtuQFRAqKmtN5DlWsWbl0cMjCTqDRuir/Q3QoFFWA96nQC7b8nX5iz/qoKWZz
	XBQhwTePfa8m/NPVgkFYz0gMgXN2z4Z2uCkzr9nikqExdNYBzO3EKCwEvDfQipnWHZFhlDvXqCtYK
	VAA8q38sgLNCZL9nKX5ortVTZbDyJOiQI2XmOkKWM/fFMXmkWPURUVC3dYIq8UrhWgiEKV7ODIsaK
	9t73co7Px0nFtnj0FaHCxd1K03DXEDYx3sL2zkKDR6YFuR1Ioocgkl+18gI1DlviAs1fH/I5B+MIN
	B3vmifjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syTd5-00000008olp-0JI4;
	Wed, 09 Oct 2024 10:09:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syTVh-00000008nF3-24xA;
	Wed, 09 Oct 2024 10:01:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728468094;
	bh=HcDAYIWRb7ZSj+0+ipjYB5c/7wdOcwxEV1HjEhIn0z4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CDxfKj1FcxD9FXXQQlKYbc0NAXjhykFMk7AA+jo3Te9KnUf3ZUwLPzcr5pz8VrQiO
	 k4f9ahsmQMStM+BKLJgLVrYxzYhzznIeMujcgP1ywXpf8CLbAy5jIHocmR1Nb3jav5
	 h2sNBtGCteaUk0+qAsWmK8Hcbd9GQtkT8eqiUUlELYSBv7x4DBjHjc4AGcbKL5QYBF
	 nRrgLnVMXLi51m/YgrgFBUljtOA3GL8zzg7hPd8+ouaZCo8LL/o/bh0ZS+Ii7ksz3M
	 3sYPoeAbnXx0iqkuBJ5+f3+1VnprrB3Eu+VKuH0hx8aHsa7PXWpIfXb5x6n+9xC9uO
	 jaC7mQBaEMz3w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 13B6417E1221;
	Wed,  9 Oct 2024 12:01:34 +0200 (CEST)
Message-ID: <972a9ad2-c362-40ea-8fe7-c1d75cb5978a@collabora.com>
Date: Wed, 9 Oct 2024 12:01:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/5] drm/mediatek: ovl: Remove the color format
 comment for ovl_fmt_convert()
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Adam Thiede <me@adamthiede.com>, Yassine Oudjana
 <yassine.oudjana@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Shawn Sung <shawn.sung@mediatek.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20241009034646.13143-1-jason-jh.lin@mediatek.com>
 <20241009034646.13143-4-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241009034646.13143-4-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_030137_744732_2963418A 
X-CRM114-Status: UNSURE (   5.43  )
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

Il 09/10/24 05:46, Jason-JH.Lin ha scritto:
> Since we changed MACROs to be consistent with DRM input color format
> naming, the comment for ovl_fmt_conver() is no longer needed.
> 
> Fixes: 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in OVL")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



