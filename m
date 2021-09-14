Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8569C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 04:00:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B062610A2
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 04:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B062610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fnquwcYvyCkzfCIVoa4+7Vnc6yYA774H62YnWkRhPxM=; b=08s5F5AyldS8SV
	0zDn8kKZ9OgV2Z4y+QNZ+nyPL7+0EcYzmFi6C23s6f0r3uR+KvEqgxxD/RBPl15cq4rACPALoHWUv
	0WnDeoG5pPAaR1l5xIPbPANZb4fZdHl66NCG0YOAtHZ7esSQcYMYuQ/GVE4oZOdMw+m6fInoeOmtQ
	H4cL6Qja+Bo1tgPFdMKrps17OW+/vocnfriqByPWicZ0SaixoFxaFBaUVHO+Ly2X9N5h2SigG2OV8
	HYy+lmdDQVgtB6fQWvgSxqctvZ7gOl8o1ieZ97kBZM0S04FLpkEcLc10Db0gnOwwRmT+JQNq2PYnI
	/PunGjN531TJ4GYQWI8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPzck-0047qk-KX; Tue, 14 Sep 2021 04:00:46 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPzcX-0047kH-2D
 for linux-mediatek@lists.infradead.org; Tue, 14 Sep 2021 04:00:34 +0000
Received: by mail-lj1-x235.google.com with SMTP id p15so21207540ljn.3
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Sep 2021 21:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mOD/GRIKs+hdPdAcXN0XW4GSnCbiUQLX2JXAm1ArSmE=;
 b=niRWh4tvD3GcDqSTvNOxaxHwf05e+17mw+nVqh3ev2PMzFLop2wDcz1nYhqXjbvI17
 hiN7nMUA1/nY+yL5plpLJ3XjDo8HUd3Rfrjd0z6RCIyD5VwiXRLoeo0r6D3U1b+SCfp3
 AI/cYnJYcWtT831QQfVa5JwSQGx+qBsJ33AMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mOD/GRIKs+hdPdAcXN0XW4GSnCbiUQLX2JXAm1ArSmE=;
 b=6tQGQhgsatXCWA7WqNlmle1V/6OWpJgVCb2/FHgcbvQH+Oz09fa9upjdI36tUBy7CQ
 u5AEbg8m+Sgwzx3HVh3kTY9XvNHIT+vRDSJyZRk6FAT6Yze4lDcA3nhE6oXbgs4zmApp
 d+vOrH6C7JkJKtZbH1A4dPosPpKyJG7ss5kwISnOtJY9Gx497NrOaPXjeaCtAeZUrH5P
 BwZNaLdpgI3KEXwwuFK4vdU6arTsv0hq6l9ba4TFlA+F3befNhTpmkBZWm7ZmEwLiJMo
 XNexJX+nra+I9LVu/Ccl6K6CAlPtJy3OmD3P3qTsrVmTxYaVrKvd1xN/6PNuCkfcl36O
 Q3bQ==
X-Gm-Message-State: AOAM5304YxIg15XSRVPrUVWQaqGidyRgaRM1oDkPSUAxL6DlW3kCTIHx
 W4q/4T6TZTCPTBknsK6yeNwcBntS1ZwAxf7IpqCqDA==
X-Google-Smtp-Source: ABdhPJy+jSeXIvVMpE3aPsW4efziT8vLzw757JkH3TL5SFxgsB9djnQwYrYG3UxmJzgmTf/m5e2RGTHorMfuES6fSuU=
X-Received: by 2002:a2e:4951:: with SMTP id b17mr13688387ljd.414.1631592023693; 
 Mon, 13 Sep 2021 21:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
 <20210914021633.26377-18-chun-jie.chen@mediatek.com>
In-Reply-To: <20210914021633.26377-18-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 14 Sep 2021 12:00:12 +0800
Message-ID: <CAGXv+5GE4RaDxJ4oVDgmebG0GbBCiWGWD=-UikOHupn0Ojew=g@mail.gmail.com>
Subject: Re: [v3 17/24] clk: mediatek: Add MT8195 vdosys0 clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk <linux-clk@vger.kernel.org>, 
 Devicetree List <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_210033_135659_E2FF5F48 
X-CRM114-Status: UNSURE (   8.54  )
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

On Tue, Sep 14, 2021 at 10:18 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 vdosys0 clock controller which provides clock gate
> control in video system. This is integrated with mtk-mmsys
> driver which will populate device by platform_device_register_data
> to start vdosys clock driver.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
