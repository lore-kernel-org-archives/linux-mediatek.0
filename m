Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54532C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 20:09:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37D3D221E2
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 20:09:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ScZ1ItWp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oRlSSDXK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37D3D221E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JojluSV9USvgEJNAZAXJn40XGFhpFmfuUL3gzmSo1Q0=; b=ScZ1ItWp9qvGf6HUJ0QQX3J1m
	wPGDVUo6aDvR4luBRITQAZU2aCWlbj0jFb6YFFa/ytmuJD8he+ceXXyVsRIUPGY0LQkrTfo1hDlup
	dwfuaXUWKY7cCWEOZJbSTCm4eq70dIIJfdtPiLcJux5UMDOYT+qwDsiJQZXg0di+uQ2iZjZI5PoRy
	PK8tAEKH3FuJxch8oNAql7iXG/TB+cXO8uQqQDmvy99OPu/vCwcaFyo+zA8IxUZ7f0L8xXr0ECTiE
	o0Zq7y3ch/MF229QD8v7DOQowHJHsvxSluRjnP6Y97nbwQuXMkKRbHd4NumpDP5t3WEU2TTRpbra7
	o+rclX+qA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3mCy-00056o-Os; Thu, 06 Aug 2020 20:09:48 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3mCw-00055n-Bj
 for linux-mediatek@lists.infradead.org; Thu, 06 Aug 2020 20:09:47 +0000
Received: by mail-ot1-x342.google.com with SMTP id c4so11653675otf.12
 for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2020 13:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=baDhumlHPR4KZDRGWPG+BY/sJ0EvMqkXlvyotkwDgAY=;
 b=oRlSSDXKpr1tuboVg6DmbxsKw9ibJRM+lTlvt3g9XYBG6V4FB5yiSSRxRZSIfbTHCT
 Zqa8a9C97l16PvPM4kmKE4jUksPG2eMjnOMlK5WGwgYmDfJHqeKKoe9WTdh6Jl5Mh9gt
 pN8LMEaY3eAwOAKL2IMiNRijk1Trjy3VriS18vRk3LUhAcqDanmWafLEtfRDU1PYBMt5
 sK6yJepm7+139uyf95d1+BQgpqkGDsskaMnbOFLWLnV4XXIhZnyAJK6OgI0SmNwhSiLh
 Vg6/8PNotmLbZJjJEkM+lvIRlzLv3rYk1kQ+2BanfvU1/R8j4p+F3lCCzLg670bQdKDP
 uzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=baDhumlHPR4KZDRGWPG+BY/sJ0EvMqkXlvyotkwDgAY=;
 b=JA7u6RsyfLxa52NkJYv62OBMvFnMne7Aa7ugraC9zd2geyMGNmXUMnSHWKo63CSh7K
 Y5ogl/4D9tc6UXcg3PLT+D2i9lG2eBFKnDddWOO1eLYkprdasCqcT/hvUYZVg1I99sa9
 LqPY3tCchZ2qWo/ZNxiFW6CJzl1jBIketMn5pZg0ZOdP4pgVxeiFI74f0EFvad/1pMpO
 U74+Ps+i3q+8F8mop12LDg04SOg/ydwHJod18q1Ezc1sz0fD6KExViRkR12N8pixyn6/
 c2dABNUG48z7fnirlo6ZbBhy0l2qqxQFANz5qwaKbGACkZnT9gR/LfAr3OoRoml7Qb+z
 kn/w==
X-Gm-Message-State: AOAM531vBwbNnYOIMw043osBYDbPd7CKVQmxXxbqJgawb1+yf4//Beec
 dQtfuw3oDdI977NH1P7CWUbg6FSvmDdANbinURXvHg==
X-Google-Smtp-Source: ABdhPJyouhMEou4EoV57JwviEafrLG3PdiaOsgmtRljCsjehbL6Jk4wnfPp7i3y+0Gj/s8dM11i6GVD2c2aM62B2ER8=
X-Received: by 2002:a9d:6f8f:: with SMTP id h15mr2715675otq.221.1596744584103; 
 Thu, 06 Aug 2020 13:09:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-3-saravanak@google.com>
 <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
 <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
 <CALAqxLUz6GTT96nO9igiWVwyaRs_xbO+=mySLm4BKX6-Uh90ZA@mail.gmail.com>
 <5e6124390b9e3e7f4d6f6decbdb669ca@kernel.org>
 <CAGETcx89BRdSP6FKjDPU0zapt0ET9_PUr6bjZb9EA-jYn0maFw@mail.gmail.com>
 <4d79a3e9c8c24f8adb6f7ade97d5a9c6@kernel.org>
In-Reply-To: <4d79a3e9c8c24f8adb6f7ade97d5a9c6@kernel.org>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 6 Aug 2020 13:09:32 -0700
Message-ID: <CALAqxLUhit4Zz27Uce7gPGVRmkDJ_2UTC2fyk8NkOfgqR8diHQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
To: Marc Zyngier <maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_160946_688232_67A27E55 
X-CRM114-Status: GOOD (  11.28  )
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
Cc: CC Hwang <cc.hwang@mediatek.com>, Jason Cooper <jason@lakedaemon.net>,
 Saravana Kannan <saravanak@google.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Hanks Chen <hanks.chen@mediatek.com>, Loda Chou <loda.chou@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Android Kernel Team <kernel-team@android.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Nial Peters <uceenpe@ucl.ac.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 6, 2020 at 12:59 PM Marc Zyngier <maz@kernel.org> wrote:
> OK, thanks for confirming. It would have been good if these patches
> had seen a bit more testing.

Yes, again, my apologies for that!

> > I'm assuming you'll put up the patch yourself. Please let me know if
> > you need me to send one.
>
> I have queued this [1] in -next.
>
> It'd be good if someone (John?) could give a Tested-by.

Just validated. Tested-by: John Stultz <john.stultz@linaro.org>

Thanks so much for the quick fix!
-john

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
