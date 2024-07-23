Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98AEC3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jul 2024 16:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xyhX6ujkGvFvlJp9ozB9/Zm0egWN1pUPm8TW7uNgdLU=; b=aa0qw3lBa5Pb8CQ76kPJZnEuTM
	9lINuu9mB8djarkgET5rtO/G3bvVZhXsa2pfaYYTnzd4C2aYN6dJKk1GwB3UZpfUDjKqtrYvjD48Q
	6g3POSS+aSFPApsArwU1D9YE77zXwtzhLo/HTZDWQcYDiCu49OCJ9EH85SH2eFuCBW1SYykggeayK
	Y5ihTpkVHNvGd4xKM/CCdvgg4evTyt+xZIfD8DblcHk4DgS9yUARAXG4h+HhX7FGYdssbT3/5rsS4
	vWjysHwIkghxWIxJl8XfLyiCoLwhPVIZyIynfnL8MVSUH+FYpvIlU8hic5ihJIGicJbin2Exx6cT6
	e/avW3jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWHvm-0000000Cy83-3JNk;
	Tue, 23 Jul 2024 16:00:02 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWHvk-0000000Cy7H-0VOF
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Jul 2024 16:00:01 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-703775e4d5dso2712153a34.0
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Jul 2024 08:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721750398; x=1722355198; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xyhX6ujkGvFvlJp9ozB9/Zm0egWN1pUPm8TW7uNgdLU=;
        b=Xa0EUWZCM0kAF/PbHnVme5wjCrRQU25cyU2g9S9fDfj62KSzCR6kAAYnpEzr17rIfJ
         i4bSvmOcbxAvZsjTaOwb+tsNB7dNo1NFdR3IKS2ZpbvYreoVBQwBmmJ7SHYEuCao3yP0
         2PuQ5I+gUkZgbz4rCZrr+RytcLceXbwwQm7cqW8V9bHdlMB1AoOTwtVvu5tQ1ksr4DjX
         ROHP9f3jkLpdOX4oj6j/sXj0FaA5lAa8RTR0OeIncUvY3mrp0ToFZN4HG7E5QIZoosUD
         70WqVrVW9mPBjOvgfeoMozDg1hqZ23GZlsdrXByEfrtESttFb6pRWmLoZiwMFe5sIAUA
         Q35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721750398; x=1722355198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xyhX6ujkGvFvlJp9ozB9/Zm0egWN1pUPm8TW7uNgdLU=;
        b=wmqrOfysmt8BS0e+9Po7jBSlJsTGJ0qlqQgmoTZeszequBkTzReGSZY7TKPvWy1uWl
         SujUM8giQ6l84ETTLAhT8m61lrd7hvqRZThmjIgHr4EswVtZS0pH0YacbNffiZSEpju8
         5AKWeiJpRQVayyUjEYzG+t5dXNpHLpV2FWF2TBTkTsYJ4yd1aQxlfJmWZcomHhn8wAiM
         uippG0WHZbAMV6uJBTLz2hhMOscb3TLD5BqDSfHtHdm6Ql80GXeBpqoQt21qfcy7VNdW
         lCdw29AmR4ZuttC19Rk7DlMXaAaXlsYgteDkl7f8i5HskIUU9PsXe57ZJ10wyIAMYeA4
         G6XQ==
X-Gm-Message-State: AOJu0YzluQHULycAuEnqLAt818H1ykZog4sdpudASQVWz27+cs6MG3IC
	z5yXYvnFHo6dwcykcXcuip0NSEvYJPmIi+0de5ESM6hP90fjwZIcfAFE5LxEnQM=
X-Google-Smtp-Source: AGHT+IHLOQ82xB/ipmc8k+uf3agTXPLg/DveoBD0PsYZamVh3HKE+rd6vrtU6o0R9+QmN4y8dgzVqQ==
X-Received: by 2002:a05:6830:dc4:b0:708:bea8:ae3f with SMTP id 46e09a7af769-709009b1513mr13374208a34.25.1721750398253;
        Tue, 23 Jul 2024 08:59:58 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:eca3:bb93:d28d:1005])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-708f60eb421sm2102420a34.44.2024.07.23.08.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 08:59:57 -0700 (PDT)
Date: Tue, 23 Jul 2024 10:59:56 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Breno Leitao <leitao@debian.org>
Cc: linux-mediatek@lists.infradead.org
Subject: Re: [bug report] net: mediatek: mtk_eth_sock: allocate dummy
 net_device dynamically
Message-ID: <959d0ad3-f11e-40fa-9b34-28797dde845e@suswa.mountain>
References: <4160f4e0-cbef-4a22-8b5d-42c4d399e1f7@stanley.mountain>
 <Zp4mKL/X1HSrjufq@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zp4mKL/X1HSrjufq@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_090000_187229_62CF82ED 
X-CRM114-Status: GOOD (  12.15  )
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

On Mon, Jul 22, 2024 at 02:28:08AM -0700, Breno Leitao wrote:
> Hello Dan,
> 
> On Fri, Jul 19, 2024 at 06:52:50PM -0500, Dan Carpenter wrote:
> > But it's free here.  (NULL dereference).  I really would suggest moving the
> > free_netdev() to the release function.  The probe and release function are
> > easier to read if they're in mirrored order where every allocation has a
> > matching free.
> 
> Thanks for reporting it. It seems a real problem at the error path,
> indeed.
> 
> I've hacked a patch with your suggestion. how does it look like?
> 

Looks great, thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


