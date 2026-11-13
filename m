Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ECF606A321
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 06:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mNPEfbHJ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wYm1JAIf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sUqaXX36ZDw1piKG6jmL/DoL8tq5IBd3zye0Czs+X+c=; b=mNPEfbHJkhUV4K
	mWHVnrNaQomoc13frZaATVT56uHdiBW6IrhLN7oa6xUfk/NsIiGaZn2RFojxcWEPwHC01P1re0LBa
	tvHf5P5qF11a1X1/aC4xX5s+cgLUEZzNsy1OC9kOCF+KVjRJdEAk+GzxdN/MdHdov4mEUrN/zzDMU
	XSpyTNjq9PJ/QogJH9Pdrgjnowmk392V67+LpY/e8l5XrszHoMvMx36ma+J2UZeOWa4rdntSYnYH6
	KQ/xivhbX5/biFLdanvYbTei8kWIJWtru7U/0/J2qC6nUMRuK2GZlB4GcWqZxs5Dk6w1zb+7ejrV3
	gJwq4qv94ThXe8x196gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRl35-0000000Bo6l-2QnF;
	Fri, 13 Nov 2026 06:46:11 +0000
Received: from mail-oo2-x05.google.com ([2607:f8b0:4864:31::5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRl33-0000000Bo6I-2Nil
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 06:46:10 +0000
Received: by mail-oo2-x05.google.com with SMTP id 006d021491bc7-703478630a2so272600eaf.1
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Nov 2026 22:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794552368; x=1795157168; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sUqaXX36ZDw1piKG6jmL/DoL8tq5IBd3zye0Czs+X+c=;
        b=wYm1JAIfsEpy/IMLv7XNkB3F6gudRyB0iS6UQmgkNM9H576bz5gjxU6utv3XjT51VS
         KghHKoXX9R2MFPA8w7aloR4uYS1QFsXgVZr9Bc0JVfVSvPXDk59l+UEyQxk9eAAlXe8o
         gxMPdT8UwWJ3s0oBwuHbOnjXOu61DXZAypXZtdRq+oCb6NHcPw/6hv/VxmcrFoN0iFgz
         9cHYqxViZysitAfoNXlEY1HnNn739ro1PYKF+ytcbTlZkRJvmJjRHS0D3GOHrGcQjQ1P
         K2sDpV12v9aOu6KqZKVg+t6+/AUvAaee4Z0890OJDUjZQnEycTMr+E+rOWfcCQ5DC2xJ
         E64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794552368; x=1795157168;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUqaXX36ZDw1piKG6jmL/DoL8tq5IBd3zye0Czs+X+c=;
        b=hno6iiz/5zndnAMEM/lPcWNzF6i08pb1yv4QDqy8iYW9PSACBxq3GH0GGcUh14HvjN
         At6sh07PVyZJSA7afkCWYQndGq+rYrwHZQXC0SCw9OD2RZcNLm4n12MrfAk1Ta5MWPyW
         AQbZboDts3bfTVBp27yyTuSAr/in3CB7Y+fjoNDLtv34QBwCQnRd/F0a03oJCiMz2Ww1
         GJ+7j0H6XAeqEnjbXG65RCqHvBl+tQFEJBXxDtKbJ/W9cd8LsOztV6ZX8C86w76+opUk
         GQZIARVK6dg9I4Ilz7QH+qby0/L0CslXb9Am46tRe1Vhqz4ymJKwMH072SfM2Yr5wbMy
         vtfA==
X-Forwarded-Encrypted: i=1; AL+hErFS6NvsQbB1qgjtWbRA8kAskNYh8FB1UD6QRZkAZlP0/KjdYZFip5ITuBQfIwhWu0HfRl6zm9CvyHD9jrnhyQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8A4eAVZmcjzBjnkwNUA+8LteInX+rRrJpLJTCi22Qd2dk49uFK
	OcKVnX7iChaxcDFzIBQxQ3JmM2ayTM6UMhNgvt28jQ3muamMjQYonZqO
X-Gm-Gg: AYBFou19pWdDrVsK8KJ+/vz81EKPUobOSvs46wKXSDjHTNOSL2feBvxynWwAHP4VwII
	/3Tubc9L6zMyo/yNbpXuryOVE4oX+Hww+6Y5FdpRM/1I6gQeP2LgqKrR9mdWXDGJ+F8rWfO8ZCz
	Mcs9czrp17ON0C5W3hHqqys4NywEMPv1EwnBgs6UvpI2YIEabEpuvpluMjbIohTFh4Dw/NiK74n
	YusB9U0EsMB9/OLreu5tje/dA1wBgYpzN9FSMfJc9hw+6QkuSvEY/54bVXCvhPGcyufopr0CG4s
	CAGluaFTGW+kmhc8dClQc9xkJHA3OQE3WSrJgM5GyXvn/t7XLuZpgJ8yYNTfSuUbV9W9/Q4Ati1
	fnTVULikoCCJ8GAfyu8oGywpEraMibsj/BM8OQGkYoEJ4hI+OKnkUaJrF7eA2h4zdthmW+l0Oys
	q0YDVkfRCDLkyRjemZKEZoG9o1xG1DpM5r1aPDu4rbSttPQ46nPOREHoYkLqv27q6U191Kit59q
	cncsqh/tf6GwGmN7YWQ98qwJxU5ZDdu2BvETJ3gNW9qaJKaDjjnhHjybZE/qh80ynxH3+n2ZicG
	4W0qH/M5UuduVv2BrUQqA5K8RxBahxbC3lmwP2+gwHiaBg==
X-Received: by 2002:a05:6820:55c4:10b0:715:10ef:578b with SMTP id 006d021491bc7-71ab5051781mr614940eaf.62.1794552368056;
        Thu, 12 Nov 2026 22:46:08 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe228982bsm906195fac.10.2026.11.12.22.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 22:46:06 -0800 (PST)
Message-ID: <9accec98-c16e-4815-a479-b84fc39e4580@gmail.com>
Date: Fri, 13 Nov 2026 00:46:04 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: devnull+getfeus.gmail.com@kernel.org
Cc: Xiandong.Wang@mediatek.com, andrew-ct.chen@mediatek.com,
 getfeus@gmail.com, houlong.wei@mediatek.com, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, mchehab@kernel.org,
 minghsiu.tsai@mediatek.com
References: <20261111-rfc-v2-generated-v3-1-e49697d20806@gmail.com>
Subject: Re: [PATCH RFC v3] media: mediatek: mdp: Keep component suppliers
 powered while streaming
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261111-rfc-v2-generated-v3-1-e49697d20806@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_224609_618423_3287362A 
X-CRM114-Status: UNSURE (   4.12  )
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
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Youngjoon,

I hit the same thing on another MT8173 device, an Amazon Fire HD 10 
(2017) tablet (board DTS still under review), on v7.4-rc2 with VPU 
firmware 1.2.0, every job took about 1.9 s, the firmware reported 
success and the CAPTURE planes stayed zero, for MT21 input and for plain 
NV12 -> YV12. LARB4 was off during the job.

With v3 applied (one context fixup for devm_kzalloc_obj() on rc2), all 
seven sibling blocks bind, and MT21 -> NV12M at 1280x736 from the 
decoder matches a software decode byte for byte for H.264 Baseline, Main 
and High, VP8 and VP9 (30 frames each). LARB4 suspends again after 
streaming, there were no IOMMU faults, and a system suspend/resume with 
the driver loaded left conversion byte-exact afterwards.

Tested-by: Ryan Brue <ryanbrue.dev@gmail.com>

Best Regards,
Ryan Brue

