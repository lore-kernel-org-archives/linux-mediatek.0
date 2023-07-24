Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795EBC001DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jul 2023 16:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4nkZEjGqKMSg9XiMs6wuEiyuXPT5uFzTR3xSKZPtXrE=; b=AbTLSAqO0dSPRLzH4ENXBnveeU
	A7+EdC4JgIr0H/qm/VQBkHJyswSHTPEanlIXdngPvgirscu/vBi0VJbtA2q8imKru7LOJs5Do+Xs0
	qMWhW2dj75kAvcUIbHJIJfZEFTTFTa0PRgW0uIvAU0ZjwzAMPwAVZv4U+HPDWqWWsJrJr6ZF0XsKg
	cl3RicLEE1le8QvEXk5ZhxCMGzC4aUXEfD01XBnd79rrK+Spdg2koiTyBHO/iwOlckzrK7SIHLdPP
	VBd1ebCwHHdM0p3y+x7FtCvThCRK8GTA84vGQqttfcPvL+dPEAIFe9RnDIldLA57BeUauDQEmKqlr
	F9Fqx0nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNyuU-004xGn-3B;
	Mon, 24 Jul 2023 16:59:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNyuS-004xFw-1B
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Jul 2023 16:59:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690217986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4nkZEjGqKMSg9XiMs6wuEiyuXPT5uFzTR3xSKZPtXrE=;
	b=BUk70JH9iu9c/6pRiwq2AiLpLIZhN28+K8ZxBY2ksmYzl+242Z40prgo+HERqigHinALaz
	TwnlDyg5Dc3crJ1louBFlO070QUquIUoFGsja9QacAZQaW6gbgC3d9IIfaYCQ2ji02SUOX
	bc1zujiHnN8Yz8/lqF1BZHkenH+Ruv0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-MG12xJBdOSqefYqVLCNerw-1; Mon, 24 Jul 2023 12:59:45 -0400
X-MC-Unique: MG12xJBdOSqefYqVLCNerw-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-63cd05c0415so61271816d6.1
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Jul 2023 09:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690217984; x=1690822784;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4nkZEjGqKMSg9XiMs6wuEiyuXPT5uFzTR3xSKZPtXrE=;
        b=axMCu1KcGYnAPgUC+flOo7slqAtn44RjBMYlQY50PuO3G/sRIakxfhQvHvUHKZPata
         /JBeT2yA96ULRu2ndQNCE11pDFXKXwn/0Zl6ba3gt3ZZg0vWLRtJBSpp0/O6p7g1N8GM
         wQZbAxOxFiJ3hNOjsUteQM5tv0Z2wSbYk32ddSGX00SL79MAl785i1jfQ66Hid4MAJTF
         SCoA6tWUN9C5EVkRaNMC0wJGGzl9c7n76mf5S9B4yr53JORspbk/VvwwquGfzyvkhIuf
         PXbe6wUv0f0voidNwGcuVEl7U3DyEYUkrDnBKAqAXN4XkSEd1VMVc02vA4Us6c5/pUwp
         NKDg==
X-Gm-Message-State: ABy/qLZU/foiW/QWRNVUgBwjVa57e9Brot1AnXQ2mRJPEzNdVD1/mey6
	Rq2dKq3exxaq371drKMn1AjGXFWdX9h+527LblxQF+aD+lb0z3x98VgHLr/dB/m5eOZXGJ+WdL3
	96ypo0oCmrOg0TnuClCXBiGYscoqBN295hy4n6yBw
X-Received: by 2002:a05:6214:4a4d:b0:63c:8afd:7273 with SMTP id ph13-20020a0562144a4d00b0063c8afd7273mr349407qvb.12.1690217984343;
        Mon, 24 Jul 2023 09:59:44 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFO7x4sJQe6yNcwbJzHDwKetm24F7RG9qQSBeAxMG+DYnqfAzn8WMDsH6icpFD+s4FFI4gTGA==
X-Received: by 2002:a05:6214:4a4d:b0:63c:8afd:7273 with SMTP id ph13-20020a0562144a4d00b0063c8afd7273mr349393qvb.12.1690217984140;
        Mon, 24 Jul 2023 09:59:44 -0700 (PDT)
Received: from brian-x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id v14-20020a0cdd8e000000b0062ffcda34c6sm3670040qvk.137.2023.07.24.09.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 09:59:43 -0700 (PDT)
Date: Mon, 24 Jul 2023 12:59:42 -0400
From: Brian Masney <bmasney@redhat.com>
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
	lkml <linux-kernel@vger.kernel.org>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	"open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: Feedback on Qualcomm's minidump (debug) solution for end user
 device crash
Message-ID: <ZL6t/sZTZBfvSYOm@brian-x1>
References: <0199db00-1b1d-0c63-58ff-03efae02cb21@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <0199db00-1b1d-0c63-58ff-03efae02cb21@quicinc.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_095948_498976_0DD88A9F 
X-CRM114-Status: GOOD (  14.94  )
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

+ linux-arm-kernel list

On Thu, Jul 20, 2023 at 08:32:24PM +0530, Mukesh Ojha wrote:
> Hi Samsung/MTK/Any other SOC vendors,
> 
> This is to bring to your notice that, we (Qualcomm) are working on
> upstreaming our minidump solution which is to address the problem of
> debugging on field device crashes where collecting entire ddr dump
> would not be feasible and collecting minimal data from the ddr would
> help in debug direction or even help in root causing issue.
> 
> We have recently posted v4 version here [1]
> 
> Based on comments[2], community is more worried about, if each SOC
> vendor come up with their own dumping method today or in future and
> whether it can have a common solution to a similar problem faced by
> other SOC vendor.
> 
> We wanted to take your feedback if you also encounter a similar problem
> or maintain something similar solution in downstream which can be
> upstreamed. This will help us in a way to have a common solution in
> upstream.
> 
> [1]
> https://lore.kernel.org/lkml/10dd2ead-758a-89f0-cda4-70ae927269eb@quicinc.com/
> 
> [2]
> https://lore.kernel.org/lkml/CAL_JsqLO9yey2-4FcWsaGxijiS6hGL0SH9VoMuiyei-u9=Cv=w@mail.gmail.com/

Adding the main ARM list to solicit feedback from other silicon
manufacturers.

The cover sheet on the v4 patch set is available at:
https://lore.kernel.org/lkml/1687955688-20809-1-git-send-email-quic_mojha@quicinc.com/

Brian


