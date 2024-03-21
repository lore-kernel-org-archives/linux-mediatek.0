Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92277C54E58
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Mar 2024 08:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdnp2JxWyjWchKnebsmfALoMCc+Qrpr2KHkw4pMsy20=; b=QpZgjLYFk/+4fl2HrRn+jp6OGj
	feg9UnQ1ouAUArEo4/gPjfyCXAs6Ee9236kQaV8OdeA/E+Hk5SKG9j+1qbcqBnSHNxeaqPVcsWHYP
	LWevWmhrKhM2+8oEs48c7GVw1Gwm6DAmxBVWRQG4mtVI2F4dQtRcEkloknyN7LamJoZvXTe9/KAkL
	y83NP1rUqfn8AKdaK9mtB5SqfUr6QOH+BECwK/BbDBmqvUQtJyhyKU0aUC7T2LDxOmYtVXsieOM17
	S1AIzZDrX83SDpz4i98Plsi4rX+IzmwlXPtgloBDGLWv3gsYMJ4yrlgurUdf/zXikzMq5h3AJe5bD
	lCoc9llA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnDtW-00000002LJS-0vgc;
	Thu, 21 Mar 2024 08:35:26 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnDtT-00000002LI9-0IZB;
	Thu, 21 Mar 2024 08:35:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711010121;
	bh=IIW6SQQLgLtDClFTOxTHaTcvrjEa+NJrpFMbCdwEEwk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=1ZrnHCJ766YQlCIASvqysbAjbHcfbkuX1Qdhm6mI6cy5OiUasCwAjTlU3RdY65h9K
	 R7FTO3MyniSsnvZrxjet1GyCus0KoAdGFKy8l/I316cO8yzgWhnT0XWU5NQcDNOIqx
	 hbvO9QMctus6Nf+qDQkREb6mxp2YXPnb4c7eT5C1esd1SXQ8OdTJoAFkQ9ErSZK4qF
	 vtM1V+UClNRJm0Fuv+z7tLvXxKbhgrzuOy7ARD/SLyBWBQvDm0RC8zPITxzIKnvWu7
	 6IkkNp6UrqKpmOtdvq9A6gzXGRNPLuc3kKBxQsSkFPNgv5qZAmhqoR4l24z81r51yj
	 jW4hK58giEUNA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E57B53780BFE;
	Thu, 21 Mar 2024 08:35:20 +0000 (UTC)
Message-ID: <87800bcf-564b-4a8d-a866-3dba0ead6190@collabora.com>
Date: Thu, 21 Mar 2024 09:35:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: mediatek: vcodec: Handle invalid decoder vsi
Content-Language: en-US
To: Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, nicolas.dufresne@collabora.com,
 sebastian.fricke@collabora.com
Cc: Longfei Wang <longfei.wang@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240321014754.6540-1-irui.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240321014754.6540-1-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_013523_464782_0EBBC0FB 
X-CRM114-Status: UNSURE (   7.30  )
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

Il 21/03/24 02:47, Irui Wang ha scritto:
> Handle invalid decoder vsi in vpu_dec_init to ensure the decoder vsi is
> valid for future use.
> 
> Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
> 

There shouldn't be extra lines between Fixes: and S-o-b: tags, but I guess this
can be fixed while applying the patch.

> Signed-off-by: Irui Wang <irui.wang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



