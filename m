Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A9DC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 05:38:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E275C60EBD
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 05:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E275C60EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hb9f/b13JpPXMHSTwB1zEpCBJxZ6vxg/4AV3S/YnV6g=; b=dTrKyKFWqcyQYt
	kfecUVrEof2B8ZuZKypYBJn6ehqtyzbap5/VJrFPQNbAk31/oRK6UD7U5iYfIqfSxL5aqYSno8Zz1
	DqLifJwKs1tQ/8vPdtZ9GG635RfFXojXzLBZ//BnHH2GwJRxGyjSfGvgsrwkHTRjHZpFM2diDnJzV
	b0DlM/BIM8nBUkNkAspbXcIFiYeoQrZgwnMkXJf6rpq9DsM86KW9pTfzlq7QAnJ9WfKmw6WZYQtV/
	TW50375P9wEtK79+t7uhNYwCVJPlDP4MYWHo1ELj9Vq0Ppejd0CJ4cQJ29t9cuPerLyPZgvCoxy8e
	wf6tsxSGdLO98xaiqQDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAn7w-001BoZ-Vv; Tue, 03 Aug 2021 05:38:09 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAn7u-001Bmz-FF
 for linux-mediatek@lists.infradead.org; Tue, 03 Aug 2021 05:38:07 +0000
Received: by mail-io1-xd35.google.com with SMTP id y9so23023486iox.2
 for <linux-mediatek@lists.infradead.org>; Mon, 02 Aug 2021 22:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vi76Iy2+G7lRArH6vuam1Hfh2GEzigTGHE+mXu3eEQw=;
 b=qLj1y6fObSImVY0F0di8u/IF17wANqqqgvULYkhwRpKAGIdln28rEco4Riz8tMS4z+
 3ZfBL+GTgm0I3uYsrPqR38H1ZePcnoxJJA5jHljoEUgk57jKKhKJvmj1uXlK8Fcrcnfw
 IYoUcNNbQStu/smuDcK/AU7hIRpe5mCbAHIJtLG4wBYq1OiM5cIO1KCjwMHyu3O6SzwR
 VSrTFDVzKDqdZwOqIY+qk3GT8nxZWCAXeKQiVxkNrWwQKgihwE1nYU1//j0WTbUzxCiw
 GlEZZTBXyEK8nzark4WGWGiA/azDDniWdirEvCdMJ9NtpU6nygtVUuN0+rQgaX56lt0I
 pD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vi76Iy2+G7lRArH6vuam1Hfh2GEzigTGHE+mXu3eEQw=;
 b=Z5GMKA7ffNVgkzvoneDYfGhZoce6UXayag6nXTs8XRunQKkoJ1cAxUMfOahG2JEu53
 WWvCg9Yf/Gdvyq8vpny/RJnaWTquSeuasrOf3cPJuXc7gOs8p50uDBP/VwHXRYbxCKeT
 bUbb632KKFuxojf0b6droSM9/YxBIRxAuQRfjiUx8KkqqwNrVDL8l1kPw/Uoo5pV4ZwG
 F+zxD/5a0X63btiZC8Uw8kLQfVa/kzoJJdRrhi01grct2yh1//Zue7WGmt6L/a775mSI
 rH18m/j0Ri+F+u4YE+Nzo7BjbQRBG8+jXlWXG1ZbAxpqO7fKnu3BegHUxWtNEYxkS1mw
 0JXQ==
X-Gm-Message-State: AOAM532uxtGv2NhO8SoJ8aQ9YF2zL43CitdZrh8gIa+0yWTCsWGo7SD7
 dlHxXPnkClYYP/GZVqjXbRJ9S3RImo2gsjJct0mpCA==
X-Google-Smtp-Source: ABdhPJw/2YigJyn4JYO2+qd6bLRkOERLsf4W8mUBRLblDDC0N6ey6KPmqUc7erPS6iYqy2aN3qVsIE+0gB6rMCfF710=
X-Received: by 2002:a02:ba87:: with SMTP id g7mr11453418jao.110.1627969081709; 
 Mon, 02 Aug 2021 22:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210726122901.12195-1-Christine.Zhu@mediatek.com>
 <20210726122901.12195-2-Christine.Zhu@mediatek.com>
In-Reply-To: <20210726122901.12195-2-Christine.Zhu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 3 Aug 2021 13:37:50 +0800
Message-ID: <CA+Px+wX+gy4hV3BsTU81ThS=FUe0HidUV-iZZvQ3qm4WxKXGxQ@mail.gmail.com>
Subject: Re: [v7,1/3] dt-bindings: mediatek: mt8195: update mtk-wdt document
To: Christine Zhu <christine.zhu@mediatek.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org, 
 matthias.bgg@gmail.com, srv_heupstream@mediatek.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, seiya.wang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_223806_572899_BB053271 
X-CRM114-Status: UNSURE (   8.63  )
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

On Mon, Jul 26, 2021 at 8:30 PM Christine Zhu
<Christine.Zhu@mediatek.com> wrote:
> @@ -13,6 +13,7 @@ Required properties:
>         "mediatek,mt8183-wdt": for MT8183
>         "mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
>         "mediatek,mt8192-wdt": for MT8192
> +       "mediatek,mt8195-wdt": for MT8195
Just realized the patch has been applied in commit b326f2c85f3d
("dt-bindings: watchdog: Add compatible for Mediatek MT8195").  Could
you rebase the series to the latest tree and resend?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
