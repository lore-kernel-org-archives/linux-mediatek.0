Return-Path: <SRS0=vfNJ=ZS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C992CC432C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 05:21:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9424A20637
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 05:21:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L3sTR9AR";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="FMN2kgSH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="NmSp6VcC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9424A20637
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Tqjt4kwoyVsckbgcoidA8IilHGh2s2fIwFaQIRdVNE=; b=L3sTR9AR5ZaLAH
	JzfOeTitEDbUIWuS87kRzFNlQHuAFVzw88jExKOMURNA5TpY3WOMyZ0zZvmvgs3Eb6mHemMPrECvm
	1qJS45CtKkmjD89hJWywxxQMu2pbPnWbxkUzYMHDHpBYAt7BkTwZe2qTXhG+8ztLmronyIYMJ9S8n
	XhzyhFCv0Bn8+cZNCleTNqzra6+7z+U6TQAtS6dF4MbXHLiwo7F4Yyd44VlK0BnMACTX6PVR67U8g
	wDFOsObceAp6I9TChZgSe83f7iIorJY7ZXbtTmBe9n2orwryLUtz3C8+MgoJ2zYvgeFuBE0AXv3l+
	PoH9XVDLvoH64LDXjr9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZTIC-0007JN-0c; Tue, 26 Nov 2019 05:21:40 +0000
Received: from a27-185.smtp-out.us-west-2.amazonses.com ([54.240.27.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZTI9-0007J5-2f
 for linux-mediatek@lists.infradead.org; Tue, 26 Nov 2019 05:21:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574745694;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:MIME-Version:Content-Type;
 bh=Q30J46XsTfdEK32DLeFx32uQEy6aKHBQkOg8LyiaJ/g=;
 b=FMN2kgSHxKdBj1sdxfJQBs2Eim3Hzm+cEPTe+jkxoHw+weUDowoWV+a4TX6mF6KV
 MhDPTz8c6R2tTS47Tb14g1GdxWOA6ttwANDEU8/hDzWXmkx+qoCQPnqtaaVAw8gncSN
 IqMRbcHs1als/eLnTg2VORWGv6LCMYBuCaZg47Ho=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574745694;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:MIME-Version:Content-Type:Feedback-ID;
 bh=Q30J46XsTfdEK32DLeFx32uQEy6aKHBQkOg8LyiaJ/g=;
 b=NmSp6VcCL6yiTkSEkLkJqP9j2LdORf/ePO5iIUNj+1age+zliyqiZt0Y3zT6U3Ej
 n0O5v2LUP+6jrpXRfYRvOc9g5XQ8ID2WcJEV/SmGmndRQIDlgMOp69F+r/yEIqQ3TVd
 erF1CUyvPDU2yg000vT3vDddnqjr4+viNrBH7Q6M=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BC332C447A6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] mt76: Off by one in mt76_calc_rx_airtime()
References: <20191121213935.2cbgh3qmd4hv4v5a@kili.mountain>
Date: Tue, 26 Nov 2019 05:21:34 +0000
In-Reply-To: <20191121213935.2cbgh3qmd4hv4v5a@kili.mountain> (Dan Carpenter's
 message of "Tue, 26 Nov 2019 07:49:56 +0300")
Message-ID: <0101016ea6286170-2e12fc2e-43db-4e1e-8ab1-d530bd9a7c55-000000@us-west-2.amazonses.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-SES-Outgoing: 2019.11.26-54.240.27.185
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_212137_277061_CACE5FA6 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder Lee <ryder.lee@mediatek.com>, kernel-janitors@vger.kernel.org,
 linux-wireless@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Roy Luo <royluo@google.com>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> The sband->bitrates[] array has "sband->n_bitrates" elements so this
> check needs to be >= instead of > or we could read beyond the end of the
> array.
>
> These values come from when we call mt76_register_device():
>
> 	ret = mt76_register_device(&dev->mt76, true, mt7603_rates,
> 				   ARRAY_SIZE(mt7603_rates));
>
> Here sband->bitrates[] is mt7603_rates[] and ->n_bitrates is the
> ARRAY_SIZE()
>
> Fixes: 5ce09c1a7907 ("mt76: track rx airtime for airtime fairness and survey")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Should I queue this to v5.5?

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
