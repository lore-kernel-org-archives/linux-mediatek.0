Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFD9C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 13:38:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD00D6109F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 13:38:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD00D6109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hsuFCKAij8EhH61nggmy61T1Ir7UL+D7hQekjEo9htg=; b=ptMmAa2bLj2fAiHYo4idHvajhL
	qiZfzizDX9rB+RG4He6b2HltfkFsu+L9iocriiWtGHE+Dyu/z+nXejpXSASIxo7v2N29YziPhQcFp
	pJgFX0ZK8ZcV0yr7muPsWP6uZz8UtYuwfUoQsqOZ/v5GnBU+hBZv8L06sekqNch6lV2aSPBbeyWP+
	kKnwfw0zQuNkVCdlTvBREC4uiHwwQTLeTs/9uErgYJYoZJXWllTHPZziH2fwYEiVZtXbi5gQm7MUw
	+jgYFsKm57eDGS41hfgGcnKgndDIioBgwzc+ygARvAkkR/3b8N4lGNqJ4aAdJjYkuYW3Wb0je7Cbb
	T9tndCjw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk5MJ-005Z2r-Hv; Fri, 21 May 2021 13:38:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk5MH-005Z1N-HO
 for linux-mediatek@desiato.infradead.org; Fri, 21 May 2021 13:38:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=QraQWaDbrIyFsDMVDfzA8DAF+rb0LcMH/Egy8Qs4g6M=; b=S8D/o6Yl29E6JDTeAURyLplEmS
 ahm7qXdS0t8qCOZ5ss704E+fJ2Lm3bh5yaIepuqfnVXERYFtnskvlqdLnZlooqk4KR+58JCRLtIB0
 7HVouqMs5iJq+ck+0U6HKOT1gpePxN/aBe6SOpeYanwKEZ4rZoiZOp6YLjlubCAE8JBMlXHrevFrz
 kjBf/cskxNztL2+GRIX/eNw0YstqCZm4eqw0h72CChRF99Re3ESgoXMqe8aiVNwOrzT9ycpMh1l9s
 jZZGBy1O703uGFbyAyI8p11NidnBdkqeSVw8jOBkLk2i1OtbZF2UvJB3kZxV9Dx7PzL82DCQ+6t55
 WUz2qT0A==;
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk5MF-00H9am-5d
 for linux-mediatek@lists.infradead.org; Fri, 21 May 2021 13:38:32 +0000
Received: by mail-il1-x136.google.com with SMTP id e10so16617082ilu.11
 for <linux-mediatek@lists.infradead.org>; Fri, 21 May 2021 06:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QraQWaDbrIyFsDMVDfzA8DAF+rb0LcMH/Egy8Qs4g6M=;
 b=R461x5DK6Oy+M09t3cWQkEm9qrL5KcZdvIqarLkvpajChuPAlkpVwHWArHhhag+kNN
 ZUbfsrYK7Xo22UI7ZiYZaBIwArR64x21Fic42DI3jbRhffIJB6XaXyDhNrFyv+2Qs4zm
 iN+3hDGEbZIQeXEgXuMmoikSuWstvPWPqHHKuoy/kWqnlNiLKV2i+/zd6hVP7BJYpRDO
 mGC7GcQ0zYXUp5zqpipVO4ojdGqa7D2LcsNFt3SpdYFOECkDUgX08qSsOdqTDNJlvgX2
 rj5EMMWMo678I40ElCFzUaPcLoMmQL+dkfUzWc3IxeAE6JUDaf+SgmXSBY7QQwAQ2c3j
 XSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QraQWaDbrIyFsDMVDfzA8DAF+rb0LcMH/Egy8Qs4g6M=;
 b=mKLGsuhpmjmRPNNX10EPWUcMbURpEzWZdgrnLV2s7b9XhmATnBFX7VpyUrCnCQpZi6
 lDOw/SDclJUx1TKYV8vzxnpUYKVHMwDy6M8BnR5FDFtqNQyxBiSNI63ITOLDYfAu3hRA
 R1Gwjft77vnNWwnsHpSZ77X9EtuNZcQ4eSUDpQbV4ERyGqGtvtsyB2hSqH3K7Cc8U3Ok
 AUzx44nFaDCjQJHyjQz6jW6cyM6GmqiowLe3K+lUsRf1lzX1PDrCkfOrwiGwkULaQCrR
 fAXHrVoWmB8mGpE6Yep3p4G/OTD7ofLqLyygQoKoDEGp6I1/wO9ejPYQSmBAoVAT/GgF
 crhA==
X-Gm-Message-State: AOAM532bQ89sg/RtHMffFyUXroRPlXkVh2z6SZqciRW1U1whIC2868UT
 sEyQgrPhrB+sHSKewjXXXX3cuEW/vo9fQGD2jsf57g==
X-Google-Smtp-Source: ABdhPJyIr36lrjSTCZAWI/wXVI6gkeLvcx9vdH9kY86wAPm6nJ+y4Bqp9zyM3RNpCdzm4Ydp/VZdmrTH0prPxSxav1g=
X-Received: by 2002:a05:6e02:92f:: with SMTP id
 o15mr13051528ilt.127.1621604309819; 
 Fri, 21 May 2021 06:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org>
 <20210519143011.1175546-13-acourbot@chromium.org>
In-Reply-To: <20210519143011.1175546-13-acourbot@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 21 May 2021 21:38:18 +0800
Message-ID: <CA+Px+wUBJ9xxf709Ze3npnUV-NOp1DT969GWQsGTg-WuVkF+nA@mail.gmail.com>
Subject: Re: [PATCH v5 12/14] media: mtk-vcodec: vdec: add media device if
 using stateless api
To: Alexandre Courbot <acourbot@chromium.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_063831_219563_FC012599 
X-CRM114-Status: UNSURE (   7.09  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, May 19, 2021 at 10:31 PM Alexandre Courbot
<acourbot@chromium.org> wrote:
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> [acourbot: refactor, cleanup and split]
> Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
