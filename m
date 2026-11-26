Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96FC606A321
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 16:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3ZZPYtFD;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=YagE8v8m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MnGCyZCgy0uZ1q7rQsrc5ccZDwKH7+29K/9rrpsqcUw=; b=3ZZPYtFDMl9SXZ
	FcPGO7vpJ2HtjsbJ041Z4BOP1BZGZnBxDm4acDkjG4h3UedXpEbPkfmZmODCfo3jHqQWpmQat9Xt1
	l8Xc7svkBmCoSOVLg/6dYhONTcuvmVS4Ovn+9ll7rM0x9EktokIzaqyPK3gPaMzK8Q9rrehL6QpHy
	gq8UU1pY8QCEsTUO0qb9QMgBBJbDfqylpcnVZ6KUZR3pGmY6140waXs9nB2dRefb3N+IMpW9x16Aa
	2ULdldxSP1K+ZZce2M+a5uECuhq1Z0bDgGn/gLZkrPKUlct1qu6+iQbIJihFXI8t760S3utPHUM9x
	UWx8GFobjB3BBkBylOHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbwH-0000000DqUA-1MmF;
	Thu, 26 Nov 2026 16:03:13 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbwB-0000000DqQW-027I
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 16:03:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MnGCyZCgy0uZ1q7rQsrc5ccZDwKH7+29K/9rrpsqcUw=; b=YagE8v8mBAX/1uUkdZqBS/5UPD
	zia9phex4DzoCOlsJRUUpz4axY65O6Fp1yJ5B27YtIksFqH2Est1W0nASTF7x2fOkROQQYbRT0ZTg
	GfwRVxptBzXTEQc41At7fmMd8bypaDAIVw6s6KLn5Yr5jfGQshEbnVbldtb87Q3XaOmA=;
Received: from p200300cadf035800789f81558e58e91a.dip0.t-ipconnect.de ([2003:ca:df03:5800:789f:8155:8e58:e91a] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWbw6-008giG-0k;
	Thu, 26 Nov 2026 17:03:02 +0100
Message-ID: <6c37a7e4-a2f1-46e4-88f1-0439be6eb928@nbd.name>
Date: Thu, 26 Nov 2026 17:03:01 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] wifi: mt76: optimize mt7922/mt7928 T-put per Tx/Rx
 stats
To: Anthony Liu <anthony.liu@mediatek.com>
Cc: Emery.Hsin@mediatek.com, Jb.Tsai@mediatek.com, Leon.Yen@mediatek.com,
 Litien.Chang@mediatek.com, Quan.Zhou@mediatek.com, Ryder.Lee@mediatek.com,
 Sean.Wang@mediatek.com, kun.wu@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
 lorenzo@kernel.org
References: <a359fadf034e2077f7c92e1da6c9ce9f2a40f718.camel@mediatek.com>
 <20261126095455.3280998-1-anthony.liu@mediatek.com>
Content-Language: en-US
From: Felix Fietkau <nbd@nbd.name>
Autocrypt: addr=nbd@nbd.name; keydata=
 xsDiBEah5CcRBADIY7pu4LIv3jBlyQ/2u87iIZGe6f0f8pyB4UjzfJNXhJb8JylYYRzIOSxh
 ExKsdLCnJqsG1PY1mqTtoG8sONpwsHr2oJ4itjcGHfn5NJSUGTbtbbxLro13tHkGFCoCr4Z5
 Pv+XRgiANSpYlIigiMbOkide6wbggQK32tC20QxUIwCg4k6dtV/4kwEeiOUfErq00TVqIiEE
 AKcUi4taOuh/PQWx/Ujjl/P1LfJXqLKRPa8PwD4j2yjoc9l+7LptSxJThL9KSu6gtXQjcoR2
 vCK0OeYJhgO4kYMI78h1TSaxmtImEAnjFPYJYVsxrhay92jisYc7z5R/76AaELfF6RCjjGeP
 wdalulG+erWju710Bif7E1yjYVWeA/9Wd1lsOmx6uwwYgNqoFtcAunDaMKi9xVQW18FsUusM
 TdRvTZLBpoUAy+MajAL+R73TwLq3LnKpIcCwftyQXK5pEDKq57OhxJVv1Q8XkA9Dn1SBOjNB
 l25vJDFAT9ntp9THeDD2fv15yk4EKpWhu4H00/YX8KkhFsrtUs69+vZQwc0cRmVsaXggRmll
 dGthdSA8bmJkQG5iZC5uYW1lPsJgBBMRAgAgBQJGoeQnAhsjBgsJCAcDAgQVAggDBBYCAwEC
 HgECF4AACgkQ130UHQKnbvXsvgCgjsAIIOsY7xZ8VcSm7NABpi91yTMAniMMmH7FRenEAYMa
 VrwYTIThkTlQzsFNBEah5FQQCACMIep/hTzgPZ9HbCTKm9xN4bZX0JjrqjFem1Nxf3MBM5vN
 CYGBn8F4sGIzPmLhl4xFeq3k5irVg/YvxSDbQN6NJv8o+tP6zsMeWX2JjtV0P4aDIN1pK2/w
 VxcicArw0VYdv2ZCarccFBgH2a6GjswqlCqVM3gNIMI8ikzenKcso8YErGGiKYeMEZLwHaxE
 Y7mTPuOTrWL8uWWRL5mVjhZEVvDez6em/OYvzBwbkhImrryF29e3Po2cfY2n7EKjjr3/141K
 DHBBdgXlPNfDwROnA5ugjjEBjwkwBQqPpDA7AYPvpHh5vLbZnVGu5CwG7NAsrb2isRmjYoqk
 wu++3117AAMFB/9S0Sj7qFFQcD4laADVsabTpNNpaV4wAgVTRHKV/kC9luItzwDnUcsZUPdQ
 f3MueRJ3jIHU0UmRBG3uQftqbZJj3ikhnfvyLmkCNe+/hXhPu9sGvXyi2D4vszICvc1KL4RD
 aLSrOsROx22eZ26KqcW4ny7+va2FnvjsZgI8h4sDmaLzKczVRIiLITiMpLFEU/VoSv0m1F4B
 FtRgoiyjFzigWG0MsTdAN6FJzGh4mWWGIlE7o5JraNhnTd+yTUIPtw3ym6l8P+gbvfoZida0
 TspgwBWLnXQvP5EDvlZnNaKa/3oBes6z0QdaSOwZCRA3QSLHBwtgUsrT6RxRSweLrcabwkkE
 GBECAAkFAkah5FQCGwwACgkQ130UHQKnbvW2GgCeMncXpbbWNT2AtoAYICrKyX5R3iMAoMhw
 cL98efvrjdstUfTCP2pfetyN
In-Reply-To: <20261126095455.3280998-1-anthony.liu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_080307_125283_AF32D1E4 
X-CRM114-Status: UNSURE (   5.70  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Anthony,

On 26.11.26 10:54, Anthony Liu wrote:
> This series adds:
> 1. Read the HW charactistics flag from ACPI BIOS.
> 2. If the HW needs, collect and update Tx/Rx statistics to FW.
> 3. FW can then decide how to adjust PCIe link to improve T-put.
Please don't add tags like Reviewed-by for me when I haven't written 
that myself.

Regarding the series - why is dev->perf.enabled disabled by default and 
only enabled via debugfs?

Thanks,

- Felix

