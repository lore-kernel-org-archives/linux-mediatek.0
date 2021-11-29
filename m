Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40444C43217
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Nov 2021 18:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Wyr+Ql8syk8m5fSSRREjxMyRH+FIaaR60Z3POc0fCI=; b=Oj7IwymllIYxdL
	vLVkTpeFK9FCwOa6TXkKjDoLe+SdotSi3WSMag3QNjzNP9kqAfGbXODtW3RvvCXDKaFvouDC0ADjD
	Vt35AaEhaHO83c5zDYPgQeTeG/13wyfbn8Aqv47DFuAlNMdTNcE0jdkXG4WnoDa07jbFH8yudKGJU
	Ct9D9Hs5kmgP6vB5a8uT3+qrWF3LdlEBaUikQVFg3aJkEsJGuY86/3t65uNA3CpmHOxZkygFX3P7h
	SscikYXuZaBs+bkJ0e9KL6rXGJnZwb+JaBPZUD8Gn7eEodhVa/T284uyzeFRIYqWrNolwgMMcFnyG
	sK0K3Sxd8kEMu9Rvz2CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrl1u-001hic-9H; Mon, 29 Nov 2021 18:05:30 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrl1h-001heC-1b
 for linux-mediatek@lists.infradead.org; Mon, 29 Nov 2021 18:05:18 +0000
Received: by mail-lj1-x22b.google.com with SMTP id t11so36071260ljh.6
 for <linux-mediatek@lists.infradead.org>; Mon, 29 Nov 2021 10:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IDi3zvjd6u7ZBVvXAka/LTSyAvUkqeh+L5SnX6c8Zdk=;
 b=ELtQ57DjVTWJPnvASv4jZtvg9xzVjpRXdLK6WadVUiqQO2Tejx2Y4rP/jZvsvwdaGM
 wVK5qYNcJTRTVvihhUy6a3XfzO7ShXe3HSKg9CJ9S9TdxAt3X4+ddQNsKXsRbhOEV3Nn
 NeS7l4DPoqAaH0j+Gm2rrnRobzgyBp+zZRI4nhmfoSItyMTQPe6HJsrb3a8uXIO7pAUp
 d0pHSCno/fnC3Fp0q+W51eSWigYy/I5qIJhRZa/O1KEhI708OF8jeLET61Dg8b9kw0VH
 st1/mw7gEQ1NVGLv+ANo/xqXiZgR94N5ykkWzVgrrh3SWq2UdJQ1DTZyuwBI86rq3HIq
 HE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IDi3zvjd6u7ZBVvXAka/LTSyAvUkqeh+L5SnX6c8Zdk=;
 b=Xxyir1Uu5ZaTQ/cAR8whAyUo/lRZ7CTOXEKyO3WUaZF3ChJJL6K/KhnO4kqbQW6DNn
 /DP9vT102p6MV8c6bAQgv35wf2wxEf61ROu4RvW0Yfvvnwb0SPydmh5Z6eghBoahrJx5
 i6b45luhkHTifXWe/2eHj5lS3vKr7a8tNZDxYMlRYcJcTPFnpF5Xl2S1ce6/Jew/Z1AR
 ObLvNHyOXh/l79Oui1PYakK6T4p63ihwt7XbHk7zkxw4lEjcpLKCxMe7Ezc353GEfUKs
 Jbq/aoOaGn5czr8H9O1/D1nfKWP4m5jBtfnTyox9h87bYrXZg24B4jmzU+h+na0dMer5
 QhvQ==
X-Gm-Message-State: AOAM531a8ldBeWtI4ZhFsg3MzYUh7iILqm4pNL5kr6BDr07o51JQAv9p
 SXg/FE3Imall74WfQs/7SJsMcjbw4gtqDlHMGSHbjw==
X-Google-Smtp-Source: ABdhPJz00rJJqhFv+eY/G4mQJbhWwtM/vfpfxJXb8qlKInsjRYgNcLli9eLdqgC5XVztKYKpkdzK0NNalzo7Gw9l8CQ=
X-Received: by 2002:a2e:95d3:: with SMTP id y19mr50881703ljh.175.1638209112922; 
 Mon, 29 Nov 2021 10:05:12 -0800 (PST)
MIME-Version: 1.0
References: <YaB/JHP/pMbgRJ1O@kroah.com>
 <20211126074904.88388-1-guangming.cao@mediatek.com>
In-Reply-To: <20211126074904.88388-1-guangming.cao@mediatek.com>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 29 Nov 2021 10:05:00 -0800
Message-ID: <CALAqxLVF1BPznzwjem2BcsDDoo5gMoBqjKEceZDLJan4zCtk3w@mail.gmail.com>
Subject: Re: [PATCH v4] dma-buf: system_heap: Use 'for_each_sgtable_sg' in
 pages free flow
To: guangming.cao@mediatek.com
Cc: greg@kroah.com, Brian.Starkey@arm.com, benjamin.gaignard@linaro.org, 
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org, labbott@redhat.com, 
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, lmark@codeaurora.org, 
 matthias.bgg@gmail.com, robin.murphy@arm.com, stable@vger.kernel.org, 
 sumit.semwal@linaro.org, wsd_upstream@mediatek.com, 
 kuan-ying.lee@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_100517_098982_5C6DE374 
X-CRM114-Status: GOOD (  11.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Nov 25, 2021 at 11:48 PM <guangming.cao@mediatek.com> wrote:
>
> From: Guangming <Guangming.Cao@mediatek.com>
>
> For previous version, it uses 'sg_table.nent's to traverse sg_table in pages
> free flow.
> However, 'sg_table.nents' is reassigned in 'dma_map_sg', it means the number of
> created entries in the DMA adderess space.
> So, use 'sg_table.nents' in pages free flow will case some pages can't be freed.
>
> Here we should use sg_table.orig_nents to free pages memory, but use the
> sgtable helper 'for each_sgtable_sg'(, instead of the previous rather common
> helper 'for_each_sg' which maybe cause memory leak) is much better.
>
> Fixes: d963ab0f15fb0 ("dma-buf: system_heap: Allocate higher order pages if available")
> Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> Cc: <stable@vger.kernel.org> # 5.11.*

Thanks so much for catching this and sending in all the revisions!

Reviewed-by: John Stultz <john.stultz@linaro.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
