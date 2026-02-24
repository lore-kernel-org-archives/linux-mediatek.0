Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C3EEFB81C
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Feb 2026 16:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XalST2aF8KFTi0PVkHHN8BFRIi0fE5s/1PbfuL/uOZY=; b=nRXapoGROI5QmpKKirYaXVrjBg
	FOwiMbXGpa80iEYc8dmNx+fZ+pnCPia+Env10daTTno+QLtRtF29m/iKIy0Q/CKNqfvomWM1xeftj
	NIjMsz/9uDkdi67kp0NfbIDU3zn6ujPjCLFnmDFKoa9bnTlrQ45nK7eUhxM+l9uBLfk9QBosHffFN
	y0bin+Tx0PwWRBtbbjQAdoLpGIYpV1wZ/QCy0Pm/OevjEluYuQJQinVK95zB2VYBhpPVeyuk68b7L
	dLh+eQ420tkjHif8Ie4O2oQ7ecALdf/r5F2L0NFox4bhGEVlZxWXm3GTYrI+S1f3i1+i2CU3KhXon
	KSKi/KhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuvar-00000002QMQ-2nQo;
	Tue, 24 Feb 2026 16:49:05 +0000
Received: from 011.lax.mailroute.net ([199.89.1.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuvao-00000002QLl-2Sgf
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Feb 2026 16:49:03 +0000
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4fL3b16G4sz1XM6JH;
	Tue, 24 Feb 2026 16:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1771951740; x=1774543741; bh=XalST2aF8KFTi0PVkHHN8BFR
	Ii0fE5s/1PbfuL/uOZY=; b=qBxE8ENTIOpj/w4jV//jJhXpbdxJx0rJD44PgWzK
	TH0+veOghWtUkKHbe2ZuvTAN/5eJ1Ouwt/ep/hOoHHxLyVo9eVVVZg8PHIkvyNmW
	/fG4x0WxUBtREo4ki3yl5rjrrlXH5ISFcipWseCYlvNOr5GxUHiJYU6Le2CNBbqH
	LF6gJfqEutGtaP05d8wAX8S5zuRTnePJAdXowr4FHvzjRWec2QzYYPGqOjyvIZAW
	SLgK0fs2hwRz7Fx7n/vw8Dqfvw8viepiX5cdqQMjAlw42e9wRgyUgZG63ADqsEqs
	XsK22yCNPZGgVErTefzCIclHy9EpNq4SdolKTiMjyvkd6Q==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id nWkhkSnBG_o3; Tue, 24 Feb 2026 16:49:00 +0000 (UTC)
Received: from [172.20.150.38] (unknown [4.28.11.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4fL3Zz1FXGz1XM6J7;
	Tue, 24 Feb 2026 16:48:58 +0000 (UTC)
Message-ID: <72757f9f-20de-4fb8-b5eb-507dbcdbe22a@acm.org>
Date: Tue, 24 Feb 2026 08:48:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: core: Fix possible NULL pointer dereference in
 ufshcd_add_command_trace()
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
References: <20260223065657.2432447-1-peter.wang@mediatek.com>
 <5017b907-16de-4d7f-a7c6-dbc504ffd1eb@acm.org>
 <399765bade9b7adcca89a94313e71635d1336172.camel@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <399765bade9b7adcca89a94313e71635d1336172.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_084902_715746_92F0555E 
X-CRM114-Status: UNSURE (   6.45  )
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

On 2/23/26 9:29 PM, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> Therefore, there is no need to assign hwq_id separately.

Hi Peter,

That's not what I proposed. When ignoring the NULL test, this is what
the current ufshcd_add_command_trace() implementation does:

	hwq_id =3D hba->uhq[READ_ONCE(req->mq_hctx)->queue_num].id;

That's more complicated than necessary. This should be sufficient
(again ignoring the NULL test):

	hwq_id =3D READ_ONCE(req->mq_hctx)->queue_num;

Anyway, since the proposed change probably only results in a small
performance improvement, let's proceed with the current patch.

Bart.

