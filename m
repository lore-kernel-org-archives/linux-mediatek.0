Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423EFC6379F
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 07:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvhY83F61WHDFNcypOhegGvb6RMA0YY7Da4A3qqB72Y=; b=UiZ/xxg4/u1Xb6G1q2m7bn9KX0
	h165diYwRozudfaG4tJtFXWCfTS5PsdqhKb5+Ls7mP0cbkaFnhAsvWDAVqR7i/pbrC88b+Bd4+9IJ
	SE2IF+pFZPH2oUx6Hrorq86qHV5S3FM4Yd9JfkY4D5bu4hNLB5zCcedzwoEbDT7ZS5EeC7uqCMW8m
	Bdn5qh/hILBXQKqXl0x+n3jYWjTtom4YmG9/8WqU3a9bU+RuGhuRr3D+ptO612ZK5jkkVGjewi/6m
	2os1e2brGRQi8zuEUd8g5pYHsJ/j+T4rt0W3T29MTZ6sr4UQ0zoN27haJPhg9pL1anUFVGnYzAJS8
	XR5NZhzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUMrc-006rbK-OR; Tue, 21 Feb 2023 07:15:00 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUMra-006rZU-4R
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 07:14:59 +0000
Received: by mail-vs1-xe32.google.com with SMTP id y8so2558811vsn.2
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 23:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1676963696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gvhY83F61WHDFNcypOhegGvb6RMA0YY7Da4A3qqB72Y=;
        b=dmcDRsGtcsynWsrfzcvp/PqPo2Wnn+UPOHs07j7tuZUSYk7Msr5CwH9k/bnemAXBBm
         JtoMrQx3cFag7/Iyi27sQWwE75K+CPO5x6MTH+IfSKL92rCNyNZDZH56jw8B3xYSOyEd
         Vx7fMLUa3i0+vCro2pmdv0KONcbZukV8oPaGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676963696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gvhY83F61WHDFNcypOhegGvb6RMA0YY7Da4A3qqB72Y=;
        b=rwpsyTKrG3M35t3R6AqNDVxbw6gvlaLIDBFKMZ5+6n2M7oZlIzqsmhs9DnvzQ3gDE1
         0KFp1ZFXcbOyjZlMAoh8NeUAEvdfiDJ+p98Q4YLz0XgmqGINfCSxLLuUySN39DZdLh6c
         z4sfdwMUsZpuURasgpR8srBJ44dHC0odwsSO5dKEK0mfop5aAYPaBMQHK6c/PGoHdfFN
         Wn1C/M7VVaJ+0PlgZOeD+lbsWO9YPHOKwR2L8slR6watrzmxJ72CAbY/mDcvbGDjzByQ
         vNqWeLeZBzVN2bkfswYYaEOoemyGNh4AD1PuaBZtjILWcYU29RO50a6Tb7sQSeBmp0ri
         dMzg==
X-Gm-Message-State: AO0yUKUoase92B9Jab1i9HiiP42looVHu5+nkQMudVsBJOBuqShvt1yb
	xoTfQxjzEG/VSTYmjK7IK43hpyUM9s1b5LCR+YHionpjHEjb4od8
X-Google-Smtp-Source: AK7set+j7PBw2MtKXQJ4jra0QVDMXwi9RpdS1KginQaDqQ8gxBmjfx63aWBJqxrOAYui0WfuV2F/JWczDvidg7fETnQ=
X-Received: by 2002:a67:f6c1:0:b0:411:a14d:6bac with SMTP id
 v1-20020a67f6c1000000b00411a14d6bacmr908851vso.44.1676963696020; Mon, 20 Feb
 2023 23:14:56 -0800 (PST)
MIME-Version: 1.0
References: <20230216130021.64875-1-angelogioacchino.delregno@collabora.com> <20230216130021.64875-9-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230216130021.64875-9-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Feb 2023 15:14:45 +0800
Message-ID: <CAGXv+5ERqqMgLFcEC2fb88HaEf=9LDSdJAVAsW_=J_qfxc9rjw@mail.gmail.com>
Subject: Re: [PATCH v1 8/9] soc: mediatek: cmdq: Add inline functions for !CONFIG_MTK_CMDQ
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, jason-jh.lin@mediatek.com, chunkuang.hu@kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_231458_196669_BDD340D5 
X-CRM114-Status: UNSURE (   7.10  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 16, 2023 at 9:03 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for a cleanup of ifdef instances of IS_REACHABLE() for
> the CONFIG_MTK_CMDQ configuration option, add inline functions that
> will either return a failure or, for void functions, do nothing.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

