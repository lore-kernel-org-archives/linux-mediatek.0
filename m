Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A7DC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 13:38:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 677DA6109F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 13:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 677DA6109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hsuFCKAij8EhH61nggmy61T1Ir7UL+D7hQekjEo9htg=; b=kdWsItc9D98YgPizphaTLqEglG
	JJQ+Q1Yt6Vcu5RSjMn3GfWrlQYGCO6Uy9SbP/HhJCIHK/OOHwr6cFnpkZE/yGVKfQ16f0PatXFQSH
	RObF5o6KELbLXSJgXmj34kI38+inQXhgzKw7bYHr+MS97DUQ4in8Q8ya8Z6gAbP3hjNEsLHx/PewY
	QqXTmVuWuZfXPYV148xknza7nayuKzedF2dHOAbjrRa54LC4mrtQxh0g3bJhKP+W5E/K5Kfy7AJ4E
	Xu4ZdxUZPKFNgVBaOAuMTaL5RDh93XX7Y/9fXe8i3vOb+sN1dIgVhLTo0zAdg5f+nsKLOLfKZMpmi
	xzBwM65Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk5MR-005Z62-EH; Fri, 21 May 2021 13:38:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk5MM-005Z4A-9q
 for linux-mediatek@desiato.infradead.org; Fri, 21 May 2021 13:38:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=QraQWaDbrIyFsDMVDfzA8DAF+rb0LcMH/Egy8Qs4g6M=; b=T6TlWxu/wYo3EQjYKNGXFrPyw0
 u/R8eNqPcbU8RDaMTL4bJiU4PeVQGXqFMdv+WTgXaiLo6n6IEiPdazooR8RZ7+DzT9dOA1bX+l0vt
 KfaVSvgKY6l6Md+6I6+6Cps2+uApmLWizPXqll38R/iMh7xmJzp3vvE6P+CAmaW8AfEu+PIYhpxhZ
 PGVF+1uJhSt2XLf55clHw0/hDCZhZvUd4jHwdHrYBWQ1k1RbLZcbfbXQajVE1sBkXp6WyPU1/jyS9
 kEYU6bdgcoWfOdsmNNjhgWTJ6vRscYdblRjtauu6iyi/AD1e9FezP15xotCnCj0hCMQtNsQQKgSLB
 pCvit7GA==;
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk5MK-00H9bh-0L
 for linux-mediatek@lists.infradead.org; Fri, 21 May 2021 13:38:37 +0000
Received: by mail-il1-x129.google.com with SMTP id l15so6599044ilh.1
 for <linux-mediatek@lists.infradead.org>; Fri, 21 May 2021 06:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QraQWaDbrIyFsDMVDfzA8DAF+rb0LcMH/Egy8Qs4g6M=;
 b=NDr61RfLLnF+gQBIiMtqzi7vpbFZjTAEQ/3snixCdg1v/fEnAITaDrsuFLzVjPCdhd
 Lmzrnxe9Halzpk0OlPiHVvJthHoZhrECa3Q3BLCOpC1LuNqyOKRaAeJTL5rtPeL1i1ej
 CzBGsLziVQgkGuT5f2q8JI8zWMkMzjTLPtZrBcLt07IWpu03LiJhUz7pfM2vyco362dF
 bJESuQwJc8CPrw9DK3P/gOs6s/WU07rNftjUU/WWGpMijP1jIvGdkBnMZts8k6SW/elN
 sX/ZnvCC6SW9U1rnkRAmmHVeBGL0bT/0u+T/HmLlS3VCwov+oxESpTAJbi18cUHNdlLe
 1tNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QraQWaDbrIyFsDMVDfzA8DAF+rb0LcMH/Egy8Qs4g6M=;
 b=WbalbYS9wrbKCX0pdcp9toCX84OdrIqCTGwtIrV46I6luLXU4rVDLbbb7apf3RykQd
 Zood/UCP/mt48pLoRr3kK10B0xh+Op5LKfJqbLeYd7C5/UGTIp03qtF0cVBfhAqvpqnO
 V0xSsjIVvv6sJdT6Ro0nHEi/77vOjecMB7RWD0Ckmo4I8y6sUp5FDczKXFsBljWO3X0G
 skiIEM947muEgOYc2y4JtF5z8OuxTpkZ5du7mfgWvrICOfg7L8ogAbvBAnd6AFme8Uy8
 zeAAc8455hs/ml5ESL4wiAZ0Jd+6YMCCR4mLfWdialta24dD+2GJj95wwbxzDcIrF9WH
 W+Zw==
X-Gm-Message-State: AOAM532qb3HzWB8Ap/bMY15NvJGdZFWK+ss5vmfv/lWSwT+uJDztXb+D
 wa9Hezm18xauaJLsk26tEc7b/pGNBBZwj1xuqb5L1Q==
X-Google-Smtp-Source: ABdhPJy/pKbvVZY2/ULXOE3xI/TcxMMBcvpBSC+29wPkgzlKokgXyeEvamPfYmJfaNpUd1aCuAwQoKJVrbi12TOABqk=
X-Received: by 2002:a92:c74b:: with SMTP id y11mr13202440ilp.302.1621604314599; 
 Fri, 21 May 2021 06:38:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org>
 <20210519143011.1175546-15-acourbot@chromium.org>
In-Reply-To: <20210519143011.1175546-15-acourbot@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 21 May 2021 21:38:23 +0800
Message-ID: <CA+Px+wWAZE2ea7pfMEF3Xg_w+H4n8QAK6qcOyA2TAOkYd5_GBg@mail.gmail.com>
Subject: Re: [PATCH v5 14/14] media: mtk-vcodec: enable MT8183 decoder
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
X-CRM114-CacheID: sfid-20210521_063836_054634_67F9930E 
X-CRM114-Status: UNSURE (   7.18  )
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
