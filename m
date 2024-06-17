Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD072C2BA18
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 11:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zdHE5Vs65UbtFZ89Nt4kUGqKnp5D+mcGEByfAFRS9XU=; b=Xj0pdOzGtkB7OPZUJw1icELK5g
	2kfFBfE51IyKPYacnzFIVxmq0DWKEpJAcOX8myr3btznDD9eAhb9mhJ5aJLtZx/0g6lhjUFPILqCd
	TJPI+exMqhwkwGj+PD7G81UW++TR3C2er4hrEbz5R8Xqtda1hezJocIDB2nYlhsd8NDbPk8Hsk+Z5
	qZo4Z+J8Je5pbOcKD2i6vzPq+9dET9clZDIfKpZVZlUG8224I8129pwqpGu3aP2Gf9Vxx2WQT8rTI
	vRKVgd9RpaQ9YdQO6uk0asl+mQEzsuhLpklxnZloTNX0b0W02FUjMWMtgPBl4UnADd+hREOm06nXK
	VoYHedPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJAPl-0000000ASCC-1n18;
	Mon, 17 Jun 2024 11:20:45 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJAPg-0000000AS9D-2R0u;
	Mon, 17 Jun 2024 11:20:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718623239;
	bh=1SLWPyPglngWrx9xUgQjtGPeTxnAJOtM3yGToDlbRaw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aOzotlzYGGJseL/4cjdfS+0ABT1h8Cxk7gQa5ff3AcuOmunZlHlf1FgYfET9Q0/4i
	 8xCmNOAVy6LoAFljcQtnK9NtxDWXKWycgr/VAiKGFo+1oc5PpxwXvKEfGkvOB1s7Bi
	 rTiZ2TbHD7Q8aebO5HZ8K3HJh9mB9do+OJkaGvG9k3FJkeGKSKBL/J1UY7cthCn15U
	 QiSCxxObuU4L/b7XbQsjLIeikbDJVhCSJ9Wafb6INqlJxxAsVdCUYxNyzibNT7S9Zf
	 zn/rhQz/u6ScOKSEpbuo4g9V6NvzW4anbW9M2wrHP3yWfFy781WjlX6K0sVRMpiCFK
	 xB0f1RW+QhChg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 797AA37804C8;
	Mon, 17 Jun 2024 11:20:38 +0000 (UTC)
Message-ID: <48bcaa6b-b814-41fd-b584-da664f02e3ba@collabora.com>
Date: Mon, 17 Jun 2024 13:20:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] drm/mediatek: Add new color format MACROs in OVL
To: shawn.sung@mediatek.com, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 CK Hu <ck.hu@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Daniel Kurtz <djkurtz@chromium.org>, YT Shen <yt.shen@mediatek.com>,
 Mao Huang <littlecvr@chromium.org>, "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240616-mediatek-drm-next-v1-0-7e8f9cf785d8@mediatek.com>
 <20240616-mediatek-drm-next-v1-11-7e8f9cf785d8@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240616-mediatek-drm-next-v1-11-7e8f9cf785d8@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_042040_800490_9B2D3B4C 
X-CRM114-Status: UNSURE (   6.29  )
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

Il 16/06/24 10:29, Hsiao Chien Sung via B4 Relay ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.com>
> 
> Define new color formats to hide the bit operation in the MACROs to make
> the switch statement more concise.
> Change the MACROs to align the naming rule in DRM.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



