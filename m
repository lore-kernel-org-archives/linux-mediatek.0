Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D397FCF9C62
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Sep 2024 19:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZwVm99MSCwmVgD4E2ynjUWi7Gy55GJB+9Ody+tF8LI=; b=fC6/eCrSl5ss8qKBAvtzlvACi1
	5TbBse0of9+jCSk29b0jToKOOKJ0FfZo6p2Sa6vJWAIzH+R3iTwIQEaJ+XRvNTLnCk5l3w1MnI7bv
	NPqBjAWQo2HKFTqDUbf4G0AQrWscczdERFAh+eVeW3ZAZaxxEGmd+oMCEa8mVJMExyxeRlV/avJX1
	NoZxW1L8TsqhzhddM3/ka4HbVJA2TC+fGh9kh0qpdAAWsMEoM8sLFS6LjQ5AF0l+75S3K5Kjzxiub
	RJQ2LckFOBGHGbQM35C2MwSEDhh+i8tXLTJK2rLkciQ+Y8N4jK3LaKx4/oD6hGk9/uieg0ex52qTg
	dkK3rMnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srjQT-0000000Cs0C-2ueQ;
	Fri, 20 Sep 2024 19:36:21 +0000
Received: from 009.lax.mailroute.net ([199.89.1.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srjQR-0000000CrzS-0jaF
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Sep 2024 19:36:21 +0000
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4X9N0x4Qc6zlgMVY;
	Fri, 20 Sep 2024 19:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1726860971; x=1729452972; bh=XZwVm99MSCwmVgD4E2ynjUWi
	7Gy55GJB+9Ody+tF8LI=; b=gad6P7dNn6ZwAjkUXpMJ1u91O59k6secRyO4QmhI
	oPZhL4IoNKQUiwuaFk4tx+fLIfWKJPHoLb7gc9SbfLP1+llxoJK0Zc4PMmLomAHb
	f+9pD5oINTpMnHutL2rGbMXrj3Y2uI8il5AMGL2F9QjCr0xuEh11H7jbdN4lZ+Rr
	n9k5ICzWvhqrxufDKR3ctEPiiMw0+QAp3fWEtL5NGKfTWrNQot8FiKqbTtYcurVy
	WlvFtqUTNeA3GQrx9mRvZ+drfPirq1Ps0rWupWnTiNYhuURF+Qc0jscf7ur0UpxM
	qSnbesEKsVOBWkwhJXRrTart78b46Tj6KRRJT23LjdTf4g==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id tL4M3iYk6R_w; Fri, 20 Sep 2024 19:36:11 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4X9N0n5DNTzlgMVV;
	Fri, 20 Sep 2024 19:36:09 +0000 (UTC)
Message-ID: <56d48010-13d8-4bfe-8b71-85699c1b45ef@acm.org>
Date: Fri, 20 Sep 2024 12:36:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/4] fix abort defect
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com,
 quic_nguyenb@quicinc.com
References: <20240920090643.3566-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240920090643.3566-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_123619_462109_B31406F2 
X-CRM114-Status: UNSURE (   6.67  )
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

On 9/20/24 2:06 AM, peter.wang@mediatek.com wrote:
> This series fixes MCQ and SDB abort defect.

Hi Peter,

Patches 2, 3 and 4 in this series introduce a significant amount of
complexity. Additionally, code paths are introduced that can only be
triggered by UFS controllers that (incorrectly) generate a completion
interrupt for aborted commands. I'm concerned that these patches will
make the UFS host controller driver harder to maintain than necessary.
Please take another look at the approach I proposed, namely making
ufshcd_compl_one_cqe() ignore commands with completion status
OCS_ABORTED. I think this approach will result in a simpler
implementation, does not require a new quirk and minimizes the code
paths that are only triggered by UFS host controllers that trigger a
completion interrupt for aborted commands.

Thanks,

Bart.

