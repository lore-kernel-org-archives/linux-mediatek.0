Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E85C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 11:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNCHx0I+DTKz0IC4VvAciLepLsDUG3Agurbh2LdxmNg=; b=ymSD58BjHPeo2wqYN3phxgTN9X
	6KdVMPl5JhInVeDKlw+O7kKP6DPQl+X9m6zx5+Orns/iKw+wzPUO1snVLbF8yxTb0tRIkMuaFsTUo
	loTx4P3i3JERaJoaXDJ+uLbLcVrsotvQf4HwQxc7uEKIx5ZwiKTz6jKJqahiGnB0XvYUe3ZKRFeMA
	jGBJ/FEQqseUyWm1Hn92aFmX0ScBbU4A0/BUTIbLOiGi8zFcu9bmriDh9tD5gojwOV4XQO3AqvXzJ
	OSKRdpTaMja9pH9Zg7GnKhNcwowexqic1z0FpJNQNMibxVclAtT+HnRhwbqABqe81YPY7/cbqngI+
	CaEBBrmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDMyE-00EIoQ-0K;
	Wed, 13 Dec 2023 11:00:06 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDMy6-00EIlh-1e;
	Wed, 13 Dec 2023 10:59:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702465197;
	bh=Qdg2Wjhg+ytGk4SRjlf7DKRMcZo2+lDhtopoNOut+bc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e8+8TB1luoal4RtgGV3wAWXp6c9OwniwUnxZ9i685dFrMLxnu+z/6iDmcB2MI2zkV
	 yvCJ62jnehXqLwwFO8X/2EPrHw4SECNdaPpeWK2yyE1MR3LWD73T/m1ZtJccOyEe6q
	 77kUZZD+hz5KZcpRJyyV90acFrYBZunOrVuFJnH5JE0590HgWgHUTpYRw4+siLctm/
	 VnuIcdDmercHY4OJlYV440wGShhjr+Sq86+0WKrkNyBYzGRfA20D5jGj8DbKDeoOfg
	 rN5BqKiRzXjqVbS3O4WBgaPbAh50UCmtlf7iJiHVtkxqYQ9oWpoHm3hfHX2DUBvbHo
	 9o5DIMIqiX2rQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 509FA3781484;
	Wed, 13 Dec 2023 10:59:56 +0000 (UTC)
Message-ID: <84446493-2c3f-45b7-9d77-54a77e753d16@collabora.com>
Date: Wed, 13 Dec 2023 11:59:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/2] ufs: ufs-mediatek: Enable CPU latency PM QoS
 support for MEDIATEK SoC
Content-Language: en-US
To: Maramaina Naresh <quic_mnaresh@quicinc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Peter Wang <peter.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, stanley.chu@mediatek.com
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>, Stanley Jhu <chu.stanley@gmail.com>,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 quic_cang@quicinc.com, quic_nguyenb@quicinc.com
References: <20231213103642.15320-1-quic_mnaresh@quicinc.com>
 <20231213103642.15320-3-quic_mnaresh@quicinc.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231213103642.15320-3-quic_mnaresh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_025958_675371_D181E90A 
X-CRM114-Status: UNSURE (   6.84  )
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

Il 13/12/23 11:36, Maramaina Naresh ha scritto:
> Revert the existing PM QoS feature from MEDIATEK UFS driver as similar
> PM QoS feature implementation is moved to core ufshcd.
> 
> Signed-off-by: Maramaina Naresh <quic_mnaresh@quicinc.com>

IMO, title and description should say:

ufs: ufs-mediatek: Migrate to UFSHCD generic CPU latency PM QoS support

The PM QoS feature found in the MediaTek UFS driver was moved to the UFSHCD
core: remove it from here as it's now redundant.

with that fixed:

Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


