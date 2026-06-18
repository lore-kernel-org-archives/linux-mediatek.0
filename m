Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D86BCD98F3
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2026 11:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ih1hA9pkwP8L/MCNP4uRdj5lWZxa52mA9WZkZEjpN1I=; b=PdHuuMgujsFAC5lloUjCx8tLNA
	5ZNQnqrRUAPsbAvBZzBkwqv4jnfPWI7kbw+lEuCD9gX+m00+hvDG21rRPyT1VoHloTBwTAr6RCeal
	N726Uy4nnezpxrDrT1MtKa+0RAxR3Rh9OC+Iq1bFN7iOimDWU9m31TAEd7RRfE5dWXMKT+6IWoLnI
	R2rTBiALdBObSS+WtemzZfnmehyUlyxZnuJZ0kkmhlE1AUhjHQoegrwdDkF2k+v7IBrrRcVOAA28D
	O0rXodaMySkstYydmp6z/F1GEqIUyphOxANxa8lE82GMrWGVHGnII+XCTk/VAnHqt614TdREFtzfZ
	kjrt3pmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAX0-000000018ge-14N6;
	Thu, 18 Jun 2026 11:03:34 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAWx-000000018ff-3T49
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jun 2026 11:03:32 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2c6b3f71648so10513575ad.2
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jun 2026 04:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780610; x=1782385410; darn=lists.infradead.org;
        h=references:in-reply-to:mime-version:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ih1hA9pkwP8L/MCNP4uRdj5lWZxa52mA9WZkZEjpN1I=;
        b=I8uDJ7BQwFbvM/UQx2IoOdeUlmdXG2XKKuMW4VUsCoLeyHOzjOzzwmGPdv48q2KtGW
         7T1aO9VPduQv1bp3VDiQDmAdt4FVvFZG+YDJgnYBrWDgA0hEWzdpDGFcMPEoTCmXyZKI
         XJ3A7GSepuLxtfFlrB8y+zhPl7NFn2iRYVv+vOlr69a1SKwyAgBWASeKrM4ZjuO3qiZl
         0APj1UnDwZQol3/pDFcki2n4YchNArDMPkdbNAljv+y+ffIMEjt0QMZkejoZBf5brJDp
         6kAv9/7kCRB+srBvS/Mdds1hU88r4Kwpo2o8UeGIHUX0TM5CADKgvXdbAsuVYJGDmTmC
         HpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780610; x=1782385410;
        h=references:in-reply-to:mime-version:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ih1hA9pkwP8L/MCNP4uRdj5lWZxa52mA9WZkZEjpN1I=;
        b=C6RMlJXJ6rQJ+Cg+fwcHqzs/xMEVw6oFpoxg+dc4e8OLAK3MVdzAMw9gp6reoNXujG
         zx6PuUAhxDvoqq7KHE8AWNsFdSSkzoOJ8qw0EoMIdCvylbanDZbwcfaqJ+f0Mqf+2pli
         iaLoSOjZ0FTGOVMEckkdW6S5eTqxlycvYBqJeKgdq8osy2A4YIdHnJlcIByM6TjJWgLA
         uiijvh0Mm+Pfq/G/Gtw7uJqOqz9QRtlnXXm35xNVlI4ORLSXvRNWeqWnaYnjkFFVCYyW
         tiUB1UIpt952wzboNrOZuM8YK/2L+9Mvc77HKnqVDyJNDweWp08vSsKWtPTMtwJUlbJ9
         6OUQ==
X-Forwarded-Encrypted: i=1; AFNElJ+6NmtqcP1+8Rkfa8LkxODUwmWa3pzqKoqPxVJoMw2cApXD6guZJEHQwQoy1G4rhgppJsyPLdAKfAvYv4IeDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf2IZLIHvVI8/NLsLd+0U8BFz2T0kI86IBdb9VarWzS+Ip8SSw
	WbNzPQTg12sz5bbJCaS5+kM4FUH5UFPHbqct/dsvJZZnO1xIqs1lRYku
X-Gm-Gg: AfdE7cmXaR3xaCxC/Q4MQ8XU0llr/7G9dHjZB/R3v88N+X1o8RI8mduV2SYXBF3Xfv5
	DT2BuH7US2JvqQfpOo2A1uuj+wGfQcz3Z+qAn+lNnm43JpHnpsN5QafUnlp+YdV8Ba0Zss+z5ss
	qAu4xgycv/fNP15A8MZpLYtSULN78KwfNVP1TwXP7qhu6BbEBhqag1QbS7cerzKksUT65aoUfkA
	8uk7Y+RGfD9shaZS8SgmYfWqwpH0wV35UblfKW4RqfTHt41I1s6sSEvp+T3GroXByimCL15HKX2
	8CpEkGPD8cgVZm+iyDkZhmleSC5e9KNTDYL/l5FL/v5wy2eDjK69KUPhUYELS0TJRUD12ROHilL
	nxF3Z4RexUvVU38Im1M33cr7NxqG+UQraxoQIlJhCxBddlqKM4Q3MpVG3zzyUfF1rE3bjyC0KXd
	4+cBrNTw==
X-Received: by 2002:a17:903:2a8b:b0:2c0:c940:dc32 with SMTP id d9443c01a7336-2c6bc0cc732mr87305065ad.16.1781780610103;
        Thu, 18 Jun 2026 04:03:30 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432c8c1f9sm199005805ad.59.2026.06.18.04.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:03:29 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org, horms@kernel.org, pabeni@redhat.com, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v3] net: airoha: Fix skb->priority underflow in airoha_dev_select_queue()
Date: Thu, 18 Jun 2026 22:10:00 +0800
Message-ID: <178178060540.2320032.8413754929321784354@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
In-Reply-To: <20260617161951.52abe413@kernel.org>
References: <178161373805.2167512.2544164327472822616@gmail.com> <20260617161951.52abe413@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_040331_865719_C184BC57 
X-CRM114-Status: UNSURE (   9.46  )
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

On Wed, Jun 18, 2026 at 08:19:51AM +0200, Jakub Kicinski wrote:
> Hi Lorenzo, is there a reason we're subtracting 1 here in the first
> place? Could be just me, but may be worth adding a comment here.
>
> Please respin with some sort of an explanation..

Hi Jakub,

The (priority - 1) mapping predates my involvement — I only addressed
the underflow bug when skb->priority is 0, where the unsigned
subtraction wraps and routes best-effort packets to the highest-priority
queue.

Lorenzo, could you clarify the intended priority-to-queue mapping so
I can add a proper comment in the respin?

Regards,
Wayen


