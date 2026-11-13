Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6316A606A330
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 14:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pqb5TrWA;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zlFKvP77
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=G1uiQHxbXrieX6SuCwOLJ9VY1wFor0LUhTYsmcPsDjg=; b=pqb5TrWALJzxed
	f7/Sotg+iBBG8QsN/elFA/xtVfCzSmmRXz6fCBKqSeFTqC3XUDSEp7XprwAX7AaRwrsXitq82RkEi
	kc/rQKWycQfIuf9cctFYaHKzuMjKy5q0gNk7CrC+ONUwRunCl6RdfbtmlS8ZhH0Eg1QelHba/l/0/
	JEqNbz7BfqAcxbvap1fE+GAfItmnnUf/RJJTxDur2xMQs8TM42ClUYWjRQ75GtSw7Y1OFTe/9pvd7
	QeKf/F50E7wCg9/puNT1L3h1c5nhtsWSQEz8euUVYGeTE3m8fJAUehRX4r5tQcrnpdlsyNalrX7wJ
	vY22+q/aDKKA9SORwUtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsGf-0000000D9af-0QqL;
	Fri, 13 Nov 2026 14:28:41 +0000
Received: from mail-qv2-x0b.google.com ([2607:f8b0:4864:33::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsGb-0000000D9ZO-3j7v
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 14:28:39 +0000
Received: by mail-qv2-x0b.google.com with SMTP id 6a1803df08f44-91edd45f233so7893206d6.1
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Nov 2026 06:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794580116; x=1795184916; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1uiQHxbXrieX6SuCwOLJ9VY1wFor0LUhTYsmcPsDjg=;
        b=zlFKvP77FEZFNloP+J8XY+LFtYXAtYwRfIsaNPz1DDEZhdZhCnrZxPC+aezTE1uYOs
         pM89BcJ4Mzvb9ILPvyUBgd2HQIEXX6N3Rtgn7geqnK5MAf9hUyva85g6x0g+82L4/dqJ
         7stvKVgYJUwtk98ZABN3EohcA2wwKZxJfTWSwNAWcq4v7poU+aDAdVtTIEnYLczN9rmO
         VNzuFLSI+w3VXk8Xw08JKrZrkFN0l6EH2jvAm3b7cUJoQ5oPWxV1cUzApqvQc4qtvPI1
         IBmf+08HA8oIQWwlDfweN8w89UvpbS4Bqf35DIoA9s4nbI0UprKoyi6J5qc4dXzOc1ls
         YLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580116; x=1795184916;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1uiQHxbXrieX6SuCwOLJ9VY1wFor0LUhTYsmcPsDjg=;
        b=DVLCx2VDGpkgf86TElK11axy6JqUUsdbxnavzg7nIaIaa6B+/SobjElhebCOs+AcUx
         z5R/xi/RGukOWWmT0RhYLAmA0WYIrAERGSbuMbZfB+R694liZAq1MT9q6N5V+EKfw2c9
         6XXa7cFExlWBAHfkLY1H1ZM6OePNuvvIab0fu4iy+XKVo/0JnPK0hOZhtwfIgpx1mWiy
         3u7/VfSyKpt38DIDyjlY7z8H9LPrWYtV82h7lXkB9eibT+HGTbtMJ1PO015tTyYYfEvD
         a4s8WYGycsE59JdMni6UYAFx6l7ysUolYqjsa/SWHWCu73tbX1yms3LNol0ZTuBnNhgN
         uhvw==
X-Forwarded-Encrypted: i=1; AL+hErErdHveHi18Sptr0j9PdfXVDEN7EteQjgN2IySeee9uAS/6WRbjXpFKmkkFNZAK1/uUZZ7TQDxhyE0Fa1q/6g==@lists.infradead.org
X-Gm-Message-State: APuU4Z9wRjYn5b1XkC4eiFgZ66D+PLo2KM3zhAeppGgMsJFEEP+ZrMzc
	pdKYLfqdEtXUUX7BRBHt3iybdIV0M+asg72VtUHccv2rpfh4XX0gPiMq
X-Gm-Gg: AYBFou3EJfc8YoCYjZxyvnPFYvCmxnxRKtfD6fmhZq2iH4g9Iyxgt4Y5qrycx4Dl9u0
	yInQOT535+Gtq1nuBWvaaal2UwjufpETKGNCQpFweXKjL0ob3uF9cXFAS+6WEC16YHOAE2tjPs5
	tdx0xyliKJSBpAukAAkdaqYKKVaUWEj+XEuK8wooe2Czi0WfwjY1cJoMBhdXfhZJr5tSlE6WSr4
	mH9sXOqCdCD7WHp3GN06uQFKaw4BjOraonxaP4lhc9670SajtOp5U2sWATUcLXpNYYAGSUI288i
	9TNzTDC/1AkEoVUVgaB1/Bnj8vYG8iJ0rqmRyzNxDEHOHzqoTJ4CPPuFlnn4JPq33qqrew2Sfqt
	T59+b4L2oLvw0bMjGEVopUy9biAlZwtD4Ra362b7IrIX80m26x+0tTqJ0fp6Yn55vaxMnptPuq5
	UE7/t4UWjZSj4d7udGkO4t+lbv3n2bo5Rsc6gJiQQfdDqZLiL29aVxzhC82sIHWdbBLfXhHmYcg
	JXHlCd0fdudOP2/BXhYWdRv2a3t1GUiO0NXwvVXnAuEiU+jbS8o7w0/ABsf5EK2Dz/GQAyb31XZ
	il/Ab2tAGtXP9qE8ivNbeef8nu7tq5x89SMlXCE3L0QfVQH2YZs+TXWcfsWKx6beo+s=
X-Received: by 2002:a05:620a:6c81:b0:93e:9792:fd47 with SMTP id af79cd13be357-9494ba5e524mr406776785a.4.1794580116359;
        Fri, 13 Nov 2026 06:28:36 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c836079sm194977485a.18.2026.11.13.06.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 06:28:35 -0800 (PST)
Message-ID: <b7d42a96-6827-4251-ace4-1b3a86bb7593@gmail.com>
Date: Fri, 13 Nov 2026 08:28:34 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3] media: mediatek: mdp: Keep component suppliers
 powered while streaming
To: YoungJoon Lee <getfeus@gmail.com>
Cc: devnull+getfeus.gmail.com@kernel.org, Xiandong.Wang@mediatek.com,
 andrew-ct.chen@mediatek.com, houlong.wei@mediatek.com,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 mchehab@kernel.org, minghsiu.tsai@mediatek.com
References: <20261111-rfc-v2-generated-v3-1-e49697d20806@gmail.com>
 <9accec98-c16e-4815-a479-b84fc39e4580@gmail.com>
 <CA+m4KrDA9rx9YB4pPMdZ+Qg-GbGyYb2Mnfbb7NdgrwGWduEuYw@mail.gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <CA+m4KrDA9rx9YB4pPMdZ+Qg-GbGyYb2Mnfbb7NdgrwGWduEuYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_062837_935770_0156456F 
X-CRM114-Status: GOOD (  14.19  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Youngjoon,

On 11/13/26 5:40 AM, YoungJoon Lee wrote:
> Out of curiosity, are you working on mainline Linux support for the
> Fire HD 10? Your mention of the board DTS being under review caught my
> eye. I’d be interested to hear how you’re booting and running Linux on
> it.

I am [1]!

The original boot sequence is something like BROM -> Preloader -> TF-A 
-> LK -> Kernel (simplified)

Back in the day there was an old boot exploit you could use to unlock 
the bootloader and allow booting other kernels [2]. This let me replace 
the vendor Fire OS kernel with an upstream Linux kernel (with 
modifications of course).

Almost everything from that is upstreamable from that, EXCEPT the lack 
of proper PSCI 1.0. Amazon's TF-A is PSCI 0.2, and a broken version of 
it, so it's more like PSCI 0.1 in practice. The upstream kernel expects 
PSCI 1.0 or a spin table, and with a spin table my understanding is 
you're giving up proper deep sleep.

There's a newer unlock [3] that works at the preloader-level, allowing 
us to replace TF-A with upstream TF-A (supporting PSCI 1.1!). I'm also 
replacing LK with U-Boot, because LK has some arbitrary restrictions on 
kernel size that I had to figure out by trial-and-error annoyingly.

I'm not the only one working on Fire devices for upstream. I'm aware of 
Ben Grisdale working on the SoC and DT for an Echo device [4]. More will 
likely come in the future. I personally am working on the Amazon Fire TV 
Stick (3rd Generation) and I'll be cleaning up more patches for it as I 
wrap up the tablet support.

[1] 
https://lore.kernel.org/all/20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com/
[2] 
https://xdaforums.com/t/unlock-root-twrp-unbrick-fire-hd-10-2017-suez.3913639/
[3] https://github.com/R0rt1z2/amonet-koboreru
[4] 
https://lore.kernel.org/all/20261105-arm64-initial-support-for-mediatek-mt8163-soc-v2-0-e68d7d428f99@protonmail.ch/

Best Regards,
Ryan Brue

