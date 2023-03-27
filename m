Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A024DC7619A
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 08:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6s30Li/DbNYcqLng2nkmTobrRqZvpYYVIMYIxAuMyY=; b=McRPepax4IhQzOZvp30R5affl8
	+EQEpXMXIDPZnLQD5VXSeCwp4F41aLh1vybhWQ4tvJMKFsWrZ5aI+7E01UxQcaLYkxA6bq/aSnHYJ
	eEpwNJYZ8asFMs4ZFlwJml4e13U6CO09KUOQSxgcvhTK7B0T0R6vnEwhbu/mb3mXQ2gRYunehG6ri
	BrLDnLrbZy2FsWt/ohgwsEPg2NNqb+2gjPHr0gKfZ6zZDT8nwZJjyXxNO7O9tk4DqXqYZCtJzkjl+
	/MMTkGZ/HajGstLHpk7K7AHkt05OBsFi3OG1t+fuc9knMf6HKYLIXQcJ4CUfEMaNlcGciuoiFOe3x
	mk2E4olQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgi3g-00AChU-0X;
	Mon, 27 Mar 2023 08:18:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgi3K-00ACYz-3B;
	Mon, 27 Mar 2023 08:18:08 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C6ACC660308B;
	Mon, 27 Mar 2023 09:18:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679905085;
	bh=jDooTS8qcLct5Vl54ilGPR8FOgm20tKt9IJyKUjAlAc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=COO8VnsXpRhoBOB/ZHWW8XLJu/+nUL2ZpUPlhZ+0128fZeZGqAYa1i8mA/s22py6M
	 4bjBXmM4IKVLsIECwrkRS93Pj7PAteOCDRcKrMytdnlnjiizBU3+t9Xi+JOzhsusbx
	 dp2oXA8YjCUyg9HrpqY8yu39IhhaBar3bMY1VApMu3GeYaVcEYAJj0x9jQorfszgME
	 o1TeR3GHN0Lbdj9dIzXxnS+N9PxEDiSmU2pkxpXYB8BC4760oEYtZzRWkAuZZkNJwN
	 oDshXCyLunrXHcQRHPXqYDrWQtPI2/nbK/nLuHCtNhmoPj8vEeWINk5E8RD4P0hAbh
	 zA0XECuTb3eCg==
Message-ID: <5c90ab9c-b5f7-d3a4-682c-7d27910242d8@collabora.com>
Date: Mon, 27 Mar 2023 10:18:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3,2/7] media: mediatek: vcodec: Add debug params to
 control different log level
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230327055315.13936-1-yunfei.dong@mediatek.com>
 <20230327055315.13936-3-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230327055315.13936-3-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_011807_151630_E3F2D730 
X-CRM114-Status: UNSURE (   7.45  )
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

Il 27/03/23 07:53, Yunfei Dong ha scritto:
> Add parameter mtk_vcodec_dbg to open each codec log.
> Add parameter mtk_v4l2_dbg_level to open each instance log according to
> the parameter value.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



