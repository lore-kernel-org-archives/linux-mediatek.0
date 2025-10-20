Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1FACCD1AB
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Oct 2025 10:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GviU1XjgZUD5Gl5FaCtRtBy/NyvMVZCWjmigauUwJpU=; b=l9/2zyLf3fzG+w
	OJhp3G9cxqoSLugXg3DY/48a/MmVQM3opvzAEKa/vDbLk/NPyHeZFDUKY16F8XaZudRrGFumaD4bN
	OG4Uw61WwxC+IUKuMSrfNYmJDTazC+AG6eZgghbNLBKecuVweFRLowlLpo3Wyo6iaX6RIIAtS/bq/
	U9amJcLLHUkynHHIXyS/H2aiv+ZxJ42yRBxy0fViTt6iw1uhcQHUC0yYOhBoAvNg5ojtVQSiLY4WS
	l8y6OpIFMsiFHE8QRoFja4+cWXWdgc7u5IdLWNK2DPAgb5TxfCtSy+mQXVUqTLlDgUxToGQzi00d9
	BSwtlbDjfP/2LiF1q5bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmkl-0000000Cif5-2uJS;
	Mon, 20 Oct 2025 10:04:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmkf-0000000CiXG-3OOb;
	Mon, 20 Oct 2025 10:04:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760954667;
	bh=HAo0u9lj8gh67AIZa7MpgeL6X721kh0HCt2UfsjSGtI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JFlNh8PF9j5E+7YvKhHPr9LB4/23lSOser7ah7FVnzBtfmA/J/VYtmvGVfsWZSffi
	 NmCzTJgHFbxrEPAXJOWwPInsP+bNsJ3kiRQQc1FSI9pR0InRGryeQQWBmziZWj8iAl
	 juTJuqv6ZmiIgP801q25W6eJTE0SAkk7HGtaN+K3gHeCcLsdXA99qEHuOrZmIz9D+5
	 WTVDx+4GHklfMRHSdoTqaTixCtt8/XfrParHHjjWSvWH+uBiF3EGQs4lLHVTmDb851
	 /31UmKpofsFQrAXgJE/zFVBi8oU2TLJ7GY6HndUrd2NLkDutvqjgPakGjI242clXr6
	 XGqyXvP/ltA+w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1C7B417E1278;
	Mon, 20 Oct 2025 12:04:26 +0200 (CEST)
Message-ID: <abed2954-8a0e-4b8e-af44-f0b0d9764527@collabora.com>
Date: Mon, 20 Oct 2025 12:04:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 18/20] soc: mediatek: mtk-cmdq: Remove cmdq_pkt_jump()
 and cmdq_pkt_jump_rel_temp()
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
 <20251017065028.1676930-19-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251017065028.1676930-19-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_030430_043381_ABE62B93 
X-CRM114-Status: UNSURE (   7.26  )
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
Cc: devicetree@vger.kernel.org, Moudy Ho <moudy.ho@mediatek.com>, Xiandong Wang <xiandong.wang@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Chen-yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Nicolas Dufresne <nicolas@ndufresne.ca>, Project_Global_Chrome_Upstream_Group@mediatek.com, Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Sirius Wang <sirius.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 17/10/25 08:44, Jason-JH Lin ha scritto:
> Since all users have migrated to the new cmdq_pkt_jump* APIs without
> shift_pa, the wrapper APIs cmdq_pkt_jump() and cmdq_pkt_jump_rel_temp()
> can be removed.
> 
> Fixes: ade176534112 ("soc: mediatek: cmdq: Add parameter shift_pa to cmdq_pkt_jump()")
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



