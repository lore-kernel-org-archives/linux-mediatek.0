Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D764CD4F25
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2026 16:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=swS16nnIbpByZs7OpRIN4lF8yu7slWPN+Qu1EPsvXms=; b=5A2JFIX1ilNPAwLsPzb83nr6xA
	qbKDSE3gN8pwESEtmIAa9iFy8ldGD+uBDpZP9wLd8nKT9516j7MHPFkqBLTuN07n+u04bASNs0iLk
	Vrq+iYQuRuxs0mL2pnFhM3XfPisyuRkegtsuJa+uvaJazfBIacqGvNmk/R8BFdTntTIaN76dvLxyP
	SZRcVi48mfWXfekLC5c56BEB3rkfUv1HNq0bP7Kp4DVeoV63et+JvlIGQSeVYoPYx55ZGeBYtN/uj
	1WIegvK9+PwKXzfFQdny5H2aB3GFFNSR3umgaix5FNlc7CfttllymgHJjz3DaNMdGWrtRzCLEsFZ1
	VLt/Po2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYq9-000000062yb-1fcE;
	Thu, 14 May 2026 16:23:13 +0000
Received: from 013.lax.mailroute.net ([199.89.1.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYq7-000000062xk-0OWR
	for linux-mediatek@lists.infradead.org;
	Thu, 14 May 2026 16:23:12 +0000
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4gGbGh3sdPzlgy27;
	Thu, 14 May 2026 16:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1778775781; x=1781367782; bh=swS16nnIbpByZs7OpRIN4lF8
	yu7slWPN+Qu1EPsvXms=; b=V86cVgdpdUjmZfuK5xfIZaWfL/D0YtlbkLAV+lO3
	eM10N88ARsPt9rSnVRTWMWr2gSFy6RIa+BOpOYQ/PudepMAbdDyB4dvsYZNeEGqV
	emehd18P3wsK32w2M+c+R3bkfNOyTuwj2R+NOQsf6OnSiX3MW0J1YhXje6LAvBS6
	x0pGNR2+KzGXUQmexoT5ALnrQVVJavHxSWV08YIvafl1FAgs4AtaUld0fYZCjeJt
	8XsUTaRXK9As5bpye6ugKEZjZdUzBL+khGirqRLyNTTE/p4xMXNlkKVsW5/Uw9lV
	sLPVgjAaFjOUMHskGc5OstDi+8WMNkCVvfsgZqZRujAQKw==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id NEgB9YlGvc2u; Thu, 14 May 2026 16:23:01 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4gGbGR50XTzlgy4t;
	Thu, 14 May 2026 16:22:55 +0000 (UTC)
Message-ID: <382f6d79-c877-4dc8-813b-ee91ac5489f9@acm.org>
Date: Thu, 14 May 2026 09:22:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: core: decouple CQE processing from spinlock
 critical section
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@sandisk.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com,
 quic_cang@guicinc.com, quic_asutoshd@guicinc.com, light.hsieh@mediatek.com
References: <20260514082906.58593-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260514082906.58593-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_092311_147011_C5965AA4 
X-CRM114-Status: UNSURE (   6.21  )
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

On 5/14/26 1:26 AM, peter.wang@mediatek.com wrote:
> 4. In both ufshcd_mcq_compl_all_cqes_lock() and
>     ufshcd_mcq_poll_cqe_lock(), snapshot the starting CQE pointer before
>     advancing the head slot under the spinlock, then process the collected
>     CQEs after releasing the lock using the new helper.

This can't work reliably. ufshcd_mcq_poll_cqe_lock() may be called
concurrently from different CPU cores, e.g. from a UFS completion
interrupt and from ufshcd_poll(). Processing CQEs without holding
hwq->cq_lock may lead to overwriting of CQEs before these have been
processed.

Thanks,

Bart.

