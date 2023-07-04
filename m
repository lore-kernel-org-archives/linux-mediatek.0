Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CD1EB64D9
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 12:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXUQutbMiZS3X0GhYe2qooQPUhgLtExD+RzeRdX49b0=; b=WcLG+ztx0/+f3yoSOfDb1rZTUu
	/hS9heLRbPv9PoHIfKQ0Y1iaHlu6hNyXdfHgxdBPqlUqewzXoBxX1rwd8Gym0ooo4Flg1ALjzzZw+
	UaPhYkbTrfG5u1xYRnZZEvrHAXfa/uAA83nBfpF34VP34fsirQAj5RGR3ADKVBqtflhqPwsn0xNz2
	mKwJ9XQXR4NuG4mgaV2wOV2njTvN8BoQUhQhECyDoBBnLYReKWW7Zv47tA4kXylZD/CEOBwbunfmA
	iv72zxK4ZVX8oIWy+vwuhsw4EPqo7lLmpGx0gw0vS15lSOuglJ/A4NQgvjlcc3LJ3sAVbq9Sms/ok
	ksx0G6xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGety-00DDM1-1P;
	Tue, 04 Jul 2023 12:13:02 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGetu-00DDHK-0F;
	Tue, 04 Jul 2023 12:12:59 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EB6876606FA4;
	Tue,  4 Jul 2023 13:12:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688472776;
	bh=AKv15KyJxi+M2BY0dALU0oBvI4qbW/zdOJOz+flESlk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OFpullEbjeFmzINxJN00/lApkvRq4l3Tr3+WgF+378PT6mW5Kke8J0C2iXntg02vz
	 bQqSVcnKQgtwc4mW5YVj4EQBqSIDqKeXd9aYFVvqBPow+cK3wW1F7Sgejeod4F58xW
	 Pqx1hmTQetR+slRRVU8DuM3zie97A9t8r002WoJ90FPAUqPJW94soagtMLGtxwUkGF
	 l1t1U4JSZXip/e0a7Z79k2vmJ6F+LP5ij24zzvdaCjDWkRdCxWpfGle3frK6G7EGem
	 Ih3Do0F1Up2x2ebvlt2J684ZwNg6AhGhjKgBQiBphBNjxCq64WvEos/1/KscGUBllB
	 F733CaM5hHM2A==
Message-ID: <a9155131-0877-ac0a-d719-d764b0c0056c@collabora.com>
Date: Tue, 4 Jul 2023 14:12:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5,06/11] media: mediatek: vcodec: replace pr_* with dev_*
 for v4l2 debug message
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230704111327.7140-1-yunfei.dong@mediatek.com>
 <20230704111327.7140-7-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230704111327.7140-7-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_051258_250910_19DB93E7 
X-CRM114-Status: UNSURE (   7.60  )
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

Il 04/07/23 13:13, Yunfei Dong ha scritto:
> Adding different macro mtk_v4l2_vdec_dbg and mtk_v4l2_venc_dbg for
> encoder and decoder. Then calling the common marco mtk_v4l2_debug to

s/marco/macro/g :-)

> print debug message.
> 
> Replace pr_err with dev_err for 'mtk_v4l2_err' debug message.
> Replace pr_debug with dev_dbg for 'mtk_v4l2_debug' debug message.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



