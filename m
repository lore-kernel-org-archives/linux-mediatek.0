Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FAAEC83F1A
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jul 2025 16:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yP3aT+JfGsb4+PzNNmnU3uhOZT3wDG6ycApzRIATA40=; b=0RPB0khvgFYQGbQtgBaIYmXbeS
	OEAUyFGCKylOdG9ZbDPCHafveHrK1SvgorBRbmP1eX5uJNKVBg2QqiJgK+JjnWz486O2bb60kWIQT
	hXP6w0oScIOaPiiUJf5/7COjonDfEuuh/Sg7H4HBhuH+zsuefdwkw3OBwxkrKyuqSmm3MqcjQvv5i
	yr77YsF2rxtW6TmeYyqvYECtv6xs5b+MIA3gI2Hlu1Ia6deQnRSb79fO6QoIvmWiSKGkXaCLNLDUD
	vxERP+BSPLn459yCnuu9/sJJvIEweFdw3j7PFvk/MNkaPxgurSVFosebuGUvDrJGMJpywmyWmCKit
	niBYFerA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFkO-000000030S3-09Lw;
	Tue, 22 Jul 2025 16:21:44 +0000
Received: from 003.mia.mailroute.net ([199.89.3.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueF5K-00000002tjb-2iWH
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Jul 2025 15:39:20 +0000
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4bmhJj3jKgzltJQT;
	Tue, 22 Jul 2025 15:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1753198754; x=1755790755; bh=yP3aT+JfGsb4+PzNNmnU3uhO
	ZT3wDG6ycApzRIATA40=; b=iBqKV5Y7ku78yrodaaAlbFJ0wiIoUQAidWa0JbHt
	64iwejlqKFkMcX3vIth95FR/qw/SosjTOF1nZvVEpj6w8UJ5U4XFXih4EIB0IAr7
	nnxdX1iaqWfUxFQjJD/d0mEPTNb/fP2mVhE7FSB5A3nyZ3Y1diPgIZPr0kjkgM27
	5+ChcpY1AkR9gskEQBVI4aD4VDQ3YhLSV5Dp4aQwWyqSSpcx+7Qs41ERTuQGz1fk
	Lhm5eLjc3PmaLj9T3S9A/8R0mGPmF6ffvnDw3iBaJv+nYy1V/dPiQpbcLgkDmsxM
	c8Z2bXnGZ63/LfRjlv/XClVSnaFZWcqi/4CD0TN8yijg8A==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 1r234GrJPkxk; Tue, 22 Jul 2025 15:39:14 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4bmhJQ4TT3zlsxD1;
	Tue, 22 Jul 2025 15:39:01 +0000 (UTC)
Message-ID: <8b44e181-68b1-451a-9856-95803b7eaf86@acm.org>
Date: Tue, 22 Jul 2025 08:39:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] ufs: host: mediatek: Simplify boolean conversion
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com
References: <20250722030841.1998783-1-peter.wang@mediatek.com>
 <20250722030841.1998783-2-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250722030841.1998783-2-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_083918_763993_E0F0F13B 
X-CRM114-Status: UNSURE (   5.79  )
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

On 7/21/25 8:07 PM, peter.wang@mediatek.com wrote:
> This patch simplifies the conversion from unsigned int to boolean
> by removing explicit conversions and parentheses, relying on implicit
> conversion instead. This change ensures consistency with other
> usages in ufs-mediatek.c and streamlines the code.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

