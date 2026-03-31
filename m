Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45842FF60DE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2026 07:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xf3baQcdCPT0xFW7ni7rVWBaUQV2OoiDultSu0Aff8k=; b=Tn2VZKjdGxBuLUermWrJ9OIHDD
	iygj/X85+fVyXiJHX5DzdqGyL9nSaGs2XdxloBbgKVepActV1gwZX8k2ICuLRKgy3Ijbj5caZYa1M
	VprEOcD/cFZ3F6KEgPdgfcqMN3FjlHiUjx7soS1bYze9Q/J213FdkCC1qN4S3yAuH+ZDzZzESRA/b
	pX5SPxvbw63L0aQPmlHffAaeJ74AqPT9Y4aUApUu9mDIS84M2jf9fV467ScSuVkRC8HuibiqXIMdj
	BT3TyOdekD7qNXrUq65aPfMS7zgC4FiEopXV7uL/YF63Zm4kAFWPCpNL/wqt3H705PB+G9M9xkbhd
	2yVVbLpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7U0f-0000000CXgS-1rGb;
	Tue, 31 Mar 2026 07:59:37 +0000
Received: from vm007.relaix.net ([2a00:fe0:0:5::4500])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7U0c-0000000CXct-0UK7
	for linux-mediatek@lists.infradead.org;
	Tue, 31 Mar 2026 07:59:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 578C054D7DB;
	Tue, 31 Mar 2026 09:59:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freifunk-aachen.de;
	s=dkim; t=1774943966;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
	bh=xf3baQcdCPT0xFW7ni7rVWBaUQV2OoiDultSu0Aff8k=;
	b=ah89LX72H/Ci2jMUilNQGOcs9GjmgWJuHtpIo67jflsErH9yAXwYfKHz/89K0F3QhFsdCo
	jd8Osi078DSNGkJv2IFRpIaKCV2wy3Up05RdOxxxE/E9O6ePJgdWbJgYPnmc0JpJFhqwgP
	PLBkSbE1kLoTxUw5fS8FHovSjY68N+8GPsCVDGzdB1XZqIKl7adSM8b3pw8qrNJz0s+IQE
	T9TNKGKoSTMadnOeIT9vjx7IlhzNCakL68owIS8iBH/6dnCV5qvlwNqLVXrycOWcYob6my
	quyiBLjavZzl5FqTB7R/fmzbFAn1Glm4B0eQgeyrooba6e0xd9elqWggCOyG2g==
Message-ID: <3f4103d9-4871-4ae8-93a7-d286fce37443@freifunk-aachen.de>
Date: Tue, 31 Mar 2026 09:59:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: lucid_duck@justthetip.ca
Cc: linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
 lorenzo.bianconi@redhat.com, morrownr@gmail.com, nbd@nbd.name,
 satadru@gmail.com, sean.wang@kernel.org
References: <20260327021534.448552-1-lucid_duck@justthetip.ca>
Subject: Re: [PATCH 1/3] wifi: mt76: connac: use a helper to cache txpower_cur
Content-Language: en-US
From: Felix Baumann <felix.baumann@freifunk-aachen.de>
Autocrypt: addr=felix.baumann@freifunk-aachen.de; keydata=
 xjMEaXlalxYJKwYBBAHaRw8BAQdAy2mf6IX/aorkYHujfexbrrHPZ9evkUR6MjkWqzxM1l3N
 MEZlbGl4IEJhdW1hbm4gPGZlbGl4LmJhdW1hbm5AZnJlaWZ1bmstYWFjaGVuLmRlPsKPBBMW
 CAA3FiEE0nprspF4aDRw7fLJVcWHRzGzREoFAml5WpcFCQDtTgACGwMECwkIBwUVCAkKCwUW
 AgMBAAAKCRBVxYdHMbNESpb0AP9bpO2TOFuA56gBS38TbOtiOBTqhzvxHSnxn3JIa9opEQEA
 mOLrjuD5DJdaW56g4X1l4oOSwEcH43qrcLRI6KtjZw/OOARpeVqXEgorBgEEAZdVAQUBAQdA
 bnuRly36kpIJPY7TufU6iEseKtyERyKniKQY15AYY0kDAQgHwn4EGBYIACYWIQTSemuykXho
 NHDt8slVxYdHMbNESgUCaXlalwUJAO1OAAIbDAAKCRBVxYdHMbNESv3UAP9/rR+UtikbtAul
 X83a5sNYdTxJoMISGpEIGFBtWApGEAEAkMUNQHnFv+L7IkZEjBcOS6eUzOMmu6/Bg+BkZjCy HAU=
In-Reply-To: <20260327021534.448552-1-lucid_duck@justthetip.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_005934_644425_615D927B 
X-CRM114-Status: UNSURE (   2.66  )
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

Hi Lucid Duck,

thanks a lot for your contribution. Very much appreciated :)
The kernel has a strict policy for contributions: real names only.
https://www.kernel.org/doc/html/v4.11/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

May I kindly ask whether it would be okay for Sean to use your real name?
https://github.com/Lucid-Duck

-- 
Regards
Felix Baumann


