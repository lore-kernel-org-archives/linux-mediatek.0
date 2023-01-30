Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F0FC54EAA
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 11:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qY2eQcF/uAcvNTYQk/je1BxohMNaBmCnW6600Wd4rz4=; b=WH5e1JaQxikIFSWUwzDzTBYu2t
	cWoY3q6Hi77Z2iR/RZrKTQolk5zEVwotOiyhL7J5DQFWPQpIjCIlrYrfzdIxT6MJqDILP8D04WIrc
	cKG/utZzVn8DZIJ4c6nWW46ZnCkXEcnRhK1sL/2u6+1jiE1cEKzoalsNq8IH5mhgFMz/WGhB5XlTj
	M8ibXRx8exNt46A7Bpqv33olyo4eVMnGS47XQ32FKC6ddshpVwzuKKixP0z/ABfgeuHlZG9y+bNXx
	IswE9eeX49+2Dk/2IqipzGLaQyVeNNmzzzBTzmA366eq1u74ftJNHPb/7DLvEuuV+GDLf+FOkCGXA
	NJkmni4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMSWo-003Jrk-U7; Mon, 30 Jan 2023 11:40:50 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMSWF-003Jpp-T8
	for linux-mediatek@lists.infradead.org; Mon, 30 Jan 2023 11:40:17 +0000
Received: by mail-wm1-x334.google.com with SMTP id iv8-20020a05600c548800b003db04a0a46bso8635738wmb.0
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Jan 2023 03:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qY2eQcF/uAcvNTYQk/je1BxohMNaBmCnW6600Wd4rz4=;
        b=YCGzP6+etMTFAZGEGJ0wr5wJKJ6GursVCMiCl4iTjjUvks4Wc+vwkge9YRs9sX4uNh
         +teYysoROEQBHhVUwUk64roJYGp0TS/8rnB+Kg2hKOA2uPrs1HYf2VZeXRdXvN/kV7U6
         R9aVBejJ3TaFgCk9ZiNScxApM32QsZtILy4rclBgUwHieku/LsUr5iUqzii9p7mXJVuX
         RnDqeTzcI2JXcjsxiJlhnkp1+q/kwn3DyW1m9FWEjI3UHbX6NbjCVk2gKAtipYyA/UQ8
         6KjjGaDlLmLxulYmq5dhcFffffXgS3vaO5RUbORPLd1QbJhrCdl03X76SeWIV6clklGd
         E3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qY2eQcF/uAcvNTYQk/je1BxohMNaBmCnW6600Wd4rz4=;
        b=694GxtxiNVZH/G20DfyRjnAqi0SyW0FIpaMWkaRS7wlOpZjvW6Oh72lWWTWCk1vVxn
         UAsLww9+fRRveyEMeWMa2P7TqivX9D2y/PKaLeTGq3qYX/S1FdkMwXD2jFKPgCKzY0Ma
         KOGEQ8/VNzahX2qDIhQ/f2v0o9w+oOWVw6XCgaCPh1U86n4vqtHdvZlNARYQPSbgGcCa
         wq9pusLoM75FM1F5kB+oH4lfCpnfnkd0KSu+oS4t8gHLA6lZ7RPl9lcj1F/onTFo3YHF
         vNAj5EnJ9/dElR9xobxhS7cdHZbmHSIF5ehUoSndnuTyNv9ZPxnrkWIIlANUagp0I1of
         Zlsw==
X-Gm-Message-State: AO0yUKXc6YRCQDwRCglGxogMU/raOjp3WymmN3BRGnLL0AXrHLESnwZZ
	ne/v4Scwuxuam0BA436x59voGfLZDGI=
X-Google-Smtp-Source: AK7set/plTj3nToxeSu5iL+yT3u0ztKJ3ozwPZCPZJR8eXHt2/EVQcaKN/ClDf3w8bwneh0ceKR5ug==
X-Received: by 2002:a05:600c:1c83:b0:3dd:1a8b:7374 with SMTP id k3-20020a05600c1c8300b003dd1a8b7374mr63656wms.5.1675078811045;
        Mon, 30 Jan 2023 03:40:11 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 19-20020a05600c26d300b003dc50c38921sm5614243wmv.35.2023.01.30.03.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 03:40:10 -0800 (PST)
Date: Mon, 30 Jan 2023 14:40:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: Trevor Wu =?utf-8?B?KOWQs+aWh+iJryk=?= <Trevor.Wu@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [bug report] ASoC: mediatek: mt8188: support etdm in platform
 driver
Message-ID: <Y9esl7VQ6qW9wnIC@kadam>
References: <Y9EdBg641tJDDrt/@kili>
 <8260fa7da639c118ec6757e6d3e25320924dcbca.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8260fa7da639c118ec6757e6d3e25320924dcbca.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_034015_964069_1BBC9E67 
X-CRM114-Status: GOOD (  18.39  )
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

On Mon, Jan 30, 2023 at 09:25:52AM +0000, Trevor Wu (吳文良) wrote:
> Hi Dan,
> 
> Thank you for catching that.
> I didn't notice that snprintf() never returns a negative value in
> kernel code.
> It is possible that I misunderstood the coverity error message, but I
> can't find the original coverity scan result.
> 
> If I just remove the dead code, coverity will report some errors in the
> future.
> As a result, I prefer to keep the line and add another check "ret >=
> sizeof(prop)", so that we can avoid the problem reported by coverity
> and Smatch.

Generally, when static checkers print nonsense warnings you should just
ignore them instead of adding dead code so I would encourage to delete
the dead code even though Coverity complains.  Fix what is broken
instead of just working around it.

regards,
dan carpenter


