Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDBE9C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 18:52:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D53420B1F
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 18:52:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yBFdPUQ+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="QUGdMAQC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D53420B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zIMxZAQan2h+GcPveE03vtlEm9e32bB+f7w/4xxrAlE=; b=yBFdPUQ+Yei8E3pJ5wwkPS4q6
	ZpEHJ4CnBdWIjd2QQw+qCoQLwpJRX3VwL2DLYlo67I7K0e8eIh/BxKrOecW8GI5WCcjSmiPMpKMcn
	PIWvqHz3CO6FBn0iFOFi+uCj55t1zsvAwQFJIPgiL92DFm3m1m24heSslNsDrcS5XKAWbAhW6J4Vr
	Oxp8VCTo5wP88nqGmXrBP7c8NUY4VTgbEshDvZdLqdqZJylRPWBSHycGuarti90f8mfz6w29qlu9e
	dLrQuxbo8etbSFTRLYQ2aCB+dqfT9MPSM7O41CKBQOBy7jYMktGFu2ZJ/W1RWdc6ry5vB5mYIWoon
	s5oBinZkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8TC5-000665-MB; Wed, 19 Aug 2020 18:52:17 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8TC1-00064w-W0
 for linux-mediatek@lists.infradead.org; Wed, 19 Aug 2020 18:52:14 +0000
Received: by mail-pl1-x643.google.com with SMTP id k13so11244764plk.13
 for <linux-mediatek@lists.infradead.org>; Wed, 19 Aug 2020 11:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CyYpI1eTNYdHfR0G2Gw+QKYgydAMFbim5qzbpHh6tkk=;
 b=QUGdMAQCv2M76+xBa+GQ4k3SZJrORZYHLCCkIjlZQ6h6BuPiFrBf8ntRTn7pJ7ESLX
 NYfyLE4eWMQQbrkEaO4gdrdZGhVtdFz7Qs/ib6J7P26b6WRVMcUEIfHOy43P5MugHuuX
 P+PkU2F1tqZii+G/WNiLWnEjqIDyNG4b5SBNMI1xVb80e0mHHRsHwaFdzg0yhWEx8knh
 32dUu1hlBEd8aoRPrLgWyax7nhv+hIwUUMjngchHb4DqvAwr4qVedog+2wzGltISDkgS
 44Dunb7gYpI8+bkYDHZXw3XlxbdfaJ53i6lFlezKGwAXnTA5LPs0gTrfkaOBsg4+g3su
 aLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CyYpI1eTNYdHfR0G2Gw+QKYgydAMFbim5qzbpHh6tkk=;
 b=r2/SLL1IF+uHE5oLD/UK3BxlJs6pgTFBOc/b6p6WmLgVtRLF1eh616VOjQ2xa3MwlL
 YzCjL0wbnKgaKVTBpSuR4wVGix/lykzyGRCJUn+G2iaVCTRQLab3ffX9h38WUycqIAK+
 Y4GZkHFziiW0g0qUx1d0IK1mJ7DQvAjhjNJAIHRWug1cfQoO7A8avjgvI1jimF19JkVn
 NkK4R3jKATcf9rYZDG+ShMcfBJfC6XKzOuPx+1IZRku8p96TejG59c/K8FpR2YA9UjtB
 HsamG03In4zmFlpzTyKwkdKxD/7Rn5f2m0NDmanFEMwfq5A8RYcLKVcEYYJJjXl6ybae
 lPkg==
X-Gm-Message-State: AOAM530S2nyAu6C50bRdTLZeE3UO+MNrH8lQQsb04cqCmALfwcwPUkvw
 m/NOPCP2apM0xyqVB5cmdvDCXCFS9MCsjowPRvanbQ==
X-Google-Smtp-Source: ABdhPJxKaH/KH85qKcrDnnxPhxKHsYCEW4OLxljbbjCOZt7Mzu97zAqCPy4Kf8PFve9OS/InPqY8ntjOIBiOaMnYRvQ=
X-Received: by 2002:a17:902:8543:: with SMTP id
 d3mr19798331plo.244.1597863130537; 
 Wed, 19 Aug 2020 11:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200819161907.1155110-1-enric.balletbo@collabora.com>
 <C9E59107-CE83-4554-9447-5DE5BEE09A3B@fw-web.de>
In-Reply-To: <C9E59107-CE83-4554-9447-5DE5BEE09A3B@fw-web.de>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 19 Aug 2020 11:51:34 -0700
Message-ID: <CAGETcx9_A-E5b-JxT2G142mGxqoo8xqFNEgT+CNWt=oOv0Z5+w@mail.gmail.com>
Subject: Re: [PATCH] Revert "irqchip/mtk-sysirq: Convert to a platform driver"
To: Frank Wunderlich <wichtig@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_145214_064126_0E41CBEF 
X-CRM114-Status: GOOD (  10.04  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>,
 Hanks Chen <hanks.chen@mediatek.com>, LKML <linux-kernel@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Frank Wunderlich <linux@fw-web.de>, Collabora Kernel ML <kernel@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Aug 19, 2020 at 9:52 AM Frank Wunderlich <wichtig@fw-web.de> wrote:
>
> hi,
>
> does the fix you've linked to my revert [1] not work in your case?
>
> [1] https://patchwork.kernel.org/patch/11718481/

Thanks for pointing it out Frank. Also, might want to avoid top
posting in the future.

Enric, Can you please try that other fix and see if that solves your issue?

Thanks,
Saravana

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
