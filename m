Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90583CAC5AE
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Sep 2025 21:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tc33BGQmN5NZLK5xk6Rge4pyTPkIDaqJAXJTfQ5dWz0=; b=YzKz7C1pMySlOqsjVnRsAvoQr9
	vZ2kaoS6ttGT325nOX1PNmBY0o7ilt2Auhxmvgp8w6VT2rXuxPniN18/q8qvu2Mrakxdp/nvI94QJ
	GUbaKdYUeDFxOE1JrSDGdQI2ur76irLJ/soocXFXabpOhJM59LS3bPYYVLKkU3wC7heDXkQYthWsv
	0S5ztfZ1OX/Wc7i5M3t5Ad4HZ1JnPdjXzJGghLfLoU3gcbboYEUtTSfPGeWarIMQ5qdhuRlVjFn/I
	D91Mny2AuGVD4vVPbEAMsxxJvahu/Ifkd45kyrHD50K9kPqzFrmfBdAQC6bBYZAEv1yqP7LtT30mL
	XzRt912w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1XTT-000000044pM-3M6h;
	Wed, 24 Sep 2025 21:56:31 +0000
Received: from 003.mia.mailroute.net ([199.89.3.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1XTR-000000044mg-1Hat
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Sep 2025 21:56:30 +0000
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4cX9fN3TFLzlgqy8;
	Wed, 24 Sep 2025 21:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1758750985; x=1761342986; bh=Tc33BGQmN5NZLK5xk6Rge4py
	TPkIDaqJAXJTfQ5dWz0=; b=sS1Gpm3UWA+EoIgFSBh1DFjJBChVEqtgR4knoGan
	dFSh9ovSJHEB8RFiCwQ+ohS77A0bOSQ+fvS/AFfO2TqPRl/yZHV+3xUo4+PdmgOZ
	M0nLqhZ+4GlwDaHdbpRx0EqBoqrXDngN1TJvSghpbsTo9TeBiEcrMZY6kb3sE4gg
	TXVzBdpMMctvSCO2FnH2JyMBeKYcXZD2mNrDq60PyvFtwjlL0v0lXRvWJZgPOX0a
	1tDjcXhXGVsHB0ZMTkZfVNeBoPEH0bj5MV+HSBf3CziFHXVHNB6UJdJ8eVodGOv3
	RDZQhqAh3lXNxw1l0rOf2uoT8AvVO4p3KPCgyY6wgKDwtg==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id ss87GujbnOcl; Wed, 24 Sep 2025 21:56:25 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4cX9f51MgmzlgqTv;
	Wed, 24 Sep 2025 21:56:12 +0000 (UTC)
Message-ID: <eb79d807-c036-4c25-9da1-72899da8069c@acm.org>
Date: Wed, 24 Sep 2025 14:56:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] ufs: host: mediatek: Correct clock scaling with PM
 QoS flow
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com
References: <20250924094527.2992256-1-peter.wang@mediatek.com>
 <20250924094527.2992256-2-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250924094527.2992256-2-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_145629_421679_B9C079F9 
X-CRM114-Status: UNSURE (   5.58  )
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

On 9/24/25 2:43 AM, peter.wang@mediatek.com wrote:
> Correct clock scaling with PM QoS during suspend and resume.
> Ensure PM QoS is released during suspend if scaling up and
> re-applied after resume. This prevents performance issues
> and maintains proper power management.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

